Return-Path: <yurade@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5050CCA462
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 06:23:35 +0000 (UTC)
Received: from rcdn-iport-4.cisco.com (rcdn-iport-4.cisco.com [173.37.86.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15655.1792131805770128006
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Oct 2026 23:23:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=fQk6rzT8;
 spf=pass (domain: cisco.com, ip: 173.37.86.75, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3652; q=dns/txt;
  s=iport01; t=1792131805; x=1793341405;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=NjqsIk5NILcMVM3doxQZqyUzXIMYjgglfmxE00vK5AQ=;
  b=fQk6rzT8oz65u43lkaUPNgbLFiZpaQY6mwLcEsJAVsLtMedO6hB7XzLE
   G5SZv5quFS7XUOFoM3nF20sGW6StntgWBZabh/M21JAOMmctrOu6RHVNN
   GxQ3OPGGsna/rd48knXhu33Hmy5PWgUhfRjbq5e6HqY+MhRQE/RXJPUAA
   cOBr7i6UQyW+CLhgZzwYOcptAh3C98MLG1d3WwhYDjWhUQEkrixGBRl7q
   zHHPd9v29tmfymahhLc8sjiERxXOisobFjtamjQIDnHg11ksoI0zikIcy
   dN/18292a73HtyRu0JO7Oh0IgRb6T32VpUNqikztdSYDCOULqIrEZwc2l
   Q==;
X-CSE-ConnectionGUID: air1NNO6RS63L2OmU8ZYtw==
X-CSE-MsgGUID: WibipU/7T2KEeMXbPmX//Q==
X-IPAS-Result: =?us-ascii?q?A0BJAgBRwtFq/4z/Ja1aglmCV3VgQ0kDlCaCIQOeHIF+D?=
 =?us-ascii?q?wEBAQ9EDQQBAYQ/RgKOFQImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBA?=
 =?us-ascii?q?QIBBwWBDhOGTw2QEgECAQMnCwEYAT0cAwECLysjCBmDAgGCdAMRvHSBeTOBA?=
 =?us-ascii?q?YMpAYFU2UqBaAELFAGBOIVAiCNdGAGEfCcbgUlEgRWBO4IugQWBXAKBJ4Z+B?=
 =?us-ascii?q?IMcEoFalUdIgR4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BIz4XgQcbBgWBHYEgg?=
 =?us-ascii?q?hYjGTZ6gQlegSspYRAXgQmCBwKCVIIAAgFJQQ4HRVMJJUMSRyYiCBIJARMaM?=
 =?us-ascii?q?AuBGzg8CShBFwxzDB0FcggCDQkHKRgNSBEsNxUZBD5uB5IUHoJlgQ4BKwV6R?=
 =?us-ascii?q?GkeMKUnoQ+EKIwilToaM4VbpRQLmH2LN4JTlk+EaYFoPIFZMxoIGxWDIglKG?=
 =?us-ascii?q?Q+OKw4Lg2CFZMh2JzICCQMvAQEHAgcOAwuBaJAAgX4BAQ?=
IronPort-Data: A9a23:RcpVOqwc5VB53ul9kN16t+dhxyrEfRIJ4+MujC+fZmUNrF6WrkUDz
 GscXG+GOayCazH9KdwlYNyxoUwP68fVx4M1T1RpqFhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCKa/lHyYuCJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 4yaT/H3Ygf/hWcsazxMsspvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJEg3J9Q+3MEpO1oQr
 thCDzUwPiKym/3jldpXSsE07igiBNPgMIVavjRryivUSK59B5vCWK7No9Rf2V/chOgXQq2YP
 JVfM2cyKk2cO3WjOX9PYH46tPa1nHDzfhVTqUmeouw85G27IAlZjeOzaoaPJ4LTLSlTtnmZr
 GPewiOmPks5GdG6+TC990LrwdaayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PW0lEO6c9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc8BbH+t/7ESGzbDZpl7CQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSv1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:onLFHaOrTXjxR8BcTu2jsMiBIKoaSvp037BN7TEUdfU7SKKlfq
 yV8cjzkCWE6wr5O0tQ/OxoRpPgfZq0z/cciuMs1PWZLWvbUQCTQ72Kg7GP/9SZIU3D398Y87
 t8eK5jD9C1J117gcHmpDScKb8bsb66GGTCv5am85+rJjsaDZ1d0w==
X-Talos-CUID: =?us-ascii?q?9a23=3AkeeGB2lgJnyEiYGhlNvSJq28gIbXOXTc1i72BWj?=
 =?us-ascii?q?mM103E5nPblqtqJFVj9U7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AzjxuNw8J7DDuGgbat4SDqhWQf/hp6aW2NQdSrc8?=
 =?us-ascii?q?llsShBSZIPgfayw3iFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="536242561"
Received: from rcdn-l-core-03.cisco.com ([173.37.255.140])
  by rcdn-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 06:23:25 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-03.cisco.com (Postfix) with ESMTPS id CD98A180001CD
	for <openembedded-devel@lists.openembedded.org>; Fri, 16 Oct 2026 06:23:24 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id 76691CBF204; Thu, 15 Oct 2026 23:23:24 -0700 (PDT)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][wrynose][PATCH 4/9] python3-pillow: Fix CVE-2026-59198
Date: Thu, 15 Oct 2026 23:23:18 -0700
Message-Id: <20261016062323.251925-5-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261016062323.251925-1-yurade@cisco.com>
References: <20261016062323.251925-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-7871.cisco.com [10.30.222.158];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.30.222.158, sjc-ads-7871.cisco.com
X-Outbound-Node: rcdn-l-core-03.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Oct 2026 06:23:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131059

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/python-pillow/Pillow/commit/eada3cbd7fb9963ee90673fb7b5270124a0d5f4b
[2] https://github.com/python-pillow/Pillow/security/advisories/GHSA-fj7v-r99m-22gq

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
 .../python3-pillow/CVE-2026-59198.patch       | 57 +++++++++++++++++++
 .../python/python3-pillow_12.2.0.bb           |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pillow/CVE-2026-59198.patch

diff --git a/meta-python/recipes-devtools/python/python3-pillow/CVE-2026-59198.patch b/meta-python/recipes-devtools/python/python3-pillow/CVE-2026-59198.patch
new file mode 100644
index 0000000000..e794d26832
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pillow/CVE-2026-59198.patch
@@ -0,0 +1,57 @@
+From 49ea10f3c83475ad30c1b0581e2aaa3e75f4af4f Mon Sep 17 00:00:00 2001
+From: Andrew Murray <3112309+radarhere@users.noreply.github.com>
+Date: Tue, 23 Jun 2026 09:46:33 +1000
+Subject: [PATCH] Prevent saving 1 mode images as TGA with run-length encoding
+ (#9709)
+
+CVE: CVE-2026-59198
+Upstream-Status: Backport [https://github.com/python-pillow/Pillow/commit/eada3cbd7fb9963ee90673fb7b5270124a0d5f4b]
+
+(cherry picked from commit eada3cbd7fb9963ee90673fb7b5270124a0d5f4b)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ Tests/test_file_tga.py    | 12 +++++++++++-
+ src/PIL/TgaImagePlugin.py |  4 ++++
+ 2 files changed, 15 insertions(+), 1 deletion(-)
+
+diff --git a/Tests/test_file_tga.py b/Tests/test_file_tga.py
+index 7ec562342..82bcf48ca 100644
+--- a/Tests/test_file_tga.py
++++ b/Tests/test_file_tga.py
+@@ -179,10 +179,20 @@ def test_save_wrong_mode(tmp_path: Path) -> None:
+     im = hopper("PA")
+     out = tmp_path / "temp.tga"
+ 
+-    with pytest.raises(OSError):
++    with pytest.raises(OSError, match="cannot write mode PA as TGA"):
+         im.save(out)
+ 
+ 
++def test_save_1_mode_rle(tmp_path: Path) -> None:
++    im = Image.new("1", (1, 1))
++    out = tmp_path / "temp.tga"
++
++    with pytest.raises(
++        OSError, match="cannot write mode 1 as TGA with run-length encoding"
++    ):
++        im.save(out, compression="tga_rle")
++
++
+ def test_save_mapdepth() -> None:
+     # This image has been manually hexedited from 200x32_p_bl_raw.tga
+     # to include an origin
+diff --git a/src/PIL/TgaImagePlugin.py b/src/PIL/TgaImagePlugin.py
+index b2989a4b7..8fd63b1df 100644
+--- a/src/PIL/TgaImagePlugin.py
++++ b/src/PIL/TgaImagePlugin.py
+@@ -205,6 +205,10 @@ def _save(im: Image.Image, fp: IO[bytes], filename: str | bytes) -> None:
+         compression = im.encoderinfo.get("compression", im.info.get("compression"))
+         rle = compression == "tga_rle"
+     if rle:
++        if im.mode == "1":
++            msg = f"cannot write mode {im.mode} as TGA with run-length encoding"
++            raise OSError(msg)
++
+         imagetype += 8
+ 
+     id_section = im.encoderinfo.get("id_section", im.info.get("id_section", ""))
diff --git a/meta-python/recipes-devtools/python/python3-pillow_12.2.0.bb b/meta-python/recipes-devtools/python/python3-pillow_12.2.0.bb
index f9d91e0889..331b99622b 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_12.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_12.2.0.bb
@@ -12,6 +12,7 @@ SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=main;protocol=https;
            file://CVE-2026-54059_CVE-2026-54060_CVE-2026-55379.patch \
            file://CVE-2026-55380.patch \
            file://CVE-2026-59197.patch \
+           file://CVE-2026-59198.patch \
            "
 SRCREV = "3c41c095064200a02672d89cc5ff629eaf4b0d4f"
 
-- 
2.35.6


