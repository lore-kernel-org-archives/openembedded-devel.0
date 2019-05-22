Return-Path: <andrei@gherzan.ro>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 510F16BA10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2019 14:16:56 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id j187so4837552wma.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2019 07:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.ro; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=CtRbsdj7tijH3pSklJERgvdObrcX6t9/1YJgI/qVNBA=;
	b=lMluJROEm8C2P0MfiylUs8Zwc7REYl9LZuiiFjR4BdruPhp2edv+7uZ5OsyMrZgSwE
	kH7rY08jlcqBbvA3tziUhQaxYDb+pHffy8poyYX+j1HTlzhDBu4Rlzy7OwzEwXmhlE7d
	1NYWHbQcRCDG5jbwbGaU/33l6ArZYxcUtxLFTXke3W/2AmkHIfPX/ZphLWbVtQlRQ/6F
	yYhNTSQJRmCj0fi4kykCAxWJ0+BR+igsnazIPvy5qXbd01ZFqk/Lf4AlBwN53JD5MpdQ
	nDJ/EI3j6CwGHVY92ECXInlUmqOl9fEJIe2TlQ27ZBIzsVhecdKT/CLBEmkGvwVrjaOt
	cp/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=CtRbsdj7tijH3pSklJERgvdObrcX6t9/1YJgI/qVNBA=;
	b=TbK5jDzYmcaE3LZd/e9uIATcR26woxmBNTr81rTod8+PSIB55rsSVTFy6Ya70zMwLN
	U0thdYr9wSxfk4RQjYnw0Iklp1FaUebw5RYXCcOI1vH6hPJpJM6XftpmMwEGPWLo9Qz2
	Knxl+cmv1hewF7CObHoUxCz/6f8EYOqyiZEHRoCic0eba+ft8iFHJakACM+Hs1SaxkZW
	8S7FBgPnkysHLTwhoyB/CZyjqnObL8GUHOjCZOxx6u0Q1IFASmJp2zh87HHIeSY/Tjnl
	qipEPXujBQLAk+mp6ybb+4Hwd8CCuAbdV+ZU82VAdZ8aRcCuaGjDaC2fvYe6qO9VZBu4
	OEwA==
X-Gm-Message-State: APjAAAV9a/YnZeHaSSPpTyvHZI7xyxYVc/nRBv9MTU7gEjlkSMidGaKI
	I5MSDnBBTorzEJlQPLyciebVIxbOtGk=
X-Google-Smtp-Source: APXvYqw1Lw37zDbClZTLI5OGQNWQi0gixstHOq/9UnbNZBZKOU8kia5cjvrOdTZu5ORtde52GZq2YA==
X-Received: by 2002:a1c:c015:: with SMTP id q21mr2687515wmf.75.1558534616527; 
	Wed, 22 May 2019 07:16:56 -0700 (PDT)
Received: from localhost.localdomain (host90-152-4-101.ipv4.regusnet.com.
	[90.152.4.101])
	by smtp.gmail.com with ESMTPSA id h8sm12094038wmf.5.2019.05.22.07.16.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 May 2019 07:16:55 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 May 2019 15:16:42 +0100
Message-Id: <20190522141642.9173-1-andrei@gherzan.ro>
X-Mailer: git-send-email 2.17.1
Cc: Andrei Gherzan <andrei@gherzan.ro>
Subject: [meta-networking][PATCH] modemmanager: Update to 1.10.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 22 May 2019 14:16:56 -0000

Commit includes removal of upstream merged patch.

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 ...-string-to-s-printf-formatted-string.patch | 31 -------------------
 ...anager_1.8.2.bb => modemmanager_1.10.0.bb} |  6 ++--
 2 files changed, 2 insertions(+), 35 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/modemmanager/modemmanager/0001-Do-not-pass-null-string-to-s-printf-formatted-string.patch
 rename meta-oe/recipes-connectivity/modemmanager/{modemmanager_1.8.2.bb => modemmanager_1.10.0.bb} (89%)

diff --git a/meta-oe/recipes-connectivity/modemmanager/modemmanager/0001-Do-not-pass-null-string-to-s-printf-formatted-string.patch b/meta-oe/recipes-connectivity/modemmanager/modemmanager/0001-Do-not-pass-null-string-to-s-printf-formatted-string.patch
deleted file mode 100644
index 5fbafbb5d..000000000
--- a/meta-oe/recipes-connectivity/modemmanager/modemmanager/0001-Do-not-pass-null-string-to-s-printf-formatted-string.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From b8862e6af1c6d022b8c182098e7deddb874ece19 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 18 Dec 2018 23:10:44 -0800
-Subject: [PATCH] Do not pass null string to %s printf formatted string
-
-Here the string is already decided to be NULL and passing
-a null pointer to %s will not work
-
-Fixes
-error: '%s' directive argument is null
-
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/mobile-broadband/ModemManager/merge_requests/67]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- plugins/mtk/mm-broadband-modem-mtk.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/plugins/mtk/mm-broadband-modem-mtk.c b/plugins/mtk/mm-broadband-modem-mtk.c
-index 475a63ac..541de4a5 100644
---- a/plugins/mtk/mm-broadband-modem-mtk.c
-+++ b/plugins/mtk/mm-broadband-modem-mtk.c
-@@ -191,7 +191,7 @@ get_supported_modes_ready (MMBaseModem *self,
- 
-     response = mm_base_modem_at_command_finish (MM_BASE_MODEM (self), res, &error);
-     if (!response) {
--        mm_dbg ("Fail to get response %s", response);
-+        mm_dbg ("Fail to get response");
-         g_task_return_error (task, error);
-         g_object_unref (task);
-         return;
diff --git a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.8.2.bb b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.10.0.bb
similarity index 89%
rename from meta-oe/recipes-connectivity/modemmanager/modemmanager_1.8.2.bb
rename to meta-oe/recipes-connectivity/modemmanager/modemmanager_1.10.0.bb
index f9b302a3d..8254a85fc 100644
--- a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.8.2.bb
+++ b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.10.0.bb
@@ -13,11 +13,9 @@ DEPENDS = "glib-2.0 libgudev dbus-glib intltool-native libxslt-native"
 
 SRC_URI = "http://www.freedesktop.org/software/ModemManager/ModemManager-${PV}.tar.xz \
            file://0001-Do-not-set-Wno-unused-but-set-variable.patch \
-           file://0001-Do-not-pass-null-string-to-s-printf-formatted-string.patch \
            "
-
-SRC_URI[md5sum] = "a49c9f73e46c7b89e5efedda250d22c0"
-SRC_URI[sha256sum] = "96f2a5f0ed15532b4c4c185b756fdc0326e7c2027cea26a1264f91e098260f80"
+SRC_URI[md5sum] = "92d25176d0cc9d588ca29700b33c7d98"
+SRC_URI[sha256sum] = "fd0f39996025dac96995daea8a58ec7dd571582f7563a8ae0d5f65b571b76ee2"
 
 S = "${WORKDIR}/ModemManager-${PV}"
 
-- 
2.17.1


