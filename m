Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tworaz666@gmail.com>) id 1RuUPD-0001G1-QQ
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Feb 2012 20:39:15 +0100
Received: by eekd41 with SMTP id d41so1947620eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Feb 2012 11:31:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=OGjw6cschQLpEe/8i8t+nFzBbVqWUIppLijYZUwq1YY=;
	b=BdNqPCIRuJTPU/Hb9FXW/Etog7UtbgmTHz0qffo4rexPahKuMU3V0XQvdcm7Z4WMII
	5PnstF0Ja30ig0fyTkP9iXD2jD7LsGNpvn8vHyT9xowqdfgKRYZhLUsq12pdGIJuiOGp
	OmgoxslT0CjChuKT+qNWiwhtrRDFlrnKDE4n0=
Received: by 10.14.17.72 with SMTP id i48mr5970125eei.113.1328556674201;
	Mon, 06 Feb 2012 11:31:14 -0800 (PST)
Received: from localhost.localdomain (89-77-50-243.dynamic.chello.pl.
	[89.77.50.243])
	by mx.google.com with ESMTPS id v51sm788722eef.2.2012.02.06.11.31.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 06 Feb 2012 11:31:13 -0800 (PST)
From: Peter Tworek <tworaz666@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Feb 2012 20:28:59 +0100
Message-Id: <1328556539-8036-1-git-send-email-tworaz666@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <1328380249-11697-1-git-send-email-tworaz666@gmail.com>
References: <1328380249-11697-1-git-send-email-tworaz666@gmail.com>
Subject: [meta-xfce][PATCH 3/3 v2] xfce4-panel: Remove static version of panel plugins.
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
X-List-Received-Date: Mon, 06 Feb 2012 19:39:15 -0000

They have no actual use and trigger QA warnings.

Signed-off-by: Peter Tworek <tworaz666@gmail.com>
---
 .../recipes-xfce/xfce4-panel/xfce4-panel_4.8.6.bb  |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.8.6.bb b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.8.6.bb
index 0cd8eba..6bbbc05 100644
--- a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.8.6.bb
+++ b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.8.6.bb
@@ -19,6 +19,10 @@ python populate_packages_prepend() {
 	                                     '${bindir}/*%s*'])
 }
 
+do_install_append () {
+    find "${D}/${libdir}/xfce4/panel/plugins" -name '*.a' -exec rm -f {} +
+}
+
 PACKAGES_DYNAMIC = "${PN}-plugin-*"
 
 FILES_${PN} += "${libdir}/xfce4/panel/migrate \
@@ -27,8 +31,5 @@ FILES_${PN} += "${libdir}/xfce4/panel/migrate \
 FILES_${PN}-dbg += "${libdir}/xfce4/panel/plugins/.debug \
 		   "
 
-FILES_${PN}-dev += "${libdir}/xfce4/panel/plugins/*.*a \
-                   "
-
 SRC_URI[md5sum] = "9d7bf0503d5867c4044cef04bb5845b1"
 SRC_URI[sha256sum] = "66f1266a1242ee5ecada995a4a584dd9802aa24456759b40b0c29227c39bed03"
-- 
1.7.3.4



