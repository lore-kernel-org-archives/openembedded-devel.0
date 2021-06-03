Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web10.5.1622754344158539071
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Jun 2021 14:05:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hGxeROOT;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id r11so8657339edt.13
        for <openembedded-devel@lists.openembedded.org>; Thu, 03 Jun 2021 14:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=rTk/RG/wAd/eE0iIS36cHRHvCiGYS5hjY0Hg+so1/UQ=;
        b=hGxeROOTdEIq8wFLRDKjYwIENElyzaVt11QraD77ReJ7wpB0Hd5s6OXtSmCeY5H9sW
         cEPwAfPue9JX98RCWgIDl0KW5Lj/sIajEW8m9ds2anJFe83s7RNYTb6bpzsK1dQbXItl
         3TjouCgA0XZb/fI6Z6llfZ0J6AH9iDlKw6uS7FWCl6N6KhNlo008hZBtAHr1jUMSu9pa
         10VFsvCCH/ffCCk1IbYdfEpcFpFlmcplZXDvUMQJ6xgEapKxf5LoylQv38z1TifigJmm
         lmEGufbnRWnDmL5i3GiqyOq/14Y/g8pSp9kGN4BLNWF2LciU+fv/ayboGnozPd9C93Wa
         XBUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rTk/RG/wAd/eE0iIS36cHRHvCiGYS5hjY0Hg+so1/UQ=;
        b=jEO4xQwFth+eqWFCUYvOPQhG2X1hSpUsX0KVOEj8Lp07Wq94g7Oirsu1OhYcKNrubH
         LQRa4/XSZDNrxcPV0GkEpXZmMTOdMCPbZTivLt93gTu8rQXgkb6zFYSGg55R8j96yGLF
         KxKiU9Y0bDBF/eX2poxojny1mKtgVutvoAk9A3Iub69Pqcf0fZKKio5Jo8sEPQmudqlK
         QBsbDYybEve4NsFQ7RgE44N6eLWYEre3MwwTPbwjna4KK7Lbl28paWTiu1RAWgZG2dPH
         roTUb9zrY6y5nXa+DN6vBbv2CMKolqAkXWzBei8shzItesO1G8mSzV1Xq46mqyfXSJqp
         PtOA==
X-Gm-Message-State: AOAM532kSKsWo+SQsSkOg/VkAcrjmV3WkTcKHYHE3ehApv64GmZrPrrW
	FcRhoBjPhUwSF3MyU4HcMaIeEzlsc7HySQ==
X-Google-Smtp-Source: ABdhPJxay+wJso8U/Ai9YIieaxC6mTmgFLJ+rNjwrq09fUr3Y1GbT6L1WFRxlbqvJ2j7bIJ3vXZT4w==
X-Received: by 2002:aa7:c9c5:: with SMTP id i5mr1315384edt.160.1622754342825;
        Thu, 03 Jun 2021 14:05:42 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f11f861d707ea86d7bc33dd.dip0.t-ipconnect.de. [2003:f0:7f11:f861:d707:ea86:d7bc:33dd])
        by smtp.gmail.com with ESMTPSA id j22sm2020050ejt.11.2021.06.03.14.05.42
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jun 2021 14:05:42 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 5/5] icewm: upgrade 2.3.3 -> 2.3.4
Date: Thu,  3 Jun 2021 23:05:31 +0200
Message-Id: <20210603210531.2314701-5-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210603210531.2314701-1-schnitzeltony@gmail.com>
References: <20210603210531.2314701-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-extended/icewm/{icewm_2.3.3.bb => icewm_2.3.4.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/icewm/{icewm_2.3.3.bb => icewm_2.3.4.bb} (94%)

diff --git a/meta-oe/recipes-extended/icewm/icewm_2.3.3.bb b/meta-oe/recipes-extended/icewm/icewm_2.3.4.bb
similarity index 94%
rename from meta-oe/recipes-extended/icewm/icewm_2.3.3.bb
rename to meta-oe/recipes-extended/icewm/icewm_2.3.4.bb
index abc3e098c..f80611356 100644
--- a/meta-oe/recipes-extended/icewm/icewm_2.3.3.bb
+++ b/meta-oe/recipes-extended/icewm/icewm_2.3.4.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4a26952467ef79a7efca4a9cf52d417b"
 SRC_URI = "https://github.com/ice-wm/${BPN}/releases/download/${PV}/${BPN}-${PV}.tar.lz \
            file://0001-configure.ac-skip-running-test-program-when-cross-co.patch \
            "
-SRC_URI[sha256sum] = "4162565cf7566d78d786e4ecf4b0639451b8464bcb24e761b1f08ef43e95e513"
+SRC_URI[sha256sum] = "1368f7db61589b1309274a2fe7250961e21904a294b1cff2c13273abd73725f4"
 
 UPSTREAM_CHECK_URI = "https://github.com/ice-wm/${BPN}/releases"
 
-- 
2.31.1

