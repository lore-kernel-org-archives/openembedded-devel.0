Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sylvain.pare@gmail.com>) id 1RcxDM-0003gk-AR
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Dec 2011 11:46:32 +0100
Received: by iakh37 with SMTP id h37so6483910iak.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Dec 2011 02:39:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=btnOPojbhEhvRaPf0//s/XsLqsCNi5qZZiM6hvZEkS0=;
	b=H58+vUO/KXiAdLpOnfNJJ8ACF+sIvjcItC+HlxByelI9E5vfE5MxSBGVdjQrSs0Dzv
	Tb5TuzcdTNRsukPlioUu8T2yh5va9tewwsXfQn5vvsF0TPVh1urMFKgIyGdnpC994fe0
	Pqcc2eKWCb3EfvZb3cKR6I6X0ivTMEm1SrWxs=
Received: by 10.50.216.234 with SMTP id ot10mr2057799igc.15.1324377567176;
	Tue, 20 Dec 2011 02:39:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.173.33 with HTTP; Tue, 20 Dec 2011 02:39:05 -0800 (PST)
In-Reply-To: <1324377146-5691-1-git-send-email-sylvain.pare@gmail.com>
References: <1324377146-5691-1-git-send-email-sylvain.pare@gmail.com>
From: =?ISO-8859-1?Q?Sylvain_Par=E9?= <sylvain.pare@gmail.com>
Date: Tue, 20 Dec 2011 11:39:05 +0100
Message-ID: <CACrTVgKhSKLDJ0wfG=7J3dBdGEUpdGXQ-Q6DkjxUr2tbS2nRSg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH v2][meta-oe] vlc: rework dependencies and removed ENTERPRISE_DISTRO as it should be covered by COMMERCIAL_LICENSE now
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
X-List-Received-Date: Tue, 20 Dec 2011 10:46:32 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

My bad, I did not get the point from Martin Jansa.
I will send a new patch

2011/12/20 Sylvain 'GarthPS' Par=E9 <sylvain.pare@gmail.com>

>  * re-adds dropped depends as they are available now
>  * removes ENTERPRISE_DISTRO as sugested by Martin Jansa
>  * and adds libxpm as dependency as current vlc's config depends on it.
>  * bumps PR
>
> Signed-off-by: Sylvain 'GarthPS' Par=E9 <sylvain.pare@gmail.com>
> ---
>  meta-oe/recipes-multimedia/vlc/vlc.inc       |    3 +--
>  meta-oe/recipes-multimedia/vlc/vlc_1.1.11.bb |    2 ++
>  2 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-multimedia/vlc/vlc.inc
> b/meta-oe/recipes-multimedia/vlc/vlc.inc
> index aecfb3a..c431f69 100644
> --- a/meta-oe/recipes-multimedia/vlc/vlc.inc
> +++ b/meta-oe/recipes-multimedia/vlc/vlc.inc
> @@ -4,8 +4,7 @@ LICENSE =3D "GPLv2"
>  SECTION =3D "multimedia"
>
>  DEPENDS =3D "libfribidi libtool libgcrypt gst-plugins-bad virtual/libsdl
> qt4-x11-free dbus libxml2 gnutls tremor faad2 ffmpeg flac \
> -"
> -#           ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'libmad
> libid3tag liba52 mpeg2dec', d)}"
> +           libmad libid3tag liba52 mpeg2dec libxpm"
>
>  SRC_URI =3D "
> http://download.videolan.org/pub/videolan/vlc/${PV}/vlc-${PV}.tar.bz2"
>
> diff --git a/meta-oe/recipes-multimedia/vlc/vlc_1.1.11.bbb/meta-oe/recipe=
s-multimedia/vlc/
> vlc_1.1.11.bb
> index fb69e05..9f53159 100644
> --- a/meta-oe/recipes-multimedia/vlc/vlc_1.1.11.bb
> +++ b/meta-oe/recipes-multimedia/vlc/vlc_1.1.11.bb
> @@ -5,6 +5,8 @@ LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3Ded7e492ee44e70125a5d42e118354a13"
>
>  require vlc.inc
>
> +PR =3D "r1"
> +
>  # work around build failure
>  EXTRA_OECONF +=3D " --enable-libxml2=3Dno"
>
> --
> 1.7.5.4
>
>

