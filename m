Received: from mail-wg0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1T9aNR-0002cj-V0
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 Sep 2012 13:36:06 +0200
Received: by wgbds1 with SMTP id ds1so4359999wgb.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Sep 2012 04:23:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=IwCC5ZBZepcoGsXTDR7RxManz9AQ5jln6SYlN9KNzOI=;
	b=kAneH0EO4fDLcs27Zdi3fQE/D1lUtFEV7iOhSPr/kgtdzaLu5SuKmHT0UCbT0Kjzx0
	lRcUPpr9L2JN1GQS7qSUuZ0Kiz1a+nDGhV/eWmjwfvSmG52M5I0I3/POfT0OjeZxUInQ
	H6Xh4AMOy7nfTEeGv7ZF2IaTXacX3uB39WxAfOOFBu3lZnIf7qkA4afISf1ADHRAVqMt
	Z0Ayt6oT01g9yPANFqd1GQ3+Xgzw335gM64Cbmxxtjgm+lpsnjPWa5r/maZDJsyd/U+y
	D/l7UkCVuA2jvWDzVeugPSv36Qrpg4yKpKcP6QBl3SHup5q4dk+QSvwbKmtlPCr2sMJ5
	bjkw==
Received: by 10.216.93.6 with SMTP id k6mr1157567wef.86.1346930621571;
	Thu, 06 Sep 2012 04:23:41 -0700 (PDT)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id hv8sm3682950wib.0.2012.09.06.04.23.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 06 Sep 2012 04:23:40 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  6 Sep 2012 13:23:28 +0200
Message-Id: <1346930610-2977-6-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1346930610-2977-1-git-send-email-koen@dominion.thruhere.net>
References: <1346930610-2977-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQnH/POM91OqucEYOULz5CSqLnaJuTFEKR0GEwhNDkx7qnrUaDJsn22/O2/r5Npi8WsbcEbk
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	=?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
Subject: [meta-oe][for-denzil][PATCH 6/8] kernel.bbclass: replace os.system with subprocess.call
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
X-List-Received-Date: Thu, 06 Sep 2012 11:36:06 -0000

From: Robert Yang <liezhi.yang@windriver.com>

Replace os.system with subprocess.call since the older function would
fail (more or less) silently if the executed program cannot be found

More info:
http://docs.python.org/library/subprocess.html#subprocess-replacements

[YOCTO #2454]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/classes/kernel.bbclass |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/classes/kernel.bbclass b/meta-oe/classes/kernel.bbclass
index f68d8a9..d5b3914 100644
--- a/meta-oe/classes/kernel.bbclass
+++ b/meta-oe/classes/kernel.bbclass
@@ -315,12 +315,12 @@ module_conf_rfcomm = "alias bt-proto-3 rfcomm"
 
 python populate_packages_prepend () {
 	def extract_modinfo(file):
-		import tempfile, re
+		import tempfile, re, subprocess
 		tempfile.tempdir = d.getVar("WORKDIR", True)
 		tf = tempfile.mkstemp()
 		tmpfile = tf[1]
 		cmd = "PATH=\"%s\" %sobjcopy -j .modinfo -O binary %s %s" % (d.getVar("PATH", True), d.getVar("HOST_PREFIX", True) or "", file, tmpfile)
-		os.system(cmd)
+		subprocess.call(cmd, shell=True)
 		f = open(tmpfile)
 		l = f.read().split("\000")
 		f.close()
-- 
1.7.7.6



