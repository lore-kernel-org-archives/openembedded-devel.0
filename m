Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail.openembedded.org (Postfix) with ESMTP id 7E6F07F9B4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2019 19:49:46 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id b18so6549397wrj.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2019 11:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=yprmrkvmv3H36QxXrxda+AEKihlhyB8aPLllUmed3ig=;
	b=aYIpN7vEE95SJVfut6AEEzKVvYLQnEK9dphub2gMO87JXS3jSAyiQfOfbaoJYKewq7
	cyzGdW1DAzj8sEqKmV73TuzCsIQbqaZpBRKVjwy8gaDdkbaYtqCk5LdbyFAYe+qzAO+C
	zGZzZMxNrT5IRB3CJCmXXVeHgeSowAvLEBV+P7+OblvZpznMqyMCynjuUiFFuVVKQV2R
	TVULWf7jFD3n8VcwiQYmpJ1hTzU1ApG0re8DulBPituBP9In8DoflT43owTjLdkXo2br
	EmEn4UaIqfpjGo3yvhMC7YXmzBG8Mek8cXHm8XrLvZtLG9LCRAwXyBpD88kJqvq29xH8
	BWzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=yprmrkvmv3H36QxXrxda+AEKihlhyB8aPLllUmed3ig=;
	b=C2iaSTnc8Y70cmgDRTtnOv24OeCeFROPXZHz72iXkRRJcVPtSZGGLNPHiWhwd6CLv9
	AfBJL/ZWNAN6Fp7WrpjmudCPRTTVPkvi8/bDqx910I/8VO2xZtTQyvIbgohbikig1/OM
	OfDtwgOpjHhSggWM/KzKIw6l8MxnvY83wv0ig42v95xkyc5V3y1QIEKhzMeVsR8/lcgn
	wMwL4Eg3/AwEkcucbJzSNxzGS1l7jmQtH17c106K1YFKu6ASGdUMu6Je8d1Tl49B3WQV
	yOt31smVYvw7pZ2ZN/XNzGQFv2S5FIsJzYYwzHfihrgIJWnaBRbF6cTWhC/7K4WWXCzz
	zXEQ==
X-Gm-Message-State: APjAAAUM8nrhjeDMBj7Abh/2SSIBBAkgBbReIVdif1cRiVskJ0K2RpEX
	Lc5If0jqy96ey4/ngJ+IyxGMcIny
X-Google-Smtp-Source: APXvYqz/ELTbZ9QsOlHIgU+G4kqOYxziDh7pvMaZsx542YjCWE/7oo43kdFuPEh849PaP1XvwUDc4A==
X-Received: by 2002:adf:e80d:: with SMTP id o13mr341931wrm.73.1573760986830;
	Thu, 14 Nov 2019 11:49:46 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F072F08821A0DCFF2B58A35.dip0.t-ipconnect.de.
	[2003:f0:7f07:2f08:821a:dcf:f2b5:8a35])
	by smtp.gmail.com with ESMTPSA id
	f13sm8013074wrq.96.2019.11.14.11.49.46
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 14 Nov 2019 11:49:46 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Nov 2019 20:49:22 +0100
Message-Id: <20191114194930.2786-9-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191114194930.2786-1-schnitzeltony@gmail.com>
References: <20191114194930.2786-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 08/16] file-roller: inital add 3.32.2
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
X-List-Received-Date: Thu, 14 Nov 2019 19:49:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../file-roller/file-roller_3.32.2.bb         | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/file-roller/file-roller_3.32.2.bb

diff --git a/meta-gnome/recipes-gnome/file-roller/file-roller_3.32.2.bb b/meta-gnome/recipes-gnome/file-roller/file-roller_3.32.2.bb
new file mode 100644
index 000000000..8350189a5
--- /dev/null
+++ b/meta-gnome/recipes-gnome/file-roller/file-roller_3.32.2.bb
@@ -0,0 +1,26 @@
+SUMMARY = "An archive manager utility for the  GNOME Environment"
+LICENSE="GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
+
+GNOMEBASEBUILDCLASS = "meson"
+
+DEPENDS = " \
+    glib-2.0-native \
+    gtk+3 \
+    nautilus \
+    libarchive \
+    libnotify \
+"
+
+inherit gnomebase itstool gnome-help gettext upstream-version-is-even
+
+SRC_URI[archive.md5sum] = "e79715bb2400df83c0f67cc0cce2b655"
+SRC_URI[archive.sha256sum] = "c60a79e0baf74cb1c09a1c8f5ffe0d6e311227ca14ecc5b1156beb3715341a71"
+
+PACKAGECONFIG[nautilus] = "-Dnautilus-actions=true,-Dnautilus-actions=false,nautilus"
+
+FILES_${PN} += " \
+    ${datadir}/dbus-1 \
+    ${datadir}/metainfo \
+    ${libdir}/nautilus \
+"
-- 
2.21.0


