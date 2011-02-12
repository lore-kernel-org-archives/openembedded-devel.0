Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1PoDQ5-00043p-3q
	for openembedded-devel@lists.openembedded.org;
	Sat, 12 Feb 2011 12:13:48 +0100
Received: by mail-bw0-f47.google.com with SMTP id 10so3801735bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Feb 2011 03:12:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=QQvuMPqYdNJG7UaBNobiuxRxgPCPFX4fLnwgWdxqCDI=;
	b=iWw0O4UvZ74w9vIPFHxynsvuZHD4rw6Dh9mRGKnod9XDcFA1Or0nSCEMYQb7N60GLd
	AYzGffZNCBKMGe7d/X8iTkepnGLpX+TV9G0cN8tgT2cQ0KYFjuEhw4x9srGr9AIKnm9R
	WPseWKJm+n2MDKQePJdM1ey9ZU9/ojT9u8Hp4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=jRvV7YeH/9YGj2L9Vo91eDvqYhc3Wo0bh3GSKl+PKMZv3gdWWd1WS3kjU2Mi+ZbCbP
	dlyDT0rCfhtQ3h8Y6J5EYqhC7pZkfq33so9JQkSG21qaoUDYI82QHVoHPMcdkcm2f5Q0
	dl5Wj+gqBZ5UU2pgukpQcGW2G0jctqUoRUQWU=
Received: by 10.204.102.2 with SMTP id e2mr1413748bko.92.1297509154772;
	Sat, 12 Feb 2011 03:12:34 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id q18sm228429bka.15.2011.02.12.03.12.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 12 Feb 2011 03:12:33 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 12 Feb 2011 12:12:14 +0100
Message-Id: <1297509134-31435-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4
In-Reply-To: <1297509134-31435-1-git-send-email-Martin.Jansa@gmail.com>
References: <1297509134-31435-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 2/2] eject: use u-a for /usr/bin/volname
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
X-List-Received-Date: Sat, 12 Feb 2011 11:13:48 -0000

* resolves conflict with latest busybox

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes/eject/eject_2.1.5.bb |   16 +++++++++++++---
 1 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/recipes/eject/eject_2.1.5.bb b/recipes/eject/eject_2.1.5.bb
index 7c46432..06328dc 100644
--- a/recipes/eject/eject_2.1.5.bb
+++ b/recipes/eject/eject_2.1.5.bb
@@ -2,12 +2,22 @@ DESCRIPTION = "Eject allows removable media (typically a CD-ROM, floppy disk, ta
 HOMEPAGE = "http://eject.sourceforge.net/"
 LICENSE = "GPLv2"
 
-inherit autotools gettext
+PR = "r1"
 
-SRC_URI = "http://sources.openembedded.org/eject-2.1.5.tar.gz"
+inherit autotools gettext update-alternatives
 
-S = "${WORKDIR}/${PN}"
+ALTERNATIVE_NAME = "volname"
+ALTERNATIVE_LINK = "${bindir}/volname"
+ALTERNATIVE_PATH = "${bindir}/volname.${PN}"
+ALTERNATIVE_PRIORITY = "100"
 
+SRC_URI = "http://sources.openembedded.org/${P}.tar.gz"
 
 SRC_URI[md5sum] = "b96a6d4263122f1711db12701d79f738"
 SRC_URI[sha256sum] = "ef9f7906484cfde4ba223b2682a37058f9a3c7d3bb1adda7a34a67402e2ffe55"
+
+do_install_append() {
+  mv ${D}/${bindir}/volname ${D}/${bindir}/volname.${PN}
+}
+
+S = "${WORKDIR}/${PN}"
-- 
1.7.4



