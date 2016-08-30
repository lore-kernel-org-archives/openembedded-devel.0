Return-Path: <rtartler.desres@gmail.com>
Received: from mail-it0-f41.google.com (mail-it0-f41.google.com
	[209.85.214.41])
	by mail.openembedded.org (Postfix) with ESMTP id 8BF4D6E630
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Aug 2016 15:31:27 +0000 (UTC)
Received: by mail-it0-f41.google.com with SMTP id n75so43976395ith.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Aug 2016 08:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to;
	bh=pb+pM6cUhz36WriymPc9/YUvC5Xn4HalZFrStx/5144=;
	b=oRb4SjdoIhYKY8KR1BP5PbFzLgQKJodMJ4ZQPDdcvVzkMToXzv29ls8mQ5cmnFYYLa
	9Nrrxk2eiElGLcTQfasbZYPj7l11Jpm1gD7E63goQgH3503NRO68Itl+X+4rCsgkd/92
	ctxRkK63/YC5xesX7l/HMCGxm7M0uN8w3B7kSJCq3omep2Z7lXIMXCYbEVX0IZARf5pV
	UwzLo82eE3w501GpYSjhA2TeATiMtQBC1baGBb+FUfnL53/zJ8P55eYtfSkorUgo53HB
	5ixf7H0nRhiAZJq8NnKLMS54EEYYp1bsiCFHan0hkpIb9ryVAlZh60PiC+ZjVb7MCoML
	ztEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=pb+pM6cUhz36WriymPc9/YUvC5Xn4HalZFrStx/5144=;
	b=G5FIewXGtQnLTOzQRxbcxk6npIrvRWy3AIJr2lzc6CrYRVMWgXsTeu8sK52yxgEM2o
	5p5876+qH2yaz2ZACGCtmTlku4HJSuqFaKK+cJHA9tlDB4IYEyKTmiApRvEvzpHT7qhd
	AvgczmaUjnhAXpaxfTKQbGx3vSCDsDA8rkBQovY+jpNoBrN6j7rHLsTFg5gHZmqUKObU
	5Vir07qoYhdtxD/SgXXSGs2D+rxC7GTVG9Q9/YBMM/YaIFMBgajdc4pOmWpNZkTgMvrM
	e3kxAsICK7g/eDBnRUUHrfillY0MQWHEf2RVMJljFF9ryuOlL74cxIQMQLr42CEKMVSM
	WKow==
X-Gm-Message-State: AE9vXwNMl523R4egQkPZyMTeTGZ+KKn2hxmxZhatkGvPQfS13NWVbX9/X0RrYN6bwhYho8+6IjEsuJeIVUq5/w==
X-Received: by 10.36.219.65 with SMTP id c62mr23491309itg.44.1472571087008;
	Tue, 30 Aug 2016 08:31:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.36.254.202 with HTTP; Tue, 30 Aug 2016 08:31:26 -0700 (PDT)
From: Reinhard Tartler <rtartler.desres@gmail.com>
Date: Tue, 30 Aug 2016 11:31:26 -0400
Message-ID: <CADNFeU6vcmB1LzunSQ10Ka1ahxLj9rG3hu5hmERCKs9wb=V-zQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [PATCH] package_manager.py: Restore FEED_DEPLOYDIR_BASE_URI functionality
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 30 Aug 2016 15:31:28 -0000
Content-Type: text/plain; charset=UTF-8

According to the documentation, setting FEED_DEPLOYDIR_BASE_URI should
be sufficient for setting up local feeds. This commit fixes the
implementation to actually do that, even if BUILD_IMAGES_FROM_FEEDS is
not set.

Also fix some bugs in the old implementation:
 - Fetch uncompressed Packages files, because
   'bitbake package-index' does not appear to create Packages.gz files.
 - Add missing newline after the URI so that the options don't end up on
   the same line.
 - Fix the check when local options are necessary.

Signed-off-by: Reinhard Tartler <tartler@deshaw.com>
---
 meta/lib/oe/package_manager.py | 59 +++++++++++++++++++++++-------
------------
 1 file changed, 32 insertions(+), 27 deletions(-)
diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 2802254..e92bbbd 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -1649,33 +1649,36 @@ class OpkgPM(OpkgDpkgPM):

                     config_file.write("src/gz %s %s\n" % (feed_name,
feed_uri))

-            """
-            Allow to use package deploy directory contents as quick
devel-testing
-            feed. This creates individual feed configs for each arch
subdir of those
-            specified as compatible for the current machine.
-            NOTE: Development-helper feature, NOT a full-fledged feed.
-            """
-            if (self.d.getVar('FEED_DEPLOYDIR_BASE_URI', True) or "") !=
"":
-                for arch in self.pkg_archs.split():
-                    cfg_file_name = os.path.join(self.target_rootfs,
-
self.d.getVar("sysconfdir", True),
-                                                 "opkg",
-                                                 "local-%s-feed.conf" %
arch)
-
-                    with open(cfg_file_name, "w+") as cfg_file:
-                        cfg_file.write("src/gz local-%s %s/%s" %
-                                       (arch,
-
self.d.getVar('FEED_DEPLOYDIR_BASE_URI',
True),
-                                        arch))
-
-                        if self.opkg_dir != '/var/lib/opkg':
-                            # There is no command line option for this
anymore, we need to add
-                            # info_dir and status_file to config file, if
OPKGLIBDIR doesn't have
-                            # the default value of "/var/lib" as defined
in opkg:
-                            # libopkg/opkg_conf.h:#define
OPKG_CONF_DEFAULT_INFO_DIR      "/var/lib/opkg/info"
-                            # libopkg/opkg_conf.h:#define
OPKG_CONF_DEFAULT_STATUS_FILE   "/var/lib/opkg/status"
-                            cfg_file.write("option info_dir     %s\n" %
os.path.join(self.d.getVar('OPKGLIBDIR', True), 'opkg', 'info'))
-                            cfg_file.write("option status_file  %s\n" %
os.path.join(self.d.getVar('OPKGLIBDIR', True), 'opkg', 'status'))
+        self._setup_devel_feeds()
+
+    def _setup_devel_feeds(self):
+        """
+        Allow to use package deploy directory contents as quick
devel-testing
+        feed. This creates individual feed configs for each arch subdir of
those
+        specified as compatible for the current machine.
+        NOTE: Development-helper feature, NOT a full-fledged feed.
+        """
+
+        if (self.d.getVar('FEED_DEPLOYDIR_BASE_URI', True) or "") != "":
+            for arch in self.pkg_archs.split():
+                cfg_file_name = os.path.join(self.target_rootfs +
self.d.getVar("sysconfdir", True),
+                                       "opkg", "local-%s-feed.conf" % arch)
+
+                bb.utils.mkdirhier(os.path.dirname(cfg_file_name))
+                with open(cfg_file_name, "w+") as cfg_file:
+                    cfg_file.write("src local-%s %s/%s\n" %
+                                   (arch,
+                                    self.d.getVar('FEED_DEPLOYDIR_BASE_URI',
True),
+                                    arch))
+
+                    if self.opkg_dir != self.target_rootfs +
'/var/lib/opkg':
+                        # There is no command line option for this
anymore, we need to add
+                        # info_dir and status_file to config file, if
OPKGLIBDIR doesn't have
+                        # the default value of "/var/lib" as defined in
opkg:
+                        # libopkg/opkg_conf.h:#define
OPKG_CONF_DEFAULT_INFO_DIR      "/var/lib/opkg/info"
+                        # libopkg/opkg_conf.h:#define
OPKG_CONF_DEFAULT_STATUS_FILE   "/var/lib/opkg/status"
+                        cfg_file.write("option info_dir     %s\n" %
os.path.join(self.d.getVar('OPKGLIBDIR', True), 'opkg', 'info'))
+                        cfg_file.write("option status_file  %s\n" %
os.path.join(self.d.getVar('OPKGLIBDIR', True), 'opkg', 'status'))
      def _create_config(self):
@@ -1702,6 +1705,8 @@ class OpkgPM(OpkgDpkgPM):
                 config_file.write("option info_dir     %s\n" %
os.path.join(self.d.getVar('OPKGLIBDIR', True), 'opkg', 'info'))
                 config_file.write("option status_file  %s\n" %
os.path.join(self.d.getVar('OPKGLIBDIR', True), 'opkg', 'status'))

+        self._setup_devel_feeds()
+
     def insert_feeds_uris(self):
         if self.feed_uris == "":
             return
-- 
2.7.1

