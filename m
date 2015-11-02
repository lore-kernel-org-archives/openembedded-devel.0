Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id EA27F60125
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Nov 2015 14:33:25 +0000 (UTC)
Received: by wmeg8 with SMTP id g8so62306895wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Nov 2015 06:33:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=EUtJMUYpLBevyX/q/BxG7vLP72pISn73a4lwUe/ETic=;
	b=NaEcU8g1wTjOVGaPoulkFDCmfVKFAnEmBkJTf2bYNe2eGbvMAwbVX1nEVAxurunBZQ
	jZvcnVy2Nlx2uuXyiy15KnuGoU8bXFxVVNKJsH1AEFOQ53GYEgV6e7a7zHGxH7eSErp8
	7aHMBL2mc30+ORteCWtsAH0Uf8y+G3hysVW8aspMiymHEp3mfqQOVOs6sGbkAnnYXFJF
	3T0ppTSZ7Hk284l3LlI5G/+VLvnt3q0C5h9Ni7EOHwPMc85fU5tcuUVbaDg2qL29lajw
	mw6eVQcFXYp9Td1qOTJ60yKWHtYo2sj42gjIhnWZK683ejLSsFYSJjn+OuNtORbWHm0w
	WihQ==
X-Received: by 10.28.212.8 with SMTP id l8mr14598968wmg.32.1446474805429;
	Mon, 02 Nov 2015 06:33:25 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id h7sm22703206wjz.7.2015.11.02.06.33.24
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 02 Nov 2015 06:33:24 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 2 Nov 2015 15:33:30 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151102143330.GA28051@jama>
References: <1445585893-28183-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1445585893-28183-1-git-send-email-raj.khem@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-oe][PATCH] sysdig: Fix build with lua >= 5.2
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
X-List-Received-Date: Mon, 02 Nov 2015 14:33:26 -0000
X-Groupsio-MsgNum: 58247
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GvXjxJ+pjyke8COw"
Content-Disposition: inline

--GvXjxJ+pjyke8COw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2015 at 12:38:13AM -0700, Khem Raj wrote:
> It was still using deprecated lua contructs
> also fix for musl while at it

Still fails in world builds:
http://errors.yoctoproject.org/Errors/Details/21266/
or
http://errors.yoctoproject.org/Errors/Details/20809/

Should it depend on luajit or lua5.1 you've recently sent?

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  ...ith-musl-backtrace-APIs-are-glibc-specifi.patch |  50 ++++++++++
>  .../0001-libsinsp-Port-to-build-with-lua-5.2.patch | 108 +++++++++++++++=
++++++
>  meta-oe/recipes-extended/sysdig/sysdig_git.bb      |   7 +-
>  3 files changed, 163 insertions(+), 2 deletions(-)
>  create mode 100644 meta-oe/recipes-extended/sysdig/sysdig/0001-Fix-build=
-with-musl-backtrace-APIs-are-glibc-specifi.patch
>  create mode 100644 meta-oe/recipes-extended/sysdig/sysdig/0001-libsinsp-=
Port-to-build-with-lua-5.2.patch
>=20
> diff --git a/meta-oe/recipes-extended/sysdig/sysdig/0001-Fix-build-with-m=
usl-backtrace-APIs-are-glibc-specifi.patch b/meta-oe/recipes-extended/sysdi=
g/sysdig/0001-Fix-build-with-musl-backtrace-APIs-are-glibc-specifi.patch
> new file mode 100644
> index 0000000..7d3f8a1
> --- /dev/null
> +++ b/meta-oe/recipes-extended/sysdig/sysdig/0001-Fix-build-with-musl-bac=
ktrace-APIs-are-glibc-specifi.patch
> @@ -0,0 +1,50 @@
> +From 290703a5d21f34ea5ec23efc815a9f4df241e7e8 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Fri, 23 Oct 2015 00:33:32 -0700
> +Subject: [PATCH] Fix build with musl, backtrace() APIs are glibc specific
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + userspace/libsinsp/utils.cpp | 4 +++-
> + userspace/libsinsp/utils.h   | 2 +-
> + 2 files changed, 4 insertions(+), 2 deletions(-)
> +
> +diff --git a/userspace/libsinsp/utils.cpp b/userspace/libsinsp/utils.cpp
> +index 8f23f9c..c496a57 100644
> +--- a/userspace/libsinsp/utils.cpp
> ++++ b/userspace/libsinsp/utils.cpp
> +@@ -21,7 +21,9 @@ along with sysdig.  If not, see <http://www.gnu.org/li=
censes/>.
> + #include <limits.h>
> + #include <stdlib.h>
> + #include <sys/time.h>
> ++#ifdef __GLIBC__
> + #include <execinfo.h>
> ++#endif
> + #include <unistd.h>
> + #include <sys/time.h>
> + #include <netdb.h>
> +@@ -741,7 +743,7 @@ uint64_t sinsp_utils::get_current_time_ns()
> +     return tv.tv_sec * (uint64_t) 1000000000 + tv.tv_usec * 1000;
> + }
> +=20
> +-#ifndef _WIN32
> ++#if defined(_WIN32) && defined(__GLIBC__)
> + void sinsp_utils::bt(void)
> + {
> + 	static const char start[] =3D "BACKTRACE ------------";
> +diff --git a/userspace/libsinsp/utils.h b/userspace/libsinsp/utils.h
> +index 600d00b..4ab4650 100644
> +--- a/userspace/libsinsp/utils.h
> ++++ b/userspace/libsinsp/utils.h
> +@@ -79,7 +79,7 @@ public:
> +=20
> + 	static uint64_t get_current_time_ns();
> +=20
> +-#ifndef _WIN32
> ++#if not defined(_WIN32) && defined(__GLIBC__)
> + 	//
> + 	// Print the call stack
> + 	//
> +--=20
> +2.6.2
> +
> diff --git a/meta-oe/recipes-extended/sysdig/sysdig/0001-libsinsp-Port-to=
-build-with-lua-5.2.patch b/meta-oe/recipes-extended/sysdig/sysdig/0001-lib=
sinsp-Port-to-build-with-lua-5.2.patch
> new file mode 100644
> index 0000000..8fec0ca
> --- /dev/null
> +++ b/meta-oe/recipes-extended/sysdig/sysdig/0001-libsinsp-Port-to-build-=
with-lua-5.2.patch
> @@ -0,0 +1,108 @@
> +From c2782a6ca968190e221c25b0890600ba8cd43798 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Fri, 23 Oct 2015 00:23:15 -0700
> +Subject: [PATCH] libsinsp: Port to build with lua >=3D 5.2
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + userspace/libsinsp/chisel.cpp | 40 +++++++++++++++++++++++++++++-------=
----
> + 1 file changed, 29 insertions(+), 11 deletions(-)
> +
> +diff --git a/userspace/libsinsp/chisel.cpp b/userspace/libsinsp/chisel.c=
pp
> +index 3cfbd8d..2db9348 100644
> +--- a/userspace/libsinsp/chisel.cpp
> ++++ b/userspace/libsinsp/chisel.cpp
> +@@ -94,7 +94,7 @@ void lua_stackdump(lua_State *L)
> + // Lua callbacks
> + ///////////////////////////////////////////////////////////////////////=
////////
> + #ifdef HAS_LUA_CHISELS
> +-const static struct luaL_reg ll_sysdig [] =3D=20
> ++const static struct luaL_Reg ll_sysdig [] =3D
> + {
> + 	{"set_filter", &lua_cbacks::set_global_filter},
> + 	{"set_snaplen", &lua_cbacks::set_snaplen},
> +@@ -120,7 +120,7 @@ const static struct luaL_reg ll_sysdig [] =3D
> + 	{NULL,NULL}
> + };
> +=20
> +-const static struct luaL_reg ll_chisel [] =3D=20
> ++const static struct luaL_Reg ll_chisel [] =3D
> + {
> + 	{"request_field", &lua_cbacks::request_field},
> + 	{"set_filter", &lua_cbacks::set_filter},
> +@@ -131,7 +131,7 @@ const static struct luaL_reg ll_chisel [] =3D
> + 	{NULL,NULL}
> + };
> +=20
> +-const static struct luaL_reg ll_evt [] =3D=20
> ++const static struct luaL_Reg ll_evt [] =3D
> + {
> + 	{"field", &lua_cbacks::field},
> + 	{"get_num", &lua_cbacks::get_num},
> +@@ -853,10 +853,28 @@ bool sinsp_chisel::parse_view_info(lua_State *ls, =
OUT chisel_desc* cd)
> +=20
> +=20
> + #ifdef HAS_LUA_CHISELS
> ++static void chisel_lua_registerlib(lua_State *L, const char *libname,
> ++				const luaL_Reg *l, int ind)
> ++{
> ++#if LUA_VERSION_NUM >=3D 502
> ++	if (libname)
> ++	{
> ++		lua_newtable(L);
> ++		luaL_setfuncs(L, l, ind);
> ++		lua_pushvalue(L, -1);
> ++		lua_setglobal(L, libname);
> ++	}
> ++	else
> ++		luaL_setfuncs(L, l, ind);
> ++#else
> ++	luaL_register(L, libname, l);
> ++#endif
> ++}
> ++
> + // Initializes a lua chisel
> + bool sinsp_chisel::init_lua_chisel(chisel_desc &cd, string const &fpath)
> + {
> +-	lua_State* ls =3D lua_open();
> ++	lua_State* ls =3D luaL_newstate();
> + 	if(ls =3D=3D NULL)
> + 	{
> + 		return false;
> +@@ -867,9 +885,9 @@ bool sinsp_chisel::init_lua_chisel(chisel_desc &cd, =
string const &fpath)
> + 	//
> + 	// Load our own lua libs
> + 	//
> +-	luaL_openlib(ls, "sysdig", ll_sysdig, 0);
> +-	luaL_openlib(ls, "chisel", ll_chisel, 0);
> +-	luaL_openlib(ls, "evt", ll_evt, 0);
> ++	chisel_lua_registerlib(ls, "sysdig", ll_sysdig, 0);
> ++	chisel_lua_registerlib(ls, "chisel", ll_chisel, 0);
> ++	chisel_lua_registerlib(ls, "evt", ll_evt, 0);
> +=20
> + 	//
> + 	// Add our chisel paths to package.path
> +@@ -1111,16 +1129,16 @@ void sinsp_chisel::load(string cmdstr)
> + 	//
> + 	// Open the script
> + 	//
> +-	m_ls =3D lua_open();
> ++	m_ls =3D luaL_newstate();
> + =20
> + 	luaL_openlibs(m_ls);
> +=20
> + 	//
> + 	// Load our own lua libs
> + 	//
> +-	luaL_openlib(m_ls, "sysdig", ll_sysdig, 0);
> +-	luaL_openlib(m_ls, "chisel", ll_chisel, 0);
> +-	luaL_openlib(m_ls, "evt", ll_evt, 0);
> ++	chisel_lua_registerlib(m_ls, "sysdig", ll_sysdig, 0);
> ++	chisel_lua_registerlib(m_ls, "chisel", ll_chisel, 0);
> ++	chisel_lua_registerlib(m_ls, "evt", ll_evt, 0);
> +=20
> + 	//
> + 	// Add our chisel paths to package.path
> +--=20
> +2.6.2
> +
> diff --git a/meta-oe/recipes-extended/sysdig/sysdig_git.bb b/meta-oe/reci=
pes-extended/sysdig/sysdig_git.bb
> index 62aa433..717fab9 100644
> --- a/meta-oe/recipes-extended/sysdig/sysdig_git.bb
> +++ b/meta-oe/recipes-extended/sysdig/sysdig_git.bb
> @@ -11,8 +11,11 @@ inherit cmake pkgconfig
>  DEPENDS =3D "luajit zlib ncurses"
>  RDEPENDS_${PN} =3D "bash"
> =20
> -SRC_URI =3D "git://github.com/draios/sysdig.git;branch=3Dmaster"
> -SRCREV =3D "b7394e29ced4f1a991af03c0381a5828abcbab7a"
> +SRC_URI =3D "git://github.com/draios/sysdig.git;branch=3Dmaster \
> +           file://0001-libsinsp-Port-to-build-with-lua-5.2.patch \
> +           file://0001-Fix-build-with-musl-backtrace-APIs-are-glibc-spec=
ifi.patch \
> +          "
> +SRCREV =3D "85d16f33a82a17f87ccdbc088749271c71d87013"
>  PV =3D "0.1.102+git${SRCPV}"
> =20
>  S =3D "${WORKDIR}/git"
> --=20
> 2.6.2
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--GvXjxJ+pjyke8COw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlY3dDoACgkQN1Ujt2V2gBzVNQCfTjaTuUxacIwMkY2BPM8cTxJs
yjoAn2PX4ZUbeVfBIAe2KzwE4csl+FgQ
=HFCw
-----END PGP SIGNATURE-----

--GvXjxJ+pjyke8COw--
