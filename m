Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A59D470A0B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Sep 2014 03:03:26 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s8J33PvF000594
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Sep 2014 20:03:25 -0700 (PDT)
Received: from [128.224.162.181] (128.224.162.181) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 18 Sep 2014 20:03:25 -0700
Message-ID: <541B9CFB.4060400@windriver.com>
Date: Fri, 19 Sep 2014 11:03:23 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <cover.1409584344.git.liezhi.yang@windriver.com>	<1ab2a6a84a7ad1e930aadb138a807a58ee65d065.1409584344.git.liezhi.yang@windriver.com>
	<541A8CDD.6000303@gmail.com>
In-Reply-To: <541A8CDD.6000303@gmail.com>
Subject: Re: [PATCH 03/13] arptables: add bash to RDEPENDS_arptables
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
X-List-Received-Date: Fri, 19 Sep 2014 03:03:28 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit


On 09/18/2014 03:42 PM, Khem Raj wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
>
>
> On 9/1/14 8:18 AM, Robert Yang wrote:
>> Bashism:
>> possible bashism in arptables/etc/init.d/arptables line 14 (should be '.', not 'source'):
>> source /etc/init.d/functions
>> possible bashism in arptables/etc/init.d/arptables line 96 ($"foo" should be eval_gettext "foo"):
>>          echo $"Usage $0 {start|stop|restart|condrestart|save|status}"
>
> could these be patched instead of rdepending on bash

Thanks, I updated in the repo (V2, but V1 and V2 uses the same repo):

git://git.openembedded.org/meta-openembedded-contrib rbt/rdeps

And here is the patch:

commit e8848953ff6815c2335dc23d18ee40277e04103f
Author: Robert Yang <liezhi.yang@windriver.com>
Date:   Sun Aug 31 23:22:11 2014 -0700

     arptables: remove bashism

     Bashism:
     possible bashism in arptables/etc/init.d/arptables line 14 (should be '.', 
not 'source'):
     source /etc/init.d/functions
     possible bashism in arptables/etc/init.d/arptables line 96 ($"foo" should 
be eval_gettext "foo"):
             echo $"Usage $0 {start|stop|restart|condrestart|save|status}"

     Use "." to replace of "source", and change /bin/bash to /bin/sh, the
     echo $"foo" works well in our busybox.

     Signed-off-by: Robert Yang <liezhi.yang@windriver.com>

diff --git 
a/meta-networking/recipes-support/arptables/arptables-0.0.3-4/arptables-remove-bashism.patch 
b/meta-networking/recipes-support/arptables/arptables-0.0.3-4/arptables-remove-bashism.
new file mode 100644
index 0000000..f332658
--- /dev/null
+++ 
b/meta-networking/recipes-support/arptables/arptables-0.0.3-4/arptables-remove-bashism.patch
@@ -0,0 +1,37 @@
+From cd312bc0e3686404428878d23b8888cba09a20e1 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Thu, 18 Sep 2014 19:46:58 -0700
+Subject: [PATCH] arptables.sysv: remove bashism
+
+Use "." to replace of "source", and change /bin/bash to /bin/sh, the
+echo $"foo" works well in busybox.
+
+Upstream-Status: Pending
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ arptables.sysv |    4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/arptables.sysv b/arptables.sysv
+index 7a90bd2..7710376 100644
+--- a/arptables.sysv
++++ b/arptables.sysv
+@@ -1,4 +1,4 @@
+-#!/bin/bash
++#!/bin/sh
+ #
+ # init script for arptables
+ #
+@@ -11,7 +11,7 @@
+ #
+ # config: __SYSCONFIG__/arptables
+
+-source /etc/init.d/functions
++. /etc/init.d/functions
+ # source /etc/sysconfig/network
+
+ # Check that networking is up.
+--
+1.7.9.5
+

// Robert

>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   .../recipes-support/arptables/arptables_0.0.3-4.bb |    2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-networking/recipes-support/arptables/arptables_0.0.3-4.bb b/meta-networking/recipes-support/arptables/arptables_0.0.3-4.bb
>> index 74f81b5..94920f9 100644
>> --- a/meta-networking/recipes-support/arptables/arptables_0.0.3-4.bb
>> +++ b/meta-networking/recipes-support/arptables/arptables_0.0.3-4.bb
>> @@ -5,7 +5,7 @@ SECTION = "console/network"
>>
>>   PR = "r2"
>>
>> -RDEPENDS_${PN} += "perl"
>> +RDEPENDS_${PN} += "perl bash"
>>
>>   LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
>>   SRC_URI = " \
>>
>
> - --
> - -Khem
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG/MacGPG2 v2.0.22 (Darwin)
> Comment: GPGTools - https://gpgtools.org
>
> iEYEARECAAYFAlQajN0ACgkQuwUzVZGdMxSHuACdFnp3LZpRjZsN3IVLm2tCCb8L
> y2kAnRFWsf2R9HDvvAp1xUoSnQB9bZfQ
> =ZfQX
> -----END PGP SIGNATURE-----
>

