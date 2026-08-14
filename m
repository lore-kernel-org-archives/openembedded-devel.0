Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B814DC5DF6D
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 22:46:28 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24505.1786747586364765073
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 15:46:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=C6A7GU5Z;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cf6d65d8a7so19888485ad.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 15:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786747586; x=1787352386; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y3LI2qWWpsDiaAB/g5ArLOelLHOzh8LX4twu3ZAiN4g=;
        b=C6A7GU5ZU3Sqmmik+kHFZOsGZxHDicEQXslR0tZFpdi6Onp9uS93KZuVpdT+olxaln
         NNMXqZHjbRUyZJnYdrm/8JkjwUCpl4nWEpHPvnJ7WGxa/bb880DSNRF+KhznRI+vHnkq
         p+MQx7x+loivz3rP3RJQ2kAj/Am1tAuP1HTTJOZY5I/C793k8NOdtHOXQlZfMRc+7Siv
         wiAg8ocBPOJVwZkny8LyBC0shFyf6SyIhhkm5YdNHRaK+eKYMUjH1Cn/KuZzh4yiiD7T
         ICz6SOEQM9rTXWSH9DiA6FjAFz3T1Ctl5tMgPgSujYUZvGkAXhwfGAlT5Z3SagDdcrav
         9VTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786747586; x=1787352386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=y3LI2qWWpsDiaAB/g5ArLOelLHOzh8LX4twu3ZAiN4g=;
        b=TukEZLSdis9I7aQl4qpYAkS6W91llJdF8xLZh61vSxJsCrrDgSwV5AYscx7ALnKPxe
         U+pX0QXYZ31PKoiehJsGdXNHsIoS/bGwrH1fGYg1JBstrg9b4j/rORoco7ZautFo/0NX
         OOu5M1t9eaDtt1YF6+b2H00oDYU+V0kQ/TBCCMNv5iO6PAeWpj5++FnVmyCfeKi5x5+y
         h8ryYwmpwi0C6z3q9eaR3kThaaW9Iol2DHSxkB+S2YUiN5lIY4pVV9Xm8bITOB33VBKL
         UbuyXN3lm2ESK7m0uJWeB7ILVqOybgwA5SXbpAoCmrFC83NA7j3ryEZOR+DpT1D3MKQn
         L+mg==
X-Gm-Message-State: AOJu0YxtAoeEryKW4BaB1sH4ZOhBqSre7dh+SYTja6bcONxpccpzTZTK
	XoaBrpIjWWHYvP1Hau3Zw/qtCGLfpMYgEr/OcMBUpOOIDdegjR5jvV4f1AvUsVSL
X-Gm-Gg: AR+sD11/XNIORmm+FbuMK1fOLsMjH73Dz+eGiy1fhsRP9JTt5MkNEMA6tx2FUgSg/vt
	1XqNjq4/LfN7Bny0Uk4Nv9vCcartI3kz8CSkfwD+v+5sG6spXxX5u0JC6Aca9YSRnvDKRIuTH6y
	QzkSgculPKJmUpnq7qJfzF207O468YV2CKXwSnES3TGdfhO/qDeuWo/dx28JsGEDQTtwrXDCkZb
	obkHplc/Pg2TnAhEy/0PywN6v9IGJ8vDOzKRIyGAcWtkWfRMugsrYcviG2uyGQDanxaUNaHIa3Q
	0oj865qo6qhefW9vZrJhpl4e/ISKQO3GfvZhPNXC6okO3gtkYdmrQ+ZUPF3a7rEl7m5YNXfPQbI
	9cDHEI4upX92TuPisyzoRqR5GOTIjhpRLo03yDVSI8jmsV4uB/VHmE8MRtN84LkoH/8ks3ffMbK
	3nvrxAUI69j1SRpr5J4JzOCo+wUp1BIHwjKzWWxJEL5HHhxyj8p1Iabbv7L41Jyxp1w/AJWiTBa
	DtpdHazzgZVf2Yr7GS+xzSBBPwh+l2lpj/Z6yGMUtMoRL34DKFSf1eShY+5bnNHEVnJRcmJeboY
	sNDrRBly46cpfsmOYVyKTixUqZug8rzr7juvowkhnJeDivSOTj/SZM4ZkKvPcZncBhDHLyyhaZi
	x2KTA4IAZFj6i1t830K53YfJGHSJO9J8HQK6g3U0nycVnHg==
X-Received: by 2002:a05:6a21:4c85:b0:3bf:b9de:8570 with SMTP id adf61e73a8af0-3cc71c58eeamr11560026637.19.1786747585678;
        Fri, 14 Aug 2026 15:46:25 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm14541588c88.2.2026.08.14.15.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 15:46:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 039/109] libsdl3: upgrade 3.4.12 -> 3.4.14
Date: Fri, 14 Aug 2026 15:44:25 -0700
Message-ID: <20260814224539.1523174-39-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
References: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 22:46:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129103

Point release with bug fixes and minor improvements.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../libsdl3/{libsdl3_3.4.12.bb => libsdl3_3.4.14.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/libsdl3/{libsdl3_3.4.12.bb => libsdl3_3.4.14.bb} (97%)

diff --git a/meta-oe/recipes-graphics/libsdl3/libsdl3_3.4.12.bb b/meta-oe/recipes-graphics/libsdl3/libsdl3_3.4.14.bb
similarity index 97%
rename from meta-oe/recipes-graphics/libsdl3/libsdl3_3.4.12.bb
rename to meta-oe/recipes-graphics/libsdl3/libsdl3_3.4.14.bb
index 43690bc4bb..e03ac974a5 100644
--- a/meta-oe/recipes-graphics/libsdl3/libsdl3_3.4.12.bb
+++ b/meta-oe/recipes-graphics/libsdl3/libsdl3_3.4.14.bb
@@ -20,7 +20,7 @@ SRC_URI = "http://www.libsdl.org/release/SDL3-${PV}.tar.gz \
 
 S = "${UNPACKDIR}/SDL3-${PV}"
 
-SRC_URI[sha256sum] = "f07b958a9ac5020fb7a44cadb957f658b2149c3c8abb4f63145fac9303249db7"
+SRC_URI[sha256sum] = "30d4aa2b3037718142b32dffd4e72f917ebb6cc5227150e7bb9c45efb2153aeb"
 
 inherit cmake lib_package binconfig-disabled pkgconfig upstream-version-is-even
 

