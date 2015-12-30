Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id D2C2B6FFCC
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Dec 2015 16:49:10 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id f206so84283317wmf.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Dec 2015 08:49:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=drnr2EeFBPCRCDtrRvmrMBNbaE+nwUZ3cZws0vAiOKU=;
	b=oxBT7X4LJL7mr2f9EWzvsBUFV4KOrta010AibQQql3fUKD5SgkUKeYmxNoslYgLElh
	pba7y5nTuLrR3hFzbcmssa7lI+RbHaJtOHRmjfVq1wvUEYTv60rDsyFUfjdlG57gtk8N
	WRPCUN7Cbc6aPrPLkkV1gfgjrNYD70f6vcIxfayekCcAwxoSN3uXoEAzrayUvdTSny8t
	xRM+gBfyNX2tPm3xCs1aTrIiuT6H+M2sLt09B1M3HFyeGLbs+k4pYJvTODUr2JFuz7l6
	Mer5x4MabN0zJlvC6kQrqi6QBIgTAslDzDU4aX9bjHpyLATLd2etBE6PbIyQxbEISTUh
	jldQ==
X-Received: by 10.28.55.209 with SMTP id e200mr17771028wma.2.1451494151270;
	Wed, 30 Dec 2015 08:49:11 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	e136sm58170502wma.23.2015.12.30.08.49.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Dec 2015 08:49:10 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 30 Dec 2015 17:52:46 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151230165246.GE2263@jama>
References: <56837748.6020903@gmail.com>
MIME-Version: 1.0
In-Reply-To: <56837748.6020903@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: chromium 40.0.2214.91 doesn't like gcc5.3
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
X-List-Received-Date: Wed, 30 Dec 2015 16:49:13 -0000
X-Groupsio-MsgNum: 59226
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PPYy/fEw/8QCHSq3"
Content-Disposition: inline

--PPYy/fEw/8QCHSq3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 30, 2015 at 01:18:48AM -0500, Trevor Woerner wrote:
> I noticed the recent gcc update from 5.2 to 5.3 in openembedded-core
> seems to cause meta-browser's chromium build to fail with more warnings
> being treated as errors. My MACHINE is intel-corei7-64, but I'm guessing
> this probably happens on other architectures too.
>=20
> Is anyone looking at this?
>=20
> Is there any talk about this upstream?

It was fixed for gcc-5.2 with this patch:
http://lists.openembedded.org/pipermail/openembedded-devel/2015-November/10=
4327.html

I'm surprised that it doesn't work with 5.3, but I can confirm the same
failures in latest "bitbake world" builds.

>=20
> Build Configuration:
> BB_VERSION        =3D "1.28.0"
> BUILD_SYS         =3D "x86_64-linux"
> NATIVELSBSTRING   =3D "openSUSE-project-13.2"
> TARGET_SYS        =3D "x86_64-fortress-linux"
> MACHINE           =3D "intel-corei7-64"
> DISTRO            =3D "fortress"
> DISTRO_VERSION    =3D "0.1"
> TUNE_FEATURES     =3D "m64 corei7"
> TARGET_FPU        =3D ""
> meta              =3D "master:1568f4fa1c8f8abd9b365ecd264841cd4f6b66b1"
> meta-yocto-bsp  =20
> meta-yocto        =3D "master:9b392ef494f3fee9b85ee9e37ad700781e32e636"
> meta-intel        =3D "master:ac56397b913e9f2ccc7d6cf5a1a5a9002b619671"
> meta-oe         =20
> meta-gnome      =20
> meta-python     =20
> meta-networking   =3D
> "contrib/twoerner/nodejs_v4:40b9f35fa3b4361ca53dbb91d2552f2eae6af460"
> meta-browser      =3D "master:bb799af123f1361767885d5b8f7e14b334d3fd7a"
>=20
>=20
>=20
> | FAILED: x86_64-fortress-linux-g++  -m64 -march=3Dcorei7 -mtune=3Dcorei7
> -mfpmath=3Dsse -msse4.2
> --sysroot=3D/z/layerindex-master/minnowmax/tmp/sysroots/intel-corei7-64
> -MMD -MF obj/third_party/WebKit/Source/wtf/dtoa/wtf.bignum.o.d
> -DV8_DEPRECATION_WARNINGS -D_FILE_OFFSET_BITS=3D64 -DDISABLE_NACL
> -DCHROMIUM_BUILD -DTOOLKIT_VIEWS=3D1 -DUI_COMPOSITOR_IMAGE_TRANSPORT
> -DUSE_AURA=3D1 -DUSE_ASH=3D1 -DUSE_PANGO=3D1 -DUSE_CAIRO=3D1
> -DUSE_DEFAULT_RENDER_THEME=3D1 -DUSE_LIBJPEG_TURBO=3D1 -DUSE_X11=3D1
> -DUSE_CLIPBOARD_AURAX11=3D1 -DENABLE_ONE_CLICK_SIGNIN
> -DENABLE_PRE_SYNC_BACKUP -DUSE_XI2_MT=3D2 -DENABLE_REMOTING=3D1
> -DENABLE_WEBRTC=3D1 -DENABLE_PEPPER_CDMS -DENABLE_CONFIGURATION_POLICY
> -DENABLE_NOTIFICATIONS -DUSE_UDEV -DDONT_EMBED_BUILD_METADATA
> -DENABLE_TASK_MANAGER=3D1 -DENABLE_EXTENSIONS=3D1 -DENABLE_PLUGINS=3D1
> -DENABLE_SESSION_SERVICE=3D1 -DENABLE_THEMES=3D1 -DENABLE_AUTOFILL_DIALOG=
=3D1
> -DENABLE_BACKGROUND=3D1 -DENABLE_GOOGLE_NOW=3D1 -DCLD_VERSION=3D2
> -DCLD2_DATA_SOURCE=3Dstatic -DENABLE_PRINTING=3D1 -DENABLE_BASIC_PRINTING=
=3D1
> -DENABLE_PRINT_PREVIEW=3D1 -DENABLE_SPELLCHECK=3D1
> -DENABLE_CAPTIVE_PORTAL_DETECTION=3D1 -DENABLE_APP_LIST=3D1
> -DENABLE_SETTINGS_APP=3D1 -DENABLE_MANAGED_USERS=3D1 -DENABLE_MDNS=3D1
> -DENABLE_SERVICE_DISCOVERY=3D1 -DENABLE_LOAD_COMPLETION_HACKS=3D1
> -DWTF_IMPLEMENTATION=3D1 -DENABLE_OPENTYPE_VERTICAL=3D1
> -DENABLE_LAYOUT_UNIT_IN_INLINE_BOXES=3D0
> -DWTF_USE_CONCATENATED_IMPULSE_RESPONSES=3D1
> -DENABLE_INPUT_MULTIPLE_FIELDS_UI=3D1 -DENABLE_WEB_AUDIO=3D1
> -DWTF_USE_WEBAUDIO_FFMPEG=3D1 -DWTF_USE_DEFAULT_RENDER_THEME=3D1
> -DU_USING_ICU_NAMESPACE=3D0 -DU_ENABLE_DYLOAD=3D0 -DU_STATIC_IMPLEMENTATI=
ON
> -DUSE_LIBPCI=3D1 -DUSE_GLIB=3D1 -DUSE_NSS=3D1 -D__STDC_CONSTANT_MACROS
> -D__STDC_FORMAT_MACROS -DNDEBUG -DNVALGRIND
> -DDYNAMIC_ANNOTATIONS_ENABLED=3D0 -D_FORTIFY_SOURCE=3D2 -Igen
> -I../../third_party/WebKit/Source -I../../third_party/WebKit
> -I../../third_party/icu/source/i18n
> -I../../third_party/icu/source/common -fstack-protector
> --param=3Dssp-buffer-size=3D4 -Werror -pthread -fno-strict-aliasing -Wall
> -Wno-unused-parameter -Wno-missing-field-initializers
> -fvisibility=3Dhidden -pipe -fPIC
> -B/z/layerindex-master/minnowmax/tmp/work/corei7-64-fortress-linux/chromi=
um/40.0.2214.91-r0/chromium-40.0.2214.91/third_party/binutils/Linux_x64/Rel=
ease/bin
> -Wno-unused-local-typedefs -m64 -march=3Dx86-64 -O2 -fno-ident
> -fdata-sections -ffunction-sections -funwind-tables
> -Wno-error=3Dunused-local-typedefs -O2 -pipe -g
> -feliminate-unused-debug-types -fvisibility-inlines-hidden
> -Wno-c++0x-compat -fno-exceptions -fno-rtti -fno-threadsafe-statics
> -fvisibility-inlines-hidden -Wsign-compare -Wno-c++0x-compat
> -std=3Dgnu++11 -Wno-narrowing -Wno-literal-suffix  -c
> ../../third_party/WebKit/Source/wtf/dtoa/bignum.cc -o
> obj/third_party/WebKit/Source/wtf/dtoa/wtf.bignum.o
> | ../../third_party/WebKit/Source/wtf/dtoa/bignum.cc: In member function
> 'void WTF::double_conversion::Bignum::Align(const
> WTF::double_conversion::Bignum&)':
> | ../../third_party/WebKit/Source/wtf/dtoa/bignum.cc:715:31: error:
> assuming signed overflow does not occur when simplifying conditional to
> constant [-Werror=3Dstrict-overflow]
> |              for (int i =3D 0; i < zero_digits; ++i) {
> |                                ^
> | ../../third_party/WebKit/Source/wtf/dtoa/bignum.cc:715:31: error:
> assuming signed overflow does not occur when simplifying conditional to
> constant [-Werror=3Dstrict-overflow]
> | ../../third_party/WebKit/Source/wtf/dtoa/bignum.cc: In member function
> 'void
> WTF::double_conversion::Bignum::AssignDecimalString(WTF::double_conversio=
n::Vector<const
> char>)':
> | ../../third_party/WebKit/Source/wtf/dtoa/bignum.cc:105:10: error:
> assuming signed overflow does not occur when assuming that (X + c) < X
> is always false [-Werror=3Dstrict-overflow]
> |      void Bignum::AssignDecimalString(Vector<const char> value) {
> |           ^
> | cc1plus: all warnings being treated as errors
> | ninja: build stopped: subcommand failed.
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--PPYy/fEw/8QCHSq3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlaEC90ACgkQN1Ujt2V2gBwIhgCeOxDoVqNGXE71zsaVrK7+yELQ
+qkAoKIPfFDqAB+KV4SKyR4I5lfvjbuT
=sbDI
-----END PGP SIGNATURE-----

--PPYy/fEw/8QCHSq3--
