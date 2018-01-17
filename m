Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7BEA6786EE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jan 2018 08:34:58 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id 143so13360223wma.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jan 2018 00:34:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=ecy1Is12ksQdMk6akARVM46X9aj14Ew366YcJUYj5ac=;
	b=MtCQjNkT9C9n3yY2xtSHIeLvKVZbf/I6W4rk5Vg2qA/GiwC01tsZ0xtbz2EUb4X5i5
	AFcPcMEdd+DJdUUzg35hr9XH7t663UKLUjIL3aJrg5/Km/+TP5dnEKnCaj5XNZyc7VMl
	N0W9/ds3G4da9Y8ZNhEj3GqNYd5C/Q5rdjZlgjLGSSO+RcpJDVIKwoYki48Vs043j4gu
	6mHohywGJy8ASzqPMm+RLbYGx7T8IS1aokRU4lWg4yB0eAVuSGVSgi9bj4MoGKwq0Oz6
	mOa1ew4KET49b/pPBn+Nk2CWG0vFIUKkJafsAx5wfwVGz5HnudIA51gur58ebLvEcoc9
	8CgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ecy1Is12ksQdMk6akARVM46X9aj14Ew366YcJUYj5ac=;
	b=meeo7jMXgDxz99oPvmWBvJChrnc/kIym0FfK3qdpFW5iVHcvuuiKI6EVvSuVrRsljm
	1i8Un4yudoxRKsK/TWsBZAlwyotgeafGSp2lTzchb3Z18WSSKITOg3PGerbTgnTGSIAy
	uPr24ld9vmDfa6JPshRAGJ4v+GNUtH5vdZIyAW+9IwXCWvSebSUjV6Jlex5V/p4zgpO4
	jQusXA90/+xdmFXhceAsRM4grX6Q599VYBxAi9k+v2rHqqBLwURZfXyxx6bQuGK1TEWX
	sLDvVd09EKvDfaNITkgyUxxef0ZcBDjNdjHtvKCMPM5OMxOUBzUE5ffM66dNsRPn6L7y
	vFRQ==
X-Gm-Message-State: AKwxytdDT+/CUOvXDWf2nGdLVHhcJYPk6jI2/h/xdcihWy3FEdaISXEo
	UJSkfsxrrOZ9JCJs37yYqyWuHA==
X-Google-Smtp-Source: ACJfBouP9yNx/7O/Z9rYHsCkET7GqMaZA2DOwTHE5bp+9JOD6AIWTM+vgewxZqGCfhpPYbnYGNjFAA==
X-Received: by 10.28.191.17 with SMTP id p17mr1300041wmf.91.1516178098980;
	Wed, 17 Jan 2018 00:34:58 -0800 (PST)
Received: from localhost.localdomain
	(ip-88-152-110-191.hsi03.unitymediagroup.de. [88.152.110.191])
	by smtp.gmail.com with ESMTPSA id
	c54sm4230832wrg.68.2018.01.17.00.34.58
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 17 Jan 2018 00:34:58 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Jan 2018 09:34:16 +0100
Message-Id: <20180117083421.30233-10-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180117083421.30233-1-schnitzeltony@gmail.com>
References: <20180117083421.30233-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 09/14] remove gnome tracker leftovers
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
X-List-Received-Date: Wed, 17 Jan 2018 08:34:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/recipes-support/tracker/files/90tracker        |  4 ----
 .../recipes-support/tracker/files/tracker-dbus.service    | 15 ---------------
 .../tracker/files/tracker-miner-fs.service                | 12 ------------
 .../recipes-support/tracker/files/tracker-store.service   | 12 ------------
 4 files changed, 43 deletions(-)
 delete mode 100644 meta-gnome/recipes-support/tracker/files/90tracker
 delete mode 100644 meta-gnome/recipes-support/tracker/files/tracker-dbus.service
 delete mode 100644 meta-gnome/recipes-support/tracker/files/tracker-miner-fs.service
 delete mode 100644 meta-gnome/recipes-support/tracker/files/tracker-store.service

diff --git a/meta-gnome/recipes-support/tracker/files/90tracker b/meta-gnome/recipes-support/tracker/files/90tracker
deleted file mode 100644
index 9594b9168..000000000
--- a/meta-gnome/recipes-support/tracker/files/90tracker
+++ /dev/null
@@ -1,4 +0,0 @@
-#!/bin/sh
-
-/usr/bin/trackerd -m &
-
diff --git a/meta-gnome/recipes-support/tracker/files/tracker-dbus.service b/meta-gnome/recipes-support/tracker/files/tracker-dbus.service
deleted file mode 100644
index c97f49a89..000000000
--- a/meta-gnome/recipes-support/tracker/files/tracker-dbus.service
+++ /dev/null
@@ -1,15 +0,0 @@
-[Unit]
-Description=tracker DBus session bus handler
-Before=tracker-store.service
-After=dbus.service
-Requires=dbus.service
-BindTo=tracker-store.service
-
-[Service]
-Type=forking
-EnvironmentFile=-/tmp/tracker.env
-ExecStartPre=@BASE_BINDIR@/rm -rf /tmp/tracker.env
-ExecStart=/bin/sh -c 'echo "DBUS_SESSION_BUS_ADDRESS=`dbus-daemon --fork --session --print-address`" > /tmp/tracker.env'
-
-[Install]
-WantedBy=multi-user.target
diff --git a/meta-gnome/recipes-support/tracker/files/tracker-miner-fs.service b/meta-gnome/recipes-support/tracker/files/tracker-miner-fs.service
deleted file mode 100644
index 34d9a1e68..000000000
--- a/meta-gnome/recipes-support/tracker/files/tracker-miner-fs.service
+++ /dev/null
@@ -1,12 +0,0 @@
-[Unit]
-Description=tracker-miner-fs
-After=syslog.target local-fs.target udev.service dbus.service tracker-store.service
-Requires=tracker-store.service
-
-[Service]
-Environment=HOME=/home/root
-EnvironmentFile=-/tmp/tracker.env
-ExecStart=@LIBEXECDIR@/tracker-miner-fs
-
-[Install]
-WantedBy=multi-user.target
diff --git a/meta-gnome/recipes-support/tracker/files/tracker-store.service b/meta-gnome/recipes-support/tracker/files/tracker-store.service
deleted file mode 100644
index c5037f3ab..000000000
--- a/meta-gnome/recipes-support/tracker/files/tracker-store.service
+++ /dev/null
@@ -1,12 +0,0 @@
-[Unit]
-Description=tracker-store
-After=syslog.target local-fs.target dbus.service
-Requires=dbus.service tracker-dbus.service
-BindTo=tracker-dbus.service
-
-[Service]
-EnvironmentFile=-/tmp/tracker.env
-ExecStart=@LIBEXECDIR@/tracker-store
-
-[Install]
-WantedBy=multi-user.target
-- 
2.14.3


