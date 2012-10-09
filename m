Received: from mail-ia0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TLTkr-0004fv-4e
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Oct 2012 08:57:25 +0200
Received: by mail-ia0-f175.google.com with SMTP id b35so602895iac.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Oct 2012 23:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=lF5bmi2hwPr+M5STPPyz2lHUDIo0mytN9xrzUZ//CjU=;
	b=1CgrPORvnc4LMH5wVA14vqFpeRTHj2o8orFI9PIA6qxU3Mmjmb9asfnIDQwby05jb/
	IujZvDZm1vP9XUweMuKtolqk+FdWXhCrSldqrxbyFe6f/ZLcB/bcPQV2k2CAV44fZJiA
	9b2drNq/aOisj+BkYFJkAw2T4iLr7LzQqelFZuHKIG2mFYKi9o/N9gUziPaQXfKkQBRf
	AFMHH8HaGEE8czZ1V/Bpsi8i1tYnHMdcCZX3RCpfDsDl3vG7ljqvfYZJxhs+clTjf6yJ
	Mr2Xq13phCm45PT3vNtoclWw7M16eaz0Qhx6Zf2BaxJInmUhqF4qU3OAbBduhe6J+Yzw
	EwfQ==
Received: by 10.50.187.134 with SMTP id fs6mr656095igc.61.1349765057460;
	Mon, 08 Oct 2012 23:44:17 -0700 (PDT)
Received: from leo.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id mi10sm9334844igc.16.2012.10.08.23.44.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 08 Oct 2012 23:44:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  8 Oct 2012 23:44:06 -0700
Message-Id: <1349765046-7315-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [meta-systemd][PATCH] systemd.bbclass: Dont check for multilib and change for nativesdk renaming
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
X-List-Received-Date: Tue, 09 Oct 2012 06:57:25 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-systemd/classes/systemd.bbclass |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-systemd/classes/systemd.bbclass b/meta-systemd/classes/systemd.bbclass
index 96d7f8f..d1f7236 100644
--- a/meta-systemd/classes/systemd.bbclass
+++ b/meta-systemd/classes/systemd.bbclass
@@ -68,9 +68,11 @@ def systemd_after_parse(d):
 
 
     bpn = d.getVar('BPN', 1)
+    ml = d.getVar('MLPREFIX', 1)
     if bpn + "-native" != d.getVar('PN', 1) and \
             bpn + "-cross" != d.getVar('PN', 1) and \
-            bpn + "-nativesdk" != d.getVar('PN', 1):
+            ml + bpn != d.getVar('PN', 1) and \
+            "nativesdk-" + bpn != d.getVar('PN', 1):
         systemd_check_vars()
         for pkg_systemd in d.getVar('SYSTEMD_PACKAGES', 1).split():
             systemd_create_package(pkg_systemd)
-- 
1.7.9.5



