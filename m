Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Sr7Dz-0005GZ-I9
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Jul 2012 14:49:59 +0200
Received: by weyr6 with SMTP id r6so223761wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Jul 2012 05:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=oECzaMxJ3JamGM5QTChoWbe+J8VaDKRBXcBOWgZEpXk=;
	b=nNx73HVHD53vUmxhqJ5RvUoLt3osmy9VX19NXpVk80P9B2rhRkYQ2LdHWPNBeN/quD
	Xd9FWS/8v/l6lxz3+G78xb/Z8AAGVfJDFsymdInctEf4+3xHp5vKrkR1jKq3YTHiugE1
	wDZOJT9kv/KyW7ms5gthx0Eozn5muZVPRFadmhd93ezbwCpN8mvQVlep6NUjRyEONbgE
	p4qY7bXrA/Z2mBLj8/YdUDxJlViaLLKILLswLrRBLua6d2krBa1BxGfp4brhStvvUjbW
	YxNuuqjPPSwxzHfvPs376kLxeeTI+oTMjQ/Y3h4xEYZLoWRqZHBTBeKEUqqFRu5rqzC2
	VQ9Q==
Received: by 10.180.86.133 with SMTP id p5mr3963928wiz.17.1342528720354;
	Tue, 17 Jul 2012 05:38:40 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id l5sm39745498wix.5.2012.07.17.05.38.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Jul 2012 05:38:39 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Jul 2012 14:38:00 +0200
Message-Id: <1342528680-6336-7-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <1342528680-6336-1-git-send-email-Martin.Jansa@gmail.com>
References: <20120716175038.GL3729@jama.jama.net>
	<1342528680-6336-1-git-send-email-Martin.Jansa@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [meta-oe][PATCH 7/7] kernel.bbclass: replace os.system with subprocess.call
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
X-List-Received-Date: Tue, 17 Jul 2012 12:49:59 -0000

From: Robert Yang <liezhi.yang@windriver.com>

Replace os.system with subprocess.call since the older function would
fail (more or less) silently if the executed program cannot be found

More info:
http://docs.python.org/library/subprocess.html#subprocess-replacements

[YOCTO #2454]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/classes/kernel.bbclass |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/classes/kernel.bbclass b/meta-oe/classes/kernel.bbclass
index 248cd28..810d6de 100644
--- a/meta-oe/classes/kernel.bbclass
+++ b/meta-oe/classes/kernel.bbclass
@@ -316,12 +316,12 @@ module_conf_rfcomm = "alias bt-proto-3 rfcomm"
 
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
1.7.8.6



