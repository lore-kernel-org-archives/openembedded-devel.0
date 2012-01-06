Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RjF8K-00081w-QF
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 Jan 2012 20:07:20 +0100
Received: by mail-yx0-f175.google.com with SMTP id m12so800396yen.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Jan 2012 10:59:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=jOyINVSXmoQhFhE21ZAZsUiwFijFqCjN0FwvkkF4PCg=;
	b=ZJFf6ap81iG4oQRTyX1KJTEqqfhV+EcH0x98lql47Krc1Oi0tan7givuUsIINFZ7bK
	VMnGSbOeqrqy4Nu/OU46ty53kNIfmgoCZmlDtiaNgG8vzR3fpuayAHoTknfaej8PyfKg
	esK1I+CZD6QOwfHkjRyIaBDGtpitCFiSR4ld8=
Received: by 10.236.93.4 with SMTP id k4mr9070559yhf.114.1325876398266;
	Fri, 06 Jan 2012 10:59:58 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id f17sm17744177ann.21.2012.01.06.10.59.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 06 Jan 2012 10:59:57 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 Jan 2012 18:59:35 +0000
Message-Id: <b61f46cb503582b669cbc56b0ea04d7fdaafd256.1325876341.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1325876341.git.otavio@ossystems.com.br>
References: <cover.1325876341.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1325876341.git.otavio@ossystems.com.br>
References: <cover.1325876341.git.otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 5/5] udisks: disable manpage building
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
X-List-Received-Date: Fri, 06 Jan 2012 19:07:21 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-support/udisks/udisks_1.0.4.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-support/udisks/udisks_1.0.4.bb b/meta-oe/recipes-support/udisks/udisks_1.0.4.bb
index c3e2664..55b115e 100644
--- a/meta-oe/recipes-support/udisks/udisks_1.0.4.bb
+++ b/meta-oe/recipes-support/udisks/udisks_1.0.4.bb
@@ -12,13 +12,15 @@ SRC_URI = "http://hal.freedesktop.org/releases/${BPN}-${PV}.tar.gz;name=${BPN} \
 SRC_URI[udisks.md5sum] = "86c63b2b5484f2060499a052b5b6256b"
 SRC_URI[udisks.sha256sum] = "854b89368733b9c3a577101b761ad5397ae75a05110c8698ac5b29de9a8bf8f5"
 
-PR = "r1"
+PR = "r2"
 
 inherit autotools systemd
 
 SYSTEMD_PACKAGES = "${PN}-systemd"
 SYSTEMD_SERVICE_${PN}-systemd = "udisks-daemon.service"
 
+EXTRA_OECONF = "--disable-man-pages"
+
 PACKAGES =+ "${PN}-systemd"
 
 FILES_${PN}-systemd = "${base_libdir}/systemd/system/"
-- 
1.7.2.5



