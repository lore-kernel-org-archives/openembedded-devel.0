Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id D5B537FC23
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Nov 2019 14:58:33 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id k7so4504187pll.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Nov 2019 07:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=qNcF0HFF97eyXViiTo1DgaqUBq8PSs3yI4gRQbTqFfY=;
	b=F4g5ePNyyO6i/IzLnpjN3CrhaK6vMKMmFU7SmSNvQH5K4Xqvbutio4aW+thOce1TF4
	m/rcR8WpS+L8kpmkjnmRo70GBjGkb5Pfe7llQr46KKMQdticKft9pLf7ufU+ZlKGEd9I
	5nqSSvctoPbC12sTMVd9/4CH2fK0aTpc8LDYU2mBEQKvC+3RkCtqizlNXNRc+pL7wJQl
	YNAMEsq4x7Sqe6l5z61ySVor6b0k3DPngVE8PSwfHavPYwkwXmGvy2MAjPhod3Xy1tIA
	QXjkNB3+IS43IokCEI8wB2KjgyhXm3bpvSbg0OFRt9G8QbT+E+tbDnUEI9DRkfFrCKRF
	btwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=qNcF0HFF97eyXViiTo1DgaqUBq8PSs3yI4gRQbTqFfY=;
	b=Jqf+OIoPsBlfB4B6Vpt7bxGuFuDtcO7hCM5uZbjkxdwx17ozJjE63hvY44yNECPabV
	macXy6fodSZe29Qm7YlIDeEwVkkphyM0YE6XTdN9ryYsBudFZAuXV4VQ+bOumXZlwGiJ
	Lgxz5tZZRjrmLesIOKuY2qKSH5TxNipD8OH9AmaHn/OTZalBEBN6k4U3sI9l1OYNs/sx
	U3rM2Ny45uI+HgQ//GanYIEpKTxH1S5f2h+91m2+Ssrz7+YcdU5LcIOC2eRSTHbWGxKi
	kdeMtANB9lulDrT8UcOjP6GYAWEG0XOTd6gUpCV8Gi5nAv7nvjOFqM/s2tpNBGv5O+Kh
	sERQ==
X-Gm-Message-State: APjAAAUCNsPtJgUV6BRc3NyF8B++70RDu3RtTSr0/5o3URXNGS9OwFcG
	6Bcdl2NfEkRhyePgHefiudZi0x8P+DLwGvVxmVo1aQL3
X-Google-Smtp-Source: APXvYqxft5SppLVbjqHQ+1HEQ0ntxTe3yl0j1DMtcVDQDUsqt+R44HuXDP4WukOT3b0d7XAGoQIYuXXjdHu0kGqmcUQ=
X-Received: by 2002:ad4:4789:: with SMTP id z9mr10375092qvy.109.1572619886472; 
	Fri, 01 Nov 2019 07:51:26 -0700 (PDT)
MIME-Version: 1.0
References: <20191028221629.24134-1-bunk@stusta.de>
In-Reply-To: <20191028221629.24134-1-bunk@stusta.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 1 Nov 2019 07:51:00 -0700
Message-ID: <CAMKF1srG3PuUTy=-fn7+iUBOeOnD4kJwbA=bm9X5gYZMfqqzEA@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>, Kang Kai <kai.kang@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-xfce][PATCH] xfce-polkit: Upgrade 0.2 -> 0.3
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Nov 2019 14:58:34 -0000
Content-Type: text/plain; charset="UTF-8"

Kai,  review this patch and ack/nack it please.

On Mon, Oct 28, 2019 at 3:16 PM Adrian Bunk <bunk@stusta.de> wrote:
>
> Patch applied upstream removed.
>
> Signed-off-by: Adrian Bunk <bunk@stusta.de>
> ---
>  .../files/0001-fix-Name-Comment-fields.patch  | 34 -------------------
>  ...{xfce-polkit_0.2.bb => xfce-polkit_0.3.bb} |  3 +-
>  2 files changed, 1 insertion(+), 36 deletions(-)
>  delete mode 100644 meta-xfce/recipes-apps/xfce-polkit/files/0001-fix-Name-Comment-fields.patch
>  rename meta-xfce/recipes-apps/xfce-polkit/{xfce-polkit_0.2.bb => xfce-polkit_0.3.bb} (77%)
>
> diff --git a/meta-xfce/recipes-apps/xfce-polkit/files/0001-fix-Name-Comment-fields.patch b/meta-xfce/recipes-apps/xfce-polkit/files/0001-fix-Name-Comment-fields.patch
> deleted file mode 100644
> index e872249d5..000000000
> --- a/meta-xfce/recipes-apps/xfce-polkit/files/0001-fix-Name-Comment-fields.patch
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -From fb1f83c04dd5262897b09e60fa8b39090d0d4619 Mon Sep 17 00:00:00 2001
> -From: Rex Dieter <rdieter@math.unl.edu>
> -Date: Thu, 12 Nov 2015 13:53:03 -0600
> -Subject: [PATCH] fix Name/Comment fields
> -
> -Validate as a valid .desktop file per
> -http://standards.freedesktop.org/desktop-entry-spec/latest/
> -
> -See also issue #2
> -
> -Upstream-Status: Applied [1]
> -
> -[1] https://github.com/ncopa/xfce-polkit/commit/fb1f83c04dd5262897b09e60fa8b39090d0d4619
> ----
> - xfce-polkit.desktop.in | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/xfce-polkit.desktop.in b/xfce-polkit.desktop.in
> -index 8575896..dd9f09c 100644
> ---- a/xfce-polkit.desktop.in
> -+++ b/xfce-polkit.desktop.in
> -@@ -1,7 +1,7 @@
> - [Desktop Entry]
> - Type=Application
> --_Name=XFCE PolKit
> --_Comment=Policykit Authentication Agent
> -+Name=XFCE PolKit
> -+Comment=Policykit Authentication Agent
> - Exec=@xfce_polkit_libexecdir@/xfce-polkit
> - Icon=gtk-dialog-authentication
> - NotShowIn=GNOME;KDE;
> ---
> -2.14.3
> -
> diff --git a/meta-xfce/recipes-apps/xfce-polkit/xfce-polkit_0.2.bb b/meta-xfce/recipes-apps/xfce-polkit/xfce-polkit_0.3.bb
> similarity index 77%
> rename from meta-xfce/recipes-apps/xfce-polkit/xfce-polkit_0.2.bb
> rename to meta-xfce/recipes-apps/xfce-polkit/xfce-polkit_0.3.bb
> index 62d8d6de9..3a396c0f7 100644
> --- a/meta-xfce/recipes-apps/xfce-polkit/xfce-polkit_0.2.bb
> +++ b/meta-xfce/recipes-apps/xfce-polkit/xfce-polkit_0.3.bb
> @@ -9,7 +9,6 @@ REQUIRED_DISTRO_FEATURES = "polkit"
>
>  SRC_URI = " \
>      git://github.com/ncopa/${BPN}.git \
> -    file://0001-fix-Name-Comment-fields.patch \
>  "
> -SRCREV = "6ad1ee833c9e22e4dd72a8f7d54562d046965283"
> +SRCREV = "6d3282cc1734c305850d48f5bf4b4d94e88885e9"
>  S = "${WORKDIR}/git"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

