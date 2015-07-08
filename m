Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f177.google.com (mail-pd0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id 62DD573E36
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Jul 2015 15:37:31 +0000 (UTC)
Received: by pdrg1 with SMTP id g1so16152556pdr.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Jul 2015 08:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=9pf0y4zGJ0cGg/Kr3TYd6d9gF6p049KIey49EaTR0NU=;
	b=wNs5Se2Knzc7XPsCkPPelUoKEsh9ckygiGBYES3cvbyrFOsfCwbc024snXGjsG6ha0
	fplEl6u65J0V7jFxOI4Ibq9BGEv+Muj/4qGPJ0N3s5OzFK7cK7janh6AwcLUjuHtKOlz
	ONIuoUvszWEC+KuTBnXaiyehvAOyyq+hBeiLGUbH60uyzej1F29v0DMvjIwh7Q4WFgif
	Svu7pXKj6VYHnaFFTn26nrs69DW/4myKKwqhAuvcchkgbpq7khCsKQmVIow8Tezr8Wvs
	Y4oGwW5eW0ZA77bbPDZ6yedu9i95J0tK/NEoSuArhH/402xGArZWwbXR1LcfTYU2MG7M
	x1Tg==
X-Received: by 10.70.129.143 with SMTP id nw15mr21513866pdb.101.1436369852114; 
	Wed, 08 Jul 2015 08:37:32 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1239:202d:ddf7:682b:65c6?
	([2601:202:4000:1239:202d:ddf7:682b:65c6])
	by smtp.googlemail.com with ESMTPSA id
	fy5sm2890016pdb.93.2015.07.08.08.37.30
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Jul 2015 08:37:31 -0700 (PDT)
Message-ID: <559D43B9.2060908@gmail.com>
Date: Wed, 08 Jul 2015 08:37:29 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1436234152-4937-1-git-send-email-rongqing.li@windriver.com>
In-Reply-To: <1436234152-4937-1-git-send-email-rongqing.li@windriver.com>
Subject: Re: [PATCH][meta-networking][v2] znc: upgrade to 1.6.0
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
X-List-Received-Date: Wed, 08 Jul 2015 15:37:34 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit


if it is possible, can the security fix be noted?

1.4:
CVE-2014-9403

On 07/06/2015 06:55 PM, rongqing.li@windriver.com wrote:
> From: Roy Li <rongqing.li@windriver.com>
>
> Remove backport patch
> Add CSocket submodule
> Add the dependency on icu
>
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>   ...-Fix-NULL-pointer-dereference-in-webadmin.patch | 58 ----------------------
>   meta-networking/recipes-irc/znc/znc_git.bb         | 12 ++---
>   2 files changed, 6 insertions(+), 64 deletions(-)
>   delete mode 100644 meta-networking/recipes-irc/znc/znc/0001-Fix-NULL-pointer-dereference-in-webadmin.patch
>
> diff --git a/meta-networking/recipes-irc/znc/znc/0001-Fix-NULL-pointer-dereference-in-webadmin.patch b/meta-networking/recipes-irc/znc/znc/0001-Fix-NULL-pointer-dereference-in-webadmin.patch
> deleted file mode 100644
> index 68e4414..0000000
> --- a/meta-networking/recipes-irc/znc/znc/0001-Fix-NULL-pointer-dereference-in-webadmin.patch
> +++ /dev/null
> @@ -1,58 +0,0 @@
> -Subject: [PATCH] Fix NULL pointer dereference in webadmin.
> -
> -Upstream-Status: Backport
> -
> -commit 2bd410ee5570cea127233f1133ea22f25174eb28 upstream
> -
> -Triggerable by any non-admin, if webadmin is loaded.
> -
> -The only affected version is 1.0
> -
> -Thanks to ChauffeR (Simone Esposito) for reporting this.
> ----
> - modules/webadmin.cpp | 8 ++++----
> - 1 file changed, 4 insertions(+), 4 deletions(-)
> -
> -diff --git a/modules/webadmin.cpp b/modules/webadmin.cpp
> -index b793c02..816f217 100644
> ---- a/modules/webadmin.cpp
> -+++ b/modules/webadmin.cpp
> -@@ -419,7 +419,7 @@ public:
> - 			CIRCNetwork* pNetwork = SafeGetNetworkFromParam(WebSock);
> -
> - 			// Admin||Self Check
> --			if (!spSession->IsAdmin() && (!spSession->GetUser() || spSession->GetUser() != pNetwork->GetUser())) {
> -+			if (!spSession->IsAdmin() && (!spSession->GetUser() || !pNetwork || spSession->GetUser() != pNetwork->GetUser())) {
> - 				return false;
> - 			}
> -
> -@@ -448,7 +448,7 @@ public:
> - 			CIRCNetwork* pNetwork = SafeGetNetworkFromParam(WebSock);
> -
> - 			// Admin||Self Check
> --			if (!spSession->IsAdmin() && (!spSession->GetUser() || spSession->GetUser() != pNetwork->GetUser())) {
> -+			if (!spSession->IsAdmin() && (!spSession->GetUser() || !pNetwork || spSession->GetUser() != pNetwork->GetUser())) {
> - 				return false;
> - 			}
> -
> -@@ -472,7 +472,7 @@ public:
> - 			CIRCNetwork* pNetwork = SafeGetNetworkFromParam(WebSock);
> -
> - 			// Admin||Self Check
> --			if (!spSession->IsAdmin() && (!spSession->GetUser() || spSession->GetUser() != pNetwork->GetUser())) {
> -+			if (!spSession->IsAdmin() && (!spSession->GetUser() || !pNetwork || spSession->GetUser() != pNetwork->GetUser())) {
> - 				return false;
> - 			}
> -
> -@@ -486,7 +486,7 @@ public:
> - 			CIRCNetwork* pNetwork = SafeGetNetworkFromParam(WebSock);
> -
> - 			// Admin||Self Check
> --			if (!spSession->IsAdmin() && (!spSession->GetUser() || spSession->GetUser() != pNetwork->GetUser())) {
> -+			if (!spSession->IsAdmin() && (!spSession->GetUser() || !pNetwork || spSession->GetUser() != pNetwork->GetUser())) {
> - 				return false;
> - 			}
> -
> ---
> -1.8.5.2.233.g932f7e4
> -
> diff --git a/meta-networking/recipes-irc/znc/znc_git.bb b/meta-networking/recipes-irc/znc/znc_git.bb
> index 2e35e4d..f5bed08 100644
> --- a/meta-networking/recipes-irc/znc/znc_git.bb
> +++ b/meta-networking/recipes-irc/znc/znc_git.bb
> @@ -1,16 +1,16 @@
>   SUMMARY = "ZNC, an advanced IRC bouncer"
>   SECTION = "net"
>   LICENSE = "GPLv2"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
>
> -DEPENDS = "openssl"
> +DEPENDS = "openssl zlib icu"
>
> -PV = "1.0+git"
> +PV = "1.6.0+git"
>
> -SRCREV = "ef59c23068547c132cb678092fba9a21317fd5f2"
> -SRC_URI = "git://github.com/znc/znc.git \
> -           file://0001-Fix-NULL-pointer-dereference-in-webadmin.patch \
> +SRC_URI = "git://github.com/znc/znc.git;rev=f47e8465efa4e1cd948b9caae93ac401b4355df8  \
> +           git://github.com/jimloco/Csocket.git;destsuffix=git/third_party/Csocket;name=Csocket \
>             "
> +SRCREV_Csocket = "07b4437396122650e5b8fb3d014e820a5decf4ee"
>
>   S = "${WORKDIR}/git"
>
>

