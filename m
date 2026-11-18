Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5696.1794974924352024170
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Nov 2026 20:08:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=iAnUiQ+0;
 spf=pass (domain: gmail.com, ip: 74.125.82.177, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso1555653eec.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Nov 2026 20:08:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794974924; x=1795579724; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MCZfS9NGfzTXRjBsZEbqbVhvCd8NTLVHZOGcjHO0p+w=;
        b=iAnUiQ+0dm8wtjPybzYzJ9TgGy3nRs2DaxILZg4BWKAB7nOpOccXVpF/ManTrcp4oF
         6ijDjhQ8BY0fC9p0LcS8x11TeHlxzRwRZPvL6iY4Fz7as+Yrx8meWRZ6JPEo7LvQK1nh
         E3yeNspgo4hsA4jeTbRHAKIfWUzGrHXYFFef4q2HDtl/8K2UP4QJT4eScmU6Ppp7Ua/o
         AR/399/3Kg/hkEQI26wXRxh0eFhlFkrJUO5V1wVwXRSfRNKG88mN9qelHrGxdUBIrxXq
         BPRNg4SxXw4HxtN37owM276VYOz90DATyl0NtgM7slqbvcIm4Cqfwk2Oxh3xXA9Ka0d6
         Vcwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794974924; x=1795579724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MCZfS9NGfzTXRjBsZEbqbVhvCd8NTLVHZOGcjHO0p+w=;
        b=AM7hPMIgabIdnpIRUnfZc3foNiOuQc2dTLt0TgM76EFt3yoNAAxTIzTL5MwhPvRBYm
         4t01bnsinsXAkfwHnESKGd3tmmBt+hm3q8Pm5ysYS12emT7fWz0Tc6l9axgxn636lma+
         dFhc3eOGsBPvFOlYZ5G9KnYcY9R7Gp/DZFak2DmcQHE7WUvASnbzM/9lhJCjvY2C+Bic
         N2LdcMHhSg58IlGtwWpNjW2FfG5FXqNw13SW7VS+HBajr1vOF1pnYJeq29H+W9GmLBjU
         Bxk1p1Y2+H7bPA+QxgiySB5BaB1NQEPPj///jVxGH6xx26UBxifjIQIFEty7Mld4tzDH
         xw7w==
X-Gm-Message-State: APuU4Z+TTElX6gKotzdGhyhJkkxH/L3KQpWUCpsp7mgOFjh9BuTTlDK3
	CLXTeAMPONR++XgIdBVKtC2Iq/typjELZeEi76KS5bMceFqXecdtdfb09pUrJBvZ
X-Gm-Gg: AZFdTZdelzTlfTUzN0IF+X56hREV8jTwWmtqr/v7fI9pcBWBBtKTHnVRTQHrAIL2Gkj
	qiCi7lhCOSMWDLaM8pnltUaOcydQ8m2DEAuSdnD03sSnGWZ5uU6t42OWLR0kISLvLW2RVOcy4Xz
	bWvIcvt3m9+k8wxt+4wmgkAJHDGjL8ujtg7Lk+/zs1vTe7TSKU2iVVo/D1uYsREu3OmygQx50bW
	m3AYbNP4QJWUTtvt+kv3EAhv3KmAh1qks6vOQ0QrBzjjm2oqGVUlYAoZaXiFy9cc4TXB/uiBQja
	4PLqafyI2Ib1Y7k80YVmFAwmi7Tyz1/yCUSff/qsoyGIqYMmKPAF3B9LNddsugN8r6fKPMQE6zb
	OCfbRRYR7LTGbD6OeG/qp690+xTT9NvL3vSQfVVaM++6G/jNFyQfqzKkVFCBQfMCP9M3e/7uPyE
	jaf10mKyAL0eC/KGqKCWuG4Nmj821aR5++ZhQncgUMe6rDyZ6cxS0RR7OFd/gzwUtcW40rSNhr1
	prt1vPey+GRN66Diu0h+SdAM0i2LEZ9uX0jaqdHURSqVABPfu3BavM0uK7/wPGPlARAoztfZmvN
	wtVSdjahRImylU8e6BfRRFLUFiQCbMRBq/LUAPs/ZA2skgWjfcq46S2Jy15jfcUTKqocDU+6J/N
	UK+TxCkfZsj8xDbQEj5XT9ekJIR1CbfWrpJ0VcNrvA6t1F7vR5zsYWS+wEDfZoWVXoqMrEuRkei
	NxfZSw/s0XV8hizFAZbFTYNuhX9RDNP4y9oZLvqRgc9r7QajI70EXcH8z8IHPFkwq01KuOIALQJ
	/HzXAAtNrXxx0geqjK17xnM3p4YRZZq4PsqYfXkUYiYLud1yy1u0WPRnEQSlUPxoHq60j4dUJiE
	UebO
X-Received: by 2002:a05:7300:1488:b0:381:cf4:2a17 with SMTP id 5a478bee46e88-3827aae12c6mr1861286eec.0.1794974923659;
        Tue, 17 Nov 2026 20:08:43 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a73e0aa6sm2695251eec.19.2026.11.17.20.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 20:08:42 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 5/8] smartmontools: Drop obsolete reproducibility patch
Date: Tue, 17 Nov 2026 20:08:27 -0800
Message-ID: <20261118040831.2284885-5-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118040831.2284885-1-khem.raj@oss.qualcomm.com>
References: <20261118040831.2284885-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2026 04:08:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132620
Content-Type: text/plain; charset="utf-8"

The SOURCE_DATE_EPOCH change has been part of smartmontools since 7.3;
against 7.5 the patch only added a ChangeLog entry.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...Define-SOURCE_DATE_EPOCH-in-CPPFLAGS.patch | 34 -------------------
 .../smartmontools/smartmontools_7.5.bb        |  1 -
 2 files changed, 35 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/smartmontools/files/0001-configure.ac-Define-SOURCE_DATE_EPOCH-in-CPPFLAGS.patch

diff --git a/meta-oe/recipes-extended/smartmontools/files/0001-configure.ac-Define-SOURCE_DATE_EPOCH-in-CPPFLAGS.patch b/meta-oe/recipes-extended/smartmontools/files/0001-configure.ac-Define-SOURCE_DATE_EPOCH-in-CPPFLAGS.patch
deleted file mode 100644
index 917cbb0306..0000000000
--- a/meta-oe/recipes-extended/smartmontools/files/0001-configure.ac-Define-SOURCE_DATE_EPOCH-in-CPPFLAGS.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 898fd4115be5cdd848db99fe85e1d0d7f1b3fa02 Mon Sep 17 00:00:00 2001
-From: Oleksiy Obitotskyy <oobitots@cisco.com>
-Date: Mon, 22 Feb 2021 17:21:33 +0200
-Subject: [PATCH] smartmontools: Improve reproducibility
-
-Backport changes added to master smartmontools.
-https://github.com/smartmontools/smartmontools/commit/24838916b4c0e91f5c897d44fcdeedb22848f684
-
-Upstream-Status: Backport [https://github.com/smartmontools/smartmontools/commit/24838916b4c0e91f5c897d44fcdeedb22848f684]
-Signed-off-by: Oleksiy Obitotskyy <oobitots@cisco.com>
-
----
- ChangeLog | 8 ++++++++
- 1 file changed, 8 insertions(+)
-
-diff --git a/ChangeLog b/ChangeLog
-index 5f0930a..4c5a91e 100644
---- a/ChangeLog
-+++ b/ChangeLog
-@@ -705,6 +705,14 @@ $Id: ChangeLog 5338 2022-02-28 16:34:26Z chrfranke $
-
- 	Happy New Year!  Update copyright year in version info.
-
-+2021-02-07  Christian Franke  <franke@computer.org>
-+
-+	Improve reproducibility if SOURCE_DATE_EPOCH if set (GH pull/89).
-+	configure.ac: Define SOURCE_DATE_EPOCH in CPPFLAGS.
-+	utility.cpp: Print SOURCE_DATE_EPOCH value if specified.
-+	Don't include configure arguments then.
-+	cppcheck.sh: Silence related 'ConfigurationNotChecked' message.
-+
- 2020-12-30  Christian Franke  <franke@computer.org>
-
- 	smartmontools 7.2
diff --git a/meta-oe/recipes-extended/smartmontools/smartmontools_7.5.bb b/meta-oe/recipes-extended/smartmontools/smartmontools_7.5.bb
index 96e48ee924..6f007527c2 100644
--- a/meta-oe/recipes-extended/smartmontools/smartmontools_7.5.bb
+++ b/meta-oe/recipes-extended/smartmontools/smartmontools_7.5.bb
@@ -16,7 +16,6 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/smartmontools/smartmontools-${PV}.tar.gz \
            file://initd.smartd \
            file://smartmontools.default \
            file://smartd.service \
-           file://0001-configure.ac-Define-SOURCE_DATE_EPOCH-in-CPPFLAGS.patch \
            "

 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/smartmontools/files/"
