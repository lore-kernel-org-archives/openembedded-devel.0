Return-Path: <stephen.arnold42@gmail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id BF7C46B7F9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jun 2014 02:05:15 +0000 (UTC)
Received: by mail-wi0-f169.google.com with SMTP id hi2so3392311wib.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Jun 2014 19:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=+hpQMLn55vMClrQasfZSGGMUqYxwelfUqFh2ELEZS28=;
	b=PQi5s6+fUuGwg/NYQZ+pPtRShSf1k0wztM1UAWZCil72XAxYjwt/tpiVo1E3Wy4epp
	wDww0HOoQiAe53K67mnMQFmJEgU1l3NWr5se8YA/QKZY787m0sQN5v/aljuWd9U+aNc/
	ddBMyuCQnaqDXOQB2Z08RcDUOCGj51pSydUkF2RAFU/Yy5waR91ed+VQksTkV7pkoKuL
	lxM1C2vc3SXAlOB04SN+ZM5vsT/eR7CB80NnG+5Lfax35Pwoo49SYEs+Kq1GkfOBxW/u
	r8YY5KMXNN8QSmNWv33N2YkuHR9NP09MJlXag3MadxbFum/ABRdGfTyXakimioK2qsk0
	DZhw==
MIME-Version: 1.0
X-Received: by 10.180.8.136 with SMTP id r8mr21968661wia.60.1403489116430;
	Sun, 22 Jun 2014 19:05:16 -0700 (PDT)
Received: by 10.194.34.65 with HTTP; Sun, 22 Jun 2014 19:05:16 -0700 (PDT)
In-Reply-To: <1403171993-26208-4-git-send-email-Martin.Jansa@gmail.com>
References: <1403171993-26208-1-git-send-email-Martin.Jansa@gmail.com>
	<1403171993-26208-4-git-send-email-Martin.Jansa@gmail.com>
Date: Sun, 22 Jun 2014 19:05:16 -0700
Message-ID: <CAOLEWZU2OoLJw9zfyry4=Ju6qqxTF1NuntTCnxvBwjsE9d-BJA@mail.gmail.com>
From: Stephen Arnold <stephen.arnold42@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][WIP][PATCH 04/25] imlib2, mcnavi: Blacklist because of broken imlib2 after freetype2-config was removed
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
X-List-Received-Date: Mon, 23 Jun 2014 02:05:17 -0000
Content-Type: text/plain; charset=UTF-8

This one doesn't build with the pkg-config trick; it needs more help than
that...  The attached bbappend is what works for me, after removing the
blacklist.

Steve


On Thu, Jun 19, 2014 at 2:59 AM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-efl/recipes-efl/efl/imlib2_svn.bb             | 2 ++
>  meta-efl/recipes-navigation/mcnavi/mcnavi_0.3.4.bb | 2 ++
>  2 files changed, 4 insertions(+)
>
> diff --git a/meta-efl/recipes-efl/efl/imlib2_svn.bb
> b/meta-efl/recipes-efl/efl/imlib2_svn.bb
> index 8bd8032..9806de7 100644
> --- a/meta-efl/recipes-efl/efl/imlib2_svn.bb
> +++ b/meta-efl/recipes-efl/efl/imlib2_svn.bb
> @@ -7,6 +7,8 @@ PROVIDES = "virtual/imlib2"
>  PV = "1.4.5+svnr${SRCPV}"
>  SRCREV = "${EFL_SRCREV}"
>
> +PNBLACKLIST[imlib2] = "BROKEN: needs to be updated to use freetype2
> pkg-config"
> +
>  inherit efl binconfig
>  SRC_URI = "${E_SVN}/trunk;module=${SRCNAME};protocol=http;scmdata=keep"
>  S = "${WORKDIR}/${SRCNAME}"
> diff --git a/meta-efl/recipes-navigation/mcnavi/mcnavi_0.3.4.bb
> b/meta-efl/recipes-navigation/mcnavi/mcnavi_0.3.4.bb
> index d07b143..1a6e4a0 100644
> --- a/meta-efl/recipes-navigation/mcnavi/mcnavi_0.3.4.bb
> +++ b/meta-efl/recipes-navigation/mcnavi/mcnavi_0.3.4.bb
> @@ -4,6 +4,8 @@ LICENSE = "GPLv3"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=8f0e2cd40e05189ec81232da84bd6e1a"
>  DEPENDS = "ecore evas imlib2 gpsd edje edje-native mysql5"
>
> +PNBLACKLIST[mcnavi] = "BROKEN: depends on broken imlib2"
> +
>  SRC_URI = "
> http://www.gps-routes.info/debian/pool/main/m/mcnavi/mcnavi_${PV}.tar.gz"
>  SRC_URI[md5sum] = "6860cde5c02a9f93c829da4b10e5a226"
>  SRC_URI[sha256sum] =
> "ee7f65155e91386175875fc4f72f4bc94e4e9cdb8258112632da94520ef2c349"
> --
> 2.0.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

