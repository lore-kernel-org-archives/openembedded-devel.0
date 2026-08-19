Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0654C5DF85
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 17:30:14 +0000 (UTC)
Received: from alln-iport-7.cisco.com (alln-iport-7.cisco.com [173.37.142.94])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1778.1787160610090455343
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 10:30:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=XPXZ970I;
 spf=pass (domain: cisco.com, ip: 173.37.142.94, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3345; q=dns/txt;
  s=iport01; t=1787160610; x=1788370210;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EEP45Moqe5BWQAuvGKoVMiCPicr00oMOuQrZBU5B1Tc=;
  b=XPXZ970ImGvm53YTezBCPLcSGvN4tKJDcpEHpGUktD8rFcbJgUTJ+2TG
   yuPdHk/fG4cE69qG1CPqbWc2PDz2M2/5srqBeDDMunH/dRydhnIRpSkzN
   Ki/dvj4un5/EZx86ica+tx1BQ5HE8hZy+9ZHOOny7cTEHB6+MQyynFIA+
   itCS5aAyNNLkmrIzPSZDbzSpnThxQlGeraVbniCn/MlwGvUwbCX/DMk+w
   ybLyqvCJYnrnHqm9Ziv8mPw3OmRLeHuOS7nepRPX4eMbhLrQqnWwu337X
   6TudGTu9SksGMPukouybGcxBk5jzgoSeIV7GOtAbbSBpyH2esdaRszFBT
   g==;
X-CSE-ConnectionGUID: B3ek5NPDR1yqluxbDrKypw==
X-CSE-MsgGUID: SyPRJl5uQGW5JDIGFv0zdQ==
X-IPAS-Result: =?us-ascii?q?A0BJAgBa54Vq/5IQJK1aglmCV3ReQ0mVXmwDi2SSN4F+D?=
 =?us-ascii?q?wEBAQ9EDQQBAYQ/RgKNawImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBA?=
 =?us-ascii?q?gEHBYEOE4ZPDYZaAQIBAycLARgBLRAcAwECLyALIwgZgwIBgjoDNwMRxBGBe?=
 =?us-ascii?q?TOBAYMoAT8CQ1DYSw2CWAELFAGBOIU/gn+FI10YAYR8JxsbgXKEfoEFgRpCA?=
 =?us-ascii?q?QGBJ4ZcIgSCIoEMgVqRaUiBHgNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjPheBD?=
 =?us-ascii?q?RsGBYEdgSiENyMZNnyBCV6BKyphARIXgQmCCgKCcIIGAgFJRQ4JDAsYDUgRL?=
 =?us-ascii?q?DcUGQQ+bgeOSiCBfkYHAWAtASt/EoEDGKV2oB5xCiiDdowhjz4EhXgaM4QEl?=
 =?us-ascii?q?BeSUQuYfY4KhAmSR4RpgWg8gUcLB3AVgyIJShkPji4KC4NggX/KOicyAgkyA?=
 =?us-ascii?q?QEHAgcOAwuBaJAAgX4BAQ?=
IronPort-Data: A9a23:/HDH3K/10eXZUIO9SkxUDrUD0X+TJUtcMsCJ2f8bNWPcYEJGY0x3x
 zYeUDiOMq6JNDTxe9onO420909TvJXdn9NmQVE6qiFEQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmE4EzrauS9xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mvyyHjEAX9gWAsYjtFs/vrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2kcZoAbp8BPLVsX5
 OUcNSAHQgqglvqplefTpulE3qzPLeHiOIcZ/3UlxjbDALN+ENbIQr7B4plT2zJYasJmRKmFI
 ZFHL2MxKk2cPXWjOX9PYH46tOuri332cixRgFmUvqEwpWPUyWSd1ZC9aYCOIILaGJQ9ckCwn
 XP+xUb9XwwjG+PC6xak3Vyy3v3DpHauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8hkOgVtZ3L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4Guk+7kSJj6HT+QvcXjlCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1qt94cRva1fApEFI/
IronPort-HdrOrdr: A9a23:2/ZY+6jWEdDlJKiJoU19WHnolHBQXvgji2hC6mlwRA09TyVXra
 +TdZMgpHjJYVkqOU3I9ersBEDEewK/yXcX2/h0AV7BZmnbUQKTRekIh7cKgQeQfhEWndQy6U
 4PScRD4aXLfDtHpPe/xhWkGNA9x9TC2qWpieDCi0pJd2hRGsddB8MTMHfiLqWwLzM2fKYEKA
 ==
X-Talos-CUID: 9a23:M4qv2WAUxq3ucCP6EwM8+U1JPPgJSCTM1XPNM0WUE0V4UKLAHA==
X-Talos-MUID: =?us-ascii?q?9a23=3AXfz3Qg1fJvtXM70/Q7kvxru0HzUj2LWWMmIJzIg?=
 =?us-ascii?q?/lPbZFwBRFBmD1Ca7e9py?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,231,1779148800"; 
   d="scan'208";a="812326859"
Received: from alln-l-core-09.cisco.com ([173.36.16.146])
  by alln-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 19 Aug 2026 17:30:09 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-09.cisco.com (Postfix) with ESMTPS id D472A18000475;
	Wed, 19 Aug 2026 17:30:08 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 6BD76CCD9B2; Wed, 19 Aug 2026 10:30:08 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [oe][meta-python][scarthgap][PATCH 2/2] python3-filelock: fix CVE-2026-22701
Date: Wed, 19 Aug 2026 10:30:05 -0700
Message-ID: <20260819173005.814360-2-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.44.4
In-Reply-To: <20260819173005.814360-1-dkelaiya@cisco.com>
References: <20260819173005.814360-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: alln-l-core-09.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 17:30:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129364

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the reviewed upstream fix shown in [1]. The
advisory identifying the fix is referenced in [2].

[1] https://github.com/tox-dev/filelock/commit/41b42dd2c72aecf7da83dbda5903b8087dddc4d5
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-22701

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../python3-filelock/CVE-2026-22701.patch     | 44 +++++++++++++++++++
 .../python/python3-filelock_3.13.4.bb         |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-filelock/CVE-2026-22701.patch

diff --git a/meta-python/recipes-devtools/python/python3-filelock/CVE-2026-22701.patch b/meta-python/recipes-devtools/python/python3-filelock/CVE-2026-22701.patch
new file mode 100644
index 0000000000..0431a2160e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-filelock/CVE-2026-22701.patch
@@ -0,0 +1,44 @@
+From c07f9db7726babc801ea3bd6f7c0f09d92a48bc7 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Bern=C3=A1t=20G=C3=A1bor?= <gaborjbernat@gmail.com>
+Date: Fri, 9 Jan 2026 09:53:50 -0800
+Subject: [PATCH] Fix TOCTOU symlink vulnerability in SoftFileLock (#465)
+
+CVE: CVE-2026-22701
+Upstream-Status: Backport [https://github.com/tox-dev/filelock/commit/41b42dd2c72aecf7da83dbda5903b8087dddc4d5]
+
+Backport Changes:
+- Omitted docs/index.rst because the filelock 3.13.4 source archive
+  does not contain the upstream documentation tree. The omission does
+  not affect the SoftFileLock security fix.
+
+Co-authored-by: Claude <noreply@anthropic.com>
+(cherry picked from commit 41b42dd2c72aecf7da83dbda5903b8087dddc4d5)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ src/filelock/_soft.py | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/src/filelock/_soft.py b/src/filelock/_soft.py
+index 28c67f7..93709c5 100644
+--- a/src/filelock/_soft.py
++++ b/src/filelock/_soft.py
+@@ -16,13 +16,15 @@ class SoftFileLock(BaseFileLock):
+     def _acquire(self) -> None:
+         raise_on_not_writable_file(self.lock_file)
+         ensure_directory_exists(self.lock_file)
+-        # first check for exists and read-only mode as the open will mask this case as EEXIST
+         flags = (
+             os.O_WRONLY  # open for writing only
+             | os.O_CREAT
+             | os.O_EXCL  # together with above raise EEXIST if the file specified by filename exists
+             | os.O_TRUNC  # truncate the file to zero byte
+         )
++        o_nofollow = getattr(os, "O_NOFOLLOW", None)
++        if o_nofollow is not None:
++            flags |= o_nofollow
+         try:
+             file_handler = os.open(self.lock_file, flags, self._context.mode)
+         except OSError as exception:  # re-raise unless expected exception
+-- 
+2.44.4
+
diff --git a/meta-python/recipes-devtools/python/python3-filelock_3.13.4.bb b/meta-python/recipes-devtools/python/python3-filelock_3.13.4.bb
index 9fa5f95ff1..1ea3d796aa 100644
--- a/meta-python/recipes-devtools/python/python3-filelock_3.13.4.bb
+++ b/meta-python/recipes-devtools/python/python3-filelock_3.13.4.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=911690f51af322440237a253d695d19f"
 SRC_URI[sha256sum] = "d13f466618bfde72bd2c18255e269f72542c6e70e7bac83a0232d6b1cc5c8cf4"
 
 SRC_URI += "file://CVE-2025-68146.patch \
+            file://CVE-2026-22701.patch \
            "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.44.4


