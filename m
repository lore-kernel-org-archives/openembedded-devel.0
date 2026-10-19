Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1764.1792434895934375945
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Oct 2026 11:34:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=WMsGi5mt;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3acd21ba21aso1841127a91.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Oct 2026 11:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792434895; x=1793039695; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X1s9LTbTfkbKl+lu8EK3dOTGMpI7ceVE04w4Xy9ahJY=;
        b=WMsGi5mtk5g2Vvi1a67u4m/qIqZLBcbUdd6np73xo/noL/M3U3m6WrWkelp+4QCnwn
         02YJUZhLXC8RNUuS9Ty73SzXBPHCQj6u5w+xwhLh7KDtOi2IPZ+tjFFkQyE9vczz/tDr
         7VGw4mD8eFThxFT8iBjqN0F9kGveK2WNMdz7YV2wv2XY1gKTdcnQ2V7ZRFD4S7Tmus2q
         WKfpxenNGk74dTFUrkaS2huGyJ9jOK6Lh3VuYl3HdtGoakyRZ7de4qaOJAYRHjFqaCEZ
         NNkyOOeFob4TzQ91mVl+wfTrLMHpX0XpeCWDS6jfaFHQh+pJpdEwgXXeMMQx1Np2lzlr
         bYJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792434895; x=1793039695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X1s9LTbTfkbKl+lu8EK3dOTGMpI7ceVE04w4Xy9ahJY=;
        b=AMJPGcLb2b3WCYC9l/8cX8kj+ECMdTAnWaaYkh2ngOgwcOm8vnsC0EyQ7/ulYC33/Q
         g0HRAjvhlhAKusXXCzDVJnWZvmSMpyycG9hj2mHRq7nIkJNbHcpMlx82XZpEh/czzXmO
         J6hSNIES8nmPRceLC8qTJKpErTqP2GmWKP8cNr/i0LhNroTCknjICQj45nixZ97Q/rIz
         +FMHrKBr4R7l4vIZB4gGL3EpiH3nGrSVdbsKqAviViMwUduHQsiv/zXmBM4MkflG+x51
         RugnxqTmS4qmjuPJ+O4Q5nzoxJaDQAsbelFAZiz9xIrkhaQXhSX/MinB/O1sBQMPzTch
         8jUw==
X-Gm-Message-State: AFq9FYIxyC1aqzp5zS2hRfo7Dc8h+gHTDB3kBvuN1DcT1ZVdSSAfpoba
	wAesLnu2xg9anOmrVYC6d7gqeN4YDXMBXzv1l3hqsyvLXcX00Sp7RFSx2nUSTw==
X-Gm-Gg: AYBFou3xySGLBX8YuDhw9CKoNd6HphwacHhbio/Z5F0hMA7TAXk85d95C58p3IvbKYu
	8CPs4Rbbho8SXKj8JydZ6ImPFZpeSe3j8r05Yfyys6drYfj/gqsRYkLWVddBsBIUT6nfG2zXg9k
	rK/i65Y6fuNauHpeMOePwkTN7LDz/tpngoVmy2xALsY7aeFxABhyI1SN3MsjGToDuZPbPU1tjhz
	UHEum8VsXH1I7sekEpU+guxWqeX9pzTFnDgWNG2AwL7N4IwefpIUBaSFV8hL0TTvhfgu28wIsRH
	dVVDVPZ5gParIKCreJ+DolnOd05cNP373heQI5ui5PA/skSXP6oca6ud6NWw/0U74t371mhAcqy
	El0XMg0Kd2QTyyUngpvWHzqlDVSya23bud9tellgaBoYbOp3xtPaNyd9l0gRE3C11y3YI9E6rcW
	fF7JrL4nMOdWFMEYmwHti79wWQ9MPY9tLBUEknr26dk8p6MNYnmLf0Fae/hBWhxdsSM7Cyua7qs
	MczFK4U6NvwG09ep9MDtgYThnJ5IDYXYLAn44Q=
X-Received: by 2002:a17:90b:164b:b0:3ab:afca:1d79 with SMTP id 98e67ed59e1d1-3acef104234mr7254564a91.21.1792434895276;
        Mon, 19 Oct 2026 11:34:55 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd6549fb556sm4632865a12.22.2026.10.19.11.34.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 11:34:54 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-filesystems][PATCH 17/20] unionfs-fuse: upgrade 3.7 -> 3.8
Date: Tue, 20 Oct 2026 07:34:03 +1300
Message-ID: <20261019183407.1037972-17-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261019183407.1037972-1-ankur.tyagi85@gmail.com>
References: <20261019183407.1037972-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 19 Oct 2026 18:34:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131143
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

License-Update: copyright year updated[1]

Dropped patch that are merged in the upstream version.

Changelog:
- fix data corruption when copying files larger than 8 MiB concurrently in
  cow mode
- fix "bad address" error when setting a debug file with unionfsctl -p
- fix creating unix sockets on macos
- mount.unionfs helper no longer requires bash and accepts multiple -o
  options

PTEST pass:
root@qemux86-64:~# ptest-runner unionfs-fuse
START: ptest-runner
2026-10-18T23:02
BEGIN: /usr/lib/unionfs-fuse/ptest
...
END: /usr/lib/unionfs-fuse/ptest
2026-10-18T23:02
STOP: ptest-runner
TOTAL: 1 FAIL: 0

[1]https://github.com/rpodgorny/unionfs-fuse/commit/e3e8b289f19047d7c6309eff3dc7a2c505229b73

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../files/0001-fix-debug-ioctl-call.patch     | 58 -------------------
 ...nionfs-fuse_3.7.bb => unionfs-fuse_3.8.bb} |  5 +-
 2 files changed, 2 insertions(+), 61 deletions(-)
 delete mode 100644 meta-filesystems/recipes-filesystems/unionfs-fuse/files/0001-fix-debug-ioctl-call.patch
 rename meta-filesystems/recipes-filesystems/unionfs-fuse/{unionfs-fuse_3.7.bb => unionfs-fuse_3.8.bb} (79%)

diff --git a/meta-filesystems/recipes-filesystems/unionfs-fuse/files/0001-fix-debug-ioctl-call.patch b/meta-filesystems/recipes-filesystems/unionfs-fuse/files/0001-fix-debug-ioctl-call.patch
deleted file mode 100644
index a29128d22a..0000000000
--- a/meta-filesystems/recipes-filesystems/unionfs-fuse/files/0001-fix-debug-ioctl-call.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From bf552c479a0c0b0ef2d52d8456030c56b8cc6dbb Mon Sep 17 00:00:00 2001
-From: Gyorgy Sarvari <skandigraun@gmail.com>
-Date: Fri, 26 Dec 2025 19:33:54 +0100
-Subject: [PATCH] fix debug ioctl call
-
-When calling the ioctl to set a debug file, the ioctl expects to receive a datatype
-that is specified in the ioctl definition: char[PATHLEN_MAX]
-
-However when passing the pointer from getopts, this is only true if the passed path
-has the maximal allowed length. Since usually this path is shorter than the max,
-the kernel is trying to read over the end of the argument, and returns "EFAULT/Bad address".
-
-To solve this, copy the argument to a buffer that has the exact size of what the ioctl
-expects, and pass this buffer to the ioctl.
-
-Upstream-Status: Submitted [https://github.com/rpodgorny/unionfs-fuse/pull/164]
-Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
----
- src/unionfsctl.c | 11 +++++++----
- 1 file changed, 7 insertions(+), 4 deletions(-)
-
-diff --git a/src/unionfsctl.c b/src/unionfsctl.c
-index 74c4d33..efed505 100644
---- a/src/unionfsctl.c
-+++ b/src/unionfsctl.c
-@@ -44,25 +44,28 @@ int main(int argc, char **argv) {
- 
- 	int opt;
- 	const char* argument_param;
-+	char debug_file[PATHLEN_MAX];
- 	int debug_on_off;
- 	int ioctl_res;
- 	while ((opt = getopt(argc, argv, "d:p:")) != -1) {
- 		switch (opt) {
- 		case 'p':
--			argument_param = optarg;
--			if (strlen(argument_param) < 1) {
-+			if (strlen(optarg) < 1) {
- 				fprintf(stderr,
- 					"Not a valid debug path given!\n");
- 				print_help(progname);
- 				exit(1);
- 			}
- 
--			if (strlen(argument_param) > PATHLEN_MAX) {
-+			if (strlen(optarg) > PATHLEN_MAX) {
- 				fprintf(stderr, "Debug path too long!\n");
- 				exit(1);
- 			}
- 
--			ioctl_res = ioctl(fd, UNIONFS_SET_DEBUG_FILE, argument_param);
-+			memset(debug_file, 0, PATHLEN_MAX);
-+			strncpy(debug_file, optarg, PATHLEN_MAX - 1);
-+
-+			ioctl_res = ioctl(fd, UNIONFS_SET_DEBUG_FILE, debug_file);
- 			if (ioctl_res == -1) {
- 				fprintf(stderr, "debug-file ioctl failed: %s\n",
- 					strerror(errno) );
diff --git a/meta-filesystems/recipes-filesystems/unionfs-fuse/unionfs-fuse_3.7.bb b/meta-filesystems/recipes-filesystems/unionfs-fuse/unionfs-fuse_3.8.bb
similarity index 79%
rename from meta-filesystems/recipes-filesystems/unionfs-fuse/unionfs-fuse_3.7.bb
rename to meta-filesystems/recipes-filesystems/unionfs-fuse/unionfs-fuse_3.8.bb
index b5c5bb847c..e7bcd1ecc2 100644
--- a/meta-filesystems/recipes-filesystems/unionfs-fuse/unionfs-fuse_3.7.bb
+++ b/meta-filesystems/recipes-filesystems/unionfs-fuse/unionfs-fuse_3.8.bb
@@ -3,16 +3,15 @@ HOMEPAGE = "https://github.com/rpodgorny/unionfs-fuse"
 SECTION = "console/network"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://src/unionfs.c;beginline=3;endline=8;md5=30fa8de70fd8abab00b483a1b7943a32 \
-                    file://LICENSE;md5=0e75c95b3e0e1c01489b39e7fadd3e2d \
+                    file://LICENSE;md5=22a665a5eef3c10268acdee50e62d876 \
 "
 
 SRC_URI = "git://github.com/rpodgorny/${BPN}.git;branch=master;protocol=https;tag=v${PV} \
            file://run-ptest \
-           file://0001-fix-debug-ioctl-call.patch \
            file://0001-adapt-tests-to-ptest.patch \
 "
 
-SRCREV = "3fcbd11f78b9a9e02ea0e861d741840fe45dc9c8"
+SRCREV = "e3e8b289f19047d7c6309eff3dc7a2c505229b73"
 
 DEPENDS = "fuse3"
 RDEPENDS:${PN} = "bash"
