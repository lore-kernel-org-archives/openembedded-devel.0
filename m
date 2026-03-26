Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0BF010A88D4
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 15:22:14 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50971.1774538524905948523
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 08:22:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=TBPe/Ttb;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-486fe655187so12734435e9.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 08:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774538522; x=1775143322; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fs/51sPJhNAB8qPnr3/x61/Cu9wXIoMKdnPHDoaaa+Q=;
        b=TBPe/TtbDCqPNrPtVUW4HDE8q4NOVTmRDhQt8XcIrTguyKuCCGrSrww/zan41vBoww
         82IogCrbSXHPqQmAQN1AShYpN7ugbbP1Ace6hkjZ/ej1+29z1MgyDXGZ8kW1V2sMx/3g
         y45qDN1zRiFdmcHSld8KSbIKfYQ7PSSkGwXymHLqKF7JVyxIqrcVrh3VM8D84Qz1w0nl
         gijRfVDoWdTbmBfcpHZi+SRnFzBdGtGj3Oe1wKX93BJx2/S2xEihEMq/D4fzxwK5ElDg
         Ha3APQ5o3v/P8E6TgHQU2+diisLUja8B41Uwv6OVEtZK/QICRSENplePnHFO+x6hWocl
         idDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774538522; x=1775143322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fs/51sPJhNAB8qPnr3/x61/Cu9wXIoMKdnPHDoaaa+Q=;
        b=fbNrzyAPq0E+pOVYyzHd9hDr0JgcEXlU46+ILmm0xXdLpMCC2jdcx+H/YUmM4jTCKf
         Nra4/zmyjE7bJsxXsecJoZ55rGNz1W52J/z9nlwZN63GPh3jVT6p3odtk/iHyO8HCV4r
         knyuh9QciY4vxINeDN7PzQYbg9YnaMzywo+xSymBTrkZbU+aYeBRvohpIlTF8ZbvTpTi
         mJZf+jJKKCOwCBJGl8qiieETF2UTTAh4ZRYoGlGk+/cnZ7OiLUFHRvva2BneixaPd8xa
         I64InEmvCIMNoBcrkXEcRJQrR585vmJ8/UFywxv5ZDxscAd8SM6K4TSgdVgX1+b+H/Pg
         OlSA==
X-Gm-Message-State: AOJu0YymTMUYHPfVHGA4mQum/uk862+cqGti7qJCj9JnQLMsXlgr+8Sq
	1aq8dVb+MF3yuXYPyL6TiRlyZZbHipM8d5m7TTddy/050UBzSA4v6p/o4V2jHA==
X-Gm-Gg: ATEYQzxw2Gy9AYWof9OoEpK/6wDgk/zGEGHhFyef6TEHbysy3vK/uKIR0ZfVlZ3onea
	RNh6f3dXXD6G7O7UPU6ZMkh2js8D5HYK1zfsHqNueU1egUlFrTjlZzTkif9SbRJVxWQpv6Aq9RK
	TBKCjTy4XQzoRNMTnR0Rw+lM+i8UIhz/iHGzKxYqvMZl9DIq/NSaKoDzJdc/sO914fp0efiDrRW
	kUYwYUqGZih6I7ugC+cITXzfHlD5fh07uGV6XF+OueqHtYLBP/zX62Z77Keh3CIk4bc/YNwZsgF
	GUM+us9brE+UU8bJi9+WHnpavzLJQqpaVP3s7Anh3aklxPNNDWtasFEEE0vawoDhRZu4sYXKxaw
	RbIVLYzvVe5kTXqs6BMvm1X2G1Uo/J2h6ZkQgj0HrDvPMBUNjDtT/J0+KeSgcTL/IXqsst3k01I
	z7s2z+2PAPdc1dQi1sktElZEo+
X-Received: by 2002:a05:600c:1f12:b0:486:fe23:1707 with SMTP id 5b1f17b1804b1-4871605a99amr115390895e9.20.1774538521909;
        Thu, 26 Mar 2026 08:22:01 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48720925591sm16478935e9.25.2026.03.26.08.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 08:22:00 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [meta-oe][PATCH 06/13] isomd5sum: Stop using PYTHON_ABI
Date: Thu, 26 Mar 2026 16:14:31 +0100
Message-ID: <20260326152143.2224099-7-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326152143.2224099-1-zboszor@gmail.com>
References: <20260326152143.2224099-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 15:22:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125745

PYTHON_DIR now contains PYTHON_ABI, use that.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta-oe/recipes-extended/isomd5sum/isomd5sum_1.2.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/isomd5sum/isomd5sum_1.2.5.bb b/meta-oe/recipes-extended/isomd5sum/isomd5sum_1.2.5.bb
index fc94d2caab..f1e0efb238 100644
--- a/meta-oe/recipes-extended/isomd5sum/isomd5sum_1.2.5.bb
+++ b/meta-oe/recipes-extended/isomd5sum/isomd5sum_1.2.5.bb
@@ -16,7 +16,7 @@ inherit python3native
 
 EXTRA_OEMAKE += " \
     DESTDIR='${D}' \
-    PYTHONINCLUDE='-I${STAGING_INCDIR}/${PYTHON_DIR}${PYTHON_ABI}' \
+    PYTHONINCLUDE='-I${STAGING_INCDIR}/${PYTHON_DIR}' \
     PYTHONSITEPACKAGES='${PYTHON_SITEPACKAGES_DIR}' \
 "
 
-- 
2.53.0


