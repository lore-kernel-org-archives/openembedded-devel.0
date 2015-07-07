Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 16213734B8
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Jul 2015 00:47:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t670lVhI001585
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 6 Jul 2015 17:47:31 -0700 (PDT)
Received: from [128.224.162.158] (128.224.162.158) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 6 Jul 2015 17:47:30 -0700
Message-ID: <559B21A1.6000500@windriver.com>
Date: Tue, 7 Jul 2015 08:47:29 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1434359480-28573-1-git-send-email-rongqing.li@windriver.com>
	<CANBf+V3n2FpHkqHNBRHhxQCjxH_CKOouaWFeQw+WWAiTf2--yQ@mail.gmail.com>
In-Reply-To: <CANBf+V3n2FpHkqHNBRHhxQCjxH_CKOouaWFeQw+WWAiTf2--yQ@mail.gmail.com>
Subject: Re: [PATCH][meta-networking] znc: upgrade to 1.6.0
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
X-List-Received-Date: Tue, 07 Jul 2015 00:47:32 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2015年07月07日 03:24, Joe MacDonald wrote:
> Hi Roy,
>
> This seems to have also brought in a build-dep warning:
>
> znc-1.6.0+git: znc rdepends on libicuuc, but it isn't a build
> dependency? [build-deps]
>
> See Martin's logs.  Can you check on that please?
>
> -J.
>

Ok, I will see it

-Roy

> On Mon, Jun 15, 2015 at 5:11 AM,  <rongqing.li@windriver.com> wrote:
>> From: Roy Li <rongqing.li@windriver.com>
>>
>> Remove backport patch
>> Add CSocket submodule
>>
>> Signed-off-by: Roy Li <rongqing.li@windriver.com>
>> ---
>>   ...-Fix-NULL-pointer-dereference-in-webadmin.patch | 58 ----------------------
>>   meta-networking/recipes-irc/znc/znc_git.bb         | 12 ++---
>>   2 files changed, 6 insertions(+), 64 deletions(-)
>>   delete mode 100644 meta-networking/recipes-irc/znc/znc/0001-Fix-NULL-pointer-dereference-in-webadmin.patch
>>
>> diff --git a/meta-networking/recipes-irc/znc/znc/0001-Fix-NULL-pointer-dereference-in-webadmin.patch b/meta-networking/recipes-irc/znc/znc/0001-Fix-NULL-pointer-dereference-in-webadmin.patch
>> deleted file mode 100644
>> index 68e4414..0000000
>> --- a/meta-networking/recipes-irc/znc/znc/0001-Fix-NULL-pointer-dereference-in-webadmin.patch
>> +++ /dev/null
>> @@ -1,58 +0,0 @@
>> -Subject: [PATCH] Fix NULL pointer dereference in webadmin.
>> -
>> -Upstream-Status: Backport
>> -
>> -commit 2bd410ee5570cea127233f1133ea22f25174eb28 upstream
>> -
>> -Triggerable by any non-admin, if webadmin is loaded.
>> -
>> -The only affected version is 1.0
>> -
>> -Thanks to ChauffeR (Simone Esposito) for reporting this.
>> ----
>> - modules/webadmin.cpp | 8 ++++----
>> - 1 file changed, 4 insertions(+), 4 deletions(-)
>> -
>> -diff --git a/modules/webadmin.cpp b/modules/webadmin.cpp
>> -index b793c02..816f217 100644
>> ---- a/modules/webadmin.cpp
>> -+++ b/modules/webadmin.cpp
>> -@@ -419,7 +419,7 @@ public:
>> -                       CIRCNetwork* pNetwork = SafeGetNetworkFromParam(WebSock);
>> -
>> -                       // Admin||Self Check
>> --                      if (!spSession->IsAdmin() && (!spSession->GetUser() || spSession->GetUser() != pNetwork->GetUser())) {
>> -+                      if (!spSession->IsAdmin() && (!spSession->GetUser() || !pNetwork || spSession->GetUser() != pNetwork->GetUser())) {
>> -                               return false;
>> -                       }
>> -
>> -@@ -448,7 +448,7 @@ public:
>> -                       CIRCNetwork* pNetwork = SafeGetNetworkFromParam(WebSock);
>> -
>> -                       // Admin||Self Check
>> --                      if (!spSession->IsAdmin() && (!spSession->GetUser() || spSession->GetUser() != pNetwork->GetUser())) {
>> -+                      if (!spSession->IsAdmin() && (!spSession->GetUser() || !pNetwork || spSession->GetUser() != pNetwork->GetUser())) {
>> -                               return false;
>> -                       }
>> -
>> -@@ -472,7 +472,7 @@ public:
>> -                       CIRCNetwork* pNetwork = SafeGetNetworkFromParam(WebSock);
>> -
>> -                       // Admin||Self Check
>> --                      if (!spSession->IsAdmin() && (!spSession->GetUser() || spSession->GetUser() != pNetwork->GetUser())) {
>> -+                      if (!spSession->IsAdmin() && (!spSession->GetUser() || !pNetwork || spSession->GetUser() != pNetwork->GetUser())) {
>> -                               return false;
>> -                       }
>> -
>> -@@ -486,7 +486,7 @@ public:
>> -                       CIRCNetwork* pNetwork = SafeGetNetworkFromParam(WebSock);
>> -
>> -                       // Admin||Self Check
>> --                      if (!spSession->IsAdmin() && (!spSession->GetUser() || spSession->GetUser() != pNetwork->GetUser())) {
>> -+                      if (!spSession->IsAdmin() && (!spSession->GetUser() || !pNetwork || spSession->GetUser() != pNetwork->GetUser())) {
>> -                               return false;
>> -                       }
>> -
>> ---
>> -1.8.5.2.233.g932f7e4
>> -
>> diff --git a/meta-networking/recipes-irc/znc/znc_git.bb b/meta-networking/recipes-irc/znc/znc_git.bb
>> index 2e35e4d..834c3de 100644
>> --- a/meta-networking/recipes-irc/znc/znc_git.bb
>> +++ b/meta-networking/recipes-irc/znc/znc_git.bb
>> @@ -1,16 +1,16 @@
>>   SUMMARY = "ZNC, an advanced IRC bouncer"
>>   SECTION = "net"
>>   LICENSE = "GPLv2"
>> -LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
>>
>> -DEPENDS = "openssl"
>> +DEPENDS = "openssl zlib"
>>
>> -PV = "1.0+git"
>> +PV = "1.6.0+git"
>>
>> -SRCREV = "ef59c23068547c132cb678092fba9a21317fd5f2"
>> -SRC_URI = "git://github.com/znc/znc.git \
>> -           file://0001-Fix-NULL-pointer-dereference-in-webadmin.patch \
>> +SRC_URI = "git://github.com/znc/znc.git;rev=f47e8465efa4e1cd948b9caae93ac401b4355df8  \
>> +           git://github.com/jimloco/Csocket.git;destsuffix=git/third_party/Csocket;name=Csocket \
>>             "
>> +SRCREV_Csocket = "07b4437396122650e5b8fb3d014e820a5decf4ee"
>>
>>   S = "${WORKDIR}/git"
>>
>> --
>> 1.9.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>
>

-- 
Best Reagrds,
Roy | RongQing Li

