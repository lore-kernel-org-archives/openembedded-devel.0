Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RNkcB-0003bf-ET
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Nov 2011 13:17:19 +0100
Received: by faat2 with SMTP id t2so429412faa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Nov 2011 04:11:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=qSCQrlT+OvZ5iCamFBqTC+OZ5NUSDgtAn14WVmaSBIk=;
	b=YHzObWaa1E1TVjmFJnmv2PHdWDrr4pU8vgINQvopJsEpotEGUhyJ2dvWkBvXSRCQ3e
	NSW8Jt62dR3ptxXiKNDTqzbZ9yqGUuKnFfw01mGP7LMS2WFP5JGwZiXuvSgO/ZWRjPvO
	QAVX/xavU/UKCmCEl3TQD8Y2+3Jn4DNNUv5dM=
Received: by 10.223.91.73 with SMTP id l9mr54372207fam.22.1320754265136;
	Tue, 08 Nov 2011 04:11:05 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id j5sm1927501faf.14.2011.11.08.04.10.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 08 Nov 2011 04:10:52 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Nov 2011 13:10:44 +0100
Message-Id: <1320754244-2752-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.rc1
Subject: [PATCH] connman: don't pull systemd to sysvinit images
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
X-List-Received-Date: Tue, 08 Nov 2011 12:17:19 -0000

* systemd.bbclass assumes PN as default package to attach systemd RDEPENDS
* grep SYSTEMDPN ../../classes/systemd.bbclass
  SYSTEMDPN ?= "${PN}"
  RDEPENDS_${SYSTEMDPN}_append = " systemd"
* but connman didn't set SYSTEMDPN so it was connman main package
  depending on systemd and pulling systemd to old sysvinit images :/
* IMHO systemd.bbclass should not append RDEPENDS without SYSTEMDPN set

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-connectivity/connman/connman.inc   |    1 +
 .../recipes-connectivity/connman/connman_0.77.bb   |    2 +-
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-connectivity/connman/connman.inc b/meta-oe/recipes-connectivity/connman/connman.inc
index 88b2e51..871e9ce 100644
--- a/meta-oe/recipes-connectivity/connman/connman.inc
+++ b/meta-oe/recipes-connectivity/connman/connman.inc
@@ -84,6 +84,7 @@ FILES_${PN} = "${bindir}/* ${sbindir}/* ${libexecdir}/* ${libdir}/lib*.so.* \
             ${libdir}/bonobo/servers \
             ${datadir}/dbus-1/system-services/*"
 
+SYSTEMDPN = "${PN}-systemd"
 PACKAGES =+ "${PN}-systemd"
 # Package up systemd files
 FILES_${PN}-systemd += "${base_libdir}/systemd"
diff --git a/meta-oe/recipes-connectivity/connman/connman_0.77.bb b/meta-oe/recipes-connectivity/connman/connman_0.77.bb
index 9c93e51..9ef368b 100644
--- a/meta-oe/recipes-connectivity/connman/connman_0.77.bb
+++ b/meta-oe/recipes-connectivity/connman/connman_0.77.bb
@@ -1,5 +1,5 @@
 require connman.inc
-PR = "r3"
+PR = "r4"
 
 EXTRA_OECONF += "\
   --disable-gtk-doc \
-- 
1.7.8.rc1



