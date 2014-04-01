Return-Path: <koen.kooi@linaro.org>
Received: from mail-wg0-f45.google.com (mail-wg0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id D1223605F4
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Apr 2014 06:50:15 +0000 (UTC)
Received: by mail-wg0-f45.google.com with SMTP id l18so6793162wgh.28
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Mar 2014 23:50:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=s0gknhLuv/YjfI9bgFA9l3tnLq8R7aNbNBBWfv9xMYA=;
	b=c1akPgSaEKv4IX9mBkiS3wnrsYXETmoRiTmKArfrV27TJogsALOm1ic3eZQaci5YCo
	LNhAlTqRqS+aKm6tJMwBmO8VREmpbza+zj275KTij/e5pkuLwga/88ApX57NT5PBhh0t
	oVOsiUZf3LwVvjjVvTxFes0Z6Z4s4Yj0yLr9hJOdrxpardz5BHQdrp36XOMsUjKIyd/R
	4gDYT1lZNyYRuP1Uq2vKm6KEYN37GrRkgEfdZY3ZP7QGybLSZWoa1kVggETqVtxsFZmx
	zn+GcM01AX+iiY1yXyps0oFC+WaWEGmE5VC1pctMpI6qQJz2ZaCWpTqyik9LLmWvBZNJ
	fD3Q==
X-Gm-Message-State: ALoCoQleTtuhugOij9eydJQANXEU8lKN+N1fE2JxfiFiTM0IMcF2/SjkRyi2G+Wu2xj5/CReGJOD
X-Received: by 10.194.173.193 with SMTP id bm1mr11429446wjc.55.1396335015864; 
	Mon, 31 Mar 2014 23:50:15 -0700 (PDT)
Received: from [172.20.0.102] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id
	e42sm38323249eev.32.2014.03.31.23.50.15 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 31 Mar 2014 23:50:15 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 7.2 \(1874\))
From: Koen Kooi <koen.kooi@linaro.org>
In-Reply-To: <20140329232154.GB2428@jama>
Date: Tue, 1 Apr 2014 08:50:15 +0200
Message-Id: <2C0383B9-CB95-4B36-B106-B4538D93FF38@linaro.org>
References: <1391518370-19990-1-git-send-email-koen.kooi@linaro.org>
	<20140305041901.GU26981@jama> <5316AB64.3080501@linaro.org>
	<20140305055717.GV26981@jama> <5316DE87.7090906@linaro.org>
	<20140329232154.GB2428@jama>
To: Martin Jansa <martin.jansa@gmail.com>
X-Mailer: Apple Mail (2.1874)
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
X-List-Received-Date: Tue, 01 Apr 2014 06:50:18 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Op 30 mrt. 2014, om 00:21 heeft Martin Jansa <martin.jansa@gmail.com> =
het volgende geschreven:

> On Wed, Mar 05, 2014 at 04:21:27PM +0800, Koen Kooi wrote:
>> On 03/05/2014 01:57 PM, Martin Jansa wrote:
>>> On Wed, Mar 05, 2014 at 12:43:16PM +0800, Koen Kooi wrote:
>>>> On 03/05/2014 12:19 PM, Martin Jansa wrote:
>>>>> On Tue, Feb 04, 2014 at 01:52:50PM +0100, Koen Kooi wrote:
>>>>>> This builds the server and the sharding helper, but not the CLI. =
The CLI will need a libv8 recipe since fixing the built-in copy to cross =
build is too much work.
>>>>>>=20
>>>>>> Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
>>>>>> ---
>>>>>>   ...Make-it-possible-to-disable-the-use-of-v8.patch | 49 =
+++++++++++++++++
>>>>>>   ...place-os.uname-with-os.getenv-TARGET_ARCH.patch | 50 =
+++++++++++++++++
>>>>>>   ...02-Fix-linking-when-scripting-is-disabled.patch | 25 =
+++++++++
>>>>>>   ...d-mongo-binary-when-scripting-is-disabled.patch | 64 =
++++++++++++++++++++++
>>>>>>   meta-oe/recipes-support/mongodb/mongodb_git.bb     | 38 =
+++++++++++++
>>>>>>   5 files changed, 226 insertions(+)
>>>>>>   create mode 100644 =
meta-oe/recipes-support/mongodb/mongodb/0001-Make-it-possible-to-disable-t=
he-use-of-v8.patch
>>>>>>   create mode 100644 =
meta-oe/recipes-support/mongodb/mongodb/0001-replace-os.uname-with-os.gete=
nv-TARGET_ARCH.patch
>>>>>>   create mode 100644 =
meta-oe/recipes-support/mongodb/mongodb/0002-Fix-linking-when-scripting-is=
-disabled.patch
>>>>>>   create mode 100644 =
meta-oe/recipes-support/mongodb/mongodb/0003-Do-not-build-mongo-binary-whe=
n-scripting-is-disabled.patch
>>>>>>   create mode 100644 =
meta-oe/recipes-support/mongodb/mongodb_git.bb
>>>>>=20
>>>>> It's already merged, but can you please check this error when =
building
>>>>> it for qemuarm?
>>>>>=20
>>>>> | arm-oe-linux-gnueabi-g++ -march=3Darmv5te -marm =
-mthumb-interwork =
--sysroot=3D/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroot=
s/qemuarm -o =
build/linux2/disable-scripting/ld_arm-oe-linux-gnueabi-g++/ssl/use-system-=
boost/use-system-pcre/use-system-tcmalloc/mongo/db/commands/find_and_modif=
y_common.o -c -Wnon-virtual-dtor -Woverloaded-virtual -fPIC =
-fno-strict-aliasing -ggdb -pthread -Wall -Wsign-compare =
-Wno-unknown-pragmas -Winvalid-pch -Werror -pipe -O3 =
-Wno-unused-local-typedefs -Wno-unused-function =
-Wno-deprecated-declarations -fno-builtin-memcmp -D_SCONS =
-DMONGO_EXPOSE_MACROS -DSUPPORT_UTF8 -DMONGO_OPTIMIZED_BUILD =
-D_FILE_OFFSET_BITS=3D64 -DMONGO_SSL -DMONGO_HAVE___THREAD =
-DBOOST_THREAD_VERSION=3D2 -DMONGO_HAVE_HEADER_UNISTD_H =
-DMONGO_HAVE_EXECINFO_BACKTRACE =
-Ibuild/linux2/disable-scripting/ld_arm-oe-linux-gnueabi-g++/ssl/use-syste=
m-boost/use-system-pcre/use-system-tcmalloc/third_party/snappy =
-Isrc/third_party/snappy =
-Ibuild/linux2/disable-scripting/ld_arm-oe-linux-gnuea
>> bi
>>>> =
-g++/ssl/use-system-boost/use-system-pcre/use-system-tcmalloc/third_party/=
libstemmer_c/include -Isrc/third_party/libstemmer_c/include =
-Ibuild/linux2/disable-scripting/ld_arm-oe-linux-gnueabi-g++/ssl/use-syste=
m-boost/use-system-pcre/use-system-tcmalloc/third_party/s2 =
-Isrc/third_party/s2 =
-Ibuild/linux2/disable-scripting/ld_arm-oe-linux-gnueabi-g++/ssl/use-syste=
m-boost/use-system-pcre/use-system-tcmalloc -Isrc =
-Ibuild/linux2/disable-scripting/ld_arm-oe-linux-gnueabi-g++/ssl/use-syste=
m-boost/use-system-pcre/use-system-tcmalloc/mongo -Isrc/mongo =
-Ibuild/linux2/disable-scripting/ld_arm-oe-linux-gnueabi-g++/ssl/use-syste=
m-boost/use-system-pcre/use-system-tcmalloc/third_party/s2 =
-Isrc/third_party/s2 =
-Ibuild/linux2/disable-scripting/ld_arm-oe-linux-gnueabi-g++/ssl/use-syste=
m-boost/use-system-pcre/use-system-tcmalloc/third_party/snappy =
-Isrc/third_party/snappy =
-Ibuild/linux2/disable-scripting/ld_arm-oe-linux-gnueabi-g++/ssl/use-syste=
m-boost/use-system-pcre/use-system-tcmalloc/third_party/ya
>> ml-
>>>> cpp-0.5.1/include -Isrc/third_party/yaml-cpp-0.5.1/include =
src/mongo/db/commands/find_and_modify_common.cpp
>>>>> | In file included from src/mongo/bson/bsonobj.h:29:0,
>>>>> |                  from src/mongo/db/pipeline/value_internal.h:32,
>>>>> |                  from src/mongo/db/pipeline/value.h:31,
>>>>> |                  from src/mongo/db/pipeline/pipeline.h:33,
>>>>> |                  from src/mongo/db/pipeline/pipeline.cpp:32:
>>>>> | src/mongo/bson/util/atomic_int.h:128:4: error: #error =
"unsupported compiler or platform"
>>>>> |  #  error "unsupported compiler or platform"
>>>>> |     ^
>>>>> | In file included from src/mongo/bson/bsonobj.h:29:0,
>>>>> |                  from src/mongo/db/jsobj.h:38,
>>>>> |                  from src/mongo/db/auth/privilege_parser.h:35,
>>>>> |                  from src/mongo/db/auth/privilege.h:22,
>>>>> |                  from src/mongo/db/auth/privilege.cpp:16:
>>>>> | src/mongo/bson/util/atomic_int.h:128:4: error: #error =
"unsupported compiler or platform"
>>>>> |  #  error "unsupported compiler or platform"
>>>>> |     ^
>>>>> | In file included from src/mongo/bson/bsonobj.h:29:0,
>>>>> |                  from src/mongo/db/jsobj.h:38,
>>>>> |                  from src/mongo/db/auth/privilege_parser.h:35,
>>>>> |                  from src/mongo/db/auth/privilege.h:22,
>>>>> |                  from src/mongo/db/commands/mr.h:37,
>>>>> |                  from src/mongo/db/commands/mr_common.cpp:29:
>>>>> | src/mongo/bson/util/atomic_int.h:128:4: error: #error =
"unsupported compiler or platform"
>>>>> |  #  error "unsupported compiler or platform"
>>>>> |     ^
>>>>> | In file included from src/mongo/bson/bsonobj.h:29:0,
>>>>> |                  from src/mongo/db/jsobj.h:38,
>>>>> |                  from src/mongo/bson/mutable/element.h:20,
>>>>> |                  from =
src/mongo/db/auth/authorization_manager.h:40,
>>>>> |                  from =
src/mongo/db/auth/authorization_session.h:38,
>>>>> |                  from =
src/mongo/db/auth/authorization_session.cpp:29:
>>>>> | src/mongo/bson/util/atomic_int.h:128:4: error: #error =
"unsupported compiler or platform"
>>>>> |  #  error "unsupported compiler or platform"
>>>>> |     ^
>>>>> | arm-oe-linux-gnueabi-g++ -march=3Darmv5te -marm =
-mthumb-interwork =
--sysroot=3D/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroot=
s/qemuarm -o =
build/linux2/disable-scripting/ld_arm-oe-linux-gnueabi-g++/ssl/use-system-=
boost/use-system-pcre/use-system-tcmalloc/mongo/db/commands/user_managemen=
t_commands.o -c -Wnon-virtual-dtor -Woverloaded-virtual -fPIC =
-fno-strict-aliasing -ggdb -pthread -Wall -Wsign-compare =
-Wno-unknown-pragmas -Winvalid-pch -Werror -pipe -O3 =
-Wno-unused-local-typedefs -Wno-unused-function =
-Wno-deprecated-declarations -fno-builtin-memcmp -D_SCONS =
-DMONGO_EXPOSE_MACROS -DSUPPORT_UTF8 -DMONGO_OPTIMIZED_BUILD =
-D_FILE_OFFSET_BITS=3D64 -DMONGO_SSL -DMONGO_HAVE___THREAD =
-DBOOST_THREAD_VERSION=3D2 -DMONGO_HAVE_HEADER_UNISTD_H =
-DMONGO_HAVE_EXECINFO_BACKTRACE =
-Ibuild/linux2/disable-scripting/ld_arm-oe-linux-gnueabi-g++/ssl/use-syste=
m-boost/use-system-pcre/use-system-tcmalloc/third_party/snappy =
-Isrc/third_party/snappy =
-Ibuild/linux2/disable-scripting/ld_arm-oe-linux-gnu
>> ea
>>>> =
bi-g++/ssl/use-system-boost/use-system-pcre/use-system-tcmalloc/third_part=
y/libstemmer_c/include -Isrc/third_party/libstemmer_c/include =
-Ibuild/linux2/disable-scripting/ld_arm-oe-linux-gnueabi-g++/ssl/use-syste=
m-boost/use-system-pcre/use-system-tcmalloc/third_party/s2 =
-Isrc/third_party/s2 =
-Ibuild/linux2/disable-scripting/ld_arm-oe-linux-gnueabi-g++/ssl/use-syste=
m-boost/use-system-pcre/use-system-tcmalloc -Isrc =
-Ibuild/linux2/disable-scripting/ld_arm-oe-linux-gnueabi-g++/ssl/use-syste=
m-boost/use-system-pcre/use-system-tcmalloc/mongo -Isrc/mongo =
-Ibuild/linux2/disable-scripting/ld_arm-oe-linux-gnueabi-g++/ssl/use-syste=
m-boost/use-system-pcre/use-system-tcmalloc/third_party/s2 =
-Isrc/third_party/s2 =
-Ibuild/linux2/disable-scripting/ld_arm-oe-linux-gnueabi-g++/ssl/use-syste=
m-boost/use-system-pcre/use-system-tcmalloc/third_party/snappy =
-Isrc/third_party/snappy =
-Ibuild/linux2/disable-scripting/ld_arm-oe-linux-gnueabi-g++/ssl/use-syste=
m-boost/use-system-pcre/use-system-tcmalloc/third_party/
>> yam
>>>> l-cpp-0.5.1/include -Isrc/third_party/yaml-cpp-0.5.1/include =
src/mongo/db/commands/user_management_commands.cpp
>>>>> | In file included from src/mongo/bson/bsonobj.h:29:0,
>>>>> |                  from src/mongo/db/jsobj.h:38,
>>>>> |                  from src/mongo/db/diskloc.h:37,
>>>>> |                  from src/mongo/db/clientcursor.h:33,
>>>>> |                  from src/mongo/db/query/new_find.h:33,
>>>>> |                  from src/mongo/db/query/new_find.cpp:29:
>>>>> | src/mongo/bson/util/atomic_int.h:128:4: error: #error =
"unsupported compiler or platform"
>>>>> |  #  error "unsupported compiler or platform"
>>>>> |     ^
>>>>> | In file included from src/mongo/bson/bsonobj.h:29:0,
>>>>> |                  from src/mongo/db/jsobj.h:38,
>>>>> |                  from src/mongo/db/auth/privilege_parser.h:35,
>>>>> |                  from src/mongo/db/auth/privilege.h:22,
>>>>> |                  from =
src/mongo/db/commands/find_and_modify.h:34,
>>>>> |                  from =
src/mongo/db/commands/find_and_modify_common.cpp:31:
>>>>> | src/mongo/bson/util/atomic_int.h:128:4: error: #error =
"unsupported compiler or platform"
>>>>> |  #  error "unsupported compiler or platform"
>>>>> |     ^
>>>>> | In file included from src/mongo/bson/bsonobj.h:29:0,
>>>>> |                  from src/mongo/db/jsobj.h:38,
>>>>> |                  from src/mongo/db/auth/privilege_parser.h:35,
>>>>> |                  from src/mongo/db/auth/privilege.h:22,
>>>>> |                  from src/mongo/db/commands/hashcmd.cpp:42:
>>>>> | src/mongo/bson/util/atomic_int.h:128:4: error: #error =
"unsupported compiler or platform"
>>>>> |  #  error "unsupported compiler or platform"
>>>>> |     ^
>>>>> | In file included from src/mongo/bson/bsonobj.h:29:0,
>>>>> |                  from src/mongo/db/jsobj.h:38,
>>>>> |                  from src/mongo/db/auth/privilege_parser.h:35,
>>>>> |                  from src/mongo/db/auth/privilege.h:22,
>>>>> |                  from src/mongo/db/commands.h:24,
>>>>> |                  from =
src/mongo/db/commands/user_management_commands.h:31,
>>>>> |                  from =
src/mongo/db/commands/user_management_commands.cpp:31:
>>>>> | src/mongo/bson/util/atomic_int.h:128:4: error: #error =
"unsupported compiler or platform"
>>>>> |  #  error "unsupported compiler or platform"
>>>>> |     ^
>>>>> | src/mongo/bson/util/atomic_int.h:41:21: error: inline function =
'void mongo::AtomicUInt::set(unsigned int)' used but never defined =
[-Werror]
>>>>> |          inline void set(unsigned newX);
>>>>> |                      ^
>>>>> | src/mongo/bson/util/atomic_int.h:44:27: error: inline function =
'mongo::AtomicUInt mongo::AtomicUInt::operator++(int)' used but never =
defined [-Werror]
>>>>> |          inline AtomicUInt operator++(int);// postfix++
>>>>> |                            ^
>>>>> | src/mongo/bson/util/atomic_int.h:45:27: error: inline function =
'mongo::AtomicUInt mongo::AtomicUInt::operator--()' used but never =
defined [-Werror]
>>>>> |          inline AtomicUInt operator--(); // --prefix
>>>>> |                            ^
>>>>> | cc1plus: all warnings being treated as errors
>>>>> | scons: *** =
[build/linux2/disable-scripting/ld_arm-oe-linux-gnueabi-g++/ssl/use-system=
-boost/use-system-pcre/use-system-tcmalloc/mongo/db/auth/privilege.o] =
Error 1
>>>>> | src/mongo/bson/util/atomic_int.h:41:21: error: inline function =
'void mongo::AtomicUInt::set(unsigned int)' used but never defined =
[-Werror]
>>>>> |          inline void set(unsigned newX);
>>>>> |                      ^
>>>>> | src/mongo/bson/util/atomic_int.h:44:27: error: inline function =
'mongo::AtomicUInt mongo::AtomicUInt::operator++(int)' used but never =
defined [-Werror]
>>>>> |          inline AtomicUInt operator++(int);// postfix++
>>>>> |                            ^
>>>>> | src/mongo/bson/util/atomic_int.h:45:27: error: inline function =
'mongo::AtomicUInt mongo::AtomicUInt::operator--()' used but never =
defined [-Werror]
>>>>> |          inline AtomicUInt operator--(); // --prefix
>>>>> |                            ^
>>>>> | cc1plus: all warnings being treated as errors
>>>>> | scons: *** =
[build/linux2/disable-scripting/ld_arm-oe-linux-gnueabi-g++/ssl/use-system=
-boost/use-system-pcre/use-system-tcmalloc/mongo/db/commands/find_and_modi=
fy_common.o] Error 1
>>>>> | src/mongo/bson/util/atomic_int.h:41:21: error: inline function =
'void mongo::AtomicUInt::set(unsigned int)' used but never defined =
[-Werror]
>>>>> |          inline void set(unsigned newX);
>>>>> |                      ^
>>>>> ......
>>>>=20
>>>> It looks like gcc for qemuarm lacks support for some atomic ops, =
the
>>>> above seems to get triggered by __GCC_HAVE_SYNC_COMPARE_AND_SWAP_4 =
not
>>>> being there.
>>>>=20
>>>> Which gcc are you using, 4.8?
>>>=20
>>> Yup, 4.8 from oe-core.
>>=20
>> These atomic ops *are* available for gcc 4.8, but it doesn't =
advertise=20
>> them for armv5te. There are 2 solutions:
>>=20
>> 1) CFLAGS +=3D -D__GCC_HAVE_SYNC_COMPARE_AND_SWAP_4=3D1
>> 2) Add a block to that files that tests for gcc > 4.7.0 (that's what=20=

>> fedora does)
>>=20
>> I'll see if I can find time to fix this next week.
>=20
> ping :)

Haven't had time, let me see if I can fix it this week. Note that you'll =
need >8GB to build this, we had to upgrade out autobuilders to avoid gcc =
from ICEing due to OOM.=

