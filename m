Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pirobk@gmail.com>) id 1OxRwQ-0001JX-5Z
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Sep 2010 00:00:58 +0200
Received: by fxm17 with SMTP id 17so409250fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Sep 2010 15:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:message-id:x-mailer;
	bh=WBBVznhdDhKEwIHZBu9Xwr60BsCnGdzKycrkaATo87Y=;
	b=f7NM34upvm4COPYLPW6aZ9b7nqTiGV0B1tv1NvFARd8uXbezhlpJssWoTKFCheL5lV
	h4iWPUVu65wOTfszj0PVvRMLA5uyNirO6PYXi9tXW4yybe2ekO3nUnQIvj76lwJap3jk
	3tlf6FIPgkcQVGhaynqyQfxM580mD4oXk3f2s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer;
	b=jI+yesN4dg2hX3mpUFyoNvsHQpUzE1dVwm14SzpvEBxal4dUEbXt2LP3sgbEyaoQ5U
	+Nk+fC8SRG9zgdWCvw7sveEnoWFJvTcN6nuabuQ9QhHelCz8vX4lnbCzCldfm+pky9hM
	c7gdHi/wuIi9R1INt2/wQPUh09yx+R+pbcijQ=
Received: by 10.223.113.2 with SMTP id y2mr3822052fap.49.1284933604118;
	Sun, 19 Sep 2010 15:00:04 -0700 (PDT)
Received: from localhost.localdomain (g226082064.adsl.alicedsl.de
	[92.226.82.64])
	by mx.google.com with ESMTPS id r10sm2622510faq.5.2010.09.19.15.00.02
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 19 Sep 2010 15:00:03 -0700 (PDT)
From: =?UTF-8?q?Bj=C3=B6rn=20Krombholz?= <pirobk@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 19 Sep 2010 23:59:52 +0200
Message-Id: <1284933592-4558-1-git-send-email-pirobk@gmail.com>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: pirobk@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] qt4-embedded: avoid circular dependencies for reciped providing qt4-embedded
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
X-List-Received-Date: Sun, 19 Sep 2010 22:00:59 -0000

* qt4e.bbclass did add a dependency on qt4-embedded for recipes
  providing qt4-embedded. This breaks building of qt4-embedded-gles
  in 2 ways:

  1. PREFERRED_PROVIDER_qt4-embedded = qt4-embedded-gles
     adds a circular dependency.

  2. bitbake qt4-embedded-gles
     first builds and installs qt4-embedded to sysroots/ and then
     fails to link the qt4-embedded-gles build against the libs in
     sysroots which don't provide the gl specific symbols

* The fix avoids adding the dependency for package names _beginning_
  with 'qt4-embedded' (as it is done in the x11 version).
---
 classes/qt4e.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/classes/qt4e.bbclass b/classes/qt4e.bbclass
index f72e06b..303b79b 100644
--- a/classes/qt4e.bbclass
+++ b/classes/qt4e.bbclass
@@ -1,4 +1,4 @@
-DEPENDS_prepend = "${@["qt4-embedded ", ""][(bb.data.getVar('PN', d, 1) == 'qt4-embedded')]}"
+DEPENDS_prepend = "${@["qt4-embedded ", ""][(bb.data.getVar('PN', d, 1)[:12] == 'qt4-embedded')]}"
 inherit qmake2
 
 QT_DIR_NAME = "qtopia"
-- 
1.7.1



