Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SaOCB-0004TU-Pa
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Jun 2012 11:30:59 +0200
Received: by bkcjm2 with SMTP id jm2so1691610bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Jun 2012 02:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=4NiLnCO7DO+oa4KSymQhAynLUyCGS+xl8w+v4WLp8r4=;
	b=bLojy6uKMe4g5Vo/X+NtGReTWux9GPXoaHvZuHMVc73wGnSuKV//ZFH03RiHOcxit9
	onkz1hoT6tpEU0VZ8uBQQiNAPxaFro6Sq1PZOPFNJl5yay0N37LL/zJ6fTr9xtGyY3bf
	Zkiao9NRtSmkf1w9ZQzqjVQRl0boVMNX3Bk6UXg9IL+HPwQ8nxmZNneuCzCTJQWzI9nJ
	wrYy7WmrvjQabh2nS6d5F9WCwU5qG6D6CEQJ7RNhTEJN6DOGXVYd5nrbeUB4GFZo27Ho
	hweymkzJ1fc3UKiYy/wR0nMEDj9VcJ4emE85cFEX8rgILS7aZoyopK7cOWDOBIUQGgjJ
	oEeQ==
Received: by 10.204.129.87 with SMTP id n23mr1016125bks.19.1338542439136;
	Fri, 01 Jun 2012 02:20:39 -0700 (PDT)
Received: from localhost.localdomain (ip-178-202-232-153.unitymediagroup.de.
	[178.202.232.153])
	by mx.google.com with ESMTPS id e20sm1241351bkw.3.2012.06.01.02.20.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 01 Jun 2012 02:20:38 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Jun 2012 11:20:24 +0200
Message-Id: <1338542426-29985-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1338542426-29985-1-git-send-email-schnitzeltony@googlemail.com>
References: <1338542426-29985-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe,v3 2/4] systemd.bbclass: remove unused code
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
X-List-Received-Date: Fri, 01 Jun 2012 09:30:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/classes/systemd.bbclass |    5 -----
 1 files changed, 0 insertions(+), 5 deletions(-)

diff --git a/meta-oe/classes/systemd.bbclass b/meta-oe/classes/systemd.bbclass
index db35717..2881abf 100644
--- a/meta-oe/classes/systemd.bbclass
+++ b/meta-oe/classes/systemd.bbclass
@@ -54,11 +54,6 @@ def systemd_after_parse(d):
 						"\n\n%s: %s in SYSTEMD_PACKAGES does not match <existing-package>-systemd or ${PN} (deprecated)" % \
 						( bb_filename, pkg_systemd)
 
-		# check SYSTEMD_SERVICE
-		for pkg_systemd in systemd_pkgs.split():
-			service_pkg = 'SYSTEMD_SERVICE' + "_" + pkg_systemd
-			systemd_services = d.getVar(service_pkg, 1) or d.getVar('SYSTEMD_SERVICE', 1) or ""
-
 	# prepend systemd-packages not already included
 	def systemd_create_package(pkg_systemd):
 		packages = d.getVar('PACKAGES', 1)
-- 
1.7.6.5



