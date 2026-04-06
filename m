Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9EC4E9D835
	for <webhook@archiver.kernel.org>; Mon,  6 Apr 2026 05:06:58 +0000 (UTC)
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48955.1775452008425363667
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Apr 2026 22:06:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=q1++bAfi;
 spf=pass (domain: gmail.com, ip: 74.125.224.52, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-64e87a81639so3252374d50.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Apr 2026 22:06:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775452007; cv=none;
        d=google.com; s=arc-20240605;
        b=ZruFV5bZbcFLGmyAApeGwPO6MsYJ4T4N7AYoUcl8cEYPXhu7e+oW+RjDP82bwsAwvi
         o6dws6cZk7DNEk5Kln94CK49E7Ovk0feMuB6Ava/jFDlitF4xzl55ZkDmQRAHwqZ35mf
         W1HdZNEr7XVPxLy2VzTsj5WgtnChIceA7WwloFFQerGqnf8F2FXlhHEV2CjN0bGehEAH
         g3sN9C9NeU1no6rl3jwCrRCcn3wvYqBnGtg9qQytlFjZdnf3V0QsZCpT1Ldg4JaDGqnu
         drq7LrIqMCipZh8oFMaQMQ3gotOtM7z4hUGSkSaSylAwrGOvnBweXbT0bSBs+dkWwfvD
         G1NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=02yFjqtXITHgUsfNUaq1XVhhlguw9IVIv/WlFiAIqRA=;
        fh=ggesShGyquSiGrQwdgAlYQL/PKFb6PFdukRjZHtccVE=;
        b=RVnwuQLxcSG8xSlnbkZImbYRHBHyzO0KsgRbHledVSt7QFZhYhZkZYGwideuIE6hIu
         7EZr/7GcBBXd92JIaexf/V9GRof3kuLtIyTAN/+vIWrpK3ZexM2Qna/KTn+WPkQDz5XX
         H5pyILNB/l5hyzK4ctAeMRlr6rR2eSonpIu5jNLOkP2yz4UFyxpA1IBDaRVCwMJGXSFA
         joYH/KJvLBaSi4syZlqb3rwoZ3coKCnmmWynxg7pMeLJArQJuzJtK5ao1tq/aSPaiQ//
         q6229560aOd3sTgGwUiwZQxUxdQJKBvoa6a1YoeGglPisGVAPEtpyiEiI3cMaU5j+Mrs
         5c0Q==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775452007; x=1776056807; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=02yFjqtXITHgUsfNUaq1XVhhlguw9IVIv/WlFiAIqRA=;
        b=q1++bAfiHqbjwp32mRPZf87A7/r3b8vT2to7smiEJkFZ2FWArDqIqFmT+j9LLbJsHX
         9nlpOXvi7+okM7K1KlhwanzJnPJHXQX0GVKOWJDy0pPKpHp8XXtIZjT2aMIGmDvfahCj
         qVQsmehpzCQ3tVdk46J9qT/DbuZzrxN58Ukex4WGLO2gnkOTwViaWRkYeiWxHRH7S93b
         dE7/h+sjPLHLe2uiIMtNdg6hOaQwso5LqhG6HrSrpzSPDtNwZUSE9DgBJgk3VJJkv2qs
         CSz3aW+JBjZN3Bz/6ONxkNr1kx5jdIp0eD9tOI6CvkYqE7JD3LM9eaqnJ7Ynwa4Fe55t
         2UEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775452007; x=1776056807;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=02yFjqtXITHgUsfNUaq1XVhhlguw9IVIv/WlFiAIqRA=;
        b=HYy+VG2POUDo5dyyir1g0GcmQGGwYzL8XVbjqEZ+D3Rscj2WneLCqfpzMKd5YwVgYC
         pn7+yIveLCW1cTDbd9btzKjUZ2x3sl5f1OXKfptwgemxqqlyQYRc8UipSVV4NC+lUgNQ
         4oaOF2cAuVIVrGIq1FfTukT9Z4l2YiCKekWdfFKYNvkVLyfrqLkVqsQeWZ4jcCyCtqeY
         fy71RCSOa5RdT4I9mubg0cgTuPWacskcDKtZLD5agso0FG2r+76KtnOKtMMrpbmvwGM/
         NVGYx1h9ciCmv65K15Mo8yNbtn8dYIigh6gzer//LHz87bgVnq+UydnM+uYmOXKQjqiS
         F4mA==
X-Gm-Message-State: AOJu0Yzhk0DSwn/p/5Ai5EcPgSxxZe6TDRe05K+WKmzIyo1fx0vsu/Pl
	3gB3iH9H4Z3+jDAUdDhywxS662n7wV2PX7sZXehPx1DGrM35XiaEl54JuBgyHCOIeo4pDGschjc
	ztLdjJ9kITibHzBuhGe5dK7GwEJFCly0=
X-Gm-Gg: AeBDievZx7nDmuPiBrOCA4DvtHPaZvGrrXNnpqQ63VT9p2Xk+Ls41R4snRKPnTCLChh
	w+9D2SBcyIDmDe1JOeOipwBmWW/0a22cAYSv/ExXzPDDHmgt4wmVysHOBUCvAwuEAICwX3tL9Ay
	vDwf8DNcdgl5jksQPXg7FlqAIcPReQWEtdy5Rs18H8YfGmlpnXEWi3DpK2y8zUA64E07ie64yYh
	jODS5zflSW8BLzn+hzUWC6DVz70Sc9rWZeAiDlK6GjxdwrcXb/E7uZzVySmPuSBQlw2dpzG7ZK3
	sKeAH+j4+t5yMYlYhDkZIZHS8vzYawcLugEbyqXMmsuELvdch0brVed1MblgSpnfzqEEYjb7tQm
	JFd6pCP1ZG7UHRBeXqlK3x+T4
X-Received: by 2002:a05:690e:130e:b0:650:11b3:3f41 with SMTP id
 956f58d0204a3-650486eac9emr11366515d50.17.1775452007219; Sun, 05 Apr 2026
 22:06:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260320052813.3323280-1-git-patches@bmwtechworks.in> <20260330100744.739123-1-git-patches@bmwtechworks.in>
In-Reply-To: <20260330100744.739123-1-git-patches@bmwtechworks.in>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 5 Apr 2026 22:06:20 -0700
X-Gm-Features: AQROBzBWb19pUwKxi16HCMTFMRymJtD329yGOtmgSZ9bmK4-j3ws9u9iiDbnd-4
Message-ID: <CAMKF1sryuqEYDpMSwgeisFftBSfPcg0G9P5THZQop6+K5QXGZA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v2 0/2] android-tools: migration and cleanup
To: git-patches@bmwtechworks.in
Cc: openembedded-devel@lists.openembedded.org, 
	Ashish Kumar Mishra <ashishkumar.mishra@bmwtechworks.in>
Content-Type: multipart/alternative; boundary="00000000000034c4fa064ec3a20c"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Apr 2026 05:06:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126020

--00000000000034c4fa064ec3a20c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Overall I am in favor of cleaning up. However, I am not sure if the current
patch removes selinux dependencies, that will be a prerequisite to move it
out of the dynamic layer.

On Mon, Mar 30, 2026 at 3:58=E2=80=AFAM Ashish Kumar Mishra via
lists.openembedded.org <git-patches=3Dbmwtechworks.in@lists.openembedded.or=
g>
wrote:

> From: Ashish Kumar Mishra <ashishkumar.mishra@bmwtechworks.in>
>
> Following the feedback on the initial RFC, the logic has been split into
> two
> distinct commits to improve clarity and maintainability:
>
> 1. Removal of the legacy android-tools 5.x version from
> meta-oe/recipes-devtools.
> 2. Migration of android-tools v29.x from dynamic-layers/selinux to meta-o=
e.
>
> This ensures the newer version is correctly positioned in meta-oe while
> cleaning up the deprecated 5.x recipe.
>
> Ashish Kumar Mishra (2):
>   android-tools: remove android-tools 5.x from meta-oe/recipes-devtools
>   android-tools: move android-tools v29.x from dynamic-layers/selinux to
>     meta-oe
>
>  .../android-tools-conf/android-gadget-setup   |  37 --
>  .../android-tools/android-tools-conf_1.0.bb   |  20 -
>  .../android-tools/android-tools/adbd.mk       |  87 -----
>  .../android-tools/android-tools-adbd.service  |  13 -
>  .../10-adbd-configfs.conf                     |   4 -
>  .../android-gadget-cleanup                    |  24 --
>  .../android-gadget-setup                      |  38 --
>  .../android-gadget-start                      |   9 -
>  .../android-tools-conf-configfs_1.0.bb        |  38 --
>  .../android-tools/android-tools-conf_1.0.bb   |   4 +-
>  .../0001-Fixes-for-yocto-build.patch          |   0
>  .../0001-liblp-fix-building-with-GCC-14.patch |   0
>  ...difications-to-make-it-build-in-yoct.patch |   0
>  ...usbdevfs_urb-to-match-new-kernel-UAP.patch |   0
>  ...-adb-Fix-build-on-big-endian-systems.patch |   0
>  ...005-adb-Allow-adbd-to-be-run-as-root.patch |   0
>  .../android-tools/android-tools/adb.mk        |  72 ----
>  .../android-tools/android-tools/adbd.mk       | 247 +++++-------
>  ...scv-Add-risc-v-Android-config-header.patch | 361 ------------------
>  .../0001-adb-remove-selinux-extensions.patch  |  44 ---
>  ...define-strlcpy-for-glibc-based-syste.patch |  35 --
>  ...-Use-local-sockets-where-appropriate.patch |  70 ----
>  .../core/0003-adb-define-shell-command.patch  |  29 --
>  ...-adb-Fix-build-on-big-endian-systems.patch |  47 ---
>  .../0005-adb-add-base64-implementation.patch  | 350 -----------------
>  .../core/0006-adb-Musl-fixes.patch            | 130 -------
>  ...sb_linux.c-fix-build-with-glibc-2.28.patch |  26 --
>  ...008-adb-Allow-adbd-to-be-ran-as-root.patch |  23 --
>  ...Add-dt-parameter-to-specify-DT-image.patch | 110 ------
>  ...ux-capability.h-on-linux-systems-too.patch |  23 --
>  .../0011-Remove-bionic-specific-calls.patch   |  64 ----
>  ...laration-of-stlcat-strlcopy-function.patch |  50 ---
>  .../core/0013-adb-Support-riscv64.patch       | 191 ---------
>  ...add-u3-ss-descriptor-support-for-adb.patch | 344 -----------------
>  ...off-most-of-sparse_file_read_normal-.patch |  60 ---
>  ...se-Add-hole-mode-to-sparse_file_read.patch | 188 ---------
>  ...port-for-converting-holes-to-don-t-c.patch | 114 ------
>  .../android-tools/core/adb_libssl_11.diff     |  48 ---
>  .../core/b64_pton_function_decl.patch         |  14 -
>  .../debian/Add-riscv64-support.patch          |   0
>  .../debian/Added-missing-headers.patch        |   0
>  .../android-tools/debian/Nonnull.patch        |   0
>  .../android-tools/debian/Vector-cast.patch    |   0
>  .../debian/add-missing-headers.patch          |   0
>  .../20150704-CVE-2015-3239_dwarf_i.h.patch    |   0
>  .../legacy_built-in_sync_functions.patch      |   0
>  ...nd-fix-strchr-conformance-to-ISO-C23.patch |   0
>  ...unreachable-macro-to-avoid-redefinit.patch |   0
>  .../external/libunwind/user_pt_regs.patch     |   0
>  .../debian/fix-attribute-issue-with-gcc.patch |   0
>  .../debian/fix-build-on-non-x86.patch         |   0
>  .../fix-gettid-exception-declaration.patch    |   0
>  .../fix-standard-namespace-errors.patch       |   0
>  .../debian/hard-code-build-number.patch       |   0
>  .../debian/libusb-header-path.patch           |   0
>  .../debian/move-log-file-to-proper-dir.patch  |   0
>  .../debian/simg_dump-python3.patch            |   0
>  .../android-tools/debian/stdatomic.patch      |   0
>  .../debian/stub-out-fastdeploy.patch          |   0
>  .../system/core/Add-riscv64-support.patch     |   0
>  .../system/core/Added-missing-headers.patch   |   0
>  .../debian/system/core/Nonnull.patch          |   0
>  .../debian/system/core/Vector-cast.patch      |   0
>  .../system/core/add-missing-headers.patch     |   0
>  ...ope-write-macro-to-prevent-conflict-.patch |   0
>  .../core/fix-attribute-issue-with-gcc.patch   |   0
>  .../system/core/fix-build-on-non-x86.patch    |   0
>  .../fix-gettid-exception-declaration.patch    |   0
>  .../core/fix-standard-namespace-errors.patch  |   0
>  .../system/core/hard-code-build-number.patch  |   0
>  .../system/core/libusb-header-path.patch      |   0
>  ...x-missing-fixed-width-integer-types-.patch |   0
>  .../core/move-log-file-to-proper-dir.patch    |   0
>  .../system/core/simg_dump-python3.patch       |   0
>  .../debian/system/core/stdatomic.patch        |   0
>  .../system/core/stub-out-fastdeploy.patch     |   0
>  .../core/throw-exception-on-unknown-os.patch  |   0
>  .../throw-exception-on-unknown-os.patch       |   0
>  .../android-tools/android-tools/ext4_utils.mk | 103 -----
>  ...ext4_utils-remove-selinux-extensions.patch |  39 --
>  ...add-o-argument-to-preserve-ownership.patch |  78 ----
>  ...unused-parameter-from-allocate_inode.patch |  69 ----
>  .../android-tools/android-tools/fastboot.mk   |  89 -----
>  .../android-tools/android-tools/gitignore     |  59 ---
>  .../0001-Remove-bionic-specific-calls.patch   |  25 --
>  ...t-define-gettid-if-glibc-2.30-is-use.patch |  51 ---
>  .../android-tools/android-tools/mkbootimg.mk  |  29 --
>  .../android-tools/android-tools/remount       |   0
>  .../android-tools/rules_yocto.mk              |   0
>  .../android-tools/android-tools_29.0.6.r14.bb |   7 +-
>  .../android-tools/android-tools_5.1.1.r37.bb  | 189 ---------
>  91 files changed, 92 insertions(+), 3560 deletions(-)
>  delete mode 100644
> meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tool=
s-conf/android-gadget-setup
>  delete mode 100644
> meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/
> android-tools-conf_1.0.bb
>  delete mode 100644
> meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tool=
s/
> adbd.mk
>  delete mode 100644
> meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tool=
s/android-tools-adbd.service
>  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/10-adb=
d-configfs.conf
>  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/androi=
d-gadget-cleanup
>  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/androi=
d-gadget-setup
>  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/androi=
d-gadget-start
>  delete mode 100644 meta-oe/recipes-devtools/android-tools/
> android-tools-conf-configfs_1.0.bb
>  rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D>
> recipes-devtools}/android-tools/android-tools/0001-Fixes-for-yocto-build.=
patch
> (100%)
>  rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D>
> recipes-devtools}/android-tools/android-tools/0001-liblp-fix-building-wit=
h-GCC-14.patch
> (100%)
>  rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D>
> recipes-devtools}/android-tools/android-tools/0002-android-tools-modifica=
tions-to-make-it-build-in-yoct.patch
> (100%)
>  rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D>
> recipes-devtools}/android-tools/android-tools/0003-Update-usage-of-usbdev=
fs_urb-to-match-new-kernel-UAP.patch
> (100%)
>  rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D>
> recipes-devtools}/android-tools/android-tools/0004-adb-Fix-build-on-big-e=
ndian-systems.patch
> (100%)
>  rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D>
> recipes-devtools}/android-tools/android-tools/0005-adb-Allow-adbd-to-be-r=
un-as-root.patch
> (100%)
>  delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/
> adb.mk
>  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/build/0001-Riscv-Add=
-risc-v-Android-config-header.patch
>  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/core/0001-adb-remove=
-selinux-extensions.patch
>  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/core/0001-memory.h-A=
lways-define-strlcpy-for-glibc-based-syste.patch
>  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/core/0002-adb-Use-lo=
cal-sockets-where-appropriate.patch
>  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/core/0003-adb-define=
-shell-command.patch
>  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/core/0004-adb-Fix-bu=
ild-on-big-endian-systems.patch
>  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/core/0005-adb-add-ba=
se64-implementation.patch
>  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/core/0006-adb-Musl-f=
ixes.patch
>  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/core/0007-adb-usb_li=
nux.c-fix-build-with-glibc-2.28.patch
>  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/core/0008-adb-Allow-=
adbd-to-be-ran-as-root.patch
>  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/core/0009-mkbootimg-=
Add-dt-parameter-to-specify-DT-image.patch
>  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/core/0010-Use-linux-=
capability.h-on-linux-systems-too.patch
>  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/core/0011-Remove-bio=
nic-specific-calls.patch
>  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/core/0012-Fix-implic=
it-declaration-of-stlcat-strlcopy-function.patch
>  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/core/0013-adb-Suppor=
t-riscv64.patch
>  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/core/0014-add-u3-ss-=
descriptor-support-for-adb.patch
>  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/core/0015-libsparse-=
Split-off-most-of-sparse_file_read_normal-.patch
>  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/core/0016-libsparse-=
Add-hole-mode-to-sparse_file_read.patch
>  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/core/0017-img2simg-A=
dd-support-for-converting-holes-to-don-t-c.patch
>  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/core/adb_libssl_11.d=
iff
>  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/core/b64_pton_functi=
on_decl.patch
>  rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D>
> recipes-devtools}/android-tools/android-tools/debian/Add-riscv64-support.=
patch
> (100%)
>  rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D>
> recipes-devtools}/android-tools/android-tools/debian/Added-missing-header=
s.patch
> (100%)
>  rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D>
> recipes-devtools}/android-tools/android-tools/debian/Nonnull.patch (100%)
>  rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D>
> recipes-devtools}/android-tools/android-tools/debian/Vector-cast.patch
> (100%)
>  rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D>
> recipes-devtools}/android-tools/android-tools/debian/add-missing-headers.=
patch
> (100%)
>  rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D>
> recipes-devtools}/android-tools/android-tools/debian/external/libunwind/2=
0150704-CVE-2015-3239_dwarf_i.h.patch
> (100%)
>  rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D>
> recipes-devtools}/android-tools/android-tools/debian/external/libunwind/l=
egacy_built-in_sync_functions.patch
> (100%)
>  rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D>
> recipes-devtools}/android-tools/android-tools/debian/external/libunwind/l=
ibunwind-fix-strchr-conformance-to-ISO-C23.patch
> (100%)
>  rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D>
> recipes-devtools}/android-tools/android-tools/debian/external/libunwind/l=
ibunwind-guard-unreachable-macro-to-avoid-redefinit.patch
> (100%)
>  rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D>
> recipes-devtools}/android-tools/android-tools/debian/external/libunwind/u=
ser_pt_regs.patch
> (100%)
>  rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D>
> recipes-devtools}/android-tools/android-tools/debian/fix-attribute-issue-=
with-gcc.patch
> (100%)
>  rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D>
> recipes-devtools}/android-tools/android-tools/debian/fix-build-on-non-x86=
.patch
> (100%)
>  rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D>
> recipes-devtools}/android-tools/android-tools/debian/fix-gettid-exception=
-declaration.patch
> (100%)
>  rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D>
> recipes-devtools}/android-tools/android-tools/debian/fix-standard-namespa=
ce-errors.patch
> (100%)
>  rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D>
> recipes-devtools}/android-tools/android-tools/debian/hard-code-build-numb=
er.patch
> (100%)
>  rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D>
> recipes-devtools}/android-tools/android-tools/debian/libusb-header-path.p=
atch
> (100%)
>  rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D>
> recipes-devtools}/android-tools/android-tools/debian/move-log-file-to-pro=
per-dir.patch
> (100%)
>  rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D>
> recipes-devtools}/android-tools/android-tools/debian/simg_dump-python3.pa=
tch
> (100%)
>  rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D>
> recipes-devtools}/android-tools/android-tools/debian/stdatomic.patch (100=
%)
>  rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D>
> recipes-devtools}/android-tools/android-tools/debian/stub-out-fastdeploy.=
patch
> (100%)
>  rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D>
> recipes-devtools}/android-tools/android-tools/debian/system/core/Add-risc=
v64-support.patch
> (100%)
>  rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D>
> recipes-devtools}/android-tools/android-tools/debian/system/core/Added-mi=
ssing-headers.patch
> (100%)
>  rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D>
> recipes-devtools}/android-tools/android-tools/debian/system/core/Nonnull.=
patch
> (100%)
>  rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D>
> recipes-devtools}/android-tools/android-tools/debian/system/core/Vector-c=
ast.patch
> (100%)
>  rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D>
> recipes-devtools}/android-tools/android-tools/debian/system/core/add-miss=
ing-headers.patch
> (100%)
>  rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D>
> recipes-devtools}/android-tools/android-tools/debian/system/core/android-=
tools-scope-write-macro-to-prevent-conflict-.patch
> (100%)
>  rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D>
> recipes-devtools}/android-tools/android-tools/debian/system/core/fix-attr=
ibute-issue-with-gcc.patch
> (100%)
>  rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D>
> recipes-devtools}/android-tools/android-tools/debian/system/core/fix-buil=
d-on-non-x86.patch
> (100%)
>  rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D>
> recipes-devtools}/android-tools/android-tools/debian/system/core/fix-gett=
id-exception-declaration.patch
> (100%)
>  rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D>
> recipes-devtools}/android-tools/android-tools/debian/system/core/fix-stan=
dard-namespace-errors.patch
> (100%)
>  rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D>
> recipes-devtools}/android-tools/android-tools/debian/system/core/hard-cod=
e-build-number.patch
> (100%)
>  rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D>
> recipes-devtools}/android-tools/android-tools/debian/system/core/libusb-h=
eader-path.patch
> (100%)
>  rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D>
> recipes-devtools}/android-tools/android-tools/debian/system/core/libzipar=
chive-fix-missing-fixed-width-integer-types-.patch
> (100%)
>  rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D>
> recipes-devtools}/android-tools/android-tools/debian/system/core/move-log=
-file-to-proper-dir.patch
> (100%)
>  rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D>
> recipes-devtools}/android-tools/android-tools/debian/system/core/simg_dum=
p-python3.patch
> (100%)
>  rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D>
> recipes-devtools}/android-tools/android-tools/debian/system/core/stdatomi=
c.patch
> (100%)
>  rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D>
> recipes-devtools}/android-tools/android-tools/debian/system/core/stub-out=
-fastdeploy.patch
> (100%)
>  rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D>
> recipes-devtools}/android-tools/android-tools/debian/system/core/throw-ex=
ception-on-unknown-os.patch
> (100%)
>  rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D>
> recipes-devtools}/android-tools/android-tools/debian/throw-exception-on-u=
nknown-os.patch
> (100%)
>  delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/
> ext4_utils.mk
>  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/extras/0001-ext4_uti=
ls-remove-selinux-extensions.patch
>  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/extras/0002-ext4_uti=
ls-add-o-argument-to-preserve-ownership.patch
>  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/extras/0003-ext4_uti=
ls-drop-unused-parameter-from-allocate_inode.patch
>  delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/
> fastboot.mk
>  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/gitignore
>  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/libselinux/0001-Remo=
ve-bionic-specific-calls.patch
>  delete mode 100644
> meta-oe/recipes-devtools/android-tools/android-tools/libselinux/0001-libs=
elinux-Do-not-define-gettid-if-glibc-2.30-is-use.patch
>  delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/
> mkbootimg.mk
>  rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D>
> recipes-devtools}/android-tools/android-tools/remount (100%)
>  rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D>
> recipes-devtools}/android-tools/android-tools/rules_yocto.mk (100%)
>  rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D>
> recipes-devtools}/android-tools/android-tools_29.0.6.r14.bb (96%)
>  delete mode 100644 meta-oe/recipes-devtools/android-tools/
> android-tools_5.1.1.r37.bb
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#125864):
> https://lists.openembedded.org/g/openembedded-devel/message/125864
> Mute This Topic: https://lists.openembedded.org/mt/118576547/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000034c4fa064ec3a20c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Overall I am in favor of cleaning up. However, I am not su=
re if the current patch removes selinux dependencies, that will be a prereq=
uisite=C2=A0to move it out of the dynamic layer.</div><br><div class=3D"gma=
il_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mo=
n, Mar 30, 2026 at 3:58=E2=80=AFAM Ashish Kumar Mishra via <a href=3D"http:=
//lists.openembedded.org">lists.openembedded.org</a> &lt;git-patches=3D<a h=
ref=3D"mailto:bmwtechworks.in@lists.openembedded.org">bmwtechworks.in@lists=
.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">From: Ashish Kumar Mishra &lt;<a href=3D"mailto:ashishkuma=
r.mishra@bmwtechworks.in" target=3D"_blank">ashishkumar.mishra@bmwtechworks=
.in</a>&gt;<br>
<br>
Following the feedback on the initial RFC, the logic has been split into tw=
o <br>
distinct commits to improve clarity and maintainability:<br>
<br>
1. Removal of the legacy android-tools 5.x version from meta-oe/recipes-dev=
tools.<br>
2. Migration of android-tools v29.x from dynamic-layers/selinux to meta-oe.=
<br>
<br>
This ensures the newer version is correctly positioned in meta-oe while <br=
>
cleaning up the deprecated 5.x recipe.<br>
<br>
Ashish Kumar Mishra (2):<br>
=C2=A0 android-tools: remove android-tools 5.x from meta-oe/recipes-devtool=
s<br>
=C2=A0 android-tools: move android-tools v29.x from dynamic-layers/selinux =
to<br>
=C2=A0 =C2=A0 meta-oe<br>
<br>
=C2=A0.../android-tools-conf/android-gadget-setup=C2=A0 =C2=A0|=C2=A0 37 --=
<br>
=C2=A0.../android-tools/<a href=3D"http://android-tools-conf_1.0.bb" rel=3D=
"noreferrer" target=3D"_blank">android-tools-conf_1.0.bb</a>=C2=A0 =C2=A0|=
=C2=A0 20 -<br>
=C2=A0.../android-tools/android-tools/<a href=3D"http://adbd.mk" rel=3D"nor=
eferrer" target=3D"_blank">adbd.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 87=
 -----<br>
=C2=A0.../android-tools/android-tools-adbd.service=C2=A0 |=C2=A0 13 -<br>
=C2=A0.../10-adbd-configfs.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 -<br>
=C2=A0.../android-gadget-cleanup=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 24 --<br>
=C2=A0.../android-gadget-setup=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 38 --<br>
=C2=A0.../android-gadget-start=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A09 -<br>
=C2=A0.../<a href=3D"http://android-tools-conf-configfs_1.0.bb" rel=3D"nore=
ferrer" target=3D"_blank">android-tools-conf-configfs_1.0.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 38 --<br>
=C2=A0.../android-tools/<a href=3D"http://android-tools-conf_1.0.bb" rel=3D=
"noreferrer" target=3D"_blank">android-tools-conf_1.0.bb</a>=C2=A0 =C2=A0|=
=C2=A0 =C2=A04 +-<br>
=C2=A0.../0001-Fixes-for-yocto-build.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A00<br>
=C2=A0.../0001-liblp-fix-building-with-GCC-14.patch |=C2=A0 =C2=A00<br>
=C2=A0...difications-to-make-it-build-in-yoct.patch |=C2=A0 =C2=A00<br>
=C2=A0...usbdevfs_urb-to-match-new-kernel-UAP.patch |=C2=A0 =C2=A00<br>
=C2=A0...-adb-Fix-build-on-big-endian-systems.patch |=C2=A0 =C2=A00<br>
=C2=A0...005-adb-Allow-adbd-to-be-run-as-root.patch |=C2=A0 =C2=A00<br>
=C2=A0.../android-tools/android-tools/<a href=3D"http://adb.mk" rel=3D"nore=
ferrer" target=3D"_blank">adb.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 72 =
----<br>
=C2=A0.../android-tools/android-tools/<a href=3D"http://adbd.mk" rel=3D"nor=
eferrer" target=3D"_blank">adbd.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0| 247 ++++=
+-------<br>
=C2=A0...scv-Add-risc-v-Android-config-header.patch | 361 -----------------=
-<br>
=C2=A0.../0001-adb-remove-selinux-extensions.patch=C2=A0 |=C2=A0 44 ---<br>
=C2=A0...define-strlcpy-for-glibc-based-syste.patch |=C2=A0 35 --<br>
=C2=A0...-Use-local-sockets-where-appropriate.patch |=C2=A0 70 ----<br>
=C2=A0.../core/0003-adb-define-shell-command.patch=C2=A0 |=C2=A0 29 --<br>
=C2=A0...-adb-Fix-build-on-big-endian-systems.patch |=C2=A0 47 ---<br>
=C2=A0.../0005-adb-add-base64-implementation.patch=C2=A0 | 350 ------------=
-----<br>
=C2=A0.../core/0006-adb-Musl-fixes.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 130 -------<br>
=C2=A0...sb_linux.c-fix-build-with-glibc-2.28.patch |=C2=A0 26 --<br>
=C2=A0...008-adb-Allow-adbd-to-be-ran-as-root.patch |=C2=A0 23 --<br>
=C2=A0...Add-dt-parameter-to-specify-DT-image.patch | 110 ------<br>
=C2=A0...ux-capability.h-on-linux-systems-too.patch |=C2=A0 23 --<br>
=C2=A0.../0011-Remove-bionic-specific-calls.patch=C2=A0 =C2=A0|=C2=A0 64 --=
--<br>
=C2=A0...laration-of-stlcat-strlcopy-function.patch |=C2=A0 50 ---<br>
=C2=A0.../core/0013-adb-Support-riscv64.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0| 1=
91 ---------<br>
=C2=A0...add-u3-ss-descriptor-support-for-adb.patch | 344 -----------------=
<br>
=C2=A0...off-most-of-sparse_file_read_normal-.patch |=C2=A0 60 ---<br>
=C2=A0...se-Add-hole-mode-to-sparse_file_read.patch | 188 ---------<br>
=C2=A0...port-for-converting-holes-to-don-t-c.patch | 114 ------<br>
=C2=A0.../android-tools/core/adb_libssl_11.diff=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
48 ---<br>
=C2=A0.../core/b64_pton_function_decl.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 14 -<br>
=C2=A0.../debian/Add-riscv64-support.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A00<br>
=C2=A0.../debian/Added-missing-headers.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A00<br>
=C2=A0.../android-tools/debian/Nonnull.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A00<br>
=C2=A0.../android-tools/debian/Vector-cast.patch=C2=A0 =C2=A0 |=C2=A0 =C2=
=A00<br>
=C2=A0.../debian/add-missing-headers.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A00<br>
=C2=A0.../20150704-CVE-2015-3239_dwarf_i.h.patch=C2=A0 =C2=A0 |=C2=A0 =C2=
=A00<br>
=C2=A0.../legacy_built-in_sync_functions.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A00<br>
=C2=A0...nd-fix-strchr-conformance-to-ISO-C23.patch |=C2=A0 =C2=A00<br>
=C2=A0...unreachable-macro-to-avoid-redefinit.patch |=C2=A0 =C2=A00<br>
=C2=A0.../external/libunwind/user_pt_regs.patch=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A00<br>
=C2=A0.../debian/fix-attribute-issue-with-gcc.patch |=C2=A0 =C2=A00<br>
=C2=A0.../debian/fix-build-on-non-x86.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A00<br>
=C2=A0.../fix-gettid-exception-declaration.patch=C2=A0 =C2=A0 |=C2=A0 =C2=
=A00<br>
=C2=A0.../fix-standard-namespace-errors.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A00<br>
=C2=A0.../debian/hard-code-build-number.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A00<br>
=C2=A0.../debian/libusb-header-path.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 =C2=A00<br>
=C2=A0.../debian/move-log-file-to-proper-dir.patch=C2=A0 |=C2=A0 =C2=A00<br=
>
=C2=A0.../debian/simg_dump-python3.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A00<br>
=C2=A0.../android-tools/debian/stdatomic.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A00<br>
=C2=A0.../debian/stub-out-fastdeploy.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A00<br>
=C2=A0.../system/core/Add-riscv64-support.patch=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A00<br>
=C2=A0.../system/core/Added-missing-headers.patch=C2=A0 =C2=A0|=C2=A0 =C2=
=A00<br>
=C2=A0.../debian/system/core/Nonnull.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A00<br>
=C2=A0.../debian/system/core/Vector-cast.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A00<br>
=C2=A0.../system/core/add-missing-headers.patch=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A00<br>
=C2=A0...ope-write-macro-to-prevent-conflict-.patch |=C2=A0 =C2=A00<br>
=C2=A0.../core/fix-attribute-issue-with-gcc.patch=C2=A0 =C2=A0|=C2=A0 =C2=
=A00<br>
=C2=A0.../system/core/fix-build-on-non-x86.patch=C2=A0 =C2=A0 |=C2=A0 =C2=
=A00<br>
=C2=A0.../fix-gettid-exception-declaration.patch=C2=A0 =C2=A0 |=C2=A0 =C2=
=A00<br>
=C2=A0.../core/fix-standard-namespace-errors.patch=C2=A0 |=C2=A0 =C2=A00<br=
>
=C2=A0.../system/core/hard-code-build-number.patch=C2=A0 |=C2=A0 =C2=A00<br=
>
=C2=A0.../system/core/libusb-header-path.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A00<br>
=C2=A0...x-missing-fixed-width-integer-types-.patch |=C2=A0 =C2=A00<br>
=C2=A0.../core/move-log-file-to-proper-dir.patch=C2=A0 =C2=A0 |=C2=A0 =C2=
=A00<br>
=C2=A0.../system/core/simg_dump-python3.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A00<br>
=C2=A0.../debian/system/core/stdatomic.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A00<br>
=C2=A0.../system/core/stub-out-fastdeploy.patch=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A00<br>
=C2=A0.../core/throw-exception-on-unknown-os.patch=C2=A0 |=C2=A0 =C2=A00<br=
>
=C2=A0.../throw-exception-on-unknown-os.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A00<br>
=C2=A0.../android-tools/android-tools/<a href=3D"http://ext4_utils.mk" rel=
=3D"noreferrer" target=3D"_blank">ext4_utils.mk</a> | 103 -----<br>
=C2=A0...ext4_utils-remove-selinux-extensions.patch |=C2=A0 39 --<br>
=C2=A0...add-o-argument-to-preserve-ownership.patch |=C2=A0 78 ----<br>
=C2=A0...unused-parameter-from-allocate_inode.patch |=C2=A0 69 ----<br>
=C2=A0.../android-tools/android-tools/<a href=3D"http://fastboot.mk" rel=3D=
"noreferrer" target=3D"_blank">fastboot.mk</a>=C2=A0 =C2=A0|=C2=A0 89 -----=
<br>
=C2=A0.../android-tools/android-tools/gitignore=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
59 ---<br>
=C2=A0.../0001-Remove-bionic-specific-calls.patch=C2=A0 =C2=A0|=C2=A0 25 --=
<br>
=C2=A0...t-define-gettid-if-glibc-2.30-is-use.patch |=C2=A0 51 ---<br>
=C2=A0.../android-tools/android-tools/<a href=3D"http://mkbootimg.mk" rel=
=3D"noreferrer" target=3D"_blank">mkbootimg.mk</a>=C2=A0 |=C2=A0 29 --<br>
=C2=A0.../android-tools/android-tools/remount=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A00<br>
=C2=A0.../android-tools/<a href=3D"http://rules_yocto.mk" rel=3D"noreferrer=
" target=3D"_blank">rules_yocto.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A00<br>
=C2=A0.../android-tools/<a href=3D"http://android-tools_29.0.6.r14.bb" rel=
=3D"noreferrer" target=3D"_blank">android-tools_29.0.6.r14.bb</a> |=C2=A0 =
=C2=A07 +-<br>
=C2=A0.../android-tools/<a href=3D"http://android-tools_5.1.1.r37.bb" rel=
=3D"noreferrer" target=3D"_blank">android-tools_5.1.1.r37.bb</a>=C2=A0 | 18=
9 ---------<br>
=C2=A091 files changed, 92 insertions(+), 3560 deletions(-)<br>
=C2=A0delete mode 100644 meta-oe/dynamic-layers/selinux/recipes-devtool/and=
roid-tools/android-tools-conf/android-gadget-setup<br>
=C2=A0delete mode 100644 meta-oe/dynamic-layers/selinux/recipes-devtool/and=
roid-tools/<a href=3D"http://android-tools-conf_1.0.bb" rel=3D"noreferrer" =
target=3D"_blank">android-tools-conf_1.0.bb</a><br>
=C2=A0delete mode 100644 meta-oe/dynamic-layers/selinux/recipes-devtool/and=
roid-tools/android-tools/<a href=3D"http://adbd.mk" rel=3D"noreferrer" targ=
et=3D"_blank">adbd.mk</a><br>
=C2=A0delete mode 100644 meta-oe/dynamic-layers/selinux/recipes-devtool/and=
roid-tools/android-tools/android-tools-adbd.service<br>
=C2=A0delete mode 100644 meta-oe/recipes-devtools/android-tools/android-too=
ls-conf-configfs/10-adbd-configfs.conf<br>
=C2=A0delete mode 100644 meta-oe/recipes-devtools/android-tools/android-too=
ls-conf-configfs/android-gadget-cleanup<br>
=C2=A0delete mode 100644 meta-oe/recipes-devtools/android-tools/android-too=
ls-conf-configfs/android-gadget-setup<br>
=C2=A0delete mode 100644 meta-oe/recipes-devtools/android-tools/android-too=
ls-conf-configfs/android-gadget-start<br>
=C2=A0delete mode 100644 meta-oe/recipes-devtools/android-tools/<a href=3D"=
http://android-tools-conf-configfs_1.0.bb" rel=3D"noreferrer" target=3D"_bl=
ank">android-tools-conf-configfs_1.0.bb</a><br>
=C2=A0rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D&gt; recipe=
s-devtools}/android-tools/android-tools/0001-Fixes-for-yocto-build.patch (1=
00%)<br>
=C2=A0rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D&gt; recipe=
s-devtools}/android-tools/android-tools/0001-liblp-fix-building-with-GCC-14=
.patch (100%)<br>
=C2=A0rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D&gt; recipe=
s-devtools}/android-tools/android-tools/0002-android-tools-modifications-to=
-make-it-build-in-yoct.patch (100%)<br>
=C2=A0rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D&gt; recipe=
s-devtools}/android-tools/android-tools/0003-Update-usage-of-usbdevfs_urb-t=
o-match-new-kernel-UAP.patch (100%)<br>
=C2=A0rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D&gt; recipe=
s-devtools}/android-tools/android-tools/0004-adb-Fix-build-on-big-endian-sy=
stems.patch (100%)<br>
=C2=A0rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D&gt; recipe=
s-devtools}/android-tools/android-tools/0005-adb-Allow-adbd-to-be-run-as-ro=
ot.patch (100%)<br>
=C2=A0delete mode 100644 meta-oe/recipes-devtools/android-tools/android-too=
ls/<a href=3D"http://adb.mk" rel=3D"noreferrer" target=3D"_blank">adb.mk</a=
><br>
=C2=A0delete mode 100644 meta-oe/recipes-devtools/android-tools/android-too=
ls/build/0001-Riscv-Add-risc-v-Android-config-header.patch<br>
=C2=A0delete mode 100644 meta-oe/recipes-devtools/android-tools/android-too=
ls/core/0001-adb-remove-selinux-extensions.patch<br>
=C2=A0delete mode 100644 meta-oe/recipes-devtools/android-tools/android-too=
ls/core/0001-memory.h-Always-define-strlcpy-for-glibc-based-syste.patch<br>
=C2=A0delete mode 100644 meta-oe/recipes-devtools/android-tools/android-too=
ls/core/0002-adb-Use-local-sockets-where-appropriate.patch<br>
=C2=A0delete mode 100644 meta-oe/recipes-devtools/android-tools/android-too=
ls/core/0003-adb-define-shell-command.patch<br>
=C2=A0delete mode 100644 meta-oe/recipes-devtools/android-tools/android-too=
ls/core/0004-adb-Fix-build-on-big-endian-systems.patch<br>
=C2=A0delete mode 100644 meta-oe/recipes-devtools/android-tools/android-too=
ls/core/0005-adb-add-base64-implementation.patch<br>
=C2=A0delete mode 100644 meta-oe/recipes-devtools/android-tools/android-too=
ls/core/0006-adb-Musl-fixes.patch<br>
=C2=A0delete mode 100644 meta-oe/recipes-devtools/android-tools/android-too=
ls/core/0007-adb-usb_linux.c-fix-build-with-glibc-2.28.patch<br>
=C2=A0delete mode 100644 meta-oe/recipes-devtools/android-tools/android-too=
ls/core/0008-adb-Allow-adbd-to-be-ran-as-root.patch<br>
=C2=A0delete mode 100644 meta-oe/recipes-devtools/android-tools/android-too=
ls/core/0009-mkbootimg-Add-dt-parameter-to-specify-DT-image.patch<br>
=C2=A0delete mode 100644 meta-oe/recipes-devtools/android-tools/android-too=
ls/core/0010-Use-linux-capability.h-on-linux-systems-too.patch<br>
=C2=A0delete mode 100644 meta-oe/recipes-devtools/android-tools/android-too=
ls/core/0011-Remove-bionic-specific-calls.patch<br>
=C2=A0delete mode 100644 meta-oe/recipes-devtools/android-tools/android-too=
ls/core/0012-Fix-implicit-declaration-of-stlcat-strlcopy-function.patch<br>
=C2=A0delete mode 100644 meta-oe/recipes-devtools/android-tools/android-too=
ls/core/0013-adb-Support-riscv64.patch<br>
=C2=A0delete mode 100644 meta-oe/recipes-devtools/android-tools/android-too=
ls/core/0014-add-u3-ss-descriptor-support-for-adb.patch<br>
=C2=A0delete mode 100644 meta-oe/recipes-devtools/android-tools/android-too=
ls/core/0015-libsparse-Split-off-most-of-sparse_file_read_normal-.patch<br>
=C2=A0delete mode 100644 meta-oe/recipes-devtools/android-tools/android-too=
ls/core/0016-libsparse-Add-hole-mode-to-sparse_file_read.patch<br>
=C2=A0delete mode 100644 meta-oe/recipes-devtools/android-tools/android-too=
ls/core/0017-img2simg-Add-support-for-converting-holes-to-don-t-c.patch<br>
=C2=A0delete mode 100644 meta-oe/recipes-devtools/android-tools/android-too=
ls/core/adb_libssl_11.diff<br>
=C2=A0delete mode 100644 meta-oe/recipes-devtools/android-tools/android-too=
ls/core/b64_pton_function_decl.patch<br>
=C2=A0rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D&gt; recipe=
s-devtools}/android-tools/android-tools/debian/Add-riscv64-support.patch (1=
00%)<br>
=C2=A0rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D&gt; recipe=
s-devtools}/android-tools/android-tools/debian/Added-missing-headers.patch =
(100%)<br>
=C2=A0rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D&gt; recipe=
s-devtools}/android-tools/android-tools/debian/Nonnull.patch (100%)<br>
=C2=A0rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D&gt; recipe=
s-devtools}/android-tools/android-tools/debian/Vector-cast.patch (100%)<br>
=C2=A0rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D&gt; recipe=
s-devtools}/android-tools/android-tools/debian/add-missing-headers.patch (1=
00%)<br>
=C2=A0rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D&gt; recipe=
s-devtools}/android-tools/android-tools/debian/external/libunwind/20150704-=
CVE-2015-3239_dwarf_i.h.patch (100%)<br>
=C2=A0rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D&gt; recipe=
s-devtools}/android-tools/android-tools/debian/external/libunwind/legacy_bu=
ilt-in_sync_functions.patch (100%)<br>
=C2=A0rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D&gt; recipe=
s-devtools}/android-tools/android-tools/debian/external/libunwind/libunwind=
-fix-strchr-conformance-to-ISO-C23.patch (100%)<br>
=C2=A0rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D&gt; recipe=
s-devtools}/android-tools/android-tools/debian/external/libunwind/libunwind=
-guard-unreachable-macro-to-avoid-redefinit.patch (100%)<br>
=C2=A0rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D&gt; recipe=
s-devtools}/android-tools/android-tools/debian/external/libunwind/user_pt_r=
egs.patch (100%)<br>
=C2=A0rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D&gt; recipe=
s-devtools}/android-tools/android-tools/debian/fix-attribute-issue-with-gcc=
.patch (100%)<br>
=C2=A0rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D&gt; recipe=
s-devtools}/android-tools/android-tools/debian/fix-build-on-non-x86.patch (=
100%)<br>
=C2=A0rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D&gt; recipe=
s-devtools}/android-tools/android-tools/debian/fix-gettid-exception-declara=
tion.patch (100%)<br>
=C2=A0rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D&gt; recipe=
s-devtools}/android-tools/android-tools/debian/fix-standard-namespace-error=
s.patch (100%)<br>
=C2=A0rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D&gt; recipe=
s-devtools}/android-tools/android-tools/debian/hard-code-build-number.patch=
 (100%)<br>
=C2=A0rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D&gt; recipe=
s-devtools}/android-tools/android-tools/debian/libusb-header-path.patch (10=
0%)<br>
=C2=A0rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D&gt; recipe=
s-devtools}/android-tools/android-tools/debian/move-log-file-to-proper-dir.=
patch (100%)<br>
=C2=A0rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D&gt; recipe=
s-devtools}/android-tools/android-tools/debian/simg_dump-python3.patch (100=
%)<br>
=C2=A0rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D&gt; recipe=
s-devtools}/android-tools/android-tools/debian/stdatomic.patch (100%)<br>
=C2=A0rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D&gt; recipe=
s-devtools}/android-tools/android-tools/debian/stub-out-fastdeploy.patch (1=
00%)<br>
=C2=A0rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D&gt; recipe=
s-devtools}/android-tools/android-tools/debian/system/core/Add-riscv64-supp=
ort.patch (100%)<br>
=C2=A0rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D&gt; recipe=
s-devtools}/android-tools/android-tools/debian/system/core/Added-missing-he=
aders.patch (100%)<br>
=C2=A0rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D&gt; recipe=
s-devtools}/android-tools/android-tools/debian/system/core/Nonnull.patch (1=
00%)<br>
=C2=A0rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D&gt; recipe=
s-devtools}/android-tools/android-tools/debian/system/core/Vector-cast.patc=
h (100%)<br>
=C2=A0rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D&gt; recipe=
s-devtools}/android-tools/android-tools/debian/system/core/add-missing-head=
ers.patch (100%)<br>
=C2=A0rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D&gt; recipe=
s-devtools}/android-tools/android-tools/debian/system/core/android-tools-sc=
ope-write-macro-to-prevent-conflict-.patch (100%)<br>
=C2=A0rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D&gt; recipe=
s-devtools}/android-tools/android-tools/debian/system/core/fix-attribute-is=
sue-with-gcc.patch (100%)<br>
=C2=A0rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D&gt; recipe=
s-devtools}/android-tools/android-tools/debian/system/core/fix-build-on-non=
-x86.patch (100%)<br>
=C2=A0rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D&gt; recipe=
s-devtools}/android-tools/android-tools/debian/system/core/fix-gettid-excep=
tion-declaration.patch (100%)<br>
=C2=A0rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D&gt; recipe=
s-devtools}/android-tools/android-tools/debian/system/core/fix-standard-nam=
espace-errors.patch (100%)<br>
=C2=A0rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D&gt; recipe=
s-devtools}/android-tools/android-tools/debian/system/core/hard-code-build-=
number.patch (100%)<br>
=C2=A0rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D&gt; recipe=
s-devtools}/android-tools/android-tools/debian/system/core/libusb-header-pa=
th.patch (100%)<br>
=C2=A0rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D&gt; recipe=
s-devtools}/android-tools/android-tools/debian/system/core/libziparchive-fi=
x-missing-fixed-width-integer-types-.patch (100%)<br>
=C2=A0rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D&gt; recipe=
s-devtools}/android-tools/android-tools/debian/system/core/move-log-file-to=
-proper-dir.patch (100%)<br>
=C2=A0rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D&gt; recipe=
s-devtools}/android-tools/android-tools/debian/system/core/simg_dump-python=
3.patch (100%)<br>
=C2=A0rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D&gt; recipe=
s-devtools}/android-tools/android-tools/debian/system/core/stdatomic.patch =
(100%)<br>
=C2=A0rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D&gt; recipe=
s-devtools}/android-tools/android-tools/debian/system/core/stub-out-fastdep=
loy.patch (100%)<br>
=C2=A0rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D&gt; recipe=
s-devtools}/android-tools/android-tools/debian/system/core/throw-exception-=
on-unknown-os.patch (100%)<br>
=C2=A0rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D&gt; recipe=
s-devtools}/android-tools/android-tools/debian/throw-exception-on-unknown-o=
s.patch (100%)<br>
=C2=A0delete mode 100644 meta-oe/recipes-devtools/android-tools/android-too=
ls/<a href=3D"http://ext4_utils.mk" rel=3D"noreferrer" target=3D"_blank">ex=
t4_utils.mk</a><br>
=C2=A0delete mode 100644 meta-oe/recipes-devtools/android-tools/android-too=
ls/extras/0001-ext4_utils-remove-selinux-extensions.patch<br>
=C2=A0delete mode 100644 meta-oe/recipes-devtools/android-tools/android-too=
ls/extras/0002-ext4_utils-add-o-argument-to-preserve-ownership.patch<br>
=C2=A0delete mode 100644 meta-oe/recipes-devtools/android-tools/android-too=
ls/extras/0003-ext4_utils-drop-unused-parameter-from-allocate_inode.patch<b=
r>
=C2=A0delete mode 100644 meta-oe/recipes-devtools/android-tools/android-too=
ls/<a href=3D"http://fastboot.mk" rel=3D"noreferrer" target=3D"_blank">fast=
boot.mk</a><br>
=C2=A0delete mode 100644 meta-oe/recipes-devtools/android-tools/android-too=
ls/gitignore<br>
=C2=A0delete mode 100644 meta-oe/recipes-devtools/android-tools/android-too=
ls/libselinux/0001-Remove-bionic-specific-calls.patch<br>
=C2=A0delete mode 100644 meta-oe/recipes-devtools/android-tools/android-too=
ls/libselinux/0001-libselinux-Do-not-define-gettid-if-glibc-2.30-is-use.pat=
ch<br>
=C2=A0delete mode 100644 meta-oe/recipes-devtools/android-tools/android-too=
ls/<a href=3D"http://mkbootimg.mk" rel=3D"noreferrer" target=3D"_blank">mkb=
ootimg.mk</a><br>
=C2=A0rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D&gt; recipe=
s-devtools}/android-tools/android-tools/remount (100%)<br>
=C2=A0rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D&gt; recipe=
s-devtools}/android-tools/android-tools/<a href=3D"http://rules_yocto.mk" r=
el=3D"noreferrer" target=3D"_blank">rules_yocto.mk</a> (100%)<br>
=C2=A0rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D&gt; recipe=
s-devtools}/android-tools/<a href=3D"http://android-tools_29.0.6.r14.bb" re=
l=3D"noreferrer" target=3D"_blank">android-tools_29.0.6.r14.bb</a> (96%)<br=
>
=C2=A0delete mode 100644 meta-oe/recipes-devtools/android-tools/<a href=3D"=
http://android-tools_5.1.1.r37.bb" rel=3D"noreferrer" target=3D"_blank">and=
roid-tools_5.1.1.r37.bb</a><br>
<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#125864): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/125864" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/125864</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118576547/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/118576547/1997914</a><br>
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

--00000000000034c4fa064ec3a20c--

