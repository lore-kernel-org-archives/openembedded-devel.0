Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BD7FCD98D2
	for <webhook@archiver.kernel.org>; Sat, 13 Jun 2026 08:18:45 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.87535.1781338720005174055
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Jun 2026 01:18:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=H5m2PJa7;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2c0c2a68d01so12124335ad.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 13 Jun 2026 01:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781338719; x=1781943519; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3EKZGxxY3xHAfEh9awOr2AT42aQKC92Nl3fT8QU6slw=;
        b=H5m2PJa74e2X73rYdigwRiIbSY8SGEjTwotWt+T1K/xGPKlMlDliKrXcVgHEkAhNdE
         GsrKRRMe1AgpePL3W2LqAbfxYIxj5v2fxOstZKOzUegs1i9UwW3+SvBxVZGIyJyLFDGj
         4+v4kTsyArHtofqRQ4EONE6FcYfWZ3nMrjF52ppCgEVWV6MrMvOzpO6HZv22dTtkBoXM
         kNx3WG5yznVD60ZMEtLa8zhRP/mo3/PcZxFM43faCQ/ND+Gb7Rj7vmPyWkefhzvbHJW+
         otsGeI9NgBTpwnv/cnS8DXf0I5AdUksJlkZ2OLmRv+vS2dTHTgVe5lYUjsBpZwlDhw8h
         VPyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781338719; x=1781943519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3EKZGxxY3xHAfEh9awOr2AT42aQKC92Nl3fT8QU6slw=;
        b=SMrT2CrfZole7yVXFbVuZW1S8t0087+51TWQUpEBaUDksLOIw8kQM+csMvjlDqAHew
         NqAAoM8eI2Nr+KxhdMB145OQcPxr7BG/E2/m16Z+vKC2vlUhd1h2hG2PcMdQNDrJO4ED
         vcmHBMLAFgtYzPt+eePcFxIRyKLyLKEuG70wcfRz6wxK9RMBPtUvublxY4OoJwMp2dXJ
         Cop+Rdr4PWWdMBM+rr80iQqilAChLsXD5regnc/UHl9NVRAqfm0HkRUZldYWfnTicrZI
         YVXFZAtxRIKWFJ20HaKl6JlEVR6ScWa8c0nY3HdNwxMROQQRDnkNReHtqlaS+cKLMHAx
         QgAg==
X-Gm-Message-State: AOJu0YxkYCxt7TJtfuOkrEbmjTPE1oA3/qnvZ4LsbE412UYaL2PQdFpx
	+RR/qIUFnZCJ1CrbldnrBpVmcUURlzBRvVQLWdF+eTqukGSgV4BMG9GDlnKZ7yeo
X-Gm-Gg: Acq92OFgEZT58i824SXkeKnWMoUlctJe6QIww/LM6FrZRJ5QAFRm+msN57+IDTFH3jj
	RSqGnev/sq62wduPL2cmElueMY0oJre83qfozV92RXc0pNWPTEzF8TksoSedQ5RlA4DaQnWLrXt
	do/91PbOmO9TTyFFZefmnWDb+1tHEgpHpiVY2rlL8LWzPrT9LwZHPKF0Gthr+tOLfgvq229wOjN
	AjmAxa5XbU+sqUGD2rIBSb6KxeU3oZxW+6Q9CIYsLHaQCzHDUP+bZn7XNO6WVxnLkIvLITv3kgd
	Eo0OtzYgNOR9ufaU3d/UH5pNR65PKDk97GtvCi83LnCFMbPQ3VoWwHDw2mxNx4g2kB/q877D1kr
	UZ7l1TJVCN818yptC2Fo4/BSjwHE9YDfwHNWIojS2N6/YD8nvh+i2u4K4fqmn+ZjGQbeIWAgEmx
	UBSV5eJyRUzUUxzw/2HxuAJJB7GNihHdIbg2wl
X-Received: by 2002:a17:902:f711:b0:2bd:606d:b339 with SMTP id d9443c01a7336-2c4119804b7mr70330215ad.21.1781338719308;
        Sat, 13 Jun 2026 01:18:39 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.153])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42c43543asm43885095ad.0.2026.06.13.01.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 01:18:38 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 3/16] php: upgrade 8.5.5 -> 8.5.6
Date: Sat, 13 Jun 2026 20:18:11 +1200
Message-ID: <20260613081824.1223609-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260613081824.1223609-1-ankur.tyagi85@gmail.com>
References: <20260613081824.1223609-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 13 Jun 2026 08:18:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127555

From: Jason Schonberg <schonm@gmail.com>

This is a security release.

Changelog: https://www.php.net/ChangeLog-8.php#8.5.6

Signed-off-by: Jason Schonberg <schonm@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 4310ecc78f2078d8f3be53f8f6de410faa5ed59c)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-devtools/php/{php_8.5.5.bb => php_8.5.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/php/{php_8.5.5.bb => php_8.5.6.bb} (99%)

diff --git a/meta-oe/recipes-devtools/php/php_8.5.5.bb b/meta-oe/recipes-devtools/php/php_8.5.6.bb
similarity index 99%
rename from meta-oe/recipes-devtools/php/php_8.5.5.bb
rename to meta-oe/recipes-devtools/php/php_8.5.6.bb
index 2924b478ad..db5bba9ccc 100644
--- a/meta-oe/recipes-devtools/php/php_8.5.5.bb
+++ b/meta-oe/recipes-devtools/php/php_8.5.6.bb
@@ -32,7 +32,7 @@ UPSTREAM_CHECK_REGEX = "releases/tag/php-(?P<pver>\d+(\.\d+)+)"
 
 S = "${UNPACKDIR}/php-${PV}"
 
-SRC_URI[sha256sum] = "ee262beff61c431965d1f97192854b36208adeac38983c3498bb3500ae87283c"
+SRC_URI[sha256sum] = "4457240f65f0c59a620920d66cdab1b12100a431e03ad9febe38b13a1b25957f"
 
 CVE_STATUS_GROUPS += "CVE_STATUS_PHP"
 CVE_STATUS_PHP[status] = "fixed-version: The name of this product is exactly the same as github.com/emlog/emlog. CVE can be safely ignored."

