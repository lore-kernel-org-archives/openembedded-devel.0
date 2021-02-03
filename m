Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com [209.85.167.67])
 by mx.groups.io with SMTP id smtpd.web10.2159.1612383363563688037
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Feb 2021 12:16:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=NV3reysw;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.167.67, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f67.google.com with SMTP id h7so1039476lfc.6
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Feb 2021 12:16:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=36679R10DPn38ldm9bHoy7O67pKtkBvzRWuv7gtXXOQ=;
        b=NV3reyswfSU2pyOox5XbijIuoYFu1sKftgVO+aV3C3K1MHKoR7L3ruSJeQP6nr6vqh
         nnnbihGbbSZB4rDNCIGSr2nah/lK5k1qOwC8tGtvb7x+whFLoRaFSB+xAV2FncaFHzn2
         VdX6ZmJegEzPMDceGPG8M0fzi48KtJG0/m4Yql1aO7WR25CIS1IWYk9JVAjf0Mfgj4+k
         lUxaB55jntqP1rJ+00qmCBkQNyWUkQ3J+7W7vHCR+To6+ecX2zsMf/mEwD/8nb7Uf80d
         0wVjooacKVVEDGG4CROmA//g3Z3nBqX9gUdCrJfdiesA+U9KhqpOGCGl/PlUYvakdKEw
         Dciw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=36679R10DPn38ldm9bHoy7O67pKtkBvzRWuv7gtXXOQ=;
        b=L8AnbQqMy+urUwulyPTmOC+HC7ZnvcMqhROVBWH255r7zguv5R7cQMNERZNzJtbURB
         CDyulz94qjricWlQNiB9CFjMuCv1dvNGeSyMtZvH4E5cwMRAbGdtfAR9WNhPcDQArJUZ
         3/GScVVgf7Dn9MxdujeUP9rs7OyYAjaoDTuF019ehWePyJGBDnDpBtnURpswwVuw8vAQ
         gK9aBuzkrsUR5IZ0g3wlqBQQW9GYbLcqbSS5ESbKEcW3vDR9iAlQLDDz6AGP7zeJppb7
         MDvJUrhHoJvx0s7nIFyixpan5byPGIod5RYqq2B7310bVFdFG2hQXLPhHAfVqX5PIV+L
         K37w==
X-Gm-Message-State: AOAM532OCxt10w35Ug4j6FnP7YjEap0D0fryUIyOpozskv756uu8Qh6U
	xv8NLnFHIcb27/+uuNq4n6ZIZRCuwJa6mh2E
X-Google-Smtp-Source: ABdhPJxXmosuBiLdP3MYly+4drcVep4Uon3dmGEubsT83TicJORi6Am2G7zOIKA+zcBpMqAhsdxhQQ==
X-Received: by 2002:ac2:57cb:: with SMTP id k11mr2496764lfo.223.1612383361314;
        Wed, 03 Feb 2021 12:16:01 -0800 (PST)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id v23sm340641lfo.43.2021.02.03.12.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Feb 2021 12:16:00 -0800 (PST)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-support] nano: update to 5.5
Date: Wed,  3 Feb 2021 21:15:58 +0100
Message-Id: <20210203201558.1431983-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta-oe/recipes-support/nano/{nano_5.4.bb => nano_5.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/nano/{nano_5.4.bb => nano_5.5.bb} (87%)

diff --git a/meta-oe/recipes-support/nano/nano_5.4.bb b/meta-oe/recipes-support/nano/nano_5.5.bb
similarity index 87%
rename from meta-oe/recipes-support/nano/nano_5.4.bb
rename to meta-oe/recipes-support/nano/nano_5.5.bb
index 68c326b52..29ec00a79 100644
--- a/meta-oe/recipes-support/nano/nano_5.4.bb
+++ b/meta-oe/recipes-support/nano/nano_5.5.bb
@@ -12,7 +12,7 @@ RDEPENDS_${PN} = "ncurses-terminfo-base"
 PV_MAJOR = "${@d.getVar('PV').split('.')[0]}"
 
 SRC_URI = "https://nano-editor.org/dist/v${PV_MAJOR}/nano-${PV}.tar.xz"
-SRC_URI[sha256sum] = "fe993408b22286355809ce48ebecc4444d19af8203ed4959d269969112ed86e9"
+SRC_URI[sha256sum] = "390b81bf9b41ff736db997aede4d1f60b4453fbd75a519a4ddb645f6fd687e4a"
 
 UPSTREAM_CHECK_URI = "https://ftp.gnu.org/gnu/nano"
 
-- 
2.25.1

