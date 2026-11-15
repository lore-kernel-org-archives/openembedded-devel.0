Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3864.1794729014857058552
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 23:50:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=MJtC9j5m;
 spf=pass (domain: gmail.com, ip: 74.125.82.180, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3712b6d9843so1902863eec.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 23:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794729014; x=1795333814; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ltnPhRagSHVSqnQOchn2DnsY2W4Zg2G2X3ZBG78ndRE=;
        b=MJtC9j5mfK4QBbYAfcjIK9eozbjWQT9vCQ+gj7FXhEnzjQ2RdImQrJhP6eg4slwOEU
         v/dNHZxjKdyjPjueWmxO7/Sr3/c5AbZWw1FjUJbJ1l97mm7tdYCmPEBQUV+eRN8MWrda
         MJbirH/jrbr2990w5QryaZ689HnBsWDnVVnWxpGjliPK61b4nV3q6rxk50lnjiWAOaNd
         Rvi880sKLlDmiT5MrkYXuHT6r7wTSjKBNXWYwSPDslrlb6wB+SfoOF/iuzghNtJf3+tx
         tk2jN8rimX714iGhgO0iGjXCYMO/ufazv44JcV1kaAmfrZdj3CaX38oWQgtWtru45CRZ
         M0aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794729014; x=1795333814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ltnPhRagSHVSqnQOchn2DnsY2W4Zg2G2X3ZBG78ndRE=;
        b=vfxCdGHgHdvcZKLT2qB3OHl8NQFCeI5TA6FPAF05lFy8mnECr092NJMqwdO7UJ+UJx
         sbqmrPpDHwYU5jU9L35q1fPlkT2+maBZ7rRpDdI4QVYLOLNeMVpmPLkvSymnMpwkAzNm
         piC+FcMAbZ9h3w0ZYcSAKYtMQ5zoD2L9s4X1ZkKx3yklUmBkp/nOEzuC12XG3Au2gWOF
         uaR4AzJ90MJDSUsOF6vmerqWfc3138KQRIWz8N2lz/sSz8eJmFSpllNfrs03FQTUx99H
         Xsc9q3MPzxqvY9Hk0shmfcY4WzD7OgWVs1zuFrdXT1nXXWgOms14SJelanz6t2ZpfmUm
         D8Yg==
X-Gm-Message-State: APuU4Z9v4mP3QA990wTygHgAfxT203AMZVxBOZxHhF/0oEQGF2Fdv/6I
	sVRCxSraVXOPMJsPWUFROJJcW775uvLRH9bs0Ev5y12OLF2tpxUuQzB4mQEfXaGw
X-Gm-Gg: AYBFou1i2sGBhhuVKEQVzm2ps7C9G+HUl8akyvTbIHZ/YOdo6G0hCf+o1VtRneG7BVc
	lxo6PbyXaFsBO/WPc7ZE+W5GuFPcT1Nb95YM2BCmnHXtEidFU6LViRon00iCvPGLAxQP53y3ZZ7
	uhkManBbdYsqESZ1Vhnt4ta+8kvbJX/6HTyfpdzPbrHHntYbZGUrO/ZQhVpCyjaENeYqhHvjSh0
	5hCyACGbIPk46zbGeNwv6s0KGjTLdiuhjZyf9XCk0Wsoemd3ay7FbeJdgf5FLtmmrIq7pDcOwmJ
	EW0XKJNiDwi966a6rA5u5JfmClYHiKNwFovQcadzYRSwazuZjPu3B3dP9CAuxBkgOsbYD8YgwO1
	QU8T6DjSmTwz6BJE5w/G6e1MJxnPNw51EOnygisA7Xyz70cnUqGt11Ft3xSMSKjNprdEQKnhIQ8
	QpYhCB2CNveiG7UMSUQjhFt03EcNBGHLyaxtxTSEZwyZOLhgguu+ADW5ZgqWVwsXjaDEzN1fn5d
	OnCFc3aZi7nBJ2LR0toZ1yQ44ES1YD7uZAxhIZk7GHv5STLneouNnUhw2MLBmdo1T557Mn748iu
	zFJ6lN38iNDOcols1+HG9PcfmpT9oEPFLCcxwFBRGXPVlrMLel2yXg71vWZ4U3O68YcMcM2ZIuK
	qn8t1AWDxBJADh8PagLknZqOCz7xcdLxrKFbUd2Dz/+ttKd3UmKWjJdt7sdp+GIUhS+YbGyXaL3
	4hhs7xUwtkXiWBhaCRcKtzBWfPxu0fHsaR8BsGW1+M3Y6hrfeIYp/bBo6DT1Ii0j1VK5sxXVTmD
	w0luvtZHjktOKXOi33vniJcYdDYXu8ST3hdG6+HehrpPOLynOB8AhuMUKTtRHVHQ9G1hil03g/i
	gOuy
X-Received: by 2002:a05:7300:fb17:b0:36f:6d81:3f99 with SMTP id 5a478bee46e88-3796676fd59mr7248420eec.7.1794729014195;
        Sat, 14 Nov 2026 23:50:14 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm23112817eec.13.2026.11.14.23.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:50:13 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 33/96] md4c: upgrade 0.5.3 -> 0.6.0
Date: Sat, 14 Nov 2026 23:48:11 -0800
Message-ID: <20261115074918.2932593-33-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
References: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 07:50:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132303
Content-Type: text/plain; charset="utf-8"

Upstream now tags releases as vX.Y.Z. LICENSE.md only changed the
copyright years.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-support/md4c/{md4c_0.5.3.bb => md4c_0.6.0.bb}   | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/md4c/{md4c_0.5.3.bb => md4c_0.6.0.bb} (61%)

diff --git a/meta-oe/recipes-support/md4c/md4c_0.5.3.bb b/meta-oe/recipes-support/md4c/md4c_0.6.0.bb
similarity index 61%
rename from meta-oe/recipes-support/md4c/md4c_0.5.3.bb
rename to meta-oe/recipes-support/md4c/md4c_0.6.0.bb
index 12bcf15a87..2d7f2e2fe9 100644
--- a/meta-oe/recipes-support/md4c/md4c_0.5.3.bb
+++ b/meta-oe/recipes-support/md4c/md4c_0.6.0.bb
@@ -3,14 +3,14 @@ DESCRIPTION = "MD4C is Markdown parser implementation in C."
 HOMEPAGE = "http://github.com/mity/md4c"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.md;md5=383f39920f391605af6e8e46e60e2378"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=f63468506b3d106579df14c9ffd34df8"
 
 
 
 SRC_URI = " \
-        git://github.com/mity/md4c.git;protocol=https;branch=master;tag=release-${PV} \
+        git://github.com/mity/md4c.git;protocol=https;branch=master;tag=v${PV} \
 "
 
-SRCREV = "472c417005c2c71b8617de4f7b8d6b30411d78f4"
+SRCREV = "7fc1815a5eeba2af7d6120a76202bf59f3b6e6e4"
 
 inherit cmake
