Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDCCDE728EE
	for <webhook@archiver.kernel.org>; Fri, 29 Sep 2023 20:06:15 +0000 (UTC)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
 by mx.groups.io with SMTP id smtpd.web10.27861.1696017973079900338
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Sep 2023 13:06:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lMYnBMj2;
 spf=pass (domain: gmail.com, ip: 209.85.210.48, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-6c4cbab83aaso7246778a34.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 29 Sep 2023 13:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696017972; x=1696622772; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xiS+rJoAifk9qC6wLCe5UOLFgy/jTMtywDdkJsr++zY=;
        b=lMYnBMj2eS1qnvVTNAAoOvIh0Y8OBafZ0cliTfDNZ2ktnN2GTx9KLXEx2ifEmPCs28
         AFwujq/5PnSGgVKC1Ki8087Cr+Fc4Rjzkp7pNLSz5SfCIb4yest6g7ykBpVlx0Wq3tv8
         luUw09bD+RK16nQjJidR+ryditpCMBu5B0GH1AnoCiJNBcdgTkS/aPy/2reFDGZCcqqG
         +5BCBjhBYqonF+ofzDHu+RQYn+LlT6cmyqSQF0eUjfQ2WIQIatOK2iItwNBLanGRVyxZ
         yyGupAz93Ox5Zxngo5zE3zjZMni0IWgJD3QKPuiCjcZbuK8McmC9ollx8nenjeAU9R3g
         eBIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696017972; x=1696622772;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xiS+rJoAifk9qC6wLCe5UOLFgy/jTMtywDdkJsr++zY=;
        b=N6snWcubqhrISGF8pULkA60c0l+Dm5i0Ev1XoltA1ACgXC959dDrwQqK6PaNSSoEVM
         Vgpofsn6Uwwe4XiItzHe9fF8KibzbzvJWFX3eFkbpAoZKxTYLU2AZW1OWRfIR/n8zzhH
         0Wps+FpfH54Z6bi44bVv3qM2RALP9HlLUwowsciRXLnXGJSxildpw32b6ohr1xSwfQHP
         aCc4thclSALIPN25h47JTH3ldKRmJTozA5U1cjNPGjVlpVx+jSvEhjXWEpLZoI2QO6x3
         zW4Av7ATxa+/FLzzf7gCBRQFJf8QXY0cs1c9yEebIB4/5yWZVBHMxYwwyqrkNWNidj32
         yiMw==
X-Gm-Message-State: AOJu0YzzHUj0MfMzZIvqUA+8hM2kQ7zrYlKXzTNRrOncBlWtNfoc0cJW
	ChzIllknQAueIRhc3/+JR145s6kJLJ6FQgwDFGDjHrRJxh8=
X-Google-Smtp-Source: AGHT+IF+qJL8102IwkRB5KkaYbnBW/ayBFBNdKC0kECqAWZ6u/000qd+jJ/esSGporufLaC9DGGmQGPkgFaZa5gsV+g=
X-Received: by 2002:a05:6830:1e03:b0:6bc:c542:6f75 with SMTP id
 s3-20020a0568301e0300b006bcc5426f75mr5295240otr.0.1696017971730; Fri, 29 Sep
 2023 13:06:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230929195035.3515540-1-bruce.ashfield@gmail.com>
In-Reply-To: <20230929195035.3515540-1-bruce.ashfield@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 29 Sep 2023 16:05:59 -0400
Message-ID: <CADkTA4O3Oih6s4u0dPvnyzP=tBr40cb5LtUu8oSJs+1QjV9sXA@mail.gmail.com>
Subject: Re: /home/bruce/rr.meta-oe/0002-vboxguestdrivers-fix-kernel-v6.5-build.patchFrom
 2981fa9167f70444f657c53d80f23496b209b5bd Mon Sep 17 00:00:00 2001
To: openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com
Content-Type: multipart/alternative; boundary="000000000000bcdacb060684f4c8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Sep 2023 20:06:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105264

--000000000000bcdacb060684f4c8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Looks like the scripts went nuts on the subject!

I'll resend a v2 with something that doesn't need to be manually fixed!

Bruce

On Fri, Sep 29, 2023 at 3:50=E2=80=AFPM <bruce.ashfield@gmail.com> wrote:

> Building against the 6.5+ kernel and headers resulted in a build failure
> due to missing detected features. We can fix the issues by bumping to
> 2.2.0-rc4
>
> Bumping zfs to version zfs-2.2.0-rc4-35-g229ca7d73, which comprises the
> following commits:
>
>     739db06ce Tag 2.2.0-rc4
>     4da8c7d11 Intel QAT 1.7 compatibility
>     32949f256 Relax error reporting in zpool import and zpool split
>     79ac1b29d ZIL: Change ZIOs issue order.
>     7dc2baaa1 ZIL: Revert zl_lock scope reduction.
>     5a7cb0b06 ZIL: Tune some assertions.
>     400f56e3f dmu_buf_will_clone: change assertion to fix 32-bit compiler
> warning
>     63159e5bd checkstyle: fix action failures
>     7eabb0af3 Try to clarify wording to reduce zpool add incidents
>     c65aaa838 Avoid save/restoring AMX registers to avoid a SPR erratum
>     e99e684b3 zed: update zed.d/statechange-slot_off.sh
>     1b696429c Make zoned/jailed zfsprops(7) make more sense.
>     084ff4abd tests/block_cloning: rename and document get_same_blocks
> helper
>     ab999406f Update outdated assertion from zio_write_compress
>     d19304ffe zed: Add zedlet to power off slot when drive is faulted
>     92f095a90 copy_file_range: fix fallback when source create on same tx=
g
>     645a7e4d9 Move zinject from openzfs-zfs-test to openzfs-zfsutils
>     95649854b dracut: support mountpoint=3Dlegacy for root dataset
>     895cb689d zfs_clone_range should return a descriptive error codes
>     6bdc7259d libzfs: sendrecv: send_progress_thread: handle
> SIGINFO/SIGUSR1
>     1e488eec6 linux/spl/kmem_cache: undefine `kmem_cache_alloc` before
> defining it
>     c418edf1d Fix some typos
>     df8c9f351 ZIL: Second attempt to reduce scope of zl_issuer_lock.
>     bb31ded68 ZIL: Replay blocks without next block pointer.
>     c1801cbe5 ZIL: Avoid dbuf_read() before dmu_sync().
>     ffaedf0a4 Remove fastwrite mechanism.
>     02ce9030e Avoid waiting in dmu_sync_late_arrival().
>     0ae7bfc0a zpool_vdev_remove() should handle EALREADY error return
>     bd1eab16e linux: zfs: ctldir: set [amc]time to snapshot's creation
> property
>     b3c1807d7 readmmap.c: fix building with MUSL libc
>     b5e245633 Check the return value in clonefile test
>     c47f0f441 linux/copy_file_range: properly request a fallback copy on
> Linux <5.3
>     12f2b1f65 zdb: include cloned blocks in block statistics
>     4a104ac04 Tag 2.2.0-rc3
>     c24a48063 BRT should return EOPNOTSUPP
>     36d1a3ef4 zts: block cloning tests
>     2768dc04c linux: implement filesystem-side copy/clone functions for E=
L7
>     3366ceaf3 linux: implement filesystem-side clone ioctls
>     5d12545da linux: implement filesystem-side copy/clone functions
>     a3ea8c8ee dbuf_sync_leaf: check DB_READ in state assertions
>     0426e1327 dmu_buf_will_clone: only check that current txg is clean
>     8aa4f0f0f brt_vdev_realloc: use vmem_alloc for large allocation
>     7698503dc zfs_clone_range: use vmem_malloc for large allocation
>     b9aa32ff3 zed: Reduce log noise for large JBODs
>     571762b29 Linux 6.4 compat: META
>     991834f5d Remove zl_issuer_lock from zil_suspend().
>     41a0f6627 ZIL: Fix config lock deadlock.
>     c79d1bae7 Update changelog for OpenZFS 2.2.0 release
>     70232483b Tag 2.2.0-rc2
>     c5273e0c3 shellcheck: disable "unreachable command" check [SC2317]
>     685ae4429 metaslab: tuneable to better control force ganging
>     81be809a2 Adjust prefetch parameters.
>     8a6fde821 Add explicit prefetches to bpobj_iterate().
>     b6f618f8f Don't emit cksum_{actual_expected} in
> ereport.fs.zfs.checksum events
>     51a2b5976 Don't emit checksum histograms in ereport.fs.zfs.checksum
> events
>     8c81c0b05 zed: Fix zed ASSERT on slot power cycle
>     b221f4394 Fix zpl_test_super race with zfs_umount
>     e037327bf spa_min_alloc should be GCD, not min
>     1a2e486d2 Don't panic if setting vdev properties is unsupported for
> this vdev type
>     d8011707c Ignore pool ashift property during vdev attachment
>     f5f5a2db9 Rollback before zfs root is mounted
>     83b0967c1 Do not request data L1 buffers on scan prefetch.
>     73ba5df31 Linux 6.5 compat: disk_check_media_change() was added
>     1bc244ae9 Linux 6.5 compat: BLK_STS_NEXUS renamed to
> BLK_STS_RESV_CONFLICT
>     931dc7055 Linux 6.5 compat: intptr_t definition is canonically signed
>     5299f4f28 set autotrim default to 'off' everywhere
>     f917cf1c0 Fix the ZFS checksum error histograms with larger record
> sizes
>     56ed389a5 Fix raw receive with different indirect block size.
>     e613e4bbe Avoid extra snprintf() in dsl_deadlist_merge().
>     b4e630b00 Add missed DMU_PROJECTUSED_OBJECT prefetch.
>     bf6cd3079 FreeBSD: catch up to __FreeBSD_version 1400093
>     1266cebf8 FreeBSD: Fix build on stable/13 after 1302506.
>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>
> Khem,
>
> With 6.4 going EOL upstream, I'm rushing in a bump to v6.5 for OEcore.
>
> This is a bump for btfs that solves issues in my tesing.
>
> Bruce
>
>  meta-filesystems/recipes-filesystems/zfs/zfs_2.2.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-filesystems/recipes-filesystems/zfs/zfs_2.2.0.bb
> b/meta-filesystems/recipes-filesystems/zfs/zfs_2.2.0.bb
> index a62a8a39b..db6f725b6 100644
> --- a/meta-filesystems/recipes-filesystems/zfs/zfs_2.2.0.bb
> +++ b/meta-filesystems/recipes-filesystems/zfs/zfs_2.2.0.bb
> @@ -4,7 +4,7 @@ LICENSE =3D "CDDL-1.0"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D7087caaf1dc8a2856585619f4a787=
faa"
>  HOMEPAGE =3D"https://github.com/openzfs/zfs"
>
> -SRCREV =3D "009d3288dea524c7ad373b04b65bee8bb6f0bfea"
> +SRCREV =3D "229ca7d738ccbf4c55076977467ee93e20b6f01b"
>  SRC_URI =3D "git://
> github.com/openzfs/zfs;protocol=3Dhttps;branch=3Dzfs-2.2-release \
>             file://0001-Define-strndupa-if-it-does-not-exist.patch \
>             file://aaf28a4630af60496c9d33db1d06a7d7d8983422.patch \
> --
> 2.34.1
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000bcdacb060684f4c8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">Loo=
ks like the scripts went nuts on the subject!</div><div class=3D"gmail_defa=
ult" style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=
=3D"font-size:small">I&#39;ll resend a v2 with something that doesn&#39;t n=
eed to be manually fixed!</div><div class=3D"gmail_default" style=3D"font-s=
ize:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small"=
>Bruce</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"=
gmail_attr">On Fri, Sep 29, 2023 at 3:50=E2=80=AFPM &lt;<a href=3D"mailto:b=
ruce.ashfield@gmail.com">bruce.ashfield@gmail.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">Building against the 6.5+ =
kernel and headers resulted in a build failure<br>
due to missing detected features. We can fix the issues by bumping to<br>
2.2.0-rc4<br>
<br>
Bumping zfs to version zfs-2.2.0-rc4-35-g229ca7d73, which comprises the fol=
lowing commits:<br>
<br>
=C2=A0 =C2=A0 739db06ce Tag 2.2.0-rc4<br>
=C2=A0 =C2=A0 4da8c7d11 Intel QAT 1.7 compatibility<br>
=C2=A0 =C2=A0 32949f256 Relax error reporting in zpool import and zpool spl=
it<br>
=C2=A0 =C2=A0 79ac1b29d ZIL: Change ZIOs issue order.<br>
=C2=A0 =C2=A0 7dc2baaa1 ZIL: Revert zl_lock scope reduction.<br>
=C2=A0 =C2=A0 5a7cb0b06 ZIL: Tune some assertions.<br>
=C2=A0 =C2=A0 400f56e3f dmu_buf_will_clone: change assertion to fix 32-bit =
compiler warning<br>
=C2=A0 =C2=A0 63159e5bd checkstyle: fix action failures<br>
=C2=A0 =C2=A0 7eabb0af3 Try to clarify wording to reduce zpool add incident=
s<br>
=C2=A0 =C2=A0 c65aaa838 Avoid save/restoring AMX registers to avoid a SPR e=
rratum<br>
=C2=A0 =C2=A0 e99e684b3 zed: update zed.d/statechange-slot_off.sh<br>
=C2=A0 =C2=A0 1b696429c Make zoned/jailed zfsprops(7) make more sense.<br>
=C2=A0 =C2=A0 084ff4abd tests/block_cloning: rename and document get_same_b=
locks helper<br>
=C2=A0 =C2=A0 ab999406f Update outdated assertion from zio_write_compress<b=
r>
=C2=A0 =C2=A0 d19304ffe zed: Add zedlet to power off slot when drive is fau=
lted<br>
=C2=A0 =C2=A0 92f095a90 copy_file_range: fix fallback when source create on=
 same txg<br>
=C2=A0 =C2=A0 645a7e4d9 Move zinject from openzfs-zfs-test to openzfs-zfsut=
ils<br>
=C2=A0 =C2=A0 95649854b dracut: support mountpoint=3Dlegacy for root datase=
t<br>
=C2=A0 =C2=A0 895cb689d zfs_clone_range should return a descriptive error c=
odes<br>
=C2=A0 =C2=A0 6bdc7259d libzfs: sendrecv: send_progress_thread: handle SIGI=
NFO/SIGUSR1<br>
=C2=A0 =C2=A0 1e488eec6 linux/spl/kmem_cache: undefine `kmem_cache_alloc` b=
efore defining it<br>
=C2=A0 =C2=A0 c418edf1d Fix some typos<br>
=C2=A0 =C2=A0 df8c9f351 ZIL: Second attempt to reduce scope of zl_issuer_lo=
ck.<br>
=C2=A0 =C2=A0 bb31ded68 ZIL: Replay blocks without next block pointer.<br>
=C2=A0 =C2=A0 c1801cbe5 ZIL: Avoid dbuf_read() before dmu_sync().<br>
=C2=A0 =C2=A0 ffaedf0a4 Remove fastwrite mechanism.<br>
=C2=A0 =C2=A0 02ce9030e Avoid waiting in dmu_sync_late_arrival().<br>
=C2=A0 =C2=A0 0ae7bfc0a zpool_vdev_remove() should handle EALREADY error re=
turn<br>
=C2=A0 =C2=A0 bd1eab16e linux: zfs: ctldir: set [amc]time to snapshot&#39;s=
 creation property<br>
=C2=A0 =C2=A0 b3c1807d7 readmmap.c: fix building with MUSL libc<br>
=C2=A0 =C2=A0 b5e245633 Check the return value in clonefile test<br>
=C2=A0 =C2=A0 c47f0f441 linux/copy_file_range: properly request a fallback =
copy on Linux &lt;5.3<br>
=C2=A0 =C2=A0 12f2b1f65 zdb: include cloned blocks in block statistics<br>
=C2=A0 =C2=A0 4a104ac04 Tag 2.2.0-rc3<br>
=C2=A0 =C2=A0 c24a48063 BRT should return EOPNOTSUPP<br>
=C2=A0 =C2=A0 36d1a3ef4 zts: block cloning tests<br>
=C2=A0 =C2=A0 2768dc04c linux: implement filesystem-side copy/clone functio=
ns for EL7<br>
=C2=A0 =C2=A0 3366ceaf3 linux: implement filesystem-side clone ioctls<br>
=C2=A0 =C2=A0 5d12545da linux: implement filesystem-side copy/clone functio=
ns<br>
=C2=A0 =C2=A0 a3ea8c8ee dbuf_sync_leaf: check DB_READ in state assertions<b=
r>
=C2=A0 =C2=A0 0426e1327 dmu_buf_will_clone: only check that current txg is =
clean<br>
=C2=A0 =C2=A0 8aa4f0f0f brt_vdev_realloc: use vmem_alloc for large allocati=
on<br>
=C2=A0 =C2=A0 7698503dc zfs_clone_range: use vmem_malloc for large allocati=
on<br>
=C2=A0 =C2=A0 b9aa32ff3 zed: Reduce log noise for large JBODs<br>
=C2=A0 =C2=A0 571762b29 Linux 6.4 compat: META<br>
=C2=A0 =C2=A0 991834f5d Remove zl_issuer_lock from zil_suspend().<br>
=C2=A0 =C2=A0 41a0f6627 ZIL: Fix config lock deadlock.<br>
=C2=A0 =C2=A0 c79d1bae7 Update changelog for OpenZFS 2.2.0 release<br>
=C2=A0 =C2=A0 70232483b Tag 2.2.0-rc2<br>
=C2=A0 =C2=A0 c5273e0c3 shellcheck: disable &quot;unreachable command&quot;=
 check [SC2317]<br>
=C2=A0 =C2=A0 685ae4429 metaslab: tuneable to better control force ganging<=
br>
=C2=A0 =C2=A0 81be809a2 Adjust prefetch parameters.<br>
=C2=A0 =C2=A0 8a6fde821 Add explicit prefetches to bpobj_iterate().<br>
=C2=A0 =C2=A0 b6f618f8f Don&#39;t emit cksum_{actual_expected} in ereport.f=
s.zfs.checksum events<br>
=C2=A0 =C2=A0 51a2b5976 Don&#39;t emit checksum histograms in ereport.fs.zf=
s.checksum events<br>
=C2=A0 =C2=A0 8c81c0b05 zed: Fix zed ASSERT on slot power cycle<br>
=C2=A0 =C2=A0 b221f4394 Fix zpl_test_super race with zfs_umount<br>
=C2=A0 =C2=A0 e037327bf spa_min_alloc should be GCD, not min<br>
=C2=A0 =C2=A0 1a2e486d2 Don&#39;t panic if setting vdev properties is unsup=
ported for this vdev type<br>
=C2=A0 =C2=A0 d8011707c Ignore pool ashift property during vdev attachment<=
br>
=C2=A0 =C2=A0 f5f5a2db9 Rollback before zfs root is mounted<br>
=C2=A0 =C2=A0 83b0967c1 Do not request data L1 buffers on scan prefetch.<br=
>
=C2=A0 =C2=A0 73ba5df31 Linux 6.5 compat: disk_check_media_change() was add=
ed<br>
=C2=A0 =C2=A0 1bc244ae9 Linux 6.5 compat: BLK_STS_NEXUS renamed to BLK_STS_=
RESV_CONFLICT<br>
=C2=A0 =C2=A0 931dc7055 Linux 6.5 compat: intptr_t definition is canonicall=
y signed<br>
=C2=A0 =C2=A0 5299f4f28 set autotrim default to &#39;off&#39; everywhere<br=
>
=C2=A0 =C2=A0 f917cf1c0 Fix the ZFS checksum error histograms with larger r=
ecord sizes<br>
=C2=A0 =C2=A0 56ed389a5 Fix raw receive with different indirect block size.=
<br>
=C2=A0 =C2=A0 e613e4bbe Avoid extra snprintf() in dsl_deadlist_merge().<br>
=C2=A0 =C2=A0 b4e630b00 Add missed DMU_PROJECTUSED_OBJECT prefetch.<br>
=C2=A0 =C2=A0 bf6cd3079 FreeBSD: catch up to __FreeBSD_version 1400093<br>
=C2=A0 =C2=A0 1266cebf8 FreeBSD: Fix build on stable/13 after 1302506.<br>
<br>
Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.co=
m" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
---<br>
<br>
Khem,<br>
<br>
With 6.4 going EOL upstream, I&#39;m rushing in a bump to v6.5 for OEcore.<=
br>
<br>
This is a bump for btfs that solves issues in my tesing.<br>
<br>
Bruce<br>
<br>
=C2=A0meta-filesystems/recipes-filesystems/zfs/<a href=3D"http://zfs_2.2.0.=
bb" rel=3D"noreferrer" target=3D"_blank">zfs_2.2.0.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta-filesystems/recipes-filesystems/zfs/<a href=3D"http://zfs=
_2.2.0.bb" rel=3D"noreferrer" target=3D"_blank">zfs_2.2.0.bb</a> b/meta-fil=
esystems/recipes-filesystems/zfs/<a href=3D"http://zfs_2.2.0.bb" rel=3D"nor=
eferrer" target=3D"_blank">zfs_2.2.0.bb</a><br>
index a62a8a39b..db6f725b6 100644<br>
--- a/meta-filesystems/recipes-filesystems/zfs/<a href=3D"http://zfs_2.2.0.=
bb" rel=3D"noreferrer" target=3D"_blank">zfs_2.2.0.bb</a><br>
+++ b/meta-filesystems/recipes-filesystems/zfs/<a href=3D"http://zfs_2.2.0.=
bb" rel=3D"noreferrer" target=3D"_blank">zfs_2.2.0.bb</a><br>
@@ -4,7 +4,7 @@ LICENSE =3D &quot;CDDL-1.0&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D7087caaf1dc8a28565856=
19f4a787faa&quot;<br>
=C2=A0HOMEPAGE =3D&quot;<a href=3D"https://github.com/openzfs/zfs" rel=3D"n=
oreferrer" target=3D"_blank">https://github.com/openzfs/zfs</a>&quot;<br>
<br>
-SRCREV =3D &quot;009d3288dea524c7ad373b04b65bee8bb6f0bfea&quot;<br>
+SRCREV =3D &quot;229ca7d738ccbf4c55076977467ee93e20b6f01b&quot;<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/openzfs/zfs;prot=
ocol=3Dhttps;branch=3Dzfs-2.2-release" rel=3D"noreferrer" target=3D"_blank"=
>github.com/openzfs/zfs;protocol=3Dhttps;branch=3Dzfs-2.2-release</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Define-strndupa-if-it=
-does-not-exist.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://aaf28a4630af60496c9d33db1d=
06a7d7d8983422.patch \<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">- =
Thou shalt not follow the NULL pointer, for chaos and madness await thee at=
 its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br><b=
r></div>

--000000000000bcdacb060684f4c8--

