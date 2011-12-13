Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RaPwr-00055q-N5
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 Dec 2011 11:51:04 +0100
Received: by mail-yx0-f175.google.com with SMTP id m12so4873551yen.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Dec 2011 02:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=Mal5dPTgu9b+E+LHHbYV/bk0YCtPg6MMNRiCSYsJz54=;
	b=wjbdDjuDATD3Q2iK0e3l+5Sr55Dp0ig4mmUtK2lDBn/Ganwo70Qcyi3WFzk6WTo9ki
	2KJNB47cbV9/huoQKluxeCsoqH5678nCp/yffot1aWPAnvDgEFJDYMNjw0SZdR9LYMjT
	28ZU5dqBigiOXJR3NkUU2j13gl/axGXlgFNC4=
Received: by 10.236.201.161 with SMTP id b21mr2574116yho.9.1323773048408;
	Tue, 13 Dec 2011 02:44:08 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id 37sm33437204anu.21.2011.12.13.02.44.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 13 Dec 2011 02:44:05 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 13 Dec 2011 10:43:45 +0000
Message-Id: <dd9bd4910b7278f024c9602b8d0cc162efc485fa.1323772987.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1323772986.git.otavio@ossystems.com.br>
References: <cover.1323772986.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1323772986.git.otavio@ossystems.com.br>
References: <cover.1323772986.git.otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 3/4] dropbear: bump epoch to ensure an upgrade path and cleanup packaging
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
X-List-Received-Date: Tue, 13 Dec 2011 10:51:05 -0000

An old package called dropbear-systemd, at version v1, might be
available on the feed and thus our binary package won't be used. To
fix this the epoch has been bumped to 1.

The symbolic link required to disable the sysvinit init script is now
done during the do_install task so making the recipe simple.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../dropbear/dropbear_2011.54.bbappend             |   11 +++--------
 1 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/meta-oe/recipes-core/dropbear/dropbear_2011.54.bbappend b/meta-oe/recipes-core/dropbear/dropbear_2011.54.bbappend
index 874a7d4..3f2fa29 100644
--- a/meta-oe/recipes-core/dropbear/dropbear_2011.54.bbappend
+++ b/meta-oe/recipes-core/dropbear/dropbear_2011.54.bbappend
@@ -1,5 +1,7 @@
 inherit systemd
 
+PE = "1"
+
 PRINC := "${@int(PRINC) + 1}"
 
 # look for files in the layer first
@@ -17,17 +19,10 @@ do_install_append() {
 	install -m 0644 ${WORKDIR}/dropbearkey.service ${D}${base_libdir}/systemd/system/
 	install -m 0644 ${WORKDIR}/dropbear@.service ${D}${base_libdir}/systemd/system/
 	install -m 0644 ${WORKDIR}/dropbear.socket ${D}${base_libdir}/systemd/system/
+	ln -sf /dev/null ${D}${base_libdir}/systemd/system/dropbear.service
 }
 
 PACKAGES += "${PN}-systemd"
 
 RDEPENDS_${PN}-systemd += "dropbear"
 FILES_${PN}-systemd = "${base_libdir}/systemd"
-
-pkg_postinst_${PN}-systemd_append() {
-ln -sf /dev/null $D${base_libdir}/systemd/system/dropbear.service
-}
-
-pkg_postrm_${PN}-systemd_append() {
-rm -f ${base_libdir}/systemd/system/dropbear.service
-}
-- 
1.7.2.5



