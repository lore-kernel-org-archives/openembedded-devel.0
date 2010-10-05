Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1P32CV-0003At-DO
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Oct 2010 09:44:40 +0200
Received: by mail-pz0-f47.google.com with SMTP id 37so1518215pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Oct 2010 00:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=yGXWYmjOABZRtDd+x1NjMu8VL/+yITWgmD6zzZdP8l0=;
	b=NMLlKQfFIF9T2+tjHGZSJMQ9eXq8Y82BplBwaryTP+SOyCX3OR858P0pyGpklBzkkm
	oWePAhNhWuVTWVM3/1HFtt8IwpWP5WMPPbHHEOKl35oHeCbLMuLDLDbcRXYUnJyGWNRz
	/iBgf09LxTF+yQUzQtm3/w2R2V7XSdblMUL2Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=npKX/YO/MiVOnvvl/f7PXkGIbgTMWoKIswm8YHIIcmSO2jA4nQlagS0+5/DFbesJQG
	vHf46axSJRtW5SkUoY7JqohlYuSsUssuR/jBKWy0p9GlzHikTsYc9y0Kuk3DaxnWUxHS
	G4RpJfCLHN91ZwotGQSr1Y1CypfJecDW9nvDA=
Received: by 10.143.166.11 with SMTP id t11mr9892455wfo.57.1286264662220;
	Tue, 05 Oct 2010 00:44:22 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id 9sm7531414wfd.0.2010.10.05.00.44.21
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 05 Oct 2010 00:44:21 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Oct 2010 00:44:02 -0700
Message-Id: <1286264643-6352-6-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1286264643-6352-1-git-send-email-raj.khem@gmail.com>
References: <1286264643-6352-1-git-send-email-raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 209.85.210.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 5/6] insane.bbclass: Do not check for installed=yes in .la files.
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
X-List-Received-Date: Tue, 05 Oct 2010 07:44:40 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 classes/insane.bbclass |    9 +--------
 1 files changed, 1 insertions(+), 8 deletions(-)

diff --git a/classes/insane.bbclass b/classes/insane.bbclass
index 9087efd..de87c91 100644
--- a/classes/insane.bbclass
+++ b/classes/insane.bbclass
@@ -100,7 +100,7 @@ def package_qa_get_machine_dict():
 # 2 - package depends on debug package
 # 3 - non dbg contains .so
 # 4 - wrong architecture
-# 5 - .la contains installed=yes or reference to the workdir
+# 5 - .la contains reference to the workdir
 # 6 - .pc contains reference to /usr/include or workdir
 # 7 - the desktop file is not valid
 # 8 - .la contains reference to the workdir
@@ -314,7 +314,6 @@ def package_qa_hash_style(path, name, d, elf):
 def package_qa_check_staged(path,d):
     """
     Check staged la and pc files for sanity
-      -e.g. installed being false
 
         As this is run after every stage we should be able
         to find the one responsible for the errors easily even
@@ -325,7 +324,6 @@ def package_qa_check_staged(path,d):
     tmpdir = bb.data.getVar('TMPDIR', d, True)
     workdir = os.path.join(tmpdir, "work")
 
-    installed = "installed=yes"
     iscrossnative = False
     pkgconfigcheck = tmpdir
     for s in ['cross', 'native', 'canadian-cross', 'canadian-native']:
@@ -341,11 +339,6 @@ def package_qa_check_staged(path,d):
             path = os.path.join(root,file)
             if file.endswith(".la"):
                 file_content = open(path).read()
-                # Don't check installed status for native/cross packages
-                if not iscrossnative:
-                    if installed in file_content:
-                        error_msg = "%s failed sanity test (installed) in path %s" % (file,root)
-                        sane = package_qa_handle_error(5, error_msg, "staging", path, d)
                 if workdir in file_content:
                     error_msg = "%s failed sanity test (workdir) in path %s" % (file,root)
                     sane = package_qa_handle_error(8, error_msg, "staging", path, d)
-- 
1.7.1



