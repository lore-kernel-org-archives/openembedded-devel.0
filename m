Received: from mail-gx0-f224.google.com ([209.85.217.224])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1NiXvy-0005nI-IC
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Feb 2010 19:50:41 +0100
Received: by gxk24 with SMTP id 24so399817gxk.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Feb 2010 10:47:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:from:to:cc:subject
	:date:message-id:x-mailer;
	bh=/6WqBzgIiuIrudctvhZXg21vw6hLPeKVX8CYOoSm2/E=;
	b=nda9/IhWreOKYJJB7VtrqYKc61VjkrpnE88/3jnSlB755TzgedFJEn7kly4x+7ZG2J
	qXYYDc7SuUgmR4fdsm4xYjRfIqaTUT9t15FFmYxbJIa5L7jMYqvyx7hpFnyZSMtfM2a5
	ZavVW9IGYwh3Yakic04srtJWATma+bhLNMpo4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	b=NTrJFfF7kP27Q1gyAnI47lek0gAb//0OW34rqqffxLr+xDUMc5w1PHD6x2XDA9cMj2
	mGLZjJUdzEEmFNTQDOwvhdwpUV+0faCnUbDUW1Smx2c7x/Cg8FcZBuwAdeocPfZyjvvS
	84llDlMKIEU4dvpeXKZ6FCDnI1ftnHimJGY8A=
Received: by 10.101.167.28 with SMTP id u28mr3551026ano.237.1266605276553;
	Fri, 19 Feb 2010 10:47:56 -0800 (PST)
Received: from localhost.localdomain (ip24-251-170-95.ph.ph.cox.net
	[24.251.170.95])
	by mx.google.com with ESMTPS id 8sm173051ywg.50.2010.02.19.10.47.54
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 19 Feb 2010 10:47:55 -0800 (PST)
Sender: Chris Larson <kergoth@gmail.com>
From: Chris Larson <clarson@kergoth.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 19 Feb 2010 11:47:48 -0700
Message-Id: <1266605268-5957-1-git-send-email-clarson@kergoth.com>
X-Mailer: git-send-email 1.6.3.3
X-SA-Exim-Connect-IP: 209.85.217.224
X-SA-Exim-Mail-From: kergoth@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [PATCH] package.bbclass: when running 'file', be explicit about the path to the magic
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
X-List-Received-Date: Fri, 19 Feb 2010 18:50:41 -0000

From: Tom Rini <tom_rini@mentor.com>

This works around one relocation issue.

Signed-off-by: Tom Rini <tom_rini@mentor.com>
Signed-off-by: Chris Larson <chris_larson@mentor.com>
---
 classes/package.bbclass |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/classes/package.bbclass b/classes/package.bbclass
index 062f782..72c9053 100644
--- a/classes/package.bbclass
+++ b/classes/package.bbclass
@@ -155,11 +155,12 @@ def runstrip(file, d):
     import commands, stat
 
     pathprefix = "export PATH=%s; " % bb.data.getVar('PATH', d, True)
+    magicfile = "%s/file/magic" % bb.data.getVar('STAGING_DATADIR_NATIVE', d, True) 
 
-    ret, result = commands.getstatusoutput("%sfile '%s'" % (pathprefix, file))
+    ret, result = commands.getstatusoutput("%sfile -m %s '%s'" % (pathprefix, magicfile, file))
 
     if ret:
-        bb.error("runstrip: 'file %s' failed (forced strip)" % file)
+        bb.error("runstrip: 'file -m %s %s' failed (forced strip)" % (magicfile, file))
 
     if "not stripped" not in result:
         bb.debug(1, "runstrip: skip %s" % file)
-- 
1.6.3.3



