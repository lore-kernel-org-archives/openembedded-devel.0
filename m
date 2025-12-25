Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AC30E7AD67
	for <webhook@archiver.kernel.org>; Thu, 25 Dec 2025 19:22:03 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.143463.1766690514852842079
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Dec 2025 11:21:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VqPV5cZD;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47755de027eso39699465e9.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 Dec 2025 11:21:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766690513; x=1767295313; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=bSy6wFShpbI37jR2+yapSDj8t+UbiXIVH46mHFV5fQg=;
        b=VqPV5cZDMozKdkxMrv0rNni75ewaaUB61f+mjoPRu23o08428+D//SIjLItlQWqdAy
         J76tGM7j5GvG8SMHnLMuLP/ni/wbYTWepZaC4lEJHxUS3idUTjGpkvYmdUdOd1xj/jl0
         DmNj29Q4nNdAhZwwk7beqaL0SB/B83LrNJWIC9BFzJdo1UrmgNPecCnl7dHCj+oRCXT3
         5CdM0G/aUdl/Qc40nleZ7cDWTs6YKPOXzR1MgGMkfgWJK0RIhht5738gQz+S584Te5mE
         SakASfFofimchBmkfti2IqQGRLtbiKVkx8ELYQO0LLDZDqaHK8z6kIwe3cFResZMVhL0
         m7YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766690513; x=1767295313;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bSy6wFShpbI37jR2+yapSDj8t+UbiXIVH46mHFV5fQg=;
        b=BwTJ3+F76Wee7bIoErb17Ot0lpiCJQ0rb/oy3MtXF4Ym/BQ2H3DNLOFzzYCpc2fFTc
         Eq7kk0AkZ1CmwjDnv9odDItFfg+Xlwk5HSdQIOJuGD/B2we3l/+dLxuoCSL3gFuzwqlk
         T9pKCvS6xwiON0m72lZ/dBi2OswkspElSrirGao81PDhYfOTGE41NSt+mSH6M9+z5st9
         mTtrZwyAvpfmxfHiJzJ8HFZPpGmnYZ5shufX4cS1WdHJVA6SLYZdiQnujkBrwMvptIiZ
         Dio1N9q2h1dm7ADPMpQukxmEri7+dKmbCpsv4TV1fSklHfyI+xj3dYcvYQeqvWKc18p1
         Kt9w==
X-Gm-Message-State: AOJu0YzV1i2ZC/nL8N5FvMgUZrit6oBEapXNNH+36gOY0+6GAWyTyaYS
	+dOxGsZ0v6F9vNb+CYpuLdym2NqeiqaWTCbnL+oHiuqVL03w64j36c9RAGOHWQ==
X-Gm-Gg: AY/fxX4XQunw3zFKSwyPW0lUJFamkrmPaj6Rf78tHyWjn3Fea7x7CktYDg4HfnAU55Y
	wMzTy0ryhqhbCN7ZjXRaf4TeEuh2bA8D0bfOCAsYMgRlI8Xk4H6tJjDiKzYY4RNyfW8D4vyjUdb
	He8F/RevA7H6km+bWeSfu0XGoAJcoOAcRDw/jFF9y9oyceA8O8GYKcO6kGsrn1OQZ3+6DhNqeB0
	9PU189PKh0bbQTAlyWpHy/xTThv77WhGOmX1Np0CdCfIPhmU12sdEIu3PM+acvg5pCHrHs/mXbA
	848hgiEnIweYeXakhR/Ew/wh+n3d+qcZHgCDPG9zZblu4AOVNBQaGVbh0agq5KzyP8YOVyabEl7
	FPi+qkAPb4CUAX59XoJm3/Dl5EBMH6GOi+aftUVJSKbLAS3+9emOkSnP8luE7E37D3ZZas+WRgI
	UrvooD2PXC
X-Google-Smtp-Source: AGHT+IG9eX1B9GQr1m+Ym0BG5NNa1rl4iBgRTmWuXUBggRMugnYUhIE3T60QZngdGd9AeCT+d/Tzfw==
X-Received: by 2002:a05:6000:420a:b0:431:864:d492 with SMTP id ffacd0b85a97d-4324e50600dmr23135979f8f.36.1766690512695;
        Thu, 25 Dec 2025 11:21:52 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1af2bsm41545758f8f.1.2025.12.25.11.21.52
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Dec 2025 11:21:52 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 1/2] cifs-utils: upgrade 7.0 -> 7.4
Date: Thu, 25 Dec 2025 20:21:50 +0100
Message-ID: <20251225192151.3580069-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Dec 2025 19:22:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122931

Contains fix for CVE-2025-2312

The recipe installs two scripts in bindir - this is nothing new.
But the shebang has changed from "/usr/bin/env python3" to
"/usr/bin/python3" - these were always python scripts, but
they weren't recognized as such during the QA checks, and
python wasn't installed as a runtime dependency.

Now QA check is complaining about missing python in RDEPENDS.
To avoid mandatory python installation, package the scripts
separately in cifs-utils-scripts package.

Shortlog:
cifs-utils: bump version to 7.4
mount.cifs: retry mount on -EINPROGRESS
cifs.upcall: correctly treat UPTARGET_UNSPECIFIED as UPTARGET_APP
cifscreds: use <libgen.h> for basename
getcifsacl, setcifsacl: use <libgen.h> for basename
cifs.upcall: fix memory leaks in check_service_ticket_exits()
cifs-utils: bump version to 7.3
Fix regression in mount.cifs with guest mount option
resolve_host.c: Initialize site_name
cldap_ping: Fix socket fd leak
cifs-utils: bump version to 7.2
getcifsacl: fix return code check for getting full ACL
cifs-utils: add documentation for upcall_target
cifs-utils: avoid using mktemp when updating mtab
cldap_ping.c: add missing <sys/types.h> include
configure.ac: libtalloc is now mandatory
cifscreds: allow user to set the key's timeout
cifscreds: use continue instead of break when matching commands
Do not pass passwords with sec=none and sec=krb5
docs: add esize description
docs: add max_cached_dirs description
docs: update actimeo description
Fix compiler warnings in mount.cifs
CIFS.upcall to accomodate new namespace mount opt
cifs-utils: Skip TGT check if valid service ticket is already available
use enums to check password or password2 in set_password, get_password_from_file and minor documentation additions
cifs-utils: support and document password2 mount option
smbinfo: add bash completion support for filestreaminfo, keys, gettconinfo
cifs-utils: bump version to 7.1
cifs: update documentation for sloppy mount option
docs: add closetimeo description
docs: add compress description
checkopts: update it to work with latest kernel version
cifs-utils: add documentation for multichannel and max_channels
cifs-utils: smbinfo: add gettconinfo command
Implement CLDAP Ping to find the closest site
mount.cifs.rst: update section about xattr/acl support
mount.cifs.rst: add missing reference for sssd
getcifsacl, setcifsacl: add missing <endian.h> include for le32toh
getcifsacl, setcifsacl: add missing <linux/limits.h> include for XATTR_SIZE_MAX
cifs-utils: Make automake treat /sbin as exec, not data
pam_cifscreds: fix warning on NULL arg passed to %s in pam_syslog()
cifs.upcall: fix UAF in get_cachename_from_process_env()
cifs-utils: add documentation for acregmax and acdirmax
setcifsacl: Fix uninitialized value.
Use explicit "#!/usr/bin/python3"

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../cifs/{cifs-utils_7.0.bb => cifs-utils_7.4.bb}        | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/cifs/{cifs-utils_7.0.bb => cifs-utils_7.4.bb} (84%)

diff --git a/meta-networking/recipes-support/cifs/cifs-utils_7.0.bb b/meta-networking/recipes-support/cifs/cifs-utils_7.4.bb
similarity index 84%
rename from meta-networking/recipes-support/cifs/cifs-utils_7.0.bb
rename to meta-networking/recipes-support/cifs/cifs-utils_7.4.bb
index e2918503be..9c7b9e3246 100644
--- a/meta-networking/recipes-support/cifs/cifs-utils_7.0.bb
+++ b/meta-networking/recipes-support/cifs/cifs-utils_7.4.bb
@@ -4,8 +4,8 @@ SECTION = "otherosfs"
 LICENSE = "GPL-3.0-only & LGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRCREV = "316522036133d44ed02cd39ed2748e2b59c85b30"
-SRC_URI = "git://git.samba.org/cifs-utils.git;branch=master"
+SRCREV = "edac7178bec9520fb57d14946e67f5dd33b82d43"
+SRC_URI = "git://git.samba.org/cifs-utils.git;branch=master;tag=${BP}"
 
 DEPENDS += "libtalloc"
 
@@ -38,6 +38,11 @@ do_install:append() {
     fi
 }
 
+PACKAGE_BEFORE_PN = "${PN}-scripts"
 FILES:${PN} += "${base_libdir}/security"
 FILES:${PN}-dbg += "${base_libdir}/security/.debug"
+# these scripts are python, package them separately so python
+# won't be mandatory dependency
+FILES:${PN}-scripts = "${bindir}/smb2-quota ${bindir}/smbinfo"
+RDEPENDS:${PN}-scripts += "python3-core"
 RRECOMMENDS:${PN} = "kernel-module-cifs"

