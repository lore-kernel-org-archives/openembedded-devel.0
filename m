Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id 3BE5277043
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Oct 2015 20:00:50 +0000 (UTC)
Received: by wicgb1 with SMTP id gb1so72018613wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 03 Oct 2015 13:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=+2JvDLb4SOMmSHUjCtOwG+4IRvJgVnj9NJS7Rd69EiY=;
	b=WElk42EmzNO1LMiVEGYgYEHTqu4RMu+pmBU58CXsX4SqRYo8cGZEJVZJNAB3EbRylQ
	kVJkFvxRc8+ichdmLBBWEmd3OSxtSPEww1T09aYKHOEUMhTxVBEOOoKsPNtq6bN5Pbri
	0GkI4l58rpUQnzBCv+1cOConBjxto+6FPC4OReztLPaRpdkHjNYXLxTBCMAzxBZCOOrp
	YE4X/14syQzVyDv/oGOKZz4iNjmkMMb+noHA2r52/RAbU7W7dlPX6X34/IXSPtBNE1M8
	I5qAY8/PrXUk173stcGy0QPOUUPGy6bntxMJDBxg4IWTZ3wNvaJx1q7kvjbok5z8QPvZ
	MgUg==
MIME-Version: 1.0
X-Received: by 10.194.62.112 with SMTP id x16mr22063665wjr.20.1443902450107;
	Sat, 03 Oct 2015 13:00:50 -0700 (PDT)
Received: by 10.194.159.102 with HTTP; Sat, 3 Oct 2015 13:00:50 -0700 (PDT)
In-Reply-To: <1443890451-20749-1-git-send-email-manuel.bachmann@iot.bzh>
References: <1443890451-20749-1-git-send-email-manuel.bachmann@iot.bzh>
Date: Sat, 3 Oct 2015 22:00:50 +0200
Message-ID: <CA+chaQeWM15GkaVGGWsn_XYHVfBAV_f4DmzPkA7DZGnHvC7A-A@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH][meta-multimedia] mkvtoolnix: fix Boost 1.58 build, update to 7.9.0
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
X-List-Received-Date: Sat, 03 Oct 2015 20:00:53 -0000
Content-Type: text/plain; charset=UTF-8

List all submodules in SRC_URI, we shouldn't bypass bitbake fetcher in
do_configure.

On Sat, Oct 3, 2015 at 6:40 PM, Manuel Bachmann <manuel.bachmann@iot.bzh>
wrote:

> mkvtoolnix does not compile with newest Boost 1.58, mostly
> due to the following bugs :
> https://github.com/mbunkus/mkvtoolnix/issues/1172
> https://github.com/mbunkus/mkvtoolnix/issues/1176
>
> Update to the version immediately subsequent to their
> fixes, and adapt configure steps accordingly.
>
> Signed-off-by: Manuel Bachmann <manuel.bachmann@iot.bzh>
> ---
>  meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb
> b/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb
> index dd613b3..223b4ed 100644
> --- a/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb
> +++ b/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb
> @@ -6,8 +6,8 @@ LIC_FILES_CHKSUM =
> "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>
>  DEPENDS = "curl boost expat zlib libebml libmatroska libogg libvorbis
> bzip2 lzo file ruby-native"
>
> -PV = "7.1.0+git${SRCPV}"
> -SRCREV = "0c89ff941bfdd9f3378312f293a84f13cf3e2a96"
> +PV = "7.9.0+git${SRCPV}"
> +SRCREV = "1a8b23b1e82ed180a5aaeb43537f2426be252985"
>  SRC_URI = "git://github.com/mbunkus/mkvtoolnix.git"
>
>  S = "${WORKDIR}/git"
> @@ -28,7 +28,9 @@ EXTRA_OECONF = " --with-boost-libdir=${STAGING_LIBDIR} \
>
>  # remove some hardcoded searchpaths
>  do_configure_prepend() {
> -    sed -i -e s:/usr/local/lib:${STAGING_LIBDIR}:g -e
> s:/usr/local/include:${STAGING_INCDIR}:g ${S}/ac/ebml.m4
> +    sed -i -e s:/usr/local/lib:${STAGING_LIBDIR}:g -e
> s:/usr/local/include:${STAGING_INCDIR}:g ${S}/ac/qt5.m4
> +    git submodule init
> +    git submodule update
>  }
>
>  # Yeah, no makefile
> --
> 1.8.3.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

