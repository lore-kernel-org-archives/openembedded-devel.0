Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Sr7DM-0004o9-Lc
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Jul 2012 14:49:20 +0200
Received: by wibhm11 with SMTP id hm11so317697wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Jul 2012 05:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=+vgHt8CA0jbCUibrNJWEYUtxqTbaJFbRhiBM73SwT0Y=;
	b=qzZLzYqv5pjXH0lJs1gTuDMMfrdGA4N8PEWSsqYOYXO4CxFvOUYWDh4dNfvybP0NK/
	nlFtF2eHc6DxIFn8h9whoJvai88DOTqUm7PUY/0eUmRfkCS4VveGpwdLd5UcUk5onTbV
	kS0+o+W5EqqRtGk4FbOxZ36HBcaqg4vn7UUefZiYqWxbo2tG5jjxBcwDj7QE3hhWFUlw
	C9fqviSjZDNGpRIwFVtIpAaGrlvOO1oKCSx6Mn0GXRS+6KN+eUvUYs/JQZgFux3gx9U0
	me1j65IRBsj71oLRuiYl0NR+/waCxrwBP1TkO3oIAlKgWtWq9pAADBWO1KW+zLusyTRV
	y/nQ==
Received: by 10.216.160.213 with SMTP id u63mr84537wek.35.1342528681258;
	Tue, 17 Jul 2012 05:38:01 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id w7sm26837579wiz.0.2012.07.17.05.37.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Jul 2012 05:38:00 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Jul 2012 14:37:55 +0200
Message-Id: <1342528680-6336-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <1342528680-6336-1-git-send-email-Martin.Jansa@gmail.com>
References: <20120716175038.GL3729@jama.jama.net>
	<1342528680-6336-1-git-send-email-Martin.Jansa@gmail.com>
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Liang Li <liang.li@windriver.com>
Subject: [meta-oe][PATCH 2/7] recipes-kernel: make perf a standalone package
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
X-List-Received-Date: Tue, 17 Jul 2012 12:49:20 -0000

From: Liang Li <liang.li@windriver.com>

perf has been coupled to the kernel packages via kernel.bbclass.
While maintaining the build of perf out of the kernel source tree
is desired the package coupling has proved to be awkward in
several situations such as:

  - when a kernel recipe doesn't want to build/provide perf
  - when licensing of dependencies would prohibit perf and hence
    the kernel from being built.

To solve some of these problems, this recipe is the extraction of
the linux-tools.inc provided perf compilation into a standalone
perf recipe that builds out of the kernel source, but is otherwise
independent.

No new functionality is provided above what the linux-tools.inc
variant provided, but the separate recipe provides baseline for
adding new functionality.

Signed-off-by: Liang Li <liang.li@windriver.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/classes/kernel.bbclass |    7 +------
 1 files changed, 1 insertions(+), 6 deletions(-)

diff --git a/meta-oe/classes/kernel.bbclass b/meta-oe/classes/kernel.bbclass
index a784f08..722c928 100644
--- a/meta-oe/classes/kernel.bbclass
+++ b/meta-oe/classes/kernel.bbclass
@@ -474,7 +474,7 @@ python populate_packages_prepend () {
 	metapkg = "kernel-modules"
 	d.setVar('ALLOW_EMPTY_' + metapkg, "1")
 	d.setVar('FILES_' + metapkg, "")
-	blacklist = [ 'kernel-dev', 'kernel-image', 'kernel-base', 'kernel-vmlinux', 'perf', 'perf-dbg', 'kernel-misc' ]
+	blacklist = [ 'kernel-dev', 'kernel-image', 'kernel-base', 'kernel-vmlinux', 'kernel-misc' ]
 	for l in module_deps.values():
 		for i in l:
 			pkg = module_pattern % legitimize_package_name(re.match(module_regex, os.path.basename(i)).group(1))
@@ -552,8 +552,3 @@ addtask deploy before do_build after do_install
 
 EXPORT_FUNCTIONS do_deploy
 
-# perf must be enabled in individual kernel recipes
-PACKAGES =+ "perf-dbg perf"
-FILES_perf = "${bindir}/* \
-              ${libexecdir}"
-FILES_perf-dbg = "${FILES_${PN}-dbg}"
-- 
1.7.8.6



