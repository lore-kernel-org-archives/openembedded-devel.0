Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id D31FF7169F
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 May 2015 03:18:26 +0000 (UTC)
Received: by pacwv17 with SMTP id wv17so178609142pac.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 May 2015 20:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=vJoEjmQ3nlzGc7KAS/dQx9xfos5ETGjgMbux1S1jtus=;
	b=nT3ZuGkh3CNBFy2/UpbGV9aXc38rHuX74JJcCwM9AKMK2DCjhYetdmWGZjFN6tQyCx
	mYVCuQVhAsvrQ7Ce8XcJyihaxxRcDch1c9Wt16NsIOqPfjgQy5ZM7mXrcqUl3W2QcMMC
	FHi+Mv24xWyIxQ94BkzH4agJbydE0aQ1IRCEWy6kV0snf+KAkEVqEvlmViukcZoTH5m0
	6M70xQQ2csy2y70aGfDOHiKc1hQtd9AGhdAdfc4rgoIt7+g1xSTNOmTNkeJOAAT8Vtnz
	XTtGeo49dYIS8y1dXBgX/NDs/nJKItpyBKHY97EtgE8Jkp5Rdt4ANF7TXweqHPbS9yg9
	TPGw==
X-Received: by 10.70.131.132 with SMTP id om4mr47298814pdb.30.1430795907681;
	Mon, 04 May 2015 20:18:27 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by mx.google.com with ESMTPSA id
	pm1sm14200619pdb.89.2015.05.04.20.18.25
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 04 May 2015 20:18:26 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	joe_macdonald@mentor.com
Date: Mon,  4 May 2015 20:18:20 -0700
Message-Id: <1430795900-25986-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [meta-networking][PATCH] networkingmanager: QA warning for rdepends on polkit
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
X-List-Received-Date: Tue, 05 May 2015 03:18:27 -0000

WARNING: QA Issue: networkmanager rdepends on polkit, but it isn't a build dependency? [build-deps]

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-connectivity/networkmanager/networkmanager_0.9.8.10.bb     | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_0.9.8.10.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_0.9.8.10.bb
index 8d37c98..36a4a7e 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_0.9.8.10.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_0.9.8.10.bb
@@ -37,11 +37,12 @@ PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES','systemd','systemd','conso
 PACKAGECONFIG[systemd] = " \
     --with-systemdsystemunitdir=${systemd_unitdir}/system --with-session-tracking=systemd --enable-polkit, \
     --without-systemdsystemunitdir, \
-    polkit \
+    polkit, polkit \
 "
 # consolekit is not picked by shlibs, so add it to RDEPENDS too
 PACKAGECONFIG[consolekit] = "--with-session-tracking=consolekit,,consolekit,consolekit"
 PACKAGECONFIG[concheck] = "--enable-concheck,--disable-concheck,libsoup-2.4"
+PACKAGECONFIG[polkit] = "--enable-polkit, --disable-polkit, , polkit"
 
 # Work around dbus permission problems since we lack a proper at_console
 do_install_prepend() {
-- 
2.3.5


