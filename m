Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1483.1793731036014447958
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Nov 2026 10:37:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=DaD6NIJt;
 spf=pass (domain: gmail.com, ip: 74.125.82.53, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1438d9363fbso993338c88.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 10:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793731035; x=1794335835; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ENva+W92l4YZPhPZCKHF5LQP3G0a6G+atDj0aKelDRg=;
        b=DaD6NIJtXHC7S9+SKcD696cinyQRf9eTKaXWh0sdbVNyZQn2OQorw5QOh0Aq+OCYs1
         F8C3nwiAk7RG+QA3FAxP55zJwJn/5H0bpY8TMDU+GF9durNhByzZt7pqz4JGDrqRMW1B
         SRqmr7a9I+L+rY+OmZcIheMikoj5bhZA4xSZDKzxXDO+2d3WQp+5U34yY9TGC0iY0LuP
         hG3vFYn16Irg9PQYhOyu7KTpODvJEO6b41zsL+07dBKAbd4/FI90Q+1hRCnkgw89U/PO
         XIcW57lG2U5sAMZvDLFjs+QelYve9T6PgAJkc8flYdgBDN44vIghl2O/jUHKgqahw81z
         T8lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793731035; x=1794335835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ENva+W92l4YZPhPZCKHF5LQP3G0a6G+atDj0aKelDRg=;
        b=sH9I6cfDSt8F//x/rNv+By9m8INDN1xnBS30IFCKOQp+DFn0me/HYYJyayWqWxb/hz
         u6WjK08aLQmLUrpgZFOFTYJA8Ky/2e0dROt10lRfFOLqnhR1rwFbXthPYCPPWmZ68LBk
         eFAJ3en/3xIhO1xULSgwpU23YW7hexEsn77CRdBvcVmeUMjUcyJTDhTF5LchA4GUQYbv
         hUZ88bsYdYgO/XGf+VYHU25R0tTpjyThfzW0QI2QKG4npI6LeA0D35oOXEvH8VnSDHVq
         hBqEnX8u8En7m1EctqzyYdxNpw/UjtZbV+8YowtoQquLFp0Xetbm+SGn9G5OaRaHRDDS
         57qw==
X-Gm-Message-State: APuU4Z8Rx2/Bpm2Rg3wjx428QtE2vq33neBUNfeLnlY7CC0IT6M0vPAM
	qjbaRm5vrqozDKCp8LnG9RlDK71BIbkQm3lDQRtUCzDi1XL2JqL/9AbqX7K5Jg==
X-Gm-Gg: AYBFou2ZBrhN3OK0kcRhg14+xDUd+yu6U3TiVK2OyCjKeKSPEhdVZMw4Y/1TFxxOHPn
	YXCGlqF3a7dnNhcRrWX0wPxwV4GJUTrTAQFcQHUxM7gUDDsWoG6u5W7KHtRrbwRX7FJ0Sz4UFAk
	RDVt8nIXsz2fv1grcC/QZDG4e8yt/FWKeQnmHNZRmyFe8LxajE1U6lHHSJ4ICQfXW/zdTsum1IK
	IsNdpnfu5aY2tnb02K09SrtsgBH0vzjN6hntxhTp/HCjCtEDnYOOFE18Ez3I2EZtehkCMqa+VvV
	K/MQy683e0isQBWXw0zkSwUZ83r0zw/nlaFu/exJAcsdmy3dRoxsiSOx938nltY+R43fLWL5rYs
	YMYACp/cLauTfDEozhIL4H+5/yRsfdGd7WcCxOnGTo7j7xrNInzo1IfUH1OEuu6Z4xThaDOyKZl
	AFUoM1tGe7PV5EJ6lFqntrcjGO6KzdWuaude9nXSMPQcAwzQ6btSUBxvQzyDgYWNnonmfrpNTkZ
	aJ8kD/OUYjhwG/frhNKRKzCbhZcSDEbdlu3q2rJRGO7xmWN8FAWEq67CjsZ0CUcwVHbk//bCZaT
	ZULAB4gRDK/mKYcC5ISbXUpZjuWKaPSFkUQk+Yx7rfdP/gOP01yVx/TYpZEkAA==
X-Received: by 2002:a05:7022:f90d:b0:151:7831:e403 with SMTP id a92af1059eb24-1ac5b027fbfmr16970454c88.13.1793731035249;
        Tue, 03 Nov 2026 10:37:15 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c4f83fsm1192887c88.17.2026.11.03.10.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 10:37:14 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 15/20] grpc: upgrade 1.84.1 -> 1.84.2
Date: Wed,  4 Nov 2026 07:36:35 +1300
Message-ID: <20261103183640.919438-15-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103183640.919438-1-ankur.tyagi85@gmail.com>
References: <20261103183640.919438-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 18:37:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131813
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/grpc/grpc/releases/tag/v1.84.2

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-devtools/grpc/{grpc_1.84.1.bb => grpc_1.84.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/grpc/{grpc_1.84.1.bb => grpc_1.84.2.bb} (98%)

diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.84.1.bb b/meta-oe/recipes-devtools/grpc/grpc_1.84.2.bb
similarity index 98%
rename from meta-oe/recipes-devtools/grpc/grpc_1.84.1.bb
rename to meta-oe/recipes-devtools/grpc/grpc_1.84.2.bb
index 274aeb4ba3..db0725db3f 100644
--- a/meta-oe/recipes-devtools/grpc/grpc_1.84.1.bb
+++ b/meta-oe/recipes-devtools/grpc/grpc_1.84.2.bb
@@ -23,7 +23,7 @@ RDEPENDS:${PN}-dev:append:class-native = " ${PN}-compiler"
 # Both dependencies are mutually exclusive
 # RDEPENDS:${PN}-dev += "${PN}-compiler"
 
-SRCREV = "b0c0c4f8823ba69e7e43aaaf183c30a43e549924"
+SRCREV = "41ee9aad18b902ea75a6ff5505d71dce6082613f"
 BRANCH = "v1.84.x"
 SRC_URI = "gitsm://github.com/grpc/grpc.git;protocol=https;branch=${BRANCH};tag=v${PV} \
            file://0001-cmake-Link-with-libatomic-on-rv32-rv64.patch \
