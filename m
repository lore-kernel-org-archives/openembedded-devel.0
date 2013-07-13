Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f177.google.com (mail-ea0-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id EFD8C6A465
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Jul 2013 22:35:51 +0000 (UTC)
Received: by mail-ea0-f177.google.com with SMTP id j14so6964173eak.36
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Jul 2013 15:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=pT6S326uVQzUVKuLNh2k2HZmrepkBUCnrFc76eejyNU=;
	b=f0PQRLq2kwMpNyANiVXFNZMANjsdOjTIP4kEVkR8L67Hzg7fKkf4CxstOKl9ckkyaD
	I6fBElTE4mN7D8UvcmNcNxXq273SeWmkOlb03KWSC0+Q5nz4ot5bPNIhwF/wWDxfTca6
	vwDDuALGk8iMpsJPfRCGeeSRm5GIIs8+wVEQ5l/jQbLvDOhw5KpI/avUQfgX3MUVZc9H
	sfglH32o7bvqLVW1x4oyRHSswLSXY8xiz8iJS2flyI7ML/+8I/SA0zq2KX9/pLCiB3zg
	mnEmsRxKvHuJ7W5VuPVVVPYSK5bbt/fqlE/ulQTBanjEwUtsQN9DYuCMhgFGmNi7jFDD
	BEVg==
X-Received: by 10.15.94.11 with SMTP id ba11mr52973161eeb.101.1373754951690;
	Sat, 13 Jul 2013 15:35:51 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	l42sm90198871eeo.14.2013.07.13.15.35.49 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 13 Jul 2013 15:35:50 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 14 Jul 2013 00:35:50 +0200
Message-Id: <1373754950-12485-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [meta-systemd][PATCH] dbus: rename .bbappend to match oe-core
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
X-List-Received-Date: Sat, 13 Jul 2013 22:35:53 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-core/dbus/{dbus_1.6.8.bbappend => dbus_1.6.10.bbappend}     | 2 --
 1 file changed, 2 deletions(-)
 rename meta-systemd/oe-core/recipes-core/dbus/{dbus_1.6.8.bbappend => dbus_1.6.10.bbappend} (77%)

diff --git a/meta-systemd/oe-core/recipes-core/dbus/dbus_1.6.8.bbappend b/meta-systemd/oe-core/recipes-core/dbus/dbus_1.6.10.bbappend
similarity index 77%
rename from meta-systemd/oe-core/recipes-core/dbus/dbus_1.6.8.bbappend
rename to meta-systemd/oe-core/recipes-core/dbus/dbus_1.6.10.bbappend
index e90c555..f006b3f 100644
--- a/meta-systemd/oe-core/recipes-core/dbus/dbus_1.6.8.bbappend
+++ b/meta-systemd/oe-core/recipes-core/dbus/dbus_1.6.10.bbappend
@@ -1,5 +1,3 @@
-PRINC := "${@int(PRINC) + 1}"
-
 RPROVIDES_${PN} += "${PN}-systemd"
 RREPLACES_${PN} += "${PN}-systemd"
 RCONFLICTS_${PN} += "${PN}-systemd"
-- 
1.8.3.2


