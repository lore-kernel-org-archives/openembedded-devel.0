Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1S17MH-0000QU-In
	for openembedded-devel@lists.openembedded.org;
	Sat, 25 Feb 2012 03:27:37 +0100
Received: by yenr5 with SMTP id r5so1436840yen.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Feb 2012 18:19:13 -0800 (PST)
Received-SPF: pass (google.com: domain of otavio.salvador@gmail.com designates
	10.236.155.225 as permitted sender) client-ip=10.236.155.225; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	otavio.salvador@gmail.com designates 10.236.155.225 as
	permitted sender) smtp.mail=otavio.salvador@gmail.com;
	dkim=pass header.i=otavio.salvador@gmail.com
Received: from mr.google.com ([10.236.155.225])
	by 10.236.155.225 with SMTP id j61mr9395916yhk.43.1330136353554
	(num_hops = 1); Fri, 24 Feb 2012 18:19:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=f7iLaumVftEVIG8kF35CFim8CgphXN/Q+4E2c1ysTQk=;
	b=qdUVt4mz0RiDpo3S/Q43gBrp34731Ib5wMIeWlquNpAvRzRT3SkFRs/zmwrq/jlmmc
	LaSGeleezZMn4HVMDFNz93zzURSsNgYbWry0wMSaWCXF8d4RSUqRU0kQjV6+mOfxnJNk
	pK+zH16cTe0axQfGigG5ykhzHoofLnUlsplvc=
Received: by 10.236.155.225 with SMTP id j61mr7088441yhk.43.1330136353513;
	Fri, 24 Feb 2012 18:19:13 -0800 (PST)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id p41sm17190025yhj.14.2012.02.24.18.19.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 24 Feb 2012 18:19:12 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 25 Feb 2012 02:19:03 +0000
Message-Id: <3e2e6ce2e38417181040a3c370708178a9ea8ee3.1330136267.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1330136267.git.otavio@ossystems.com.br>
References: <cover.1330136267.git.otavio@ossystems.com.br>
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
X-List-Received-Date: Sat, 25 Feb 2012 02:27:37 -0000

The parsing condition was broken causing the packages not being
expanded to include <PN>-systemd packages automatically.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/classes/systemd.bbclass |    9 ++++-----
 1 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta-oe/classes/systemd.bbclass b/meta-oe/classes/systemd.bbclass
index 0329b90..2c795fa 100644
--- a/meta-oe/classes/systemd.bbclass
+++ b/meta-oe/classes/systemd.bbclass
@@ -66,11 +66,10 @@ def systemd_after_parse(d):
 
 
 	bpn = d.getVar('BPN', 1)
-	# not for native / only at parse time
-	if d.getVar('BB_WORKERCONTEXT', True) is None and \
-	bpn + "-native" != d.getVar('PN', 1) and \
-	bpn + "-cross" != d.getVar('PN', 1) and \
-	bpn + "-nativesdk" != d.getVar('PN', 1):
+	if d.getVar('BB_WORKERCONTEXT', True) is not None and \
+		    bpn + "-native" != d.getVar('PN', 1) and \
+		    bpn + "-cross" != d.getVar('PN', 1) and \
+		    bpn + "-nativesdk" != d.getVar('PN', 1):
 		systemd_check_vars()
 		for pkg_systemd in d.getVar('SYSTEMD_PACKAGES', 1).split():
 			systemd_create_package(pkg_systemd)
-- 
1.7.2.5



