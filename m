Received: from [63.81.120.158] (helo=gateway-1237.mvista.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <clarson@mvista.com>) id 1M4LZn-0006gM-Sx
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 May 2009 23:01:20 +0200
Received: from localhost.localdomain (unknown [10.50.1.118])
	by hermes.mvista.com (Postfix) with ESMTP
	id C18A31ACF4; Wed, 13 May 2009 13:54:28 -0700 (PDT)
From: Chris Larson <clarson@mvista.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 May 2009 13:53:18 -0700
Message-Id: <1242247998-30548-1-git-send-email-clarson@mvista.com>
X-Mailer: git-send-email 1.6.0
Subject: [PATCH] bitbake.conf, freeze.inc: Add version lockdown implementation and use it by default.
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
X-List-Received-Date: Wed, 13 May 2009 21:01:20 -0000

For each recipe which completes a task successfully, this emits the current
version into ${TMPDIR}/versions.conf as a PREFERRED_VERSION line.
${TMPDIR}/versions.conf and conf/versions.conf are automatically included,
in that order, in subsequent builds, to provide more deterinistic builds by
default, and to let the user make the lockdown persist via a simple cp
command.

Assuming that the latest ncurses in the recipes is 5.7, and that 5.7 is
preferred over 5.3 by default given any distro version preferences, if they
exist, the following are examples of its behavior:

$ rm -rf tmp
$ bitbake ncurses-5.3
$ bitbake -c clean ncurses
$ bitbake ncurses # builds ncurses 5.3

$ cp tmp/versions.conf conf/
$ rm -rf tmp
$ bitbake ncurses # builds ncurses 5.3

Signed-off-by: Chris Larson <clarson@mvista.com>
---
 conf/bitbake.conf |    1 +
 conf/freeze.inc   |   71 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 72 insertions(+), 0 deletions(-)
 create mode 100644 conf/freeze.inc

diff --git a/conf/bitbake.conf b/conf/bitbake.conf
index f7df60c..9b6ffcc 100644
--- a/conf/bitbake.conf
+++ b/conf/bitbake.conf
@@ -618,6 +618,7 @@ OVERRIDES = "local:${MACHINE}:${DISTRO}:${TARGET_OS}:${TARGET_ARCH}:build-${BUIL
 ##################################################################
 
 require conf/collections.inc
+require conf/freeze.inc
 include conf/site.conf
 include conf/auto.conf
 include conf/local.conf
diff --git a/conf/freeze.inc b/conf/freeze.inc
new file mode 100644
index 0000000..82acebf
--- /dev/null
+++ b/conf/freeze.inc
@@ -0,0 +1,71 @@
+# Recipe version "freeze" aka lockdown implementation.
+#
+# For each recipe which completes a task successfully, this emits the current
+# version into ${TMPDIR}/versions.conf as a PREFERRED_VERSION line.
+# ${TMPDIR}/versions.conf and conf/versions.conf are automatically included,
+# in that order, in subsequent builds, to provide more deterinistic builds by
+# default, and to let the user make the lockdown persist via a simple cp
+# command.
+#
+# Assuming that the latest ncurses in the recipes is 5.7, and that 5.7 is
+# preferred over 5.3 by default given any distro version preferences, if they
+# exist, the following are examples of its behavior:
+#
+# $ rm -rf tmp
+# $ bitbake ncurses-5.3
+# $ bitbake -c clean ncurses
+# $ bitbake ncurses # builds ncurses 5.3
+#
+# $ cp tmp/versions.conf conf/
+# $ rm -rf tmp
+# $ bitbake ncurses # builds ncurses 5.3
+
+__FREEZEFN ?= "versions.conf"
+__FREEZEFILE = "${TMPDIR}/${__FREEZEFN}"
+__FREEZELINE = 'PREFERRED_VERSION_%s = "%s"'
+__FREEZELINERE = '^PREFERRED_VERSION_(.*) = "(.*)"$'
+
+include ${__FREEZEFILE}
+include conf/${__FREEZEFN}
+
+def freeze_add(d):
+    fn = d.getVar("__FREEZEFILE", 1)
+    f = open(fn, "a")
+    f.write("%s\n" % (d.getVar("__FREEZELINE", 1) % (d.getVar("PN", 1), d.getVar("PV", 1))))
+    f.close()
+
+def freeze_finish(d):
+    import re
+
+    # Cleaning up the freezefile
+    freezefile = d.getVar("__FREEZEFILE", 1)
+    verdata = {}
+
+    try:
+        f = open(freezefile, "r")
+    except (OSError, IOError):
+        pass
+
+    regexp = re.compile(d.getVar("__FREEZELINERE", 1))
+    for line in f:
+        m = regexp.match(line)
+        verdata[m.group(1)] = m.group(2)
+    f.close()
+
+    fl = d.getVar("__FREEZELINE", 1)
+    f = open(freezefile, "w")
+    f.writelines([("%s\n" % (fl % (pn, pv))) for (pn, pv) in verdata.items()])
+    f.close()
+
+addhandler freeze_eventhandler
+python freeze_eventhandler () {
+    from bb.event import BuildCompleted
+    from bb.build import TaskSucceeded
+
+    if isinstance(e, TaskSucceeded):
+        freeze_add(e.data)
+    elif isinstance(e, BuildCompleted):
+        freeze_finish(e.data)
+}
+
+# vim: set ft=bitbake fenc=utf-8 sts=4 sw=4 et :
-- 
1.6.2



