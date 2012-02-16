Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Rxqlw-000644-0Y
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Feb 2012 03:08:36 +0100
Received: by eekd41 with SMTP id d41so504566eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Feb 2012 18:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=Cxusk8UEGFBUnToLUh7OUn41b/bWf6/Fz5YrNuabxfY=;
	b=HoVb6UMJ5OhgH3prE1giEbZT9OUlQR3oPEbfYsagHdTqvf3iRBLX1XSZFE2GKEQ3Zw
	zPZ8K9cIgt4PVJjCokaes5jNdCYolzBOpi0WABn0s38rZJEl8qj4CKOyw0JVmoFU9nSQ
	dhWyMJ861S7cYW2tos79piYW1caAKWCqoMX7I=
Received: by 10.14.183.136 with SMTP id q8mr343633eem.60.1329357623805;
	Wed, 15 Feb 2012 18:00:23 -0800 (PST)
Received: from localhost.localdomain (p5B0A2E3F.dip.t-dialin.net.
	[91.10.46.63])
	by mx.google.com with ESMTPS id n58sm17552669een.10.2012.02.15.18.00.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 15 Feb 2012 18:00:23 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Feb 2012 03:02:58 +0100
Message-Id: <1329357796-27398-5-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1329357796-27398-1-git-send-email-schnitzeltony@googlemail.com>
References: <1329357796-27398-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe][v2] 04/22] systemd.bbclass: automatically create packages set in SYSTEMD_PACKAGES
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
X-List-Received-Date: Thu, 16 Feb 2012 02:08:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
Acked-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/classes/systemd.bbclass |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/meta-oe/classes/systemd.bbclass b/meta-oe/classes/systemd.bbclass
index 45f3e7f..0ea03ee 100644
--- a/meta-oe/classes/systemd.bbclass
+++ b/meta-oe/classes/systemd.bbclass
@@ -61,8 +61,17 @@ def systemd_after_parse(d):
 				if systemd_services == "":
 					raise bb.build.FuncFailed, "\n\n%s inherits systemd but doesn't set SYSTEMD_SERVICE / %s" % (bb_filename, service_pkg)
 
+	# prepend systemd-packages not already included
+	def systemd_create_package(pkg_systemd):
+		packages = d.getVar('PACKAGES', 1)
+		if not pkg_systemd in packages:
+			packages = "%s %s" % (pkg_systemd, packages)
+			d.setVar('PACKAGES', packages)
+
 
 	systemd_check_vars()
+	for pkg_systemd in d.getVar('SYSTEMD_PACKAGES', 1).split():
+		systemd_create_package(pkg_systemd)
 
 
 python __anonymous() {
-- 
1.7.4.4



