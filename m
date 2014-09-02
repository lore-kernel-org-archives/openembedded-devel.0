Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5098670281
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Sep 2014 08:45:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s828jfAq007104
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 2 Sep 2014 01:45:42 -0700 (PDT)
Received: from [128.224.162.181] (128.224.162.181) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 2 Sep 2014 01:45:40 -0700
Message-ID: <540583B3.7000105@windriver.com>
Date: Tue, 2 Sep 2014 16:45:39 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <cover.1409584344.git.liezhi.yang@windriver.com>	<2016151778c10b65ff66b9b885b647bed934d640.1409584344.git.liezhi.yang@windriver.com>
	<20140902083121.GC21392@axis.com>
In-Reply-To: <20140902083121.GC21392@axis.com>
Subject: Re: [PATCH 09/13] apache2: add perl to RDEPENDS_apache2
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
X-List-Received-Date: Tue, 02 Sep 2014 08:45:48 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



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

Yes, these are the only two AFAIK, I will create a apache2-scripts
which only includes /usr/bin/dbmmanage, and put apxs to -dev.

// Robert

>
> Regards,
>

