Return-Path: <andrea.ricchi@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA8E8EF8FFB
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 15:44:34 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21412.1772639069610996521
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Mar 2026 07:44:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=fiiYZRU1;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.221.51, mailfrom: andrea.ricchi@amarulasolutions.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-439bc14dcf4so2079279f8f.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Mar 2026 07:44:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1772639068; x=1773243868; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AmFiI6y3e5qk6sloI3J24ZIh9apo2ZTMJkKKQjpYu3E=;
        b=fiiYZRU13U4OO3Cck3ZhTBbAlr0EIRTeI9JlD4qEQ8BAOx9oYOpA9cE9EM08+oSHHR
         22lHsNYQXvdLzKlRgU6abadjukG0NqNDHhQ0WV44FooGE2lAoX+P1dTUtTlKl16/wnyn
         SH8Gc/SW39UVR02gtwhQwtP+mnxVyw4/Wj4bw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772639068; x=1773243868;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AmFiI6y3e5qk6sloI3J24ZIh9apo2ZTMJkKKQjpYu3E=;
        b=fgybsF4zlc0pw8hK5dh7Jj6P/I3BRMDAJ8RxsH0VBnqZ9FDt/iiqA+CiiIqXtFMpfU
         u3e/hVkixp+F9ur1FGlwRB9f/exeGr9p7J+3s+h+JE+ZHT0TRrRayJLFYRW6VOPlOI68
         rOt6T1mLwBKufxOvfXFEPTi5iyawTze6ZIoEfq6DdDZwWBkKCpWFHqIswfQhUYth+RBk
         MGMdU4VFhwINZPp5XVn74So1tUBqlajH2kysVg09lXl0ErV7DGR8qF6ow27aKSKr89Wt
         MFtVs07RXmHv0ezfKMNPWMKqVHMZf4HRN/nPZUaRhd8ByM4sjl0KG2cfWUlef0ZHITRH
         KkWw==
X-Gm-Message-State: AOJu0YwhiWlbD02yhxJLvK/dFkVdThidXFRK0wEW2spBd1ygjKQypLvd
	p9TjksdKwT9dgX7KsV7UxJ/WH6uCES1v/KZGF6xht1DVUyPaCL9OlZuu8ANyrS2nG0oDJnAIWfO
	vElGv
X-Gm-Gg: ATEYQzz9nKwWEHPCeGydwdnTAXxwR9BQzvtxFfgjOeKRoJnaCwqGKWdoWgqZx52QgeX
	i/nzl6aBbVJ8nc302arGUXmq3+RgW37lS6qf3YT+GS/itSji0uJeai4uRzkO+tWwUfTTgILqT5K
	kkLkDxY+wK0jemJWUgSaNYVa6iU/QfZhnehqUYwM1dWDTTsk9aWf074BAdPmclK53i5WTPo6mb5
	tl+QDkbUWVEenbLnNccGBWMBqgLpellzYx5LLh8nGV/kUggoHpjdOS2a1gG9Bf+M7MXV1dEkXs8
	DBdznMm4UufU3rbvz9zEjJFG1YQTp4KUtdZxGtNt8U8sBRWsQ5VwrLE17TXLIbGRqGuXrfSy0m9
	kb6CoCWEVZO1LZfTVeg07hRfTEdnzEek3jAJM/xeEFiVV6jiVsjbPb7WxWw5nHR6aflU4i7eLpt
	iqI9feqfMSCDDOzAVZOar53cxZJxN8ankQfTIrFOg39j5HKydKoApdCT+etLYmXCBgDljElPn+A
	UlbOVZyCx/VOTyTFMwU8Egl4fp5107rqEmrCi3jNF2kodM5GhkIC4ppHwf5C2sZJFnlP1DdheEO
	xw==
X-Received: by 2002:a05:6000:1447:b0:439:c5da:64b7 with SMTP id ffacd0b85a97d-439c5da6735mr7586807f8f.15.1772639067700;
        Wed, 04 Mar 2026 07:44:27 -0800 (PST)
Received: from localhost.localdomain (93-47-52-235.ip111.fastwebnet.it. [93.47.52.235])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439ae3f31dbsm30527300f8f.1.2026.03.04.07.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 07:44:27 -0800 (PST)
From: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
To: openembedded-devel@lists.openembedded.org
Cc: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
Subject: [PATCH] meta-oe: libcppconnman: add recipe
Date: Wed,  4 Mar 2026 16:44:24 +0100
Message-ID: <20260304154425.623340-1-andrea.ricchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Mar 2026 15:44:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124853

libcppconnman is a C++ library to control ConnMan via D-Bus. It exposes
simple aync methods to perform all the controls that ConnMan allow via
D-Bus.

Signed-off-by: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
---
 .../libcppconnman/libcppconnman_git.bb        | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/libcppconnman/libcppconnman_git.bb

diff --git a/meta-oe/recipes-connectivity/libcppconnman/libcppconnman_git.bb b/meta-oe/recipes-connectivity/libcppconnman/libcppconnman_git.bb
new file mode 100644
index 0000000000..86d44e1806
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libcppconnman/libcppconnman_git.bb
@@ -0,0 +1,19 @@
+SUMMARY = "Amarula libcppconnman library"
+LICENSE = "LGPL-2.1-or-later"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a87a7059d580c45495c1218f53e3610d"
+
+SECTION = "libs"
+
+SRC_URI = "git://github.com/amarula/libcppconnman.git;protocol=https;branch=main"
+SRCREV = "d89262c2cd7336da8ba9eb06228d422847fe4b20"
+
+S = "${WORKDIR}/git"
+
+inherit cmake pkgconfig
+
+DEPENDS += "glib-2.0"
+
+EXTRA_OECMAKE += "-DBUILD_SHARED_LIBS=ON -DBUILD_CONNMAN=ON"
+
+# LICENSE file
+FILES:${PN} += "${datadir}/Amarula"
-- 
2.43.0


