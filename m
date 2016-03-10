Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 955B1605FF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Mar 2016 13:08:36 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id p65so27873250wmp.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Mar 2016 05:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=cNUm3wcs+c9pe6sPLEL7oPwTQKDqDCuYCUWIEwnDPuo=;
	b=rq4M8ryWJnlCcW/6DOfea7JMHBn07NZUVqWNlNZROf9TGiqGg2LbJY4KEImTh0uL92
	mWGjJz98x4whms2x6RAIfVTdXX8mP9ZIUvoJQsm6PrVEIF4GG49zfvI1ZRE9Hbfo5p0+
	bF8v8I4iBmhHXScw9Wk4QU6gIqJVG/b776f9n3F1pFtHxI0giobC9JYay32E2E06brwI
	qxA1NPQ5qe6dGs5qKIpKsf3aW3wov6k0cUpFMviCMWCFMYWMOJEqrxRoBE4zot+7Lrdn
	9lT3uF3/7N9uYgr82xGqgSA0KDNr2YTuReTmunQhq0gVBk8PFpp18+vD4u+tsMgdDz6f
	78yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=cNUm3wcs+c9pe6sPLEL7oPwTQKDqDCuYCUWIEwnDPuo=;
	b=ATixiHn7Y6doPF8M1f1v8PUgKFp218h3KZ4RU/uEVneMBYGBGrdpl4MvjSDVOJ9YFf
	rRK6i8bSSvUVAZ43fMzn5IF5nlbCH//Vb9fRJGQ9/ZrrVS/AP6Lli3VJIcjdl6pd+8v5
	d1SVxOju4kOJHvisij4uFi6ZWzlWbMJqaIUItCrV5WPb4RgMatbEMMUISlHgNpS2HIeE
	j7/eZNR8oKq4+PcjcekSRJ26EgVdxDA1EH+a0mxZqQMGgAOoBIr/5krUAAfbRjLMvIW6
	Z5a6LmT/HlvwXBSpHq65+kqiGZXi2r/fuSlTViN88c6sXwrLGqPjqWM3uB3drYHvpp1K
	BqqQ==
X-Gm-Message-State: AD7BkJKpjb74scWrJpzlKWHh1KS+508rRjne5l2N+qZ9tEps+8FM15aGp8NTeRJyIZTOeQ==
X-Received: by 10.28.238.210 with SMTP id j79mr3911185wmi.23.1457615316617;
	Thu, 10 Mar 2016 05:08:36 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	j10sm3453074wjb.46.2016.03.10.05.08.35
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Mar 2016 05:08:35 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 10 Mar 2016 14:11:34 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160310131134.GF2573@jama>
References: <1457504433-21548-1-git-send-email-gary@mlbassoc.com>
	<20160309191532.GI2542@jama> <56E0FB3F.3020004@mlbassoc.com>
	<20160310073340.GR2542@jama> <56E12501.1070909@mlbassoc.com>
	<CA+chaQfjDkzXNBzMkRQg2xzqh43Ph-+iLQBPi5Rb+F1-C_1Xqg@mail.gmail.com>
	<56E12DC6.3000704@mlbassoc.com> <56E1705F.70104@mlbassoc.com>
MIME-Version: 1.0
In-Reply-To: <56E1705F.70104@mlbassoc.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-oe][PATCH] mpv: Media Player
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
X-List-Received-Date: Thu, 10 Mar 2016 13:08:37 -0000
X-Groupsio-MsgNum: 60464
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Mjqg7Yu+0hL22rav"
Content-Disposition: inline

--Mjqg7Yu+0hL22rav
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 10, 2016 at 02:02:23PM +0100, Gary Thomas wrote:
> On 2016-03-10 09:18, Gary Thomas wrote:
> > On 2016-03-10 08:57, Martin Jansa wrote:
> >> I did and there was still:
> >> FILES_${PN} +=3D "${prefix}"
> >>
> >> that's why I've asked again here.
> >
> > Now I understand why you're asking.  I'll verify that it works correctly
> > without that line, just using the standard packaging.  If so, need I se=
nd
> > another patch revision or can you just leave that one line out when you=
 merge?
>=20
> The answer is yes, it does install to some non-standard paths.  At least =
as
> the configuration currently stands, it needs
>    FILES_${PN} +=3D "${prefix}/etc ${prefix}/share"

Why doesn't it respect ${sysconfdir} and ${datadir}?
Maybe you need to pass more configure flags?

>=20
> >
> >>
> >> On Thu, Mar 10, 2016 at 8:40 AM, Gary Thomas <gary@mlbassoc.com> wrote:
> >>
> >>> On 2016-03-10 08:33, Martin Jansa wrote:
> >>>
> >>>> On Thu, Mar 10, 2016 at 05:42:39AM +0100, Gary Thomas wrote:
> >>>>
> >>>>> On 2016-03-09 20:15, Martin Jansa wrote:
> >>>>>
> >>>>>> On Wed, Mar 09, 2016 at 07:20:33AM +0100, Gary Thomas wrote:
> >>>>>>
> >>>>>>> mpv is a fork of mplayer2 and MPlayer. It shares some features wi=
th
> >>>>>>> the former projects while introducing many more.
> >>>>>>>
> >>>>>>> Signed-off-by: Gary Thomas <gary@mlbassoc.com>
> >>>>>>> ---
> >>>>>>>     meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb | 60
> >>>>>>> ++++++++++++++++++++++++
> >>>>>>>     1 file changed, 60 insertions(+)
> >>>>>>>     create mode 100644 meta-oe/recipes-multimedia/mplayer/mpv_0.1=
5.0.bb
> >>>>>>>
> >>>>>>> diff --git a/meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb
> >>>>>>> b/meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb
> >>>>>>> new file mode 100644
> >>>>>>> index 0000000..37e4b02
> >>>>>>> --- /dev/null
> >>>>>>> +++ b/meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb
> >>>>>>> @@ -0,0 +1,60 @@
> >>>>>>> +SUMMARY =3D "Open Source multimedia player"
> >>>>>>> +SECTION =3D "multimedia"
> >>>>>>> +HOMEPAGE =3D "http://www.mpv.io/"
> >>>>>>> +DEPENDS =3D "zlib ffmpeg jpeg virtual/libx11 xsp libxv libxscrns=
aver"
> >>>>>>> +
> >>>>>>> +# Depends on xsp, libxv, virtual/libx11, libxscrnsaver
> >>>>>>> +REQUIRED_DISTRO_FEATURES =3D "x11"
> >>>>>>> +
> >>>>>>> +LICENSE =3D "GPLv2+"
> >>>>>>> +LIC_FILES_CHKSUM =3D
> >>>>>>> "file://LICENSE;md5=3D91f1cb870c1cc2d31351a4d2595441cb"
> >>>>>>> +
> >>>>>>> +SRC_URI =3D "
> >>>>>>> https://github.com/mpv-player/mpv/archive/v${PV}.tar.gz;name=3Dmp=
v \
> >>>>>>> +
> >>>>>>> http://www.freehackers.org/~tnagy/release/waf-1.8.12;name=3Dwaf \
> >>>>>>> +"
> >>>>>>> +SRC_URI[mpv.md5sum] =3D "9042bd3fbff2bc8ba0b7fadaa4a22101"
> >>>>>>> +SRC_URI[mpv.sha256sum] =3D
> >>>>>>> "7d31217ba8572f364fcea2955733f821374ae6d8c6d8f22f8bc63c44c0400bdc"
> >>>>>>> +SRC_URI[waf.md5sum] =3D "cef4ee82206b1843db082d0b0506bf71"
> >>>>>>> +SRC_URI[waf.sha256sum] =3D
> >>>>>>> "01bf2beab2106d1558800c8709bc2c8e496d3da4a2ca343fe091f22fca60c98b"
> >>>>>>> +
> >>>>>>> +EXTRA_OECONF =3D " \
> >>>>>>> +    --prefix=3D${D}/usr \
> >>>>>>>
> >>>>>> why not ${prefix} and does it really need to be prefixed with ${D}
> >>>>>> (unlike mandir bellow)? Ugly waf.
> >>>>>>
> >>>>>
> >>>> What about ${D}?
> >>>>
> >>>> +    --mandir=3D${mandir} \
> >>>>>>> +    --target=3D${SIMPLE_TARGET_SYS} \
> >>>>>>> +    --disable-gl \
> >>>>>>> +    --disable-libsmbclient \
> >>>>>>> +    --disable-libass \
> >>>>>>> +    --disable-lua \
> >>>>>>> +    --disable-libass-osd \
> >>>>>>> +    --disable-encoding \
> >>>>>>> +    --disable-libbluray \
> >>>>>>> +    --disable-dvdread \
> >>>>>>> +    --disable-dvdnav \
> >>>>>>> +    --disable-cdda \
> >>>>>>> +    --disable-enca \
> >>>>>>> +    --disable-libguess \
> >>>>>>> +    --disable-uchardet \
> >>>>>>> +    --disable-rubberband \
> >>>>>>> +    --disable-lcms2 \
> >>>>>>> +    --disable-vapoursynth \
> >>>>>>> +    --disable-vapoursynth-lazy \
> >>>>>>> +    --enable-libarchive \
> >>>>>>> +"
> >>>>>>> +
> >>>>>>> +do_configure() {
> >>>>>>> +    if [ ! -L ../waf ]; then
> >>>>>>> +        chmod a+x ../waf-1.8.12
> >>>>>>> +       ln -s waf-1.8.12 ../waf
> >>>>>>> +    fi
> >>>>>>> +    ../waf configure ${EXTRA_OECONF}
> >>>>>>> +}
> >>>>>>> +
> >>>>>>> +do_compile () {
> >>>>>>> +    ../waf build
> >>>>>>> +}
> >>>>>>> +
> >>>>>>> +do_install() {
> >>>>>>> +    ../waf install
> >>>>>>> +}
> >>>>>>> +
> >>>>>>> +FILES_${PN} +=3D "/usr/"
> >>>>>>>
> >>>>>>
> >>>>>> ${prefix}?
> >>>>>>
> >>>>>> Does it install files in strange directories not covered by standa=
rd
> >>>>>> FILES?
> >>>>>>
> >>>>>>
> >>>>> Use of ${prefix} does seem correct, I've updated the recipe.
> >>>>> Patch v2 has been dispatched, including a required update to
> >>>>> the libass package which was necessary to get a fully functional
> >>>>> mpv.
> >>>>>
> >>>>
> >>>> Does it install files in strange directories not covered by standard
> >>>> FILES?
> >>>>
> >>>
> >>> No, but it doesn't seem to have any notion of adjusting the install
> >>> directory except at configure time, hence ${D}${prefix}
> >>>
> >>> Please refer to the new patchset to see how I've changed the recipe.
> >>>
> >
>=20
>=20
> --=20
> ------------------------------------------------------------
> Gary Thomas                 |  Consulting for the
> MLB Associates              |    Embedded world
> ------------------------------------------------------------
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Mjqg7Yu+0hL22rav
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbhcoUACgkQN1Ujt2V2gBwsTgCgm8trnNMJ8lGeyOM76pTkYMjD
nKEAmQGA6N+DkC0LV3HoGr8/jx2AMLoE
=hED5
-----END PGP SIGNATURE-----

--Mjqg7Yu+0hL22rav--
