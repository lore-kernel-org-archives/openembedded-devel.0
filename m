Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OWHeu-0006Qq-Ss
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Jul 2010 01:34:37 +0200
Received: by pxi12 with SMTP id 12so3196403pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Jul 2010 16:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=5Mkm1tiILwiHp1OB2ATypiRE8Qwv8pVkxOicjR3l4ps=;
	b=k+3pAH1ZkoXfnS75kavZof9y5Cb8KNvhLupsmxf7u00kersXLG1Q3P7GwvcWfTTZlt
	iNyxFlMoN9IPy9hXolUsShh/rivoO0Vi/FUYTmIsNnBGM4x91yq010HaCvUU/NpHd7xk
	o31YXWkMhTCxU24CcDmD8jS55Xmd/sVyLnDVE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=tb9oIJDlWPzdzPzzkKotBq7+p4IOeqcStMQBUgm5dS12C1H8risQgI9mVAuhdL0olO
	JivwYOienXMeKb0WGV5uy74DfcfHvZ1n/UY9ePsMHjKAq77uN7mtuldVvgg6TO2lW2KX
	BAT6mo7vZQuOHuFC6tueQtpKQbgKeNKoP0A4Y=
Received: by 10.142.166.6 with SMTP id o6mr6860523wfe.75.1278458985562;
	Tue, 06 Jul 2010 16:29:45 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id f20sm6420910rvb.8.2010.07.06.16.29.44
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 06 Jul 2010 16:29:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 Jul 2010 16:29:42 -0700
Message-Id: <1278458982-3362-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH][v2] base.bbclass: re-add backward compatibility with bitbake w.r.t decodeurl fix in bitbake
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
X-List-Received-Date: Tue, 06 Jul 2010 23:34:37 -0000

This patch seems to work with both bitbakes


Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 classes/base.bbclass |   15 +++++++++++++--
 1 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/classes/base.bbclass b/classes/base.bbclass
index 2da0b7a..b30310d 100644
--- a/classes/base.bbclass
+++ b/classes/base.bbclass
@@ -219,14 +219,25 @@ def oe_unpack_file(file, data, url = None):
 			# The "destdir" handling was specifically done for FILESPATH
 			# items.  So, only do so for file:// entries.
 			if type == "file":
-				dest = os.path.dirname(path) or "."
+				if not host:
+					dest = os.path.dirname(path) or "."
+				else:
+				# this case is for backward compatiblity with older version
+				# of bitbake which do not have the fix
+				# http://cgit.openembedded.org/cgit.cgi/bitbake/commit/?id=ca257adc587bb0937ea76d8b32b654fdbf4192b8
+				# this should not be needed once all releases of bitbake has this fix
+				# applied/backported
+					dest = host + os.path.dirname(path) or "."
 			else:
 				dest = "."
 			bb.mkdirhier("%s" % os.path.join(os.getcwd(),dest))
 			cmd = 'cp %s %s' % (file, os.path.join(os.getcwd(), dest))
 	if not cmd:
 		return True
-	dest = os.path.join(os.getcwd(), path)
+	if not host:
+		dest = os.path.join(os.getcwd(), path)
+	else:
+		dest = os.path.join(os.getcwd(), os.path.join(host, path))
 	if os.path.exists(dest):
 		if os.path.samefile(file, dest):
 			return True
-- 
1.7.1



