Return-Path: <moritz.fischer@ettus.com>
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com
	[209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id 27E65731D0
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Jan 2016 20:17:48 +0000 (UTC)
Received: by mail-pa0-f53.google.com with SMTP id uo6so248508162pac.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Jan 2016 12:17:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ettus-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=KoO0eZ38hGYLuE1uchRWMy6etpsgEahmfUi06Ga684U=;
	b=z8XDbwrawxUdNMsQ25v4Ss0j4HlXHfUZRkh8QZhIEQSHHtfnUKIIrtkIpA6IO/v9yz
	/jjJQsrOnhDb2LOFhfNY2uqwoTGUWsXpKFlkiTYmcw353wYCfcStF0euwL21vE752ag8
	WC7s1k1MkNCtP4VKELjBPV+u7ROyuT1qnb+uVZ2D+TOn111EN2gJj/VbZ1lKyiMRHd0x
	QcnypJEg3bJhEVs61iWzuXXaq7nP2+F8scck+XbXHQOdGXxEdax09frhIt4hQFKyIyxy
	0jTE/n5GdABN4nJepJiJ4QMwcQuPDpdllK7dee8sK8ck1ia+zSLQzilTwEiQ/T44UuiV
	ttBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=KoO0eZ38hGYLuE1uchRWMy6etpsgEahmfUi06Ga684U=;
	b=hlBnUwkh2LXic7EzaatEB81+eueBZxf8rIZwh7/dhq8tkn6aaXNnMYkp94KGBRfGRi
	jVwy1zjioJyayRfcnPucTU6kjjcqisoZZXnx1arC2ssTlvH0apkcevBNLOKolVHwNJih
	mZGyqKbd7BhwWW7Ll7ldp+ieIAMc52y70Ek75lnUKR7IGMpMWEETBX8eosrgsIXzwViG
	ryuQGnsTvtYocxsrsmHgspu6qvShXzsVEAmQ5oFBX8TpqFUbT11yRTih5jsZpAwPMLLF
	3cFdJFwUSUpxvTC3SU5kbryNyGY0sAYREmA4SMzIdnW5+GnqVrQCGBcNC92vYC8AKItN
	kniw==
X-Gm-Message-State: ALoCoQkc6jdAUboXM6KpMBGMFAjKfUsKYSfIW53k6+FkJjqwg8pdwsRH3Sp+gz7pKYqnLZSDJyHPNEibAR6dPHjz+dD9xUQGKQ==
X-Received: by 10.66.236.129 with SMTP id uu1mr49452592pac.158.1452197868748; 
	Thu, 07 Jan 2016 12:17:48 -0800 (PST)
Received: from fenrir.amer.corp.natinst.com
	(207-114-172-147.static.twtelecom.net. [207.114.172.147])
	by smtp.gmail.com with ESMTPSA id
	xz6sm161528475pab.42.2016.01.07.12.17.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Jan 2016 12:17:47 -0800 (PST)
From: Moritz Fischer <moritz.fischer@ettus.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Jan 2016 12:17:34 -0800
Message-Id: <1452197854-12728-1-git-send-email-moritz.fischer@ettus.com>
X-Mailer: git-send-email 2.4.3
Subject: [meta-oe][PATCHv2] gpsd: Add patch to fix broken ACTIVATE hook.
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
X-List-Received-Date: Thu, 07 Jan 2016 20:17:49 -0000

This patch is already in mainline gpsd. It fixes a
bug where the ACTIVATE hook for a device never gets
called.

Signed-off-by: Moritz Fischer <moritz.fischer@ettus.com>
---
 ...e-Fix-issue-with-ACTIVATE-hook-not-being-.patch | 35 ++++++++++++++++++++++
 meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb       |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta-oe/recipes-navigation/gpsd/gpsd-3.14/0001-libgpsd-core-Fix-issue-with-ACTIVATE-hook-not-being-.patch

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd-3.14/0001-libgpsd-core-Fix-issue-with-ACTIVATE-hook-not-being-.patch b/meta-oe/recipes-navigation/gpsd/gpsd-3.14/0001-libgpsd-core-Fix-issue-with-ACTIVATE-hook-not-being-.patch
new file mode 100644
index 0000000..7a06795
--- /dev/null
+++ b/meta-oe/recipes-navigation/gpsd/gpsd-3.14/0001-libgpsd-core-Fix-issue-with-ACTIVATE-hook-not-being-.patch
@@ -0,0 +1,35 @@
+From 6ff099b1ba8de74df9ddeb61e3825264b96ef692 Mon Sep 17 00:00:00 2001
+From: Moritz Fischer <moritz.fischer@ettus.com>
+Date: Tue, 22 Dec 2015 19:38:31 -0800
+Subject: [PATCH] libgpsd-core: Fix issue with ACTIVATE hook not being called.
+
+In the current system session->mode seemed to ignore the
+O_OPTIMIZE flag, leading to the ACTIVATE hook being ignored.
+
+Another way to fix this would be to keep the session->mode
+condition pull up the check for O_CONTINUE.
+
+Upstream-Status: Backported
+This patch is in upstream git
+
+Signed-off-by: Moritz Fischer <moritz.fischer@ettus.com>
+---
+ libgpsd_core.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libgpsd_core.c b/libgpsd_core.c
+index 31fec2a..a84e85f 100644
+--- a/libgpsd_core.c
++++ b/libgpsd_core.c
+@@ -543,7 +543,7 @@ int gpsd_open(struct gps_device_t *session)
+ int gpsd_activate(struct gps_device_t *session, const int mode)
+ /* acquire a connection to the GPS device */
+ {
+-    if (session->mode == O_OPTIMIZE)
++    if (mode == O_OPTIMIZE)
+ 	gpsd_run_device_hook(&session->context->errout,
+ 			     session->gpsdata.dev.path, "ACTIVATE");
+     session->gpsdata.gps_fd = gpsd_open(session);
+-- 
+2.4.3
+
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb
index 6ae2f30..646360c 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb
@@ -16,6 +16,7 @@ SRC_URI = "${SAVANNAH_GNU_MIRROR}/${BPN}/${BP}.tar.gz \
     file://0002-Add-a-test-for-C11-and-check-we-have-C11-before-usin.patch \
     file://0003-Whoops-check-for-C11-not-for-not-C11-in-stdatomic.h-.patch \
     file://0001-Include-stdatomic.h-only-in-C-mode.patch \
+    file://0001-libgpsd-core-Fix-issue-with-ACTIVATE-hook-not-being-.patch \
     file://gpsd-default \
     file://gpsd \
     file://60-gpsd.rules \
-- 
2.4.3


