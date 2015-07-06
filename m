Return-Path: <joe@deserted.net>
Received: from mail-vn0-f54.google.com (mail-vn0-f54.google.com
	[209.85.216.54])
	by mail.openembedded.org (Postfix) with ESMTP id 3D65465CBD
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Jul 2015 19:24:22 +0000 (UTC)
Received: by vnbf7 with SMTP id f7so18160575vnb.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Jul 2015 12:24:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=bKl/cJDZduMBs1AbUA7frtNh2DYZg1ktJg31k/6izKc=;
	b=Ru0lkpkclb5+Xou1kRo4UOGQaYBHMi2Sf0rhjHvf2hkNE6J5S5DIynWITmMnPyxDrN
	dh3LfbHW4PW9c55eeEcZJGS0FKQdTACClZAq0nNi3UJq1014qGt8Im7h2OkAXRf97Y4G
	VdPbctBVgXLIEzSlyOByEAR3vOWURz+zENFDo3CP5D6/w9ThFEE19jRvlJq3ORmotGrq
	NMCOKgRc6KVvrbFrmWQpiwYudZHQ5lthw0QPPQgEesw70EdmGXRdd3aeZLB2TaMSKCDr
	MXBVvhqZ2JPrpZJ0tXwEugJomSLPlb3btiF9YKFIvxpqCEoJDjHIWwRJjGPqKqGvduld
	9RkA==
X-Gm-Message-State: ALoCoQk7TKv/iKHzOoFTNZF+HlyDPTQ7GaZb8vpwDqD9mbds9QmHJxhw4nQQFA3eILc8AGp3CHCu
MIME-Version: 1.0
X-Received: by 10.52.83.66 with SMTP id o2mr550870vdy.26.1436210662151; Mon,
	06 Jul 2015 12:24:22 -0700 (PDT)
Received: by 10.31.58.132 with HTTP; Mon, 6 Jul 2015 12:24:22 -0700 (PDT)
In-Reply-To: <1434359480-28573-1-git-send-email-rongqing.li@windriver.com>
References: <1434359480-28573-1-git-send-email-rongqing.li@windriver.com>
Date: Mon, 6 Jul 2015 15:24:22 -0400
Message-ID: <CANBf+V3n2FpHkqHNBRHhxQCjxH_CKOouaWFeQw+WWAiTf2--yQ@mail.gmail.com>
From: Joe MacDonald <joe@deserted.net>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Mon, 06 Jul 2015 19:24:25 -0000
Content-Type: text/plain; charset=UTF-8

Hi Roy,

This seems to have also brought in a build-dep warning:

znc-1.6.0+git: znc rdepends on libicuuc, but it isn't a build
dependency? [build-deps]

See Martin's logs.  Can you check on that please?

-J.

On Mon, Jun 15, 2015 at 5:11 AM,  <rongqing.li@windriver.com> wrote:
> From: Roy Li <rongqing.li@windriver.com>
>
> Remove backport patch
> Add CSocket submodule
>
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>  ...-Fix-NULL-pointer-dereference-in-webadmin.patch | 58 ----------------------
>  meta-networking/recipes-irc/znc/znc_git.bb         | 12 ++---
>  2 files changed, 6 insertions(+), 64 deletions(-)
>  delete mode 100644 meta-networking/recipes-irc/znc/znc/0001-Fix-NULL-pointer-dereference-in-webadmin.patch
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
> -                       CIRCNetwork* pNetwork = SafeGetNetworkFromParam(WebSock);
> -
> -                       // Admin||Self Check
> --                      if (!spSession->IsAdmin() && (!spSession->GetUser() || spSession->GetUser() != pNetwork->GetUser())) {
> -+                      if (!spSession->IsAdmin() && (!spSession->GetUser() || !pNetwork || spSession->GetUser() != pNetwork->GetUser())) {
> -                               return false;
> -                       }
> -
> -@@ -448,7 +448,7 @@ public:
> -                       CIRCNetwork* pNetwork = SafeGetNetworkFromParam(WebSock);
> -
> -                       // Admin||Self Check
> --                      if (!spSession->IsAdmin() && (!spSession->GetUser() || spSession->GetUser() != pNetwork->GetUser())) {
> -+                      if (!spSession->IsAdmin() && (!spSession->GetUser() || !pNetwork || spSession->GetUser() != pNetwork->GetUser())) {
> -                               return false;
> -                       }
> -
> -@@ -472,7 +472,7 @@ public:
> -                       CIRCNetwork* pNetwork = SafeGetNetworkFromParam(WebSock);
> -
> -                       // Admin||Self Check
> --                      if (!spSession->IsAdmin() && (!spSession->GetUser() || spSession->GetUser() != pNetwork->GetUser())) {
> -+                      if (!spSession->IsAdmin() && (!spSession->GetUser() || !pNetwork || spSession->GetUser() != pNetwork->GetUser())) {
> -                               return false;
> -                       }
> -
> -@@ -486,7 +486,7 @@ public:
> -                       CIRCNetwork* pNetwork = SafeGetNetworkFromParam(WebSock);
> -
> -                       // Admin||Self Check
> --                      if (!spSession->IsAdmin() && (!spSession->GetUser() || spSession->GetUser() != pNetwork->GetUser())) {
> -+                      if (!spSession->IsAdmin() && (!spSession->GetUser() || !pNetwork || spSession->GetUser() != pNetwork->GetUser())) {
> -                               return false;
> -                       }
> -
> ---
> -1.8.5.2.233.g932f7e4
> -
> diff --git a/meta-networking/recipes-irc/znc/znc_git.bb b/meta-networking/recipes-irc/znc/znc_git.bb
> index 2e35e4d..834c3de 100644
> --- a/meta-networking/recipes-irc/znc/znc_git.bb
> +++ b/meta-networking/recipes-irc/znc/znc_git.bb
> @@ -1,16 +1,16 @@
>  SUMMARY = "ZNC, an advanced IRC bouncer"
>  SECTION = "net"
>  LICENSE = "GPLv2"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
>
> -DEPENDS = "openssl"
> +DEPENDS = "openssl zlib"
>
> -PV = "1.0+git"
> +PV = "1.6.0+git"
>
> -SRCREV = "ef59c23068547c132cb678092fba9a21317fd5f2"
> -SRC_URI = "git://github.com/znc/znc.git \
> -           file://0001-Fix-NULL-pointer-dereference-in-webadmin.patch \
> +SRC_URI = "git://github.com/znc/znc.git;rev=f47e8465efa4e1cd948b9caae93ac401b4355df8  \
> +           git://github.com/jimloco/Csocket.git;destsuffix=git/third_party/Csocket;name=Csocket \
>            "
> +SRCREV_Csocket = "07b4437396122650e5b8fb3d014e820a5decf4ee"
>
>  S = "${WORKDIR}/git"
>
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel



-- 
Joe MacDonald
:wq

