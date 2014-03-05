Return-Path: <koen.kooi@linaro.org>
Received: from mail-pd0-f175.google.com (mail-pd0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id 4573060C02
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Mar 2014 08:21:34 +0000 (UTC)
Received: by mail-pd0-f175.google.com with SMTP id x10so747966pdj.20
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Mar 2014 00:21:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=DjqEh4ItbawXoxziHJEethcuA1cNaGZPAmxu62+zPSk=;
	b=CRdiqNiKEpqeAnDMtpUpZS87w/Nm13z7iieW60wj/fiS7qh5Xe4nFxOzUrv7+5NYTU
	0mNbb20iOTsDHhtMYMGmqPtKgAc0ebuuDshAKPZqG2vgqKtN9AChqYqkTfQfg2heU07W
	qddektMzeLPjoSdtaXAVQ4B1bAw77BnyraXXIs1iu4nqfzCGjmMxB0BAYvjLy6k2S+Rv
	79k7o524+bkUC3T+/EknPztL2RrrURwNgn4JjfIpD7cN70VnWWpByYnjDF/3S+LsxqZi
	4jlcJXxHNOc9L0Q6oQZ8wGVwZaTTTseDNdZMK7IBZiqKEK6zgQGy9ZKaM7cN8oPFq2QN
	gJ0Q==
X-Gm-Message-State: ALoCoQlz2ltkUGJto/VCCKxokpiSsDcQfeeKSM02infGbehLned4DthbyzefO0NlYrwnpqbHSR2K
X-Received: by 10.66.240.103 with SMTP id vz7mr5162268pac.37.1394007695473;
	Wed, 05 Mar 2014 00:21:35 -0800 (PST)
Received: from [10.133.140.42] (z88l218.static.ctm.net. [202.175.88.218])
	by mx.google.com with ESMTPSA id oa3sm5272435pbb.15.2014.03.05.00.21.31
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 05 Mar 2014 00:21:34 -0800 (PST)
Message-ID: <5316DE87.7090906@linaro.org>
Date: Wed, 05 Mar 2014 16:21:27 +0800
From: Koen Kooi <koen.kooi@linaro.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <1391518370-19990-1-git-send-email-koen.kooi@linaro.org>
	<20140305041901.GU26981@jama> <5316AB64.3080501@linaro.org>
	<20140305055717.GV26981@jama>
In-Reply-To: <20140305055717.GV26981@jama>
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
X-List-Received-Date: Wed, 05 Mar 2014 08:21:39 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/05/2014 01:57 PM, Martin Jansa wrote:
> On Wed, Mar 05, 2014 at 12:43:16PM +0800, Koen Kooi wrote:
>> On 03/05/2014 12:19 PM, Martin Jansa wrote:
>>> On Tue, Feb 04, 2014 at 01:52:50PM +0100, Koen Kooi wrote:
>>>> This builds the server and the sharding helper, but not the CLI. The CLI will need a libv8 recipe since fixing the built-in copy to cross build is too much work.
>>>>
>>>> Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
>>>> ---
>>>>    ...Make-it-possible-to-disable-the-use-of-v8.patch | 49 +++++++++++++++++
>>>>    ...place-os.uname-with-os.getenv-TARGET_ARCH.patch | 50 +++++++++++++++++
>>>>    ...02-Fix-linking-when-scripting-is-disabled.patch | 25 +++++++++
>>>>    ...d-mongo-binary-when-scripting-is-disabled.patch | 64 ++++++++++++++++++++++
>>>>    meta-oe/recipes-support/mongodb/mongodb_git.bb     | 38 +++++++++++++
>>>>    5 files changed, 226 insertions(+)
>>>>    create mode 100644 meta-oe/recipes-support/mongodb/mongodb/0001-Make-it-possible-to-disable-the-use-of-v8.patch
>>>>    create mode 100644 meta-oe/recipes-support/mongodb/mongodb/0001-replace-os.uname-with-os.getenv-TARGET_ARCH.patch
>>>>    create mode 100644 meta-oe/recipes-support/mongodb/mongodb/0002-Fix-linking-when-scripting-is-disabled.patch
>>>>    create mode 100644 meta-oe/recipes-support/mongodb/mongodb/0003-Do-not-build-mongo-binary-when-scripting-is-disabled.patch
>>>>    create mode 100644 meta-oe/recipes-support/mongodb/mongodb_git.bb
>>>
>>> It's already merged, but can you please check this error when building
>>> it for qemuarm?
>>>
>>> | arm-oe-linux-gnueabi-g++ -march=armv5te -marm -mthumb-interwork --sysroot=/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemuarm -o build/linux2/disable-scripting/ld_arm-oe-linux-gnueabi-g++/ssl/use-system-boost/use-system-pcre/use-system-tcmalloc/mongo/db/commands/find_and_modify_common.o -c -Wnon-virtual-dtor -Woverloaded-virtual -fPIC -fno-strict-aliasing -ggdb -pthread -Wall -Wsign-compare -Wno-unknown-pragmas -Winvalid-pch -Werror -pipe -O3 -Wno-unused-local-typedefs -Wno-unused-function -Wno-deprecated-declarations -fno-builtin-memcmp -D_SCONS -DMONGO_EXPOSE_MACROS -DSUPPORT_UTF8 -DMONGO_OPTIMIZED_BUILD -D_FILE_OFFSET_BITS=64 -DMONGO_SSL -DMONGO_HAVE___THREAD -DBOOST_THREAD_VERSION=2 -DMONGO_HAVE_HEADER_UNISTD_H -DMONGO_HAVE_EXECINFO_BACKTRACE -Ibuild/linux2/disable-scripting/ld_arm-oe-linux-gnueabi-g++/ssl/use-system-boost/use-system-pcre/use-system-tcmalloc/third_party/snappy -Isrc/third_party/snappy -Ibuild/linux2/disable-scripting/ld_arm-oe-linux-gnuea
bi
>> -g++/ssl/use-system-boost/use-system-pcre/use-system-tcmalloc/third_party/libstemmer_c/include -Isrc/third_party/libstemmer_c/include -Ibuild/linux2/disable-scripting/ld_arm-oe-linux-gnueabi-g++/ssl/use-system-boost/use-system-pcre/use-system-tcmalloc/third_party/s2 -Isrc/third_party/s2 -Ibuild/linux2/disable-scripting/ld_arm-oe-linux-gnueabi-g++/ssl/use-system-boost/use-system-pcre/use-system-tcmalloc -Isrc -Ibuild/linux2/disable-scripting/ld_arm-oe-linux-gnueabi-g++/ssl/use-system-boost/use-system-pcre/use-system-tcmalloc/mongo -Isrc/mongo -Ibuild/linux2/disable-scripting/ld_arm-oe-linux-gnueabi-g++/ssl/use-system-boost/use-system-pcre/use-system-tcmalloc/third_party/s2 -Isrc/third_party/s2 -Ibuild/linux2/disable-scripting/ld_arm-oe-linux-gnueabi-g++/ssl/use-system-boost/use-system-pcre/use-system-tcmalloc/third_party/snappy -Isrc/third_party/snappy -Ibuild/linux2/disable-scripting/ld_arm-oe-linux-gnueabi-g++/ssl/use-system-boost/use-system-pcre/use-system-tcmalloc/third_party/ya
ml-
>> cpp-0.5.1/include -Isrc/third_party/yaml-cpp-0.5.1/include src/mongo/db/commands/find_and_modify_common.cpp
>>> | In file included from src/mongo/bson/bsonobj.h:29:0,
>>> |                  from src/mongo/db/pipeline/value_internal.h:32,
>>> |                  from src/mongo/db/pipeline/value.h:31,
>>> |                  from src/mongo/db/pipeline/pipeline.h:33,
>>> |                  from src/mongo/db/pipeline/pipeline.cpp:32:
>>> | src/mongo/bson/util/atomic_int.h:128:4: error: #error "unsupported compiler or platform"
>>> |  #  error "unsupported compiler or platform"
>>> |     ^
>>> | In file included from src/mongo/bson/bsonobj.h:29:0,
>>> |                  from src/mongo/db/jsobj.h:38,
>>> |                  from src/mongo/db/auth/privilege_parser.h:35,
>>> |                  from src/mongo/db/auth/privilege.h:22,
>>> |                  from src/mongo/db/auth/privilege.cpp:16:
>>> | src/mongo/bson/util/atomic_int.h:128:4: error: #error "unsupported compiler or platform"
>>> |  #  error "unsupported compiler or platform"
>>> |     ^
>>> | In file included from src/mongo/bson/bsonobj.h:29:0,
>>> |                  from src/mongo/db/jsobj.h:38,
>>> |                  from src/mongo/db/auth/privilege_parser.h:35,
>>> |                  from src/mongo/db/auth/privilege.h:22,
>>> |                  from src/mongo/db/commands/mr.h:37,
>>> |                  from src/mongo/db/commands/mr_common.cpp:29:
>>> | src/mongo/bson/util/atomic_int.h:128:4: error: #error "unsupported compiler or platform"
>>> |  #  error "unsupported compiler or platform"
>>> |     ^
>>> | In file included from src/mongo/bson/bsonobj.h:29:0,
>>> |                  from src/mongo/db/jsobj.h:38,
>>> |                  from src/mongo/bson/mutable/element.h:20,
>>> |                  from src/mongo/db/auth/authorization_manager.h:40,
>>> |                  from src/mongo/db/auth/authorization_session.h:38,
>>> |                  from src/mongo/db/auth/authorization_session.cpp:29:
>>> | src/mongo/bson/util/atomic_int.h:128:4: error: #error "unsupported compiler or platform"
>>> |  #  error "unsupported compiler or platform"
>>> |     ^
>>> | arm-oe-linux-gnueabi-g++ -march=armv5te -marm -mthumb-interwork --sysroot=/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemuarm -o build/linux2/disable-scripting/ld_arm-oe-linux-gnueabi-g++/ssl/use-system-boost/use-system-pcre/use-system-tcmalloc/mongo/db/commands/user_management_commands.o -c -Wnon-virtual-dtor -Woverloaded-virtual -fPIC -fno-strict-aliasing -ggdb -pthread -Wall -Wsign-compare -Wno-unknown-pragmas -Winvalid-pch -Werror -pipe -O3 -Wno-unused-local-typedefs -Wno-unused-function -Wno-deprecated-declarations -fno-builtin-memcmp -D_SCONS -DMONGO_EXPOSE_MACROS -DSUPPORT_UTF8 -DMONGO_OPTIMIZED_BUILD -D_FILE_OFFSET_BITS=64 -DMONGO_SSL -DMONGO_HAVE___THREAD -DBOOST_THREAD_VERSION=2 -DMONGO_HAVE_HEADER_UNISTD_H -DMONGO_HAVE_EXECINFO_BACKTRACE -Ibuild/linux2/disable-scripting/ld_arm-oe-linux-gnueabi-g++/ssl/use-system-boost/use-system-pcre/use-system-tcmalloc/third_party/snappy -Isrc/third_party/snappy -Ibuild/linux2/disable-scripting/ld_arm-oe-linux-gnu
ea
>> bi-g++/ssl/use-system-boost/use-system-pcre/use-system-tcmalloc/third_party/libstemmer_c/include -Isrc/third_party/libstemmer_c/include -Ibuild/linux2/disable-scripting/ld_arm-oe-linux-gnueabi-g++/ssl/use-system-boost/use-system-pcre/use-system-tcmalloc/third_party/s2 -Isrc/third_party/s2 -Ibuild/linux2/disable-scripting/ld_arm-oe-linux-gnueabi-g++/ssl/use-system-boost/use-system-pcre/use-system-tcmalloc -Isrc -Ibuild/linux2/disable-scripting/ld_arm-oe-linux-gnueabi-g++/ssl/use-system-boost/use-system-pcre/use-system-tcmalloc/mongo -Isrc/mongo -Ibuild/linux2/disable-scripting/ld_arm-oe-linux-gnueabi-g++/ssl/use-system-boost/use-system-pcre/use-system-tcmalloc/third_party/s2 -Isrc/third_party/s2 -Ibuild/linux2/disable-scripting/ld_arm-oe-linux-gnueabi-g++/ssl/use-system-boost/use-system-pcre/use-system-tcmalloc/third_party/snappy -Isrc/third_party/snappy -Ibuild/linux2/disable-scripting/ld_arm-oe-linux-gnueabi-g++/ssl/use-system-boost/use-system-pcre/use-system-tcmalloc/third_party/
yam
>> l-cpp-0.5.1/include -Isrc/third_party/yaml-cpp-0.5.1/include src/mongo/db/commands/user_management_commands.cpp
>>> | In file included from src/mongo/bson/bsonobj.h:29:0,
>>> |                  from src/mongo/db/jsobj.h:38,
>>> |                  from src/mongo/db/diskloc.h:37,
>>> |                  from src/mongo/db/clientcursor.h:33,
>>> |                  from src/mongo/db/query/new_find.h:33,
>>> |                  from src/mongo/db/query/new_find.cpp:29:
>>> | src/mongo/bson/util/atomic_int.h:128:4: error: #error "unsupported compiler or platform"
>>> |  #  error "unsupported compiler or platform"
>>> |     ^
>>> | In file included from src/mongo/bson/bsonobj.h:29:0,
>>> |                  from src/mongo/db/jsobj.h:38,
>>> |                  from src/mongo/db/auth/privilege_parser.h:35,
>>> |                  from src/mongo/db/auth/privilege.h:22,
>>> |                  from src/mongo/db/commands/find_and_modify.h:34,
>>> |                  from src/mongo/db/commands/find_and_modify_common.cpp:31:
>>> | src/mongo/bson/util/atomic_int.h:128:4: error: #error "unsupported compiler or platform"
>>> |  #  error "unsupported compiler or platform"
>>> |     ^
>>> | In file included from src/mongo/bson/bsonobj.h:29:0,
>>> |                  from src/mongo/db/jsobj.h:38,
>>> |                  from src/mongo/db/auth/privilege_parser.h:35,
>>> |                  from src/mongo/db/auth/privilege.h:22,
>>> |                  from src/mongo/db/commands/hashcmd.cpp:42:
>>> | src/mongo/bson/util/atomic_int.h:128:4: error: #error "unsupported compiler or platform"
>>> |  #  error "unsupported compiler or platform"
>>> |     ^
>>> | In file included from src/mongo/bson/bsonobj.h:29:0,
>>> |                  from src/mongo/db/jsobj.h:38,
>>> |                  from src/mongo/db/auth/privilege_parser.h:35,
>>> |                  from src/mongo/db/auth/privilege.h:22,
>>> |                  from src/mongo/db/commands.h:24,
>>> |                  from src/mongo/db/commands/user_management_commands.h:31,
>>> |                  from src/mongo/db/commands/user_management_commands.cpp:31:
>>> | src/mongo/bson/util/atomic_int.h:128:4: error: #error "unsupported compiler or platform"
>>> |  #  error "unsupported compiler or platform"
>>> |     ^
>>> | src/mongo/bson/util/atomic_int.h:41:21: error: inline function 'void mongo::AtomicUInt::set(unsigned int)' used but never defined [-Werror]
>>> |          inline void set(unsigned newX);
>>> |                      ^
>>> | src/mongo/bson/util/atomic_int.h:44:27: error: inline function 'mongo::AtomicUInt mongo::AtomicUInt::operator++(int)' used but never defined [-Werror]
>>> |          inline AtomicUInt operator++(int);// postfix++
>>> |                            ^
>>> | src/mongo/bson/util/atomic_int.h:45:27: error: inline function 'mongo::AtomicUInt mongo::AtomicUInt::operator--()' used but never defined [-Werror]
>>> |          inline AtomicUInt operator--(); // --prefix
>>> |                            ^
>>> | cc1plus: all warnings being treated as errors
>>> | scons: *** [build/linux2/disable-scripting/ld_arm-oe-linux-gnueabi-g++/ssl/use-system-boost/use-system-pcre/use-system-tcmalloc/mongo/db/auth/privilege.o] Error 1
>>> | src/mongo/bson/util/atomic_int.h:41:21: error: inline function 'void mongo::AtomicUInt::set(unsigned int)' used but never defined [-Werror]
>>> |          inline void set(unsigned newX);
>>> |                      ^
>>> | src/mongo/bson/util/atomic_int.h:44:27: error: inline function 'mongo::AtomicUInt mongo::AtomicUInt::operator++(int)' used but never defined [-Werror]
>>> |          inline AtomicUInt operator++(int);// postfix++
>>> |                            ^
>>> | src/mongo/bson/util/atomic_int.h:45:27: error: inline function 'mongo::AtomicUInt mongo::AtomicUInt::operator--()' used but never defined [-Werror]
>>> |          inline AtomicUInt operator--(); // --prefix
>>> |                            ^
>>> | cc1plus: all warnings being treated as errors
>>> | scons: *** [build/linux2/disable-scripting/ld_arm-oe-linux-gnueabi-g++/ssl/use-system-boost/use-system-pcre/use-system-tcmalloc/mongo/db/commands/find_and_modify_common.o] Error 1
>>> | src/mongo/bson/util/atomic_int.h:41:21: error: inline function 'void mongo::AtomicUInt::set(unsigned int)' used but never defined [-Werror]
>>> |          inline void set(unsigned newX);
>>> |                      ^
>>> ......
>>
>> It looks like gcc for qemuarm lacks support for some atomic ops, the
>> above seems to get triggered by __GCC_HAVE_SYNC_COMPARE_AND_SWAP_4 not
>> being there.
>>
>> Which gcc are you using, 4.8?
>
> Yup, 4.8 from oe-core.

These atomic ops *are* available for gcc 4.8, but it doesn't advertise 
them for armv5te. There are 2 solutions:

1) CFLAGS += -D__GCC_HAVE_SYNC_COMPARE_AND_SWAP_4=1
2) Add a block to that files that tests for gcc > 4.7.0 (that's what 
fedora does)

I'll see if I can find time to fix this next week.

-- 
Koen Kooi
Builds and Baselines | Release Manager
Linaro.org | Open source software for ARM SoCs

