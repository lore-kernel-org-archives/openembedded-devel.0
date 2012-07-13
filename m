Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Spdx4-0005Zn-27
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Jul 2012 13:22:26 +0200
Received: by mail-bk0-f47.google.com with SMTP id ik5so2314647bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jul 2012 04:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=c0v1obPZw09nPm9c2BZjO28+hjitbtXJd1TrQTwiMhI=;
	b=qTc45GCK2mWfx0qoa5me+BBYdSYRFTNCq7JrruAG++zwoor0eTAqhAB5ZGVRlcZOg8
	j0B6pCZKZ0p8Q6mehsy+GB04KBnOb7NyHB+DPYChEXOw1v4nsS9TTIHYTD8E2fTAKD8i
	yU7zC5nUdThZwrA48ohBT4CRAYrgdkDNlTCvIx41NbiTeCsagt0Q2JRLyTviBCPcmF7L
	lI7PhtAM73iOz1G3G0PVn7ISjV+Pv/kM+Q5eOzdezXHTAZv0jFK2hCA/MK9pMx3wpgKU
	3UpnAgM/zbo9SFeAj2a8VvVUHHYj6RALPlEbiJNfdmSFmvDsWP6jVsDaiNwMiB3UjyNc
	sN2g==
Received: by 10.204.128.202 with SMTP id l10mr509950bks.127.1342177874100;
	Fri, 13 Jul 2012 04:11:14 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-160-112.unitymediagroup.de.
	[95.222.160.112])
	by mx.google.com with ESMTPS id g6sm4544247bkg.2.2012.07.13.04.11.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 Jul 2012 04:11:13 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Jul 2012 13:10:46 +0200
Message-Id: <1342177846-26594-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1342177846-26594-1-git-send-email-schnitzeltony@googlemail.com>
References: <1342177846-26594-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-system 2/2] udisks: do not start daemon automatically at boot time
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
X-List-Received-Date: Fri, 13 Jul 2012 11:22:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-support/udisks/udisks_1.0.4.bbappend   |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta-systemd/meta-oe/recipes-support/udisks/udisks_1.0.4.bbappend b/meta-systemd/meta-oe/recipes-support/udisks/udisks_1.0.4.bbappend
index f6470c9..9d0f18c 100644
--- a/meta-systemd/meta-oe/recipes-support/udisks/udisks_1.0.4.bbappend
+++ b/meta-systemd/meta-oe/recipes-support/udisks/udisks_1.0.4.bbappend
@@ -1,6 +1,6 @@
 inherit systemd
 
-PRINC := "${@int(PRINC) + 1}"
+PRINC := "${@int(PRINC) + 2}"
 
 # look for files in the layer first
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
@@ -11,3 +11,4 @@ SRC_URI += "file://add-systemd-support.patch"
 
 SYSTEMD_PACKAGES = "${PN}-systemd"
 SYSTEMD_SERVICE_${PN}-systemd = "udisks-daemon.service"
+SYSTEMD_AUTO_ENABLE = "disable"
-- 
1.7.6.5



