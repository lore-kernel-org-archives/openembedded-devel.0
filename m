Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f45.google.com (mail-ee0-f45.google.com [74.125.83.45])
	by mail.openembedded.org (Postfix) with ESMTP id 6B0A36B592
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Mar 2014 23:21:51 +0000 (UTC)
Received: by mail-ee0-f45.google.com with SMTP id d17so5323473eek.4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Mar 2014 16:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=wnZ28zV2HMvw3EMcYjrdHHeQHn2sm/+x7+YIhyDLFhY=;
	b=J8XsYumLnzkmMCBgQ3IA11F++Jd3LW2z1/63YqRWgxpshpUnXiACHPn5rHGWF4ZAxP
	qz2rbJyox0WsmUaxIQ7Uj1ibEtwcPy52KmV2lYtS0yvBPOvsnKHgQIYR4AP9Z7XjE7O6
	h/Pd3akadNVimJ9+ZFpvzwk2Vxukh1SAWMl2r3mPR6k5DwznHjFj1ZI5LhCRO8wJkddm
	DF6+b9e0GF/81O7XiERItSHufI4E5B1m/CK3xl0U0G1o5lYYTz9DAsnIjBP6VPJuXJWQ
	fdWC4iTn9VWQcUqIRXSwSWLGCrGWo6GVKFdwkDLHIE5etM5pf6EGsGhndrsScwYP2Kvn
	GmgA==
X-Received: by 10.14.246.1 with SMTP id p1mr19750879eer.20.1396135311578;
	Sat, 29 Mar 2014 16:21:51 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	g3sm21741201eet.35.2014.03.29.16.21.49 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 29 Mar 2014 16:21:50 -0700 (PDT)
Date: Sun, 30 Mar 2014 00:21:54 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Koen Kooi <koen.kooi@linaro.org>
Message-ID: <20140329232154.GB2428@jama>
References: <1391518370-19990-1-git-send-email-koen.kooi@linaro.org>
	<20140305041901.GU26981@jama> <5316AB64.3080501@linaro.org>
	<20140305055717.GV26981@jama> <5316DE87.7090906@linaro.org>
MIME-Version: 1.0
In-Reply-To: <5316DE87.7090906@linaro.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Sat, 29 Mar 2014 23:21:52 -0000
X-Groupsio-MsgNum: 48893
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="A6N2fC+uXW/VQSAv"
Content-Disposition: inline

--A6N2fC+uXW/VQSAv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 05, 2014 at 04:21:27PM +0800, Koen Kooi wrote:
> On 03/05/2014 01:57 PM, Martin Jansa wrote:
> > On Wed, Mar 05, 2014 at 12:43:16PM +0800, Koen Kooi wrote:
> >> On 03/05/2014 12:19 PM, Martin Jansa wrote:
> >>> On Tue, Feb 04, 2014 at 01:52:50PM +0100, Koen Kooi wrote:
> >>>> This builds the server and the sharding helper, but not the CLI. The=
 CLI will need a libv8 recipe since fixing the built-in copy to cross build=
 is too much work.
> >>>>
> >>>> Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
> >>>> ---
> >>>>    ...Make-it-possible-to-disable-the-use-of-v8.patch | 49 +++++++++=
++++++++
> >>>>    ...place-os.uname-with-os.getenv-TARGET_ARCH.patch | 50 +++++++++=
++++++++
> >>>>    ...02-Fix-linking-when-scripting-is-disabled.patch | 25 +++++++++
> >>>>    ...d-mongo-binary-when-scripting-is-disabled.patch | 64 +++++++++=
+++++++++++++
> >>>>    meta-oe/recipes-support/mongodb/mongodb_git.bb     | 38 +++++++++=
++++
> >>>>    5 files changed, 226 insertions(+)
> >>>>    create mode 100644 meta-oe/recipes-support/mongodb/mongodb/0001-M=
ake-it-possible-to-disable-the-use-of-v8.patch
> >>>>    create mode 100644 meta-oe/recipes-support/mongodb/mongodb/0001-r=
eplace-os.uname-with-os.getenv-TARGET_ARCH.patch
> >>>>    create mode 100644 meta-oe/recipes-support/mongodb/mongodb/0002-F=
ix-linking-when-scripting-is-disabled.patch
> >>>>    create mode 100644 meta-oe/recipes-support/mongodb/mongodb/0003-D=
o-not-build-mongo-binary-when-scripting-is-disabled.patch
> >>>>    create mode 100644 meta-oe/recipes-support/mongodb/mongodb_git.bb
> >>>
> >>> It's already merged, but can you please check this error when building
> >>> it for qemuarm?
> >>>
> >>> | arm-oe-linux-gnueabi-g++ -march=3Darmv5te -marm -mthumb-interwork -=
-sysroot=3D/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/=
qemuarm -o build/linux2/disable-scripting/ld_arm-oe-linux-gnueabi-g++/ssl/u=
se-system-boost/use-system-pcre/use-system-tcmalloc/mongo/db/commands/find_=
and_modify_common.o -c -Wnon-virtual-dtor -Woverloaded-virtual -fPIC -fno-s=
trict-aliasing -ggdb -pthread -Wall -Wsign-compare -Wno-unknown-pragmas -Wi=
nvalid-pch -Werror -pipe -O3 -Wno-unused-local-typedefs -Wno-unused-functio=
n -Wno-deprecated-declarations -fno-builtin-memcmp -D_SCONS -DMONGO_EXPOSE_=
MACROS -DSUPPORT_UTF8 -DMONGO_OPTIMIZED_BUILD -D_FILE_OFFSET_BITS=3D64 -DMO=
NGO_SSL -DMONGO_HAVE___THREAD -DBOOST_THREAD_VERSION=3D2 -DMONGO_HAVE_HEADE=
R_UNISTD_H -DMONGO_HAVE_EXECINFO_BACKTRACE -Ibuild/linux2/disable-scripting=
/ld_arm-oe-linux-gnueabi-g++/ssl/use-system-boost/use-system-pcre/use-syste=
m-tcmalloc/third_party/snappy -Isrc/third_party/snappy -Ibuild/linux2/disab=
le-scripting/ld_arm-oe-linux-gnuea
> bi
> >> -g++/ssl/use-system-boost/use-system-pcre/use-system-tcmalloc/third_pa=
rty/libstemmer_c/include -Isrc/third_party/libstemmer_c/include -Ibuild/lin=
ux2/disable-scripting/ld_arm-oe-linux-gnueabi-g++/ssl/use-system-boost/use-=
system-pcre/use-system-tcmalloc/third_party/s2 -Isrc/third_party/s2 -Ibuild=
/linux2/disable-scripting/ld_arm-oe-linux-gnueabi-g++/ssl/use-system-boost/=
use-system-pcre/use-system-tcmalloc -Isrc -Ibuild/linux2/disable-scripting/=
ld_arm-oe-linux-gnueabi-g++/ssl/use-system-boost/use-system-pcre/use-system=
-tcmalloc/mongo -Isrc/mongo -Ibuild/linux2/disable-scripting/ld_arm-oe-linu=
x-gnueabi-g++/ssl/use-system-boost/use-system-pcre/use-system-tcmalloc/thir=
d_party/s2 -Isrc/third_party/s2 -Ibuild/linux2/disable-scripting/ld_arm-oe-=
linux-gnueabi-g++/ssl/use-system-boost/use-system-pcre/use-system-tcmalloc/=
third_party/snappy -Isrc/third_party/snappy -Ibuild/linux2/disable-scriptin=
g/ld_arm-oe-linux-gnueabi-g++/ssl/use-system-boost/use-system-pcre/use-syst=
em-tcmalloc/third_party/ya
> ml-
> >> cpp-0.5.1/include -Isrc/third_party/yaml-cpp-0.5.1/include src/mongo/d=
b/commands/find_and_modify_common.cpp
> >>> | In file included from src/mongo/bson/bsonobj.h:29:0,
> >>> |                  from src/mongo/db/pipeline/value_internal.h:32,
> >>> |                  from src/mongo/db/pipeline/value.h:31,
> >>> |                  from src/mongo/db/pipeline/pipeline.h:33,
> >>> |                  from src/mongo/db/pipeline/pipeline.cpp:32:
> >>> | src/mongo/bson/util/atomic_int.h:128:4: error: #error "unsupported =
compiler or platform"
> >>> |  #  error "unsupported compiler or platform"
> >>> |     ^
> >>> | In file included from src/mongo/bson/bsonobj.h:29:0,
> >>> |                  from src/mongo/db/jsobj.h:38,
> >>> |                  from src/mongo/db/auth/privilege_parser.h:35,
> >>> |                  from src/mongo/db/auth/privilege.h:22,
> >>> |                  from src/mongo/db/auth/privilege.cpp:16:
> >>> | src/mongo/bson/util/atomic_int.h:128:4: error: #error "unsupported =
compiler or platform"
> >>> |  #  error "unsupported compiler or platform"
> >>> |     ^
> >>> | In file included from src/mongo/bson/bsonobj.h:29:0,
> >>> |                  from src/mongo/db/jsobj.h:38,
> >>> |                  from src/mongo/db/auth/privilege_parser.h:35,
> >>> |                  from src/mongo/db/auth/privilege.h:22,
> >>> |                  from src/mongo/db/commands/mr.h:37,
> >>> |                  from src/mongo/db/commands/mr_common.cpp:29:
> >>> | src/mongo/bson/util/atomic_int.h:128:4: error: #error "unsupported =
compiler or platform"
> >>> |  #  error "unsupported compiler or platform"
> >>> |     ^
> >>> | In file included from src/mongo/bson/bsonobj.h:29:0,
> >>> |                  from src/mongo/db/jsobj.h:38,
> >>> |                  from src/mongo/bson/mutable/element.h:20,
> >>> |                  from src/mongo/db/auth/authorization_manager.h:40,
> >>> |                  from src/mongo/db/auth/authorization_session.h:38,
> >>> |                  from src/mongo/db/auth/authorization_session.cpp:2=
9:
> >>> | src/mongo/bson/util/atomic_int.h:128:4: error: #error "unsupported =
compiler or platform"
> >>> |  #  error "unsupported compiler or platform"
> >>> |     ^
> >>> | arm-oe-linux-gnueabi-g++ -march=3Darmv5te -marm -mthumb-interwork -=
-sysroot=3D/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/=
qemuarm -o build/linux2/disable-scripting/ld_arm-oe-linux-gnueabi-g++/ssl/u=
se-system-boost/use-system-pcre/use-system-tcmalloc/mongo/db/commands/user_=
management_commands.o -c -Wnon-virtual-dtor -Woverloaded-virtual -fPIC -fno=
-strict-aliasing -ggdb -pthread -Wall -Wsign-compare -Wno-unknown-pragmas -=
Winvalid-pch -Werror -pipe -O3 -Wno-unused-local-typedefs -Wno-unused-funct=
ion -Wno-deprecated-declarations -fno-builtin-memcmp -D_SCONS -DMONGO_EXPOS=
E_MACROS -DSUPPORT_UTF8 -DMONGO_OPTIMIZED_BUILD -D_FILE_OFFSET_BITS=3D64 -D=
MONGO_SSL -DMONGO_HAVE___THREAD -DBOOST_THREAD_VERSION=3D2 -DMONGO_HAVE_HEA=
DER_UNISTD_H -DMONGO_HAVE_EXECINFO_BACKTRACE -Ibuild/linux2/disable-scripti=
ng/ld_arm-oe-linux-gnueabi-g++/ssl/use-system-boost/use-system-pcre/use-sys=
tem-tcmalloc/third_party/snappy -Isrc/third_party/snappy -Ibuild/linux2/dis=
able-scripting/ld_arm-oe-linux-gnu
> ea
> >> bi-g++/ssl/use-system-boost/use-system-pcre/use-system-tcmalloc/third_=
party/libstemmer_c/include -Isrc/third_party/libstemmer_c/include -Ibuild/l=
inux2/disable-scripting/ld_arm-oe-linux-gnueabi-g++/ssl/use-system-boost/us=
e-system-pcre/use-system-tcmalloc/third_party/s2 -Isrc/third_party/s2 -Ibui=
ld/linux2/disable-scripting/ld_arm-oe-linux-gnueabi-g++/ssl/use-system-boos=
t/use-system-pcre/use-system-tcmalloc -Isrc -Ibuild/linux2/disable-scriptin=
g/ld_arm-oe-linux-gnueabi-g++/ssl/use-system-boost/use-system-pcre/use-syst=
em-tcmalloc/mongo -Isrc/mongo -Ibuild/linux2/disable-scripting/ld_arm-oe-li=
nux-gnueabi-g++/ssl/use-system-boost/use-system-pcre/use-system-tcmalloc/th=
ird_party/s2 -Isrc/third_party/s2 -Ibuild/linux2/disable-scripting/ld_arm-o=
e-linux-gnueabi-g++/ssl/use-system-boost/use-system-pcre/use-system-tcmallo=
c/third_party/snappy -Isrc/third_party/snappy -Ibuild/linux2/disable-script=
ing/ld_arm-oe-linux-gnueabi-g++/ssl/use-system-boost/use-system-pcre/use-sy=
stem-tcmalloc/third_party/
> yam
> >> l-cpp-0.5.1/include -Isrc/third_party/yaml-cpp-0.5.1/include src/mongo=
/db/commands/user_management_commands.cpp
> >>> | In file included from src/mongo/bson/bsonobj.h:29:0,
> >>> |                  from src/mongo/db/jsobj.h:38,
> >>> |                  from src/mongo/db/diskloc.h:37,
> >>> |                  from src/mongo/db/clientcursor.h:33,
> >>> |                  from src/mongo/db/query/new_find.h:33,
> >>> |                  from src/mongo/db/query/new_find.cpp:29:
> >>> | src/mongo/bson/util/atomic_int.h:128:4: error: #error "unsupported =
compiler or platform"
> >>> |  #  error "unsupported compiler or platform"
> >>> |     ^
> >>> | In file included from src/mongo/bson/bsonobj.h:29:0,
> >>> |                  from src/mongo/db/jsobj.h:38,
> >>> |                  from src/mongo/db/auth/privilege_parser.h:35,
> >>> |                  from src/mongo/db/auth/privilege.h:22,
> >>> |                  from src/mongo/db/commands/find_and_modify.h:34,
> >>> |                  from src/mongo/db/commands/find_and_modify_common.=
cpp:31:
> >>> | src/mongo/bson/util/atomic_int.h:128:4: error: #error "unsupported =
compiler or platform"
> >>> |  #  error "unsupported compiler or platform"
> >>> |     ^
> >>> | In file included from src/mongo/bson/bsonobj.h:29:0,
> >>> |                  from src/mongo/db/jsobj.h:38,
> >>> |                  from src/mongo/db/auth/privilege_parser.h:35,
> >>> |                  from src/mongo/db/auth/privilege.h:22,
> >>> |                  from src/mongo/db/commands/hashcmd.cpp:42:
> >>> | src/mongo/bson/util/atomic_int.h:128:4: error: #error "unsupported =
compiler or platform"
> >>> |  #  error "unsupported compiler or platform"
> >>> |     ^
> >>> | In file included from src/mongo/bson/bsonobj.h:29:0,
> >>> |                  from src/mongo/db/jsobj.h:38,
> >>> |                  from src/mongo/db/auth/privilege_parser.h:35,
> >>> |                  from src/mongo/db/auth/privilege.h:22,
> >>> |                  from src/mongo/db/commands.h:24,
> >>> |                  from src/mongo/db/commands/user_management_command=
s.h:31,
> >>> |                  from src/mongo/db/commands/user_management_command=
s.cpp:31:
> >>> | src/mongo/bson/util/atomic_int.h:128:4: error: #error "unsupported =
compiler or platform"
> >>> |  #  error "unsupported compiler or platform"
> >>> |     ^
> >>> | src/mongo/bson/util/atomic_int.h:41:21: error: inline function 'voi=
d mongo::AtomicUInt::set(unsigned int)' used but never defined [-Werror]
> >>> |          inline void set(unsigned newX);
> >>> |                      ^
> >>> | src/mongo/bson/util/atomic_int.h:44:27: error: inline function 'mon=
go::AtomicUInt mongo::AtomicUInt::operator++(int)' used but never defined [=
-Werror]
> >>> |          inline AtomicUInt operator++(int);// postfix++
> >>> |                            ^
> >>> | src/mongo/bson/util/atomic_int.h:45:27: error: inline function 'mon=
go::AtomicUInt mongo::AtomicUInt::operator--()' used but never defined [-We=
rror]
> >>> |          inline AtomicUInt operator--(); // --prefix
> >>> |                            ^
> >>> | cc1plus: all warnings being treated as errors
> >>> | scons: *** [build/linux2/disable-scripting/ld_arm-oe-linux-gnueabi-=
g++/ssl/use-system-boost/use-system-pcre/use-system-tcmalloc/mongo/db/auth/=
privilege.o] Error 1
> >>> | src/mongo/bson/util/atomic_int.h:41:21: error: inline function 'voi=
d mongo::AtomicUInt::set(unsigned int)' used but never defined [-Werror]
> >>> |          inline void set(unsigned newX);
> >>> |                      ^
> >>> | src/mongo/bson/util/atomic_int.h:44:27: error: inline function 'mon=
go::AtomicUInt mongo::AtomicUInt::operator++(int)' used but never defined [=
-Werror]
> >>> |          inline AtomicUInt operator++(int);// postfix++
> >>> |                            ^
> >>> | src/mongo/bson/util/atomic_int.h:45:27: error: inline function 'mon=
go::AtomicUInt mongo::AtomicUInt::operator--()' used but never defined [-We=
rror]
> >>> |          inline AtomicUInt operator--(); // --prefix
> >>> |                            ^
> >>> | cc1plus: all warnings being treated as errors
> >>> | scons: *** [build/linux2/disable-scripting/ld_arm-oe-linux-gnueabi-=
g++/ssl/use-system-boost/use-system-pcre/use-system-tcmalloc/mongo/db/comma=
nds/find_and_modify_common.o] Error 1
> >>> | src/mongo/bson/util/atomic_int.h:41:21: error: inline function 'voi=
d mongo::AtomicUInt::set(unsigned int)' used but never defined [-Werror]
> >>> |          inline void set(unsigned newX);
> >>> |                      ^
> >>> ......
> >>
> >> It looks like gcc for qemuarm lacks support for some atomic ops, the
> >> above seems to get triggered by __GCC_HAVE_SYNC_COMPARE_AND_SWAP_4 not
> >> being there.
> >>
> >> Which gcc are you using, 4.8?
> >
> > Yup, 4.8 from oe-core.
>=20
> These atomic ops *are* available for gcc 4.8, but it doesn't advertise=20
> them for armv5te. There are 2 solutions:
>=20
> 1) CFLAGS +=3D -D__GCC_HAVE_SYNC_COMPARE_AND_SWAP_4=3D1
> 2) Add a block to that files that tests for gcc > 4.7.0 (that's what=20
> fedora does)
>=20
> I'll see if I can find time to fix this next week.

ping :)

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--A6N2fC+uXW/VQSAv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlM3VZIACgkQN1Ujt2V2gBxixgCgtQ8z+QMXsuJ9WqhZ4F+seVxC
eioAoIyT+H00rRbxnO8mhWP5whM0wvvz
=KhZg
-----END PGP SIGNATURE-----

--A6N2fC+uXW/VQSAv--
