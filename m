Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <lukasmaerdian@googlemail.com>) id 1Ok5Yz-0007WO-5H
	for openembedded-devel@lists.openembedded.org;
	Sat, 14 Aug 2010 03:29:34 +0200
Received: by bwz12 with SMTP id 12so645551bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Aug 2010 18:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=nWWyYldE0C5+vvPZ1LyqTS++5PQ8lTs4aYhb4rW1q7c=;
	b=DhIW0UqHkUTcVswh50JmpIBZePZ92G15dU8/DOmkl2QQPuqgDZndgOsRCGQ8MkGdBM
	NRw/Qa84c7jIH8NW8cAmJnMK4ypBIxaNhSR7AXQ47aetNXcEsdFV8Z7W+4lUZYzZ9Scf
	eRVIk9AeVrRWzf81h33lB41rL7i/UQGEN3z78=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=googlemail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	b=oj+Inbf4QG92DHQAkveTLYKZ35RLXnoC1UjrYYXm5UgTYrAfJlEyL+tyeflky6Xa/P
	RQENUkV0yisITSJJe2YtnPaMfIQvhOPGuXA6SVNeOb5m7otWB9pUYDNL4wxG9heRWKR+
	302SBAfq5pYlBlSWIM/c1hnLPf4l0ahPSDwMY=
Received: by 10.204.82.155 with SMTP id b27mr1223264bkl.182.1281749353967;
	Fri, 13 Aug 2010 18:29:13 -0700 (PDT)
Received: from localhost.localdomain (p4FDB1210.dip0.t-ipconnect.de
	[79.219.18.16])
	by mx.google.com with ESMTPS id x13sm2127120bki.12.2010.08.13.18.29.12
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 13 Aug 2010 18:29:12 -0700 (PDT)
From: "=?UTF-8?q?Lukas=20M=C3=A4rdian?=" <lukasmaerdian@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 14 Aug 2010 03:28:44 +0200
Message-Id: <1281749324-22589-1-git-send-email-lukasmaerdian@gmail.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: lukasmaerdian@googlemail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: =?UTF-8?q?Lukas=20M=C3=A4rdian?= <lukasmaerdian@gmail.com>
Subject: [PATCH] bump libphone-ui and libphone-ui-shr as to the 0.0.1 release and bump SRCREV to the 0.0.1 commit
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
X-List-Received-Date: Sat, 14 Aug 2010 01:29:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Lukas Märdian <lukasmaerdian@gmail.com>
---
 recipes/shr/libphone-ui-shr_git.bb |    6 +++---
 recipes/shr/libphone-ui_git.bb     |    4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/recipes/shr/libphone-ui-shr_git.bb b/recipes/shr/libphone-ui-shr_git.bb
index 098eeb7..c352bfa 100644
--- a/recipes/shr/libphone-ui-shr_git.bb
+++ b/recipes/shr/libphone-ui-shr_git.bb
@@ -1,9 +1,9 @@
 DESCRIPTION = "SHR default module for the Phone UI daemon"
 SECTION = "e/apps"
 DEPENDS += " dbus-glib libframeworkd-glib libfsoframework libphone-ui evas ecore edje edje-native elementary"
-SRCREV = "01c15bc1e68ba416dbdc8d85d0df3ecf4cd74608"
-PV = "0.0.0+gitr${SRCPV}"
-PR = "r9"
+SRCREV = "be5a4b0f48ce5df67bdf01f88979c93c7d9a59d3"
+PV = "0.0.1+gitr${SRCPV}"
+PR = "r0"
 
 SRC_URI = "git://shr.bearstech.com/repo/libphone-ui-shr.git;protocol=http;branch=master"
 S = "${WORKDIR}/git"
diff --git a/recipes/shr/libphone-ui_git.bb b/recipes/shr/libphone-ui_git.bb
index a4d7638..f874aac 100644
--- a/recipes/shr/libphone-ui_git.bb
+++ b/recipes/shr/libphone-ui_git.bb
@@ -2,8 +2,8 @@ DESCRIPTION = "A generic framework for phone ui"
 HOMEPAGE = "http://shr-project.org/"
 LICENSE = "GPL"
 SECTION = "libs"
-SRCREV = "cac36ceb360c457b8dce993f6363cf8688ab428a"
-PV = "0.0.0+gitr${SRCPV}"
+SRCREV = "e031bdc36168da3c821c36fe470eb920c41ea92b"
+PV = "0.0.1+gitr${SRCPV}"
 PR = "r0"
 
 DEPENDS="glib-2.0 dbus-glib libframeworkd-glib libfso-glib libfsoframework libphone-utils alsa-lib"
-- 
1.7.0.4



