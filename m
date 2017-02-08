Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f43.google.com (mail-it0-f43.google.com
	[209.85.214.43])
	by mail.openembedded.org (Postfix) with ESMTP id 87C0871BA1
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Feb 2017 09:40:03 +0000 (UTC)
Received: by mail-it0-f43.google.com with SMTP id c7so98982171itd.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Feb 2017 01:40:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=SNsafjynOlhAKmuJZMP+GHe5Br/F7iZo/20/GmgIxfA=;
	b=ogbl3t+tPCq0Sa8LC8FgGsu8oVHFVC0w6Swqkenit+g5bLmTjcrTxfKIrw42/cR8ip
	OQ0MOd2LA2MrQLNWf++OAqRDR0a9SjarVyg0SQLOQ8r46K9hCTdCBxI6qiDXDC7aorha
	CRH2Jeu1UI7XwavqVOpLb4RLOzcpbzjPfe5TF8wOzvXSptiKWWNSdb+KvnKIfsxwcQw7
	419qfrGfpIz9sBbxO7IVg/NC9ElpUAcFmvZ8mlHJrSHNq14Gp707jlt24Ze9W/Ylr4t3
	26UGPZemmIqmmAtB6cUUutz2Q/bg5BjW2BQxZcBamwnhRQ9q9GFHgnGCgInRiHV64rcq
	ttYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=SNsafjynOlhAKmuJZMP+GHe5Br/F7iZo/20/GmgIxfA=;
	b=r9K3BBelIGAMrh7V/sbMbcMjZRtXapV0m29oCII2ntX2bMCgiX+SsGBZu5Uv843EMM
	KPSD1vCMIIjSB8WctUvq2sxNVfgphXsJHQCg7hYuw3XOjomAcnJwNG1TybbziHilGrWd
	YbcXZx4Zh2u4MmdK4NFuTe5CaM2sfTqUaaCfBiHAI8MgMKmqkQV8b/5roBZNEZo+PaUp
	loxyPDB5gBXhTIH//Dn7bi+ucGIWjhXq01LUCwloUHBQlPNjiAmDlIGy6GLj3MbFTzvt
	LDKhTbTbovQuktk40jufSMYEM2DdGFinSAzOWRlZdz/FCOx6U1Ewm7eSNUoExe385k9/
	rAzg==
X-Gm-Message-State: AIkVDXKMrxZmO7+Rtfc/cHKRXRhVupvwYGrj8cLjGxjGvaGXZOT5PW4oiz8A6YXFHk+/fPXb
X-Received: by 10.36.91.17 with SMTP id g17mr14305458itb.70.1486546803420;
	Wed, 08 Feb 2017 01:40:03 -0800 (PST)
Received: from pohly-desktop.fritz.box (p5DE8DEB3.dip0.t-ipconnect.de.
	[93.232.222.179]) by smtp.gmail.com with ESMTPSA id
	v68sm10998207ioi.20.2017.02.08.01.40.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 08 Feb 2017 01:40:02 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Feb 2017 10:39:50 +0100
Message-Id: <453ff67db942cb3206edcaa6c7ab47e0aff2e5ce.1486546779.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [meta-oe][PATCH] procmail: avoid bashism in do_install
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
X-List-Received-Date: Wed, 08 Feb 2017 09:40:03 -0000

Found with verify-bashisms.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta-oe/recipes-support/procmail/procmail_3.22.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/procmail/procmail_3.22.bb b/meta-oe/recipes-support/procmail/procmail_3.22.bb
index 1063654..9bbd410 100644
--- a/meta-oe/recipes-support/procmail/procmail_3.22.bb
+++ b/meta-oe/recipes-support/procmail/procmail_3.22.bb
@@ -38,7 +38,8 @@ do_compile() {
 
 do_install() {
     install -d ${D}${bindir}
-    install -d ${D}${mandir}/man{1,5}
+    install -d ${D}${mandir}/man1
+    install -d ${D}${mandir}/man5
     oe_runmake -i BASENAME=${D}/usr MANDIR=${D}${mandir} install
     install -m 0644 debian/mailstat.1 ${D}${mandir}/man1
 }

base-commit: dd0494206e2ad08f5b9e969c94da66fd10c51e9c
-- 
git-series 0.9.1

