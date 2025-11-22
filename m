Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67D20CFC539
	for <webhook@archiver.kernel.org>; Sat, 22 Nov 2025 15:18:31 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11164.1763824709613867189
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 22 Nov 2025 07:18:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MuMgaQzW;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-477a219dbcaso28034255e9.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 22 Nov 2025 07:18:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763824708; x=1764429508; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=q4fDeKRRB1dshQY6cznqDcvA3oJYJ+LXLKLObg3gm3w=;
        b=MuMgaQzWUwbNzUBjetX+svNWEisey6n36WNiv/WmO5TfAs0VVzgU6C/rFqfgbrw2CH
         0YAvI2T0SuYb/cukYP5W64cTr58fl/xE2Zix/3RficOtsF49Tpf8hpHCv6RzeeM7BgT0
         E6uXCMHZR/p0w5KdurXy0YGvhaV9vonJmmgzVZKnfU806NSNpGMHyx1ZbrzstrFvRiF2
         er1PzFWtHoIT2OilIK5yyp9oSSikAvQPMWskT0iJIFdmFWTsYRFMuiEzl38JX1T5m67R
         SWJL3G5aOIUveG/fvruvEB6XVJY6bA5q7EN223fdpQ9KDjPO2guaH5WKp084e0qj6KM0
         lCwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763824708; x=1764429508;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q4fDeKRRB1dshQY6cznqDcvA3oJYJ+LXLKLObg3gm3w=;
        b=e69DWkj35yupm3SfunupwtetqGJlQ075dRE05bQ3N4W6Eo1Nblxq7Go6GR2rDoZF/I
         y0m3YhFlVJtQd5ynquO/dYDhZAQb5FPqc6e4YLclETRGV4NweZ/REpgf6WVH31vRjApo
         aX4y/RDYapePHUV70C4LBDEG5I67KuyuH5KDCNOcC9vOXexHhCHQh/4YpmAxEPUS9qhu
         obYZ7Pw37qyfo5QsC4iNmmsaOfuqTXc26poGYXuecTLK2xiSCMxewkJfOp5wLE4N3uOH
         b9SFiavcKpU7ip6p1C4BdhRJX8pDjDyNwcbFhtrU/kQixuGJH+kwgbDZLsWTUkZex6Ct
         cbwQ==
X-Gm-Message-State: AOJu0YxUI+Kq7idD/PRS9GfUwKGUwVrO1o7injX3NlV14YyHEE+qHZpo
	sTOO7aOhn9t4SybQkBX+IkYA+YjBPGF3kL8zw78rxM8TWf1rAglA2oKhR/O12x8C
X-Gm-Gg: ASbGnctaCUigDUjdTEV9lVfoVj79WHaM672VaxhCw/4vPc7HwX8nateKQmP0oL1h75G
	ZsMYDtv3ERGdaocKgsQb556s//wpu2EHrEEoNLPiEl+LzM1MNfq5hAYZir1wAzmmu4FF+uQyeTA
	B5YlEbJ//04+Vd/DKxEKZFeWAm92vbTvGU/jiV8OfzeUXSpwpFmrb2R2TniyNcvqFvziSqvn4IC
	K0xX0p49g5Rm8Wz5RVgq5NfAMpxEL56hoLREQhdQM+4f9O0ftw1KLnMtTISMaJORqa5RiM/q6qy
	Lftja6W+O4PuZ1syEYrDh51p7V00qwO0ZiNXm4HilnqdzV7XGSvEmNJ//yt0Of+gP1ux1oYrQfG
	Bk/JY3PbOa88+PG9ykPpdCx2spmASnv0cJ5BMBJXBNEPp2HEnVh9M+UcVA7kn8ZLUVFfmfuM2wG
	0Ss/wNA9S77rbTGjK9TDI=
X-Google-Smtp-Source: AGHT+IEu6dq168gtkBT5g8OVde4SZlaD66JH5J8rDkTuB0TF9ULBXYoB9sT6BgV1IKP0CTpHPq6AuA==
X-Received: by 2002:a05:600c:474b:b0:46e:35a0:3587 with SMTP id 5b1f17b1804b1-477c01ee377mr56799175e9.27.1763824707383;
        Sat, 22 Nov 2025 07:18:27 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f34fd1sm17547157f8f.11.2025.11.22.07.18.26
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Nov 2025 07:18:26 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH] poco: patch CVE-2023-52389
Date: Sat, 22 Nov 2025 16:18:26 +0100
Message-ID: <20251122151826.1656677-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 22 Nov 2025 15:18:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121978

Details: https://nvd.nist.gov/vuln/detail/CVE-2023-52389

Pick the patch from the PR mentioned in the nvd report.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../poco/poco/CVE-2023-52389.patch            | 122 ++++++++++++++++++
 meta-oe/recipes-support/poco/poco_1.11.2.bb   |   1 +
 2 files changed, 123 insertions(+)
 create mode 100644 meta-oe/recipes-support/poco/poco/CVE-2023-52389.patch

diff --git a/meta-oe/recipes-support/poco/poco/CVE-2023-52389.patch b/meta-oe/recipes-support/poco/poco/CVE-2023-52389.patch
new file mode 100644
index 0000000000..1121caa7b0
--- /dev/null
+++ b/meta-oe/recipes-support/poco/poco/CVE-2023-52389.patch
@@ -0,0 +1,122 @@
+From 260963fc7bdc4f11611eee48483c2153fea33326 Mon Sep 17 00:00:00 2001
+From: Andrei Fedotov <anfedotoff@yandex-team.ru>
+Date: Wed, 20 Dec 2023 16:29:17 +0300
+Subject: [PATCH] Fix Integer overflow in Poco::UTF32Encoding
+
+CVE: CVE-2023-52389
+Upstream-Status: Backport [https://github.com/ClickHouse/ClickHouse/commit/341806d44017a9c9fff3b4872e3eec40acf014d2]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ Foundation/include/Poco/UTF32Encoding.h | 10 ++++++
+ Foundation/src/UTF32Encoding.cpp        | 42 ++++++++++++-------------
+ 2 files changed, 31 insertions(+), 21 deletions(-)
+
+diff --git a/Foundation/include/Poco/UTF32Encoding.h b/Foundation/include/Poco/UTF32Encoding.h
+index 6f8af525a..251c084d2 100644
+--- a/Foundation/include/Poco/UTF32Encoding.h
++++ b/Foundation/include/Poco/UTF32Encoding.h
+@@ -68,6 +68,16 @@ public:
+ 	int convert(int ch, unsigned char* bytes, int length) const;
+ 	int queryConvert(const unsigned char* bytes, int length) const;
+ 	int sequenceLength(const unsigned char* bytes, int length) const;
++
++protected:
++	static int safeToInt(Poco::UInt32 value)
++	{
++		if (value <= 0x10FFFF)
++			return static_cast<int>(value);
++		else
++			return -1;
++	}
++
+ 	
+ private:
+ 	bool _flipBytes;
+diff --git a/Foundation/src/UTF32Encoding.cpp b/Foundation/src/UTF32Encoding.cpp
+index 47a0156b0..dd27c3434 100644
+--- a/Foundation/src/UTF32Encoding.cpp
++++ b/Foundation/src/UTF32Encoding.cpp
+@@ -30,22 +30,22 @@ const char* UTF32Encoding::_names[] =
+ 
+ const TextEncoding::CharacterMap UTF32Encoding::_charMap =
+ {
+-	/* 00 */	-2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2,
+-	/* 10 */	-2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2,
+-	/* 20 */	-2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2,
+-	/* 30 */	-2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2,
+-	/* 40 */	-2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2,
+-	/* 50 */	-2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2,
+-	/* 60 */	-2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2,
+-	/* 70 */	-2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2,
+-	/* 80 */	-2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2,
+-	/* 90 */	-2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2,
+-	/* a0 */	-2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2,
+-	/* b0 */	-2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2,
+-	/* c0 */	-2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2,
+-	/* d0 */	-2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2,
+-	/* e0 */	-2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2,
+-	/* f0 */	-2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2,
++	/* 00 */	-4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4,
++	/* 10 */	-4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4,
++	/* 20 */	-4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4,
++	/* 30 */	-4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4,
++	/* 40 */	-4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4,
++	/* 50 */	-4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4,
++	/* 60 */	-4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4,
++	/* 70 */	-4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4,
++	/* 80 */	-4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4,
++	/* 90 */	-4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4,
++	/* a0 */	-4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4,
++	/* b0 */	-4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4,
++	/* c0 */	-4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4,
++	/* d0 */	-4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4,
++	/* e0 */	-4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4,
++	/* f0 */	-4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4, -4,
+ };
+ 
+ 
+@@ -118,7 +118,7 @@ const TextEncoding::CharacterMap& UTF32Encoding::characterMap() const
+ int UTF32Encoding::convert(const unsigned char* bytes) const
+ {
+ 	UInt32 uc;
+-	unsigned char* p = (unsigned char*) &uc;
++	unsigned char* p = reinterpret_cast<unsigned char*>(&uc);
+ 	*p++ = *bytes++;
+ 	*p++ = *bytes++;
+ 	*p++ = *bytes++;
+@@ -129,7 +129,7 @@ int UTF32Encoding::convert(const unsigned char* bytes) const
+ 		uc = ByteOrder::flipBytes(uc);
+ 	}
+ 
+-	return uc;
++	return safeToInt(uc);
+ }
+ 
+ 
+@@ -138,7 +138,7 @@ int UTF32Encoding::convert(int ch, unsigned char* bytes, int length) const
+ 	if (bytes && length >= 4)
+ 	{
+ 		UInt32 ch1 = _flipBytes ? ByteOrder::flipBytes((UInt32) ch) : (UInt32) ch;
+-		unsigned char* p = (unsigned char*) &ch1;
++		unsigned char* p = reinterpret_cast<unsigned char*>(&ch1);
+ 		*bytes++ = *p++;
+ 		*bytes++ = *p++;
+ 		*bytes++ = *p++;
+@@ -155,7 +155,7 @@ int UTF32Encoding::queryConvert(const unsigned char* bytes, int length) const
+ 	if (length >= 4)
+ 	{
+ 		UInt32 uc;
+-		unsigned char* p = (unsigned char*) &uc;
++		unsigned char* p = reinterpret_cast<unsigned char*>(&uc);
+ 		*p++ = *bytes++;
+ 		*p++ = *bytes++;
+ 		*p++ = *bytes++;
+@@ -164,7 +164,7 @@ int UTF32Encoding::queryConvert(const unsigned char* bytes, int length) const
+ 		{
+ 			uc = ByteOrder::flipBytes(uc);
+ 		}
+-		return uc;
++		return safeToInt(uc);
+ 	}
+ 
+ 	return ret;
diff --git a/meta-oe/recipes-support/poco/poco_1.11.2.bb b/meta-oe/recipes-support/poco/poco_1.11.2.bb
index b8a1b571b1..f5332aaf27 100644
--- a/meta-oe/recipes-support/poco/poco_1.11.2.bb
+++ b/meta-oe/recipes-support/poco/poco_1.11.2.bb
@@ -12,6 +12,7 @@ SRC_URI = "git://github.com/pocoproject/poco.git;branch=main;protocol=https \
            file://run-ptest \
            file://CVE-2025-6375.patch \
            file://0001-fix-test-Use-96-bit-IV-with-aes-256-gcm-to-fix-4347.patch \
+           file://CVE-2023-52389.patch \
            "
 SRCREV = "9d1c428c861f2e5ccf09149bbe8d2149720c5896"
 

