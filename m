Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1OgSyZ-0000li-3Q
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 03:41:02 +0200
Received: by pxi12 with SMTP id 12so1880123pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Aug 2010 18:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:from:to:subject:date
	:message-id:x-mailer;
	bh=XsRPmdQhIArB+aO/Qn6IK2hkG6t6FxkkfBWCmSNLprU=;
	b=lktZ7Ws2+bNzNrmohryhBA/i2FXTgSPRw7KbqXYrsKLZaDsNRSSEPcJnDD+Y3E6I+0
	PSdP3rx7zj2RjucB9WPjuNh8Tr5CHzNu9ypenUX5OqviA1MIHTgeXQdbr1Pkp+W3oDAG
	nZeWhTMtFNMQE/Nmnef+8roE6D3KvHiyDSn+U=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer;
	b=mN6DHV+M9sJSmJTO47F2JcDiSkpwjcaxIwpzVmfi/xRKCdUYszyEnKhtWAZCKWZYKz
	TkU7mUCEAp/R/sXTsYgFDrb9VMUtjjWTrWChT/fu6MAj5nQh7jIhsjOn/HnJ4lxKMJXi
	qzlSXTci66wA5yCD/Yn/J1J9LCBKMaRICCeC8=
Received: by 10.114.58.19 with SMTP id g19mr9959603waa.73.1280886054624;
	Tue, 03 Aug 2010 18:40:54 -0700 (PDT)
Received: from localhost.localdomain (ip24-251-170-95.ph.ph.cox.net
	[24.251.170.95])
	by mx.google.com with ESMTPS id d38sm14742168wam.8.2010.08.03.18.40.52
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 03 Aug 2010 18:40:53 -0700 (PDT)
Sender: Chris Larson <kergoth@gmail.com>
From: Chris Larson <clarson@kergoth.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  3 Aug 2010 18:40:48 -0700
Message-Id: <1280886048-6272-1-git-send-email-clarson@kergoth.com>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH (resend)] image.bbclass: implement IMAGE_FEATURES
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
X-List-Received-Date: Wed, 04 Aug 2010 01:41:02 -0000

From: Christopher Larson <clarson@mvista.com>

This adds the ability to include groups of packages in an image.  It is
similar in concept to the IMAGE_FEATURES used in Poky, but here we use
IMAGE_FEATURE_<feature> and IMAGE_FEATURE_<feature>_OPTIONAL, rather than
base_contains calls.

Initially defined groups:
base - the packages requested via IMAGE_INSTALL & IMAGE_BOOT
dbg - debug packages
dev - development packages
doc - documentation packages (of limited use at the moment due to task.bbclass)
vmlinux - kernel debugging packages (just kernel-vmlinux at the moment)

To add groups to your images:
IMAGE_FEATURES += "dbg dev"

To add a new package group:
IMAGE_FEATURE_myfeature = "gstreamer python pulseaudio"

Signed-off-by: Chris Larson <clarson@mvista.com>
---
 classes/image.bbclass |  101 ++++++++++++++++++++++++++++++++++++++++++++++++-
 1 files changed, 99 insertions(+), 2 deletions(-)

diff --git a/classes/image.bbclass b/classes/image.bbclass
index 2105195..30137be 100644
--- a/classes/image.bbclass
+++ b/classes/image.bbclass
@@ -29,11 +29,10 @@ ${IMAGE_DEV_MANAGER} \
 ${IMAGE_INIT_MANAGER} \
 ${IMAGE_LOGIN_MANAGER} "
 
-RDEPENDS += "${IMAGE_INSTALL} ${IMAGE_BOOT}"
+RDEPENDS += "${__PACKAGE_INSTALL}"
 
 # "export IMAGE_BASENAME" not supported at this time
 IMAGE_BASENAME[export] = "1"
-export PACKAGE_INSTALL ?= "${IMAGE_INSTALL} ${IMAGE_BOOT}"
 
 # We need to recursively follow RDEPENDS and RRECOMMENDS for images
 do_rootfs[recrdeptask] += "do_deploy do_populate_sysroot"
@@ -61,6 +60,7 @@ python () {
     bb.data.setVarFlag('do_rootfs', 'depends', deps, d)
 
     runtime_mapping_rename("PACKAGE_INSTALL", d)
+    runtime_mapping_rename("PACKAGE_INSTALL_ATTEMPTONLY", d)
 }
 
 #
@@ -107,6 +107,103 @@ IMAGE_LINGUAS ?= "de-de fr-fr en-gb"
 
 LINGUAS_INSTALL = "${@" ".join(map(lambda s: "locale-base-%s" % s, bb.data.getVar('IMAGE_LINGUAS', d, 1).split()))}"
 
+def __pkgmap(d):
+    from os import listdir
+    from os.path import isdir, join, dirname
+
+    os = d.getVar("TARGET_OS", True)
+    vendor = d.getVar("TARGET_VENDOR", True)
+    basedir = dirname(d.getVar("PKGDATA_DIR", True))
+
+    dirs = ("%s%s-%s" % (arch, vendor, os)
+            for arch in d.getVar("PACKAGE_ARCHS", True).split())
+
+    for pkgdatadir in (join(basedir, sys) for sys in dirs):
+        try:
+            files = listdir(pkgdatadir)
+        except OSError:
+            continue
+
+        for pn in filter(lambda f: not isdir(join(pkgdatadir, f)), files):
+            try:
+                pkgdata = read_pkgdatafile(join(pkgdatadir, pn))
+            except OSError:
+                continue
+
+            for pkg in pkgdata["PACKAGES"].split():
+                yield pkg, pn
+
+def pkgmap(d):
+    pkgmap_data = d.getVar("__pkgmap_data", False)
+    if pkgmap_data is None:
+        pkgmap_data = dict(__pkgmap(d))
+        d.setVar("__pkgmap_data", pkgmap_data)
+
+    return pkgmap_data
+
+def recipename(pkg, d):
+    return pkgmap(d).get(pkg)
+
+def pkgjoin(l):
+    return ' '.join(set(l))
+
+def pkgsplit(var, d):
+    return (d.getVar(var, True) or "").split()
+
+def __packages(features, d):
+    for feature in features:
+        for pkg in pkgsplit('IMAGE_FEATURE_%s' % feature, d):
+            yield pkg
+
+def required_packages(features, d):
+    for pkg in __packages((f for f in features if not d.getVar("IMAGE_FEATURE_%s_OPTIONAL" % f, True)), d):
+        yield pkg
+
+def optional_packages(features, d):
+    for pkg in __packages((f for f in features if d.getVar("IMAGE_FEATURE_%s_OPTIONAL" % f, True)), d):
+        yield pkg
+
+def active_packages(features, d):
+    from itertools import chain
+
+    for pkg in chain(required_packages(features, d), optional_packages(features, d)):
+        yield pkg
+
+def active_recipes(features, d):
+    for pkg in active_packages(features, d):
+        recipe = recipename(pkg, d)
+        if recipe:
+            yield recipe
+
+def image_features_noextras(d):
+    for f in d.getVar("IMAGE_FEATURES", True).split():
+        if not f in ('dbg', 'dev', 'doc'):
+            yield f
+
+def dbg_packages(d):
+    from itertools import chain
+
+    features = image_features_noextras(d)
+    return pkgjoin("%s-dbg" % pkg for pkg in chain(active_packages(features, d), active_recipes(features, d)))
+
+__PACKAGE_INSTALL = "${@' '.join(required_packages(d.getVar('IMAGE_FEATURES', True).split(), d))}"
+PACKAGE_INSTALL = "${__PACKAGE_INSTALL}"
+PACKAGE_INSTALL_ATTEMPTONLY = "${@' '.join(optional_packages(d.getVar('IMAGE_FEATURES', True).split(), d))}"
+
+IMAGE_FEATURES ?= ""
+IMAGE_FEATURES_prepend = "base "
+
+# Define our default available image features
+IMAGE_FEATURE_base = "${IMAGE_INSTALL} ${IMAGE_BOOT}"
+IMAGE_FEATURE_vmlinux = "kernel-vmlinux"
+
+IMAGE_FEATURE_dbg = "${@dbg_packages(d)}"
+IMAGE_FEATURE_dbg_OPTIONAL = "1"
+IMAGE_FEATURE_dev = "${@pkgjoin('%s-dev' % pn for pn in active_recipes(image_features_noextras(d), d))}"
+IMAGE_FEATURE_dev_OPTIONAL = "1"
+IMAGE_FEATURE_doc = "${@pkgjoin('%s-doc' % pn for pn in active_recipes(image_features_noextras(d), d))}"
+IMAGE_FEATURE_doc_OPTIONAL = "1"
+
 do_rootfs[nostamp] = "1"
 do_rootfs[dirs] = "${TOPDIR}"
 do_build[nostamp] = "1"
-- 
1.7.0.4



