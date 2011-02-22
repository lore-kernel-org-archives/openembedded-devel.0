Received: from mail-bw0-f50.google.com ([209.85.214.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <filip.zyzniewski@gmail.com>) id 1Ps0L5-0004Vv-3J
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Feb 2011 23:04:11 +0100
Received: by bwz2 with SMTP id 2so2817651bwz.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Feb 2011 14:02:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:subject:date:message-id:x-mailer;
	bh=tutzVGmqe9u3yQvTVa3ZPh7DauBhh0j/P0Gnm3Q2Ta8=;
	b=FDzO09docPSWPc+LhFX4+G+6Jps5PoUWf8KmZM35CBcVUrG5cF9HkghvvijtkFxMfI
	Cxi5WbftltsXsCpAHCSmzaG8KC5LrtC4DoLa96BzY12ZyKzIFxlU7jydlZlhWCAcqGNR
	0WchbNa50Uerp3wHZ020ZzBdAWDDUvi33Atv4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer;
	b=p8n25YZkJr8ZVn87RbW6mg/JxKISKdkp0lJkD5T7AY0ZIdTfuXTfXE2XYe5DhHycHQ
	Ocv4Juu5xpZRHzIcjKwiFut6bWxaLdmLzd8ZJW9RJInQSR+3viVOburPQLC8y8FH3y14
	gDRRVn4QgOuZf+f3RDz6GLKIu867HLkvYAd8s=
Received: by 10.204.98.15 with SMTP id o15mr2984391bkn.14.1298412168325;
	Tue, 22 Feb 2011 14:02:48 -0800 (PST)
Received: from localhost.localdomain (ns.tefnet.pl [188.165.206.204])
	by mx.google.com with ESMTPS id w3sm865581bkt.5.2011.02.22.14.02.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 22 Feb 2011 14:02:47 -0800 (PST)
From: Filip Zyzniewski <filip.zyzniewski@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 22 Feb 2011 23:02:37 +0100
Message-Id: <1298412157-28772-1-git-send-email-filip.zyzniewski@gmail.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH] package_deb.bbclass: make version acceptable for dpkg-deb.
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
X-List-Received-Date: Tue, 22 Feb 2011 22:04:11 -0000

dpkg-deb does not like version numbers without digits:

NOTE: Running task 428 of 604 (ID: 14,
	[...]/openembedded/recipes/linux-firmware/linux-firmware_git.bb,
	do_package_write_deb)
dpkg-deb - error: (upstream) version (`git') doesn't contain any digits
dpkg-deb: 1 errors in control file
NOTE: package
	linux-firmware-git-r1+gitr2fab48391fda8a914b55c8ac265eb3b6ee10ace8:
	task do_package_write_deb: Started

This commit causes version numbers without digits to be appended with '0':
linux-firmware-agere_git0-r1+gitr2fab48391fda8a914b55c8ac265eb3b6ee10ace8_all.deb

Signed-off-by: Filip Zyzniewski <filip.zyzniewski@gmail.com>
---
 classes/package_deb.bbclass |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/classes/package_deb.bbclass b/classes/package_deb.bbclass
index 87f31fa..f94771c 100644
--- a/classes/package_deb.bbclass
+++ b/classes/package_deb.bbclass
@@ -146,11 +146,14 @@ python do_package_deb () {
             raise bb.build.FuncFailed("unable to open control file for writing.")
 
         fields = []
+	version = bb.data.getVar('PKGV', d, 1)
+	if re.match('[^0-9]+$', version):
+		version = '%s0' % version
         pe = bb.data.getVar('PE', d, 1)
         if pe and int(pe) > 0:
-            fields.append(["Version: %s:%s-%s\n", ['PE', 'PKGV', 'PKGR']])
+            fields.append(["Version: %%s:%s-%%s\n" % version, ['PE', 'PKGR']])
         else:
-            fields.append(["Version: %s-%s\n", ['PKGV', 'PKGR']])
+            fields.append(["Version: %s-%%s\n" % version, ['PKGR']])
         fields.append(["Description: %s\n", ['DESCRIPTION']])
         fields.append(["Section: %s\n", ['SECTION']])
         fields.append(["Priority: %s\n", ['PRIORITY']])
-- 
1.7.1



