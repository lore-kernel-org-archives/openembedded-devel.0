Return-Path: <pascal.bach@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id 70BF0719B7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 May 2017 07:22:03 +0000 (UTC)
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id v4C7M0LZ004513
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Fri, 12 May 2017 09:22:00 +0200
Received: from [139.16.79.59] (MD1FZU9C.ad001.siemens.net [139.16.79.59])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTPS id v4C7LwDk009236
	(version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 12 May 2017 09:21:59 +0200
To: Khem Raj <raj.khem@gmail.com>
References: <1494491430-22799-1-git-send-email-pascal.bach@siemens.com>
	<CAMKF1spARN8qNTBUXu0EiQj=mkG-HRtXwCr8yWrJNnmMoHqH3Q@mail.gmail.com>
From: Pascal Bach <pascal.bach@siemens.com>
Message-ID: <d144347f-6587-2ce4-619a-b877f78b7d86@siemens.com>
Date: Fri, 12 May 2017 09:21:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1spARN8qNTBUXu0EiQj=mkG-HRtXwCr8yWrJNnmMoHqH3Q@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] protobuf: update to 3.3.0
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
X-List-Received-Date: Fri, 12 May 2017 07:22:05 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit


>> -inherit autotools
>> +inherit autotools-brokensep
> this is backwards, can we see what broke out of tree build ?

I agree, but it seems upstream dosn't care to much about out of tree builds.

From a qucik check it seems like they are generating a file in the source tree but are looking for it later in the build tree. I haven't looked into what commit introduced this issue.

 Here is the error I get:

ERROR: Logfile of failure stored in: /home/projects/ccp2-next/oe/build/tmp/work/cortexa8-vfp-ccp-linux-gnueabi/protobuf/3.3.0+gitAUTOINC+a6189acd18-r0/temp/log.do_compile.11023
Log data follows:
| DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common', 'arm-32', 'common-linux', 'common-glibc', 'arm-linux', 'arm-linux-gnueabi', 'common']
| DEBUG: Executing shell function do_compile
| NOTE: make -j 8
| ERROR: oe_runmake failed
| make  all-recursive
| make[1]: Entering directory '/home/projects/ccp2-next/oe/build/tmp/work/cortexa8-vfp-ccp-linux-gnueabi/protobuf/3.3.0+gitAUTOINC+a6189acd18-r0/build'
| Making all in .
| make[2]: Entering directory '/home/projects/ccp2-next/oe/build/tmp/work/cortexa8-vfp-ccp-linux-gnueabi/protobuf/3.3.0+gitAUTOINC+a6189acd18-r0/build'
| make[2]: Leaving directory '/home/projects/ccp2-next/oe/build/tmp/work/cortexa8-vfp-ccp-linux-gnueabi/protobuf/3.3.0+gitAUTOINC+a6189acd18-r0/build'
| Making all in src
| make[2]: Entering directory '/home/projects/ccp2-next/oe/build/tmp/work/cortexa8-vfp-ccp-linux-gnueabi/protobuf/3.3.0+gitAUTOINC+a6189acd18-r0/build/src'
| echo -I../../git/src --cpp_out=. ../../git/src/google/protobuf/any_test.proto ../../git/src/google/protobuf/compiler/cpp/cpp_test_bad_identifiers.proto ../../git/src/google/protobuf/map_lite_unittest.proto ../../git/src/google/protobuf/map_proto2_unittest.proto ../../git/src/google/protobuf/map_unittest.proto ../../git/src/google/protobuf/unittest_arena.proto ../../git/src/google/protobuf/unittest_custom_options.proto ../../git/src/google/protobuf/unittest_drop_unknown_fields.proto ../../git/src/google/protobuf/unittest_embed_optimize_for.proto ../../git/src/google/protobuf/unittest_empty.proto ../../git/src/google/protobuf/unittest_enormous_descriptor.proto ../../git/src/google/protobuf/unittest_import_lite.proto ../../git/src/google/protobuf/unittest_import.proto ../../git/src/google/protobuf/unittest_import_public_lite.proto ../../git/src/google/protobuf/unittest_import_public.proto ../../git/src/google/protobuf/unittest_lazy_dependencies.proto
../../git/src/google/protobuf/unittest_lazy_dependencies_custom_option.proto ../../git/src/google/protobuf/unittest_lazy_dependencies_enum.proto ../../git/src/google/protobuf/unittest_lite_imports_nonlite.proto ../../git/src/google/protobuf/unittest_lite.proto ../../git/src/google/protobuf/unittest_mset.proto ../../git/src/google/protobuf/unittest_mset_wire_format.proto ../../git/src/google/protobuf/unittest_no_arena_lite.proto ../../git/src/google/protobuf/unittest_no_arena_import.proto ../../git/src/google/protobuf/unittest_no_arena.proto ../../git/src/google/protobuf/unittest_no_field_presence.proto ../../git/src/google/protobuf/unittest_no_generic_services.proto ../../git/src/google/protobuf/unittest_optimize_for.proto ../../git/src/google/protobuf/unittest_preserve_unknown_enum2.proto ../../git/src/google/protobuf/unittest_preserve_unknown_enum.proto ../../git/src/google/protobuf/unittest.proto ../../git/src/google/protobuf/unittest_proto3_arena.proto
../../git/src/google/protobuf/unittest_proto3_arena_lite.proto ../../git/src/google/protobuf/unittest_proto3_lite.proto ../../git/src/google/protobuf/unittest_well_known_types.proto ../../git/src/google/protobuf/util/internal/testdata/anys.proto ../../git/src/google/protobuf/util/internal/testdata/books.proto ../../git/src/google/protobuf/util/internal/testdata/default_value.proto ../../git/src/google/protobuf/util/internal/testdata/default_value_test.proto ../../git/src/google/protobuf/util/internal/testdata/field_mask.proto ../../git/src/google/protobuf/util/internal/testdata/maps.proto ../../git/src/google/protobuf/util/internal/testdata/oneofs.proto ../../git/src/google/protobuf/util/internal/testdata/proto3.proto ../../git/src/google/protobuf/util/internal/testdata/struct.proto ../../git/src/google/protobuf/util/internal/testdata/timestamp_duration.proto ../../git/src/google/protobuf/util/internal/testdata/wrappers.proto
../../git/src/google/protobuf/util/json_format_proto3.proto ../../git/src/google/protobuf/util/message_differencer_unittest.proto ../../git/src/google/protobuf/compiler/cpp/cpp_test_large_enum_value.proto
| -I../../git/src --cpp_out=. ../../git/src/google/protobuf/any_test.proto ../../git/src/google/protobuf/compiler/cpp/cpp_test_bad_identifiers.proto ../../git/src/google/protobuf/map_lite_unittest.proto ../../git/src/google/protobuf/map_proto2_unittest.proto ../../git/src/google/protobuf/map_unittest.proto ../../git/src/google/protobuf/unittest_arena.proto ../../git/src/google/protobuf/unittest_custom_options.proto ../../git/src/google/protobuf/unittest_drop_unknown_fields.proto ../../git/src/google/protobuf/unittest_embed_optimize_for.proto ../../git/src/google/protobuf/unittest_empty.proto ../../git/src/google/protobuf/unittest_enormous_descriptor.proto ../../git/src/google/protobuf/unittest_import_lite.proto ../../git/src/google/protobuf/unittest_import.proto ../../git/src/google/protobuf/unittest_import_public_lite.proto ../../git/src/google/protobuf/unittest_import_public.proto ../../git/src/google/protobuf/unittest_lazy_dependencies.proto
../../git/src/google/protobuf/unittest_lazy_dependencies_custom_option.proto ../../git/src/google/protobuf/unittest_lazy_dependencies_enum.proto ../../git/src/google/protobuf/unittest_lite_imports_nonlite.proto ../../git/src/google/protobuf/unittest_lite.proto ../../git/src/google/protobuf/unittest_mset.proto ../../git/src/google/protobuf/unittest_mset_wire_format.proto ../../git/src/google/protobuf/unittest_no_arena_lite.proto ../../git/src/google/protobuf/unittest_no_arena_import.proto ../../git/src/google/protobuf/unittest_no_arena.proto ../../git/src/google/protobuf/unittest_no_field_presence.proto ../../git/src/google/protobuf/unittest_no_generic_services.proto ../../git/src/google/protobuf/unittest_optimize_for.proto ../../git/src/google/protobuf/unittest_preserve_unknown_enum2.proto ../../git/src/google/protobuf/unittest_preserve_unknown_enum.proto ../../git/src/google/protobuf/unittest.proto ../../git/src/google/protobuf/unittest_proto3_arena.proto
../../git/src/google/protobuf/unittest_proto3_arena_lite.proto ../../git/src/google/protobuf/unittest_proto3_lite.proto ../../git/src/google/protobuf/unittest_well_known_types.proto ../../git/src/google/protobuf/util/internal/testdata/anys.proto ../../git/src/google/protobuf/util/internal/testdata/books.proto ../../git/src/google/protobuf/util/internal/testdata/default_value.proto ../../git/src/google/protobuf/util/internal/testdata/default_value_test.proto ../../git/src/google/protobuf/util/internal/testdata/field_mask.proto ../../git/src/google/protobuf/util/internal/testdata/maps.proto ../../git/src/google/protobuf/util/internal/testdata/oneofs.proto ../../git/src/google/protobuf/util/internal/testdata/proto3.proto ../../git/src/google/protobuf/util/internal/testdata/struct.proto ../../git/src/google/protobuf/util/internal/testdata/timestamp_duration.proto ../../git/src/google/protobuf/util/internal/testdata/wrappers.proto
../../git/src/google/protobuf/util/json_format_proto3.proto ../../git/src/google/protobuf/util/message_differencer_unittest.proto ../../git/src/google/protobuf/compiler/cpp/cpp_test_large_enum_value.proto
| touch unittest_proto_middleman
| g++  -o js_embed ../../git/src/google/protobuf/compiler/js/embed.cc
| oldpwd=`pwd` && cd ../../git/src && \
| $oldpwd/js_embed google/protobuf/compiler/js/well_known_types/any.js google/protobuf/compiler/js/well_known_types/struct.js google/protobuf/compiler/js/well_known_types/timestamp.js > $oldpwd/google/protobuf/compiler/js/well_known_types_embed.cc
| /bin/sh: line 1: /home/projects/ccp2-next/oe/build/tmp/work/cortexa8-vfp-ccp-linux-gnueabi/protobuf/3.3.0+gitAUTOINC+a6189acd18-r0/build/src/google/protobuf/compiler/js/well_known_types_embed.cc: No such file or directory
| Makefile:8108: recipe for target 'google/protobuf/compiler/js/well_known_types_embed.cc' failed
| make[2]: *** [google/protobuf/compiler/js/well_known_types_embed.cc] Error 1
| make[2]: Leaving directory '/home/projects/ccp2-next/oe/build/tmp/work/cortexa8-vfp-ccp-linux-gnueabi/protobuf/3.3.0+gitAUTOINC+a6189acd18-r0/build/src'
| Makefile:1397: recipe for target 'all-recursive' failed
| make[1]: *** [all-recursive] Error 1
| make[1]: Leaving directory '/home/projects/ccp2-next/oe/build/tmp/work/cortexa8-vfp-ccp-linux-gnueabi/protobuf/3.3.0+gitAUTOINC+a6189acd18-r0/build'
| Makefile:1304: recipe for target 'all' failed
| make: *** [all] Error 2
| ERROR: Function failed: do_compile (log file is located at /home/projects/ccp2-next/oe/build/tmp/work/cortexa8-vfp-ccp-linux-gnueabi/protobuf/3.3.0+gitAUTOINC+a6189acd18-r0/temp/log.do_compile.11023)
ERROR: Task (/home/projects/ccp2-next/oe/build/../meta-oe/meta-oe/recipes-devtools/protobuf/protobuf_3.3.0.bb:do_compile) failed with exit code '1'

