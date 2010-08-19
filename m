Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <coolaj86@gmail.com>) id 1OlyZS-0008Hg-Kh
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Aug 2010 08:25:51 +0200
Received: by pzk2 with SMTP id 2so583568pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Aug 2010 23:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=8X9weCOIS2TMbYIZFI2rHDliqpXRUFDxaHuHQudQ78E=;
	b=CekY8M1RuF8rmVSE8R9ic9LUjkLDXBPS3VJ6HCZTb+DWHVWOopvdV8pncXc5jpb+UC
	N+U8qjWHqE2HAwtQLM6Rh5dQTf0Ke9sKmNoUunLjuRWmx4xRHElJYhG6mFuG4/p11Q4q
	eyC0FLyD+iDSq4ycXtfxM0aPr/DvYMirsEFBg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=md3vnOTIPcAKX5zn45YVKKStIMzVqLG66K8P9KI2t2u2X/l10USDzjSYtHgoXwonJC
	fmXb4qIj4QGtlXzVlL187lXHH+Jj6EaNTUzxvj4x2qMO5I5Ab+R13fJ9G+M3mXQlx8vi
	uBMBQRRR8WFfvXQY7s0AUZy+E6v3uFWDNfjak=
Received: by 10.142.132.18 with SMTP id f18mr8008165wfd.190.1282198779449;
	Wed, 18 Aug 2010 23:19:39 -0700 (PDT)
Received: from localhost.localdomain ([76.8.213.37])
	by mx.google.com with ESMTPS id b19sm1295551wff.7.2010.08.18.23.19.37
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 18 Aug 2010 23:19:38 -0700 (PDT)
From: AJ ONeal <coolaj86@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Date: Thu, 19 Aug 2010 00:19:09 -0600
Message-Id: <1282198749-25911-1-git-send-email-coolaj86@gmail.com>
X-Mailer: git-send-email 1.6.0.4
X-SA-Exim-Connect-IP: 209.85.210.47
X-SA-Exim-Mail-From: coolaj86@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] removed duplicate node recipe
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
X-List-Received-Date: Thu, 19 Aug 2010 06:25:51 -0000

---
 recipes/node/node_v0.1.104.bb |   23 -----------------------
 1 files changed, 0 insertions(+), 23 deletions(-)
 delete mode 100644 recipes/node/node_v0.1.104.bb

diff --git a/recipes/node/node_v0.1.104.bb b/recipes/node/node_v0.1.104.bb
deleted file mode 100644
index 368b8fb..0000000
--- a/recipes/node/node_v0.1.104.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
-PR = "r0"
-DEPENDS = "openssl"
-SRC_URI = " \
-http://nodejs.org/dist/node-v${PV}.tar.gz \
-"
-#libev-cross.patch
-#node-cross.patch
-SRC_URI[md5sum] = "907fa1e0a2f1f0c3df5efc97fd05a7d2"
-SRC_URI[sha256sum] = "a1c776f44bc07305dc0e56df17cc3260eaafa0394c3b06c27448ad85bec272df"
-S = "${WORKDIR}/node-v${PV}"
-do_configure () {
-./configure
-}
-do_compile () {
-export DEST_CPU=arm
-make
-}
-do_install () {
-install -d ${D}${bindir}/
-install -m 0755 ${S}/node ${D}${bindir}/
-}
-FILES_${PN} = "${bindir}/node"
-- 
1.6.0.4



