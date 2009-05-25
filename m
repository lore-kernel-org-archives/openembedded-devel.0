Received: from [84.21.108.25] (helo=ns.penguin.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1M8dwx-00047f-G0
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 May 2009 19:26:59 +0200
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id 2FE91140971F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 May 2009 19:20:13 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9vgkD9BYb+PG
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 May 2009 19:20:13 +0200 (CEST)
Received: from [10.20.1.86] (styx-ext.suse.cz [82.119.242.94])
	by ns.penguin.cz (Postfix) with ESMTP id 07D3E1409715
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 May 2009 19:20:13 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20090524204821.GC1445@denix.org>
References: <fce2a370905231344i3eced2bci5e1997d520be705e@mail.gmail.com>
	<20090524204821.GC1445@denix.org>
Date: Mon, 25 May 2009 19:18:57 +0200
Message-Id: <1243271937.28070.9.camel@hammer.suse.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.27.1 
Subject: Re: [PATCH] locality of python{} variables (was e2fsprogs-libs is unbuildable for .dev)
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
X-List-Received-Date: Mon, 25 May 2009 17:26:59 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Denys Dmytriyenko wrote:
> http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=61f0ac5601f6c03871d084f879ef618664d9b2c6

Blindly guessing that variables inside python statement may be global. I
see no other explanation, how variables can get a value defined in
another .bb file.

Here is a partial fix (just a variable rename) that allowed to continue
the build. If my guess is true, then possible problems of
do_split_packages() may be pretty widespread.

diff --git a/recipes/e2fsprogs-libs/e2fsprogs-libs.inc b/recipes/e2fsprogs-libs/e2fsprogs-libs.inc
index 8b214c1..5b82c11 100644
--- a/recipes/e2fsprogs-libs/e2fsprogs-libs.inc
+++ b/recipes/e2fsprogs-libs/e2fsprogs-libs.inc
@@ -15,12 +15,12 @@ FILES_e2fsprogs-libs-dev_append = " ${datadir}/et ${datadir}/ss"
 FILES_${PN} = "${bindir}"
 
 python populate_packages_prepend () {
-	cv_libdir = bb.data.expand('${libdir}', d)
-	cv_libdir_dbg = bb.data.expand('${libdir}/.debug', d)
-	do_split_packages(d, cv_libdir, '^lib(.*)\.so$', 'lib%s-dev', 'e2fsprogs-libs %s development package', extra_depends='${PN}-dev', allow_links=True)
-	do_split_packages(d, cv_libdir, '^lib(.*)\.la$', 'lib%s-dev', 'e2fsprogs-libs %s development package', extra_depends='${PN}-dev')
-	do_split_packages(d, cv_libdir, '^lib(.*)\.a$', 'lib%s-dev', 'e2fsprogs-libs %s development package', extra_depends='${PN}-dev')
-	do_split_packages(d, cv_libdir, '^lib(.*)\.so\.*', 'lib%s', 'e2fsprogs-libs %s library', extra_depends='', allow_links=True)
+	e2fs_libdir = bb.data.expand('${libdir}', d)
+	e2fs_libdir_dbg = bb.data.expand('${libdir}/.debug', d)
+	do_split_packages(d, e2fs_libdir, '^lib(.*)\.so$', 'lib%s-dev', 'e2fsprogs-libs %s development package', extra_depends='${PN}-dev', allow_links=True)
+	do_split_packages(d, e2fs_libdir, '^lib(.*)\.la$', 'lib%s-dev', 'e2fsprogs-libs %s development package', extra_depends='${PN}-dev')
+	do_split_packages(d, e2fs_libdir, '^lib(.*)\.a$', 'lib%s-dev', 'e2fsprogs-libs %s development package', extra_depends='${PN}-dev')
+	do_split_packages(d, e2fs_libdir, '^lib(.*)\.so\.*', 'lib%s', 'e2fsprogs-libs %s library', extra_depends='', allow_links=True)
 }
 
 do_stage () {
diff --git a/recipes/util-linux-ng/util-linux-ng.inc b/recipes/util-linux-ng/util-linux-ng.inc
index 45fd1a6..9c70b9e 100644
--- a/recipes/util-linux-ng/util-linux-ng.inc
+++ b/recipes/util-linux-ng/util-linux-ng.inc
@@ -123,12 +123,12 @@ do_install () {
 }
 
 python populate_packages_prepend () {
-	cv_libdir = bb.data.expand('${libdir}', d)
-	cv_libdir_dbg = bb.data.expand('${libdir}/.debug', d)
-	do_split_packages(d, cv_libdir, '^lib(.*)\.so$', 'lib%s-dev', 'util-linux-ng %s development package', extra_depends='${PN}-dev', allow_links=True)
-	do_split_packages(d, cv_libdir, '^lib(.*)\.la$', 'lib%s-dev', 'util-linux-ng %s development package', extra_depends='${PN}-dev')
-	do_split_packages(d, cv_libdir, '^lib(.*)\.a$', 'lib%s-dev', 'util-linux-ng %s development package', extra_depends='${PN}-dev')
-	do_split_packages(d, cv_libdir, '^lib(.*)\.so\.*', 'lib%s', 'util-linux-ng %s library', extra_depends='', allow_links=True)
+	ulinxng_libdir = bb.data.expand('${libdir}', d)
+	ulinxng_libdir_dbg = bb.data.expand('${libdir}/.debug', d)
+	do_split_packages(d, ulinxng_libdir, '^lib(.*)\.so$', 'lib%s-dev', 'util-linux-ng %s development package', extra_depends='${PN}-dev', allow_links=True)
+	do_split_packages(d, ulinxng_libdir, '^lib(.*)\.la$', 'lib%s-dev', 'util-linux-ng %s development package', extra_depends='${PN}-dev')
+	do_split_packages(d, ulinxng_libdir, '^lib(.*)\.a$', 'lib%s-dev', 'util-linux-ng %s development package', extra_depends='${PN}-dev')
+	do_split_packages(d, ulinxng_libdir, '^lib(.*)\.so\.*', 'lib%s', 'util-linux-ng %s library', extra_depends='', allow_links=True)
 }
 
 

-- 
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



