Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B498F109B495
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 04:15:51 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5378.1775016946331731229
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 Mar 2026 21:15:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=aOmoKvFr;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=NHpCmVac;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6312HXB43081358
	for <openembedded-devel@lists.openembedded.org>; Wed, 1 Apr 2026 04:15:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=QXqIKqycl7WbExJLOswD8I5e1jAlyq1dKB7
	HztqlxzA=; b=aOmoKvFrVepeRRNEKIh+KPVZF+8CsN81m3PQ//YT1E8icF8hyrA
	o4CsmR2W3awJtvXH+fQPYCHQYl6Y5UJys9GXgf1VZftmpEVskPGa7lXnExJVlZ+y
	uLJENp2fueHxyJeNxc6SOuXOeyPB+A77S8jSC5sUg6AANTDYNLiaFIsjAAgDQi8u
	J0olMxAiBuqVQl15jko+6Anks8HjzXw5y3kR5SYxH0GNuJEphYzi+5xP0zW0MJTT
	bmvh0GSWuW2lMluLTlXlZWoaf1XMBW9K7aERiy2rbxkOK69q7WDaMyx9KVudLw9Y
	zvjNDOZviJFZgdLcB+YS3t7/NInCtFyNk3g==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8kdkt42v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 01 Apr 2026 04:15:45 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82cf0130d17so118047b3a.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 31 Mar 2026 21:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775016945; x=1775621745; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=QXqIKqycl7WbExJLOswD8I5e1jAlyq1dKB7HztqlxzA=;
        b=NHpCmVactBO0JQCMP3Dg8UcGiJQ3NaqargPQ74EMxlfGQNQYZxPP++7O6Bd+pwmaj2
         7TlBa8lo5COGrL72xErTH82nMDpn7eY3yGR9NwnUAEhm/NTft9dxSUuN8T+bW1jJkspi
         +nkun9jQ5v1nZcZuzHlAYU2aDFIBLbeXzCdaNxpgFFrEj6TnqeKngOZRr0mVDnrTFxig
         mkkSXSy8Fb2aufPQ4TdC7YGk/spJs7h4mdehzD154+SeKyS5hmuuJV8zsxmGAMN9c7lK
         Yj2499VSB0tfbW/eHSe0K9A2EPQjjO+OQMCg09DS+g5fp041RJsMxdtXE17uHkotoX6z
         NbEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775016945; x=1775621745;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QXqIKqycl7WbExJLOswD8I5e1jAlyq1dKB7HztqlxzA=;
        b=CbizreSfhy+4eUs65o8nB8wb/eQiPt8sFXcwtbNY1JA7yWPWgf1gAP2/zFibpE/y/h
         +7z0VzjMUk/XlDsUtDR8TgMchIlyMQnxNuJBqqdG+faQC4TQPQDE+5dpgddRhznijnnx
         C/tv3hXewIbsnK9gRl67G7VWmgmVRgg/YiwFD0nV6bqfgsSz4EypJ2cPTMdLmW91Qq4A
         BNJdpvr+FukN+nB9EN/SE8+/31C6OWoy/m/+RvL8iMzBPyPl9Ob5F+e3Pbn2N2QImqaZ
         xnxExFqGDlQXrD8CgcPdcKMUMZqF0LeaHTaUuZwspWualeRJodaGM3BSrqH8CKiNNgYq
         HL6w==
X-Gm-Message-State: AOJu0YwgSa2IFKmbDJt5pGoNuPzdzG3VQgFVgWNF3mJi6TCphY004SOV
	vqrQ6AdkA8tHAXY/8mrWBXDsYSZGZOval0soFj0+My8QH5aqDl9qH/iMefIjlrW9UawFGGK8sxj
	YZ0eO6jB7SkVLWePvTVzzwj83Lx0TznfekRc7p12EI3lOZiiEBHhC1x/OPIS/7qT8LnDnJkDDpn
	sxjh7N8tPWTUiLqm8WYPU=
X-Gm-Gg: ATEYQzxajC8flOsw/A8EWKmtSZgW3slUs+GDV79oabb4Oa3yNUvU+L5HA9dTDGQFQF6
	++k0RbNTa6H8ebgH7BF9FrrXKi3Z1vA5aTZ58EAc37OMg7fz++HIwQMKDpnIWcvuWOBQ/81xGdH
	5FxuMa2c0YJlJirSpDBoLkyXGoR4L1l3MIZwEcn6mLQCLGfMbcn6BppGBwOouQarcl0lNbqRrRx
	ugzOOjssh5u7DxR1sihT97tZ/4H3ayWhYkDB5+ZYDl2Ow59s8AhMkcPHR9o0Hn4aYl9yZiP3tIj
	nmV3hwqH8igDGBgYeqWwaeR6iDONkb3QzvWtBfxUKk2iMz94m2xPP6M8P1RZ7v8Mt4Iacq3eFv7
	ZOqQb5m/0MEnt7T3TRDh0wcUVF8S9FXqywmV0+gPLRgkymAwFoLTC
X-Received: by 2002:a05:6a00:4f95:b0:829:942e:76c3 with SMTP id d2e1a72fcca58-82ce895d356mr2109867b3a.25.1775016944792;
        Tue, 31 Mar 2026 21:15:44 -0700 (PDT)
X-Received: by 2002:a05:6a00:4f95:b0:829:942e:76c3 with SMTP id d2e1a72fcca58-82ce895d356mr2109829b3a.25.1775016944083;
        Tue, 31 Mar 2026 21:15:44 -0700 (PDT)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca862dee1sm12915438b3a.61.2026.03.31.21.15.42
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 21:15:43 -0700 (PDT)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] netcf: remove recipe
Date: Wed,  1 Apr 2026 09:45:39 +0530
Message-ID: <20260401041539.112052-1-anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDAzMiBTYWx0ZWRfX80ycrzWV6SoX
 UZmWcL0a2bMeeu2e3uIkiUthor65IALVZ6sXklHc3eCtefhwQEbpeTt9wPr71q/7VyEze47SoBj
 yKY2HitMTBiF6CccIdPnazb8EX/JtrBB/7BKw5cR/brrAxDpnpvz67vv9r3/yzwIA8y1FUwuosj
 0ZazI85Sk+modPWJe+WPicHzkZ0VtDHfNqt6u+/C+I9F4GRjyyHb8CmwO3V1jy0ViaaqR5L5g98
 xHw9vDv07+De5XCsAHG5Vog38qbgdZxXnK2EbDT8fUed2tXaqlHdJ1dm9VUqrV1DzSmhtHTh+zf
 bbqpOWtuO152hUidNrov24cd2plA/AFf3yR97an32Ign5HeGcT8MaQ1H8jQH+sEVolFF+ZO40Kb
 NRvB5tDQGZyz5nGikmDV8yBFlcURvHzEW/S9nx/k2H/ZCDwUedObkmQnj3MxUm49w/8uPc+bCaX
 XsrSTY4iAHG1ibImZSA==
X-Proofpoint-GUID: -93VQAY8cRCa9U2QSLfRjyhiy4ZaQv25
X-Authority-Analysis: v=2.4 cv=YsQChoYX c=1 sm=1 tr=0 ts=69cc9bf1 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=p0WdMEafAAAA:8
 a=5rxgeBVgAAAA:8 a=mDV3o1hIAAAA:8 a=lViJMyulAAAA:8 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=uRLC16mrIlSfvzyOK74A:9 a=zc0IvFSfCIW2DFIPzwfm:22
 a=PwKx63F5tFurRwaNxrlG:22 a=gb9IC-u5QvZuJU0a8fSk:22
X-Proofpoint-ORIG-GUID: -93VQAY8cRCa9U2QSLfRjyhiy4ZaQv25
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_02,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 phishscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604010032
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Apr 2026 04:15:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125894

From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>

It isn't maintained anymore and requires workarounds when gnulib is
updated.

It was only used by libvirt and with the upstream [1] and meta-virt
changes to not require it anymore, this can be dropped.

[1] https://gitlab.com/libvirt/libvirt/-/commit/35d5b26aa433bd33f4b33be3dbb67313357f97f9

Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
---
 .../packagegroup-meta-networking.bb           |  1 -
 ...nulib-read_file-fread_file-signature.patch | 94 -------------------
 ...bootstrap-with-newer-gnulib-automake.patch | 61 ------------
 .../recipes-support/netcf/netcf_0.2.8.bb      | 73 --------------
 4 files changed, 229 deletions(-)
 delete mode 100644 meta-networking/recipes-support/netcf/netcf/0001-Adopt-to-new-gnulib-read_file-fread_file-signature.patch
 delete mode 100644 meta-networking/recipes-support/netcf/netcf/0001-netcf-fix-bootstrap-with-newer-gnulib-automake.patch
 delete mode 100644 meta-networking/recipes-support/netcf/netcf_0.2.8.bb

diff --git a/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb b/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
index cc0445aaed..21c9dce4e1 100644
--- a/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
+++ b/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
@@ -216,7 +216,6 @@ RDEPENDS:packagegroup-meta-networking-support = "\
     ndisc6 \
     tcpdump \
     tcpslice \
-    netcf \
     tnftp \
     traceroute \
     tunctl \
diff --git a/meta-networking/recipes-support/netcf/netcf/0001-Adopt-to-new-gnulib-read_file-fread_file-signature.patch b/meta-networking/recipes-support/netcf/netcf/0001-Adopt-to-new-gnulib-read_file-fread_file-signature.patch
deleted file mode 100644
index 83fdfded52..0000000000
--- a/meta-networking/recipes-support/netcf/netcf/0001-Adopt-to-new-gnulib-read_file-fread_file-signature.patch
+++ /dev/null
@@ -1,94 +0,0 @@
-From af256680926e166ac21bc0f11172ea6c077a9b55 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 9 Mar 2024 10:40:48 -0800
-Subject: [PATCH] Adopt to new gnulib read_file/fread_file signature
-
-It now expects a flag parameter in latest gnulib
-see [1]
-
-[1] https://public-inbox.org/bug-gnulib/87tv01c1z2.fsf-ueno@gnu.org/
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/dutil_linux.c  | 4 ++--
- src/dutil_posix.c  | 2 +-
- src/ncftool.c      | 2 +-
- src/ncftransform.c | 2 +-
- 4 files changed, 5 insertions(+), 5 deletions(-)
-
---- a/src/dutil_linux.c
-+++ b/src/dutil_linux.c
-@@ -1113,7 +1113,7 @@ static void add_link_info(struct netcf *
- 
-     xasprintf(&path, "/sys/class/net/%s/operstate", ifname);
-     ERR_NOMEM(!path, ncf);
--    state = read_file(path, &length);
-+    state = read_file(path, 0, &length);
-     if (!state) {
-         /* missing operstate is *not* an error. It could be due to an
-          * alias interface, which has no entry in /sys/class/net at
-@@ -1132,7 +1132,7 @@ static void add_link_info(struct netcf *
-         FREE(path);
-         xasprintf(&path, "/sys/class/net/%s/speed", ifname);
-         ERR_NOMEM(path == NULL, ncf);
--        speed = read_file(path, &length);
-+        speed = read_file(path, 0, &length);
-         if (!speed && errno == EINVAL) {
-             /* attempts to read $ifname/speed result in EINVAL if the
-              * interface is ifconfiged down (which isn't exactly the
---- a/src/dutil_posix.c
-+++ b/src/dutil_posix.c
-@@ -211,7 +211,7 @@ int run_program(struct netcf *ncf, const
-                        "Failed to create file stream for output while executing '%s': %s",
-                        argv_str, errbuf);
- 
--    *output = fread_file(outfile, &outlen);
-+    *output = fread_file(outfile, 0, &outlen);
-     ERR_THROW_STRERROR(*output == NULL, ncf, EEXEC,
-                        "Error while reading output from execution of '%s': %s",
-                        argv_str, errbuf);
---- a/src/ncftool.c
-+++ b/src/ncftool.c
-@@ -351,7 +351,7 @@ static int cmd_define(const struct comma
-     struct netcf_if *nif = NULL;
-     int result = CMD_RES_ERR;
- 
--    xml = read_file(fname, &length);
-+    xml = read_file(fname, 0, &length);
-     if (xml == NULL) {
-         fprintf(stderr, "Failed to read %s\n", fname);
-         goto done;
---- a/src/ncftransform.c
-+++ b/src/ncftransform.c
-@@ -54,7 +54,7 @@ int main(int argc, char **argv) {
-     if (argc != 3 || (STRNEQ(argv[1], "get") && STRNEQ(argv[1], "put")))
-         die("Usage: ncftransform (put|get) FILE\n");
- 
--    in_xml = read_file(argv[2], &length);
-+    in_xml = read_file(argv[2], 0, &length);
-     if (in_xml == NULL)
-         die("Failed to read %s\n", argv[2]);
- 
---- a/src/internal.h
-+++ b/src/internal.h
-@@ -30,6 +30,7 @@
- 
- #include <string.h>
- #include <stdarg.h>
-+#include <stdlib.h>
- 
- #include <libxslt/transform.h>
- #include <libxml/relaxng.h>
-@@ -85,6 +86,11 @@
- #define ATTRIBUTE_NOINLINE
- #endif                                   /* __GNUC__ */
- 
-+#ifndef REALLOC_N
-+# define REALLOC_N(ptr, count) \
-+    (((ptr) = realloc((ptr), sizeof(*(ptr)) * (count))) == NULL ? -1 : 0)
-+#endif
-+
- /* This needs ATTRIBUTE_RETURN_CHECK */
- #include "ref.h"
- 
diff --git a/meta-networking/recipes-support/netcf/netcf/0001-netcf-fix-bootstrap-with-newer-gnulib-automake.patch b/meta-networking/recipes-support/netcf/netcf/0001-netcf-fix-bootstrap-with-newer-gnulib-automake.patch
deleted file mode 100644
index 62daeff812..0000000000
--- a/meta-networking/recipes-support/netcf/netcf/0001-netcf-fix-bootstrap-with-newer-gnulib-automake.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From dded6e3321e304f50922e61c553d4e4eb0f80fd0 Mon Sep 17 00:00:00 2001
-From: Khem Raj <khem.raj@oss.qualcomm.com>
-Date: Sun, 22 Mar 2026 11:05:34 -0700
-Subject: [PATCH] netcf: fix bootstrap with newer gnulib/automake
-
-Upstream netcf is old enough that bootstrap/autoreconf now trips over:
-- gnulib-tool.py wrapper expectations in newer gnulib
-- stricter automake handling of AM_CFLAGS += from generated gnulib.mk
-- subdir source warnings
-- deprecated INCLUDES usage
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
----
- configure.ac             | 2 +-
- gnulib/lib/Makefile.am   | 2 +-
- gnulib/tests/Makefile.am | 2 ++
- tests/Makefile.am        | 2 +-
- 4 files changed, 5 insertions(+), 3 deletions(-)
-
---- a/configure.ac
-+++ b/configure.ac
-@@ -3,7 +3,7 @@ AC_CONFIG_SRCDIR([src/netcf.c])
- AC_CONFIG_AUX_DIR([build-aux])
- AC_CONFIG_MACRO_DIR([gnulib/m4])
- AC_CONFIG_HEADERS([config.h])
--AM_INIT_AUTOMAKE([-Wno-portability 1.11 color-tests parallel-tests])
-+AM_INIT_AUTOMAKE([-Wno-portability 1.11 subdir-objects color-tests parallel-tests])
- AM_SILENT_RULES([yes]) # make --enable-silent-rules the default.
- AC_CANONICAL_HOST
- 
---- a/gnulib/lib/Makefile.am
-+++ b/gnulib/lib/Makefile.am
-@@ -13,4 +13,4 @@ CLEANFILES=
- 
- include gnulib.mk
- 
--INCLUDES = $(GETTEXT_CPPFLAGS)
-+AM_CPPFLAGS = $(GETTEXT_CPPFLAGS)
---- a/gnulib/tests/Makefile.am
-+++ b/gnulib/tests/Makefile.am
-@@ -3,6 +3,6 @@
- ## Copyright (C) 2011 Red Hat, Inc.
- ## See COPYING.LIB for the License of this software
- 
--include gnulib.mk
-+AM_CFLAGS =
- 
--INCLUDES = $(GETTEXT_CPPFLAGS)
-+include gnulib.mk
---- a/tests/Makefile.am
-+++ b/tests/Makefile.am
-@@ -14,7 +14,7 @@ TESTS_ENVIRONMENT = \
-   abs_top_builddir='$(abs_top_builddir)' \
-   abs_top_srcdir='$(abs_top_srcdir)'
- 
--INCLUDES = -I$(top_srcdir)/src
-+AM_CPPFLAGS = -I$(top_srcdir)/src
- 
- TESTS=
- check_PROGRAMS=
diff --git a/meta-networking/recipes-support/netcf/netcf_0.2.8.bb b/meta-networking/recipes-support/netcf/netcf_0.2.8.bb
deleted file mode 100644
index a73531de82..0000000000
--- a/meta-networking/recipes-support/netcf/netcf_0.2.8.bb
+++ /dev/null
@@ -1,73 +0,0 @@
-SUMMARY = "netcf"
-DESCRIPTION = "netcf is a cross-platform network configuration library."
-HOMEPAGE = "https://pagure.io/netcf"
-SECTION = "libs"
-LICENSE = "LGPL-2.1-only"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=fb919cc88dbe06ec0b0bd50e001ccf1f"
-
-SRCREV = "2c5d4255857531bc09d91dcd02e86545f29004d4"
-PV .= "+git"
-
-SRC_URI = "git://pagure.io/netcf.git;protocol=https;branch=master \
-           file://0001-netcf-fix-bootstrap-with-newer-gnulib-automake.patch \
-           file://0001-Adopt-to-new-gnulib-read_file-fread_file-signature.patch"
-
-UPSTREAM_CHECK_GITTAGREGEX = "release-(?P<pver>(\d+(\.\d+)+))"
-
-DEPENDS += "augeas libnl libxslt libxml2"
-
-do_configure[depends] += "${MLPREFIX}gnulib:do_populate_sysroot"
-
-
-inherit gettext autotools perlnative pkgconfig systemd
-
-EXTRA_OECONF:append:class-target = " --with-driver=redhat"
-
-PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
-PACKAGECONFIG[systemd] = "--with-sysinit=systemd,--with-sysinit=initscripts,"
-
-do_configure:prepend() {
-    currdir=`pwd`
-    cd ${S}
-
-    # avoid bootstrap cloning gnulib on every configure
-    # the dir starts out empty from the pkg, but unconditionally blow it
-    # away so if we reconfigure due to gnulib sysroot sig changes, we will
-    # get the newer gnulib content into the build here.
-    rm -rf ${S}/.gnulib
-    cp -rf ${STAGING_DATADIR}/gnulib ${S}/.gnulib
-
-    # --force to avoid errors on reconfigure e.g if recipes changed we depend on
-    # | bootstrap: running: libtoolize --quiet
-    # | libtoolize:   error: 'libltdl/COPYING.LIB' exists: use '--force' to overwrite
-    # | ...
-    ./bootstrap --force --no-git --gnulib-srcdir=.gnulib
-
-    cd $currdir
-}
-
-do_install:append() {
-    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
-       install -d ${D}${systemd_unitdir}/system
-       if [ -d "${D}${libdir}/systemd/system" ]; then
-           if [ "${systemd_unitdir}" != "${libdir}/systemd" ] ; then
-               mv ${D}${libdir}/systemd/system/* ${D}${systemd_unitdir}/system/
-               rm -rf ${D}${libdir}/systemd/
-	   fi
-       elif [ "${systemd_unitdir}" != "${nonarch_libdir}/systemd" ] ; then
-           mv ${D}${nonarch_libdir}/systemd/system/* ${D}${systemd_unitdir}/system/
-           rm -rf ${D}${nonarch_libdir}/systemd/
-       fi
-    else
-       mv ${D}${sysconfdir}/rc.d/init.d/ ${D}${sysconfdir}
-       rm -rf ${D}${sysconfdir}/rc.d/
-    fi
-}
-
-FILES:${PN} += " \
-        ${libdir} \
-        ${nonarch_libdir} \
-        "
-
-SYSTEMD_SERVICE:${PN} = "netcf-transaction.service"
-- 
2.53.0


