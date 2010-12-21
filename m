Received: from mail-fx0-f42.google.com ([209.85.161.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1PV5sh-0002SB-Q5
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Dec 2010 18:20:11 +0100
Received: by fxm11 with SMTP id 11so4040249fxm.29
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Dec 2010 09:20:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:from:to:cc:subject
	:date:message-id:x-mailer:in-reply-to:references;
	bh=UfmClfTlEmQ/Jg9ijmmzxOX12AL9SkL2o+/hvBRYXEk=;
	b=eQzn54tQx5mNo4vAIxMFU1PuPeTAyby9lmNBRWEEmroH8OB1PoCZ45tYg6gLbW3X1Y
	fYCj16ez1+yztxcHGQPi31Au0nPX+TAAo73H2x7m8xJz48KyOSDAJlgagkvdJ2k9HUI9
	EaBNdCwvtAXrCsxE1nGulL6X95KY0dt2hkU48=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=ABtdcWz8tFfy7ETnn17bcSc7reMQA4LpWgYRixnCig6RCdmmgI6qcIolD3qGIZclGQ
	4/gPORcvij3Y16cfzPdeUZvcojYttASMWjDu8uCQnX73N7XD2OttdIUqoM4Rs5ru2EWL
	Aflz7q/+hwY0SaKrTc3H68wJqGdXPeDYq1NFg=
Received: by 10.223.101.141 with SMTP id c13mr1024709fao.118.1292952005290;
	Tue, 21 Dec 2010 09:20:05 -0800 (PST)
Received: from s42.loc (85-127-155-31.dynamic.xdsl-line.inode.at
	[85.127.155.31])
	by mx.google.com with ESMTPS id 5sm1416901fak.23.2010.12.21.09.20.03
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 21 Dec 2010 09:20:04 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1PV5sY-0004xZ-UY; Tue, 21 Dec 2010 18:20:02 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Dec 2010 18:19:59 +0100
Message-Id: <1292951999-18969-2-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1292951999-18969-1-git-send-email-rep.dot.nop@gmail.com>
References: <1292951999-18969-1-git-send-email-rep.dot.nop@gmail.com>
Subject: [PATCH] patch.bbclass: conditional patch-tool dependency
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
X-List-Received-Date: Tue, 21 Dec 2010 17:20:12 -0000

only depend do_patch on patch-tool if recipe references any patch

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 classes/patch.bbclass |   21 +++++++++++++++++++--
 1 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/classes/patch.bbclass b/classes/patch.bbclass
index 7629e9a..1cfe24c 100644
--- a/classes/patch.bbclass
+++ b/classes/patch.bbclass
@@ -38,7 +38,7 @@ python patch_do_patch() {
 	src_uri = d.getVar("SRC_URI", True).split()
 	srcurldata = bb.fetch.init(src_uri, d, True)
 	workdir = bb.data.getVar('WORKDIR', d, 1)
-	for url in d.getVar("SRC_URI", True).split():
+	for url in src_uri:
 		urldata = srcurldata[url]
 
 		local = urldata.localpath
@@ -120,8 +120,25 @@ python patch_do_patch() {
 			bb.fatal(str(exc))
 }
 
+def patch_deps(d):
+    import oe.unpack
+
+    src_uri = d.getVar("SRC_URI", True).split()
+    srcurldata = bb.fetch.init(src_uri, d, True)
+    for url in src_uri:
+        urldata = srcurldata[url]
+        local = urldata.localpath
+        if local:
+            base, ext = os.path.splitext(os.path.basename(local))
+            if ext in ('.gz', '.bz2', '.Z', '.xz'):
+                local = base
+            if oe.unpack.is_patch(local, urldata.parm):
+                return "${PATCHDEPENDENCY}"
+    return ""
+        
+
 addtask patch after do_unpack
 do_patch[dirs] = "${WORKDIR}"
-do_patch[depends] = "${PATCHDEPENDENCY}"
+do_patch[depends] = "${@patch_deps(d)}"
 
 EXPORT_FUNCTIONS do_patch
-- 
1.7.2.3



