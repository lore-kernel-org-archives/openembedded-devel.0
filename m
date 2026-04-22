Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AA53F94CCB
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 06:04:50 +0000 (UTC)
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.71387.1776837882009202621
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Apr 2026 23:04:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=oLk6ZGcA;
 spf=pass (domain: gmail.com, ip: 74.125.224.41, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-651c7ddf514so4627543d50.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 Apr 2026 23:04:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776837881; cv=none;
        d=google.com; s=arc-20240605;
        b=e5eY8LshOn2go2CH4WvCgCVzIAC2JD+qsHf3Z8tgNuDTRKCF+0688qo3Srwwiu7bKI
         v3e6FciQahmZbmLoIzTGy3y1hN0E1pDFxRUSWtfKaMQgzcXpeNa14JC4PGJshJ0qz7Aj
         f+TwrMqNbAC+u8Ff4NQNVv7TjXVOcuuIxfGB5yBpNkbrDNnaY+4pXG87l+fURbqDhyiz
         E0r6dCZunCBUkU7tiNI6VQOdW+QL3APooNgnJWHBEkbecNOAIZUvrXX6zrbN2SIzZb7K
         lX0oax7uf1UQhfWqAQpck0w1qAzinosi4/rPI81reQ5CW3B8MXCoE3/NBuUu474ldvRg
         RDkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=thU0zS9Il4nM/CoEb3B9u77rQ3TubiI4/vM1HSOQtws=;
        fh=Oagopn5x9W+HjQX+65/xb/NToO+QraW1us5rPUsYpYc=;
        b=ZEpYYqm4X0Tfb9I6Uz7Oh3ykv80uNLJSuISiTu9VpLhNMeGDnbIx4NXOY1zpxb7Cby
         K0wL/1OaPZ6gZLqX3S08kddWYlChwrW5wbb03qaYsxKQprIWTk5JAmp5ULTN2Xm37p4i
         /FQZU0BWBGp9lKyqUX9961ghEnGzVqECNhEpbH28s84JvgTaoDkFugXpK4FGzf7UQ1tj
         nDQhyqDZnR097/KqDxPHfmTcCAajaKigcwC60m17/B1H2r2Kh4xmNA2KCPYNP+a//LHm
         /fjSbWVFwlkP1KNN8MNXhAvpw4zE6noLyO7wRathQbi9i9bIFqLd7Ihn9PF/lkhtg8mx
         kyHQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776837881; x=1777442681; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=thU0zS9Il4nM/CoEb3B9u77rQ3TubiI4/vM1HSOQtws=;
        b=oLk6ZGcAzQH5hbtxBqPnzSVZUsBHK2nGKrKjfsxnhGAeuh93SVMaDku8fsNhbFH786
         tyXMSDYUaD02TIuVhy9067Oxwla0onodtCSEItu0ZrsCmIWcdAh8/IptQbSeeR7OHmyX
         ua/hZEJbDTEcABkttg9kWtm/5deF2tCqpUTp8Uq9CAo9rxMC/nWVs5NX96Jz0uEEbkEG
         Kymyo20DFs5HN19dOHfkmuuwXqWMjcHLPUCmTMIkov7zAgpRYnABHjEgGZ+FZ+0KLZ1H
         4LMog/4xIMXRyMSuXdeWuA5ew9hbIAI01JJKX2s2MCtBG37dXGPMl5Nh5lceXTxkb2fO
         TIDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776837881; x=1777442681;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=thU0zS9Il4nM/CoEb3B9u77rQ3TubiI4/vM1HSOQtws=;
        b=mFqaNx1kwb5srQzXf0B/QCpyCGJPx6U+o+I0jtYdjAj1gwUBM6Yzv1FMQL5TDDUWVM
         8dDUeMUwnUB+kwxqGQietZldItZWkv/rVbqyubqDHvE+7oq/8K439y0EbyppruN+sQ44
         UBzqcj1A9mguhBcbi7QL+/eFeOS6BBYIe9T0FiC7p0MTuk1rLmM7/FHIGTB9rmgqunjd
         /JC6cpiay8kcgaLUNCwj95iGVsPCtWKxrUv1uFPkU2Dxu/T6GacVIYHFYvf9VJxI8ehi
         O/OHYJbek51ZsLeFUXr1JV38OTTQpTX5r2nBtzMMdhyC7J6+diOdX8FTNdWHclUsiGh8
         VaAQ==
X-Gm-Message-State: AOJu0YzfKBKxe1BEHCzXaP5yJvtG8v+7+s+MftaIBXPt5Oui07uTJZqj
	IdRSTtv1jon5d2lz5OBrt+AOwInyH7EuWv5JjMkkrKRBBLTJmv8l2q7zbLniCc/C+HJ0lNI11WV
	fSzArNhQa/4di3hKRsZs1CXWhmAChfjbGoRSBIUk=
X-Gm-Gg: AeBDieuZ8vXXeThQOtARGGW4ex0JTPY7xioD6690xqNjfOrhOEhL8VG3P8AU97b/Mdl
	fX7fJQLpA79OlkaPYu3Wxqh++AdysEgy60WZ4w5pLPXRhiaz94FHNFHObaDaYApYcFUy18HBbjm
	dBlRT4ZlsI1kfKlMRg/UZGL6B5jOMGDFgYaAdCNtwihmjDQvHHdoPW8zDIHx6fJQINrISxa77zM
	AhYfjjia4my4Z04yv/R9Mx/vPhSgcXu6xIzf7MyjSZ8tSXFP/Kw2sPcbbFaMakukONEW01Rqtn+
	I/ZubJisb7K9ZlRMiuJbJyw8IhHAPwIjuLP0Kb4BL7C51N1HfgvX+Wf7U/cmavtv3d49s5Fnluz
	cb7XlktvA6nStdrtb1gcCuITjJuIfwcowIVA+lImqscumVrCvIe3Mg5XauM9C5QrPcdMO03uf5z
	uvQJk83AdqALgk7TA=
X-Received: by 2002:a05:690e:4814:b0:651:e13d:21ef with SMTP id
 956f58d0204a3-6531080a7d4mr13750477d50.15.1776837880847; Tue, 21 Apr 2026
 23:04:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260421152714.4134029-1-zeming.liu@windriver.com>
In-Reply-To: <20260421152714.4134029-1-zeming.liu@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 21 Apr 2026 23:04:13 -0700
X-Gm-Features: AQROBzBOYJlfUOWGekIJRAFCHy8n6izhEybWjhtlZW01sfgd85meSWhiBUY1o0I
Message-ID: <CAMKF1so2-pF---GFz29YQabmrUsXv5W+oJSJjT4R+uy4RbTnkw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][master][PATCH v2] tbb: add ptest support
To: zeming.liu@eng.windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000b61f8f0650064e79"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Apr 2026 06:04:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126541

--000000000000b61f8f0650064e79
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

It fails to build with clang now. You need a patch something like below,
please test it and include it in v2

diff --git a/meta-oe/recipes-support/tbb/tbb_2022.3.0.bb
b/meta-oe/recipes-support/tbb/tbb_2022.3.0.bb
index 187c2061e5..33741a7ac1 100644
--- a/meta-oe/recipes-support/tbb/tbb_2022.3.0.bb
+++ b/meta-oe/recipes-support/tbb/tbb_2022.3.0.bb
@@ -66,13 +66,21 @@ do_install:append:class-target() {
 do_install_ptest() {
     install -d ${D}${PTEST_PATH}
     install ${B}/test/CTestTestfile.cmake ${D}${PTEST_PATH}/
-    cp -rf ${B}/gnu* ${D}${PTEST_PATH}
-    rm -rf ${D}${PTEST_PATH}/gnu*/libtbb*
-    rm -rf ${D}${PTEST_PATH}/gnu*/*.sh
     sed -i -e s#${S}#${PTEST_PATH}#g \
            -e s#${B}#${PTEST_PATH}#g \
             ${D}${PTEST_PATH}/CTestTestfile.cmake
 }

+do_install_ptest:append:toolchain-gcc() {
+    cp -rf ${B}/gnu* ${D}${PTEST_PATH}
+    rm -rf ${D}${PTEST_PATH}/gnu*/libtbb*
+    rm -rf ${D}${PTEST_PATH}/gnu*/*.sh
+}
+
+do_install_ptest:append:toolchain-clang() {
+    cp -rf ${B}/clang* ${D}${PTEST_PATH}
+    rm -rf ${D}${PTEST_PATH}/clang*/libtbb*
+    rm -rf ${D}${PTEST_PATH}/clang*/*.sh
+}

 BBCLASSEXTEND =3D "native nativesdk"

On Tue, Apr 21, 2026 at 8:27=E2=80=AFAM Zeming LIU via lists.openembedded.o=
rg
<zeming.liu=3Deng.windriver.com@lists.openembedded.org> wrote:

> Test result:
> root@qemux86-64:~# ptest-runner tbb
> START: ptest-runner
> 2026-04-21T15:12
> BEGIN: /usr/lib/tbb/ptest
> PASS: test_tick_count
> PASS: test_allocators
> PASS: test_arena_priorities
> PASS: test_dynamic_link
> PASS: test_collaborative_call_once
> PASS: test_concurrent_lru_cache
> PASS: test_concurrent_unordered_map
> PASS: test_concurrent_unordered_set
> PASS: test_concurrent_map
> PASS: test_concurrent_set
> PASS: test_concurrent_priority_queue
> PASS: test_partitioner
> PASS: test_parallel_for
> PASS: test_parallel_for_each
> PASS: test_parallel_reduce
> PASS: test_parallel_sort
> PASS: test_parallel_invoke
> PASS: test_parallel_scan
> PASS: test_parallel_pipeline
> PASS: test_eh_algorithms
> PASS: test_blocked_range
> PASS: test_concurrent_vector
> PASS: test_task_group
> PASS: test_concurrent_hash_map
> PASS: test_task_arena
> PASS: test_parallel_phase
> PASS: test_enumerable_thread_specific
> PASS: test_concurrent_queue
> PASS: test_resumable_tasks
> PASS: test_mutex
> PASS: test_function_node
> PASS: test_multifunction_node
> PASS: test_broadcast_node
> PASS: test_buffer_node
> PASS: test_composite_node
> PASS: test_continue_node
> PASS: test_eh_flow_graph
> PASS: test_flow_graph
> PASS: test_flow_graph_priorities
> PASS: test_flow_graph_whitebox
> PASS: test_indexer_node
> PASS: test_join_node
> PASS: test_join_node_key_matching
> PASS: test_join_node_key_matching_n_args
> PASS: test_join_node_msg_key_matching
> PASS: test_join_node_msg_key_matching_n_args
> PASS: test_join_node_preview
> PASS: test_limiter_node
> PASS: test_priority_queue_node
> PASS: test_queue_node
> PASS: test_sequencer_node
> PASS: test_split_node
> PASS: test_tagged_msg
> PASS: test_overwrite_node
> PASS: test_write_once_node
> PASS: test_async_node
> PASS: test_input_node
> PASS: test_profiling
> PASS: test_concurrent_queue_whitebox
> PASS: test_intrusive_list
> PASS: test_semaphore
> PASS: test_environment_whitebox
> PASS: test_hw_concurrency
> PASS: test_eh_thread
> PASS: test_tbb_version
> PASS: test_global_control
> PASS: test_task
> PASS: test_concurrent_monitor
> PASS: test_scheduler_mix
> PASS: test_handle_perror
> PASS: test_arena_constraints
> PASS: test_tbbbind
> PASS: test_tbb_fork
> PASS: test_tbb_header
> PASS: test_openmp
> PASS: conformance_tick_count
> PASS: conformance_allocators
> PASS: conformance_mutex
> PASS: conformance_task_group
> PASS: conformance_task_group_context
> PASS: conformance_task_arena
> PASS: conformance_collaborative_call_once
> PASS: conformance_concurrent_lru_cache
> PASS: conformance_concurrent_unordered_map
> PASS: conformance_concurrent_unordered_set
> PASS: conformance_concurrent_map
> PASS: conformance_concurrent_set
> PASS: conformance_concurrent_priority_queue
> PASS: conformance_parallel_for
> PASS: conformance_parallel_for_each
> PASS: conformance_parallel_reduce
> PASS: conformance_parallel_scan
> PASS: conformance_parallel_sort
> PASS: conformance_parallel_pipeline
> PASS: conformance_parallel_invoke
> PASS: conformance_blocked_range
> PASS: conformance_blocked_range2d
> PASS: conformance_blocked_range3d
> PASS: conformance_blocked_nd_range
> PASS: conformance_concurrent_vector
> PASS: conformance_global_control
> PASS: conformance_concurrent_hash_map
> PASS: conformance_enumerable_thread_specific
> PASS: conformance_combinable
> PASS: conformance_concurrent_queue
> PASS: conformance_resumable_tasks
> PASS: conformance_version
> PASS: conformance_function_node
> PASS: conformance_multifunction_node
> PASS: conformance_input_node
> PASS: conformance_continue_node
> PASS: conformance_async_node
> PASS: conformance_overwrite_node
> PASS: conformance_write_once_node
> PASS: conformance_buffer_node
> PASS: conformance_queue_node
> PASS: conformance_priority_queue_node
> PASS: conformance_sequencer_node
> PASS: conformance_limiter_node
> PASS: conformance_broadcast_node
> PASS: conformance_composite_node
> PASS: conformance_indexer_node
> PASS: conformance_split_node
> PASS: conformance_join_node
> PASS: conformance_graph
> PASS: conformance_arena_constraints
> PASS: test_scalable_allocator
> PASS: test_malloc_pools
> PASS: test_malloc_init_shutdown
> PASS: test_malloc_regression
> PASS: test_malloc_shutdown_hang
> PASS: test_malloc_compliance
> PASS: test_malloc_used_by_lib
> PASS: test_malloc_lib_unload
> PASS: test_malloc_pure_c
> PASS: test_malloc_whitebox
> PASS: test_malloc_atexit
> PASS: test_malloc_overload
> PASS: test_malloc_overload_disable
> PASS: test_malloc_new_handler
> DURATION: 134
> END: /usr/lib/tbb/ptest
> 2026-04-21T15:14
> STOP: ptest-runner
> TOTAL: 1 FAIL: 0
>
> Note:
> The test will fail/timeout if executed on qemu target without kvm enabled=
.
>
> Signed-off-by: Zeming LIU <zeming.liu@windriver.com>
> ---
>  .../include/ptest-packagelists-meta-oe.inc     |  1 +
>  .../recipes-core/images/meta-oe-image-ptest.bb |  1 +
>  meta-oe/recipes-support/tbb/files/run-ptest    |  3 +++
>  meta-oe/recipes-support/tbb/tbb_2022.3.0.bb    | 18 ++++++++++++++++--
>  4 files changed, 21 insertions(+), 2 deletions(-)
>  create mode 100755 meta-oe/recipes-support/tbb/files/run-ptest
>
> diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
> b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
> index b764d5dd58..528ce16191 100644
> --- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
> +++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
> @@ -80,6 +80,7 @@ PTESTS_SLOW_META_OE =3D "\
>      postgresql \
>      re2 \
>      rocksdb \
> +    tbb \
>  "
>  PTESTS_SLOW_META_OE:append:x86 =3D " kernel-selftest"
>  PTESTS_SLOW_META_OE:append:x86-64 =3D " kernel-selftest"
> diff --git a/meta-oe/recipes-core/images/meta-oe-image-ptest.bb
> b/meta-oe/recipes-core/images/meta-oe-image-ptest.bb
> index 6361562de4..c9aa334d39 100644
> --- a/meta-oe/recipes-core/images/meta-oe-image-ptest.bb
> +++ b/meta-oe/recipes-core/images/meta-oe-image-ptest.bb
> @@ -28,6 +28,7 @@ IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-poco =3D
> "1024288"
>  QB_MEM =3D "-m 1024"
>  # If a particular ptest needs more memory, it can be customized:
>  #QB_MEM:virtclass-mcextend-<pn> =3D "-m 4096"
> +QB_MEM:virtclass-mcextend-tbb =3D "-m 2048"
>
>  TEST_SUITES =3D "ping ssh parselogs ptest"
>
> diff --git a/meta-oe/recipes-support/tbb/files/run-ptest
> b/meta-oe/recipes-support/tbb/files/run-ptest
> new file mode 100755
> index 0000000000..da46c68550
> --- /dev/null
> +++ b/meta-oe/recipes-support/tbb/files/run-ptest
> @@ -0,0 +1,3 @@
> +#!/bin/sh
> +
> +ctest | sed -u 's/\*\*\*/   /g' | awk '/Test +#/{gsub(/Passed/,"PASS");
> gsub(/Failed/,"FAIL"); gsub(/Skipped/,"SKIP"); print $6": "$4; fflush();}=
'
> diff --git a/meta-oe/recipes-support/tbb/tbb_2022.3.0.bb
> b/meta-oe/recipes-support/tbb/tbb_2022.3.0.bb
> index 440b6e0f46..187c2061e5 100644
> --- a/meta-oe/recipes-support/tbb/tbb_2022.3.0.bb
> +++ b/meta-oe/recipes-support/tbb/tbb_2022.3.0.bb
> @@ -15,20 +15,23 @@ PE =3D "1"
>  BRANCH =3D "onetbb_2022"
>  SRCREV =3D "f1862f38f83568d96e814e469ab61f88336cc595"
>  SRC_URI =3D "git://
> github.com/oneapi-src/oneTBB.git;protocol=3Dhttps;branch=3D${BRANCH}
> <http://github.com/oneapi-src/oneTBB.git;protocol=3Dhttps;branch=3D$%7BBR=
ANCH%7D>
> \
> +           file://run-ptest \
>            "
>
>  LDFLAGS +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld', '
> -Wl,--undefined-version', '', d)}"
>
> -inherit cmake pkgconfig
> +inherit cmake pkgconfig ptest
>
>  # test build fails, error: 'mallinfo mallinfo()' is deprecated
>  EXTRA_OECMAKE +=3D " \
> -                    -DTBB_TEST=3DOFF \
> +                    -DTBB_TEST=3D${@bb.utils.contains('PTEST_ENABLED', '=
1',
> 'ON', 'OFF', d)} \
>                      -DCMAKE_BUILD_TYPE=3DRelease \
>                      -DTBB_STRICT=3DOFF \
>                      -DTBB_DISABLE_HWLOC_AUTOMATIC_SEARCH=3DOFF \
>                  "
>
> +RDEPENDS:${PN}-ptest +=3D "cmake"
> +
>  # Hard-float 'd' ABI can't be used for a target that doesn't support the
> D instruction set extension (ignoring target-abi)
>  #
> tmp-glibc/work/riscv64-oe-linux/tbb/1_2021.7.0-r0/recipe-sysroot-native/u=
sr/bin/riscv64-oe-linux/riscv64-oe-linux-ld:
> /tmp/lto-llvm-264bc2.o: can't link soft-float modules with double-float
> modules
>  #
> tmp-glibc/work/riscv64-oe-linux/tbb/1_2021.7.0-r0/recipe-sysroot-native/u=
sr/bin/riscv64-oe-linux/riscv64-oe-linux-ld:
> failed to merge target specific data of file /tmp/lto-llvm-264bc2.o
> @@ -60,5 +63,16 @@ do_install:append:class-target() {
>      sed -i "s#${RECIPE_SYSROOT}##g"
> ${D}${libdir}/cmake/TBB/TBBTargets.cmake
>  }
>
> +do_install_ptest() {
> +    install -d ${D}${PTEST_PATH}
> +    install ${B}/test/CTestTestfile.cmake ${D}${PTEST_PATH}/
> +    cp -rf ${B}/gnu* ${D}${PTEST_PATH}
> +    rm -rf ${D}${PTEST_PATH}/gnu*/libtbb*
> +    rm -rf ${D}${PTEST_PATH}/gnu*/*.sh
> +    sed -i -e s#${S}#${PTEST_PATH}#g \
> +           -e s#${B}#${PTEST_PATH}#g \
> +            ${D}${PTEST_PATH}/CTestTestfile.cmake
> +}
> +
>
>  BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#126534):
> https://lists.openembedded.org/g/openembedded-devel/message/126534
> Mute This Topic: https://lists.openembedded.org/mt/118939349/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000b61f8f0650064e79
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">It fails to build with clang now. You need a patch somethi=
ng like below, please test it and include it in v2<div><br></div><div>diff =
--git a/meta-oe/recipes-support/tbb/<a href=3D"http://tbb_2022.3.0.bb">tbb_=
2022.3.0.bb</a> b/meta-oe/recipes-support/tbb/<a href=3D"http://tbb_2022.3.=
0.bb">tbb_2022.3.0.bb</a><br>index 187c2061e5..33741a7ac1 100644<br>--- a/m=
eta-oe/recipes-support/tbb/<a href=3D"http://tbb_2022.3.0.bb">tbb_2022.3.0.=
bb</a><br>+++ b/meta-oe/recipes-support/tbb/<a href=3D"http://tbb_2022.3.0.=
bb">tbb_2022.3.0.bb</a><br>@@ -66,13 +66,21 @@ do_install:append:class-targ=
et() {<br>=C2=A0do_install_ptest() {<br>=C2=A0 =C2=A0 =C2=A0install -d ${D}=
${PTEST_PATH}<br>=C2=A0 =C2=A0 =C2=A0install ${B}/test/CTestTestfile.cmake =
${D}${PTEST_PATH}/<br>- =C2=A0 =C2=A0cp -rf ${B}/gnu* ${D}${PTEST_PATH}<br>=
- =C2=A0 =C2=A0rm -rf ${D}${PTEST_PATH}/gnu*/libtbb*<br>- =C2=A0 =C2=A0rm -=
rf ${D}${PTEST_PATH}/gnu*/*.sh<br>=C2=A0 =C2=A0 =C2=A0sed -i -e s#${S}#${PT=
EST_PATH}#g \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -e s#${B}#${PTES=
T_PATH}#g \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${D}${PTEST_=
PATH}/CTestTestfile.cmake<br>=C2=A0}<br><br>+do_install_ptest:append:toolch=
ain-gcc() {<br>+ =C2=A0 =C2=A0cp -rf ${B}/gnu* ${D}${PTEST_PATH}<br>+ =C2=
=A0 =C2=A0rm -rf ${D}${PTEST_PATH}/gnu*/libtbb*<br>+ =C2=A0 =C2=A0rm -rf ${=
D}${PTEST_PATH}/gnu*/*.sh<br>+}<br>+<br>+do_install_ptest:append:toolchain-=
clang() {<br>+ =C2=A0 =C2=A0cp -rf ${B}/clang* ${D}${PTEST_PATH}<br>+ =C2=
=A0 =C2=A0rm -rf ${D}${PTEST_PATH}/clang*/libtbb*<br>+ =C2=A0 =C2=A0rm -rf =
${D}${PTEST_PATH}/clang*/*.sh<br>+}<br><br>=C2=A0BBCLASSEXTEND =3D &quot;na=
tive nativesdk&quot;</div></div><br><div class=3D"gmail_quote gmail_quote_c=
ontainer"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Apr 21, 2026 at 8:2=
7=E2=80=AFAM Zeming LIU via <a href=3D"http://lists.openembedded.org">lists=
.openembedded.org</a> &lt;zeming.liu=3D<a href=3D"mailto:eng.windriver.com@=
lists.openembedded.org">eng.windriver.com@lists.openembedded.org</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Test result=
:<br>
root@qemux86-64:~# ptest-runner tbb<br>
START: ptest-runner<br>
2026-04-21T15:12<br>
BEGIN: /usr/lib/tbb/ptest<br>
PASS: test_tick_count<br>
PASS: test_allocators<br>
PASS: test_arena_priorities<br>
PASS: test_dynamic_link<br>
PASS: test_collaborative_call_once<br>
PASS: test_concurrent_lru_cache<br>
PASS: test_concurrent_unordered_map<br>
PASS: test_concurrent_unordered_set<br>
PASS: test_concurrent_map<br>
PASS: test_concurrent_set<br>
PASS: test_concurrent_priority_queue<br>
PASS: test_partitioner<br>
PASS: test_parallel_for<br>
PASS: test_parallel_for_each<br>
PASS: test_parallel_reduce<br>
PASS: test_parallel_sort<br>
PASS: test_parallel_invoke<br>
PASS: test_parallel_scan<br>
PASS: test_parallel_pipeline<br>
PASS: test_eh_algorithms<br>
PASS: test_blocked_range<br>
PASS: test_concurrent_vector<br>
PASS: test_task_group<br>
PASS: test_concurrent_hash_map<br>
PASS: test_task_arena<br>
PASS: test_parallel_phase<br>
PASS: test_enumerable_thread_specific<br>
PASS: test_concurrent_queue<br>
PASS: test_resumable_tasks<br>
PASS: test_mutex<br>
PASS: test_function_node<br>
PASS: test_multifunction_node<br>
PASS: test_broadcast_node<br>
PASS: test_buffer_node<br>
PASS: test_composite_node<br>
PASS: test_continue_node<br>
PASS: test_eh_flow_graph<br>
PASS: test_flow_graph<br>
PASS: test_flow_graph_priorities<br>
PASS: test_flow_graph_whitebox<br>
PASS: test_indexer_node<br>
PASS: test_join_node<br>
PASS: test_join_node_key_matching<br>
PASS: test_join_node_key_matching_n_args<br>
PASS: test_join_node_msg_key_matching<br>
PASS: test_join_node_msg_key_matching_n_args<br>
PASS: test_join_node_preview<br>
PASS: test_limiter_node<br>
PASS: test_priority_queue_node<br>
PASS: test_queue_node<br>
PASS: test_sequencer_node<br>
PASS: test_split_node<br>
PASS: test_tagged_msg<br>
PASS: test_overwrite_node<br>
PASS: test_write_once_node<br>
PASS: test_async_node<br>
PASS: test_input_node<br>
PASS: test_profiling<br>
PASS: test_concurrent_queue_whitebox<br>
PASS: test_intrusive_list<br>
PASS: test_semaphore<br>
PASS: test_environment_whitebox<br>
PASS: test_hw_concurrency<br>
PASS: test_eh_thread<br>
PASS: test_tbb_version<br>
PASS: test_global_control<br>
PASS: test_task<br>
PASS: test_concurrent_monitor<br>
PASS: test_scheduler_mix<br>
PASS: test_handle_perror<br>
PASS: test_arena_constraints<br>
PASS: test_tbbbind<br>
PASS: test_tbb_fork<br>
PASS: test_tbb_header<br>
PASS: test_openmp<br>
PASS: conformance_tick_count<br>
PASS: conformance_allocators<br>
PASS: conformance_mutex<br>
PASS: conformance_task_group<br>
PASS: conformance_task_group_context<br>
PASS: conformance_task_arena<br>
PASS: conformance_collaborative_call_once<br>
PASS: conformance_concurrent_lru_cache<br>
PASS: conformance_concurrent_unordered_map<br>
PASS: conformance_concurrent_unordered_set<br>
PASS: conformance_concurrent_map<br>
PASS: conformance_concurrent_set<br>
PASS: conformance_concurrent_priority_queue<br>
PASS: conformance_parallel_for<br>
PASS: conformance_parallel_for_each<br>
PASS: conformance_parallel_reduce<br>
PASS: conformance_parallel_scan<br>
PASS: conformance_parallel_sort<br>
PASS: conformance_parallel_pipeline<br>
PASS: conformance_parallel_invoke<br>
PASS: conformance_blocked_range<br>
PASS: conformance_blocked_range2d<br>
PASS: conformance_blocked_range3d<br>
PASS: conformance_blocked_nd_range<br>
PASS: conformance_concurrent_vector<br>
PASS: conformance_global_control<br>
PASS: conformance_concurrent_hash_map<br>
PASS: conformance_enumerable_thread_specific<br>
PASS: conformance_combinable<br>
PASS: conformance_concurrent_queue<br>
PASS: conformance_resumable_tasks<br>
PASS: conformance_version<br>
PASS: conformance_function_node<br>
PASS: conformance_multifunction_node<br>
PASS: conformance_input_node<br>
PASS: conformance_continue_node<br>
PASS: conformance_async_node<br>
PASS: conformance_overwrite_node<br>
PASS: conformance_write_once_node<br>
PASS: conformance_buffer_node<br>
PASS: conformance_queue_node<br>
PASS: conformance_priority_queue_node<br>
PASS: conformance_sequencer_node<br>
PASS: conformance_limiter_node<br>
PASS: conformance_broadcast_node<br>
PASS: conformance_composite_node<br>
PASS: conformance_indexer_node<br>
PASS: conformance_split_node<br>
PASS: conformance_join_node<br>
PASS: conformance_graph<br>
PASS: conformance_arena_constraints<br>
PASS: test_scalable_allocator<br>
PASS: test_malloc_pools<br>
PASS: test_malloc_init_shutdown<br>
PASS: test_malloc_regression<br>
PASS: test_malloc_shutdown_hang<br>
PASS: test_malloc_compliance<br>
PASS: test_malloc_used_by_lib<br>
PASS: test_malloc_lib_unload<br>
PASS: test_malloc_pure_c<br>
PASS: test_malloc_whitebox<br>
PASS: test_malloc_atexit<br>
PASS: test_malloc_overload<br>
PASS: test_malloc_overload_disable<br>
PASS: test_malloc_new_handler<br>
DURATION: 134<br>
END: /usr/lib/tbb/ptest<br>
2026-04-21T15:14<br>
STOP: ptest-runner<br>
TOTAL: 1 FAIL: 0<br>
<br>
Note:<br>
The test will fail/timeout if executed on qemu target without kvm enabled.<=
br>
<br>
Signed-off-by: Zeming LIU &lt;<a href=3D"mailto:zeming.liu@windriver.com" t=
arget=3D"_blank">zeming.liu@windriver.com</a>&gt;<br>
---<br>
=C2=A0.../include/ptest-packagelists-meta-oe.inc=C2=A0 =C2=A0 =C2=A0|=C2=A0=
 1 +<br>
=C2=A0.../recipes-core/images/<a href=3D"http://meta-oe-image-ptest.bb" rel=
=3D"noreferrer" target=3D"_blank">meta-oe-image-ptest.bb</a> |=C2=A0 1 +<br=
>
=C2=A0meta-oe/recipes-support/tbb/files/run-ptest=C2=A0 =C2=A0 |=C2=A0 3 ++=
+<br>
=C2=A0meta-oe/recipes-support/tbb/<a href=3D"http://tbb_2022.3.0.bb" rel=3D=
"noreferrer" target=3D"_blank">tbb_2022.3.0.bb</a>=C2=A0 =C2=A0 | 18 ++++++=
++++++++++--<br>
=C2=A04 files changed, 21 insertions(+), 2 deletions(-)<br>
=C2=A0create mode 100755 meta-oe/recipes-support/tbb/files/run-ptest<br>
<br>
diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/meta-oe/=
conf/include/ptest-packagelists-meta-oe.inc<br>
index b764d5dd58..528ce16191 100644<br>
--- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc<br>
+++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc<br>
@@ -80,6 +80,7 @@ PTESTS_SLOW_META_OE =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0postgresql \<br>
=C2=A0 =C2=A0 =C2=A0re2 \<br>
=C2=A0 =C2=A0 =C2=A0rocksdb \<br>
+=C2=A0 =C2=A0 tbb \<br>
=C2=A0&quot;<br>
=C2=A0PTESTS_SLOW_META_OE:append:x86 =3D &quot; kernel-selftest&quot;<br>
=C2=A0PTESTS_SLOW_META_OE:append:x86-64 =3D &quot; kernel-selftest&quot;<br=
>
diff --git a/meta-oe/recipes-core/images/<a href=3D"http://meta-oe-image-pt=
est.bb" rel=3D"noreferrer" target=3D"_blank">meta-oe-image-ptest.bb</a> b/m=
eta-oe/recipes-core/images/<a href=3D"http://meta-oe-image-ptest.bb" rel=3D=
"noreferrer" target=3D"_blank">meta-oe-image-ptest.bb</a><br>
index 6361562de4..c9aa334d39 100644<br>
--- a/meta-oe/recipes-core/images/<a href=3D"http://meta-oe-image-ptest.bb"=
 rel=3D"noreferrer" target=3D"_blank">meta-oe-image-ptest.bb</a><br>
+++ b/meta-oe/recipes-core/images/<a href=3D"http://meta-oe-image-ptest.bb"=
 rel=3D"noreferrer" target=3D"_blank">meta-oe-image-ptest.bb</a><br>
@@ -28,6 +28,7 @@ IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-poco =3D &quo=
t;1024288&quot;<br>
=C2=A0QB_MEM =3D &quot;-m 1024&quot;<br>
=C2=A0# If a particular ptest needs more memory, it can be customized:<br>
=C2=A0#QB_MEM:virtclass-mcextend-&lt;pn&gt; =3D &quot;-m 4096&quot;<br>
+QB_MEM:virtclass-mcextend-tbb =3D &quot;-m 2048&quot;<br>
<br>
=C2=A0TEST_SUITES =3D &quot;ping ssh parselogs ptest&quot;<br>
<br>
diff --git a/meta-oe/recipes-support/tbb/files/run-ptest b/meta-oe/recipes-=
support/tbb/files/run-ptest<br>
new file mode 100755<br>
index 0000000000..da46c68550<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-support/tbb/files/run-ptest<br>
@@ -0,0 +1,3 @@<br>
+#!/bin/sh<br>
+<br>
+ctest | sed -u &#39;s/\*\*\*/=C2=A0 =C2=A0/g&#39; | awk &#39;/Test +#/{gsu=
b(/Passed/,&quot;PASS&quot;); gsub(/Failed/,&quot;FAIL&quot;); gsub(/Skippe=
d/,&quot;SKIP&quot;); print $6&quot;: &quot;$4; fflush();}&#39;<br>
diff --git a/meta-oe/recipes-support/tbb/<a href=3D"http://tbb_2022.3.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">tbb_2022.3.0.bb</a> b/meta-oe/recipes=
-support/tbb/<a href=3D"http://tbb_2022.3.0.bb" rel=3D"noreferrer" target=
=3D"_blank">tbb_2022.3.0.bb</a><br>
index 440b6e0f46..187c2061e5 100644<br>
--- a/meta-oe/recipes-support/tbb/<a href=3D"http://tbb_2022.3.0.bb" rel=3D=
"noreferrer" target=3D"_blank">tbb_2022.3.0.bb</a><br>
+++ b/meta-oe/recipes-support/tbb/<a href=3D"http://tbb_2022.3.0.bb" rel=3D=
"noreferrer" target=3D"_blank">tbb_2022.3.0.bb</a><br>
@@ -15,20 +15,23 @@ PE =3D &quot;1&quot;<br>
=C2=A0BRANCH =3D &quot;onetbb_2022&quot;<br>
=C2=A0SRCREV =3D &quot;f1862f38f83568d96e814e469ab61f88336cc595&quot;<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/oneapi-src/oneTB=
B.git;protocol=3Dhttps;branch=3D$%7BBRANCH%7D" rel=3D"noreferrer" target=3D=
"_blank">github.com/oneapi-src/oneTBB.git;protocol=3Dhttps;branch=3D${BRANC=
H}</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://run-ptest \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
=C2=A0LDFLAGS +=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#=
39;ld-is-lld&#39;, &#39; -Wl,--undefined-version&#39;, &#39;&#39;, d)}&quot=
;<br>
<br>
-inherit cmake pkgconfig<br>
+inherit cmake pkgconfig ptest<br>
<br>
=C2=A0# test build fails, error: &#39;mallinfo mallinfo()&#39; is deprecate=
d<br>
=C2=A0EXTRA_OECMAKE +=3D &quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -DTB=
B_TEST=3DOFF \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -DTB=
B_TEST=3D${@bb.utils.contains(&#39;PTEST_ENABLED&#39;, &#39;1&#39;, &#39;ON=
&#39;, &#39;OFF&#39;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0-DCMAKE_BUILD_TYPE=3DRelease \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0-DTBB_STRICT=3DOFF \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0-DTBB_DISABLE_HWLOC_AUTOMATIC_SEARCH=3DOFF \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
+RDEPENDS:${PN}-ptest +=3D &quot;cmake&quot;<br>
+<br>
=C2=A0# Hard-float &#39;d&#39; ABI can&#39;t be used for a target that does=
n&#39;t support the D instruction set extension (ignoring target-abi)<br>
=C2=A0# tmp-glibc/work/riscv64-oe-linux/tbb/1_2021.7.0-r0/recipe-sysroot-na=
tive/usr/bin/riscv64-oe-linux/riscv64-oe-linux-ld: /tmp/lto-llvm-264bc2.o: =
can&#39;t link soft-float modules with double-float modules<br>
=C2=A0# tmp-glibc/work/riscv64-oe-linux/tbb/1_2021.7.0-r0/recipe-sysroot-na=
tive/usr/bin/riscv64-oe-linux/riscv64-oe-linux-ld: failed to merge target s=
pecific data of file /tmp/lto-llvm-264bc2.o<br>
@@ -60,5 +63,16 @@ do_install:append:class-target() {<br>
=C2=A0 =C2=A0 =C2=A0sed -i &quot;s#${RECIPE_SYSROOT}##g&quot; ${D}${libdir}=
/cmake/TBB/TBBTargets.cmake<br>
=C2=A0}<br>
<br>
+do_install_ptest() {<br>
+=C2=A0 =C2=A0 install -d ${D}${PTEST_PATH}<br>
+=C2=A0 =C2=A0 install ${B}/test/CTestTestfile.cmake ${D}${PTEST_PATH}/<br>
+=C2=A0 =C2=A0 cp -rf ${B}/gnu* ${D}${PTEST_PATH}<br>
+=C2=A0 =C2=A0 rm -rf ${D}${PTEST_PATH}/gnu*/libtbb*<br>
+=C2=A0 =C2=A0 rm -rf ${D}${PTEST_PATH}/gnu*/*.sh<br>
+=C2=A0 =C2=A0 sed -i -e s#${S}#${PTEST_PATH}#g \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e s#${B}#${PTEST_PATH}#g \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${D}${PTEST_PATH}/CTestTestfile.=
cmake<br>
+}<br>
+<br>
<br>
=C2=A0BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#126534): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/126534" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/126534</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118939349/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/118939349/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000b61f8f0650064e79--

