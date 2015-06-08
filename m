Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D2C12732B1
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Jun 2015 00:54:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t580skex019382
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 7 Jun 2015 17:54:47 -0700 (PDT)
Received: from [128.224.162.136] (128.224.162.136) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Sun, 7 Jun 2015 17:54:46 -0700
Message-ID: <5574E7D5.7020908@windriver.com>
Date: Mon, 8 Jun 2015 08:54:45 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Joe MacDonald <Joe_MacDonald@mentor.com>
References: <1433139476-13265-1-git-send-email-rongqing.li@windriver.com>
	<20150606020139.GC27123@mentor.com> <5574E267.90908@windriver.com>
	<20150608004229.GB32578@mentor.com>
In-Reply-To: <20150608004229.GB32578@mentor.com>
Cc: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Mon, 08 Jun 2015 00:54:45 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2015年06月08日 08:42, Joe MacDonald wrote:
> [Re: [oe] [PATCH][meta-networking] znc: upgrade to 1.6.0] On 15.06.08 (Mon 08:31) Rongqing Li wrote:
>
>>
>>
>> On 2015年06月06日 10:01, Joe MacDonald wrote:
>>> Hey Roy,
>>>
>>> [[oe] [PATCH][meta-networking] znc: upgrade to 1.6.0] On 15.06.01 (Mon 14:17) rongqing.li@windriver.com wrote:
>>>
>>>> From: Roy Li <rongqing.li@windriver.com>
>>>>
>>>> 1. upgrade to 1.6.0 to fix CVE-2014-9403
>>>> 2. Remove the backup patch
>>>> 3. not git version, otherwise it requires "git submodule" command,
>>>> since Csocket is moved into git submodule
>>>> 4. update the checksum of LICENSE, since the date in it was changed
>>>
>>> Couple of things about this one.  The patch fails to apply:
>>>
>>> ------------------------------------------------------------------------
>>> % git am /tmp/a.mbox
>>> Applying: znc: upgrade to 1.6.0
>>> error: patch failed: meta-networking/recipes-irc/znc/znc_git.bb:1
>>> error: meta-networking/recipes-irc/znc/znc_git.bb: patch does not apply
>>> Patch failed at 0001 znc: upgrade to 1.6.0
>>> The copy of the patch that failed is found in:
>>>     /home/jjm/external/yocto-networking/meta-openembedded/.git/rebase-apply/patch
>>> When you have resolved this problem, run "git am --continue".
>>> If you prefer to skip this patch, run "git am --skip" instead.
>>> To restore the original branch and stop patching, run "git am --abort".
>>> ------------------------------------------------------------------------
>>>
>>> but also, unless there's a good reason to drop the git recipe, I'd
>>> rather keep that and add in the released one beside it.  Normally I
>>> don't like to keep multiple versions of a recipe around, but if one of
>>> those is a "build directly from the source repo", that I think is
>>> reasonable to keep around.
>>>
>>> -J.
>>
>> Sorry, I will fix it
>
> Okay.  I haven't looked at the repo myself, but if there are
> obvious tags for the releases, maybe you want to create a version of the
> recipe that includes the git version directly and just selects an
> appropriate release tag?  I don't know, just a thought.  Whatever works.
>
> -J.

I did not upgrade the git version since some codes moved into git submodule,
it does not work to directly upgrade the git version unless the host
has "git submodule", and modify the recipe file to get the submodule.


1. ChangeLog said:

znc$ grep "Move Csocket to git submodule" ./ -r
./ChangeLog.md:* Move Csocket to git submodule.
znc$


2. no Csocket code
znc$ ls third_party/Csocket/
znc$

3. run "git submodule" to fetch the codes
znc$ git submodule update --init --recursive
Submodule 'Csocket' (https://github.com/jimloco/Csocket.git) registered 
for path 'third_party/Csocket'
Cloning into 'third_party/Csocket'...
remote: Counting objects: 1633, done.
remote: Total 1633 (delta 0), reused 0 (delta 0), pack-reused 1633
Receiving objects: 100% (1633/1633), 1.01 MiB | 182.00 KiB/s, done.
Resolving deltas: 100% (640/640), done.
Checking connectivity... done.
Submodule path 'third_party/Csocket': checked out 
'07b4437396122650e5b8fb3d014e820a5decf4ee'
znc$

znc$ ls third_party/Csocket/
Csocket.cc  Csocket.h  CurlSock.cc  CurlSock.h  examples
znc$


-Roy



>
>>
>> -Roy
>>
>>>
>>>>
>>>> Signed-off-by: Roy Li <rongqing.li@windriver.com>
>>>> ---
>>>>   ...-Fix-NULL-pointer-dereference-in-webadmin.patch | 58 ----------------------
>>>>   .../recipes-irc/znc/{znc_git.bb => znc_1.6.0.bb}   | 14 ++----
>>>>   2 files changed, 5 insertions(+), 67 deletions(-)
>>>>   delete mode 100644 meta-networking/recipes-irc/znc/znc/0001-Fix-NULL-pointer-dereference-in-webadmin.patch
>>>>   rename meta-networking/recipes-irc/znc/{znc_git.bb => znc_1.6.0.bb} (47%)
>>>>
>>>> diff --git a/meta-networking/recipes-irc/znc/znc/0001-Fix-NULL-pointer-dereference-in-webadmin.patch b/meta-networking/recipes-irc/znc/znc/0001-Fix-NULL-pointer-dereference-in-webadmin.patch
>>>> deleted file mode 100644
>>>> index 68e4414..0000000
>>>> --- a/meta-networking/recipes-irc/znc/znc/0001-Fix-NULL-pointer-dereference-in-webadmin.patch
>>>> +++ /dev/null
>>>> @@ -1,58 +0,0 @@
>>>> -Subject: [PATCH] Fix NULL pointer dereference in webadmin.
>>>> -
>>>> -Upstream-Status: Backport
>>>> -
>>>> -commit 2bd410ee5570cea127233f1133ea22f25174eb28 upstream
>>>> -
>>>> -Triggerable by any non-admin, if webadmin is loaded.
>>>> -
>>>> -The only affected version is 1.0
>>>> -
>>>> -Thanks to ChauffeR (Simone Esposito) for reporting this.
>>>> ----
>>>> - modules/webadmin.cpp | 8 ++++----
>>>> - 1 file changed, 4 insertions(+), 4 deletions(-)
>>>> -
>>>> -diff --git a/modules/webadmin.cpp b/modules/webadmin.cpp
>>>> -index b793c02..816f217 100644
>>>> ---- a/modules/webadmin.cpp
>>>> -+++ b/modules/webadmin.cpp
>>>> -@@ -419,7 +419,7 @@ public:
>>>> - 			CIRCNetwork* pNetwork = SafeGetNetworkFromParam(WebSock);
>>>> -
>>>> - 			// Admin||Self Check
>>>> --			if (!spSession->IsAdmin() && (!spSession->GetUser() || spSession->GetUser() != pNetwork->GetUser())) {
>>>> -+			if (!spSession->IsAdmin() && (!spSession->GetUser() || !pNetwork || spSession->GetUser() != pNetwork->GetUser())) {
>>>> - 				return false;
>>>> - 			}
>>>> -
>>>> -@@ -448,7 +448,7 @@ public:
>>>> - 			CIRCNetwork* pNetwork = SafeGetNetworkFromParam(WebSock);
>>>> -
>>>> - 			// Admin||Self Check
>>>> --			if (!spSession->IsAdmin() && (!spSession->GetUser() || spSession->GetUser() != pNetwork->GetUser())) {
>>>> -+			if (!spSession->IsAdmin() && (!spSession->GetUser() || !pNetwork || spSession->GetUser() != pNetwork->GetUser())) {
>>>> - 				return false;
>>>> - 			}
>>>> -
>>>> -@@ -472,7 +472,7 @@ public:
>>>> - 			CIRCNetwork* pNetwork = SafeGetNetworkFromParam(WebSock);
>>>> -
>>>> - 			// Admin||Self Check
>>>> --			if (!spSession->IsAdmin() && (!spSession->GetUser() || spSession->GetUser() != pNetwork->GetUser())) {
>>>> -+			if (!spSession->IsAdmin() && (!spSession->GetUser() || !pNetwork || spSession->GetUser() != pNetwork->GetUser())) {
>>>> - 				return false;
>>>> - 			}
>>>> -
>>>> -@@ -486,7 +486,7 @@ public:
>>>> - 			CIRCNetwork* pNetwork = SafeGetNetworkFromParam(WebSock);
>>>> -
>>>> - 			// Admin||Self Check
>>>> --			if (!spSession->IsAdmin() && (!spSession->GetUser() || spSession->GetUser() != pNetwork->GetUser())) {
>>>> -+			if (!spSession->IsAdmin() && (!spSession->GetUser() || !pNetwork || spSession->GetUser() != pNetwork->GetUser())) {
>>>> - 				return false;
>>>> - 			}
>>>> -
>>>> ---
>>>> -1.8.5.2.233.g932f7e4
>>>> -
>>>> diff --git a/meta-networking/recipes-irc/znc/znc_git.bb b/meta-networking/recipes-irc/znc/znc_1.6.0.bb
>>>> similarity index 47%
>>>> rename from meta-networking/recipes-irc/znc/znc_git.bb
>>>> rename to meta-networking/recipes-irc/znc/znc_1.6.0.bb
>>>> index 77db25b..ca3c606 100644
>>>> --- a/meta-networking/recipes-irc/znc/znc_git.bb
>>>> +++ b/meta-networking/recipes-irc/znc/znc_1.6.0.bb
>>>> @@ -1,17 +1,13 @@
>>>>   SUMMARY = "ZNC, an advanced IRC bouncer"
>>>>   LICENSE = "GPLv2"
>>>> -LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
>>>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
>>>>
>>>> -DEPENDS = "openssl"
>>>> +DEPENDS = "openssl zlib"
>>>>
>>>> -PV = "1.0+git"
>>>> -
>>>> -SRCREV = "ef59c23068547c132cb678092fba9a21317fd5f2"
>>>> -SRC_URI = "git://github.com/znc/znc.git \
>>>> -           file://0001-Fix-NULL-pointer-dereference-in-webadmin.patch \
>>>> +SRC_URI = "http://znc.in/releases/${BP}.tar.gz \
>>>>             "
>>>> -
>>>> -S = "${WORKDIR}/git"
>>>> +SRC_URI[md5sum]="674d8c1277752dcc627b96e33a63376e"
>>>> +SRC_URI[sha256sum]="df622aeae34d26193c738dff6499e56ad669ec654484e19623738d84cc80aba7"
>>>>
>>>>   inherit autotools-brokensep pkgconfig
>>>>
>>

-- 
Best Reagrds,
Roy | RongQing Li

