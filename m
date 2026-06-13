Return-Path: <patel.rajkumar@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A7E2CD98D2
	for <webhook@archiver.kernel.org>; Sat, 13 Jun 2026 12:11:43 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.89815.1781352698632364894
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Jun 2026 05:11:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=b/8Qqb8Y;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=jr1BNfb0;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: patel.rajkumar@oss.qualcomm.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65DAu6Lp2276180
	for <openembedded-devel@lists.openembedded.org>; Sat, 13 Jun 2026 12:11:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=3pPTUwQKxG0
	Csj0Y9ILDhwlI5rNPx6xEvD4EH9L/NfA=; b=b/8Qqb8Y1F9O/BkOtIjMkBsOo3k
	GBVIlzxirdeEHpSg9Ck+z4L0sEJ8UBi+Xx4nbidQSXxjZ6eZmqAhJ5IiRfUiREXo
	9Zp95YPf6zWRCJanIxq6E/k7OLzt4L+8FTUlF5ptVaLRjkbQ3cBXK+GHxC2IGMt3
	Y8mpImQWAEQQUrCGYfS7Ozt6ip1dmegHf6Pk4lE03qXzbno8Ps235LFn9exWZW5o
	bFQooRODYPDWmXbW02kPksXWM5gLFPCcEmrL2VZuSyZYVRd/2EJOsETXpCwAUzvM
	Hk0PyA4LQd/mw5eXMsYkpnz/wnUHOXzOfLm1dZZXG3OzbcUxeJD+V49v71g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4es0cggv4a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sat, 13 Jun 2026 12:11:37 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c354050c34so17167325ad.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 13 Jun 2026 05:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781352697; x=1781957497; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3pPTUwQKxG0Csj0Y9ILDhwlI5rNPx6xEvD4EH9L/NfA=;
        b=jr1BNfb0hpbjSO/sPWRWyiJp4tjiP/3Q5cw2tLl0jc05r8+n/eVCu38rR6CAMMYEfq
         VvXlPmg68dhBgBWW8fUWlko1g9hgub+1OxP6eAO6k9iwM75eU9Qo8Ylg6RM0th9HBAmF
         PZOdEzN7CNP0jm4eGwt3uNQHCsLqxtLa0A9ar0Shq8iHNe1hpkAHh9B222pFWDKZKmGh
         BqdlL3NOsSaXjoLXnXoTjivynot4k9oFtRBOpvr7wMrGUdZPn3xwxeQKC7GZgOeN4bW9
         webNG38r5doXdQcZj6urjumExH/XhCDFOMff1wW6YT+zGE8sXcvfRZ6e7BP1/SSmKvyW
         0ZwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781352697; x=1781957497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3pPTUwQKxG0Csj0Y9ILDhwlI5rNPx6xEvD4EH9L/NfA=;
        b=JlNIg7OulPiN0wmTsS0vV1huzc8TvHNpIop594LaSpcTn2luGNNOs9pHc823EkFsUy
         EH45V8HVhd5QA+8JDqZ7HLU5rdT//kTkrlD2uQ/ReQ0yDk2iNnV15u4geG8S5O/9yPI3
         QQE+f5WVLYSPmr4zOhd+H4dka6RiAFNJ++WSKTaqynjcaSvoOYIDf68SuZNoh8ARxSgh
         t6yggjqMDXnKsdD7D6Mx+3QXIrlCLlSQFH1UlOuqBBzJbvYSWVAOnHTtCw5j5PhiwPr1
         GTK3uGtUe4OgQzKEVak2AYYrQgK/eOQFymx382IRfYYmYeCo/opZcHLbWKLA7zFJa7IW
         fKbw==
X-Gm-Message-State: AOJu0YxzF0YMHTTLrlExfaDfzYNNKAFS0Z5cUO+lOiwQ7lLH7Jqq6INn
	3xZ0RIgrnh2GwbQ31zda8xilWFxBtDDhcaOiEFigDRTr8VFqcnIMaU5Ww5LdwJE3GTKhTBMxxZA
	QK1xSTTFL5nN2iNpnIXn32MnkgHTZ0nfJiaOxc31XSe3oDU7u81RLKPmVSYJ5RSK+uSHFVG8mW2
	VEm0y0purH8E40/fK2
X-Gm-Gg: Acq92OFQhUIhWAeuDgQPybdsmhSWoBlYOjsV8JcEo10oBMJawfGU8m+XmZnTus2tXaU
	FSRg8Rg7jwcGpwsKVW+nSg1tk3oBCWtKTCc1uSeaHvrJgVbTNEDZqCfJ1xYHLGKNdslJ0UwvxXU
	pYSEMrPn5jejsr5hiShw0EsL8uxNpC7vlDLnrbeAmFfGN5n9oOGGOKYc4SIrmaK/rRVeIGAORzn
	3m3QnB2AMPqkY49KpdPsXkEQbkSVYiItnCd6O1bG0WBBelRsuuq8jJlfoSYHYyk5C8bGIaYQxNs
	fD1eDhecHMwJe0djERD6VESvVacq11+ZK0HE00WJawa5fW2R3ZaUJBMfvX8k1+/3XYu5lwDC4HX
	24N9T36lORSdKx0tGzGmJwQpnwnwXGxns/OxOMyez8zIRmfwf3esNSSio
X-Received: by 2002:a17:902:cec5:b0:2be:fda1:42d9 with SMTP id d9443c01a7336-2c66409de0cmr42303355ad.0.1781352697004;
        Sat, 13 Jun 2026 05:11:37 -0700 (PDT)
X-Received: by 2002:a17:902:cec5:b0:2be:fda1:42d9 with SMTP id d9443c01a7336-2c66409de0cmr42303045ad.0.1781352696381;
        Sat, 13 Jun 2026 05:11:36 -0700 (PDT)
Received: from hu-rajkpate-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c432d86501sm45389115ad.61.2026.06.13.05.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 05:11:35 -0700 (PDT)
From: Rajkumar Patel <patel.rajkumar@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com, Rajkumar Patel <patel.rajkumar@oss.qualcomm.com>
Subject: [meta-oe][PATCH 2/3] xdp-tools: upgrade 1.2.10 -> 1.6.3
Date: Sat, 13 Jun 2026 17:40:23 +0530
Message-Id: <20260613121024.2957723-2-patel.rajkumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260613121024.2957723-1-patel.rajkumar@oss.qualcomm.com>
References: <20260613121024.2957723-1-patel.rajkumar@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: vPnBewA0VpCb6gBoRpknmn1C8F1QCi-P
X-Authority-Analysis: v=2.4 cv=NPLlPU6g c=1 sm=1 tr=0 ts=6a2d48fa cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=NEAV23lmAAAA:8
 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=hX9f41WZAt5pQm368A0A:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: vPnBewA0VpCb6gBoRpknmn1C8F1QCi-P
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEzMDEyNCBTYWx0ZWRfX3NPAP3OcMAZs
 FdnjVaeOPLivvEm/iw6btuPo9JoUWRajQFTbWv012lsNaRew7YO/Tz1e5MdzUIlAvFS8UmAyogZ
 /kmnnoOeZvwXGeP4BQrZfdzOtuhKcP8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEzMDEyNCBTYWx0ZWRfX7xYIeqgsTd6S
 Zmaa35N3cqKcVOLjdLlvITxkscZxI0ONrwU/zUdOr8dKK9YLZ/tGAociq+rflNnkIiGSainREok
 0aPtsCanXGbVVD17pgP8TnN42hgwAxQoyP0pfH+nVuNDQSzmOCV+rEdl9E73YQS/WFIauEv32SP
 g8h4+LvqTUQfmh/LBGAsreipNQREW3zn7ddtKMc9Qf2EUUBnjKH+SNhsmizoIITthzvutXoiO0F
 krWerU9agr9F62MXtcI6RXSG0ldGfnJKOVjeasxCNJne303dGw3OJzNFo19/aie6Y8+Wi/0s5YJ
 TMNWoG7VyUqCSn8IQ1g0mwBKNX7db2htlvWWHfjk59r0zO4ubIEFslsHeUU59jtM0NgmERFCy+h
 CEto41SA+MIld8Z3Q5ZdGa9zpHZRjZ2vI/+9nn6bgV9T1Bx+WDpH1hxFm9d0sg2U8oOjZ6SG2SK
 DESnVIHpaLJXxsHtfsQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-13_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606130124
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 13 Jun 2026 12:11:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127571

Drop patches 0002 and 0004 as they are no longer needed with 1.6.3.

Rework patches 0001 and 0003 to properly handle CC tool validation
and libxdp symlink installation for cross-compilation.

Set PRODUCTION=1 and pass BPF_CFLAGS with sysroot include paths
and ffile-prefix-map for reproducible cross-compilation builds.

Include ${libdir}/bpf/* in FILES:${PN} as libxdp.so resolves BPF
objects at runtime from that path. Add bash to RDEPENDS for the
test scripts.

Signed-off-by: Rajkumar Patel <patel.rajkumar@oss.qualcomm.com>
---
 ...tly-handle-CC-when-validating-requir.patch | 45 ++++++++++++++++++
 ...ile-use-cp-fRd-to-preserve-symlinks-.patch | 36 ++++++++++++++
 ...0001-configure-skip-toolchain-checks.patch | 44 -----------------
 ...-not-detect-libbpf-header-from-sysro.patch | 44 -----------------
 .../0003-Makefile-fix-KeyError-failure.patch  | 31 ------------
 .../0004-Makefile-fix-libxdp.pc-error.patch   | 34 --------------
 .../xdp-tools/xdp-tools_1.2.10.bb             | 36 --------------
 .../xdp-tools/xdp-tools_1.6.3.bb              | 47 +++++++++++++++++++
 8 files changed, 128 insertions(+), 189 deletions(-)
 create mode 100644 meta-oe/recipes-support/xdp-tools/files/0001-configure-correctly-handle-CC-when-validating-requir.patch
 create mode 100644 meta-oe/recipes-support/xdp-tools/files/0002-lib-libxdp-Makefile-use-cp-fRd-to-preserve-symlinks-.patch
 delete mode 100644 meta-oe/recipes-support/xdp-tools/xdp-tools/0001-configure-skip-toolchain-checks.patch
 delete mode 100644 meta-oe/recipes-support/xdp-tools/xdp-tools/0002-Makefile-It-does-not-detect-libbpf-header-from-sysro.patch
 delete mode 100644 meta-oe/recipes-support/xdp-tools/xdp-tools/0003-Makefile-fix-KeyError-failure.patch
 delete mode 100644 meta-oe/recipes-support/xdp-tools/xdp-tools/0004-Makefile-fix-libxdp.pc-error.patch
 delete mode 100644 meta-oe/recipes-support/xdp-tools/xdp-tools_1.2.10.bb
 create mode 100644 meta-oe/recipes-support/xdp-tools/xdp-tools_1.6.3.bb

diff --git a/meta-oe/recipes-support/xdp-tools/files/0001-configure-correctly-handle-CC-when-validating-requir.patch b/meta-oe/recipes-support/xdp-tools/files/0001-configure-correctly-handle-CC-when-validating-requir.patch
new file mode 100644
index 0000000000..1102566ab9
--- /dev/null
+++ b/meta-oe/recipes-support/xdp-tools/files/0001-configure-correctly-handle-CC-when-validating-requir.patch
@@ -0,0 +1,45 @@
+From 2a6d219ec2f5413e38ec502421cce8a2c6d7f054 Mon Sep 17 00:00:00 2001
+From: Rajkumar Patel <patel.rajkumar@oss.qualcomm.com>
+Date: Tue, 9 Jun 2026 11:22:13 +0530
+Subject: [PATCH 1/2] configure: correctly handle CC when validating required
+ tools
+
+The tool validation loop checks the availability of required
+binaries using `command -v`. However, when CC is defined with
+additional flags (e.g. "aarch64-linux-gnu-gcc -O2 -pipe"),
+the check fails because `command -v` expects only the binary
+name.
+
+Extract the actual compiler executable from CC by taking the
+first word and include it in the validation list.
+
+This ensures tool detection works correctly in cross-compilation
+environments where CC commonly includes compiler flags.
+
+Additionally, quote variable expansions to avoid issues with
+word splitting and empty values.
+
+Upstream-Status: Pending
+
+Signed-off-by: Rajkumar Patel <patel.rajkumar@oss.qualcomm.com>
+---
+ configure | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/configure b/configure
+index d57b2ae..a234f80 100755
+--- a/configure
++++ b/configure
+@@ -70,8 +70,10 @@ check_toolchain()
+ 
+     CLANG=$(find_tool clang "$CLANG")
+ 
+-    for TOOL in $PKG_CONFIG $CC $OBJCOPY $CLANG $M4 $READELF; do
+-        if [ ! $(command -v ${TOOL} 2>/dev/null) ]; then
++    CC_TOOL=$(echo "$CC" | awk '{print $1}')
++
++    for TOOL in $PKG_CONFIG "$CC_TOOL" $OBJCOPY $CLANG $M4 $READELF; do
++        if [ ! $(command -v "${TOOL}" 2>/dev/null) ]; then
+             echo "*** ERROR: Cannot find tool ${TOOL}" ;
+             exit 1;
+         fi;
diff --git a/meta-oe/recipes-support/xdp-tools/files/0002-lib-libxdp-Makefile-use-cp-fRd-to-preserve-symlinks-.patch b/meta-oe/recipes-support/xdp-tools/files/0002-lib-libxdp-Makefile-use-cp-fRd-to-preserve-symlinks-.patch
new file mode 100644
index 0000000000..bc860ada71
--- /dev/null
+++ b/meta-oe/recipes-support/xdp-tools/files/0002-lib-libxdp-Makefile-use-cp-fRd-to-preserve-symlinks-.patch
@@ -0,0 +1,36 @@
+From 064ccdaf0d84bea86f9cd17383581c3844a33151 Mon Sep 17 00:00:00 2001
+From: Rajkumar Patel <patel.rajkumar@oss.qualcomm.com>
+Date: Tue, 9 Jun 2026 11:24:51 +0530
+Subject: [PATCH 2/2] lib/libxdp/Makefile: use cp -fRd to preserve symlinks
+ without metadata
+
+cp -fpR preserves ownership and timestamps from the build host,
+which breaks cross-compilation and packaging QA checks.
+
+The `-p` flag is unnecessary for symlink handling. Replace it
+with `-d` to explicitly preserve symlinks without carrying over
+file metadata.
+
+Switch to cp -fRd to maintain symlink structure while avoiding
+host contamination.
+
+Upstream-Status: Pending
+
+Signed-off-by: Rajkumar Patel <patel.rajkumar@oss.qualcomm.com>
+---
+ lib/libxdp/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/libxdp/Makefile b/lib/libxdp/Makefile
+index 7ea7e7e..3c36b70 100644
+--- a/lib/libxdp/Makefile
++++ b/lib/libxdp/Makefile
+@@ -56,7 +56,7 @@ install: all
+ 	$(Q)install -d -m 0755 $(DESTDIR)$(BPF_OBJECT_DIR)
+ 	$(Q)install -m 0644 $(LIB_HEADERS) $(DESTDIR)$(HDRDIR)/
+ 	$(Q)install -m 0644 $(PC_FILE) $(DESTDIR)$(LIBDIR)/pkgconfig/
+-	$(Q)cp -fpR $(SHARED_LIBS) $(STATIC_LIBS) $(DESTDIR)$(LIBDIR)
++	$(Q)cp -fdR $(SHARED_LIBS) $(STATIC_LIBS) $(DESTDIR)$(LIBDIR)
+ 	$(Q)install -m 0644 $(XDP_OBJS) $(DESTDIR)$(BPF_OBJECT_DIR)
+ 	$(if $(MAN_FILES),$(Q)install -m 0755 -d $(DESTDIR)$(MANDIR)/man3)
+ 	$(if $(MAN_FILES),$(Q)install -m 0644 $(MAN_FILES) $(DESTDIR)$(MANDIR)/man3)
diff --git a/meta-oe/recipes-support/xdp-tools/xdp-tools/0001-configure-skip-toolchain-checks.patch b/meta-oe/recipes-support/xdp-tools/xdp-tools/0001-configure-skip-toolchain-checks.patch
deleted file mode 100644
index 0c891528cb..0000000000
--- a/meta-oe/recipes-support/xdp-tools/xdp-tools/0001-configure-skip-toolchain-checks.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 9c9dce2e5f04de65b7b00321f96fff6071546ea1 Mon Sep 17 00:00:00 2001
-From: Naveen Saini <naveen.kumar.saini@intel.com>
-Date: Mon, 17 Oct 2022 15:44:16 +0800
-Subject: [PATCH] configure: skip toolchain checks
-
-Current logic fetch full command line along with the tool. i.e
-gcc -m64 -march=skylake -mtune=generic ...
-
-Which throws ERROR: Cannot find tool -m64
-
-So need to re-write for loop, so it can work in cross-compilation
-environment too.
-
-Upstream-Status: Inappropriate
-
-Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
-
----
- configure | 12 ++++++------
- 1 file changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/configure b/configure
-index b4e824f..10618fc 100755
---- a/configure
-+++ b/configure
-@@ -69,12 +69,12 @@ check_toolchain()
-     CLANG=$(find_tool clang "$CLANG")
-     LLC=$(find_tool llc "$LLC")
- 
--    for TOOL in $PKG_CONFIG $CC $LD $OBJCOPY $CLANG $LLC $M4; do
--        if [ ! $(command -v ${TOOL} 2>/dev/null) ]; then
--            echo "*** ERROR: Cannot find tool ${TOOL}" ;
--            exit 1;
--        fi;
--    done
-+    #for TOOL in $PKG_CONFIG $CC $LD $OBJCOPY $CLANG $LLC $M4; do
-+    #    if [ ! $(command -v ${TOOL} 2>/dev/null) ]; then
-+    #        echo "*** ERROR: Cannot find tool ${TOOL}" ;
-+    #        exit 1;
-+    #    fi;
-+    #done
- 
-     clang_version=$($CLANG --version | grep -Po '(?<=clang version )[[:digit:]]+')
-     if [ "$?" -ne "0" ]; then
diff --git a/meta-oe/recipes-support/xdp-tools/xdp-tools/0002-Makefile-It-does-not-detect-libbpf-header-from-sysro.patch b/meta-oe/recipes-support/xdp-tools/xdp-tools/0002-Makefile-It-does-not-detect-libbpf-header-from-sysro.patch
deleted file mode 100644
index 2e66783692..0000000000
--- a/meta-oe/recipes-support/xdp-tools/xdp-tools/0002-Makefile-It-does-not-detect-libbpf-header-from-sysro.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 2840cf0b89497f545fae2eed7ece3f3c5fc558e3 Mon Sep 17 00:00:00 2001
-From: Naveen Saini <naveen.kumar.saini@intel.com>
-Date: Mon, 17 Oct 2022 15:50:34 +0800
-Subject: [PATCH 2/4] Makefile: It does not detect libbpf header from sysroot
-
-So adding sysroot headers path.
-
-Upstream-Status: OE-Specific
-
-Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
----
- lib/common.mk       | 2 +-
- lib/libxdp/Makefile | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/lib/common.mk b/lib/common.mk
-index 56c0406..ab0bad8 100644
---- a/lib/common.mk
-+++ b/lib/common.mk
-@@ -55,7 +55,7 @@ LIBXDP_SOURCES := $(wildcard $(LIBXDP_DIR)/*.[ch] $(LIBXDP_DIR)/*.in)
- KERN_USER_H ?= $(wildcard common_kern_user.h)
- 
- CFLAGS += -I$(HEADER_DIR) -I$(LIB_DIR)/util $(ARCH_INCLUDES)
--BPF_CFLAGS += -I$(HEADER_DIR) $(ARCH_INCLUDES)
-+BPF_CFLAGS += -I$(HEADER_DIR) $(ARCH_INCLUDES) -I${STAGING_INCDIR}/
- 
- BPF_HEADERS := $(wildcard $(HEADER_DIR)/bpf/*.h) $(wildcard $(HEADER_DIR)/xdp/*.h)
- 
-diff --git a/lib/libxdp/Makefile b/lib/libxdp/Makefile
-index 358b751..8f459d8 100644
---- a/lib/libxdp/Makefile
-+++ b/lib/libxdp/Makefile
-@@ -30,7 +30,7 @@ PC_FILE := $(OBJDIR)/libxdp.pc
- TEMPLATED_SOURCES := xdp-dispatcher.c
- 
- CFLAGS += -I$(HEADER_DIR)
--BPF_CFLAGS += -I$(HEADER_DIR)
-+BPF_CFLAGS += -I$(HEADER_DIR) -I${STAGING_INCDIR}/
- 
- 
- ifndef BUILD_STATIC_ONLY
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-support/xdp-tools/xdp-tools/0003-Makefile-fix-KeyError-failure.patch b/meta-oe/recipes-support/xdp-tools/xdp-tools/0003-Makefile-fix-KeyError-failure.patch
deleted file mode 100644
index 41c57f6eb2..0000000000
--- a/meta-oe/recipes-support/xdp-tools/xdp-tools/0003-Makefile-fix-KeyError-failure.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 157546fbc4f18751c52b3c8788879c05cf253331 Mon Sep 17 00:00:00 2001
-From: Naveen Saini <naveen.kumar.saini@intel.com>
-Date: Mon, 17 Oct 2022 16:02:46 +0800
-Subject: [PATCH 3/4] Makefile: fix KeyError failure
-
-Error:
-Exception: KeyError: 'getpwuid(): uid not found: 11857215'
-
-Upstream-Status: Inappropriate
-
-Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
----
- lib/libxdp/Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lib/libxdp/Makefile b/lib/libxdp/Makefile
-index 8f459d8..9a340a3 100644
---- a/lib/libxdp/Makefile
-+++ b/lib/libxdp/Makefile
-@@ -55,7 +55,7 @@ install: all
- 	$(Q)install -d -m 0755 $(DESTDIR)$(BPF_OBJECT_DIR)
- 	$(Q)install -m 0644 $(LIB_HEADERS) $(DESTDIR)$(HDRDIR)/
- 	$(Q)install -m 0644 $(PC_FILE) $(DESTDIR)$(LIBDIR)/pkgconfig/
--	$(Q)cp -fpR $(SHARED_LIBS) $(STATIC_LIBS) $(DESTDIR)$(LIBDIR)
-+	$(Q)cp -fpR --no-preserve=ownership $(SHARED_LIBS) $(STATIC_LIBS) $(DESTDIR)$(LIBDIR)
- 	$(Q)install -m 0755 $(XDP_OBJS) $(DESTDIR)$(BPF_OBJECT_DIR)
- 	$(if $(MAN_FILES),$(Q)install -m 0755 -d $(DESTDIR)$(MANDIR)/man3)
- 	$(if $(MAN_FILES),$(Q)install -m 0644 $(MAN_FILES) $(DESTDIR)$(MANDIR)/man3)
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-support/xdp-tools/xdp-tools/0004-Makefile-fix-libxdp.pc-error.patch b/meta-oe/recipes-support/xdp-tools/xdp-tools/0004-Makefile-fix-libxdp.pc-error.patch
deleted file mode 100644
index b1e15e5216..0000000000
--- a/meta-oe/recipes-support/xdp-tools/xdp-tools/0004-Makefile-fix-libxdp.pc-error.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 46b3ff797135574aa0ee42f633a281d44f48da95 Mon Sep 17 00:00:00 2001
-From: Naveen Saini <naveen.kumar.saini@intel.com>
-Date: Mon, 17 Oct 2022 16:05:15 +0800
-Subject: [PATCH 4/4] Makefile: fix libxdp.pc error
-
-Error:
-do_populate_sysroot: QA Issue: libxdp.pc failed sanity test (tmpdir) in
-path ... xdp-tools/1.2.8-r0/sysroot-destdir/usr/lib/pkgconfig [pkgconfig]
-
-Upstream-Status: Inappropriate
-
-Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
----
- lib/libxdp/Makefile | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/lib/libxdp/Makefile b/lib/libxdp/Makefile
-index 9a340a3..bc39177 100644
---- a/lib/libxdp/Makefile
-+++ b/lib/libxdp/Makefile
-@@ -76,8 +76,8 @@ $(OBJDIR)/libxdp.so.$(LIBXDP_VERSION): $(SHARED_OBJS)
- 		      $^ $(LDFLAGS) $(LDLIBS) -o $@
- 
- $(OBJDIR)/libxdp.pc:
--	$(Q)sed -e "s|@PREFIX@|$(PREFIX)|" \
--			-e "s|@LIBDIR@|$(LIBDIR)|" \
-+	$(Q)sed -e "s|@PREFIX@|$(prefix)|" \
-+			-e "s|@LIBDIR@|$(libdir)|" \
- 			-e "s|@VERSION@|$(TOOLS_VERSION)|" \
- 			< libxdp.pc.template > $@
- 
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-support/xdp-tools/xdp-tools_1.2.10.bb b/meta-oe/recipes-support/xdp-tools/xdp-tools_1.2.10.bb
deleted file mode 100644
index 4a06124caf..0000000000
--- a/meta-oe/recipes-support/xdp-tools/xdp-tools_1.2.10.bb
+++ /dev/null
@@ -1,36 +0,0 @@
-SUMMARY = "Utilities and example programs for use with XDP"
-HOMEPAGE = "https://github.com/xdp-project/xdp-tools"
-LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later & BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=9ee53f8d06bbdb4c11b1557ecc4f8cd5 \
-                    file://LICENSES/GPL-2.0;md5=994331978b428511800bfbd17eea3001 \
-                    file://LICENSES/LGPL-2.1;md5=b370887980db5dd40659b50909238dbd \
-                    file://LICENSES/BSD-2-Clause;md5=5d6306d1b08f8df623178dfd81880927"
-
-DEPENDS += " libbpf clang-native zlib elfutils libpcap"
-
-SRC_URI = "git://github.com/xdp-project/xdp-tools.git;branch=v1.2;protocol=https \
-            file://0001-configure-skip-toolchain-checks.patch \
-            file://0002-Makefile-It-does-not-detect-libbpf-header-from-sysro.patch \
-            file://0003-Makefile-fix-KeyError-failure.patch \
-            file://0004-Makefile-fix-libxdp.pc-error.patch \
-          "
-
-SRCREV = "57a139f9bf6ef644f9c1deb4f7df4bb4c76d6179"
-
-
-inherit pkgconfig
-
-EXTRA_OEMAKE += "PREFIX=${D}${prefix} LIBDIR=${D}${libdir} BUILD_STATIC_ONLY=1 PRODUCTION=1"
-
-CFLAGS += "-fPIC"
-
-export STAGING_INCDIR
-
-do_install () {
-    oe_runmake install
-
-    # Remove object files *.o
-    rm -rf ${D}/${libdir}/bpf
-}
-
-RDEPENDS:${PN} += "bash"
diff --git a/meta-oe/recipes-support/xdp-tools/xdp-tools_1.6.3.bb b/meta-oe/recipes-support/xdp-tools/xdp-tools_1.6.3.bb
new file mode 100644
index 0000000000..09cfc72950
--- /dev/null
+++ b/meta-oe/recipes-support/xdp-tools/xdp-tools_1.6.3.bb
@@ -0,0 +1,47 @@
+SUMMARY = "Utilities and library for managing XDP/eBPF programs"
+
+DESCRIPTION = "xdp-tools provides libxdp and command-line utilities for working \
+with XDP eBPF programs in Linux, including tools for loading programs, packet \
+processing, monitoring, traffic generation, and benchmarking."
+
+HOMEPAGE = "https://github.com/xdp-project/xdp-tools"
+LICENSE = "GPL-2.0-only & GPL-2.0-or-later & LGPL-2.1-only & BSD-2-Clause"
+LIC_FILES_CHKSUM = " \
+    file://LICENSE;md5=9ee53f8d06bbdb4c11b1557ecc4f8cd5 \
+    file://LICENSES/GPL-2.0;md5=994331978b428511800bfbd17eea3001 \
+    file://LICENSES/LGPL-2.1;md5=b370887980db5dd40659b50909238dbd \
+    file://LICENSES/BSD-2-Clause;md5=5d6306d1b08f8df623178dfd81880927 \
+"
+SRC_URI = " \
+    git://github.com/xdp-project/xdp-tools.git;tag=v${PV};nobranch=1;protocol=https \
+    file://0001-configure-correctly-handle-CC-when-validating-requir.patch \
+    file://0002-lib-libxdp-Makefile-use-cp-fRd-to-preserve-symlinks-.patch \
+"
+SRCREV = "8fbad9f0af621a22aa87ff2520b3735915b1f0fd"
+
+DEPENDS += " \
+    libbpf \
+    clang-native \
+    zlib \
+    elfutils \
+    libpcap \
+"
+
+inherit pkgconfig
+
+EXTRA_OEMAKE += " \
+    PREFIX=${prefix} \
+    LIBDIR=${libdir} \
+    PRODUCTION=1 \
+    BPF_CFLAGS='-D__${TARGET_ARCH}__ -I${S}/headers -I${STAGING_INCDIR} -ffile-prefix-map=${S}=${TARGET_DBGSRC_DIR} -ffile-prefix-map=${STAGING_DIR_HOST}=' \
+"
+
+do_install () {
+    oe_runmake DESTDIR=${D} install
+}
+
+# libxdp.so loads BPF objects at runtime from ${libdir}/bpf, not embedded in the .so.
+FILES:${PN} += "${libdir}/bpf ${libdir}/bpf/*"
+
+# Test scripts under ${datadir}/xdp-tools require bash.
+RDEPENDS:${PN} += "bash"

