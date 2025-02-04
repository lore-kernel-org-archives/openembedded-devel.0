Return-Path: <ts@ferncast.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3E03C02193
	for <webhook@archiver.kernel.org>; Tue,  4 Feb 2025 16:25:28 +0000 (UTC)
Received: from smtprelay08.ispgateway.de (smtprelay08.ispgateway.de [134.119.228.107])
 by mx.groups.io with SMTP id smtpd.web10.120751.1738686327580649080
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Feb 2025 08:25:27 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: ferncast.de, ip: 134.119.228.107, mailfrom: ts@ferncast.de)
Received: from [78.35.226.16] (helo=ferncast-thomas.fritz.box)
	by smtprelay08.ispgateway.de with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98)
	(envelope-from <ts@ferncast.de>)
	id 1tfLjp-000000004Gt-14yZ;
	Tue, 04 Feb 2025 17:25:25 +0100
From: Thomas Schlien <ts@ferncast.de>
To: openembedded-devel@lists.openembedded.org
Cc: Thomas Schlien <ts@ferncast.de>
Subject: [PATCH] python3-gevent: upgrade 24.2.1 -> 24.11.1
Date: Tue,  4 Feb 2025 17:24:07 +0100
Message-ID: <20250204162406.1577665-2-ts@ferncast.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Df-Sender: dHNAZmVybmNhc3QuZGU=
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Feb 2025 16:25:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115274

Changelog:
=========
24.11.1 (2024-11-11)
Bugfixes
- Remove some legacy code that supported Python 2 for compatibility with the
  upcoming releases of Cython 3.1.
- Also, the PeriodicMonitorThreadStartedEvent now properly implements the
  IPeriodicMonitorThreadStartedEvent interface. The EventLoopBlocked event
  includes the hub which was blocked, and it is notified before the report
  is printed so that event listeners can modify the report. See issue #2076.

24.10.3 (2024-10-18)
Bugfixes
- Fix clearing stack frames on Python 3.13. This is invoked when you fork
  after having used the thread pool. See issue #2067.
- Distribute manylinux2014 wheels for x86_64. See issue #2068.
- Stop switching to the hub in the after fork hook in a child process. This
  could lead to strange behaviour, and is different than what all other
  versions of Python do.

24.10.2 (2024-10-11)
Bugfixes
- Workaround a Cython bug compiling on GCC14. See issue #2049.

24.10.1 (2024-10-09)
Features
- Update the bundled c-ares to 1.33.1.
- Add support for Python 3.13.
  - The functions and classes in gevent.subprocess no longer accept
    stdout=STDOUT and raise a ValueError.
  Several additions and changes to the queue module, including:
  -  Queue.shutdown is available on all versions of Python.
  -  LifoQueue is now a joinable queue.
- gevent.monkey changed from a module to a package. The public API remains
  the same.
  For this release, private APIs (undocumented, marked internal, or
  beginning with an underscore) are also preserved. However, these may be
  changed or removed at any time in the future. If you are using one of
  these APIs and cannot replace it, please contact the gevent team.

Bugfixes
- For platforms that don’t have socketpair, upgrade our fallback code to
  avoid a security issue. See issue #2048.

Deprecations and Removals
- Remove support for Python 3.8, which has reached the end of its support
  lifecycle. See issue #remove_py38.

Signed-off-by: Thomas Schlien <ts@ferncast.de>
---
 .../python/python3-gevent/not-final.patch        | 16 ----------------
 ...event_24.2.1.bb => python3-gevent_24.11.1.bb} |  5 ++---
 2 files changed, 2 insertions(+), 19 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-gevent/not-final.patch
 rename meta-python/recipes-devtools/python/{python3-gevent_24.2.1.bb => python3-gevent_24.11.1.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-gevent/not-final.patch b/meta-python/recipes-devtools/python/python3-gevent/not-final.patch
deleted file mode 100644
index 444a195da4..0000000000
--- a/meta-python/recipes-devtools/python/python3-gevent/not-final.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-gevent fails to build with Cython 3.0.10.  As per
-https://github.com/gevent/gevent/issues/2031, removing the
-cython.final decorator works around this.
-
-Upstream-Status: Pending
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
---- a/src/gevent/_gevent_cqueue.pxd
-+++ b/src/gevent/_gevent_cqueue.pxd
-@@ -75,7 +75,6 @@ cdef class ItemWaiter(Waiter):
-     cdef readonly Queue queue
- 
- 
--@cython.final
- cdef class UnboundQueue(Queue):
-     pass
diff --git a/meta-python/recipes-devtools/python/python3-gevent_24.2.1.bb b/meta-python/recipes-devtools/python/python3-gevent_24.11.1.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-gevent_24.2.1.bb
rename to meta-python/recipes-devtools/python/python3-gevent_24.11.1.bb
index 9f96b00953..1a96892fb5 100644
--- a/meta-python/recipes-devtools/python/python3-gevent_24.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-gevent_24.11.1.bb
@@ -13,10 +13,9 @@ RDEPENDS:${PN} = "python3-greenlet \
 		  python3-zopeinterface \
 		 "
 
-SRC_URI += "file://0001-_setuputils.py-Do-not-add-sys_inc_dir.patch \
-	        file://not-final.patch"
+SRC_URI += "file://0001-_setuputils.py-Do-not-add-sys_inc_dir.patch"
 
-SRC_URI[sha256sum] = "432fc76f680acf7cf188c2ee0f5d3ab73b63c1f03114c7cd8a34cebbe5aa2056"
+SRC_URI[sha256sum] = "8bd1419114e9e4a3ed33a5bad766afff9a3cf765cb440a582a1b3a9bc80c1aca"
 
 inherit pypi python_setuptools_build_meta cython
 

