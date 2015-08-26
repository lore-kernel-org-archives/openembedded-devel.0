Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 572E8734B8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Aug 2015 15:44:53 +0000 (UTC)
Received: by iods203 with SMTP id s203so23607111iod.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Aug 2015 08:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=riG1xOyQuXK4jSHprIwRJV43eFk7GtgAzecJg0QaOZI=;
	b=gBsM5rbODYRnRObGl3mF7O7ZUPz7HxQ/KwwfC82DoI+1/rh/DdqKShM+ZsCOjmWUFm
	fQiDSH6hFnQb6SNI1eNpt+nwgFq9rZo75kYDIKVKgW1dya67UpZiPZI7BT2AeaLTyreq
	J9h6z/80g12YQT/ZbmeH/BqsF+lsDGdB2KkjyUjLFU+e4HbiEt2KDCQ7BptiQ8v3Wn6r
	H3MHADlhVxBsrJfYOu3ZyE2rBGVeLmPNsHQKG86SIBXbwyE/9tC8mW2An9fR517nXt8L
	sVnESIVl+zRLDPZzIsOpw5970J+QHOeNcv9M1yx0t//7WqF6TlAuIiNacb4+YvMrqfmd
	Hasg==
MIME-Version: 1.0
X-Received: by 10.107.47.7 with SMTP id j7mr4421498ioo.99.1440603893097; Wed,
	26 Aug 2015 08:44:53 -0700 (PDT)
Received: by 10.36.98.5 with HTTP; Wed, 26 Aug 2015 08:44:53 -0700 (PDT)
In-Reply-To: <1440597598-21246-1-git-send-email-Martin.Jansa@gmail.com>
References: <1439279859-1815-14-git-send-email-schnitzeltony@googlemail.com>
	<1440597598-21246-1-git-send-email-Martin.Jansa@gmail.com>
Date: Wed, 26 Aug 2015 17:44:53 +0200
Message-ID: <CALbNGRTXLuhP+Pvf-RQHYw=frDsXTMCJ5Hrn_OVi1BPp0TCK9g@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-xfce][PATCH] xfce4-icon-theme: remove
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
X-List-Received-Date: Wed, 26 Aug 2015 15:44:53 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 26, 2015 at 3:59 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> * replaced by rodent-icon-theme
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  .../recipes-art/xfce4-icon-theme/xfce4-icon-theme_4.4.3.bb | 14 --------------
>  1 file changed, 14 deletions(-)
>  delete mode 100644 meta-xfce/recipes-art/xfce4-icon-theme/xfce4-icon-theme_4.4.3.bb
>
> diff --git a/meta-xfce/recipes-art/xfce4-icon-theme/xfce4-icon-theme_4.4.3.bb b/meta-xfce/recipes-art/xfce4-icon-theme/xfce4-icon-theme_4.4.3.bb
> deleted file mode 100644
> index 1e4b06b..0000000
> --- a/meta-xfce/recipes-art/xfce4-icon-theme/xfce4-icon-theme_4.4.3.bb
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -SUMMARY = "xfce4 icon theme rodent"
> -SECTION = "x11/wm"
> -LICENSE = "GPLv2"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
> -
> -DEPENDS = "intltool-native xfce4-dev-tools-native"
> -
> -inherit xfce
> -
> -SRC_URI = "http://archive.xfce.org/src/art/${BPN}/${@'${PV}'[0:3]}/${BP}.tar.bz2"
> -SRC_URI[md5sum] = "73ce2977b84f634a6a6c5d9c27e336db"
> -SRC_URI[sha256sum] = "d4786692d56b8a563f66a5f260f1f13ade11e86c78cbcb25a9f9a5fc47cf66fa"
> -
> -FILES_${PN} += "${datadir}/xfce4/mime"
> --
> 2.5.0
>
I am quite sure they're not the same. So please dom't apply this  one

Andreas

