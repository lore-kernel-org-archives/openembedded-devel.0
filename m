Return-Path: <cazfi74@gmail.com>
Received: from mail-qc0-f175.google.com (mail-qc0-f175.google.com
	[209.85.216.175])
	by mail.openembedded.org (Postfix) with ESMTP id DDB7361082
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 May 2013 09:09:09 +0000 (UTC)
Received: by mail-qc0-f175.google.com with SMTP id a1so5246013qcx.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 May 2013 02:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:cc:content-type;
	bh=w5U9p2puKTuCj20/PJHLKwVnFCmdvdxjq+O5mHYu6eg=;
	b=YB0w3WBvsKb/YAtKuirREIXXg2+qsPc7aP+jS7PKCDdgHxivM5Me8EbLa2tcq0y3M6
	1xYyfxaqRAEAZSkldOmPtW20uMqa7i+SZfFLeGH4Dt14tnDBFpk3wuEqbc7COUEzTzKG
	h+IhBM3unhmrU8iVDxIXXDOeJbym176ZW1f5B6QDbYWqziBvMkaqVhcryIQRHDTou7uh
	Mxi7z0e8/rh9V6V2jb7ci022Qg+lQprYgWddePdEzTBhjA5nYgts+fwy5RbG/TQj0h8Z
	6GY3L5vdgJPF0ld/jd+GB7ePZH2wU3CNxIwxhmfYEVfRTe+wpuKfbcgo+IAv/GLJri4I
	vT6g==
MIME-Version: 1.0
X-Received: by 10.49.24.198 with SMTP id w6mr6315040qef.58.1369904950132; Thu,
	30 May 2013 02:09:10 -0700 (PDT)
Received: by 10.224.36.17 with HTTP; Thu, 30 May 2013 02:09:10 -0700 (PDT)
Date: Thu, 30 May 2013 12:09:10 +0300
Message-ID: <CAF6bG8eZ=7__cG4oybJrMKGe57xj6VUGYRo-tRH5rHtosiQD+w@mail.gmail.com>
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe] libmikmod: depend on texinfo
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
X-List-Received-Date: Thu, 30 May 2013 09:09:10 -0000
Content-Type: text/plain; charset=UTF-8

It turned out that this is not specific to automake-1.13, but without
the patch libmikmod build fails even with older automake currently in
OE core. I haven't checked if branches other than master are affected.

 - ML

On 23 May 2013 11:22, Marko Lindqvist <cazfi74@gmail.com> wrote:
> With changed behavior of 'missing' in automake-1.13, libmikmod
> build was failing when makeinfo was not present.
>
> Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
> ---
>  meta-oe/recipes-multimedia/mikmod/libmikmod_3.1.12.bb |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-multimedia/mikmod/libmikmod_3.1.12.bb b/meta-oe/recipes-multimedia/mikmod/libmikmod_3.1.12.bb
> index efef5d2..e6bdcbe 100644
> --- a/meta-oe/recipes-multimedia/mikmod/libmikmod_3.1.12.bb
> +++ b/meta-oe/recipes-multimedia/mikmod/libmikmod_3.1.12.bb
> @@ -3,7 +3,7 @@ SECTION = "libs"
>  LICENSE = "LGPLv2.1"
>  LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=b2b941d484c442e5c031a51463d8e11b"
>
> -DEPENDS = "alsa-lib"
> +DEPENDS = "alsa-lib texinfo"
>
>  SRC_URI = "\
>      ${SOURCEFORGE_MIRROR}/mikmod/libmikmod-${PV}.tar.gz \
> --
> 1.7.10.4
>

