Received: from mail-bw0-f213.google.com ([209.85.218.213])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael.lippautz@gmail.com>) id 1NjbaH-0002Qf-9V
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Feb 2010 17:56:40 +0100
Received: by bwz5 with SMTP id 5so1708603bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2010 08:53:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=OPnpC2yti2VmhkN9W+1S6RMzJmMCcZw58V+LHG/bPj8=;
	b=oKFWyai8lh4BAc3XRi1BpdTjIl6ZJnyW57bPNvPlKksg7gQmCqWCFTpAL6CS8kBCJT
	HGsUvxiNrHbPRALFyC5PqDlqaKupYi6Jxaw7MWq7Au8bACYvF4uz/Y5U39DEB0gutaM8
	jXuz8oUg4ZZVBmjY407mjBWB3/nJP3w15dYIs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=lFuTX65310SVi8CIN7iv69k0dLKNJO7sQ753n0hTHzbpvfSvmEtPV7rkIz2TuJUCoI
	Eb/rZwuxDHZmtKWUeWDUp0XrUmd3jv7Gfxk6yVVumqQxNA8lu0FoiV8bHSpzMc5w131n
	XtOeMQMTEIyKPQUOUB5buj6Qx1TKcbCwbDwa4=
Received: by 10.204.49.82 with SMTP id u18mr2300321bkf.74.1266857633069;
	Mon, 22 Feb 2010 08:53:53 -0800 (PST)
Received: from localhost.localdomain (85-127-52-58.dynamic.xdsl-line.inode.at
	[85.127.52.58])
	by mx.google.com with ESMTPS id 14sm1214184bwz.10.2010.02.22.08.53.51
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 22 Feb 2010 08:53:52 -0800 (PST)
From: Michael Lippautz <michael.lippautz@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Feb 2010 17:54:10 +0100
Message-Id: <1266857650-5557-1-git-send-email-michael.lippautz@gmail.com>
X-Mailer: git-send-email 1.6.4.4
In-Reply-To: <n>
References: <n>
X-SA-Exim-Connect-IP: 209.85.218.213
X-SA-Exim-Mail-From: michael.lippautz@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] python-setuptools: Version bump to 0.6c11
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
X-List-Received-Date: Mon, 22 Feb 2010 16:56:40 -0000

* Adds python module 'pkg_resources'.

Signed-off-by: Michael Lippautz <michael.lippautz@gmail.com>
---
 .../python-setuptools/fix-log-usage-0.6c11.patch   |   18 ++++++++++++++++
 recipes/python/python-setuptools_0.6c11.bb         |   22 ++++++++++++++++++++
 2 files changed, 40 insertions(+), 0 deletions(-)
 create mode 100644 recipes/python/python-setuptools/fix-log-usage-0.6c11.patch
 create mode 100644 recipes/python/python-setuptools_0.6c11.bb

diff --git a/recipes/python/python-setuptools/fix-log-usage-0.6c11.patch b/recipes/python/python-setuptools/fix-log-usage-0.6c11.patch
new file mode 100644
index 0000000..b860700
--- /dev/null
+++ b/recipes/python/python-setuptools/fix-log-usage-0.6c11.patch
@@ -0,0 +1,18 @@
+--- a/setuptools/command/sdist.py	2010-02-22 14:57:56.000000000 +0100
++++ b/setuptools/command/sdist.py	2010-02-22 14:57:31.000000000 +0100
+@@ -1,6 +1,5 @@
+ from distutils.command.sdist import sdist as _sdist
+ from distutils.util import convert_path
+-from distutils import log
+ from glob import glob
+ import os, re, sys, pkg_resources
+ 
+@@ -94,7 +93,7 @@
+         try: svnver = int(data.splitlines()[0])
+         except: pass
+         if svnver<8:
+-            log.warn("unrecognized .svn/entries format in %s", dirname)
++            print("unrecognized .svn/entries format in %s", dirname)
+             return           
+         for record in map(str.splitlines, data.split('\n\x0c\n')[1:]):
+             if not record or len(record)>=6 and record[5]=="delete":
diff --git a/recipes/python/python-setuptools_0.6c11.bb b/recipes/python/python-setuptools_0.6c11.bb
new file mode 100644
index 0000000..bccafa4
--- /dev/null
+++ b/recipes/python/python-setuptools_0.6c11.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "Download, build, install, upgrade, and uninstall Python packages"
+HOMEPAGE = "http://cheeseshop.python.org/pypi/setuptools"
+SECTION = "devel/python"
+PRIORITY = "optional"
+LICENSE = "MIT"
+DEPENDS_${PN}-native = "python-native"
+RDEPENDS_${PN} = "python-distutils python-compression"
+PR = "ml3"
+
+SRC_URI = "\
+  http://cheeseshop.python.org/packages/source/s/setuptools/${SRCNAME}-${PV}.tar.gz;name=setuptools \
+  file://fix-log-usage-0.6c11.patch;patch=1 \
+"
+SRC_URI[setuptools.md5sum] = "7df2a529a074f613b509fb44feefe74e"
+SRC_URI[setuptools.sha256sum] = "630fea9b726320b73ee3ca6ff61732cb32675b0389be658080fe46383b87a1d3"
+
+SRCNAME = "setuptools"
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit distutils
+
+BBCLASSEXTEND = "native"
-- 
1.6.4.4



