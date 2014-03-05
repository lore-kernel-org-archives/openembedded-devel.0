Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f182.google.com (mail-ea0-f182.google.com
	[209.85.215.182])
	by mail.openembedded.org (Postfix) with ESMTP id 92BC86BFF6
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Mar 2014 04:18:55 +0000 (UTC)
Received: by mail-ea0-f182.google.com with SMTP id b10so742608eae.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Mar 2014 20:18:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ZBamnuml++NEO6Zy8GnxeI4laY7Co6rf/0TwgW/qeE8=;
	b=daZbSVdG115aYWMs5doRlde50l4wuTiBcKyZqn8t5rWIgVACgNHe8tdKijEQPVCCiP
	/DO8AWoX9NM/3KZWyuBhg7HS9v2e9WoPmJPEPr9Rrc9OKJ3PNdErZV5mxr8E7fsT7ELM
	3+16XOYFFWwwt9Vbw+Z2s4WrifmQpeHRAK0bhOtseEkRKhovYLSqGKn2AubvdlNyAWMq
	99OGZTeLKIV7e3c0nmqIZtEQI1gMD8pQDNzSYww+NFZ5wphUwpEOFKS6C0nzmbzBfIGo
	TsADGiysBSwU9HpopFP2HmtYET55hXfWS8ouWWnrXj5gzr4ziHgAv313GYV4n8MEitNf
	z8fA==
X-Received: by 10.14.204.9 with SMTP id g9mr252383eeo.82.1393993136127;
	Tue, 04 Mar 2014 20:18:56 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	i47sm3813398eeg.6.2014.03.04.20.18.54 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 04 Mar 2014 20:18:54 -0800 (PST)
Date: Wed, 5 Mar 2014 05:19:01 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140305041901.GU26981@jama>
References: <1391518370-19990-1-git-send-email-koen.kooi@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1391518370-19990-1-git-send-email-koen.kooi@linaro.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: Re: [meta-oe][PATCH] mongodb: add git version
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
X-List-Received-Date: Wed, 05 Mar 2014 04:18:59 -0000
X-Groupsio-MsgNum: 48514
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nnfBUBcla7C6E0rv"
Content-Disposition: inline

--nnfBUBcla7C6E0rv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 04, 2014 at 01:52:50PM +0100, Koen Kooi wrote:
> This builds the server and the sharding helper, but not the CLI. The CLI =
will need a libv8 recipe since fixing the built-in copy to cross build is t=
oo much work.
>=20
> Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
> ---
>  ...Make-it-possible-to-disable-the-use-of-v8.patch | 49 +++++++++++++++++
>  ...place-os.uname-with-os.getenv-TARGET_ARCH.patch | 50 +++++++++++++++++
>  ...02-Fix-linking-when-scripting-is-disabled.patch | 25 +++++++++
>  ...d-mongo-binary-when-scripting-is-disabled.patch | 64 ++++++++++++++++=
++++++
>  meta-oe/recipes-support/mongodb/mongodb_git.bb     | 38 +++++++++++++
>  5 files changed, 226 insertions(+)
>  create mode 100644 meta-oe/recipes-support/mongodb/mongodb/0001-Make-it-=
possible-to-disable-the-use-of-v8.patch
>  create mode 100644 meta-oe/recipes-support/mongodb/mongodb/0001-replace-=
os.uname-with-os.getenv-TARGET_ARCH.patch
>  create mode 100644 meta-oe/recipes-support/mongodb/mongodb/0002-Fix-link=
ing-when-scripting-is-disabled.patch
>  create mode 100644 meta-oe/recipes-support/mongodb/mongodb/0003-Do-not-b=
uild-mongo-binary-when-scripting-is-disabled.patch
>  create mode 100644 meta-oe/recipes-support/mongodb/mongodb_git.bb

It's already merged, but can you please check this error when building
it for qemuarm?

| arm-oe-linux-gnueabi-g++ -march=3Darmv5te -marm -mthumb-interwork --sysro=
ot=3D/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemuar=
m -o build/linux2/disable-scripting/ld_arm-oe-linux-gnueabi-g++/ssl/use-sys=
tem-boost/use-system-pcre/use-system-tcmalloc/mongo/db/commands/find_and_mo=
dify_common.o -c -Wnon-virtual-dtor -Woverloaded-virtual -fPIC -fno-strict-=
aliasing -ggdb -pthread -Wall -Wsign-compare -Wno-unknown-pragmas -Winvalid=
-pch -Werror -pipe -O3 -Wno-unused-local-typedefs -Wno-unused-function -Wno=
-deprecated-declarations -fno-builtin-memcmp -D_SCONS -DMONGO_EXPOSE_MACROS=
 -DSUPPORT_UTF8 -DMONGO_OPTIMIZED_BUILD -D_FILE_OFFSET_BITS=3D64 -DMONGO_SS=
L -DMONGO_HAVE___THREAD -DBOOST_THREAD_VERSION=3D2 -DMONGO_HAVE_HEADER_UNIS=
TD_H -DMONGO_HAVE_EXECINFO_BACKTRACE -Ibuild/linux2/disable-scripting/ld_ar=
m-oe-linux-gnueabi-g++/ssl/use-system-boost/use-system-pcre/use-system-tcma=
lloc/third_party/snappy -Isrc/third_party/snappy -Ibuild/linux2/disable-scr=
ipting/ld_arm-oe-linux-gnueabi-g++/ssl/use-system-boost/use-system-pcre/use=
-system-tcmalloc/third_party/libstemmer_c/include -Isrc/third_party/libstem=
mer_c/include -Ibuild/linux2/disable-scripting/ld_arm-oe-linux-gnueabi-g++/=
ssl/use-system-boost/use-system-pcre/use-system-tcmalloc/third_party/s2 -Is=
rc/third_party/s2 -Ibuild/linux2/disable-scripting/ld_arm-oe-linux-gnueabi-=
g++/ssl/use-system-boost/use-system-pcre/use-system-tcmalloc -Isrc -Ibuild/=
linux2/disable-scripting/ld_arm-oe-linux-gnueabi-g++/ssl/use-system-boost/u=
se-system-pcre/use-system-tcmalloc/mongo -Isrc/mongo -Ibuild/linux2/disable=
-scripting/ld_arm-oe-linux-gnueabi-g++/ssl/use-system-boost/use-system-pcre=
/use-system-tcmalloc/third_party/s2 -Isrc/third_party/s2 -Ibuild/linux2/dis=
able-scripting/ld_arm-oe-linux-gnueabi-g++/ssl/use-system-boost/use-system-=
pcre/use-system-tcmalloc/third_party/snappy -Isrc/third_party/snappy -Ibuil=
d/linux2/disable-scripting/ld_arm-oe-linux-gnueabi-g++/ssl/use-system-boost=
/use-system-pcre/use-system-tcmalloc/third_party/yaml-cpp-0.5.1/include -Is=
rc/third_party/yaml-cpp-0.5.1/include src/mongo/db/commands/find_and_modify=
_common.cpp
| In file included from src/mongo/bson/bsonobj.h:29:0,
|                  from src/mongo/db/pipeline/value_internal.h:32,
|                  from src/mongo/db/pipeline/value.h:31,
|                  from src/mongo/db/pipeline/pipeline.h:33,
|                  from src/mongo/db/pipeline/pipeline.cpp:32:
| src/mongo/bson/util/atomic_int.h:128:4: error: #error "unsupported compil=
er or platform"
|  #  error "unsupported compiler or platform"
|     ^
| In file included from src/mongo/bson/bsonobj.h:29:0,
|                  from src/mongo/db/jsobj.h:38,
|                  from src/mongo/db/auth/privilege_parser.h:35,
|                  from src/mongo/db/auth/privilege.h:22,
|                  from src/mongo/db/auth/privilege.cpp:16:
| src/mongo/bson/util/atomic_int.h:128:4: error: #error "unsupported compil=
er or platform"
|  #  error "unsupported compiler or platform"
|     ^
| In file included from src/mongo/bson/bsonobj.h:29:0,
|                  from src/mongo/db/jsobj.h:38,
|                  from src/mongo/db/auth/privilege_parser.h:35,
|                  from src/mongo/db/auth/privilege.h:22,
|                  from src/mongo/db/commands/mr.h:37,
|                  from src/mongo/db/commands/mr_common.cpp:29:
| src/mongo/bson/util/atomic_int.h:128:4: error: #error "unsupported compil=
er or platform"
|  #  error "unsupported compiler or platform"
|     ^
| In file included from src/mongo/bson/bsonobj.h:29:0,
|                  from src/mongo/db/jsobj.h:38,
|                  from src/mongo/bson/mutable/element.h:20,
|                  from src/mongo/db/auth/authorization_manager.h:40,
|                  from src/mongo/db/auth/authorization_session.h:38,
|                  from src/mongo/db/auth/authorization_session.cpp:29:
| src/mongo/bson/util/atomic_int.h:128:4: error: #error "unsupported compil=
er or platform"
|  #  error "unsupported compiler or platform"
|     ^
| arm-oe-linux-gnueabi-g++ -march=3Darmv5te -marm -mthumb-interwork --sysro=
ot=3D/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemuar=
m -o build/linux2/disable-scripting/ld_arm-oe-linux-gnueabi-g++/ssl/use-sys=
tem-boost/use-system-pcre/use-system-tcmalloc/mongo/db/commands/user_manage=
ment_commands.o -c -Wnon-virtual-dtor -Woverloaded-virtual -fPIC -fno-stric=
t-aliasing -ggdb -pthread -Wall -Wsign-compare -Wno-unknown-pragmas -Winval=
id-pch -Werror -pipe -O3 -Wno-unused-local-typedefs -Wno-unused-function -W=
no-deprecated-declarations -fno-builtin-memcmp -D_SCONS -DMONGO_EXPOSE_MACR=
OS -DSUPPORT_UTF8 -DMONGO_OPTIMIZED_BUILD -D_FILE_OFFSET_BITS=3D64 -DMONGO_=
SSL -DMONGO_HAVE___THREAD -DBOOST_THREAD_VERSION=3D2 -DMONGO_HAVE_HEADER_UN=
ISTD_H -DMONGO_HAVE_EXECINFO_BACKTRACE -Ibuild/linux2/disable-scripting/ld_=
arm-oe-linux-gnueabi-g++/ssl/use-system-boost/use-system-pcre/use-system-tc=
malloc/third_party/snappy -Isrc/third_party/snappy -Ibuild/linux2/disable-s=
cripting/ld_arm-oe-linux-gnueabi-g++/ssl/use-system-boost/use-system-pcre/u=
se-system-tcmalloc/third_party/libstemmer_c/include -Isrc/third_party/libst=
emmer_c/include -Ibuild/linux2/disable-scripting/ld_arm-oe-linux-gnueabi-g+=
+/ssl/use-system-boost/use-system-pcre/use-system-tcmalloc/third_party/s2 -=
Isrc/third_party/s2 -Ibuild/linux2/disable-scripting/ld_arm-oe-linux-gnueab=
i-g++/ssl/use-system-boost/use-system-pcre/use-system-tcmalloc -Isrc -Ibuil=
d/linux2/disable-scripting/ld_arm-oe-linux-gnueabi-g++/ssl/use-system-boost=
/use-system-pcre/use-system-tcmalloc/mongo -Isrc/mongo -Ibuild/linux2/disab=
le-scripting/ld_arm-oe-linux-gnueabi-g++/ssl/use-system-boost/use-system-pc=
re/use-system-tcmalloc/third_party/s2 -Isrc/third_party/s2 -Ibuild/linux2/d=
isable-scripting/ld_arm-oe-linux-gnueabi-g++/ssl/use-system-boost/use-syste=
m-pcre/use-system-tcmalloc/third_party/snappy -Isrc/third_party/snappy -Ibu=
ild/linux2/disable-scripting/ld_arm-oe-linux-gnueabi-g++/ssl/use-system-boo=
st/use-system-pcre/use-system-tcmalloc/third_party/yaml-cpp-0.5.1/include -=
Isrc/third_party/yaml-cpp-0.5.1/include src/mongo/db/commands/user_manageme=
nt_commands.cpp
| In file included from src/mongo/bson/bsonobj.h:29:0,
|                  from src/mongo/db/jsobj.h:38,
|                  from src/mongo/db/diskloc.h:37,
|                  from src/mongo/db/clientcursor.h:33,
|                  from src/mongo/db/query/new_find.h:33,
|                  from src/mongo/db/query/new_find.cpp:29:
| src/mongo/bson/util/atomic_int.h:128:4: error: #error "unsupported compil=
er or platform"
|  #  error "unsupported compiler or platform"
|     ^
| In file included from src/mongo/bson/bsonobj.h:29:0,
|                  from src/mongo/db/jsobj.h:38,
|                  from src/mongo/db/auth/privilege_parser.h:35,
|                  from src/mongo/db/auth/privilege.h:22,
|                  from src/mongo/db/commands/find_and_modify.h:34,
|                  from src/mongo/db/commands/find_and_modify_common.cpp:31:
| src/mongo/bson/util/atomic_int.h:128:4: error: #error "unsupported compil=
er or platform"
|  #  error "unsupported compiler or platform"
|     ^
| In file included from src/mongo/bson/bsonobj.h:29:0,
|                  from src/mongo/db/jsobj.h:38,
|                  from src/mongo/db/auth/privilege_parser.h:35,
|                  from src/mongo/db/auth/privilege.h:22,
|                  from src/mongo/db/commands/hashcmd.cpp:42:
| src/mongo/bson/util/atomic_int.h:128:4: error: #error "unsupported compil=
er or platform"
|  #  error "unsupported compiler or platform"
|     ^
| In file included from src/mongo/bson/bsonobj.h:29:0,
|                  from src/mongo/db/jsobj.h:38,
|                  from src/mongo/db/auth/privilege_parser.h:35,
|                  from src/mongo/db/auth/privilege.h:22,
|                  from src/mongo/db/commands.h:24,
|                  from src/mongo/db/commands/user_management_commands.h:31,
|                  from src/mongo/db/commands/user_management_commands.cpp:=
31:
| src/mongo/bson/util/atomic_int.h:128:4: error: #error "unsupported compil=
er or platform"
|  #  error "unsupported compiler or platform"
|     ^
| src/mongo/bson/util/atomic_int.h:41:21: error: inline function 'void mong=
o::AtomicUInt::set(unsigned int)' used but never defined [-Werror]
|          inline void set(unsigned newX);
|                      ^
| src/mongo/bson/util/atomic_int.h:44:27: error: inline function 'mongo::At=
omicUInt mongo::AtomicUInt::operator++(int)' used but never defined [-Werro=
r]
|          inline AtomicUInt operator++(int);// postfix++
|                            ^
| src/mongo/bson/util/atomic_int.h:45:27: error: inline function 'mongo::At=
omicUInt mongo::AtomicUInt::operator--()' used but never defined [-Werror]
|          inline AtomicUInt operator--(); // --prefix
|                            ^
| cc1plus: all warnings being treated as errors
| scons: *** [build/linux2/disable-scripting/ld_arm-oe-linux-gnueabi-g++/ss=
l/use-system-boost/use-system-pcre/use-system-tcmalloc/mongo/db/auth/privil=
ege.o] Error 1
| src/mongo/bson/util/atomic_int.h:41:21: error: inline function 'void mong=
o::AtomicUInt::set(unsigned int)' used but never defined [-Werror]
|          inline void set(unsigned newX);
|                      ^
| src/mongo/bson/util/atomic_int.h:44:27: error: inline function 'mongo::At=
omicUInt mongo::AtomicUInt::operator++(int)' used but never defined [-Werro=
r]
|          inline AtomicUInt operator++(int);// postfix++
|                            ^
| src/mongo/bson/util/atomic_int.h:45:27: error: inline function 'mongo::At=
omicUInt mongo::AtomicUInt::operator--()' used but never defined [-Werror]
|          inline AtomicUInt operator--(); // --prefix
|                            ^
| cc1plus: all warnings being treated as errors
| scons: *** [build/linux2/disable-scripting/ld_arm-oe-linux-gnueabi-g++/ss=
l/use-system-boost/use-system-pcre/use-system-tcmalloc/mongo/db/commands/fi=
nd_and_modify_common.o] Error 1
| src/mongo/bson/util/atomic_int.h:41:21: error: inline function 'void mong=
o::AtomicUInt::set(unsigned int)' used but never defined [-Werror]
|          inline void set(unsigned newX);
|                      ^
=2E.....

>=20
> diff --git a/meta-oe/recipes-support/mongodb/mongodb/0001-Make-it-possibl=
e-to-disable-the-use-of-v8.patch b/meta-oe/recipes-support/mongodb/mongodb/=
0001-Make-it-possible-to-disable-the-use-of-v8.patch
> new file mode 100644
> index 0000000..311ac6c
> --- /dev/null
> +++ b/meta-oe/recipes-support/mongodb/mongodb/0001-Make-it-possible-to-di=
sable-the-use-of-v8.patch
> @@ -0,0 +1,49 @@
> +From bffde38f3b3d6285019e38a30c4573326e1dd2ea Mon Sep 17 00:00:00 2001
> +From: Michael Hudson-Doyle <michael.hudson@linaro.org>
> +Date: Fri, 20 Dec 2013 11:10:43 +1300
> +Subject: [PATCH 1/3] Make it possible to disable the use of v8.
> +
> +Currently v8 is always built in, no matter what you pass to scons.
> +
> +This removes the (useless) --usev8 flag for scons and replaces it with a
> +--disable-scripting option instead.
> +---
> + SConstruct | 8 +++++---
> + 1 file changed, 5 insertions(+), 3 deletions(-)
> +
> +diff --git a/SConstruct b/SConstruct
> +index fd92fe4..1f14083 100644
> +--- a/SConstruct
> ++++ b/SConstruct
> +@@ -222,7 +222,7 @@ add_option( "asio" , "Use Asynchronous IO (NOT READY=
 YET)" , 0 , True )
> + add_option( "ssl" , "Enable SSL" , 0 , True )
> +=20
> + # library choices
> +-add_option( "usev8" , "use v8 for javascript" , 0 , True )
> ++add_option( "disable-scripting" , "do not build support for javascript"=
 , 0 , True )
> + add_option( "libc++", "use libc++ (experimental, requires clang)", 0, T=
rue )
> +=20
> + # mongo feature options
> +@@ -439,7 +439,7 @@ static =3D has_option( "static" )
> +=20
> + noshell =3D has_option( "noshell" )=20
> +=20
> +-usev8 =3D has_option( "usev8" )=20
> ++disable_scripting =3D has_option( "disable-scripting" )
> +=20
> + asio =3D has_option( "asio" )
> +=20
> +@@ -599,7 +599,9 @@ if has_option( "durableDefaultOn" ):
> + if has_option( "durableDefaultOff" ):
> +     env.Append( CPPDEFINES=3D[ "_DURABLEDEFAULTOFF" ] )
> +=20
> +-if ( not ( usev8 or justClientLib) ):
> ++if disable_scripting or justClientLib:
> ++    usev8 =3D False
> ++else:
> +     usev8 =3D True
> +=20
> + extraLibPlaces =3D []
> +--=20
> +1.8.4.2
> +
> diff --git a/meta-oe/recipes-support/mongodb/mongodb/0001-replace-os.unam=
e-with-os.getenv-TARGET_ARCH.patch b/meta-oe/recipes-support/mongodb/mongod=
b/0001-replace-os.uname-with-os.getenv-TARGET_ARCH.patch
> new file mode 100644
> index 0000000..547c3bd
> --- /dev/null
> +++ b/meta-oe/recipes-support/mongodb/mongodb/0001-replace-os.uname-with-=
os.getenv-TARGET_ARCH.patch
> @@ -0,0 +1,50 @@
> +From ef482650fb6d990e4953104d7141d9a0fa4c872f Mon Sep 17 00:00:00 2001
> +From: Koen Kooi <koen.kooi@linaro.org>
> +Date: Tue, 4 Feb 2014 10:56:35 +0100
> +Subject: [PATCH] replace os.uname with os.getenv(OE_TARGET_ARCH)
> +
> +This fixes crosscompilation
> +
> +Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
> +Upstream-Status: Inappropiate [OE specific]
> +---
> + SConstruct | 8 ++++----
> + 1 file changed, 4 insertions(+), 4 deletions(-)
> +
> +diff --git a/SConstruct b/SConstruct
> +index 4f26be7..a353323 100644
> +--- a/SConstruct
> ++++ b/SConstruct
> +@@ -265,9 +265,9 @@ add_option( "pch" , "use precompiled headers to spee=
d up the build (experimental
> + add_option( "distcc" , "use distcc for distributing builds" , 0 , False=
 )
> +=20
> + # debugging/profiling help
> +-if os.sys.platform.startswith("linux") and (os.uname()[-1] =3D=3D 'x86_=
64'):
> ++if os.sys.platform.startswith("linux") and (os.getenv("OE_TARGET_ARCH")=
 =3D=3D 'x86_64'):
> +     defaultAllocator =3D 'tcmalloc'
> +-elif (os.sys.platform =3D=3D "darwin") and (os.uname()[-1] =3D=3D 'x86_=
64'):
> ++elif (os.sys.platform =3D=3D "darwin") and (os.getenv("OE_TARGET_ARCH")=
 =3D=3D 'x86_64'):
> +     defaultAllocator =3D 'tcmalloc'
> + else:
> +     defaultAllocator =3D 'system'
> +@@ -673,7 +673,7 @@ if has_option( "full" ):
> + # ---- other build setup -----
> +=20
> + if "uname" in dir(os):
> +-    processor =3D os.uname()[4]
> ++    processor =3D os.getenv("OE_TARGET_ARCH")
> + else:
> +     processor =3D "i386"
> +=20
> +@@ -702,7 +702,7 @@ elif linux:
> +=20
> +     env.Append( LIBS=3D['m'] )
> +=20
> +-    if os.uname()[4] =3D=3D "x86_64" and not force32:
> ++    if os.getenv("OE_TARGET_ARCH") =3D=3D "x86_64" and not force32:
> +         linux64 =3D True
> +         nixLibPrefix =3D "lib64"
> +         env.Append( EXTRALIBPATH=3D["/usr/lib64" , "/lib64" ] )
> +--=20
> +1.8.4.2
> +
> diff --git a/meta-oe/recipes-support/mongodb/mongodb/0002-Fix-linking-whe=
n-scripting-is-disabled.patch b/meta-oe/recipes-support/mongodb/mongodb/000=
2-Fix-linking-when-scripting-is-disabled.patch
> new file mode 100644
> index 0000000..d8d5a3b
> --- /dev/null
> +++ b/meta-oe/recipes-support/mongodb/mongodb/0002-Fix-linking-when-scrip=
ting-is-disabled.patch
> @@ -0,0 +1,25 @@
> +From 52d68642205626cad3bac3a53e269c765ccff676 Mon Sep 17 00:00:00 2001
> +From: Michael Hudson-Doyle <michael.hudson@linaro.org>
> +Date: Fri, 20 Dec 2013 12:28:27 +1300
> +Subject: [PATCH 2/3] Fix linking when scripting is disabled.
> +
> +---
> + src/mongo/scripting/engine_none.cpp | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/src/mongo/scripting/engine_none.cpp b/src/mongo/scripting/e=
ngine_none.cpp
> +index f5c7109..9ae9d57 100644
> +--- a/src/mongo/scripting/engine_none.cpp
> ++++ b/src/mongo/scripting/engine_none.cpp
> +@@ -33,4 +33,8 @@ namespace mongo {
> +     void ScriptEngine::setup() {
> +         // noop
> +     }
> ++
> ++    std::string ScriptEngine::getInterpreterVersionString() {
> ++        return "none";
> ++    }
> + }
> +--=20
> +1.8.4.2
> +
> diff --git a/meta-oe/recipes-support/mongodb/mongodb/0003-Do-not-build-mo=
ngo-binary-when-scripting-is-disabled.patch b/meta-oe/recipes-support/mongo=
db/mongodb/0003-Do-not-build-mongo-binary-when-scripting-is-disabled.patch
> new file mode 100644
> index 0000000..5c314b1
> --- /dev/null
> +++ b/meta-oe/recipes-support/mongodb/mongodb/0003-Do-not-build-mongo-bin=
ary-when-scripting-is-disabled.patch
> @@ -0,0 +1,64 @@
> +From 1f8e10747af3988e8ddee609bea990f622dd746a Mon Sep 17 00:00:00 2001
> +From: Michael Hudson-Doyle <michael.hudson@linaro.org>
> +Date: Wed, 22 Jan 2014 13:53:10 +1300
> +Subject: [PATCH 3/3] * Do not build 'mongo' binary when scripting is dis=
abled
> + * Do not build the jstests when scripting is disabled
> +
> +---
> + SConstruct           | 8 ++++++--
> + src/mongo/SConscript | 4 +++-
> + 2 files changed, 9 insertions(+), 3 deletions(-)
> +
> +diff --git a/SConstruct b/SConstruct
> +index 1f14083..a69cf0a 100644
> +--- a/SConstruct
> ++++ b/SConstruct
> +@@ -437,10 +437,13 @@ else:
> +=20
> + static =3D has_option( "static" )
> +=20
> +-noshell =3D has_option( "noshell" )=20
> +-
> + disable_scripting =3D has_option( "disable-scripting" )
> +=20
> ++if not disable_scripting:
> ++    noshell =3D has_option( "noshell" )
> ++else:
> ++    noshell =3D True
> ++
> + asio =3D has_option( "asio" )
> +=20
> + usePCH =3D has_option( "usePCH" )
> +@@ -1671,6 +1674,7 @@ Export("get_option")
> + Export("has_option use_system_version_of_library")
> + Export("installSetup mongoCodeVersion")
> + Export("usev8")
> ++Export("disable_scripting")
> + Export("darwin windows solaris linux freebsd nix")
> + Export('module_sconscripts')
> + Export("debugBuild optBuild")
> +diff --git a/src/mongo/SConscript b/src/mongo/SConscript
> +index d84267e..dc0ca3a 100644
> +--- a/src/mongo/SConscript
> ++++ b/src/mongo/SConscript
> +@@ -6,6 +6,7 @@ import os
> + import itertools
> + from buildscripts import utils
> +=20
> ++Import("disable_scripting")
> + Import("env")
> + Import("shellEnv")
> + Import("testEnv")
> +@@ -1022,7 +1023,8 @@ test =3D testEnv.Install(
> +                     [ f for f in Glob("dbtests/*.cpp")
> +                       if not str(f).endswith('framework.cpp') and
> +                          not str(f).endswith('framework_options.cpp') a=
nd
> +-                         not str(f).endswith('framework_options_init.cp=
p') ],
> ++                         not str(f).endswith('framework_options_init.cp=
p') and
> ++                         not (str(f).endswith('jstests.cpp') and disabl=
e_scripting)],
> +                     LIBDEPS =3D [
> +                        "mutable_bson_test_utils",
> +                        "mongocommon",
> +--=20
> +1.8.4.2
> +
> diff --git a/meta-oe/recipes-support/mongodb/mongodb_git.bb b/meta-oe/rec=
ipes-support/mongodb/mongodb_git.bb
> new file mode 100644
> index 0000000..f0fe240
> --- /dev/null
> +++ b/meta-oe/recipes-support/mongodb/mongodb_git.bb
> @@ -0,0 +1,38 @@
> +SUMMARY =3D "mongodb"
> +LICENSE =3D "AGPLv3 & Apache-2.0"
> +LIC_FILES_CHKSUM =3D "file://GNU-AGPL-3.0.txt;md5=3D73f1eb20517c55bf9493=
b7dd6e480788 \
> +                    file://APACHE-2.0.txt;md5=3D3b83ef96387f14655fc854dd=
c3c6bd57"
> +
> +DEPENDS =3D "openssl libpcre boost"
> +# Mongo uses tcmalloc on x86_64, which is provided by gperftools
> +DEPENDS_append_x86-64 =3D " gperftools"
> +
> +inherit scons
> +
> +PV =3D "2.5.5+git${SRCPV}"
> +SRCREV =3D "588dc81b0822ebb46f80e152b94527a882e6ea5e"
> +SRC_URI =3D "git://github.com/mongodb/mongo.git \
> +           file://0001-Make-it-possible-to-disable-the-use-of-v8.patch \
> +           file://0002-Fix-linking-when-scripting-is-disabled.patch \
> +           file://0003-Do-not-build-mongo-binary-when-scripting-is-disab=
led.patch \
> +           file://0001-replace-os.uname-with-os.getenv-TARGET_ARCH.patch=
 \
> +          "
> +
> +S =3D "${WORKDIR}/git"
> +
> +export OE_TARGET_ARCH=3D"${TARGET_ARCH}"
> +
> +EXTRA_OESCONS =3D "--prefix=3D${D}${prefix} \
> +                 --propagate-shell-environment \
> +                 --cc-use-shell-environment \
> +                 --cxx-use-shell-environment \
> +                 --ld=3D'${TARGET_PREFIX}g++' \
> +                 --ssl \
> +                 --use-system-pcre \=20
> +                 --use-system-boost \
> +                 --use-system-tcmalloc \
> +                 --disable-scripting \
> +                 --nostrip \
> +                 mongod mongos"
> +
> +
> --=20
> 1.8.4.2
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--nnfBUBcla7C6E0rv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMWpbUACgkQN1Ujt2V2gBzJCgCfTCDKOnuWKKU+kTl9+jpZZuT5
4lYAn3bfJa5LLGqruUJOhhX8rgSQTvTw
=Itwe
-----END PGP SIGNATURE-----

--nnfBUBcla7C6E0rv--
