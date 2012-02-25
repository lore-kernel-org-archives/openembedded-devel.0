Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1S17YG-0000bl-Mu
	for openembedded-devel@lists.openembedded.org;
	Sat, 25 Feb 2012 03:40:00 +0100
Received: by yenr5 with SMTP id r5so1438471yen.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Feb 2012 18:31:37 -0800 (PST)
Received-SPF: pass (google.com: domain of otavio.salvador@gmail.com designates
	10.236.181.193 as permitted sender) client-ip=10.236.181.193; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	otavio.salvador@gmail.com designates 10.236.181.193 as
	permitted sender) smtp.mail=otavio.salvador@gmail.com;
	dkim=pass header.i=otavio.salvador@gmail.com
Received: from mr.google.com ([10.236.181.193])
	by 10.236.181.193 with SMTP id l41mr9288556yhm.38.1330137097221
	(num_hops = 1); Fri, 24 Feb 2012 18:31:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=zShglb+M76L0ia+LS8rzHsmAKFbX+AAcSoumYKpUmII=;
	b=PLwH3VlxaW1mHe42YWHQ8RX9RhiCO3WudmieUg37ieiq+Tuw7/YcbKYJD87Xx79Zw5
	2NTs03HkxA5+M24/2kBvrMImv7ktUxA4/Q7995E/0csafxyQBLwc2v3NIwx7D7wX8rhq
	PXoqGVyyZtP6/rqLdcB9tdd7QlA3tjrutEnuY=
Received: by 10.236.181.193 with SMTP id l41mr7027487yhm.38.1330137097174;
	Fri, 24 Feb 2012 18:31:37 -0800 (PST)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id g12sm11081613ana.2.2012.02.24.18.31.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 24 Feb 2012 18:31:36 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 25 Feb 2012 02:31:28 +0000
Message-Id: <a636b703aa1c86d0a873d14c23915f96234e44c4.1330137031.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1330137031.git.otavio@ossystems.com.br>
References: <cover.1330137031.git.otavio@ossystems.com.br>
Subject: [PATCH][meta-oe 1/1] systemd.bbclass: fix regression caused by c9f5703aded
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
X-List-Received-Date: Sat, 25 Feb 2012 02:40:00 -0000

The parsing condition was broken causing the packages not being
expanded to include <PN>-systemd packages automatically.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/classes/systemd.bbclass |   11 ++++++-----
 1 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta-oe/classes/systemd.bbclass b/meta-oe/classes/systemd.bbclass
index 0329b90..a8c77c8 100644
--- a/meta-oe/classes/systemd.bbclass
+++ b/meta-oe/classes/systemd.bbclass
@@ -28,6 +28,9 @@ systemctl disable ${SYSTEMD_SERVICE}
 
 def systemd_after_parse(d):
 	def systemd_check_vars():
+		if d.getVar('BB_WORKERCONTEXT', True) is not None:
+			return
+
 		bb_filename = d.getVar('FILE')
 		packages = d.getVar('PACKAGES', 1)
 
@@ -66,11 +69,9 @@ def systemd_after_parse(d):
 
 
 	bpn = d.getVar('BPN', 1)
-	# not for native / only at parse time
-	if d.getVar('BB_WORKERCONTEXT', True) is None and \
-	bpn + "-native" != d.getVar('PN', 1) and \
-	bpn + "-cross" != d.getVar('PN', 1) and \
-	bpn + "-nativesdk" != d.getVar('PN', 1):
+	if bpn + "-native" != d.getVar('PN', 1) and \
+		    bpn + "-cross" != d.getVar('PN', 1) and \
+		    bpn + "-nativesdk" != d.getVar('PN', 1):
 		systemd_check_vars()
 		for pkg_systemd in d.getVar('SYSTEMD_PACKAGES', 1).split():
 			systemd_create_package(pkg_systemd)
-- 
1.7.2.5



