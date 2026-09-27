Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A785C9830E
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 10:50:33 +0000 (UTC)
Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34494.1790506225210689751
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Sep 2026 03:50:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=iu4D73mZ;
 spf=pass (domain: gmail.com, ip: 74.125.228.40, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f40.google.com with SMTP id d2e1a72fcca58-87c90648f99so1707334b3a.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 03:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790506224; x=1791111024; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wukVipC4z723W1MkTZe7MTppe+qCpWIQq+76HF1tgKY=;
        b=iu4D73mZtowBAy8P4uQQpOCCKkTw4gjIDHuDShBifJfSrDVGBFnQeiJ0TO0CLFwHcP
         6kl5kwV9swTwf3qpFBq4gUflgPiVOZYr2/8C1xeJfJxwt/yct/idmokW61S2A87jXUwi
         V5paWoJIn9riw/myaJGe6wNTyamFnULuqGGzUQ1VfCZLfR6kknxvUQdQgPYAuhHSM/bF
         TjkuLnpxp+pPldnGi3+GUP0yn5xznCizZhAqw44zlR0vBgpmKcbhXcux3MQsiVfl0N0P
         N2z1JCxVyr+ULxMd3JVe8dCA/n7izD+lFOmdvrRG7UWcweY8ozVW951RGpJOVtTa0Cf+
         AchQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790506224; x=1791111024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wukVipC4z723W1MkTZe7MTppe+qCpWIQq+76HF1tgKY=;
        b=C7zSqtj78LmQ1jkWF5vMU8HYZ38S5GXgupOYv5qP9Qzaem0wTwEn/fTz9CeK0wL98o
         Ff4p+HmVue99O8L6/FoyPJ0J+Xk9FSmB33pEQ8gCE8Ju0CqaQVymRTQyLM5jUD9CA+En
         TpJPAYR8v8q3WJO7NirqrDJT3QUS9BgHurWfQpp/LiaUWfrOF7bA4c6nJ9OcfFprLNs1
         iwSWRoN46knKVqvqswfyPqWzezU7dM48j6ws45c7+K6wwETDakzULPd8TV2kkJfKUKow
         dMXTBqPIwNYH/sjQ8NWg7HbATiqB9m2WdgDVLSen0ykr5kJthBrzbnlNEcdveHgwNjU8
         Qmcg==
X-Gm-Message-State: AFuF++m/rzPJXtzQS0V4I6WUWzputQhwPR2/9KJqQnR5eVl5pdXgH1dz
	Ivyq6+IlikIA4su5mDVeRGFjckJ723MFsqrWicNt7XuuE2O4IYPkVy2mxNpxhA==
X-Gm-Gg: AYBFou3MNesJ8DW/xmQxwtoc1vWzBewTl0tfzRQi/Qmp93X4XlQORZcGr/C93b7+k1F
	l1knbxpKYttMTCKF3tO1oBA0/XkpBNjTaS/HoXvvrXIQ0xmZK/U8pa11/iydc/Nf4H2w2R/MxNu
	8OYWUSkW1HK3VATBL0uIWd7R/b/LEsId/myrmvjc2tPX4HtypvtFivbI7zPtgec52AzGfFtswFe
	Fc7u80/nnEnNR1U3lS9Fjk+UA5W/Ln68CMFYWhzS+YFmrkkfngSULy8PB7XqxB11E+50/suRi7k
	XlX0W58vP0lAcTUh8+weYI/a7RqSJXt6zUPjXsZLZi0uTN4GfAC25J8t4E2OWna6nq3rP7NVUVO
	hylTGl5WPDBWnoIyYqWyi6lnL9DJGiVIl9xzSEjPljiV6OuGC3Rqm9FxREduJEzFRoNr60cpVDA
	K6dU6cnYJUqL0MmVqhnyyA4MkgU5Px9luv9mn4XaHdoVBDdO3Mz9TiQiXy5GxxI86QDoZXklElG
	bAA8/1LtHtRg415ihmNbDg=
X-Received: by 2002:a05:6a00:66da:b0:880:6e3f:a6d7 with SMTP id d2e1a72fcca58-8806e3fca82mr4315930b3a.3.1790506224565;
        Sun, 27 Sep 2026 03:50:24 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88268c5ed75sm640542b3a.48.2026.09.27.03.50.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 03:50:23 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][PATCH 6/35] libiec61850: upgrade 1.6.2 -> 1.6.2.1
Date: Sun, 27 Sep 2026 23:49:33 +1300
Message-ID: <20260927105002.1832451-6-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260927105002.1832451-1-ankur.tyagi85@gmail.com>
References: <20260927105002.1832451-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 10:50:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130340

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/mz-automation/libiec61850/releases/tag/v1.6.2.1

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{libiec61850_1.6.2.bb => libiec61850_1.6.2.1.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/libiec61850/{libiec61850_1.6.2.bb => libiec61850_1.6.2.1.bb} (93%)

diff --git a/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.6.2.bb b/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.6.2.1.bb
similarity index 93%
rename from meta-networking/recipes-connectivity/libiec61850/libiec61850_1.6.2.bb
rename to meta-networking/recipes-connectivity/libiec61850/libiec61850_1.6.2.1.bb
index f87bedf649..d2fbbc53fb 100644
--- a/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.6.2.bb
+++ b/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.6.2.1.bb
@@ -13,9 +13,9 @@ SECTION = "console/network"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 DEPENDS = "swig-native python3"
-SRCREV = "f0f797bf955da763353f7081c892a1ff6b55e5a1"
+SRCREV = "6e7a603c771d6124cd3cafea7ec38b7e0f2e7aaf"
 
-SRC_URI = "git://github.com/mz-automation/${BPN}.git;branch=v1.6;protocol=https;tag=v${PV} \
+SRC_URI = "git://github.com/mz-automation/${BPN}.git;branch=v1.6_develop;protocol=https;tag=v${PV} \
            file://0001-pyiec61850-Use-CMAKE_INSTALL_LIBDIR-from-GNUInstallD.patch \
 "
 

