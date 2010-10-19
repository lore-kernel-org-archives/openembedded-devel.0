Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1P87fy-0002UA-1B
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Oct 2010 10:36:06 +0200
Received: by fxm6 with SMTP id 6so1461437fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Oct 2010 01:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=2gSM8uwZc1knNvFougFM7um2Au88JOToFgbQjQp4fKo=;
	b=fOTTmjwPC2jbxDDV7DQBNypn4bIJwja2BphbU/We0x3o/QEtP4CXmVoGMc1AKRfDxz
	D+lw7GyvTEkgt8zRiLYSiAnJ1yA3ligwmKIGdZuyH7v/KTWw93XR8QXSAi7nPannHrDR
	rCCDvpGPuUk53WcXn+rq9L5px/jp7+kkapGYo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=s5yV/z3PJeiekmU+MgjZZ17AszYV64JwCwlMvmwZOF4VMsxX+A21aCa7gspqrpNvcc
	rrWHN0wyTQ6vXAgPsIRx6yBift6JoncoGs8je1iEWfZICkJguYzuCSdV4RpFiEOufnGj
	wdKx7V4E9FhgrLJTpxYAfZVjF4wzri3kfP36Y=
Received: by 10.103.49.6 with SMTP id b6mr3690375muk.118.1287477273645;
	Tue, 19 Oct 2010 01:34:33 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id k21sm4618520faa.25.2010.10.19.01.34.32
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 19 Oct 2010 01:34:33 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Oct 2010 10:33:26 +0200
Message-Id: <1287477207-27752-13-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.3.1
In-Reply-To: <1287477207-27752-1-git-send-email-Martin.Jansa@gmail.com>
References: <1287477207-27752-1-git-send-email-Martin.Jansa@gmail.com>
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 12/13] settingsgui: move both versions to obsolete, nobody have it in task/images now
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
X-List-Received-Date: Tue, 19 Oct 2010 08:36:06 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../obsolete/openmoko2/settingsgui_0.7+0.8-beta.bb |   14 ++++++++++++++
 recipes/obsolete/openmoko2/settingsgui_0.8.bb      |   13 +++++++++++++
 .../openmoko-3rdparty/settingsgui_0.7+0.8-beta.bb  |   14 --------------
 recipes/openmoko2/settingsgui_0.8.bb               |   13 -------------
 4 files changed, 27 insertions(+), 27 deletions(-)
 create mode 100644 recipes/obsolete/openmoko2/settingsgui_0.7+0.8-beta.bb
 create mode 100644 recipes/obsolete/openmoko2/settingsgui_0.8.bb
 delete mode 100644 recipes/openmoko-3rdparty/settingsgui_0.7+0.8-beta.bb
 delete mode 100644 recipes/openmoko2/settingsgui_0.8.bb

diff --git a/recipes/obsolete/openmoko2/settingsgui_0.7+0.8-beta.bb b/recipes/obsolete/openmoko2/settingsgui_0.7+0.8-beta.bb
new file mode 100644
index 0000000..f40c576
--- /dev/null
+++ b/recipes/obsolete/openmoko2/settingsgui_0.7+0.8-beta.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "Openmoko Settings GUI"
+AUTHOR = "Kristian M."
+SECTION = "openmoko/applications"
+RDEPENDS_${PN} = "python-pygtk python-subprocess python-threading"
+LICENSE = "GPL"
+PR = "r1"
+
+SRC_URI = "http://mput.de/~kristian/.openmoko/settingsgui-0.8-beta.tar.bz2"
+S = "${WORKDIR}/settingsgui-0.8-beta"
+
+inherit distutils
+
+SRC_URI[md5sum] = "4a4c4855447f506078dfb762ba72e35d"
+SRC_URI[sha256sum] = "5f4f727cbe982db701dcc4a70cd2c19a4c153a4b0b35a6b5b561b48d53649855"
diff --git a/recipes/obsolete/openmoko2/settingsgui_0.8.bb b/recipes/obsolete/openmoko2/settingsgui_0.8.bb
new file mode 100644
index 0000000..2e4fcea
--- /dev/null
+++ b/recipes/obsolete/openmoko2/settingsgui_0.8.bb
@@ -0,0 +1,13 @@
+DESCRIPTION = "Openmoko Settings GUI"
+AUTHOR = "Kristian M."
+SECTION = "openmoko/applications"
+RDEPENDS_${PN} = "python-pygtk python-subprocess python-threading"
+LICENSE = "GPL"
+PR = "r1"
+
+SRC_URI = "http://mput.de/~kristian/.openmoko/settingsgui-0.8.tar.bz2"
+
+inherit distutils
+
+SRC_URI[md5sum] = "8b6f19636983fe22bad5ee1e0906c837"
+SRC_URI[sha256sum] = "e839e55b2d7babbbf0302429e9c58ff6e62a064c9ae4cb2d6f957a89b81e0022"
diff --git a/recipes/openmoko-3rdparty/settingsgui_0.7+0.8-beta.bb b/recipes/openmoko-3rdparty/settingsgui_0.7+0.8-beta.bb
deleted file mode 100644
index f40c576..0000000
--- a/recipes/openmoko-3rdparty/settingsgui_0.7+0.8-beta.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-DESCRIPTION = "Openmoko Settings GUI"
-AUTHOR = "Kristian M."
-SECTION = "openmoko/applications"
-RDEPENDS_${PN} = "python-pygtk python-subprocess python-threading"
-LICENSE = "GPL"
-PR = "r1"
-
-SRC_URI = "http://mput.de/~kristian/.openmoko/settingsgui-0.8-beta.tar.bz2"
-S = "${WORKDIR}/settingsgui-0.8-beta"
-
-inherit distutils
-
-SRC_URI[md5sum] = "4a4c4855447f506078dfb762ba72e35d"
-SRC_URI[sha256sum] = "5f4f727cbe982db701dcc4a70cd2c19a4c153a4b0b35a6b5b561b48d53649855"
diff --git a/recipes/openmoko2/settingsgui_0.8.bb b/recipes/openmoko2/settingsgui_0.8.bb
deleted file mode 100644
index 2e4fcea..0000000
--- a/recipes/openmoko2/settingsgui_0.8.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-DESCRIPTION = "Openmoko Settings GUI"
-AUTHOR = "Kristian M."
-SECTION = "openmoko/applications"
-RDEPENDS_${PN} = "python-pygtk python-subprocess python-threading"
-LICENSE = "GPL"
-PR = "r1"
-
-SRC_URI = "http://mput.de/~kristian/.openmoko/settingsgui-0.8.tar.bz2"
-
-inherit distutils
-
-SRC_URI[md5sum] = "8b6f19636983fe22bad5ee1e0906c837"
-SRC_URI[sha256sum] = "e839e55b2d7babbbf0302429e9c58ff6e62a064c9ae4cb2d6f957a89b81e0022"
-- 
1.7.3.1



