Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RyRxY-000221-4H
	for openembedded-devel@lists.openembedded.org;
	Fri, 17 Feb 2012 18:51:04 +0100
Received: by yhfq46 with SMTP id q46so1946136yhf.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Feb 2012 09:42:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=wV7bphCC7fMEJ4Bqd61+kQo9mx+L+2emilP/EXaBpbU=;
	b=WwGL06uW1in5Ihe8DZfqcqrjOMWJR4uznGe/g65MSIp5nAnfvy2lNOn8ip9tXoiikb
	q/PtBmIksGrexmCs7i+an2Tyyo40J3Ge5ITCDccQUo+A5v/H2kX9Pwr1oukJJ3ZAQy27
	0KZcuQgeYWU5HGNGPijmdUv7wadKAWl0gGJfQ=
Received: by 10.236.184.129 with SMTP id s1mr10966462yhm.21.1329500569460;
	Fri, 17 Feb 2012 09:42:49 -0800 (PST)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id d5sm15769900anm.22.2012.02.17.09.42.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 17 Feb 2012 09:42:48 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 17 Feb 2012 17:42:30 +0000
Message-Id: <9641e5a6fe825a1872ab9e5bcd7dbbab0265ad61.1329500480.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1329500479.git.otavio@ossystems.com.br>
References: <cover.1329500479.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1329500479.git.otavio@ossystems.com.br>
References: <cover.1329500479.git.otavio@ossystems.com.br>
Subject: [PATCH][meta-oe 2/7] udisks: explicitly depends on systemd
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 17 Feb 2012 17:51:04 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-support/udisks/udisks_1.0.4.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/udisks/udisks_1.0.4.bb b/meta-oe/recipes-support/udisks/udisks_1.0.4.bb
index 55b115e..9ffaca5 100644
--- a/meta-oe/recipes-support/udisks/udisks_1.0.4.bb
+++ b/meta-oe/recipes-support/udisks/udisks_1.0.4.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "A storage daemon that implements well-defined D-Bus interfaces th
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=73d83aebe7e4b62346afde80e0e94273"
 
-DEPENDS = "libatasmart sg3-utils polkit udev dbus-glib glib-2.0"
+DEPENDS = "libatasmart sg3-utils polkit udev dbus-glib glib-2.0 systemd"
 # optional dependencies: device-mapper parted
 
 SRC_URI = "http://hal.freedesktop.org/releases/${BPN}-${PV}.tar.gz;name=${BPN} \
@@ -12,7 +12,7 @@ SRC_URI = "http://hal.freedesktop.org/releases/${BPN}-${PV}.tar.gz;name=${BPN} \
 SRC_URI[udisks.md5sum] = "86c63b2b5484f2060499a052b5b6256b"
 SRC_URI[udisks.sha256sum] = "854b89368733b9c3a577101b761ad5397ae75a05110c8698ac5b29de9a8bf8f5"
 
-PR = "r2"
+PR = "r3"
 
 inherit autotools systemd
 
-- 
1.7.2.5



