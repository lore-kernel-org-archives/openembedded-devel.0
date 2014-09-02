Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3A95B6AC85
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Sep 2014 12:54:53 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s82CskZg020571
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 2 Sep 2014 05:54:54 -0700 (PDT)
Received: from [128.224.162.181] (128.224.162.181) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 2 Sep 2014 05:54:49 -0700
Message-ID: <5405BE18.3080806@windriver.com>
Date: Tue, 2 Sep 2014 20:54:48 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <cover.1409584344.git.liezhi.yang@windriver.com>	<2016151778c10b65ff66b9b885b647bed934d640.1409584344.git.liezhi.yang@windriver.com>
	<20140902083121.GC21392@axis.com>
In-Reply-To: <20140902083121.GC21392@axis.com>
Subject: Re: [PATCH 09/13] apache2: split apache2-scripts subpkg
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 02 Sep 2014 12:54:56 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

I updated this commit in the original repo:

   git://git.openembedded.org/meta-openembedded-contrib rbt/rdeps

// Robert

And the patch is:
Subject: [PATCH] apache2: split apache2-scripts subpkg

Split apache2-scripts subpkg to put the perl script dbmmanage, so that
apache2 doesn't have to RDEPEND on perl.

Add another perl script apxs to apache2-dev pkg as Olof Johansson
suggested.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
  .../recipes-httpd/apache2/apache2_2.4.10.bb        |   10 ++++++++--
  1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.10.bb 
b/meta-webserver/recipes-httpd/apache2/apache2_2.4.10.bb
index 0356029..573cd6f 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.10.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.10.bb
@@ -112,7 +112,7 @@ INITSCRIPT_NAME = "apache2"
  INITSCRIPT_PARAMS = "defaults 91 20"
  LEAD_SONAME = "libapr-1.so.0"

-PACKAGES = "${PN}-doc ${PN}-dev ${PN}-dbg ${PN}"
+PACKAGES = "${PN}-scripts ${PN}-doc ${PN}-dev ${PN}-dbg ${PN}"

  CONFFILES_${PN} = "${sysconfdir}/${BPN}/httpd.conf \
                     ${sysconfdir}/${BPN}/magic \
@@ -129,11 +129,16 @@ FILES_${PN}-dev = "${datadir}/${BPN}/build \
                     ${libdir}/apr*.exp \
                     ${includedir}/${BPN} \
                     ${libdir}/*.la \
-                   ${libdir}/*.a"
+                   ${libdir}/*.a \
+                   ${bindir}/apxs \
+                "
+

  # manual to manual
  FILES_${PN}-doc += " ${datadir}/${BPN}/manual"

+FILES_${PN}-scripts += "${bindir}/dbmmanage"
+
  #
  # override this too - here is the default, less datadir
  #
@@ -150,3 +155,4 @@ FILES_${PN} += "${libdir}/lib*.so ${libdir}/pkgconfig/*"
  FILES_${PN}-dbg += "${libdir}/${BPN}/modules/.debug"

  RDEPENDS_${PN} += "openssl libgcc"
+RDEPENDS_${PN}-scripts += "perl ${PN}"
-- 
1.7.9.5


On 09/02/2014 04:31 PM, Olof Johansson wrote:
> On 14-09-01 17:18 +0200, Robert Yang wrote:
>> Perl:
>> apache2/usr/bin/dbmmanage:#!/usr/bin/perl
>> apache2/usr/bin/apxs:#!/usr/bin/perl -w
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   .../recipes-httpd/apache2/apache2_2.4.10.bb        |    2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.10.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.10.bb
>> index 0356029..5989a05 100644
>> --- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.10.bb
>> +++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.10.bb
>> @@ -149,4 +149,4 @@ FILES_${PN} += "${libdir}/lib*.so ${libdir}/pkgconfig/*"
>>
>>   FILES_${PN}-dbg += "${libdir}/${BPN}/modules/.debug"
>>
>> -RDEPENDS_${PN} += "openssl libgcc"
>> +RDEPENDS_${PN} += "openssl libgcc perl"
>
> This would probably be nice to separate to a -scripts package if
> those two scripts are the only reason they would rdepend on perl.
> I think apxs could be included in the -dev package.
>
> Regards,
>

