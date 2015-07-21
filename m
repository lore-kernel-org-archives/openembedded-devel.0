Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f177.google.com (mail-pd0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id 24DE5761A0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jul 2015 14:42:21 +0000 (UTC)
Received: by pdbnt7 with SMTP id nt7so50880947pdb.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jul 2015 07:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=Y3l2ZAoVwV/oXpqo2oOhSRXgAG/WLqK/WzCMmz7O4lQ=;
	b=iECJNrJNxieVPB+jAjh9s3/gyfGD2cpXV+Attb/Po6IbW2PFzkxhHaG9qxjLVl6+YY
	ALpOrj9blkVvkt+Mmt9eLVnKN0XLC9FMItLLPro8ZhxqDrGanLVXYAJRCpBfhzHB3KBp
	9WwFHr+0kfbretedNVUJiK/Lx77+MPF6HlOa0TkyZY5n8oL7TUaztmW4RS4QjivZDm+i
	4RBVS7r5Un2c9eoMWMLUp63KK9FfYStOXYQRvyuOmoYl64VENvzFJ2MH3RnsM0+BIU6L
	0NMil15Ac7FxKGybhIGgxjoHymguPl2LslYOHaEXXhHK1jd/tP35a+Luwuz1amiDPR6r
	MXMQ==
X-Received: by 10.66.66.130 with SMTP id f2mr75555111pat.120.1437489741701;
	Tue, 21 Jul 2015 07:42:21 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1239:7879:5e78:5a27:38d9?
	([2601:202:4000:1239:7879:5e78:5a27:38d9])
	by smtp.googlemail.com with ESMTPSA id
	bx8sm28089773pab.38.2015.07.21.07.42.19
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 21 Jul 2015 07:42:20 -0700 (PDT)
Message-ID: <55AE5A3A.5040209@gmail.com>
Date: Tue, 21 Jul 2015 07:42:02 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1430733225-30477-1-git-send-email-b40290@freescale.com>
In-Reply-To: <1430733225-30477-1-git-send-email-b40290@freescale.com>
Subject: Re: [meta-oe][fido][PATCH] polkit: do not hardcode the libdir
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
X-List-Received-Date: Tue, 21 Jul 2015 14:42:24 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

merged to staging.

- armin

On 05/04/2015 02:53 AM, b40290@freescale.com wrote:
> From: Chunrong Guo <B40290@freescale.com>
>
>    libdir is defined as ${prefix}/lib/, but we want it to support multilib path
>
> Signed-off-by: Chunrong Guo <B40290@freescale.com>
> ---
>   .../polkit/0001-do-not-hardcoded-libdir.patch      | 44 ++++++++++++++++++++++
>   meta-oe/recipes-extended/polkit/polkit_0.112.bb    |  1 +
>   2 files changed, 45 insertions(+)
>   create mode 100644 meta-oe/recipes-extended/polkit/polkit/0001-do-not-hardcoded-libdir.patch
>
> diff --git a/meta-oe/recipes-extended/polkit/polkit/0001-do-not-hardcoded-libdir.patch b/meta-oe/recipes-extended/polkit/polkit/0001-do-not-hardcoded-libdir.patch
> new file mode 100644
> index 0000000..3ccedcd
> --- /dev/null
> +++ b/meta-oe/recipes-extended/polkit/polkit/0001-do-not-hardcoded-libdir.patch
> @@ -0,0 +1,44 @@
> +From c9e09d9b101109832b1dcb050f0c8b588e276686 Mon Sep 17 00:00:00 2001
> +From: Zhenhua Luo <zhenhua.luo@freescale.com>
> +Date: Mon, 4 May 2015 04:11:27 -0500
> +Subject: [PATCH] do not hardcoded libdir
> +
> +Upstream-Status: Pending
> +
> +libdir is hardcoded to ${prefix}/lib, but we want it to support multilib
> +
> +Signed-off-by: Chunrong Guo <B40290@freescale.com>
> +---
> + polkitagent/Makefile.am   | 2 +-
> + polkitbackend/Makefile.am | 2 +-
> + 2 files changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/polkitagent/Makefile.am b/src/polkitagent/Makefile.am
> +index 3bc364e..7d1ac0e 100644
> +--- a/src/polkitagent/Makefile.am
> ++++ b/src/polkitagent/Makefile.am
> +@@ -78,7 +78,7 @@ libpolkit_agent_1_la_LIBADD =                               		\
> +
> + libpolkit_agent_1_la_LDFLAGS = -export-symbols-regex '(^polkit_.*)'
> +
> +-libprivdir = $(prefix)/lib/polkit-1
> ++libprivdir = $(prefix)/${base_libdir}/polkit-1
> + libpriv_PROGRAMS = polkit-agent-helper-1
> +
> + polkit_agent_helper_1_SOURCES = 					\
> +diff --git a/src/polkitbackend/Makefile.am b/src/polkitbackend/Makefile.am
> +index 9f430d0..1f7610b 100644
> +--- a/src/polkitbackend/Makefile.am
> ++++ b/src/polkitbackend/Makefile.am
> +@@ -67,7 +67,7 @@ rules_DATA = 50-default.rules
> +
> + # ----------------------------------------------------------------------------------------------------
> +
> +-libprivdir = $(prefix)/lib/polkit-1
> ++libprivdir = $(prefix)/${base_libdir}/polkit-1
> + libpriv_PROGRAMS = polkitd
> +
> + polkitd_SOURCES = 							\
> +--
> +2.3.3
> +
> diff --git a/meta-oe/recipes-extended/polkit/polkit_0.112.bb b/meta-oe/recipes-extended/polkit/polkit_0.112.bb
> index 72b182b..f20e1a4 100644
> --- a/meta-oe/recipes-extended/polkit/polkit_0.112.bb
> +++ b/meta-oe/recipes-extended/polkit/polkit_0.112.bb
> @@ -21,6 +21,7 @@ PAM_SRC_URI = "file://polkit-1_pam.patch"
>   SRC_URI = "http://www.freedesktop.org/software/polkit/releases/polkit-${PV}.tar.gz \
>              ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
>              file://0001-configure.ac-Check-only-for-libsystemd-not-libsystem.patch \
> +           file://0001-do-not-hardcoded-libdir.patch \
>   "
>
>   SRC_URI[md5sum] = "b0f2fa00a55f47c6a5d88e9b73f80127"
>

