Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dasty82@gmail.com>) id 1SXaZ0-0002UM-AY
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 May 2012 18:06:58 +0200
Received: by obhx4 with SMTP id x4so14247313obh.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 May 2012 08:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=Dl7wmh+1MxRanTeYbjZOu4dCMArvx8FBTnjEcdbTohY=;
	b=BZYdO7on2VmIepb1DH76kF1St+kpardaO521FPdKifRzhWevE9mavEdAmoR2bb0Y2I
	V6hNRcyN12otFEgYSolqJ6Hlr8Ab+Sg+jPb6S0qIWuBcjg+phQhzpX2IBzb+3Nfw7fbp
	f5iMvIfdrVo4JcWJge2E08ANFtGhelhqKc9+IRZnZAlMDKZd1TVALkSKA4ZlZ/afTNw5
	zsmx70GSSSvWxwdb4cLwJIMZCZAVc+NlbykOCJvz0Ax/bErbtCVsiAjlJdtABA41rFjt
	O6zjqfsP1sbSnrFJ79ZeCoee9qlihgZ2slLRQqYprRQlQsqaks2Q7V9fUE089J0Yy2v8
	GklQ==
MIME-Version: 1.0
Received: by 10.182.152.73 with SMTP id uw9mr44060obb.0.1337875006422; Thu, 24
	May 2012 08:56:46 -0700 (PDT)
Sender: dasty82@gmail.com
Received: by 10.76.92.66 with HTTP; Thu, 24 May 2012 08:56:46 -0700 (PDT)
In-Reply-To: <1337065211-7593-1-git-send-email-rd@radekdostal.com>
References: <1337065211-7593-1-git-send-email-rd@radekdostal.com>
Date: Thu, 24 May 2012 17:56:46 +0200
X-Google-Sender-Auth: L3ps4Eh7RUrpPIPjDa4ka0wc4TA
Message-ID: <CAOpW-VA3-tZhWt-xTt_ha+3jrwXqm0mxkvmqKUVM0BM9yq4o3Q@mail.gmail.com>
From: Radek Dostal <rd@radekdostal.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] libopus: add libopus_0.9.10
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 24 May 2012 16:06:58 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Koen, any more comments to updated version?

Thanks,
Radek

On Tue, May 15, 2012 at 9:00 AM, Radek Dostal <rd@radekdostal.com> wrote:
> Signed-off-by: Radek Dostal <rd@radekdostal.com>
> ---
> =A0meta-oe/recipes-multimedia/libopus/libopus-fpu.inc | =A0 =A06 ++++++
> =A0.../recipes-multimedia/libopus/libopus_0.9.10.bb =A0 | =A0 20 ++++++++=
++++++++++++
> =A02 files changed, 26 insertions(+), 0 deletions(-)
> =A0create mode 100644 meta-oe/recipes-multimedia/libopus/libopus-fpu.inc
> =A0create mode 100644 meta-oe/recipes-multimedia/libopus/libopus_0.9.10.b=
b
>
> diff --git a/meta-oe/recipes-multimedia/libopus/libopus-fpu.inc b/meta-oe=
/recipes-multimedia/libopus/libopus-fpu.inc
> new file mode 100644
> index 0000000..ed16602
> --- /dev/null
> +++ b/meta-oe/recipes-multimedia/libopus/libopus-fpu.inc
> @@ -0,0 +1,6 @@
> +
> +def get_libopus_fpu_setting(bb, d):
> + =A0 =A0 =A0 if d.getVar('TARGET_FPU', True) in [ 'soft' ]:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return "--enable-fixed-point"
> + =A0 =A0 =A0 return ""
> +
> diff --git a/meta-oe/recipes-multimedia/libopus/libopus_0.9.10.bb b/meta-=
oe/recipes-multimedia/libopus/libopus_0.9.10.bb
> new file mode 100644
> index 0000000..392836f
> --- /dev/null
> +++ b/meta-oe/recipes-multimedia/libopus/libopus_0.9.10.bb
> @@ -0,0 +1,20 @@
> +SUMMARY =3D "Opus Audio Codec"
> +DESCRIPTION =3D "The Opus codec is designed for interactive \
> +speech and audio transmission over the Internet. It is \
> +designed by the IETF Codec Working Group and incorporates \
> +technology from Skype's SILK codec and Xiph.Org's CELT codec."
> +HOMEPAGE =3D "http://www.opus-codec.org/"
> +SECTION =3D "libs/multimedia"
> +LICENSE =3D "BSD"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6d9f9b3714db6bbcfb6e42170d9c6=
64d"
> +
> +SRC_URI =3D "http://downloads.xiph.org/releases/opus/opus-${PV}.tar.gz"
> +SRC_URI[md5sum] =3D "afbda2fd20dc08e6075db0f60297a137"
> +SRC_URI[sha256sum] =3D "4e379a98ba95bbbfe9087ef10fdd05c8ac9060b6d695f587=
ea82a7b43a0df4fe"
> +
> +S =3D "${WORKDIR}/opus-${PV}"
> +
> +inherit autotools pkgconfig
> +
> +require libopus-fpu.inc
> +EXTRA_OECONF =3D "${@get_libopus_fpu_setting(bb, d)}"
> --
> 1.7.5.4
>


