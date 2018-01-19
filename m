Return-Path: <athoik@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id BECB46E650
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Jan 2018 22:14:08 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id t16so2821078wrc.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Jan 2018 14:14:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=pMwZwjfkDM9h0V9DMsr2u3Wa9vZpJMsgyK9Jmk54egM=;
	b=bJHucTSmS8YW4OVXP/HUtd/MubKPX9IcqeVUm0UQyMtxqbF/Njbq5YmNELQEvWVg3E
	y/QsnqpYbl1y7ifODGoBbEOdFBC2T7IuW1cARlavYMbxnB6bIJI3qO2dgGdLHXc9ISg0
	3P++fxxIuaA9et08j56GAU9i/ARX86FzCiUAlCFL0n9rZhZxsYL1K7dAGAQ3m/3C19Mq
	boh7sVPJO3qWu8tW/3SvtaE+4VhXASfutuQpKrrb2RNZXI7a3oz3nWl7k3wqBmlW/auP
	lilGOG0f1hqyDez445Yw6dNOvSjqSAmmjCx9xMUiGTRteeqMnNv4cQzThBta1wrzmYz+
	7Z8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=pMwZwjfkDM9h0V9DMsr2u3Wa9vZpJMsgyK9Jmk54egM=;
	b=O2CEgW50RfXQmcZMQeUXVxoEhN7zcMLmj/BKn+dMSNOSjIxRfdA84yXNLX1HciuB1n
	kVxIQvqmRkbHruOWOKyMDmj3KCO1IiKnMVapuEwQlHOamUxs4ceFziCbv8yofoAsvuV2
	DJOJY0XwmaK/ChtOzPgOYAJk+ipJOeey8c/98921Q/igVZj3QKK4hlz39uic4W0pMbf2
	Y2uxFl/NOm0eSEODYC4akTgESLT8yWAt4e2nURwKndSX3RzTmIGcUYPNArltljeCbjbF
	UJ1DTCkIXG2jFelVHuIf+MxQ+zaijJxB2nwrCxgPpeCs5sgEOhh8vpXINrguWtyE65RT
	5N0w==
X-Gm-Message-State: AKwxyteUnkpnTHAz7JumqJNjtkZylUycDkChtXCvJDEozQgXWJtkYrUD
	45B1EGHWqHCQfM+DcphZmWIC
X-Google-Smtp-Source: ACJfBouQuKrY9HJDlLoAdtNBrwgMK9kqwqayPULZnhu0S2Lcba1lBWNyxZwRc/2lVWiUmYUNYk5SbA==
X-Received: by 10.223.151.195 with SMTP id t3mr9825992wrb.274.1516400049097;
	Fri, 19 Jan 2018 14:14:09 -0800 (PST)
Received: from images.net (ns380618.ip-188-165-252.eu. [188.165.252.42])
	by smtp.gmail.com with ESMTPSA id
	188sm3395257wmg.29.2018.01.19.14.14.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 19 Jan 2018 14:14:08 -0800 (PST)
From: Athanasios Oikonomou <athoik@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 20 Jan 2018 00:13:43 +0200
Message-Id: <1516400023-14815-1-git-send-email-athoik@gmail.com>
X-Mailer: git-send-email 2.1.4
Cc: Athanasios Oikonomou <athoik@gmail.com>
Subject: [morty][PATCH] nis, opencv: Update getVar/setVar syntax
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
X-List-Received-Date: Fri, 19 Jan 2018 22:14:09 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The deprecated APIs are removed from bitbake, update two old style references
in meta-oe/meta-networking.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Athanasios Oikonomou <athoik@gmail.com>
---
 meta-networking/recipes-support/nis/nis.inc  | 2 +-
 meta-oe/recipes-support/opencv/opencv_3.1.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-support/nis/nis.inc b/meta-networking/recipes-support/nis/nis.inc
index c4aa10e..e027a1c 100644
--- a/meta-networking/recipes-support/nis/nis.inc
+++ b/meta-networking/recipes-support/nis/nis.inc
@@ -25,7 +25,7 @@ do_install() {
 # so force the package to be skipped here (this will cause a
 # 'nothing provides' error)
 python () {
-    os = bb.data.getVar("TARGET_OS", d, 1)
+    os = d.getVar("TARGET_OS", True)
     if os == "linux-uclibc":
         raise bb.parse.SkipPackage("NIS functionality requires rpcsvc/yp.h, uClibC does not provide this")
 }
diff --git a/meta-oe/recipes-support/opencv/opencv_3.1.bb b/meta-oe/recipes-support/opencv/opencv_3.1.bb
index 1bbb965..cf7fd62 100644
--- a/meta-oe/recipes-support/opencv/opencv_3.1.bb
+++ b/meta-oe/recipes-support/opencv/opencv_3.1.bb
@@ -108,7 +108,7 @@ python populate_packages_prepend () {
     for pkg in packages[1:]:
         if not pkg in blacklist and not pkg in metapkg_rdepends and not pkg.endswith('-dev') and not pkg.endswith('-dbg') and not pkg.endswith('-doc') and not pkg.endswith('-locale'):
             metapkg_rdepends.append(pkg)
-    bb.data.setVar('RDEPENDS_' + metapkg, ' '.join(metapkg_rdepends), d)
+    d.setVar('RDEPENDS_' + metapkg, ' '.join(metapkg_rdepends))
 
 }
 
-- 
2.1.4


