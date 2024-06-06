Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BC93C27C5F
	for <webhook@archiver.kernel.org>; Thu,  6 Jun 2024 17:16:14 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.20556.1717694167483188619
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Jun 2024 10:16:07 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4452B2F4
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 10:16:31 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 87DE53F792
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 10:16:06 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] python3-gevent: fix build with Cython 3.0.10
Date: Thu,  6 Jun 2024 17:16:04 +0000
Message-Id: <20240606171604.3117309-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Jun 2024 17:16:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110755

Cython 3.0.10 generates code which causes compiler errors:

src/gevent/queue.c:11894:114: error: passing argument 4 of '__pyx_vtabptr=
_6gevent_14_gevent_cqueue_UnboundQueue->__pyx_base.put' from incompatible=
 pointer type [-Wincompatible-pointer-types]

From discussion upstream, removing the final decorator works around this.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../python/python3-gevent/not-final.patch        | 16 ++++++++++++++++
 .../python/python3-gevent_24.2.1.bb              |  3 ++-
 2 files changed, 18 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-gevent/no=
t-final.patch

diff --git a/meta-python/recipes-devtools/python/python3-gevent/not-final=
.patch b/meta-python/recipes-devtools/python/python3-gevent/not-final.pat=
ch
new file mode 100644
index 0000000000..444a195da4
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-gevent/not-final.patch
@@ -0,0 +1,16 @@
+gevent fails to build with Cython 3.0.10.  As per
+https://github.com/gevent/gevent/issues/2031, removing the
+cython.final decorator works around this.
+
+Upstream-Status: Pending
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+--- a/src/gevent/_gevent_cqueue.pxd
++++ b/src/gevent/_gevent_cqueue.pxd
+@@ -75,7 +75,6 @@ cdef class ItemWaiter(Waiter):
+     cdef readonly Queue queue
+=20
+=20
+-@cython.final
+ cdef class UnboundQueue(Queue):
+     pass
diff --git a/meta-python/recipes-devtools/python/python3-gevent_24.2.1.bb=
 b/meta-python/recipes-devtools/python/python3-gevent_24.2.1.bb
index fbdbf8ccc7..0a74f52820 100644
--- a/meta-python/recipes-devtools/python/python3-gevent_24.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-gevent_24.2.1.bb
@@ -13,7 +13,8 @@ RDEPENDS:${PN} =3D "python3-greenlet \
 		  python3-zopeinterface \
 		 "
=20
-SRC_URI +=3D "file://0001-_setuputils.py-Do-not-add-sys_inc_dir.patch"
+SRC_URI +=3D "file://0001-_setuputils.py-Do-not-add-sys_inc_dir.patch \
+	        file://not-final.patch"
=20
 SRC_URI[sha256sum] =3D "432fc76f680acf7cf188c2ee0f5d3ab73b63c1f03114c7cd=
8a34cebbe5aa2056"
=20
--=20
2.34.1


