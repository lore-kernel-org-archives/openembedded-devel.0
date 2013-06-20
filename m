Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-qc0-f182.google.com (mail-qc0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id B3B026AD1A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jun 2013 03:54:53 +0000 (UTC)
Received: by mail-qc0-f182.google.com with SMTP id e10so3436291qcy.41
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jun 2013 20:54:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=pdWpnnJ2mqq7Zqb/Awp8g299yCIcdNTkCsz4peRuSR0=;
	b=C5QF08CnjOEzbVattFTqWO4CCvnTQLmRU7t+k+2NA7ZT7OGVMXeSQg5J4xyrzLmqCW
	o4wPHVMlvo+LVjKVxRHbGTwBEwCviQjA74fuBB86qwM2Pa5H3peVTQoRQY5FlDtpo6lk
	S1NLKU4hXRMsDhFG8grFQ87spOc8Ni+24HWVeMvE3LTRXZ7Q+Fy+nShgDKPab3J2CSxA
	lb752ydnbhHUW+FfFjcR0ZQ9cYh/LtQuUrGKKQhJud+VgCyVpIDyqposFi6E4mv5EdqD
	aG8uwxvK/JOizne6Pxp50J5QVu1783SAEVXEOLs47+Jm4mgSVyAzp7jA8DcQVWF45mKK
	G6Ww==
X-Received: by 10.229.206.2 with SMTP id fs2mr2342294qcb.68.1371700494395;
	Wed, 19 Jun 2013 20:54:54 -0700 (PDT)
Received: from nikaia.hyatt.com (static-209-137-183-3.t1.cavtel.net.
	[209.137.183.3])
	by mx.google.com with ESMTPSA id bc5sm38163663qeb.3.2013.06.19.20.54.52
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 19 Jun 2013 20:54:53 -0700 (PDT)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 19 Jun 2013 23:54:42 -0400
Message-Id: <1371700482-12885-1-git-send-email-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 1.8.1.2
X-Gm-Message-State: ALoCoQlYN0p4pu75NqZjO1NM1ZK5Ue41sMKJPhnQHnQNgyxQESLbpgmavv4qvpfjZpLSjXBQgt80
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [meta-qt5][PATCH] qtbase: typo about virtual/egl depends
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 20 Jun 2013 03:54:54 -0000

The proper 'virtual' name for EGL is virtual/egl, not virtual/libegl,
as per meta/recipes-graphics/mesa/mesa-common.inc.

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 recipes-qt/qt5/qtbase.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtbase.inc b/recipes-qt/qt5/qtbase.inc
index 569332e..ee4094b 100644
--- a/recipes-qt/qt5/qtbase.inc
+++ b/recipes-qt/qt5/qtbase.inc
@@ -41,7 +41,7 @@ QT_DISTRO_FLAGS_linuxstdbase = "-sm"
 QT_SQL_DRIVER_FLAGS ?= "-no-sql-ibase -no-sql-mysql -no-sql-psql -no-sql-odbc -plugin-sql-sqlite"
 
 # if you want to enable egl/gles2 in your .bbappend, don't forget to add right dependencies, e.g.
-# GL_DEPENDS = "virtual/libgles2 virtual/libegl"
+# GL_DEPENDS = "virtual/libgles2 virtual/egl"
 # QT_GLFLAGS = "-opengl es2 -eglfs"
 GL_DEPENDS ?= "virtual/libgl"
 QT_GLFLAGS ?= "-opengl"
-- 
1.8.1.2


