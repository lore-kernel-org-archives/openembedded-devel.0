Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFA4BC4332F
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 15:29:52 +0000 (UTC)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
 by mx.groups.io with SMTP id smtpd.web11.136913.1671118191777802702
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Dec 2022 07:29:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Tsr7ipm3;
 spf=pass (domain: gmail.com, ip: 209.85.219.182, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yb1-f182.google.com with SMTP id 186so3890365ybe.8
        for <openembedded-devel@lists.openembedded.org>; Thu, 15 Dec 2022 07:29:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VpkfHlRZXItu9c57T7W1pHZVMjsYoREpLJMMA5n4Pmw=;
        b=Tsr7ipm39My6BQJMjhbtp9HeGO1JebHF0gzgWsWeW69aqt54zzLiHEUOgNPS501uHt
         Bsh5x0E4Bvp8fDQmS8uJczKOvNYRZwCNN8Ln4uUzRTgISamc2gI/4aewN09V0Z1vyBjZ
         d9lqFHjEYVHRlfyc5VjDMPRp6yXZ2qRvcuUV1tZwSgVbxrbXWy5p9plyhPysxLSY8GCT
         lzzusPOPn3CA5HKzjCejpBXkw6PmuEnFdrEN0FmlejmSH4dtNyvTG+/3QqfG8DOr/kov
         cQCVmFSWMo69PwcunQiyJneaUMhNZFxhT0/t/ihTR84Uz3FezVIngFPfPKEP21GadA4/
         nYvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VpkfHlRZXItu9c57T7W1pHZVMjsYoREpLJMMA5n4Pmw=;
        b=MVCUC9KCZjWBb+ppx9zHin60PQO3CZVCyRA18lt95MoY7QK/vxUyxhHit+bP1avszv
         c/YFua1wUYjNJ9cpoxUOm8eCAiUyvLR5J1PhvrUaAWSO0GeLiPMohOyuE0wyq9/0mdhC
         cFIBV94WSiq9G7KZowA3/ZxjuRxQec/HxCgaxZ/UUIqZYi08B8tdPkIjRBBQeBZPYAt2
         GaDbg+OdNjxXh6bEWrLXymz+VSn4ngMayFF1MYpBbRadoLDC4aQz4FhnI/a6UuD9X9RL
         IVz8Zmzl84XdtShYHw1oVQaP/qxjJqXMMTk2EdG+4E99dCqNhOrsVrAtjki56IAJoj1I
         erHA==
X-Gm-Message-State: ANoB5pkqDTlqeWVhjmjB19no32jhKaOJpfKk8ODyrs1+ewCib5e6L7Dn
	lUerWno0meNYhuG2SeKCDnkrjH+ko2Weww==
X-Google-Smtp-Source: AA0mqf6Em71Z2CJgH2PxZ6sDSK8zZiswihpBO/LobLzV6XLEacQw1q43xHyoYnSgHmkCSOYUsP5fqw==
X-Received: by 2002:a25:32c3:0:b0:70d:1c58:8bfd with SMTP id y186-20020a2532c3000000b0070d1c588bfdmr24294920yby.23.1671118190587;
        Thu, 15 Dec 2022 07:29:50 -0800 (PST)
Received: from build.lan (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id x10-20020ae9f80a000000b006ffa040fb5dsm7671590qkh.73.2022.12.15.07.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Dec 2022 07:29:50 -0800 (PST)
From: bruce.ashfield@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com
Subject: [PATCH][meta-filesystems] zfs: update to 2.1.7
Date: Thu, 15 Dec 2022 10:29:48 -0500
Message-Id: <20221215152948.50974-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Dec 2022 15:29:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100083

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Bumping zfs to fix builds for 6.x+ kernel versions (and libc-headers),
and we also pickup the following commits:

    21bd76613 Tag zfs-2.1.7
    7819b12f2 zfs-2.1.7: Use ubuntu-20.04 for zloop and sanity builders
    c8d2ab05e Fix setting the large_block feature after receiving a snapshot
    2c50512ad Make autodetection disable pyzfs for kernel/srpm configurations
    c4468a70c Don't leak packed recieved proprties
    e48aaef89 Fix NULL pointer dereference in dbuf_prefetch_indirect_done()
    0e3abd299 Lua: Fix bad bitshift in lua_strx2number()
    3d1e80809 Fix clang 13 compilation errors
    108c07c65 Remove final K&R definitions
    32f7499ac module: zfs: vdev_removal: remove unused num_indirect
    670d66e7a tests: cmd: draid: remove unused and undocumented -v
    ad0379bf0 linux: libspl: zone: () -> (void)
    2662b8e72 Correct multipathd.target to .service
    fa7d572a8 Handle and detect #13709's unlock regression (#14161)
    d9de079a4 Fix arc_p aggressive increase
    957c3776f FreeBSD: Fix out of bounds read in zfs_ioctl_ozfs_to_legacy()
    85537f77a Expose zfs_vdev_open_timeout_ms as a tunable
    5f53a444b Remove an unused variable
    572bd18c1 Make 1-bit bitfields unsigned
    256b74d0b Address warnings about possible division by zero from clangsa
    ac01b876c Avoid null pointer dereference in dsl_fs_ss_limit_check()
    e9a8fb17b Fix too few arguments to formatting function
    52e658edd Remove zpl_revalidate: fix snapshot rollback
    4c59fde1f Fix theoretical use of uninitialized values
    3830858c5 Fix memory leaks in dmu_send()/dmu_send_obj()
    af2e53f62 Fix possible NULL pointer dereference in sha2_mac_init()
    89c41f397 set_global_var() should not pass NULL pointers to dlclose()
    409c99a1d Fix NULL pointer dereference in spa_open_common()
    bbec0e60a Fix NULL pointer passed to strlcpy from zap_lookup_impl()
    a5f17a94d fm_fmri_hc_create() must call va_end() before returning
    5eaad8bdb Fix NULL pointer dereference in zdb
    4351d18fb ZED: Fix uninitialized value reads
    2453f9035 Fix theoretical array overflow in lua_typename()
    d016ca1a9 Fix potential NULL pointer dereference in lzc_ioctl()
    d05f247ae scripts/enum-extract.pl should not hard code perl path
    fa74250cd PAM: Fix unchecked return value from zfs_key_config_load()
    c562bbefc Fix potential NULL pointer dereference in dsl_dataset_promote_check()
    d4df36de5 Fix unreachable code in zstreamdump
    531361114 PAM: Fix uninitialized value read
    e11c4327f set_global_var_parse_kv() should pass the pointer from strdup()
    fbe150fe5 Call va_end() before return in zpool_standard_error_fmt()
    1ff8f4185 Fix potential NULL pointer dereference in zfsdle_vdev_online()
    c6d93d0a8 FreeBSD: Fix uninitialized pointer read in spa_import_rootpool()
    9f1691a96 Linux: Fix use-after-free in zfsvfs_create()
    12b859c97 Fix null pointer dereferences in PAM
    39a39b8ab Handle ECKSUM as new EZFS_CKSUM ‒ "insufficient replicas"
    1d5e569a6 Fix use-after-free bugs in icp code
    3f380df77 Remove incorrect free() in zfs_get_pci_slots_sys_path()
    b247d47be Cleanup: Make memory barrier definitions consistent across kernels
    792825724 zpool_load_compat() should create strings of length ZFS_MAXPROPLEN
    ab22031d7 icp: fix all !ENDBR objtool warnings in x86 Asm code
    33bc03dea icp: fix rodata being marked as text in x86 Asm code
    ee93cbc9d icp: properly fix all RETs in x86_64 Asm code
    1d9aa838e libzfs recv: Check if user prop before inheritable
    0f4ee295b dsl_prop_known_index(): check for invalid prop
    8c0684d32 zed: Avoid core dump if wholedisk property does not exist
    ca3a675c7 zed: Prevent special vdev to be replaced by hot spare
    cd1f02384 Deny receiving into encrypted datasets if the keys are not loaded (#14139)
    b27c7a145 zil: Relax assertion in zil_parse
    186e39f33 quota: extend quota for dataset
    1d2b0563f Fix ARC target collapse when zfs_arc_meta_limit_percent=100
    8929355b4 Propagate extent_bytes change to autotrim thread
    212ba9bd9 Linux 6.1 compat: change order of sys/mutex.h includes
    7ce097c87 Linux 6.0 compat: META
    3e767e34b Linux compat: fix DECLARE_EVENT_CLASS() test when ZFS is built-in
    df000276b zfs_domount: fix double-disown of dataset / double-free of zfsvfs_t
    7a1b6c51d Linux: Remove ZFS_AC_KERNEL_SRC_MODULE_PARAM_CALL_CONST autotools check
    4dd9c3b08 CI: bump actions/upload-artifact to v3
    1bbc09e1f CI: bump actions/checkout to v3
    37d5a3e04 Stop ganging due to past vdev write errors
    25096e118 zvol_wait logic may terminate prematurely
    820edcbf9 Remove ambiguity on demand vs prefetch stats reported by arc_summary
    37763ea2a Fix panic in dsl_process_sub_livelist for EINTR
    c8d6a91a9 Bring per_txg_dirty_frees_percent back to 30
    7ac732b8d Add options to zfs redundant_metadata property
    04f1983aa FreeBSD: vn_flush_cached_data: observe vnode locking contract
    4e3fecbdf FreeBSD: Fix a pair of bugs in zfs_fhtovp()
    fc1c0053f Fix sequential resilver drive failure race condition
    779597568 contrib: dracut: zfs-snapshot-bootfs: exit status fix
    3b935cc3e contrib: dracut: zfs-{rollback,snapshot}-bootfs: explicit snapname fix
    b0bc88239 kcfpool_alloc() should have its argument list marked void
    8cf59e97c etc: mask zfs-load-key.service
    4d22befde initramfs: use `mount.zfs` instead of `mount`
    6a6bd4939 Tag zfs-2.1.6
    566e908fa Fix bad free in skein code
    a2705b1dd zpool: Don't print "repairing" on force faulted drives
    63d4838b4 FreeBSD: handle V_PCATCH
    eec942cc5 FreeBSD: catch up to 1400068
    2c8e3e4b2 FreeBSD: stop passing LK_INTERLOCK to VOP_LOCK
    55816c64d FreeBSD: Fix integer conversion for vnlru_free{,_vfsops}()
    8dcd6af62 FreeBSD: Ignore symlink to i386 includes
    c973929b2 LUA: Fix CVE-2014-5461
    835e03682 Linux: Fix uninitialized variable usage in zio_do_crypt_data()
    33223cbc3 Refactor Log Size Limit
    91e02156d Revert "Reduce dbuf_find() lock contention"
    b66f8d3c2 Add zfs_btree_verify_intensity kernel module parameter
    5096ed31c Fix incorrect size given to bqueue_enqueue() call in dmu_redact.c
    035e52f59 Delay ZFS_PROP_SHARESMB property to handle it for encrypted raw receive
    d5105f068 zfs recv hangs if max recordsize is less than received recordsize
    faa1e4082 include: move SPA_MINBLOCKSHIFT and zio_encrypt to sys/fs/zfs.h
    44cec45f7 Improve too large physical ashift handling
    ebbbe01e3 Ask libtool to stop hiding some errors
    d05f3039f Add Module Parameter Regarding Log Size Limit
    999830a02 Optimize txg_kick() process (#12274)
    a5b0d4254 zfs recv hangs if max recordsize is less than received recordsize
    cde04badd make DMU_OT_IS_METADATA and DMU_OT_IS_ENCRYPTED return B_TRUE or B_FALSE
    3f7c174b5 vdev_draid_lookup_map() should not iterate outside draid_maps
    03fa3ef26 Add physical device size to SIZE column in 'zpool list -v'
    8bd3dca9b Introduce a tunable to exclude special class buffers from L2ARC
    c8f795ba5 config: check for parallel(1), use it for cstyle
    7bbfac9d0 zed: Fix config_sync autoexpand flood
    2010c183b Add xattr_handler support for Android kernels
    aa9e887d2 Fix column width in 'zpool iostat -v' and 'zpool list -v'
    78206a2e4 FreeBSD: Mark ZFS_MODULE_PARAM_CALL as MPSAFE
    b6ebf270e Apply arc_shrink_shift to ARC above arc_c_min
    15b64fbc9 Importing from cachefile can trip assertion
    b1be0a5c1 ZTS: Fix zpool_expand_001_pos
    65f8f92d1 zed: Look for NVMe DEVPATH if no ID_BUS
    acd746463 zed: Ignore false 'atari' partitions in autoreplace
    f48d9b426 rpm: Silence "unversioned Obsoletes" warnings on EL 9
    e1b49e3f1 rpm: Use the correct version-release information in dependencies
    8131a9654 Fix use-after-free in btree code
    979fd5a43 contrib: dracut: zfs-snapshot-bootfs: exit status fix
    533779f5f arcstat: fix -p option
    db5fd16f0 Fix problem with zdb_objset_id test.
    e0dbab1a1 Linux 6.0 compat: register_shrinker() now var-arg
    4063d7b6b Linux 5.20 compat: blk_cleanup_disk()
    58571ba44 Linux 5.20 compat: bdevname()
    57e1052d3 Linux 5.19 compat: META
    fcbddc7f7 Fix problem with zdb -d
    b06aff105 Fix checkstyle warning: E275 missing whitespace after keyword
    035ee628c Revert behavior of 59eab109 on not-Linux
    5c56591b5 Handle partial reads in zfs_read
    17512aba0 module: lua: ldo: fix pragma name
    98315be03 ZTS: Fix io_uring support check
    69ad0bd76 Fix objtool: missing int3 after ret warning
    b9d862f2d ICP: Add missing stack frame info to SHA asm files
    d2ff2196a Fix -Wformat-overflow warning in zfs_project_handle_dir()
    d483ef374 Fix -Wformat-truncation warning in upgrade_set_callback()
    60f2cfd24 Fix -Wuse-after-free warning in dbuf_destroy()
    6a8117302 Fix -Wuse-after-free warning in dbuf_issue_final_prefetch_done()
    087f5dedd Fix -Wattribute-warning in dsl layer
    c771583f2 Fix -Wattribute-warning in edonr
    ef0e506f4 Fix -Wattribute-warning in zfs_log_xvattr()
    d7a8c573c Silence -Winfinite-recursion warning in luaD_throw()
    2d235d58f config: prune unused -Wno-bool-compare checks
    37430e821 libtpool: -Wno-clobbered
    4b0977027 Remove sha1 hashing from OpenZFS, it's not used anywhere.
    15868d3ec Fix scrub resume from newly created hole.
    bbb50e612 Avoid memory copy when verifying raidz/draid parity
    03e33b2bb Avoid memory copies during mirror scrub
    4b8f16072 Fix and disable blocks statistics during scrub
    5e06805d8 Avoid two 64-bit divisions per scanned block
    dc91a6a66 Several B-tree optimizations
    a861aa2b9 Several sorted scrub optimizations
    881249de6 FreeBSD: Improve crypto_dispatch() handling
    916d9de15 Reduce ZIO io_lock contention on sorted scrub
    813e15f28 AVL: Remove obsolete branching optimizations
    884364ea8 More speculative prefetcher improvements
    6e1e90d64 Improve mg_aliquot math
    dd9c110ab Improve log spacemap load time
    fdb80a230 Add more control/visibility to spa_load_verify().
    72a4709a5 spa.c: Replace VERIFY(nvlist_*(...) == 0) with fnvlist_* (#12678)
    415882d22 Avoid small buffer copying on write
    5b860ae1f Remove refcount from spa_config_*()
    3920d7f32 Scrub mirror children without BPs

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../recipes-filesystems/zfs/{zfs_2.1.5.bb => zfs_2.1.7.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-filesystems/recipes-filesystems/zfs/{zfs_2.1.5.bb => zfs_2.1.7.bb} (95%)

diff --git a/meta-filesystems/recipes-filesystems/zfs/zfs_2.1.5.bb b/meta-filesystems/recipes-filesystems/zfs/zfs_2.1.7.bb
similarity index 95%
rename from meta-filesystems/recipes-filesystems/zfs/zfs_2.1.5.bb
rename to meta-filesystems/recipes-filesystems/zfs/zfs_2.1.7.bb
index 6aa674c79..d328cbc27 100644
--- a/meta-filesystems/recipes-filesystems/zfs/zfs_2.1.5.bb
+++ b/meta-filesystems/recipes-filesystems/zfs/zfs_2.1.7.bb
@@ -7,7 +7,7 @@ HOMEPAGE ="https://github.com/openzfs/zfs"
 SRC_URI = "https://github.com/openzfs/zfs/releases/download/${BPN}-${PV}/${BPN}-${PV}.tar.gz \
            file://0001-Define-strndupa-if-it-does-not-exist.patch \
 "
-SRC_URI[sha256sum] = "1913041e5c44ff07ca384346ad8145aeedf77e77cd1cea9ec5d533246691e10c"
+SRC_URI[sha256sum] = "6462e63e185de6ff10c64ffa6ed773201a082f9dd13e603d7e8136fcb4aca71b"
 
 # Using both 'module' and 'autotools' classes seems a bit odd, they both
 # define a do_compile function.
-- 
2.19.1


