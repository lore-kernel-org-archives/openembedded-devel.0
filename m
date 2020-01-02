Return-Path: <rehsack@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9163B7FC3A
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Jan 2020 13:39:17 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id q10so285276wrm.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Jan 2020 05:39:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=tLYL62kQ4PLD2aLSaKsrnY+5LYjVgOFwp0r961dCNfs=;
	b=kLS5PaRmtPYzgKAUlNdgJJQ5YpF1DWXBotrXBDJegF8dxii9xEr/qeBrbE8Tx526BL
	QMDV+iUu7SPgG7IjmcC/uBdux9mt8w6qmKvkmlU3so5HZ1MFtAIV5jTSqGjBUyNlvz57
	gLmQw5BvurOXhs8TQGDEw5E2rDbwonZSzNKu7VujGfLA9WG3DVKEmnp5/yxav8po3rvo
	HVu6o65IQ4Aml/FLfxRT86TLLbFsJt+B9d5PSofwXABeQtoRnf1WB42TnF0b1sE/glV3
	oT5OoN4+uQTlRxlOjIvqaezj0/8c5DuX1oRDwiigv7VSeKtzrDTHu8wTfwqu1cDpgwj6
	JB+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=tLYL62kQ4PLD2aLSaKsrnY+5LYjVgOFwp0r961dCNfs=;
	b=n1e2PZzKVKofKd+EWLE6+GSfo8uKlcogTzLlHrL5PpOIUcx7n8GPZnXfOgwp5rxPHY
	Jug4u8iX86y+BeD0w2Xd330tuKE//SGukOSOTm7rMBzn76uSZY1jugNYQYViCc07JDNb
	U0VkxJk731UM97HeQIpCJg0J2o7I/2Z17Bp/BckWmnmvWl7cqjwwGBUFeNI5km0UCXTs
	Ok+fEf2VYS6LPJSgyKsb0qHmy7OAYItLLRne8IDJCq1Vu2vhAyvjGsRJzWhtLTVq5uCu
	2MPHPl9UDTTF9t/R7GL6a3Sa0aHW4IprhSLqvAmKcdQ6U7fr+Z0VX8bxohKUptZPW6lw
	Wxvg==
X-Gm-Message-State: APjAAAUQOuLF9Mn727qeokauP2cT/Zctb8Rj7IDORjNi6DiFZtb3XQOg
	tcdyqnUx0DcgYgpIft/lGmzVAnkd4us=
X-Google-Smtp-Source: APXvYqwlJDB9Szsvl0QkkY0f1csUf/SDATd1bjAp/w9gG6hBflIpdsUFUx4wpX+0CV9pcnXFcls1Cg==
X-Received: by 2002:a5d:4085:: with SMTP id o5mr81289340wrp.321.1577972358152; 
	Thu, 02 Jan 2020 05:39:18 -0800 (PST)
Received: from beaker.muppets.liwing.de (p5B25B970.dip0.t-ipconnect.de.
	[91.37.185.112]) by smtp.gmail.com with ESMTPSA id
	o4sm55152521wrx.25.2020.01.02.05.39.17
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 02 Jan 2020 05:39:17 -0800 (PST)
Sender: Jens Rehsack <rehsack@gmail.com>
From: Jens Rehsack <sno@netbsd.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 Jan 2020 14:39:15 +0100
Message-Id: <20200102133915.1516-1-sno@netbsd.org>
X-Mailer: git-send-email 2.17.1
Cc: Jens Rehsack <sno@netbsd.org>
Subject: [meta-perl][PATCH] libunix-statgrab: add recipe
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
X-List-Received-Date: Thu, 02 Jan 2020 13:39:18 -0000

Add recipe for Unix::Statgrab perl module, a sane language binding for
libstatgrab.

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 .../libstatgrab/libunix-statgrab_0.112.bb     | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb

diff --git a/meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb b/meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb
new file mode 100644
index 000000000..7402eb879
--- /dev/null
+++ b/meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb
@@ -0,0 +1,38 @@
+SUMMARY = "Perl interface to the libstatgrab library"
+DESCRIPTION = "Unix::Statgrab is a wrapper for libstatgrab as available from \
+<http://www.i-scream.org/libstatgrab/>. It is a reasonably portable attempt \
+to query interesting stats about your computer. It covers information on \
+the operating system, CPU, memory usage, network interfaces, hard-disks \
+etc."
+
+HOMEPAGE = "https://metacpan.org/release/Unix-Statgrab"
+SECTION = "libs"
+LICENSE = "Artistic-1.0 | GPL-1.0+ | LGPL-2.1+"
+DEPENDS += "libcapture-tiny-perl-native"
+DEPENDS += "libconfig-autoconf-perl-native"
+DEPENDS += "libstatgrab"
+RDEPENDS_${PN} += "\
+    libstatgrab \
+    perl-module-autoloader \
+    perl-module-carp \
+    perl-module-dynaloader \
+    perl-module-exporter \
+    perl-module-strict \
+    perl-module-vars \
+    perl-module-warnings \
+"
+
+SRC_URI = "${CPAN_MIRROR}/authors/id/R/RE/REHSACK/Unix-Statgrab-${PV}.tar.gz"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Artistic-1.0;md5=cda03bbdc3c1951996392b872397b798 \
+    file://${COMMON_LICENSE_DIR}/GPL-1.0;md5=e9e36a9de734199567a4d769498f743d \
+    file://${COMMON_LICENSE_DIR}/LGPL-2.1;md5=1a6d268fd218675ffea8be556788b780 \
+"
+
+SRC_URI[md5sum] = "a6bc06b3f7749f7d77a2b1bd13402821"
+SRC_URI[sha256sum] = "16a29f7acaeec081bf0e7303ba5ee24fda1d21a1104669b837745f3ea61d6afa"
+
+S = "${WORKDIR}/Unix-Statgrab-${PV}"
+
+inherit cpan ptest-perl
+
+BBCLASSEXTEND = "native"
-- 
2.17.1


