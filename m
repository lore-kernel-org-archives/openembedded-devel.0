Return-Path: <martin.jansa@gmail.com>
Received: from mail-pb0-f46.google.com (mail-pb0-f46.google.com
	[209.85.160.46])
	by mail.openembedded.org (Postfix) with ESMTP id 8BE7B616E3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 May 2013 19:37:52 +0000 (UTC)
Received: by mail-pb0-f46.google.com with SMTP id rq2so4572344pbb.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 May 2013 12:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=a/HfTN9oY1B/h/tCO2f7tiztC3k8rQOjzcE5QocCmpE=;
	b=dq9H86Y3zgKxiQova6jf2G8wMmXAWIf3mHMEtrbWEVlADj0p+/RDOyeVeacjQay2BS
	q9XYv/ZTjwyR3nR9HdgeXwLR41FPbutWL3C30jITob+DzSUcj8MuO2qkWL/FP9I7yYma
	1er5FpJ5b6QDPkM9nld5nBQnwNuhoSlg6YCOCRPqqLJbKfH1YoacMSIiwwxB6mJu38kL
	/0jZ64yJ6+6/dxsSBGC5z8D0jHHBqesaJVIs4jGnTrRZ6B5m7Z/crq7+MJI6BFafme/E
	DRWkI6j7H55n52dJJRFYzAjI26jEBD01bqOMe2uM9iO1Qr3BFbGH8HnLp2ParbYmiOWV
	aq4g==
X-Received: by 10.66.193.136 with SMTP id ho8mr19388523pac.27.1369424273603;
	Fri, 24 May 2013 12:37:53 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	tb7sm17320427pbc.14.2013.05.24.12.37.51 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 24 May 2013 12:37:52 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 May 2013 21:37:45 +0200
Message-Id: <1369424267-15051-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
Subject: [meta-systemd][PATCH 1/3] util-linux: rename bbappend to match new version from oe-core
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
X-List-Received-Date: Fri, 24 May 2013 19:37:53 -0000

* removed PRINC to make it easier to remove .bbappend if this
  functionality is moved to oe-core

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../{util-linux_2.22.2.bbappend => util-linux_2.23.bbappend}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-systemd/oe-core/recipes-core/util-linux/{util-linux_2.22.2.bbappend => util-linux_2.23.bbappend} (90%)

diff --git a/meta-systemd/oe-core/recipes-core/util-linux/util-linux_2.22.2.bbappend b/meta-systemd/oe-core/recipes-core/util-linux/util-linux_2.23.bbappend
similarity index 90%
rename from meta-systemd/oe-core/recipes-core/util-linux/util-linux_2.22.2.bbappend
rename to meta-systemd/oe-core/recipes-core/util-linux/util-linux_2.23.bbappend
index fae15a0..c6a97ca 100644
--- a/meta-systemd/oe-core/recipes-core/util-linux/util-linux_2.22.2.bbappend
+++ b/meta-systemd/oe-core/recipes-core/util-linux/util-linux_2.23.bbappend
@@ -1,10 +1,10 @@
 inherit systemd
 
-PRINC := "${@int(PRINC) + 2}"
-
 SYSTEMD_UNITDIR = "${systemd_unitdir}/system"
 EXTRA_OECONF += "--enable-socket-activation --with-systemdsystemunitdir=${SYSTEMD_UNITDIR}"
+
 RPROVIDES_${PN} += "${PN}-systemd"
 RREPLACES_${PN} += "${PN}-systemd"
 RCONFLICTS_${PN} += "${PN}-systemd"
+
 SYSTEMD_SERVICE_${PN} = "uuidd.socket"
-- 
1.8.2.1


