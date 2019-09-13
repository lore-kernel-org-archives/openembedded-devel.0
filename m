Return-Path: <brgl@bgdev.pl>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 53A0C7E555
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Sep 2019 07:20:24 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id q14so30921859wrm.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Sep 2019 00:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=1knbK3G6ra7KS1QGEAU5cx7tt/6x+j0uGstQN28K5wA=;
	b=b7a+acHBurqJyUC3r7/PRjzBuDK7n3wCwiYeS79RT1eyQagSPEL0VfaBmm4f05dvpB
	wphIaZ794O413KfdpYNozZ/Hn2HSacarA/1HvDK8X1+g36l2f3dXrgqkqcy6hrHinOxT
	Tfmy7e3CxJE4A5IdSltqIwDGTBrOyRrakWU5KFnCJcIYzvEJUHR0hoIyq5RuUWpXtFFS
	BzIcN2wR/6NBqlK8wH4w2EahqOuEOfBz6/5GjVAIAuCsfTDZPQDc3UhoYx62/9oXj22A
	cJkTKVv5X9rPrXgUkssqi3ntixcEzcAtMNcrmyODFB3urltXh5qBW521EVYDJdROGPoe
	3kAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=1knbK3G6ra7KS1QGEAU5cx7tt/6x+j0uGstQN28K5wA=;
	b=DXNelivhqqiJIFqwr4dgxLj1oIoSuzwjITu3i2wFPT9pxrnp7oOHoyTDFgiq0gcFZK
	A6hX+5Izq2jHO0LDYawWD9530Qc11n83QskJER9eht+P1linjyvypdjqFnljzNQQOQ7X
	KEoGTS0RW2N+D+b+knLghzuSS3zXQYxyNL6OvoLeF0lXzarIT34lC7sYcDVseyP+zblp
	lzY8AjAEi77eLwhZxbxPg6W7XCQViLKEotwknalvWSrjy13VxUU3VTPo2Jwvn2ZJA4kL
	W/vVPVdChg7SWMu2OV/2d7L6APEd9d4FtzvoB0dZuxh+TqF8+gR2nQed1pOQMQd0/vsr
	J2YQ==
X-Gm-Message-State: APjAAAVmZPxd4XxLXm8vMDeIORr/PeAJ7hurS38x965ti+stfAHZJSUq
	TDlJNqhgYkLVz9mLtWaN1u+c2A==
X-Google-Smtp-Source: APXvYqxYF7KoW1y+UypwruODvarTRKEw9odUzpk3C70lkuvXkLLd/8M2APksuvnMR25flE06KHqavQ==
X-Received: by 2002:a05:6000:1187:: with SMTP id
	g7mr37861006wrx.192.1568359225573; 
	Fri, 13 Sep 2019 00:20:25 -0700 (PDT)
Received: from localhost.localdomain
	(amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
	by smtp.gmail.com with ESMTPSA id
	r9sm43480296wra.19.2019.09.13.00.20.24
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 13 Sep 2019 00:20:24 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	openembedded-devel@lists.openembedded.org
Date: Fri, 13 Sep 2019 09:20:21 +0200
Message-Id: <20190913072021.30152-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [meta-oe][PATCH v2] yad: new package
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
X-List-Received-Date: Fri, 13 Sep 2019 07:20:25 -0000
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

This adds a recipe for yad (Yet Another Dialog) - a command-line utility
allowing to display configurable dialog windows from shell scripts and
parse the input from users.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
v1 -> v2:
- drop the PV assignment i.e. leave the version as 4.1 (without git hash)

 meta-oe/recipes-graphics/yad/yad_4.1.bb | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/yad/yad_4.1.bb

diff --git a/meta-oe/recipes-graphics/yad/yad_4.1.bb b/meta-oe/recipes-graphics/yad/yad_4.1.bb
new file mode 100644
index 000000000..c69f47dcd
--- /dev/null
+++ b/meta-oe/recipes-graphics/yad/yad_4.1.bb
@@ -0,0 +1,17 @@
+SUMMARY = "Yet Another Dialog"
+DESCRIPTION = "Program allowing you to display GTK+ dialog boxes from command line or shell scripts."
+AUTHOR = "Victor Ananjevsky"
+
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+
+SRC_URI = "git://github.com/v1cont/yad.git"
+SRCREV = "3857a0a8822fc0a7206e804f15cc17b85a5f8ce2"
+
+inherit autotools gsettings
+
+DEPENDS = "gtk+3 glib-2.0-native intltool-native"
+
+S = "${WORKDIR}/git"
+
+FILES_${PN} += "${datadir}/icons/"
-- 
2.21.0


