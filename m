Return-Path: <koen.kooi@linaro.org>
Received: from mail-pb0-f41.google.com (mail-pb0-f41.google.com
	[209.85.160.41])
	by mail.openembedded.org (Postfix) with ESMTP id EA16E6E8DC
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Mar 2014 04:43:21 +0000 (UTC)
Received: by mail-pb0-f41.google.com with SMTP id jt11so542511pbb.28
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Mar 2014 20:43:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=zvIHGUgwx3x/ESeUrOb0+BuAWI3wm5Otapv5hvN/go8=;
	b=JkCaRL8mmJJnpIxnXTZ3fxS5BUtZmyN6KVbDUiT31dW1rcuakLdCMLL0gmzJyg7yqu
	ilNFgrY+RCp3sectZla2AtIjkCeFVqa0jBqTVrfFMY+2j5lmaJTJp2jhnDsupkBuxBPK
	EPu/rGCoYDEjbLikVHWV3CwvKjy3ZTCTy+Roh32jVKvG2HyQDFyoiQW9kZzFBftyC3bq
	NaRiCrh64PDSV78KynoOC0oEJEZ4NIiQZyIvuFYKz1iam/s0PDQtaLfeev5VyFuqRAGB
	gWXe8Iq9FrXV5KMnjy3VrGVpqI0uJlbDwijb2jSlCusy9gdX7M4M5E4ihUBpKRalfesy
	vnrA==
X-Gm-Message-State: ALoCoQmoluS5OdonmAOKKF2CQ+4scCo0hImIS+U/OedaTRHG2iUg+VT2UDCYlRRJN5zf5uss2BY0
X-Received: by 10.66.218.234 with SMTP id pj10mr4210660pac.156.1393994602055; 
	Tue, 04 Mar 2014 20:43:22 -0800 (PST)
Received: from [10.133.169.165] (z88l218.static.ctm.net. [202.175.88.218])
	by mx.google.com with ESMTPSA id qh2sm6913057pab.13.2014.03.04.20.43.18
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 04 Mar 2014 20:43:20 -0800 (PST)
Message-ID: <5316AB64.3080501@linaro.org>
Date: Wed, 05 Mar 2014 12:43:16 +0800
From: Koen Kooi <koen.kooi@linaro.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>, 
	openembedded-devel@lists.openembedded.org
References: <1391518370-19990-1-git-send-email-koen.kooi@linaro.org>
	<20140305041901.GU26981@jama>
In-Reply-To: <20140305041901.GU26981@jama>
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
X-List-Received-Date: Wed, 05 Mar 2014 04:43:24 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/05/2014 12:19 PM, Martin Jansa wrote:
> On Tue, Feb 04, 2014 at 01:52:50PM +0100, Koen Kooi wrote:
>> This builds the server and the sharding helper, but not the CLI. The CLI will need a libv8 recipe since fixing the built-in copy to cross build is too much work.
>>
>> Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
>> ---
>>   ...Make-it-possible-to-disable-the-use-of-v8.patch | 49 +++++++++++++++++
>>   ...place-os.uname-with-os.getenv-TARGET_ARCH.patch | 50 +++++++++++++++++
>>   ...02-Fix-linking-when-scripting-is-disabled.patch | 25 +++++++++
>>   ...d-mongo-binary-when-scripting-is-disabled.patch | 64 ++++++++++++++++++++++
>>   meta-oe/recipes-support/mongodb/mongodb_git.bb     | 38 +++++++++++++
>>   5 files changed, 226 insertions(+)
>>   create mode 100644 meta-oe/recipes-support/mongodb/mongodb/0001-Make-it-possible-to-disable-the-use-of-v8.patch
>>   create mode 100644 meta-oe/recipes-support/mongodb/mongodb/0001-replace-os.uname-with-os.getenv-TARGET_ARCH.patch
>>   create mode 100644 meta-oe/recipes-support/mongodb/mongodb/0002-Fix-linking-when-scripting-is-disabled.patch
>>   create mode 100644 meta-oe/recipes-support/mongodb/mongodb/0003-Do-not-build-mongo-binary-when-scripting-is-disabled.patch
>>   create mode 100644 meta-oe/recipes-support/mongodb/mongodb_git.bb
>
> It's already merged, but can you please check this error when building
> it for qemuarm?
>
> | arm-oe-linux-gnueabi-g++ -march=armv5te -marm -mthumb-interwork --sysroot=/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemuarm -o build/linux2/disable-scripting/ld_arm-oe-linux-gnueabi-g++/ssl/use-system-boost/use-system-pcre/use-system-tcmalloc/mongo/db/commands/find_and_modify_common.o -c -Wnon-virtual-dtor -Woverloaded-virtual -fPIC -fno-strict-aliasing -ggdb -pthread -Wall -Wsign-compare -Wno-unknown-pragmas -Winvalid-pch -Werror -pipe -O3 -Wno-unused-local-typedefs -Wno-unused-function -Wno-deprecated-declarations -fno-builtin-memcmp -D_SCONS -DMONGO_EXPOSE_MACROS -DSUPPORT_UTF8 -DMONGO_OPTIMIZED_BUILD -D_FILE_OFFSET_BITS=64 -DMONGO_SSL -DMONGO_HAVE___THREAD -DBOOST_THREAD_VERSION=2 -DMONGO_HAVE_HEADER_UNISTD_H -DMONGO_HAVE_EXECINFO_BACKTRACE -Ibuild/linux2/disable-scripting/ld_arm-oe-linux-gnueabi-g++/ssl/use-system-boost/use-system-pcre/use-system-tcmalloc/third_party/snappy -Isrc/third_party/snappy -Ibuild/linux2/disable-scripting/ld_arm-oe-linux-gnueabi
-g++/ssl/use-system-boost/use-system-pcre/use-system-tcmalloc/third_party/libstemmer_c/include -Isrc/third_party/libstemmer_c/include -Ibuild/linux2/disable-scripting/ld_arm-oe-linux-gnueabi-g++/ssl/use-system-boost/use-system-pcre/use-system-tcmalloc/third_party/s2 -Isrc/third_party/s2 -Ibuild/linux2/disable-scripting/ld_arm-oe-linux-gnueabi-g++/ssl/use-system-boost/use-system-pcre/use-system-tcmalloc -Isrc -Ibuild/linux2/disable-scripting/ld_arm-oe-linux-gnueabi-g++/ssl/use-system-boost/use-system-pcre/use-system-tcmalloc/mongo -Isrc/mongo -Ibuild/linux2/disable-scripting/ld_arm-oe-linux-gnueabi-g++/ssl/use-system-boost/use-system-pcre/use-system-tcmalloc/third_party/s2 -Isrc/third_party/s2 -Ibuild/linux2/disable-scripting/ld_arm-oe-linux-gnueabi-g++/ssl/use-system-boost/use-system-pcre/use-system-tcmalloc/third_party/snappy -Isrc/third_party/snappy -Ibuild/linux2/disable-scripting/ld_arm-oe-linux-gnueabi-g++/ssl/use-system-boost/use-system-pcre/use-system-tcmalloc/third_party/yaml-
cpp-0.5.1/include -Isrc/third_party/yaml-cpp-0.5.1/include src/mongo/db/commands/find_and_modify_common.cpp
> | In file included from src/mongo/bson/bsonobj.h:29:0,
> |                  from src/mongo/db/pipeline/value_internal.h:32,
> |                  from src/mongo/db/pipeline/value.h:31,
> |                  from src/mongo/db/pipeline/pipeline.h:33,
> |                  from src/mongo/db/pipeline/pipeline.cpp:32:
> | src/mongo/bson/util/atomic_int.h:128:4: error: #error "unsupported compiler or platform"
> |  #  error "unsupported compiler or platform"
> |     ^
> | In file included from src/mongo/bson/bsonobj.h:29:0,
> |                  from src/mongo/db/jsobj.h:38,
> |                  from src/mongo/db/auth/privilege_parser.h:35,
> |                  from src/mongo/db/auth/privilege.h:22,
> |                  from src/mongo/db/auth/privilege.cpp:16:
> | src/mongo/bson/util/atomic_int.h:128:4: error: #error "unsupported compiler or platform"
> |  #  error "unsupported compiler or platform"
> |     ^
> | In file included from src/mongo/bson/bsonobj.h:29:0,
> |                  from src/mongo/db/jsobj.h:38,
> |                  from src/mongo/db/auth/privilege_parser.h:35,
> |                  from src/mongo/db/auth/privilege.h:22,
> |                  from src/mongo/db/commands/mr.h:37,
> |                  from src/mongo/db/commands/mr_common.cpp:29:
> | src/mongo/bson/util/atomic_int.h:128:4: error: #error "unsupported compiler or platform"
> |  #  error "unsupported compiler or platform"
> |     ^
> | In file included from src/mongo/bson/bsonobj.h:29:0,
> |                  from src/mongo/db/jsobj.h:38,
> |                  from src/mongo/bson/mutable/element.h:20,
> |                  from src/mongo/db/auth/authorization_manager.h:40,
> |                  from src/mongo/db/auth/authorization_session.h:38,
> |                  from src/mongo/db/auth/authorization_session.cpp:29:
> | src/mongo/bson/util/atomic_int.h:128:4: error: #error "unsupported compiler or platform"
> |  #  error "unsupported compiler or platform"
> |     ^
> | arm-oe-linux-gnueabi-g++ -march=armv5te -marm -mthumb-interwork --sysroot=/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemuarm -o build/linux2/disable-scripting/ld_arm-oe-linux-gnueabi-g++/ssl/use-system-boost/use-system-pcre/use-system-tcmalloc/mongo/db/commands/user_management_commands.o -c -Wnon-virtual-dtor -Woverloaded-virtual -fPIC -fno-strict-aliasing -ggdb -pthread -Wall -Wsign-compare -Wno-unknown-pragmas -Winvalid-pch -Werror -pipe -O3 -Wno-unused-local-typedefs -Wno-unused-function -Wno-deprecated-declarations -fno-builtin-memcmp -D_SCONS -DMONGO_EXPOSE_MACROS -DSUPPORT_UTF8 -DMONGO_OPTIMIZED_BUILD -D_FILE_OFFSET_BITS=64 -DMONGO_SSL -DMONGO_HAVE___THREAD -DBOOST_THREAD_VERSION=2 -DMONGO_HAVE_HEADER_UNISTD_H -DMONGO_HAVE_EXECINFO_BACKTRACE -Ibuild/linux2/disable-scripting/ld_arm-oe-linux-gnueabi-g++/ssl/use-system-boost/use-system-pcre/use-system-tcmalloc/third_party/snappy -Isrc/third_party/snappy -Ibuild/linux2/disable-scripting/ld_arm-oe-linux-gnuea
bi-g++/ssl/use-system-boost/use-system-pcre/use-system-tcmalloc/third_party/libstemmer_c/include -Isrc/third_party/libstemmer_c/include -Ibuild/linux2/disable-scripting/ld_arm-oe-linux-gnueabi-g++/ssl/use-system-boost/use-system-pcre/use-system-tcmalloc/third_party/s2 -Isrc/third_party/s2 -Ibuild/linux2/disable-scripting/ld_arm-oe-linux-gnueabi-g++/ssl/use-system-boost/use-system-pcre/use-system-tcmalloc -Isrc -Ibuild/linux2/disable-scripting/ld_arm-oe-linux-gnueabi-g++/ssl/use-system-boost/use-system-pcre/use-system-tcmalloc/mongo -Isrc/mongo -Ibuild/linux2/disable-scripting/ld_arm-oe-linux-gnueabi-g++/ssl/use-system-boost/use-system-pcre/use-system-tcmalloc/third_party/s2 -Isrc/third_party/s2 -Ibuild/linux2/disable-scripting/ld_arm-oe-linux-gnueabi-g++/ssl/use-system-boost/use-system-pcre/use-system-tcmalloc/third_party/snappy -Isrc/third_party/snappy -Ibuild/linux2/disable-scripting/ld_arm-oe-linux-gnueabi-g++/ssl/use-system-boost/use-system-pcre/use-system-tcmalloc/third_party/yam
l-cpp-0.5.1/include -Isrc/third_party/yaml-cpp-0.5.1/include src/mongo/db/commands/user_management_commands.cpp
> | In file included from src/mongo/bson/bsonobj.h:29:0,
> |                  from src/mongo/db/jsobj.h:38,
> |                  from src/mongo/db/diskloc.h:37,
> |                  from src/mongo/db/clientcursor.h:33,
> |                  from src/mongo/db/query/new_find.h:33,
> |                  from src/mongo/db/query/new_find.cpp:29:
> | src/mongo/bson/util/atomic_int.h:128:4: error: #error "unsupported compiler or platform"
> |  #  error "unsupported compiler or platform"
> |     ^
> | In file included from src/mongo/bson/bsonobj.h:29:0,
> |                  from src/mongo/db/jsobj.h:38,
> |                  from src/mongo/db/auth/privilege_parser.h:35,
> |                  from src/mongo/db/auth/privilege.h:22,
> |                  from src/mongo/db/commands/find_and_modify.h:34,
> |                  from src/mongo/db/commands/find_and_modify_common.cpp:31:
> | src/mongo/bson/util/atomic_int.h:128:4: error: #error "unsupported compiler or platform"
> |  #  error "unsupported compiler or platform"
> |     ^
> | In file included from src/mongo/bson/bsonobj.h:29:0,
> |                  from src/mongo/db/jsobj.h:38,
> |                  from src/mongo/db/auth/privilege_parser.h:35,
> |                  from src/mongo/db/auth/privilege.h:22,
> |                  from src/mongo/db/commands/hashcmd.cpp:42:
> | src/mongo/bson/util/atomic_int.h:128:4: error: #error "unsupported compiler or platform"
> |  #  error "unsupported compiler or platform"
> |     ^
> | In file included from src/mongo/bson/bsonobj.h:29:0,
> |                  from src/mongo/db/jsobj.h:38,
> |                  from src/mongo/db/auth/privilege_parser.h:35,
> |                  from src/mongo/db/auth/privilege.h:22,
> |                  from src/mongo/db/commands.h:24,
> |                  from src/mongo/db/commands/user_management_commands.h:31,
> |                  from src/mongo/db/commands/user_management_commands.cpp:31:
> | src/mongo/bson/util/atomic_int.h:128:4: error: #error "unsupported compiler or platform"
> |  #  error "unsupported compiler or platform"
> |     ^
> | src/mongo/bson/util/atomic_int.h:41:21: error: inline function 'void mongo::AtomicUInt::set(unsigned int)' used but never defined [-Werror]
> |          inline void set(unsigned newX);
> |                      ^
> | src/mongo/bson/util/atomic_int.h:44:27: error: inline function 'mongo::AtomicUInt mongo::AtomicUInt::operator++(int)' used but never defined [-Werror]
> |          inline AtomicUInt operator++(int);// postfix++
> |                            ^
> | src/mongo/bson/util/atomic_int.h:45:27: error: inline function 'mongo::AtomicUInt mongo::AtomicUInt::operator--()' used but never defined [-Werror]
> |          inline AtomicUInt operator--(); // --prefix
> |                            ^
> | cc1plus: all warnings being treated as errors
> | scons: *** [build/linux2/disable-scripting/ld_arm-oe-linux-gnueabi-g++/ssl/use-system-boost/use-system-pcre/use-system-tcmalloc/mongo/db/auth/privilege.o] Error 1
> | src/mongo/bson/util/atomic_int.h:41:21: error: inline function 'void mongo::AtomicUInt::set(unsigned int)' used but never defined [-Werror]
> |          inline void set(unsigned newX);
> |                      ^
> | src/mongo/bson/util/atomic_int.h:44:27: error: inline function 'mongo::AtomicUInt mongo::AtomicUInt::operator++(int)' used but never defined [-Werror]
> |          inline AtomicUInt operator++(int);// postfix++
> |                            ^
> | src/mongo/bson/util/atomic_int.h:45:27: error: inline function 'mongo::AtomicUInt mongo::AtomicUInt::operator--()' used but never defined [-Werror]
> |          inline AtomicUInt operator--(); // --prefix
> |                            ^
> | cc1plus: all warnings being treated as errors
> | scons: *** [build/linux2/disable-scripting/ld_arm-oe-linux-gnueabi-g++/ssl/use-system-boost/use-system-pcre/use-system-tcmalloc/mongo/db/commands/find_and_modify_common.o] Error 1
> | src/mongo/bson/util/atomic_int.h:41:21: error: inline function 'void mongo::AtomicUInt::set(unsigned int)' used but never defined [-Werror]
> |          inline void set(unsigned newX);
> |                      ^
> ......

It looks like gcc for qemuarm lacks support for some atomic ops, the 
above seems to get triggered by __GCC_HAVE_SYNC_COMPARE_AND_SWAP_4 not 
being there.

Which gcc are you using, 4.8?

regards,

Koen















>
>>
>> diff --git a/meta-oe/recipes-support/mongodb/mongodb/0001-Make-it-possible-to-disable-the-use-of-v8.patch b/meta-oe/recipes-support/mongodb/mongodb/0001-Make-it-possible-to-disable-the-use-of-v8.patch
>> new file mode 100644
>> index 0000000..311ac6c
>> --- /dev/null
>> +++ b/meta-oe/recipes-support/mongodb/mongodb/0001-Make-it-possible-to-disable-the-use-of-v8.patch
>> @@ -0,0 +1,49 @@
>> +From bffde38f3b3d6285019e38a30c4573326e1dd2ea Mon Sep 17 00:00:00 2001
>> +From: Michael Hudson-Doyle <michael.hudson@linaro.org>
>> +Date: Fri, 20 Dec 2013 11:10:43 +1300
>> +Subject: [PATCH 1/3] Make it possible to disable the use of v8.
>> +
>> +Currently v8 is always built in, no matter what you pass to scons.
>> +
>> +This removes the (useless) --usev8 flag for scons and replaces it with a
>> +--disable-scripting option instead.
>> +---
>> + SConstruct | 8 +++++---
>> + 1 file changed, 5 insertions(+), 3 deletions(-)
>> +
>> +diff --git a/SConstruct b/SConstruct
>> +index fd92fe4..1f14083 100644
>> +--- a/SConstruct
>> ++++ b/SConstruct
>> +@@ -222,7 +222,7 @@ add_option( "asio" , "Use Asynchronous IO (NOT READY YET)" , 0 , True )
>> + add_option( "ssl" , "Enable SSL" , 0 , True )
>> +
>> + # library choices
>> +-add_option( "usev8" , "use v8 for javascript" , 0 , True )
>> ++add_option( "disable-scripting" , "do not build support for javascript" , 0 , True )
>> + add_option( "libc++", "use libc++ (experimental, requires clang)", 0, True )
>> +
>> + # mongo feature options
>> +@@ -439,7 +439,7 @@ static = has_option( "static" )
>> +
>> + noshell = has_option( "noshell" )
>> +
>> +-usev8 = has_option( "usev8" )
>> ++disable_scripting = has_option( "disable-scripting" )
>> +
>> + asio = has_option( "asio" )
>> +
>> +@@ -599,7 +599,9 @@ if has_option( "durableDefaultOn" ):
>> + if has_option( "durableDefaultOff" ):
>> +     env.Append( CPPDEFINES=[ "_DURABLEDEFAULTOFF" ] )
>> +
>> +-if ( not ( usev8 or justClientLib) ):
>> ++if disable_scripting or justClientLib:
>> ++    usev8 = False
>> ++else:
>> +     usev8 = True
>> +
>> + extraLibPlaces = []
>> +--
>> +1.8.4.2
>> +
>> diff --git a/meta-oe/recipes-support/mongodb/mongodb/0001-replace-os.uname-with-os.getenv-TARGET_ARCH.patch b/meta-oe/recipes-support/mongodb/mongodb/0001-replace-os.uname-with-os.getenv-TARGET_ARCH.patch
>> new file mode 100644
>> index 0000000..547c3bd
>> --- /dev/null
>> +++ b/meta-oe/recipes-support/mongodb/mongodb/0001-replace-os.uname-with-os.getenv-TARGET_ARCH.patch
>> @@ -0,0 +1,50 @@
>> +From ef482650fb6d990e4953104d7141d9a0fa4c872f Mon Sep 17 00:00:00 2001
>> +From: Koen Kooi <koen.kooi@linaro.org>
>> +Date: Tue, 4 Feb 2014 10:56:35 +0100
>> +Subject: [PATCH] replace os.uname with os.getenv(OE_TARGET_ARCH)
>> +
>> +This fixes crosscompilation
>> +
>> +Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
>> +Upstream-Status: Inappropiate [OE specific]
>> +---
>> + SConstruct | 8 ++++----
>> + 1 file changed, 4 insertions(+), 4 deletions(-)
>> +
>> +diff --git a/SConstruct b/SConstruct
>> +index 4f26be7..a353323 100644
>> +--- a/SConstruct
>> ++++ b/SConstruct
>> +@@ -265,9 +265,9 @@ add_option( "pch" , "use precompiled headers to speed up the build (experimental
>> + add_option( "distcc" , "use distcc for distributing builds" , 0 , False )
>> +
>> + # debugging/profiling help
>> +-if os.sys.platform.startswith("linux") and (os.uname()[-1] == 'x86_64'):
>> ++if os.sys.platform.startswith("linux") and (os.getenv("OE_TARGET_ARCH") == 'x86_64'):
>> +     defaultAllocator = 'tcmalloc'
>> +-elif (os.sys.platform == "darwin") and (os.uname()[-1] == 'x86_64'):
>> ++elif (os.sys.platform == "darwin") and (os.getenv("OE_TARGET_ARCH") == 'x86_64'):
>> +     defaultAllocator = 'tcmalloc'
>> + else:
>> +     defaultAllocator = 'system'
>> +@@ -673,7 +673,7 @@ if has_option( "full" ):
>> + # ---- other build setup -----
>> +
>> + if "uname" in dir(os):
>> +-    processor = os.uname()[4]
>> ++    processor = os.getenv("OE_TARGET_ARCH")
>> + else:
>> +     processor = "i386"
>> +
>> +@@ -702,7 +702,7 @@ elif linux:
>> +
>> +     env.Append( LIBS=['m'] )
>> +
>> +-    if os.uname()[4] == "x86_64" and not force32:
>> ++    if os.getenv("OE_TARGET_ARCH") == "x86_64" and not force32:
>> +         linux64 = True
>> +         nixLibPrefix = "lib64"
>> +         env.Append( EXTRALIBPATH=["/usr/lib64" , "/lib64" ] )
>> +--
>> +1.8.4.2
>> +
>> diff --git a/meta-oe/recipes-support/mongodb/mongodb/0002-Fix-linking-when-scripting-is-disabled.patch b/meta-oe/recipes-support/mongodb/mongodb/0002-Fix-linking-when-scripting-is-disabled.patch
>> new file mode 100644
>> index 0000000..d8d5a3b
>> --- /dev/null
>> +++ b/meta-oe/recipes-support/mongodb/mongodb/0002-Fix-linking-when-scripting-is-disabled.patch
>> @@ -0,0 +1,25 @@
>> +From 52d68642205626cad3bac3a53e269c765ccff676 Mon Sep 17 00:00:00 2001
>> +From: Michael Hudson-Doyle <michael.hudson@linaro.org>
>> +Date: Fri, 20 Dec 2013 12:28:27 +1300
>> +Subject: [PATCH 2/3] Fix linking when scripting is disabled.
>> +
>> +---
>> + src/mongo/scripting/engine_none.cpp | 4 ++++
>> + 1 file changed, 4 insertions(+)
>> +
>> +diff --git a/src/mongo/scripting/engine_none.cpp b/src/mongo/scripting/engine_none.cpp
>> +index f5c7109..9ae9d57 100644
>> +--- a/src/mongo/scripting/engine_none.cpp
>> ++++ b/src/mongo/scripting/engine_none.cpp
>> +@@ -33,4 +33,8 @@ namespace mongo {
>> +     void ScriptEngine::setup() {
>> +         // noop
>> +     }
>> ++
>> ++    std::string ScriptEngine::getInterpreterVersionString() {
>> ++        return "none";
>> ++    }
>> + }
>> +--
>> +1.8.4.2
>> +
>> diff --git a/meta-oe/recipes-support/mongodb/mongodb/0003-Do-not-build-mongo-binary-when-scripting-is-disabled.patch b/meta-oe/recipes-support/mongodb/mongodb/0003-Do-not-build-mongo-binary-when-scripting-is-disabled.patch
>> new file mode 100644
>> index 0000000..5c314b1
>> --- /dev/null
>> +++ b/meta-oe/recipes-support/mongodb/mongodb/0003-Do-not-build-mongo-binary-when-scripting-is-disabled.patch
>> @@ -0,0 +1,64 @@
>> +From 1f8e10747af3988e8ddee609bea990f622dd746a Mon Sep 17 00:00:00 2001
>> +From: Michael Hudson-Doyle <michael.hudson@linaro.org>
>> +Date: Wed, 22 Jan 2014 13:53:10 +1300
>> +Subject: [PATCH 3/3] * Do not build 'mongo' binary when scripting is disabled
>> + * Do not build the jstests when scripting is disabled
>> +
>> +---
>> + SConstruct           | 8 ++++++--
>> + src/mongo/SConscript | 4 +++-
>> + 2 files changed, 9 insertions(+), 3 deletions(-)
>> +
>> +diff --git a/SConstruct b/SConstruct
>> +index 1f14083..a69cf0a 100644
>> +--- a/SConstruct
>> ++++ b/SConstruct
>> +@@ -437,10 +437,13 @@ else:
>> +
>> + static = has_option( "static" )
>> +
>> +-noshell = has_option( "noshell" )
>> +-
>> + disable_scripting = has_option( "disable-scripting" )
>> +
>> ++if not disable_scripting:
>> ++    noshell = has_option( "noshell" )
>> ++else:
>> ++    noshell = True
>> ++
>> + asio = has_option( "asio" )
>> +
>> + usePCH = has_option( "usePCH" )
>> +@@ -1671,6 +1674,7 @@ Export("get_option")
>> + Export("has_option use_system_version_of_library")
>> + Export("installSetup mongoCodeVersion")
>> + Export("usev8")
>> ++Export("disable_scripting")
>> + Export("darwin windows solaris linux freebsd nix")
>> + Export('module_sconscripts')
>> + Export("debugBuild optBuild")
>> +diff --git a/src/mongo/SConscript b/src/mongo/SConscript
>> +index d84267e..dc0ca3a 100644
>> +--- a/src/mongo/SConscript
>> ++++ b/src/mongo/SConscript
>> +@@ -6,6 +6,7 @@ import os
>> + import itertools
>> + from buildscripts import utils
>> +
>> ++Import("disable_scripting")
>> + Import("env")
>> + Import("shellEnv")
>> + Import("testEnv")
>> +@@ -1022,7 +1023,8 @@ test = testEnv.Install(
>> +                     [ f for f in Glob("dbtests/*.cpp")
>> +                       if not str(f).endswith('framework.cpp') and
>> +                          not str(f).endswith('framework_options.cpp') and
>> +-                         not str(f).endswith('framework_options_init.cpp') ],
>> ++                         not str(f).endswith('framework_options_init.cpp') and
>> ++                         not (str(f).endswith('jstests.cpp') and disable_scripting)],
>> +                     LIBDEPS = [
>> +                        "mutable_bson_test_utils",
>> +                        "mongocommon",
>> +--
>> +1.8.4.2
>> +
>> diff --git a/meta-oe/recipes-support/mongodb/mongodb_git.bb b/meta-oe/recipes-support/mongodb/mongodb_git.bb
>> new file mode 100644
>> index 0000000..f0fe240
>> --- /dev/null
>> +++ b/meta-oe/recipes-support/mongodb/mongodb_git.bb
>> @@ -0,0 +1,38 @@
>> +SUMMARY = "mongodb"
>> +LICENSE = "AGPLv3 & Apache-2.0"
>> +LIC_FILES_CHKSUM = "file://GNU-AGPL-3.0.txt;md5=73f1eb20517c55bf9493b7dd6e480788 \
>> +                    file://APACHE-2.0.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
>> +
>> +DEPENDS = "openssl libpcre boost"
>> +# Mongo uses tcmalloc on x86_64, which is provided by gperftools
>> +DEPENDS_append_x86-64 = " gperftools"
>> +
>> +inherit scons
>> +
>> +PV = "2.5.5+git${SRCPV}"
>> +SRCREV = "588dc81b0822ebb46f80e152b94527a882e6ea5e"
>> +SRC_URI = "git://github.com/mongodb/mongo.git \
>> +           file://0001-Make-it-possible-to-disable-the-use-of-v8.patch \
>> +           file://0002-Fix-linking-when-scripting-is-disabled.patch \
>> +           file://0003-Do-not-build-mongo-binary-when-scripting-is-disabled.patch \
>> +           file://0001-replace-os.uname-with-os.getenv-TARGET_ARCH.patch \
>> +          "
>> +
>> +S = "${WORKDIR}/git"
>> +
>> +export OE_TARGET_ARCH="${TARGET_ARCH}"
>> +
>> +EXTRA_OESCONS = "--prefix=${D}${prefix} \
>> +                 --propagate-shell-environment \
>> +                 --cc-use-shell-environment \
>> +                 --cxx-use-shell-environment \
>> +                 --ld='${TARGET_PREFIX}g++' \
>> +                 --ssl \
>> +                 --use-system-pcre \
>> +                 --use-system-boost \
>> +                 --use-system-tcmalloc \
>> +                 --disable-scripting \
>> +                 --nostrip \
>> +                 mongod mongos"
>> +
>> +
>> --
>> 1.8.4.2
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>



-- 
Koen Kooi
Builds and Baselines | Release Manager
Linaro.org | Open source software for ARM SoCs

