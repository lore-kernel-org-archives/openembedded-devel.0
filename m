Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id 7C190605D2
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Aug 2015 23:05:55 +0000 (UTC)
Received: by igbpg9 with SMTP id pg9so21776729igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Aug 2015 16:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=SugUL0xLiB9iJ2SjfImwR3NSGjv26MbMcKBRNGA7Qak=;
	b=rjO+5Y+idrKdkyf901nZxrHzHhgVBvuOl/APCmbBICn9GYZNRG10dcqzbVXtwojAmr
	xNDFU7zVPzuHghqRhO+A1dm4/MtieqQB71kngNOhksXH1jrQBX+7oeC0MY/1JEqJ2P9A
	iegjR1JdZ7YxHHcsrus6dicmUsqHOayu7mErfAdxdkLcBA/ATi28/huZd4BcXgIKEarT
	nJF2IMfsClc5Qv3ekmXo+z6znkup4kFrIHPpkSX0BL71Gau+yYNWpYigzI8vG/glNhkm
	fkDIUI4e0HGWkswkPbORGP7wk4jfXSc5Nboo6l27nsO4ZbeMzj4l3q9+A8jg76l2YsgV
	hG6g==
X-Received: by 10.50.79.229 with SMTP id m5mr2504641igx.77.1438729555995; Tue,
	04 Aug 2015 16:05:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.38.79 with HTTP; Tue, 4 Aug 2015 16:05:26 -0700 (PDT)
In-Reply-To: <1438628438-9452-2-git-send-email-Martin.Jansa@gmail.com>
References: <1429280204-27191-3-git-send-email-Martin.Jansa@gmail.com>
	<1438628438-9452-1-git-send-email-Martin.Jansa@gmail.com>
	<1438628438-9452-2-git-send-email-Martin.Jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 4 Aug 2015 16:05:26 -0700
Message-ID: <CAMKF1sqPdo2ByELw+pCkVPGtYHRXVJAWEo8d3tONXtKcyJmu3g@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH 2/2] qt5-plugin-generic-vboxtouch: add -Wno-narrowing to fix build with gcc-5.2
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
X-List-Received-Date: Tue, 04 Aug 2015 23:05:58 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 3, 2015 at 12:00 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  recipes-qt/qt5/qt5-plugin-generic-vboxtouch_git.bb | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-qt/qt5/qt5-plugin-generic-vboxtouch_git.bb b/recipes-qt/qt5/qt5-plugin-generic-vboxtouch_git.bb
> index 5352d15..2676bdd 100644
> --- a/recipes-qt/qt5/qt5-plugin-generic-vboxtouch_git.bb
> +++ b/recipes-qt/qt5/qt5-plugin-generic-vboxtouch_git.bb
> @@ -9,12 +9,15 @@ LIC_FILES_CHKSUM = " \
>      file://evdevmousehandler.cpp;beginline=1;endline=40;md5=9081062f6e7f74b6e62ad7ecee4a71be \
>  "
>
> -PV = "1.0+gitr${SRCPV}"
> +PV = "1.1.3+gitr${SRCPV}"
>
>  DEPENDS = "qtbase"
>
> +# Needed with gcc-5.2 https://gcc.gnu.org/bugzilla/show_bug.cgi?id=65801

this comment it wrong. It should have said needed with gcc5 < 5.2

> +CXXFLAGS += "-Wno-narrowing"

we now have 5.2 in OE-Core and its fixed in 5.2, Can you try to remove it ?

> +
>  SRC_URI = "git://github.com/nemomobile/qt5-plugin-generic-vboxtouch.git"
> -SRCREV = "7d7a6dfd501c43687e7bb110610cac5f7c9abd4b"
> +SRCREV = "d613ad1cc64d7a6a9b38df4d49146170be6876aa"
>  S = "${WORKDIR}/git/vboxtouch"
>
>  inherit qmake5
> --
> 2.5.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

