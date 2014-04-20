Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f45.google.com (mail-ee0-f45.google.com [74.125.83.45])
	by mail.openembedded.org (Postfix) with ESMTP id 86036607FF
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 09:23:01 +0000 (UTC)
Received: by mail-ee0-f45.google.com with SMTP id d17so2890133eek.32
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 02:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=LFdThnLiEU+Bd14S26ZgWWD6DXN6xvypcEBFGfOUf8M=;
	b=BNBmzDCIbCOY9LBVvT21F1ozVYi+V3sTjiqnJsDlP8t+dZO4h9vpHAuiGomzM9ko0G
	eT4N2csJGKe25hrqjyUxUwBoZR2Ff+hIhH/myHMqEYDMaC1Ln72uQ8jMRgmuzHefivwp
	OgYvlzRJC08pH+t29a/a0JcPvO4GRji8OdI/kjKv9gEgmo+fMNQ1aGmZM0/eTLouXWXY
	cPqDs748Fx07VN/RY7iCq8h0+aFO2NZ4bwazK1N3L4aLdNMk/KSVQheT7tsHqXZJ5q9O
	DjdBnhob5VEuzGCtusmsS2HhbV+Xa6qQKvDGI/sq6xDNtzbWSpn3q3D2vhPua9V/2Dtz
	s1/Q==
X-Received: by 10.14.251.204 with SMTP id b52mr37153635ees.36.1397985782261;
	Sun, 20 Apr 2014 02:23:02 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	u1sm92971427eex.31.2014.04.20.02.23.00 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Apr 2014 02:23:01 -0700 (PDT)
Date: Sun, 20 Apr 2014 11:23:06 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140420092306.GC2486@jama>
References: <1397480658-10634-1-git-send-email-koen.kooi@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1397480658-10634-1-git-send-email-koen.kooi@linaro.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: Re: [meta-oe][PATCH] mongodb: update to 2.6
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
X-List-Received-Date: Sun, 20 Apr 2014 09:23:05 -0000
X-Groupsio-MsgNum: 49310
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+RqgOR8y65RRYhVY"
Content-Disposition: inline

--+RqgOR8y65RRYhVY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 14, 2014 at 03:04:18PM +0200, Koen Kooi wrote:
> Also fix build on armv5

Merged, thanks.

Can you send follow-up with LICENSE change from AGPLv3 to AGPL-3.0?

WARNING: mongodb: No generic license file exists for: AGPLv3 in any
provider

> Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
> ---
>  ...Make-it-possible-to-disable-the-use-of-v8.patch |  23 ++--
>  ...02-Fix-linking-when-scripting-is-disabled.patch |   6 +-
>  ...d-mongo-binary-when-scripting-is-disabled.patch |  18 +--
>  ...e-os.uname-with-os.getenv-OE_TARGET_ARCH.patch} |  14 +--
>  ...ports-atomic-ops-for-armv5-and-up-but-onl.patch | 127 +++++++++++++++=
++++++
>  meta-oe/recipes-support/mongodb/mongodb_git.bb     |   9 +-
>  6 files changed, 163 insertions(+), 34 deletions(-)
>  rename meta-oe/recipes-support/mongodb/mongodb/{0001-replace-os.uname-wi=
th-os.getenv-TARGET_ARCH.patch =3D> 0004-replace-os.uname-with-os.getenv-OE=
_TARGET_ARCH.patch} (81%)
>  create mode 100644 meta-oe/recipes-support/mongodb/mongodb/0005-GCC-4.7-=
supports-atomic-ops-for-armv5-and-up-but-onl.patch
>=20
> diff --git a/meta-oe/recipes-support/mongodb/mongodb/0001-Make-it-possibl=
e-to-disable-the-use-of-v8.patch b/meta-oe/recipes-support/mongodb/mongodb/=
0001-Make-it-possible-to-disable-the-use-of-v8.patch
> index 311ac6c..650389e 100644
> --- a/meta-oe/recipes-support/mongodb/mongodb/0001-Make-it-possible-to-di=
sable-the-use-of-v8.patch
> +++ b/meta-oe/recipes-support/mongodb/mongodb/0001-Make-it-possible-to-di=
sable-the-use-of-v8.patch
> @@ -1,21 +1,21 @@
> -From bffde38f3b3d6285019e38a30c4573326e1dd2ea Mon Sep 17 00:00:00 2001
> +From f1bd00e7f54aad6479bc809c27d5cd3c2fb993eb Mon Sep 17 00:00:00 2001
>  From: Michael Hudson-Doyle <michael.hudson@linaro.org>
>  Date: Fri, 20 Dec 2013 11:10:43 +1300
> -Subject: [PATCH 1/3] Make it possible to disable the use of v8.
> +Subject: [PATCH 1/5] Make it possible to disable the use of v8.
> =20
>  Currently v8 is always built in, no matter what you pass to scons.
> =20
>  This removes the (useless) --usev8 flag for scons and replaces it with a
>  --disable-scripting option instead.
>  ---
> - SConstruct | 8 +++++---
> - 1 file changed, 5 insertions(+), 3 deletions(-)
> + SConstruct | 9 ++++++---
> + 1 file changed, 6 insertions(+), 3 deletions(-)
> =20
>  diff --git a/SConstruct b/SConstruct
> -index fd92fe4..1f14083 100644
> +index 3886d1b..6e0ef3b 100644
>  --- a/SConstruct
>  +++ b/SConstruct
> -@@ -222,7 +222,7 @@ add_option( "asio" , "Use Asynchronous IO (NOT READY=
 YET)" , 0 , True )
> +@@ -225,7 +225,7 @@ add_option( "asio" , "Use Asynchronous IO (NOT READY=
 YET)" , 0 , True )
>   add_option( "ssl" , "Enable SSL" , 0 , True )
>  =20
>   # library choices
> @@ -24,7 +24,7 @@ index fd92fe4..1f14083 100644
>   add_option( "libc++", "use libc++ (experimental, requires clang)", 0, T=
rue )
>  =20
>   # mongo feature options
> -@@ -439,7 +439,7 @@ static =3D has_option( "static" )
> +@@ -442,7 +442,7 @@ static =3D has_option( "static" )
>  =20
>   noshell =3D has_option( "noshell" )=20
>  =20
> @@ -33,17 +33,18 @@ index fd92fe4..1f14083 100644
>  =20
>   asio =3D has_option( "asio" )
>  =20
> -@@ -599,7 +599,9 @@ if has_option( "durableDefaultOn" ):
> +@@ -600,7 +600,10 @@ if has_option( "durableDefaultOn" ):
>   if has_option( "durableDefaultOff" ):
>       env.Append( CPPDEFINES=3D[ "_DURABLEDEFAULTOFF" ] )
>  =20
> --if ( not ( usev8 or justClientLib) ):
> +-usev8 =3D True
>  +if disable_scripting or justClientLib:
>  +    usev8 =3D False
>  +else:
> -     usev8 =3D True
> ++    usev8 =3D True
>  =20
>   extraLibPlaces =3D []
> +=20
>  --=20
> -1.8.4.2
> +1.9.0
> =20
> diff --git a/meta-oe/recipes-support/mongodb/mongodb/0002-Fix-linking-whe=
n-scripting-is-disabled.patch b/meta-oe/recipes-support/mongodb/mongodb/000=
2-Fix-linking-when-scripting-is-disabled.patch
> index d8d5a3b..b4388d8 100644
> --- a/meta-oe/recipes-support/mongodb/mongodb/0002-Fix-linking-when-scrip=
ting-is-disabled.patch
> +++ b/meta-oe/recipes-support/mongodb/mongodb/0002-Fix-linking-when-scrip=
ting-is-disabled.patch
> @@ -1,7 +1,7 @@
> -From 52d68642205626cad3bac3a53e269c765ccff676 Mon Sep 17 00:00:00 2001
> +From 5b22f64a2e2237082d2733698b07147d27b09ad2 Mon Sep 17 00:00:00 2001
>  From: Michael Hudson-Doyle <michael.hudson@linaro.org>
>  Date: Fri, 20 Dec 2013 12:28:27 +1300
> -Subject: [PATCH 2/3] Fix linking when scripting is disabled.
> +Subject: [PATCH 2/5] Fix linking when scripting is disabled.
> =20
>  ---
>   src/mongo/scripting/engine_none.cpp | 4 ++++
> @@ -21,5 +21,5 @@ index f5c7109..9ae9d57 100644
>  +    }
>   }
>  --=20
> -1.8.4.2
> +1.9.0
> =20
> diff --git a/meta-oe/recipes-support/mongodb/mongodb/0003-Do-not-build-mo=
ngo-binary-when-scripting-is-disabled.patch b/meta-oe/recipes-support/mongo=
db/mongodb/0003-Do-not-build-mongo-binary-when-scripting-is-disabled.patch
> index 5c314b1..016ac35 100644
> --- a/meta-oe/recipes-support/mongodb/mongodb/0003-Do-not-build-mongo-bin=
ary-when-scripting-is-disabled.patch
> +++ b/meta-oe/recipes-support/mongodb/mongodb/0003-Do-not-build-mongo-bin=
ary-when-scripting-is-disabled.patch
> @@ -1,7 +1,7 @@
> -From 1f8e10747af3988e8ddee609bea990f622dd746a Mon Sep 17 00:00:00 2001
> +From eab4316597a8e9e7bbf845a054564c6daa4a95b7 Mon Sep 17 00:00:00 2001
>  From: Michael Hudson-Doyle <michael.hudson@linaro.org>
>  Date: Wed, 22 Jan 2014 13:53:10 +1300
> -Subject: [PATCH 3/3] * Do not build 'mongo' binary when scripting is dis=
abled
> +Subject: [PATCH 3/5] * Do not build 'mongo' binary when scripting is dis=
abled
>   * Do not build the jstests when scripting is disabled
> =20
>  ---
> @@ -10,10 +10,10 @@ Subject: [PATCH 3/3] * Do not build 'mongo' binary wh=
en scripting is disabled
>   2 files changed, 9 insertions(+), 3 deletions(-)
> =20
>  diff --git a/SConstruct b/SConstruct
> -index 1f14083..a69cf0a 100644
> +index 6e0ef3b..c84a669 100644
>  --- a/SConstruct
>  +++ b/SConstruct
> -@@ -437,10 +437,13 @@ else:
> +@@ -440,10 +440,13 @@ else:
>  =20
>   static =3D has_option( "static" )
>  =20
> @@ -29,16 +29,16 @@ index 1f14083..a69cf0a 100644
>   asio =3D has_option( "asio" )
>  =20
>   usePCH =3D has_option( "usePCH" )
> -@@ -1671,6 +1674,7 @@ Export("get_option")
> +@@ -1662,6 +1665,7 @@ Export("get_option")
>   Export("has_option use_system_version_of_library")
> - Export("installSetup mongoCodeVersion")
> + Export("mongoCodeVersion")
>   Export("usev8")
>  +Export("disable_scripting")
>   Export("darwin windows solaris linux freebsd nix")
>   Export('module_sconscripts')
>   Export("debugBuild optBuild")
>  diff --git a/src/mongo/SConscript b/src/mongo/SConscript
> -index d84267e..dc0ca3a 100644
> +index 58f8406..b4379e7 100644
>  --- a/src/mongo/SConscript
>  +++ b/src/mongo/SConscript
>  @@ -6,6 +6,7 @@ import os
> @@ -49,7 +49,7 @@ index d84267e..dc0ca3a 100644
>   Import("env")
>   Import("shellEnv")
>   Import("testEnv")
> -@@ -1022,7 +1023,8 @@ test =3D testEnv.Install(
> +@@ -1043,7 +1044,8 @@ test =3D testEnv.Install(
>                       [ f for f in Glob("dbtests/*.cpp")
>                         if not str(f).endswith('framework.cpp') and
>                            not str(f).endswith('framework_options.cpp') a=
nd
> @@ -60,5 +60,5 @@ index d84267e..dc0ca3a 100644
>                          "mutable_bson_test_utils",
>                          "mongocommon",
>  --=20
> -1.8.4.2
> +1.9.0
> =20
> diff --git a/meta-oe/recipes-support/mongodb/mongodb/0001-replace-os.unam=
e-with-os.getenv-TARGET_ARCH.patch b/meta-oe/recipes-support/mongodb/mongod=
b/0004-replace-os.uname-with-os.getenv-OE_TARGET_ARCH.patch
> similarity index 81%
> rename from meta-oe/recipes-support/mongodb/mongodb/0001-replace-os.uname=
-with-os.getenv-TARGET_ARCH.patch
> rename to meta-oe/recipes-support/mongodb/mongodb/0004-replace-os.uname-w=
ith-os.getenv-OE_TARGET_ARCH.patch
> index 547c3bd..ade7ec0 100644
> --- a/meta-oe/recipes-support/mongodb/mongodb/0001-replace-os.uname-with-=
os.getenv-TARGET_ARCH.patch
> +++ b/meta-oe/recipes-support/mongodb/mongodb/0004-replace-os.uname-with-=
os.getenv-OE_TARGET_ARCH.patch
> @@ -1,7 +1,7 @@
> -From ef482650fb6d990e4953104d7141d9a0fa4c872f Mon Sep 17 00:00:00 2001
> +From d02f33d860f2d11f71e9056782a2e75603d6ec25 Mon Sep 17 00:00:00 2001
>  From: Koen Kooi <koen.kooi@linaro.org>
>  Date: Tue, 4 Feb 2014 10:56:35 +0100
> -Subject: [PATCH] replace os.uname with os.getenv(OE_TARGET_ARCH)
> +Subject: [PATCH 4/5] replace os.uname with os.getenv(OE_TARGET_ARCH)
> =20
>  This fixes crosscompilation
> =20
> @@ -12,10 +12,10 @@ Upstream-Status: Inappropiate [OE specific]
>   1 file changed, 4 insertions(+), 4 deletions(-)
> =20
>  diff --git a/SConstruct b/SConstruct
> -index 4f26be7..a353323 100644
> +index c84a669..05e2ea0 100644
>  --- a/SConstruct
>  +++ b/SConstruct
> -@@ -265,9 +265,9 @@ add_option( "pch" , "use precompiled headers to spee=
d up the build (experimental
> +@@ -257,9 +257,9 @@ add_option( "pch" , "use precompiled headers to spee=
d up the build (experimental
>   add_option( "distcc" , "use distcc for distributing builds" , 0 , False=
 )
>  =20
>   # debugging/profiling help
> @@ -27,7 +27,7 @@ index 4f26be7..a353323 100644
>       defaultAllocator =3D 'tcmalloc'
>   else:
>       defaultAllocator =3D 'system'
> -@@ -673,7 +673,7 @@ if has_option( "full" ):
> +@@ -633,7 +633,7 @@ if has_option( "extralib" ):
>   # ---- other build setup -----
>  =20
>   if "uname" in dir(os):
> @@ -36,7 +36,7 @@ index 4f26be7..a353323 100644
>   else:
>       processor =3D "i386"
>  =20
> -@@ -702,7 +702,7 @@ elif linux:
> +@@ -662,7 +662,7 @@ elif linux:
>  =20
>       env.Append( LIBS=3D['m'] )
>  =20
> @@ -46,5 +46,5 @@ index 4f26be7..a353323 100644
>           nixLibPrefix =3D "lib64"
>           env.Append( EXTRALIBPATH=3D["/usr/lib64" , "/lib64" ] )
>  --=20
> -1.8.4.2
> +1.9.0
> =20
> diff --git a/meta-oe/recipes-support/mongodb/mongodb/0005-GCC-4.7-support=
s-atomic-ops-for-armv5-and-up-but-onl.patch b/meta-oe/recipes-support/mongo=
db/mongodb/0005-GCC-4.7-supports-atomic-ops-for-armv5-and-up-but-onl.patch
> new file mode 100644
> index 0000000..490d564
> --- /dev/null
> +++ b/meta-oe/recipes-support/mongodb/mongodb/0005-GCC-4.7-supports-atomi=
c-ops-for-armv5-and-up-but-onl.patch
> @@ -0,0 +1,127 @@
> +From e31f85e6915d4bf6ed76c5da71c235525fa4ecc3 Mon Sep 17 00:00:00 2001
> +From: Koen Kooi <koen.kooi@linaro.org>
> +Date: Mon, 14 Apr 2014 10:29:42 +0200
> +Subject: [PATCH 5/5] GCC 4.7+ supports atomic ops for armv5 and up, but =
only
> + exports the functions for armv6 and up. This patch works around the lin=
ker
> + problems associated with that.
> +
> +Forward ported from http://pkgs.fedoraproject.org/cgit/mongodb.git/tree/=
mongodb-2.4.5-atomics.patch
> +
> +Upstream-status: pending
> +---
> + src/mongo/bson/util/atomic_int.h                   | 26 ++++++++++++
> + src/mongo/platform/atomic_intrinsics_gcc_generic.h | 47 +++++++++++++++=
+++++++
> + 2 files changed, 73 insertions(+)
> +
> +diff --git a/src/mongo/bson/util/atomic_int.h b/src/mongo/bson/util/atom=
ic_int.h
> +index 0b85363..ed02c23 100644
> +--- a/src/mongo/bson/util/atomic_int.h
> ++++ b/src/mongo/bson/util/atomic_int.h
> +@@ -24,6 +24,10 @@
> +=20
> + #include "mongo/platform/compiler.h"
> +=20
> ++#define GCC_VERSION (__GNUC__ * 10000                 \
> ++                     + __GNUC_MINOR__ * 100           \
> ++                     + __GNUC_PATCHLEVEL__)
> ++
> + namespace mongo {
> +=20
> +     /**
> +@@ -72,6 +76,28 @@ namespace mongo {
> +         InterlockedAdd((volatile long *)&x,by);
> +     }
> + # endif
> ++#elif defined(GCC_VERSION) && GCC_VERSION >=3D 40700
> ++// in GCC version >=3D 4.7.0 we can use the built-in atomic operations
> ++
> ++    inline void AtomicUInt::set(unsigned newX) {
> ++        __atomic_store_n (&x, newX, __ATOMIC_SEQ_CST);
> ++    }
> ++    AtomicUInt AtomicUInt::operator++() {    // ++prefix
> ++        return __atomic_add_fetch(&x, 1, __ATOMIC_SEQ_CST);
> ++    }
> ++    AtomicUInt AtomicUInt::operator++(int) { // postfix++
> ++        return __atomic_fetch_add(&x, 1, __ATOMIC_SEQ_CST);
> ++    }
> ++    AtomicUInt AtomicUInt::operator--() {    // --prefix
> ++        return __atomic_add_fetch(&x, -1, __ATOMIC_SEQ_CST);
> ++    }
> ++    AtomicUInt AtomicUInt::operator--(int) { // postfix--
> ++        return __atomic_fetch_add(&x, -1, __ATOMIC_SEQ_CST);
> ++    }
> ++    void AtomicUInt::signedAdd(int by) {
> ++        __atomic_fetch_add(&x, by, __ATOMIC_SEQ_CST);
> ++    }
> ++
> + #elif defined(__GCC_HAVE_SYNC_COMPARE_AND_SWAP_4)
> +     // this is in GCC >=3D 4.1
> +     inline void AtomicUInt::set(unsigned newX) { __sync_synchronize(); =
x =3D newX; }
> +diff --git a/src/mongo/platform/atomic_intrinsics_gcc_generic.h b/src/mo=
ngo/platform/atomic_intrinsics_gcc_generic.h
> +index 64a2499..b7cc176 100644
> +--- a/src/mongo/platform/atomic_intrinsics_gcc_generic.h
> ++++ b/src/mongo/platform/atomic_intrinsics_gcc_generic.h
> +@@ -22,8 +22,53 @@
> +=20
> + #include <boost/utility.hpp>
> +=20
> ++#define GCC_VERSION (__GNUC__ * 10000                 \
> ++                     + __GNUC_MINOR__ * 100           \
> ++                     + __GNUC_PATCHLEVEL__)
> ++
> + namespace mongo {
> +=20
> ++// If GCC version >=3D 4.7.0, we can use the built-in atomic operations
> ++#if defined(GCC_VERSION) && GCC_VERSION >=3D 40700
> ++
> ++    /**
> ++     * Instantiation of AtomicIntrinsics<>.
> ++     */
> ++    template <typename T>
> ++    class AtomicIntrinsics {
> ++    public:
> ++
> ++        static T compareAndSwap(volatile T* dest, T expected, T newValu=
e) {
> ++            return __atomic_compare_exchange_n (dest, &expected, newVal=
ue, 0, __ATOMIC_SEQ_CST, __ATOMIC_SEQ_CST);
> ++        }
> ++
> ++        static T swap(volatile T* dest, T newValue) {
> ++            return __atomic_exchange_n (dest, newValue, __ATOMIC_SEQ_CS=
T);
> ++        }
> ++
> ++        static T load(volatile const T* value) {
> ++            return __atomic_load_n (value, __ATOMIC_SEQ_CST);
> ++        }
> ++
> ++        static T loadRelaxed(volatile const T* value) {
> ++            return *value;
> ++        }
> ++
> ++        static void store(volatile T* dest, T newValue) {
> ++            __atomic_store_n (dest, newValue, __ATOMIC_SEQ_CST);
> ++        }
> ++
> ++        static T fetchAndAdd(volatile T* dest, T increment) {
> ++            return __atomic_fetch_add (dest, increment, __ATOMIC_SEQ_CS=
T);
> ++        }
> ++
> ++    private:
> ++        AtomicIntrinsics();
> ++        ~AtomicIntrinsics();
> ++    };
> ++
> ++#else // GCC version < 4.7, so we must use legacy (platform-specific) a=
tomic operations
> ++
> +     /**
> +      * Instantiation of AtomicIntrinsics<> for all word types T.
> +      */
> +@@ -67,4 +112,6 @@ namespace mongo {
> +         ~AtomicIntrinsics();
> +     };
> +=20
> ++#endif // GCC_VERSION >=3D 40700
> ++
> + }  // namespace mongo
> +--=20
> +1.9.0
> +
> diff --git a/meta-oe/recipes-support/mongodb/mongodb_git.bb b/meta-oe/rec=
ipes-support/mongodb/mongodb_git.bb
> index f0fe240..d990da8 100644
> --- a/meta-oe/recipes-support/mongodb/mongodb_git.bb
> +++ b/meta-oe/recipes-support/mongodb/mongodb_git.bb
> @@ -9,13 +9,14 @@ DEPENDS_append_x86-64 =3D " gperftools"
> =20
>  inherit scons
> =20
> -PV =3D "2.5.5+git${SRCPV}"
> -SRCREV =3D "588dc81b0822ebb46f80e152b94527a882e6ea5e"
> -SRC_URI =3D "git://github.com/mongodb/mongo.git \
> +PV =3D "2.6.0+git${SRCPV}"
> +SRCREV =3D "be1905c24c7e5ea258e537fbf0d2c502c4fc6de2"
> +SRC_URI =3D "git://github.com/mongodb/mongo.git;branch=3Dv2.6 \
>             file://0001-Make-it-possible-to-disable-the-use-of-v8.patch \
>             file://0002-Fix-linking-when-scripting-is-disabled.patch \
>             file://0003-Do-not-build-mongo-binary-when-scripting-is-disab=
led.patch \
> -           file://0001-replace-os.uname-with-os.getenv-TARGET_ARCH.patch=
 \
> +           file://0004-replace-os.uname-with-os.getenv-OE_TARGET_ARCH.pa=
tch \
> +           file://0005-GCC-4.7-supports-atomic-ops-for-armv5-and-up-but-=
onl.patch \
>            "
> =20
>  S =3D "${WORKDIR}/git"
> --=20
> 1.9.0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--+RqgOR8y65RRYhVY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNTkfoACgkQN1Ujt2V2gBzbwQCfS14azxgtPIAffdkwaaGd7mIb
aPcAn39VUgFzqHLhzO5gRsCL/bM1A3D7
=IJ3H
-----END PGP SIGNATURE-----

--+RqgOR8y65RRYhVY--
