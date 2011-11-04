Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RMNcz-0007oA-Dr
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Nov 2011 18:32:29 +0100
Received: by ggnj1 with SMTP id j1so2600827ggn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Nov 2011 10:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=Dz5pI/duirkiAPz4HfTnHGQwbNgjpmZZ4jR8wxv04Uc=;
	b=kMKNKM4DOZDdLvQt8Px43Av8R8oPxlCg6IFJsLorboxiuvUQJMJ4XUOfngx+TbAvRf
	sGZQ0xyHz7snAJeXisGbEolGzeb7eLwN5ueoJBcH8hJCndgYUYATUqa3VmkyWPHzuCDJ
	t5Lu/nOiNSL6nY8Dr/jALCLm+N7KDBhcJywsQ=
Received: by 10.236.192.230 with SMTP id i66mr19792898yhn.82.1320427578962;
	Fri, 04 Nov 2011 10:26:18 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id y58sm6548572yhi.17.2011.11.04.10.26.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 04 Nov 2011 10:26:18 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  4 Nov 2011 17:26:00 +0000
Message-Id: <aed5eb8163af7253804d6e82d3b9aadffa67bf1e.1320427498.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1320427498.git.otavio@ossystems.com.br>
References: <cover.1320427498.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1320427498.git.otavio@ossystems.com.br>
References: <cover.1320427498.git.otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 3/3] connman: refactor systemd packaging
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
X-List-Received-Date: Fri, 04 Nov 2011 17:32:29 -0000

This changes the recipe to use systemd.bbclass to avoid duplicating
code and also fix the rdepends of connman-systemd on connman.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-connectivity/connman/connman.inc   |   24 ++++---------------
 .../recipes-connectivity/connman/connman_0.77.bb   |    2 +-
 2 files changed, 6 insertions(+), 20 deletions(-)

diff --git a/meta-oe/recipes-connectivity/connman/connman.inc b/meta-oe/recipes-connectivity/connman/connman.inc
index 8209502..88b2e51 100644
--- a/meta-oe/recipes-connectivity/connman/connman.inc
+++ b/meta-oe/recipes-connectivity/connman/connman.inc
@@ -31,9 +31,12 @@ EXTRA_OECONF += "\
 INITSCRIPT_NAME = "connman"
 INITSCRIPT_PARAMS = "start 05 5 2 . stop 22 0 1 6 ."
 
+SYSTEMD_PACKAGES = "${PN}-systemd"
+SYSTEMD_SERVICE_${PN}-systemd = "connman.service"
+
 PARALLEL_MAKE = ""
 
-inherit autotools pkgconfig update-rc.d
+inherit autotools pkgconfig update-rc.d systemd
 
 do_configure_append() {
 	ln -sf . include/connman
@@ -84,24 +87,7 @@ FILES_${PN} = "${bindir}/* ${sbindir}/* ${libexecdir}/* ${libdir}/lib*.so.* \
 PACKAGES =+ "${PN}-systemd"
 # Package up systemd files
 FILES_${PN}-systemd += "${base_libdir}/systemd"
-
-pkg_postinst_connman-systemd() {
-	# can't do this offline
-	if [ "x$D" != "x" ]; then
-		exit 1
-	fi
-	
-	systemctl enable connman.service
-}
-
-pkg_postrm_connman-systemd() {
-	# can't do this offline
-	if [ "x$D" != "x" ]; then
-		exit 1
-	fi
-
-	systemctl disable connman.service
-}
+RDEPENDS_${PN}-systemd += "${PN}"
 
 # Needed when using DNS proxy feature
 RRECOMMENDS_${PN} += "dnsmasq-dbus"
diff --git a/meta-oe/recipes-connectivity/connman/connman_0.77.bb b/meta-oe/recipes-connectivity/connman/connman_0.77.bb
index 6d9c87c..9c93e51 100644
--- a/meta-oe/recipes-connectivity/connman/connman_0.77.bb
+++ b/meta-oe/recipes-connectivity/connman/connman_0.77.bb
@@ -1,5 +1,5 @@
 require connman.inc
-PR = "r2"
+PR = "r3"
 
 EXTRA_OECONF += "\
   --disable-gtk-doc \
-- 
1.7.2.5



