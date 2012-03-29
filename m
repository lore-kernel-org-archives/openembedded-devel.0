Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SD8zz-0008Ok-AK
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Mar 2012 08:38:19 +0200
Received: by iaag37 with SMTP id g37so2606595iaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Mar 2012 23:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=nvZFdmZK/soQP30I5zayXuoK11OWhpjg/IgyYqiiLfI=;
	b=tNv0ZwaY6k0NIlfyE+kU6RQikytFcIwHNwTreAMRUrPhkhN4R2T7AthhnxJRcM44gX
	jE4yP2tJfg0tJCFxPnssZUXMWL2eRqtfwMJHiiNFOqUUGGtQzOk+sbyhRiK6egcxlsV5
	pjXyjTdqR4XEmkSr53U+B1pOtrXnddeAJh+JUBdfMnlEIMlkRgceQLArA8yJPLrDOjLC
	YmyZAiOSO3ARe4u6gvdb49I5vaewCw+ADqxuLwcS02cTtl42JkGUVkNL4rMMtEMwSg/W
	DkeiOVgJnE/eKx5vDE5hFrOZlFGoyuY4c5FzXYMlmsgPDQHznLTpgUiOdln55HZhXkTk
	DmLg==
MIME-Version: 1.0
Received: by 10.50.104.137 with SMTP id ge9mr649893igb.0.1333002555853; Wed,
	28 Mar 2012 23:29:15 -0700 (PDT)
Received: by 10.42.165.137 with HTTP; Wed, 28 Mar 2012 23:29:15 -0700 (PDT)
In-Reply-To: <1332969613-445-1-git-send-email-obi@opendreambox.org>
References: <1332969613-445-1-git-send-email-obi@opendreambox.org>
Date: Thu, 29 Mar 2012 08:29:15 +0200
Message-ID: <CALbNGRSbH0aoR3BY3=kUM_KZfz2QVyvPMdrkwCR7zMv5qshCJg@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] faad2: create -staticdev packages
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
X-List-Received-Date: Thu, 29 Mar 2012 06:38:19 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 28, 2012 at 11:20 PM, Andreas Oberritter
<obi@opendreambox.org> wrote:
> * Fixes QA warnings:
>
> | faad2-2.7: non -staticdev package contains static .a library: libfaad-d=
ev
> | faad2-2.7: non -staticdev package contains static .a library: libmp4ff-=
dev
>
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> ---
> =A0meta-oe/recipes-multimedia/faad2/faad2_2.7.bb | =A0 10 ++++++----
> =A01 files changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/meta-oe/recipes-multimedia/faad2/faad2_2.7.bb b/meta-oe/reci=
pes-multimedia/faad2/faad2_2.7.bb
> index 462837f..3a64b6b 100644
> --- a/meta-oe/recipes-multimedia/faad2/faad2_2.7.bb
> +++ b/meta-oe/recipes-multimedia/faad2/faad2_2.7.bb
> @@ -1,6 +1,7 @@
> =A0DESCRIPTION =3D "Library for reading some sort of media format."
> =A0SECTION =3D "libs"
> =A0LICENSE =3D "GPLv2"
> +PR =3D "r1"
>
> =A0LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D381c8cbe277a7bc1ee2ae6083a0=
4c958"
>
> @@ -12,13 +13,14 @@ SRC_URI =3D "${SOURCEFORGE_MIRROR}/faac/faad2-src/faa=
d2-${PV}/${PN}-${PV}.tar.bz2;
> =A0SRC_URI[faad2.md5sum] =3D "4c332fa23febc0e4648064685a3d4332"
> =A0SRC_URI[faad2.sha256sum] =3D "14561b5d6bc457e825bfd3921ae50a6648f377a9=
396eaf16d4b057b39a3f63b5"
>
> -PACKAGES =3D+ "libfaad libfaad-dev libmp4ff libmp4ff-dev"
> +PACKAGES =3D+ "libfaad libfaad-dev libfaad-staticdev libmp4ff libmp4ff-d=
ev libmp4ff-staticdev"
>
> =A0FILES_${PN} =3D "${bindir}/faad"
>
> =A0FILES_libfaad =3D "${libdir}/libfaad.so.*"
> -FILES_libfaad-dev =3D "${libdir}/libfaad.so ${libdir}/libfaad.la ${libdi=
r}/libfaad.a ${includedir}/faad.h"
> +FILES_libfaad-dev =3D "${libdir}/libfaad.so ${libdir}/libfaad.la ${inclu=
dedir}/faad.h"
> +FILES_libfaad-staticdev =3D "${libdir}/libfaad.a"
>
> =A0FILES_libmp4ff =3D "${libdir}/libmp4ff.so.*"
> -FILES_libmp4ff-dev =3D "${libdir}/libmp4ff.so ${libdir}/libmp4ff.la ${li=
bdir}/libmp4ff.a ${includedir}/mp4ff.h"
> -
> +FILES_libmp4ff-dev =3D "${libdir}/libmp4ff.so ${libdir}/libmp4ff.la ${in=
cludedir}/mp4ff.h"
> +FILES_libmp4ff-staticdev =3D "${libdir}/libmp4ff.a"
> --
Looks like

http://patches.openembedded.org/patch/24713/

Andreas


