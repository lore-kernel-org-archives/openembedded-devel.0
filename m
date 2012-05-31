Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Sa3G0-0000sk-E0
	for openembedded-devel@lists.openembedded.org;
	Thu, 31 May 2012 13:09:32 +0200
Received: by mail-bk0-f47.google.com with SMTP id jm2so710494bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 May 2012 03:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=4NiLnCO7DO+oa4KSymQhAynLUyCGS+xl8w+v4WLp8r4=;
	b=M2HwAZwgf1rcnxikqGF+0TnN8TmIb0Poqiyhc69+/9tVoA/QpuPh3s7hPPnduNRl6V
	J7puibfkYsaTvuBZ18LE5rxQDrbmIBFRX4hrk1OeLUqEgyc/T8ePjhuwsGkKcXqe5+l2
	3UICcUhWKkMHjv+MgjDvSqyPLqgNEItFYMaPI42NmQUEjvj+bXMGMhWe6jfPR6mmjXJ6
	8LuOGo9XIO9HgLX1mTqHKByfXnWhXgx/1HumpS0jbkFl9XLZzF2sRKqMpwqXk/hAh7KO
	+W2P3kcYYJbf01/yoH0bVRin9M8On5JSygdJh41HgisKYyEOolOipiQCn0e8MgUD7T1X
	sagw==
Received: by 10.204.156.137 with SMTP id x9mr11250211bkw.135.1338461955037;
	Thu, 31 May 2012 03:59:15 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-83.unitymediagroup.de.
	[95.222.156.83])
	by mx.google.com with ESMTPS id ig1sm2794600bkc.4.2012.05.31.03.59.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 May 2012 03:59:14 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 31 May 2012 12:58:58 +0200
Message-Id: <1338461940-3040-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1338461940-3040-1-git-send-email-schnitzeltony@googlemail.com>
References: <1338461940-3040-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe 2/4] systemd.bbclass: remove unused code
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
X-List-Received-Date: Thu, 31 May 2012 11:09:32 -0000
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



