Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A55C6C55178
	for <webhook@archiver.kernel.org>; Sat,  1 Aug 2026 21:45:45 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13600.1785620743684411821
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 Aug 2026 14:45:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=FsRjLkVB;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c9aea40d799so1146534a12.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 14:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785620743; x=1786225543; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/liLeSwCce2qrEA8RqMmsznNsc9LEsziar5sBQaheSQ=;
        b=FsRjLkVBx9tjCN1ND1UsGjB04mIv+FkguFQIszu0avCmOCmHyHCc8647Xn+g2eORAN
         vDQW7/NAQuIqzyHWg+6KWlYoFLi9CsUZhSG9THqpmql417wRegoOOPbYCDCTTB1YvRzH
         014x0ykIkp2gmbUQczmJSc70HpJC5bFJEGGfbRchHSlF38SA6F3eis8Ux0oEdbhSqRrm
         KLrzYdapH/WI2maIbvw0N8ZoCcOosyUvlN3GMyNvWSBJAxBHWRytAflCnEWKq2gRg0gx
         ilJzjJwVA900iZ/ebZT6hEaGJC7zWTtZ+YonLNbyHEkw3gZfCMYEOQjTdLJNlGk3IQj6
         kaNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785620743; x=1786225543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/liLeSwCce2qrEA8RqMmsznNsc9LEsziar5sBQaheSQ=;
        b=o85Md+0FASwQIo2gqGQh/fPWssNU6/lNWb0EiXpE+YHocYlIUEpZtjpQjiKlF9HS1u
         axBuoXbj6Yj/QC7Gl01AB7xZL1xoibsBmjKSbt6yiMQZR4NsLbPjcysM5mZQfAVjTr1S
         5w51H8BSX5+OnTbcukWD3CZXQExxvs7LR9KyOSRqfYJXOoMe1o8pFVQj2HC7QSR4hdyp
         KAzCg/03y6tj1cUxFaSTwsOXa/HGZ2/81QoRF7t82iM7aE5JfL6Me2oM4LrjudvjVw6O
         +6Fb1nqvAsglrPQ8x/sRzE3MyvZKJvmry0OqSJlcbdfTCh6cMqbFWcJAtWiqZxcNxQ+n
         YD/Q==
X-Gm-Message-State: AOJu0YzWFVrvJH5ZujgCZx9bKbqOj+3tw2ShnUB82zkPGwgRRTbyhYvV
	dqehwqw7Zjbm+afD9YJF8O9f51vAPZqyns6N5dml7LjziunZgR9HC8ifTzDsdvqz
X-Gm-Gg: AR+sD13FPu4BrlWv/1tLEhI7nJWo9DeCsLTFgAFP7oz6jgX+yxwJFXaA2PaaB3T46qK
	zicHzt44hD1zy77iIvWeCT3CmiBTp0Mn63tEeyw8SOdIiRojCqwyC49f8AiPOemrB6Z64QRdJt1
	4eIb1JoJHv7hDYpG2b6yONRD9ynjurodB0Ga+VuJSPgOhf/FaIGcAMQNz3xOFKo/H0ddrexSpzJ
	pmRWAxdzbukh2JYK5DQ1aXqDSkBJjlium7aGBK55nbiMJr0gQmPki25xQWJWlK2IKyuAAugmdPh
	ngaMm3Rh2UcSjAeD4GDLaKHg5XixkdGD53tzyV3sBaR7uduRa8v9ny5ICNSEv1cNXP6tAWF3cz9
	VLY4Ns4l02jAM+/beABsPJ7/VvuH5ZdnlE1diIkqW0BAJSKkEeHM6A9byifwO8vUs5mMai0B9MM
	dL6lWsv6X5vh38kAQE/8rFUOO4iNluy2+FtoK+BAe5+vHA2SnWTZxSwSfi4A8CRcJ1Fre89SrDC
	eMCMOzUdcDLmPS7kcXMwTjFqNsum2euVuhbFk5dO4dn9FxuHGhAaRBjXO3P0s6sztKMkJKyNFly
	agQI7Z4PaW5xWFuKYO0pjW+1yES4ejK1XP2k1rqPzIkT7QTCkLLFV0vJ9WpTS5qi+cqPhugsSRn
	BhWPFApJWcHPO0g==
X-Received: by 2002:a05:6a21:b90:b0:3b3:486f:f2d1 with SMTP id adf61e73a8af0-3c92a598649mr5048305637.3.1785620743067;
        Sat, 01 Aug 2026 14:45:43 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd4e5b0sm19105102eec.1.2026.08.01.14.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 14:45:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-multimedia][PATCH 15/31] gupnp: upgrade 1.6.9 -> 1.6.10
Date: Sat,  1 Aug 2026 14:45:10 -0700
Message-ID: <20260801214526.788343-15-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260801214526.788343-1-khem.raj@oss.qualcomm.com>
References: <20260801214526.788343-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 21:45:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128632

Upstream changes (NEWS):
 * Require GSSDP >= 1.6.5 and reuse its allocated TCP socket for the web
   server.
 * Do not leak a GError in the ACL handler.
 * Fix IPv6 host-header validation.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../gupnp/{gupnp_1.6.9.bb => gupnp_1.6.10.bb}                   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-connectivity/gupnp/{gupnp_1.6.9.bb => gupnp_1.6.10.bb} (93%)

diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.6.9.bb b/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.6.10.bb
similarity index 93%
rename from meta-multimedia/recipes-connectivity/gupnp/gupnp_1.6.9.bb
rename to meta-multimedia/recipes-connectivity/gupnp/gupnp_1.6.10.bb
index e2bfcb5ed7..6ba8a0689c 100644
--- a/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.6.9.bb
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.6.10.bb
@@ -7,7 +7,7 @@ DEPENDS = "e2fsprogs gssdp libsoup-3.0 libxml2"
 
 inherit gnomebase pkgconfig vala gobject-introspection ptest
 SRC_URI += "file://run-ptest"
-SRC_URI[archive.sha256sum] = "2edb6ee3613558e62f538735368aee27151b7e09d4e2e2c51606833da801869b"
+SRC_URI[archive.sha256sum] = "a1ee07b7b12673c32d7fc73ca158a50c1a4dc69ab35b65e94d24d38ac875345e"
 
 SYSROOT_PREPROCESS_FUNCS += "gupnp_sysroot_preprocess"
 

