Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marc.reilly@gmail.com>) id 1PVFjP-0002Lc-4H
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Dec 2010 04:51:15 +0100
Received: by iwn8 with SMTP id 8so5027496iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Dec 2010 19:51:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:from:to:cc:subject
	:date:message-id:x-mailer:in-reply-to:references;
	bh=GRYvr8dXoRGyvmYrHEK1RzpTpYQPz+ORB2J+np7tEoc=;
	b=k65xdWmy//oFpfsQ0thGOdcnm4LMPV/Sev118RYvz1wsc97GBL+iryqZzh0DplZ9SV
	N9X8Yrk+C0XTVG6X4o6Yl5hRoyAOmxjS1Waw4nEvBda1asxAIOScG9LkaZ1RxzctLrq3
	fNNZappQp03w1fvfnjsxuGPVd8MaL09cd4Z5U=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=ViKRJDpEPai+26Brf4ENu8Q9vKOcW0q3cyblyaHFaBkMK+a5ruPc3pFQqgn6J6lDdW
	y2YK699edYeGdEM193H4aJMx/GIoUXhutxz6WYNzvC2uKRUp4svsUpes35z/cElQ7jxB
	S6Z5Zi6cE1uQs31t77VHHnGI/ur7al04PRmU4=
Received: by 10.231.35.131 with SMTP id p3mr6175979ibd.87.1292989868280;
	Tue, 21 Dec 2010 19:51:08 -0800 (PST)
Received: from localhost.localdomain (220-244-174-13.static.tpgi.com.au
	[220.244.174.13])
	by mx.google.com with ESMTPS id z4sm5132165ibg.7.2010.12.21.19.51.06
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 21 Dec 2010 19:51:07 -0800 (PST)
Sender: Marc Reilly <marc.reilly@gmail.com>
From: Marc Reilly <marc@cpdesign.com.au>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Dec 2010 13:50:54 +1100
Message-Id: <1292986254-24531-2-git-send-email-marc@cpdesign.com.au>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1292986254-24531-1-git-send-email-marc@cpdesign.com.au>
References: <1292986254-24531-1-git-send-email-marc@cpdesign.com.au>
Subject: [RFC] Add qextserialport recipe.
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
X-List-Received-Date: Wed, 22 Dec 2010 03:51:15 -0000

Signed-off-by: Marc Reilly <marc@cpdesign.com.au>
---
 recipes/qextserialport/qextserialport-e_hg.bb |    4 ++++
 recipes/qextserialport/qextserialport.inc     |   25 +++++++++++++++++++++++++
 recipes/qextserialport/qextserialport_hg.bb   |    4 ++++
 3 files changed, 33 insertions(+), 0 deletions(-)
 create mode 100644 recipes/qextserialport/qextserialport-e_hg.bb
 create mode 100644 recipes/qextserialport/qextserialport.inc
 create mode 100644 recipes/qextserialport/qextserialport_hg.bb

diff --git a/recipes/qextserialport/qextserialport-e_hg.bb b/recipes/qextserialport/qextserialport-e_hg.bb
new file mode 100644
index 0000000..f106ebd
--- /dev/null
+++ b/recipes/qextserialport/qextserialport-e_hg.bb
@@ -0,0 +1,4 @@
+inherit qt4e
+
+require qextserialport.inc
+
diff --git a/recipes/qextserialport/qextserialport.inc b/recipes/qextserialport/qextserialport.inc
new file mode 100644
index 0000000..1f3cd6b
--- /dev/null
+++ b/recipes/qextserialport/qextserialport.inc
@@ -0,0 +1,25 @@
+DESCRIPTION = "Serial Port Library for Qt"
+SECTION = "libs"
+PRIORITY = "optional"
+
+PV = "0.0+${PR}+hg${SRCREV}"
+PR = "r0"
+
+SRCREV = "default"
+SRC_URI = "hg://qextserialport.googlecode.com/hg;rev=${SRCREV};module=qextserialport;proto=https"
+
+S = "${WORKDIR}/qextserialport"
+
+do_stage() {
+	oe_libinstall -so -C src/build libqextserialport ${STAGING_LIBDIR}
+	cp -pPR src/*.h ${STAGING_INCDIR}
+}
+
+do_install() {
+	install -d ${D}${libdir} \
+		   ${D}${includedir}
+	oe_libinstall -so -C src/build libqextserialport ${D}${libdir}
+	cp -pPR src/*.h ${D}${includedir}
+}
+
+FILES_${PN} = "${libdir}"
diff --git a/recipes/qextserialport/qextserialport_hg.bb b/recipes/qextserialport/qextserialport_hg.bb
new file mode 100644
index 0000000..3464131
--- /dev/null
+++ b/recipes/qextserialport/qextserialport_hg.bb
@@ -0,0 +1,4 @@
+inherit qt4x11
+
+require qextserialport.inc
+
-- 
1.7.1



