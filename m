Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
	[209.85.128.43])
	by mail.openembedded.org (Postfix) with ESMTP id 657ED7FA41
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Dec 2019 00:09:45 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id b11so5964735wmj.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Dec 2019 16:09:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=DiY5u6zbNeWnvHycJJ5lggG1bImfeb/ejh0JaT0ApPQ=;
	b=qU/ZsMTFsEflSJJUFQogaDTeGU9qqyOA4yRSxlWQ+l6Xl1BNnWL16cI4B9mWR696cT
	atQDkQU7BJPcvFtERKrBKX4DO1toQuVyhDE78umFuEc289F9XrCFY9Ec9W9PJJlC1Rcl
	Ys5tzj6Z3VIUaeOUfO/O4qkVaM9MDbT4jDt7qygFPADvJJvgtNDBlXssysu4w1Z50Ewq
	LdTkIuuD7P+Jw759eSbeqxUWKwEBXcGAiC1yqYt7167DR3ufJcwAQ0H7YMX0W/0yst61
	Ej/XSCWgZDWyF/cMN60dW/DdUcPOvYlYDpxapP2hIPnAtqOYh35rnjWH5zv3juAl2ZlH
	MX2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=DiY5u6zbNeWnvHycJJ5lggG1bImfeb/ejh0JaT0ApPQ=;
	b=atqZ6LKUl/0K4UuUmUqr5FyXrsy+Wm4nb55lM1gQBy1hi8QKRmMRtBR2HVAELyQMq3
	dZdMUCQc0ujabDEKCKLcahzc3gGbfzZKkbE6La/6t5WTc6NEi4eeOUxSP3yKWDLyd9D+
	06ENNnL+h09MhH7Iwoo3GN1nPsjpT20in4hDR2v0qfFrhTTKuPp7N+zpcRnZzNR6DzFR
	vCfOuQ+detKCVIauEcmGtbwxCKWjgdnICOVO5O5Qp8Yg+RmppkZgZGGqU44xcp7oH6zh
	al5WCvZkqiB49DFnoj5NTSdaKwabmEeMk4sVtC4uJvGgUfissufNl5H8ZbWxAFA79Ycw
	C5sQ==
X-Gm-Message-State: APjAAAVsFJ8tGNd/B1WihmJateL2QMQLL57EixBggADSLKjXQr29qW14
	yPIKEruvHjcOpQeipAsJozDXGInZ
X-Google-Smtp-Source: APXvYqzi6ENZeycuASVPgbR17/lPeHHn6h4xS2HufeBtoQ3Z0d30lPRrmtSMiK/SmmTylW1ORGYrRw==
X-Received: by 2002:a7b:c416:: with SMTP id k22mr7239929wmi.10.1575590985865; 
	Thu, 05 Dec 2019 16:09:45 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0A9017AA4DD0060EAA1509.dip0.t-ipconnect.de.
	[2003:f0:7f0a:9017:aa4d:d006:eaa:1509])
	by smtp.gmail.com with ESMTPSA id
	b10sm14252762wrt.90.2019.12.05.16.09.45
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 05 Dec 2019 16:09:45 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 Dec 2019 01:09:12 +0100
Message-Id: <20191206000912.19841-22-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191206000912.19841-1-schnitzeltony@gmail.com>
References: <20191206000912.19841-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 21/21] Add: packagegroup-gnome-apps / packagegroup-gnome-desktop
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
X-List-Received-Date: Fri, 06 Dec 2019 00:09:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../packagegroups/packagegroup-gnome-apps.bb  | 20 ++++++++++++++
 .../packagegroup-gnome-desktop.bb             | 26 +++++++++++++++++++
 2 files changed, 46 insertions(+)
 create mode 100644 meta-gnome/recipes-support/packagegroups/packagegroup-gnome-apps.bb
 create mode 100644 meta-gnome/recipes-support/packagegroups/packagegroup-gnome-desktop.bb

diff --git a/meta-gnome/recipes-support/packagegroups/packagegroup-gnome-apps.bb b/meta-gnome/recipes-support/packagegroups/packagegroup-gnome-apps.bb
new file mode 100644
index 000000000..d7f1df8f2
--- /dev/null
+++ b/meta-gnome/recipes-support/packagegroups/packagegroup-gnome-apps.bb
@@ -0,0 +1,20 @@
+SUMMARY = "GNOME applications"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+
+inherit packagegroup features_check
+
+REQUIRED_DISTRO_FEATURES = "x11"
+
+RDEPENDS_${PN} = " \
+    evolution-data-server \
+    evince \
+    file-roller \
+    gedit \
+    gnome-font-viewer \
+    gnome-system-monitor \
+    gnome-terminal \
+    libwnck3 \
+    nautilus \
+    wv \
+"
diff --git a/meta-gnome/recipes-support/packagegroups/packagegroup-gnome-desktop.bb b/meta-gnome/recipes-support/packagegroups/packagegroup-gnome-desktop.bb
new file mode 100644
index 000000000..b9e1f8764
--- /dev/null
+++ b/meta-gnome/recipes-support/packagegroups/packagegroup-gnome-desktop.bb
@@ -0,0 +1,26 @@
+SUMMARY = "Basic GNOME desktop"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+
+inherit packagegroup features_check
+
+REQUIRED_DISTRO_FEATURES = "x11"
+
+RDEPENDS_${PN} = " \
+    adwaita-icon-theme \
+    adwaita-icon-theme-cursors \
+    evolution-data-server \
+    gnome-backgrounds \
+    gnome-bluetooth \
+    gnome-control-center \
+    gnome-desktop3 \
+    gnome-flashback \
+    gnome-keyring \
+    gnome-menus3 \
+    gnome-session \
+    gnome-settings-daemon \
+    gnome-shell \
+    gnome-shell-extensions \
+    gmime \
+    gvfs gvfsd-ftp gvfsd-sftp gvfsd-trash \
+"
-- 
2.21.0


