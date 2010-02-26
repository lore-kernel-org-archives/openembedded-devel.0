Received: from mail-bw0-f213.google.com ([209.85.218.213])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael.lippautz@gmail.com>) id 1Nl3OZ-0007IH-4W
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Feb 2010 17:50:35 +0100
Received: by bwz5 with SMTP id 5so236255bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Feb 2010 08:47:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=yufw23TUEpOhv75DikINWlKt5MTTaPqDN/po8KLDWOY=;
	b=bSGm8TG3dZdbt4uN678xYxgxkh5DAZSr3A/+cDyKYuSSHbn8Pz+3RCpP5hGIHDq0Wu
	f0oDJ9v7YgLPfE/yrVtonW5cyKdBmas0ENb0opAE5oCkN9apLFnr3L78jaj3EEO+0mVw
	yF61rAJcDUZMl7mOWA5ux4DbCMhfQWoMazs+Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=V/OpL9xqIX0QCgvmzjdgKnF+1hKD8tZcSncuTFXkK8TF/GmkMgE/dV/SG2VafRG4Tr
	XKwF0ZCKMsSovqOYbQKTl/MZSWDD1lLzL35cGbfYuk5ZYs2I1Z2TKkcOejEeGUZFib1M
	uiDeX4XwlGkwBbWPrX03B+WQyglhsua6+ERXY=
Received: by 10.204.33.71 with SMTP id g7mr441450bkd.201.1267202863878;
	Fri, 26 Feb 2010 08:47:43 -0800 (PST)
Received: from localhost.localdomain
	(85-127-150-205.dynamic.xdsl-line.inode.at [85.127.150.205])
	by mx.google.com with ESMTPS id 14sm165206bwz.10.2010.02.26.08.47.42
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 26 Feb 2010 08:47:43 -0800 (PST)
From: Michael Lippautz <michael.lippautz@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 26 Feb 2010 17:48:05 +0100
Message-Id: <1267202885-20780-1-git-send-email-michael.lippautz@gmail.com>
X-Mailer: git-send-email 1.6.4.4
X-SA-Exim-Connect-IP: 209.85.218.213
X-SA-Exim-Mail-From: michael.lippautz@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_PASS autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] python-paste: Add new recipe
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
X-List-Received-Date: Fri, 26 Feb 2010 16:50:36 -0000

---
 recipes/python/python-paste_1.7.2.bb |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)
 create mode 100644 recipes/python/python-paste_1.7.2.bb

diff --git a/recipes/python/python-paste_1.7.2.bb b/recipes/python/python-paste_1.7.2.bb
new file mode 100644
index 0000000..28c59fb
--- /dev/null
+++ b/recipes/python/python-paste_1.7.2.bb
@@ -0,0 +1,15 @@
+DESCRIPTION = "Tools for using a Web Server Gateway Interface stack"
+HOMEPAGE = "http://pythonpaste.org/"
+SECTION = "devel/python"
+PRIORITY = "optional"
+LICENSE = "MIT"
+SRCNAME = "Paste"
+PR = "r0"
+
+SRC_URI = "http://pypi.python.org/packages/source/P/${SRCNAME}/${SRCNAME}-${PV}.tar.gz;name=paste"
+SRC_URI[paste.md5sum] = "a6a58d08dc4bff91d5d1c519d2277f8a"
+SRC_URI[paste.sha256sum] = "67dde086f0aa84c3ec2452cd65d05d19a050ec2ba56483b1614bdbfd82b3b2b8"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit setuptools
-- 
1.6.4.4



