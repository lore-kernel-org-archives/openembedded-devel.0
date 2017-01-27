Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id C72D477357
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jan 2017 16:36:42 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id r126so59366191wmr.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jan 2017 08:36:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=ErsIB2M9hZ16/iuv601Pnv0wKn+RMop0h9R/FncRWNs=;
	b=mIWsvMmPyJKeDAaRz//KqVtKwm5Jfou5NNU7KvV5oRSz7poPIqQRhI79qb5YSuuytQ
	fYMdjr5e8feYYk3AUAxa4jwB6QjTVLS+fdwcCbXdiw5rpzpX4jc14xtUcyEOCXzTxIT4
	tkx6Xw0jqUXDMAL20L1NWMer0hNVtoxamFuPiB3H3YOaZTNDdugLmcZOL4DougQS5cP6
	Vt+3dP/bUDLVfft+fCkKIc0g3aRoKBaw/C2MyViJBhzrctR0BecQCc8h1SZ133A7M+ZL
	quVk+hWWFsFvIMTvBw8WYriiJEUkUxSCdw0cEsLwxFKHji8/94pzzUzsOv8YFKKTqLKi
	xtJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=ErsIB2M9hZ16/iuv601Pnv0wKn+RMop0h9R/FncRWNs=;
	b=JN+KeLiFskRowaT9Q4Y5N+Xh9pF4I71maPzl62BJcUxkIu2Onc/w25j3lDJe6Eikic
	mWO9a3b26wzsC9JyTdLlLpziKBVnA0BJgRvvCKNjneEqlU9z/hOg5WUfq4BuJAp1q8F6
	YP6HOj4CkurVtr4ctsCcqntLmM8RFgkuLGONY61Aot3Vvxw+nn3LCAsSYtkpjGH/nFxO
	l8yWOn1pLM5+Srh6PW6S3WqSYDlbKsbRhfVQrSfawDXxQ3Dt70ve+oR9OvT6yb2I2Ieg
	vn39ekpcOh+SoLYNLy8HHhpyCCe9tcCogzcRRMKvjDPhjQj32TydA23EGXbf5bnVoJqJ
	tDcQ==
X-Gm-Message-State: AIkVDXKiR7aLMPSC6Pug/k408pMkNE2GCjYg4BXNTIvH5ez8XfvvZsvflW4l4osISkjDmg==
X-Received: by 10.28.109.218 with SMTP id b87mr3701628wmi.52.1485535002309;
	Fri, 27 Jan 2017 08:36:42 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	l37sm8687692wrc.41.2017.01.27.08.36.41
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 27 Jan 2017 08:36:41 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 27 Jan 2017 17:36:42 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20170127163642.GA9282@jama>
References: <1485442490-2464-1-git-send-email-samuli.piippo@qt.io>
	<20170126200338.GC3016@jama>
MIME-Version: 1.0
In-Reply-To: <20170126200338.GC3016@jama>
User-Agent: Mutt/1.7.2 (2016-11-26)
Subject: Re: [meta-qt5][PATCH v6] Upgrade to Qt 5.8
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
X-List-Received-Date: Fri, 27 Jan 2017 16:36:43 -0000
X-Groupsio-MsgNum: 64908
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OgqxwSJOaUobr8KG"
Content-Disposition: inline

--OgqxwSJOaUobr8KG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 26, 2017 at 09:03:38PM +0100, Martin Jansa wrote:
> On Thu, Jan 26, 2017 at 04:54:50PM +0200, Samuli Piippo wrote:
> > The linux-oe-g++ mkspec is changed to use $$(...) operator to obtain
> > the contents of an environment value when qmake is run instead of when
> > Makefile is processed. All OE_QMAKE_xxx variables need to be exported
> > for qmake to find them. configure's setBootstrapVariable function needs
> > to change $$(..) to normal $(...) operator to work with qmake's Makefil=
e.
> >=20
> > qt.conf generation for qtbase recipes is not needed, as configure will
> > generate its own version based on configure arguments. Skip running
> > qmake, since configure is now automatically invoked when it's run in
> > qtbase's root folder.
> >=20
> > Update PACKAGECONFIGs for qtbase to match current configure options.
> >=20
> > The new Qt configuration system [1] can be used with a new variable
> > EXTRA_QMAKEVARS_CONFIGURE, which takes both command line and feature
> > arguments.
> >=20
> > Merge the two qtwayland recipes to one that supports all three targets
> > (target, native, nativesdk) without need for additional patch.
> >=20
> > Recipes for new Qt modules: QtSCXML, QtNetworkAuth, QtGamepad.
> > Removes qtdeclarative-render2d
>=20
> Thanks this resolved the -no-alsa issue, now it failing a bit further
> with:
>=20
> |
> /OE/build/oe-core/tmp-glibc/work/i586-oe-linux/qtwebkit/5.8.0+gitAUTOINC+=
74ac5b0f34-r0/git/Source/ThirdParty/ANGLE/src/compiler/preprocessor/Tokeniz=
er.l:2779:26:
> error: 'yylex_destroy' was not declared in this scope
>=20
> which might be caused by flex upgrade as I'm seeing similar issues in
> other recipes and Khem reported the same here:
> http://lists.openembedded.org/pipermail/openembedded-core/2017-January/13=
1555.html
> and Patrick here:
> http://lists.openembedded.org/pipermail/openembedded-core/2017-January/13=
1326.html
>=20
> Hopefully there will be upgrade to flex-2.6.3 to test this completely.

After reverting flex-2.6.2 upgrade I was able to build most of the qt
recipes for qemux86 (the complete bitbake world build is still running
on jenkins slaves will send report e-mail someday next week).

The only exception is qtwebengine which fails like this:
| [12/10222] LINK character_data_generator
| FAILED: character_data_generator
| g++ -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -Wl,-z,now -Wl,-z,relr=
o -Wl,-z,defs -pthread -Wl,-z,noexecstack -fPIC -Wl,--disable-new-dtags -Wl=
,-O1 -Wl,--as-needed -Wl,--gc-sections -Wl,--no-as-needed -lpthread -Wl,--a=
s-needed -o character_data_generator -Wl,--start-group obj.host/src/3rdpart=
y/chromium/third_party/WebKit/Source/platform/text/character_data_generator=
=2ECharacterPropertyDataGenerator.o obj.host/src/3rdparty/chromium/third_pa=
rty/icu/libicuuc.a -Wl,--end-group
| /usr/lib/gcc/x86_64-pc-linux-gnu/6.2.0/../../../../x86_64-pc-linux-gnu/bi=
n/ld: i386 architecture of input file `obj.host/src/3rdparty/chromium/third=
_party/icu/source/common/icuuc.utrie2_builder.o' is incompatible with i386:=
x86-64 output
| /usr/lib/gcc/x86_64-pc-linux-gnu/6.2.0/../../../../x86_64-pc-linux-gnu/bi=
n/ld: i386 architecture of input file `obj.host/src/3rdparty/chromium/third=
_party/icu/source/common/icuuc.utrie2.o' is incompatible with i386:x86-64 o=
utput
| /usr/lib/gcc/x86_64-pc-linux-gnu/6.2.0/../../../../x86_64-pc-linux-gnu/bi=
n/ld: i386 architecture of input file `obj.host/src/3rdparty/chromium/third=
_party/icu/source/common/icuuc.utrie.o' is incompatible with i386:x86-64 ou=
tput
| /usr/lib/gcc/x86_64-pc-linux-gnu/6.2.0/../../../../x86_64-pc-linux-gnu/bi=
n/ld: i386 architecture of input file `obj.host/src/3rdparty/chromium/third=
_party/icu/source/common/icuuc.cmemory.o' is incompatible with i386:x86-64 =
output
| /usr/lib/gcc/x86_64-pc-linux-gnu/6.2.0/../../../../x86_64-pc-linux-gnu/bi=
n/ld: i386 architecture of input file `obj.host/src/3rdparty/chromium/third=
_party/icu/source/common/icuuc.ucol_swp.o' is incompatible with i386:x86-64=
 output
| /usr/lib/gcc/x86_64-pc-linux-gnu/6.2.0/../../../../x86_64-pc-linux-gnu/bi=
n/ld: i386 architecture of input file `obj.host/src/3rdparty/chromium/third=
_party/icu/source/common/icuuc.udataswp.o' is incompatible with i386:x86-64=
 output
| /usr/lib/gcc/x86_64-pc-linux-gnu/6.2.0/../../../../x86_64-pc-linux-gnu/bi=
n/ld: i386 architecture of input file `obj.host/src/3rdparty/chromium/third=
_party/icu/source/common/icuuc.uinvchar.o' is incompatible with i386:x86-64=
 output
| /usr/lib/gcc/x86_64-pc-linux-gnu/6.2.0/../../../../x86_64-pc-linux-gnu/bi=
n/ld: i386 architecture of input file `obj.host/src/3rdparty/chromium/third=
_party/icu/source/common/icuuc.ustring.o' is incompatible with i386:x86-64 =
output
| /usr/lib/gcc/x86_64-pc-linux-gnu/6.2.0/../../../../x86_64-pc-linux-gnu/bi=
n/ld: i386 architecture of input file `obj.host/src/3rdparty/chromium/third=
_party/icu/source/common/icuuc.utf_impl.o' is incompatible with i386:x86-64=
 output
| /usr/lib/gcc/x86_64-pc-linux-gnu/6.2.0/../../../../x86_64-pc-linux-gnu/bi=
n/ld: i386 architecture of input file `obj.host/src/3rdparty/chromium/third=
_party/icu/source/common/icuuc.cstring.o' is incompatible with i386:x86-64 =
output
| obj.host/src/3rdparty/chromium/third_party/icu/source/common/icuuc.cstrin=
g.o: In function `T_CString_int64ToString_56':
| cstring.c:(.text.T_CString_int64ToString_56+0x76): undefined reference to=
 `__umoddi3'
| cstring.c:(.text.T_CString_int64ToString_56+0xa1): undefined reference to=
 `__udivdi3'
| collect2: error: ld returned 1 exit status
| ERROR: oe_runmake failed

So either disable character_data_generator for make sure that the build won=
't mix target's i386 and host's x86-64 objects.

> > [1] https://www.mail-archive.com/development@qt-project.org/msg25257.ht=
ml
> >=20
> > Change-Id: Ib37c4d7323e8b45aa2b171e8427b6ec15aaee213
> > Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--OgqxwSJOaUobr8KG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWIt3GQAKCRA3VSO3ZXaA
HPZlAJ96SEvPjk4MLJ9DF4MRR9mf+kKpWACdHawglW1ZquEp2oWpsom+amlnnGI=
=qKkr
-----END PGP SIGNATURE-----

--OgqxwSJOaUobr8KG--
