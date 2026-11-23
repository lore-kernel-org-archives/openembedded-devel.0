Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48064.1795411901325101215
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2026 21:31:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=PDKFARLo;
 spf=pass (domain: gmail.com, ip: 74.125.82.169, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3869b68caecso3587485eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Nov 2026 21:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795411901; x=1796016701; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EugXtjiam1sEeL1AUfy6feCsyzpPR5vmmUQHdYasWzY=;
        b=PDKFARLoKa7BemC1jFrcrUQUIR1aasvr7l5FwPZAgZI882npjazjiRxmK7EWqtCjJu
         epM3lePuw3RM8qfZa/GNjZkQb5VN614chDCtb1Wfg9kleULm/7Ej+w13GmCUd0VMXBET
         GczI6CQw0EwhsM1rPpZ5ChTAkVK0T5IEgdXtbjGK2B7hxZjdazm90USlQvZledQ/5lWV
         +avSFmGA+xn94Zazo1C37BwwUo8SyPLjaVW78XUVhqUw3WbD1fBTws1qS25DDsg3x1gi
         IXmBUsWAWL5e/eWV2iMIKxSbWzBk9Z0VJQRvJOdcQ0oPII+wc7D3CoZw3BwdK7oKwLYP
         zQrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411901; x=1796016701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EugXtjiam1sEeL1AUfy6feCsyzpPR5vmmUQHdYasWzY=;
        b=wV2jOnZaEhYMrY2kFEZGflHVoVSqND/mps5mo4TsA8q88VZYxz4jgZAm4NYcxBvILP
         tEpwsxNS4zzymdqA4A+ffTry7ND48mbDZW+kZmrUKd+6rn5G8NEZs+5HkpXTKCjUeeaQ
         KUpEA5bDvS+js1WKFHjonxDN6gy7cktt6e0f5zKttrsdHcA/eHYintPwdvKFzYKdoItK
         yqpTRku37AsayTh9r0uFSYtp/EDlvCKrCYS61qM7Oju6fdPCP/M6PkIj6renDsxZwWGI
         MloD/PVndGtN3zgMthmxg5apEGsIIuufuiyYpbyp7EVfy77eLRN4oyBuNNyr3gsCRpZg
         KL0g==
X-Gm-Message-State: APuU4Z94IpWZ27aHxD9rAHr2jx9UZx5sAGNXpWriYdb9aKe5TYzfGjGk
	siY1hm8HWSSHODYgJ1MSx84Jmsmbz1x6SnU8SBEUZDTGfgW6OYnUMxkf4TSxKOKGDqU=
X-Gm-Gg: AZFdTZdjvmuUnGRxYke5no/QmySwFiUhZ28xeXlU6U4ns+0QLWlSykbTeR0ohMaF0MF
	Uh1qEvDJCBea1mMyLb/YT2BfIcArNMJ0vt2+aogUQ/01UX63iU+R5JeHD1QKwX4RLdkN0ZHl50D
	w0Tg0j+A2snA78HaIAsJbL/Cf2duaOXLqoJmMaYxTDSfD26s+nn623+cC1QRHkfBwdKpQZ/soZk
	ER32JU0EeJpskW2ERxLgYM5ni7hCmRUiMtKhrdp/h6gLAgbpM2qyhdd2mHP2tDrKLPKq2yZYHeN
	DCkz56cNgRwS3DG/MtUS0JTB58YAp1tVbKE76RjNegML5oD/R2YeApTravp/ZA2Rd8trbfPvXio
	WDUxsQwdv8Jw5WHUYSZbJMBVs/adIfbxRy8XHlF8P9ac7OyOfANsqYjMnEZ3VnNI/Hbl9/2KHTw
	Jv3S2w1J5gfiCEvy+Tx9pgvOUqxxYhz0xgf0kZFl4+fj7A9QvejgMinlU6j1F8i8A/Mh5V8OtyI
	OacLsL4GXa93i8COMv+iRU7lsoTTqAEEep/ovk3PqWf1uhUYQl+NmkzD4eo4RWk4GDhs77nv8rs
	/YvuxQrMIPKlfAFKBSfM+Acj9yXHoj0MN/Ft3LSjB/F/9XS+LSOYe39zp83mDer+KgQXTcneOYV
	znLrZfPrOLP+KglwRnFfZVc2OqYpAb+hUSwrjNMGBkYMjX+b+IfvvJJxdLkj/CdgnbJH5pPPapi
	DTLLyljKJfbnUngs8ND4tsw9DEM/cEbCvwVvs9x+b0/Gtin85EZ+lSNzsOf3fnTJQCeDU52F6MN
	yu3lPvJRzSkXd8ewSBu3jk4N0RnzxVX61+oI2Ud05d3hcb1kH/HO1YJ9gqO/2YPFsoukfjQtnVA
	K2fo
X-Received: by 2002:a05:693c:8956:20b0:36f:551:2bd5 with SMTP id 5a478bee46e88-38570846826mr10602547eec.32.1795411900528;
        Sun, 22 Nov 2026 21:31:40 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm36573136eec.26.2026.11.22.21.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:31:39 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 11/16] python3-typeguard: upgrade 4.6.0 -> 4.6.1
Date: Sun, 22 Nov 2026 21:29:41 -0800
Message-ID: <20261123052953.3658549-85-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
References: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 05:31:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132872
Content-Type: text/plain; charset="utf-8"

Bug fix release: ReadOnly (PEP 705) qualifiers on TypedDict items are
now unwrapped, so their value types are type checked again; also fixes
documentation builds.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../{python3-typeguard_4.6.0.bb => python3-typeguard_4.6.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-typeguard_4.6.0.bb => python3-typeguard_4.6.1.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-typeguard_4.6.0.bb b/meta-python/recipes-devtools/python/python3-typeguard_4.6.1.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-typeguard_4.6.0.bb
rename to meta-python/recipes-devtools/python/python3-typeguard_4.6.1.bb
index 746ea20fb6..2ff9e10b76 100644
--- a/meta-python/recipes-devtools/python/python3-typeguard_4.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-typeguard_4.6.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://pypi.org/project/typeguard/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f0e423eea5c91e7aa21bdb70184b3e53"
 
-SRC_URI[sha256sum] = "e7414f09111317de3e335de92cd397c5c0ca00b1cc1676de12e1d444a79b3f21"
+SRC_URI[sha256sum] = "d94fd3552c5feb6bada6e8bb1167d9916c08d7442141aeb041b847ba9bd1afb1"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
