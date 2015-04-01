Return-Path: <joe@deserted.net>
Received: from mail-ie0-f180.google.com (mail-ie0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id E184D724B9
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Apr 2015 20:34:55 +0000 (UTC)
Received: by iebmp1 with SMTP id mp1so46400063ieb.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Apr 2015 13:34:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:subject:date:message-id;
	bh=hJNDN5VoodZD6S/hwmgejQz3r81LH0UR+7iLoO53ook=;
	b=TLnfG1ant4axBHIZ1Bz6VaazhP+Wq4cVRQceR8cHh2uzO18xNnPHv3QyNHzIaDRCZW
	nt8qYQ/kBHd1n8pq+rtwsh9z6/Pqw0PAL7CzUretpqWlum5pNctyh/PG47YNFdYppIjq
	KtviNoJTHFII6V0O04L2blDZ4HvoTI+c1fwDMa0NaZvPkWbwdJU46M2CVqRcPvQN7sGg
	78PkSavjID8aU7DB+nMasqwKDALHg6ZCX0KVBuUwFYDBy9k7iZPRggdHYpV6LKe/aJmt
	KAHbshuchozO0ogFucxS2hHGlYhrt0/ZIqQrles9Flu5ZdGORcdLK+pHAcfBNGZwhJwo
	QPOw==
X-Gm-Message-State: ALoCoQmyH51KGMYLNL+dtp+0BAhgA/C2BqotdYNR9zvnajiYvER6T0fF92FKPGRCe2focMlwfaSb
X-Received: by 10.42.249.77 with SMTP id mj13mr63354062icb.80.1427920496296;
	Wed, 01 Apr 2015 13:34:56 -0700 (PDT)
Received: from mir.deserted.net (24-246-4-250.cable.teksavvy.com.
	[24.246.4.250])
	by mx.google.com with ESMTPSA id h15sm1842629ioh.27.2015.04.01.13.34.55
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 01 Apr 2015 13:34:55 -0700 (PDT)
Sender: Joe MacDonald <joe@deserted.net>
From: Joe MacDonald <joe_macdonald@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Apr 2015 16:36:17 -0400
Message-Id: <1427920577-21696-1-git-send-email-joe_macdonald@mentor.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-networking][PATCH] ypbind-mt: Add systemd dependency
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Apr 2015 20:34:56 -0000

When building for a system including systemd ypbind-mt will link against
libsystemd creating an implicit dependency.  Make that explicit.

Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
---
 meta-networking/recipes-support/nis/ypbind-mt_1.38.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/nis/ypbind-mt_1.38.bb b/meta-networking/recipes-support/nis/ypbind-mt_1.38.bb
index f7e6b43..d25ef5c 100644
--- a/meta-networking/recipes-support/nis/ypbind-mt_1.38.bb
+++ b/meta-networking/recipes-support/nis/ypbind-mt_1.38.bb
@@ -17,7 +17,10 @@ the server which answered as first. \
 This is the final IPv4-only version of ypbind-mt. \
 "
 HOMEPAGE = "http://www.linux-nis.org/nis/ypbind-mt/index.html"
-DEPENDS = "yp-tools"
+DEPENDS = " \
+           yp-tools \
+           ${@base_contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
+          "
 # ypbind-mt now provides all the functionality of ypbind
 # and is used in place of it.
 PROVIDES += "ypbind"
-- 
1.9.1


