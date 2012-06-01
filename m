Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SaFoI-0008OO-16
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Jun 2012 02:33:46 +0200
Received: by wgbdr1 with SMTP id dr1so1311369wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 May 2012 17:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=sLQ28KgHm/9ZDDOi8mDaKh1AHaEw4tPVKH5jkoyEGfg=;
	b=lx2WcO88jTbE9eEFtxeFTu2SbfSJUzMzwVCwp93pi54RO0gfUQlsRL5R76StO0g98T
	Q52XcDbdeKv6sh2aUGgj6ktf/uHTQ0F6/uUbRx5y0r3LhlW8Y+nk3defDxSWhIJKTu0Y
	raWF3bVSsYFh7uofjImmvXCCLQgYWhCFCUCZ0DB1KyWY1UuoxGiegDiYQaXzepQ++f9T
	D3BOBzuLq25MPftOLwg5o24hibhP456mwaHGp8X6ePB7gf0pmYS/zeZoqYkiyceNArNb
	TUaMDi7EmIo0/cjDjuywdhjivTEpB5D/IVK38YaVzX8AKxmv8YIZjgjOQktHmrTuD/d8
	WuAQ==
Received: by 10.216.196.221 with SMTP id r71mr539408wen.145.1338510205754;
	Thu, 31 May 2012 17:23:25 -0700 (PDT)
Received: from localhost.localdomain (p5B0A3C03.dip.t-dialin.net. [91.10.60.3])
	by mx.google.com with ESMTPS id gv4sm1139637wib.8.2012.05.31.17.23.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 May 2012 17:23:25 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Jun 2012 02:27:21 +0200
Message-Id: <1338510443-29579-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1338510443-29579-1-git-send-email-schnitzeltony@googlemail.com>
References: <1338510443-29579-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe,v2 2/4] systemd.bbclass: remove unused code
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
X-List-Received-Date: Fri, 01 Jun 2012 00:33:46 -0000
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
1.7.4.4



