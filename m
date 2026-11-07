Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11964.1794070356624398122
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Nov 2026 08:52:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=ZeC8/8ET;
 spf=pass (domain: konsulko.com, ip: 209.85.221.41, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48e46e449e8so1001860f8f.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 07 Nov 2026 08:52:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794070355; x=1794675155; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xzWt2IjHrWk6tW9F7l7RXPnm0UFfnz1atusLPQghpD8=;
        b=ZeC8/8ETrj1vPV6FZVI9FG7Q1qPW81Ydo43UOjejtYt0lhCLCMO+peHWRFthsQXYWA
         uYQsTRmlFhEtyrXwl4Gz0KNNSaPoLqQO+kzDBcpaxg7nXoG22qPk+KmMReQP0huL8Jty
         M8mWCObDlowQvLBfoNLlyL2mMJjhHmOvJ2PcY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794070355; x=1794675155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xzWt2IjHrWk6tW9F7l7RXPnm0UFfnz1atusLPQghpD8=;
        b=rT/fq/dlKtkTbSEi55eVlZvfbWa3F+Xggp/yRr2KfPDP7xg9lvL3GXR1xJtNWwjMZu
         JuAQ/BZYa8BbmvPk+8J5+9iTEBZF4aomjoxO92Xqqh6DtrAlToPAencvSLM+yIqemMN8
         U8W7QyHQR+oeegUz95/M0/JWgdOKGlAUI0NZPIEO5hyxqVanpyFSAsOu+Iu6qsXZHLdX
         hAHDwMXsei7qm9lCIzWMR8YA/K2exwHlFdPgT7TgNjcYSEZlK0qPeYr2mPtJYj/K40Sd
         gGR5EX3Ou2Nx/kg2uF0CGVGPNHLGqwzMO2+BqwqJBTXnnlvbcWf3CIfcBjifW4xJ80Ej
         WjgA==
X-Gm-Message-State: APuU4Z82IVXZ1iP14qvoHLKFw9esuzlSAnFxIknn+YnOgr5kMQsHLSW2
	frxqnv0ZfipoAtfYWcFL9aiLspUun/HvKu1YUvXJK8Vs9y7r0swJEGHqHplUlS3FXKhqogJSp4U
	IU04B
X-Gm-Gg: AYBFou2ZjxiW3glTUNcfUxIL3cqOA3MSu+BdWj9u8fsDmNsoCmjY3O3IJW4mU6tFeJc
	jEc/ipBsI0phuntCPbzJF9z0Jk2AGe+H56PJYGAuJNWri0gtxTet8Z5xu9ilUKpjtF2aEb4hDlp
	oMJdSghHbNmOaRmleFyfSlbkbPDubbVLuyS/r/Iy45hRVx9lXMHW+EWy7ffHYnSHOmW2EoznbZ5
	e5vZbqtstns+WvoDirHZ5qR0svT/dOBm1+OpW+7SxY5CfOxvzQ0jGkzG2scJHUBb5h/JyRfL+Y0
	QEgjmKJIeJ/nhFOOZ4OLQWW2OsvMCVGBsm0tvnzvW6cDSris7HbHIMEKVDioxO/VwvmPkiGTQ2s
	cfW/xIYe29RL4rFKVOCgoNChAQ2/qVe/HgHqlReaftBhCyk7vSYFnkY2Ov4uioSJTxpiaKM0wng
	XnMfrKLSYTZKUQG6Lqi0oulWA1xXZmALxB6QbNfTh5bk4GZ8/1YCeoDUc5BUq7JdRxVwEJ/J8SK
	upXL4dQ0lTwyyk8jbx/yG4N5KgnGyjo5rU8v6w+znVMcRuJV9ffcWEhNIFGh8Xn7uvHZc2VhQJe
	Rc3srse1ghqaQFivT1mTPPkSzftzAIwFyhaE2s45lLWrqmjN5vnxHlshnzNbyck4sY+HQfkw5jK
	1qCyeStdKPz5RrTBrQhVRC3foUVs/QnpgM8Ba3VMTc2o+EgvHofZz3A==
X-Received: by 2002:a05:6000:4697:b0:48d:f460:2c62 with SMTP id ffacd0b85a97d-4927721a74amr7403476f8f.33.1794070354921;
        Sat, 07 Nov 2026 08:52:34 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4948a99b9b0sm4127090f8f.4.2026.11.07.08.52.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 08:52:34 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCH 11/22] ktls-utils: Upgrade 1.4.0 -> 1.5.0
Date: Sat,  7 Nov 2026 18:52:10 +0200
Message-ID: <20261107165221.122340-11-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261107165221.122340-1-leon.anavi@konsulko.com>
References: <20261107165221.122340-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sat, 07 Nov 2026 16:52:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131996
Content-Type: text/plain; charset="utf-8"

Upgrade to release 1.5.0:

ktls-utils 1.5.0 2026-09-23
- Implement DANE authentication of server certificates
- Add nfstlskey, a tool that manages NFS mTLS client identities
- Add support for GnuTLS URL-based private keys (PKCS#11, TPM)
- Enable post-quantum ECDHE + ML-KEM hybrid key exchange

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../ktls-utils/{ktls-utils_1.4.0.bb => ktls-utils_1.5.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-kernel/ktls-utils/{ktls-utils_1.4.0.bb => ktls-utils_1.5.0.bb} (93%)

diff --git a/meta-oe/recipes-kernel/ktls-utils/ktls-utils_1.4.0.bb b/meta-oe/recipes-kernel/ktls-utils/ktls-utils_1.5.0.bb
similarity index 93%
rename from meta-oe/recipes-kernel/ktls-utils/ktls-utils_1.4.0.bb
rename to meta-oe/recipes-kernel/ktls-utils/ktls-utils_1.5.0.bb
index 2798f307a5..8369723770 100644
--- a/meta-oe/recipes-kernel/ktls-utils/ktls-utils_1.4.0.bb
+++ b/meta-oe/recipes-kernel/ktls-utils/ktls-utils_1.5.0.bb
@@ -8,7 +8,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d568123389d9a12625cca2b089b1728b"
 
 SRC_URI = "https://github.com/oracle/ktls-utils/releases/download/${BP}/${BP}.tar.gz"
-SRC_URI[sha256sum] = "acd9e1851e492e7e16b879b30fc800f4a98d4214fa534ebb7e24d379f5984770"
+SRC_URI[sha256sum] = "5ad3efcc0f50d147adc9583df1a2c1790eddfe29a9c6e6f0b82d71a5c3490739"
 
 # Release tags are "ktls-utils-<ver>"; the lookahead keeps -rc tags out.
 UPSTREAM_CHECK_URI = "https://github.com/oracle/ktls-utils/releases"
-- 
2.47.3

