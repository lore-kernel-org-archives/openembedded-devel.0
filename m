Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90570C25B66
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 19:52:54 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.63863.1699041165611404386
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 12:52:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=fYJipwIv;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=iuwliuks;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018b96bed41e-3f2a4a9c-0589-4d93-a3fe-fe70a95c40b0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041171;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=xiX12+3St8N7AJyyQpjRSZBmbMDMprf6icQHqeflYHM=;
	b=fYJipwIvaBuB765GYOsR34oWS4iqqVXAFH6rKeMdoeSQXQ1nbjVrHETnod8cxOFc
	eAFDHzu/qZJIreukRxIfn/2wV0YvLvU/fcUGVtOq9lywufwz9ziPKvpgcCUy1L6dDNk
	O7KM7a/XAYiVxM/ihdSGKT94ECGLuSnDhuTvUVy0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041171;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=xiX12+3St8N7AJyyQpjRSZBmbMDMprf6icQHqeflYHM=;
	b=iuwliukslaLOM9aUFF+iJvS4twDNjf2d2ijM5vqaOOlZ/Z3LPzYI5pCboU9Es3GB
	3oV01mTnV38AuMmI+v3RhPNWod3u2p+FrCG+HhCDCv+c2lq7gZjsQJiMVRxv/lWa2JX
	stCSe3OdFrZ2MwLUmP1y8l6IrPDEqK4loTpNwABs=
Content-Type: multipart/mixed; boundary="===============5504811481830305705=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] msgpack-c: upgrading to 6.1.0 FAILED
Message-ID: <0101018b96bed41e-3f2a4a9c-0589-4d93-a3fe-fe70a95c40b0-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 19:52:50 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.191
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 19:52:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106003

--===============5504811481830305705==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *msgpack-c* to *6.1.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade msgpack-c -V 6.1.0 -S 8c602e8579c7e7d65d6f9c6703c9699db3fb0488
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 5004 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-e575f59b82eae78fb1ac8df7198eaa4a7a963259"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "master:e575f59b82eae78fb1ac8df7198eaa4a7a963259"
meta-oe              
meta-python          
meta-perl            
meta-networking      
meta-multimedia      
meta-gnome           
meta-xfce            
meta-filesystems     
meta-initramfs       
meta-webserver       = "tmp-auh-upgrades:a283c6480618a2f3dfac2e815f8f9c6fcc6be931"
workspace            = "master:e575f59b82eae78fb1ac8df7198eaa4a7a963259"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 5 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 8c602e8579c7e7d65d6f9c6703c9699db3fb0488
WARNING: Command 'git rebase 8c602e8579c7e7d65d6f9c6703c9699db3fb0488' failed:
CONFLICT (modify/delete): .github/depends/boost.sh deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of .github/depends/boost.sh left in tree.
CONFLICT (modify/delete): ci/build_regression.sh deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of ci/build_regression.sh left in tree.
CONFLICT (modify/delete): erb/v1/cpp03_zone.hpp.erb deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of erb/v1/cpp03_zone.hpp.erb left in tree.
CONFLICT (modify/delete): example/CMakeLists.txt deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of example/CMakeLists.txt left in tree.
CONFLICT (modify/delete): example/boost/CMakeLists.txt deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of example/boost/CMakeLists.txt left in tree.
CONFLICT (modify/delete): example/boost/asio_send_recv_zlib.cpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of example/boost/asio_send_recv_zlib.cpp left in tree.
CONFLICT (modify/delete): example/cpp03/CMakeLists.txt deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of example/cpp03/CMakeLists.txt left in tree.
CONFLICT (modify/delete): example/cpp11/CMakeLists.txt deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of example/cpp11/CMakeLists.txt left in tree.
CONFLICT (modify/delete): example/cpp11/container.cpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of example/cpp11/container.cpp left in tree.
CONFLICT (modify/delete): example/x3/CMakeLists.txt deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of example/x3/CMakeLists.txt left in tree.
CONFLICT (modify/delete): fuzz/CMakeLists.txt deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of fuzz/CMakeLists.txt left in tree.
CONFLICT (modify/delete): fuzz/regression_runner.cpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of fuzz/regression_runner.cpp left in tree.
CONFLICT (modify/delete): fuzz/unpack_pack_fuzzer.cpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of fuzz/unpack_pack_fuzzer.cpp left in tree.
CONFLICT (modify/delete): include/msgpack/adaptor/define_decl.hpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of include/msgpack/adaptor/define_decl.hpp left in tree.
CONFLICT (modify/delete): include/msgpack/adaptor/tr1/unordered_map.hpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of include/msgpack/adaptor/tr1/unordered_map.hpp left in tree.
CONFLICT (modify/delete): include/msgpack/adaptor/tr1/unordered_set.hpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of include/msgpack/adaptor/tr1/unordered_set.hpp left in tree.
CONFLICT (modify/delete): include/msgpack/gcc_atomic.hpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of include/msgpack/gcc_atomic.hpp left in tree.
CONFLICT (modify/delete): include/msgpack/iterator.hpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of include/msgpack/iterator.hpp left in tree.
CONFLICT (modify/delete): include/msgpack/iterator_decl.hpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of include/msgpack/iterator_decl.hpp left in tree.
CONFLICT (modify/delete): include/msgpack/predef/os/linux.h deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of include/msgpack/predef/os/linux.h left in tree.
CONFLICT (modify/delete): include/msgpack/preprocessor/config/config.hpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of include/msgpack/preprocessor/config/config.hpp left in tree.
CONFLICT (modify/delete): include/msgpack/type.hpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of include/msgpack/type.hpp left in tree.
CONFLICT (modify/delete): include/msgpack/v1/adaptor/array_ref_decl.hpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of include/msgpack/v1/adaptor/array_ref_decl.hpp left in tree.
CONFLICT (modify/delete): include/msgpack/v1/adaptor/bool.hpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of include/msgpack/v1/adaptor/bool.hpp left in tree.
CONFLICT (modify/delete): include/msgpack/v1/adaptor/boost/fusion.hpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of include/msgpack/v1/adaptor/boost/fusion.hpp left in tree.
CONFLICT (modify/delete): include/msgpack/v1/adaptor/boost/msgpack_variant.hpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of include/msgpack/v1/adaptor/boost/msgpack_variant.hpp left in tree.
CONFLICT (modify/delete): include/msgpack/v1/adaptor/boost/msgpack_variant_decl.hpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of include/msgpack/v1/adaptor/boost/msgpack_variant_decl.hpp left in tree.
CONFLICT (modify/delete): include/msgpack/v1/adaptor/boost/optional.hpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of include/msgpack/v1/adaptor/boost/optional.hpp left in tree.
CONFLICT (modify/delete): include/msgpack/v1/adaptor/boost/string_ref.hpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of include/msgpack/v1/adaptor/boost/string_ref.hpp left in tree.
CONFLICT (modify/delete): include/msgpack/v1/adaptor/boost/string_view.hpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of include/msgpack/v1/adaptor/boost/string_view.hpp left in tree.
CONFLICT (modify/delete): include/msgpack/v1/adaptor/check_container_size_decl.hpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of include/msgpack/v1/adaptor/check_container_size_decl.hpp left in tree.
CONFLICT (modify/delete): include/msgpack/v1/adaptor/cpp11/array.hpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of include/msgpack/v1/adaptor/cpp11/array.hpp left in tree.
CONFLICT (modify/delete): include/msgpack/v1/adaptor/cpp11/array_char.hpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of include/msgpack/v1/adaptor/cpp11/array_char.hpp left in tree.
CONFLICT (modify/delete): include/msgpack/v1/adaptor/cpp11/array_unsigned_char.hpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of include/msgpack/v1/adaptor/cpp11/array_unsigned_char.hpp left in tree.
CONFLICT (modify/delete): include/msgpack/v1/adaptor/cpp11/chrono.hpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of include/msgpack/v1/adaptor/cpp11/chrono.hpp left in tree.
CONFLICT (modify/delete): include/msgpack/v1/adaptor/cpp11/forward_list.hpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of include/msgpack/v1/adaptor/cpp11/forward_list.hpp left in tree.
CONFLICT (modify/delete): include/msgpack/v1/adaptor/cpp11/reference_wrapper.hpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of include/msgpack/v1/adaptor/cpp11/reference_wrapper.hpp left in tree.
CONFLICT (modify/delete): include/msgpack/v1/adaptor/cpp11/shared_ptr.hpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of include/msgpack/v1/adaptor/cpp11/shared_ptr.hpp left in tree.
CONFLICT (modify/delete): include/msgpack/v1/adaptor/cpp11/timespec.hpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of include/msgpack/v1/adaptor/cpp11/timespec.hpp left in tree.
CONFLICT (modify/delete): include/msgpack/v1/adaptor/cpp11/tuple.hpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of include/msgpack/v1/adaptor/cpp11/tuple.hpp left in tree.
CONFLICT (modify/delete): include/msgpack/v1/adaptor/cpp11/unique_ptr.hpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of include/msgpack/v1/adaptor/cpp11/unique_ptr.hpp left in tree.
CONFLICT (modify/delete): include/msgpack/v1/adaptor/cpp11/unordered_map.hpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of include/msgpack/v1/adaptor/cpp11/unordered_map.hpp left in tree.
CONFLICT (modify/delete): include/msgpack/v1/adaptor/cpp11/unordered_set.hpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of include/msgpack/v1/adaptor/cpp11/unordered_set.hpp left in tree.
CONFLICT (modify/delete): include/msgpack/v1/adaptor/cpp17/byte.hpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of include/msgpack/v1/adaptor/cpp17/byte.hpp left in tree.
CONFLICT (modify/delete): include/msgpack/v1/adaptor/cpp17/carray_byte.hpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of include/msgpack/v1/adaptor/cpp17/carray_byte.hpp left in tree.
CONFLICT (modify/delete): include/msgpack/v1/adaptor/cpp17/optional.hpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of include/msgpack/v1/adaptor/cpp17/optional.hpp left in tree.
CONFLICT (modify/delete): include/msgpack/v1/adaptor/cpp17/string_view.hpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of include/msgpack/v1/adaptor/cpp17/string_view.hpp left in tree.
CONFLICT (modify/delete): include/msgpack/v1/adaptor/cpp17/vector_byte.hpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of include/msgpack/v1/adaptor/cpp17/vector_byte.hpp left in tree.
CONFLICT (modify/delete): include/msgpack/v1/adaptor/deque.hpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of include/msgpack/v1/adaptor/deque.hpp left in tree.
CONFLICT (modify/delete): include/msgpack/v1/adaptor/detail/cpp11_convert_helper.hpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of include/msgpack/v1/adaptor/detail/cpp11_convert_helper.hpp left in tree.
CONFLICT (modify/delete): include/msgpack/v1/adaptor/detail/cpp11_define_array_decl.hpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of include/msgpack/v1/adaptor/detail/cpp11_define_array_decl.hpp left in tree.
CONFLICT (modify/delete): include/msgpack/v1/adaptor/detail/cpp11_define_map_decl.hpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of include/msgpack/v1/adaptor/detail/cpp11_define_map_decl.hpp left in tree.
CONFLICT (modify/delete): include/msgpack/v1/adaptor/ext.hpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of include/msgpack/v1/adaptor/ext.hpp left in tree.
CONFLICT (modify/delete): include/msgpack/v1/adaptor/ext_decl.hpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of include/msgpack/v1/adaptor/ext_decl.hpp left in tree.
CONFLICT (modify/delete): include/msgpack/v1/adaptor/fixint_decl.hpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of include/msgpack/v1/adaptor/fixint_decl.hpp left in tree.
CONFLICT (modify/delete): include/msgpack/v1/adaptor/int_decl.hpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of include/msgpack/v1/adaptor/int_decl.hpp left in tree.
CONFLICT (modify/delete): include/msgpack/v1/adaptor/list.hpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of include/msgpack/v1/adaptor/list.hpp left in tree.
CONFLICT (modify/delete): include/msgpack/v1/adaptor/map.hpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of include/msgpack/v1/adaptor/map.hpp left in tree.
CONFLICT (modify/delete): include/msgpack/v1/adaptor/nil_decl.hpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of include/msgpack/v1/adaptor/nil_decl.hpp left in tree.
CONFLICT (modify/delete): include/msgpack/v1/adaptor/pair.hpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of include/msgpack/v1/adaptor/pair.hpp left in tree.
CONFLICT (modify/delete): include/msgpack/v1/adaptor/raw.hpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of include/msgpack/v1/adaptor/raw.hpp left in tree.
CONFLICT (modify/delete): include/msgpack/v1/adaptor/raw_decl.hpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of include/msgpack/v1/adaptor/raw_decl.hpp left in tree.
CONFLICT (modify/delete): include/msgpack/v1/adaptor/set.hpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of include/msgpack/v1/adaptor/set.hpp left in tree.
CONFLICT (modify/delete): include/msgpack/v1/adaptor/size_equal_only_decl.hpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of include/msgpack/v1/adaptor/size_equal_only_decl.hpp left in tree.
CONFLICT (modify/delete): include/msgpack/v1/adaptor/string.hpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of include/msgpack/v1/adaptor/string.hpp left in tree.
CONFLICT (modify/delete): include/msgpack/v1/adaptor/tr1/unordered_map.hpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of include/msgpack/v1/adaptor/tr1/unordered_map.hpp left in tree.
CONFLICT (modify/delete): include/msgpack/v1/adaptor/tr1/unordered_set.hpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of include/msgpack/v1/adaptor/tr1/unordered_set.hpp left in tree.
CONFLICT (modify/delete): include/msgpack/v1/adaptor/v4raw.hpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of include/msgpack/v1/adaptor/v4raw.hpp left in tree.
CONFLICT (modify/delete): include/msgpack/v1/adaptor/v4raw_decl.hpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of include/msgpack/v1/adaptor/v4raw_decl.hpp left in tree.
CONFLICT (modify/delete): include/msgpack/v1/adaptor/vector.hpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of include/msgpack/v1/adaptor/vector.hpp left in tree.
CONFLICT (modify/delete): include/msgpack/v1/adaptor/vector_char.hpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of include/msgpack/v1/adaptor/vector_char.hpp left in tree.
CONFLICT (modify/delete): include/msgpack/v1/adaptor/vector_unsigned_char.hpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of include/msgpack/v1/adaptor/vector_unsigned_char.hpp left in tree.
CONFLICT (modify/delete): include/msgpack/v1/adaptor/wstring.hpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of include/msgpack/v1/adaptor/wstring.hpp left in tree.
CONFLICT (modify/delete): include/msgpack/v1/cpp_config.hpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of include/msgpack/v1/cpp_config.hpp left in tree.
CONFLICT (modify/delete): include/msgpack/v1/cpp_config_decl.hpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of include/msgpack/v1/cpp_config_decl.hpp left in tree.
CONFLICT (modify/delete): include/msgpack/v1/detail/cpp03_zone.hpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of include/msgpack/v1/detail/cpp03_zone.hpp left in tree.
CONFLICT (modify/delete): include/msgpack/v1/detail/cpp11_zone.hpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of include/msgpack/v1/detail/cpp11_zone.hpp left in tree.
CONFLICT (modify/delete): include/msgpack/v1/fbuffer.hpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of include/msgpack/v1/fbuffer.hpp left in tree.
CONFLICT (modify/delete): include/msgpack/v1/iterator_decl.hpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of include/msgpack/v1/iterator_decl.hpp left in tree.
CONFLICT (modify/delete): include/msgpack/v1/object.hpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of include/msgpack/v1/object.hpp left in tree.
CONFLICT (modify/delete): include/msgpack/v1/object_decl.hpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of include/msgpack/v1/object_decl.hpp left in tree.
CONFLICT (modify/delete): include/msgpack/v1/object_fwd.hpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of include/msgpack/v1/object_fwd.hpp left in tree.
CONFLICT (modify/delete): include/msgpack/v1/object_fwd_decl.hpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of include/msgpack/v1/object_fwd_decl.hpp left in tree.
CONFLICT (modify/delete): include/msgpack/v1/pack.hpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of include/msgpack/v1/pack.hpp left in tree.
CONFLICT (modify/delete): include/msgpack/v1/pack_decl.hpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of include/msgpack/v1/pack_decl.hpp left in tree.
CONFLICT (modify/delete): include/msgpack/v1/sbuffer.hpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of include/msgpack/v1/sbuffer.hpp left in tree.
CONFLICT (modify/delete): include/msgpack/v1/unpack.hpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of include/msgpack/v1/unpack.hpp left in tree.
CONFLICT (modify/delete): include/msgpack/v1/unpack_decl.hpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of include/msgpack/v1/unpack_decl.hpp left in tree.
CONFLICT (modify/delete): include/msgpack/v1/version.hpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of include/msgpack/v1/version.hpp left in tree.
CONFLICT (modify/delete): include/msgpack/v1/versioning.hpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of include/msgpack/v1/versioning.hpp left in tree.
CONFLICT (modify/delete): include/msgpack/v1/vrefbuffer.hpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of include/msgpack/v1/vrefbuffer.hpp left in tree.
CONFLICT (modify/delete): include/msgpack/v1/zbuffer.hpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of include/msgpack/v1/zbuffer.hpp left in tree.
CONFLICT (modify/delete): include/msgpack/v2/adaptor/boost/msgpack_variant_decl.hpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of include/msgpack/v2/adaptor/boost/msgpack_variant_decl.hpp left in tree.
CONFLICT (modify/delete): include/msgpack/v2/adaptor/v4raw_decl.hpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of include/msgpack/v2/adaptor/v4raw_decl.hpp left in tree.
CONFLICT (modify/delete): include/msgpack/v2/cpp_config_decl.hpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of include/msgpack/v2/cpp_config_decl.hpp left in tree.
CONFLICT (modify/delete): include/msgpack/v2/create_object_visitor.hpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of include/msgpack/v2/create_object_visitor.hpp left in tree.
CONFLICT (modify/delete): include/msgpack/v2/iterator_decl.hpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of include/msgpack/v2/iterator_decl.hpp left in tree.
CONFLICT (modify/delete): include/msgpack/v2/parse.hpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of include/msgpack/v2/parse.hpp left in tree.
CONFLICT (modify/delete): include/msgpack/v3/adaptor/adaptor_base.hpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of include/msgpack/v3/adaptor/adaptor_base.hpp left in tree.
CONFLICT (modify/delete): include/msgpack/v3/adaptor/adaptor_base_decl.hpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of include/msgpack/v3/adaptor/adaptor_base_decl.hpp left in tree.
CONFLICT (modify/delete): include/msgpack/v3/adaptor/boost/msgpack_variant_decl.hpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of include/msgpack/v3/adaptor/boost/msgpack_variant_decl.hpp left in tree.
CONFLICT (modify/delete): include/msgpack/v3/adaptor/v4raw_decl.hpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of include/msgpack/v3/adaptor/v4raw_decl.hpp left in tree.
CONFLICT (modify/delete): include/msgpack/v3/cpp_config_decl.hpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of include/msgpack/v3/cpp_config_decl.hpp left in tree.
CONFLICT (modify/delete): include/msgpack/v3/iterator_decl.hpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of include/msgpack/v3/iterator_decl.hpp left in tree.
CONFLICT (modify/delete): include/msgpack/v3/parse.hpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of include/msgpack/v3/parse.hpp left in tree.
CONFLICT (modify/delete): include/msgpack/version.hpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of include/msgpack/version.hpp left in tree.
CONFLICT (modify/delete): include/msgpack/versioning.hpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of include/msgpack/versioning.hpp left in tree.
CONFLICT (modify/delete): make_file_list.sh deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of make_file_list.sh left in tree.
CONFLICT (modify/delete): test/array_ref.cpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of test/array_ref.cpp left in tree.
CONFLICT (modify/delete): test/boost_fusion.cpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of test/boost_fusion.cpp left in tree.
CONFLICT (modify/delete): test/boost_optional.cpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of test/boost_optional.cpp left in tree.
CONFLICT (modify/delete): test/boost_string_ref.cpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of test/boost_string_ref.cpp left in tree.
CONFLICT (modify/delete): test/boost_string_view.cpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of test/boost_string_view.cpp left in tree.
CONFLICT (modify/delete): test/boost_variant.cpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of test/boost_variant.cpp left in tree.
CONFLICT (modify/delete): test/buffer.cpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of test/buffer.cpp left in tree.
CONFLICT (modify/delete): test/carray.cpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of test/carray.cpp left in tree.
CONFLICT (modify/delete): test/cases.cpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of test/cases.cpp left in tree.
CONFLICT (modify/delete): test/convert.cpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of test/convert.cpp left in tree.
CONFLICT (modify/delete): test/fixint.cpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of test/fixint.cpp left in tree.
CONFLICT (modify/delete): test/fuzz_unpack_pack_fuzzer_cpp11.cpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of test/fuzz_unpack_pack_fuzzer_cpp11.cpp left in tree.
CONFLICT (modify/delete): test/iterator_cpp11.cpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of test/iterator_cpp11.cpp left in tree.
CONFLICT (modify/delete): test/json.cpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of test/json.cpp left in tree.
CONFLICT (modify/delete): test/limit.cpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of test/limit.cpp left in tree.
CONFLICT (modify/delete): test/msgpack_basic.cpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of test/msgpack_basic.cpp left in tree.
CONFLICT (modify/delete): test/msgpack_container.cpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of test/msgpack_container.cpp left in tree.
CONFLICT (modify/delete): test/msgpack_cpp11.cpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of test/msgpack_cpp11.cpp left in tree.
CONFLICT (modify/delete): test/msgpack_cpp17.cpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of test/msgpack_cpp17.cpp left in tree.
CONFLICT (modify/delete): test/msgpack_stream.cpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of test/msgpack_stream.cpp left in tree.
CONFLICT (modify/delete): test/msgpack_tuple.cpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of test/msgpack_tuple.cpp left in tree.
CONFLICT (modify/delete): test/msgpack_vref.cpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of test/msgpack_vref.cpp left in tree.
CONFLICT (modify/delete): test/msgpack_x3_parse.cpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of test/msgpack_x3_parse.cpp left in tree.
CONFLICT (modify/delete): test/object.cpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of test/object.cpp left in tree.
CONFLICT (modify/delete): test/object_with_zone.cpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of test/object_with_zone.cpp left in tree.
CONFLICT (modify/delete): test/pack_unpack.cpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of test/pack_unpack.cpp left in tree.
CONFLICT (modify/delete): test/raw.cpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of test/raw.cpp left in tree.
CONFLICT (modify/delete): test/reference.cpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of test/reference.cpp left in tree.
CONFLICT (modify/delete): test/reference_cpp11.cpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of test/reference_cpp11.cpp left in tree.
CONFLICT (modify/delete): test/reference_wrapper_cpp11.cpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of test/reference_wrapper_cpp11.cpp left in tree.
CONFLICT (modify/delete): test/shared_ptr_cpp11.cpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of test/shared_ptr_cpp11.cpp left in tree.
CONFLICT (modify/delete): test/size_equal_only.cpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of test/size_equal_only.cpp left in tree.
CONFLICT (modify/delete): test/streaming.cpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of test/streaming.cpp left in tree.
CONFLICT (modify/delete): test/test_allocator.hpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of test/test_allocator.hpp left in tree.
CONFLICT (modify/delete): test/unique_ptr_cpp11.cpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of test/unique_ptr_cpp11.cpp left in tree.
CONFLICT (modify/delete): test/user_class.cpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of test/user_class.cpp left in tree.
CONFLICT (modify/delete): test/version.cpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of test/version.cpp left in tree.
CONFLICT (modify/delete): test/visitor.cpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of test/visitor.cpp left in tree.
CONFLICT (modify/delete): test/zone.cpp deleted in ee546036 (remove C++ part files) and modified in HEAD.  Version HEAD of test/zone.cpp left in tree.

ERROR: Execution of 'git checkout devtool' failed with exit code 1:
error: you need to resolve your current index first
.github/depends/boost.sh: needs merge
ci/build_regression.sh: needs merge
erb/v1/cpp03_zone.hpp.erb: needs merge
example/CMakeLists.txt: needs merge
example/boost/CMakeLists.txt: needs merge
example/boost/asio_send_recv_zlib.cpp: needs merge
example/cpp03/CMakeLists.txt: needs merge
example/cpp11/CMakeLists.txt: needs merge
example/cpp11/container.cpp: needs merge
example/x3/CMakeLists.txt: needs merge
fuzz/CMakeLists.txt: needs merge
fuzz/regression_runner.cpp: needs merge
fuzz/unpack_pack_fuzzer.cpp: needs merge
include/msgpack/adaptor/define_decl.hpp: needs merge
include/msgpack/adaptor/tr1/unordered_map.hpp: needs merge
include/msgpack/adaptor/tr1/unordered_set.hpp: needs merge
include/msgpack/gcc_atomic.hpp: needs merge
include/msgpack/iterator.hpp: needs merge
include/msgpack/iterator_decl.hpp: needs merge
include/msgpack/predef/os/linux.h: needs merge
include/msgpack/preprocessor/config/config.hpp: needs merge
include/msgpack/type.hpp: needs merge
include/msgpack/v1/adaptor/array_ref_decl.hpp: needs merge
include/msgpack/v1/adaptor/bool.hpp: needs merge
include/msgpack/v1/adaptor/boost/fusion.hpp: needs merge
include/msgpack/v1/adaptor/boost/msgpack_variant.hpp: needs merge
include/msgpack/v1/adaptor/boost/msgpack_variant_decl.hpp: needs merge
include/msgpack/v1/adaptor/boost/optional.hpp: needs merge
include/msgpack/v1/adaptor/boost/string_ref.hpp: needs merge
include/msgpack/v1/adaptor/boost/string_view.hpp: needs merge
include/msgpack/v1/adaptor/check_container_size_decl.hpp: needs merge
include/msgpack/v1/adaptor/cpp11/array.hpp: needs merge
include/msgpack/v1/adaptor/cpp11/array_char.hpp: needs merge
include/msgpack/v1/adaptor/cpp11/array_unsigned_char.hpp: needs merge
include/msgpack/v1/adaptor/cpp11/chrono.hpp: needs merge
include/msgpack/v1/adaptor/cpp11/forward_list.hpp: needs merge
include/msgpack/v1/adaptor/cpp11/reference_wrapper.hpp: needs merge
include/msgpack/v1/adaptor/cpp11/shared_ptr.hpp: needs merge
include/msgpack/v1/adaptor/cpp11/timespec.hpp: needs merge
include/msgpack/v1/adaptor/cpp11/tuple.hpp: needs merge
include/msgpack/v1/adaptor/cpp11/unique_ptr.hpp: needs merge
include/msgpack/v1/adaptor/cpp11/unordered_map.hpp: needs merge
include/msgpack/v1/adaptor/cpp11/unordered_set.hpp: needs merge
include/msgpack/v1/adaptor/cpp17/byte.hpp: needs merge
include/msgpack/v1/adaptor/cpp17/carray_byte.hpp: needs merge
include/msgpack/v1/adaptor/cpp17/optional.hpp: needs merge
include/msgpack/v1/adaptor/cpp17/string_view.hpp: needs merge
include/msgpack/v1/adaptor/cpp17/vector_byte.hpp: needs merge
include/msgpack/v1/adaptor/deque.hpp: needs merge
include/msgpack/v1/adaptor/detail/cpp11_convert_helper.hpp: needs merge
include/msgpack/v1/adaptor/detail/cpp11_define_array_decl.hpp: needs merge
include/msgpack/v1/adaptor/detail/cpp11_define_map_decl.hpp: needs merge
include/msgpack/v1/adaptor/ext.hpp: needs merge
include/msgpack/v1/adaptor/ext_decl.hpp: needs merge
include/msgpack/v1/adaptor/fixint_decl.hpp: needs merge
include/msgpack/v1/adaptor/int_decl.hpp: needs merge
include/msgpack/v1/adaptor/list.hpp: needs merge
include/msgpack/v1/adaptor/map.hpp: needs merge
include/msgpack/v1/adaptor/nil_decl.hpp: needs merge
include/msgpack/v1/adaptor/pair.hpp: needs merge
include/msgpack/v1/adaptor/raw.hpp: needs merge
include/msgpack/v1/adaptor/raw_decl.hpp: needs merge
include/msgpack/v1/adaptor/set.hpp: needs merge
include/msgpack/v1/adaptor/size_equal_only_decl.hpp: needs merge
include/msgpack/v1/adaptor/string.hpp: needs merge
include/msgpack/v1/adaptor/tr1/unordered_map.hpp: needs merge
include/msgpack/v1/adaptor/tr1/unordered_set.hpp: needs merge
include/msgpack/v1/adaptor/v4raw.hpp: needs merge
include/msgpack/v1/adaptor/v4raw_decl.hpp: needs merge
include/msgpack/v1/adaptor/vector.hpp: needs merge
include/msgpack/v1/adaptor/vector_char.hpp: needs merge
include/msgpack/v1/adaptor/vector_unsigned_char.hpp: needs merge
include/msgpack/v1/adaptor/wstring.hpp: needs merge
include/msgpack/v1/cpp_config.hpp: needs merge
include/msgpack/v1/cpp_config_decl.hpp: needs merge
include/msgpack/v1/detail/cpp03_zone.hpp: needs merge
include/msgpack/v1/detail/cpp11_zone.hpp: needs merge
include/msgpack/v1/fbuffer.hpp: needs merge
include/msgpack/v1/iterator_decl.hpp: needs merge
include/msgpack/v1/object.hpp: needs merge
include/msgpack/v1/object_decl.hpp: needs merge
include/msgpack/v1/object_fwd.hpp: needs merge
include/msgpack/v1/object_fwd_decl.hpp: needs merge
include/msgpack/v1/pack.hpp: needs merge
include/msgpack/v1/pack_decl.hpp: needs merge
include/msgpack/v1/sbuffer.hpp: needs merge
include/msgpack/v1/unpack.hpp: needs merge
include/msgpack/v1/unpack_decl.hpp: needs merge
include/msgpack/v1/version.hpp: needs merge
include/msgpack/v1/versioning.hpp: needs merge
include/msgpack/v1/vrefbuffer.hpp: needs merge
include/msgpack/v1/zbuffer.hpp: needs merge
include/msgpack/v2/adaptor/boost/msgpack_variant_decl.hpp: needs merge
include/msgpack/v2/adaptor/v4raw_decl.hpp: needs merge
include/msgpack/v2/cpp_config_decl.hpp: needs merge
include/msgpack/v2/create_object_visitor.hpp: needs merge
include/msgpack/v2/iterator_decl.hpp: needs merge
include/msgpack/v2/parse.hpp: needs merge
include/msgpack/v3/adaptor/adaptor_base.hpp: needs merge
include/msgpack/v3/adaptor/adaptor_base_decl.hpp: needs merge
include/msgpack/v3/adaptor/boost/msgpack_variant_decl.hpp: needs merge
include/msgpack/v3/adaptor/v4raw_decl.hpp: needs merge
include/msgpack/v3/cpp_config_decl.hpp: needs merge
include/msgpack/v3/iterator_decl.hpp: needs merge
include/msgpack/v3/parse.hpp: needs merge
include/msgpack/version.hpp: needs merge
include/msgpack/versioning.hpp: needs merge
make_file_list.sh: needs merge
test/array_ref.cpp: needs merge
test/boost_fusion.cpp: needs merge
test/boost_optional.cpp: needs merge
test/boost_string_ref.cpp: needs merge
test/boost_string_view.cpp: needs merge
test/boost_variant.cpp: needs merge
test/buffer.cpp: needs merge
test/carray.cpp: needs merge
test/cases.cpp: needs merge
test/convert.cpp: needs merge
test/fixint.cpp: needs merge
test/fuzz_unpack_pack_fuzzer_cpp11.cpp: needs merge
test/iterator_cpp11.cpp: needs merge
test/json.cpp: needs merge
test/limit.cpp: needs merge
test/msgpack_basic.cpp: needs merge
test/msgpack_container.cpp: needs merge
test/msgpack_cpp11.cpp: needs merge
test/msgpack_cpp17.cpp: needs merge
test/msgpack_stream.cpp: needs merge
test/msgpack_tuple.cpp: needs merge
test/msgpack_vref.cpp: needs merge
test/msgpack_x3_parse.cpp: needs merge
test/object.cpp: needs merge
test/object_with_zone.cpp: needs merge
test/pack_unpack.cpp: needs merge
test/raw.cpp: needs merge
test/reference.cpp: needs merge
test/reference_cpp11.cpp: needs merge
test/reference_wrapper_cpp11.cpp: needs merge
test/shared_ptr_cpp11.cpp: needs merge
test/size_equal_only.cpp: needs merge
test/streaming.cpp: needs merge
test/test_allocator.hpp: needs merge
test/unique_ptr_cpp11.cpp: needs merge
test/user_class.cpp: needs merge
test/version.cpp: needs merge
test/visitor.cpp: needs merge
test/zone.cpp: needs merge



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5504811481830305705==--

