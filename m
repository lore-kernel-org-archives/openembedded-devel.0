Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1S4aCd-0001yf-Bv
	for openembedded-devel@lists.openembedded.org;
	Mon, 05 Mar 2012 16:51:59 +0100
Received: by bkcjg15 with SMTP id jg15so3484503bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Mar 2012 07:43:24 -0800 (PST)
Received-SPF: pass (google.com: domain of schnitzeltony@googlemail.com
	designates 10.204.136.198 as permitted sender)
	client-ip=10.204.136.198; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	schnitzeltony@googlemail.com designates 10.204.136.198 as
	permitted sender) smtp.mail=schnitzeltony@googlemail.com;
	dkim=pass header.i=schnitzeltony@googlemail.com
Received: from mr.google.com ([10.204.136.198])
	by 10.204.136.198 with SMTP id s6mr8420354bkt.129.1330962204776
	(num_hops = 1); Mon, 05 Mar 2012 07:43:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=W+8D+MUzJ1WB7GK2lMFqnYaSYY57h209G1nv0zcObKU=;
	b=MkzsvTrVcVHg+XUmNJd+P/xZdHnsBVssTxHHDD1N8oZn7tMxODKFm+btN9FxiE9907
	xRBpDkY+EP3E69dGjZgU38/Grjwe4gwkS7qoCWfFP3esTTcoq0BLSesPCpv4dQLS/Qew
	5DUmUDHE741yDrVMG0qNdYQWMdl3TkkqhAl6csXPQHi26yUoLxi0RTzyV3tY1VB83kck
	iTllxbckMQ5ViHApuukettt3BX/JIaakszhVfoG/ygxBHBBSNp22UDVWU2XJLk1g1CXt
	SC+0aHqcQVESWAJtoXnZlaXHJEUEoszxssL+pHU4cEN/Ak/9R7nkRpqHkB5od7vDltsT
	lhEw==
Received: by 10.204.136.198 with SMTP id s6mr6620216bkt.129.1330962204628;
	Mon, 05 Mar 2012 07:43:24 -0800 (PST)
Received: from localhost.localdomain (ip-95-223-250-190.unitymediagroup.de.
	[95.223.250.190]) by mx.google.com with ESMTPS id
	jr13sm21901631bkb.14.2012.03.05.07.43.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 05 Mar 2012 07:43:24 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  5 Mar 2012 16:43:22 +0100
Message-Id: <1330962204-2504-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.4
MIME-Version: 1.0
Subject: [meta-oe 1/3] gateone: remove unneeded systemd code
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
X-List-Received-Date: Mon, 05 Mar 2012 15:51:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-connectivity/gateone/gateone_git.bb    |    5 +----
 1 files changed, 1 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-connectivity/gateone/gateone_git.bb b/meta-oe/recipes-connectivity/gateone/gateone_git.bb
index aee88f3..6f13da8 100644
--- a/meta-oe/recipes-connectivity/gateone/gateone_git.bb
+++ b/meta-oe/recipes-connectivity/gateone/gateone_git.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "HTML5 (plugin-free) web-based terminal emulator and SSH client"
 LICENSE = "AGPLv3"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=07d5a2790569bd3e3b422b69ccd43bec"
 
-PR = "r16"
+PR = "r17"
 
 PV = "0.9"
 SRCREV = "a68444610efa2892842893dae828a28527e64a6e"
@@ -20,9 +20,6 @@ export prefix = "${localstatedir}/lib"
 do_install_append() {
 	install -d ${D}${localstatedir}/log/${BPN}
 
-	install -m 0755 -d ${D}${systemd_unitdir}/system
-	install -m 0644 ${WORKDIR}/gateone.service ${D}${systemd_unitdir}/system/
-
 	install -m 0755 -d ${D}${sysconfdir}/avahi/services/
 	install -m 0644 ${WORKDIR}/gateone-avahi.service ${D}${sysconfdir}/avahi/services/
 }
-- 
1.7.6.4



