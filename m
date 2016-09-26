Return-Path: <liu.ming50@gmail.com>
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by mail.openembedded.org (Postfix) with ESMTP id 35B2F600BB
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Sep 2016 16:21:29 +0000 (UTC)
Received: by mail-lf0-f66.google.com with SMTP id s29so9763719lfg.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Sep 2016 09:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=SCsf/+yKeC9apGhY+RlG4Y67haPrlOWU9UtN8nTnpus=;
	b=wPMl6z1Jath9lznW8ynyRGKzi+XdgHhRpsmGrQ4f3yUwq4pucQ+gcMc66anZGwZTUi
	uOcjGyv7GlZcNupwjuBw3rwGoejm5crRUPiNfJlQKtj9c3XcGZWFAwUEmvM4mli6ALgI
	nr7g5HCzOLC6VdeO0L/wblAEXCcP6q8s/Wr/ha8B82K+F0B/c3LY6r9wJJe9SiH6AIRM
	cXGF7qTFogbPGvXbOOrIbzeXsNZ1a5PZAwYult7NVym3B44YJgkbiuMwd9Txq/CI2Kdt
	qh3MlapSTCD1p1+JsoEwPQl6icY9T2JLIRRnI5QA+owlHiGPcc+HDerwpghCaM/5v5JO
	QakQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=SCsf/+yKeC9apGhY+RlG4Y67haPrlOWU9UtN8nTnpus=;
	b=gBYJ/F9zKpYc0/JOM/KG3CUoFLz1gpKvAu640Tc60mJW8gLYOmh+nxaKIhcRoahYfV
	DKXnfdC/tiqxtRYqZqOJyo/oPJcxubaDHQrAqQsFp1aRaciy+ggtBSs4pcVuZMl31RA9
	12f0lFF6wocyYrcQbicJzZHMGEEUhdmTVsz6/bhpATtLpw3rrZUgnm3RF196GsZk0Bvj
	qqCu3Uesjk+PyAbc0ikXprbZvueY0IARTd6HS7e6CLIlMR6LxzOzlctFuZ1865D8p9cX
	Jdn6TiLstElOG7gcpc80L9nlfaY8QbKpUwkhlrr+WEIBfZ8jA6/jea9itdNZQlen5sds
	CdDQ==
X-Gm-Message-State: AE9vXwPJ0QFx6kZBDWL+IgYGvK62waqooibb/pxw47B8z9u+zuQnFoYRfMkO2eU0YFgrYg==
X-Received: by 10.25.16.35 with SMTP id f35mr6342728lfi.160.1474906890062;
	Mon, 26 Sep 2016 09:21:30 -0700 (PDT)
Received: from localhost.localdomain (m77-218-250-198.cust.tele2.se.
	[77.218.250.198])
	by smtp.gmail.com with ESMTPSA id e3sm3865958lji.31.2016.09.26.09.21.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 26 Sep 2016 09:21:28 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 Sep 2016 18:21:32 +0200
Message-Id: <1474906892-3842-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 1.9.1
Cc: yue.tao@windriver.com, Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [meta-networking] [PATCH] atftp: fixes musl libc build
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
X-List-Received-Date: Mon, 26 Sep 2016 16:21:30 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

The patches derive from buildroot:
https://git.busybox.net/buildroot/commit/?id=ef33c008e3c5048d1442f8b0f6336db2fa8d79a1

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 ...gz.h-fix-musl-compile-add-missing-defines.patch | 45 ++++++++++++++++++++++
 ...-tftpd.h-fix-musl-compile-missing-include.patch | 43 +++++++++++++++++++++
 meta-networking/recipes-daemons/atftp/atftp_git.bb |  4 ++
 3 files changed, 92 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/atftp/atftp/0001-argz.h-fix-musl-compile-add-missing-defines.patch
 create mode 100644 meta-networking/recipes-daemons/atftp/atftp/0002-tftp.h-tftpd.h-fix-musl-compile-missing-include.patch

diff --git a/meta-networking/recipes-daemons/atftp/atftp/0001-argz.h-fix-musl-compile-add-missing-defines.patch b/meta-networking/recipes-daemons/atftp/atftp/0001-argz.h-fix-musl-compile-add-missing-defines.patch
new file mode 100644
index 0000000..cfa8a73
--- /dev/null
+++ b/meta-networking/recipes-daemons/atftp/atftp/0001-argz.h-fix-musl-compile-add-missing-defines.patch
@@ -0,0 +1,45 @@
+From 543e67919f5cacf309ac88ab091331e41af4224b Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Thu, 16 Apr 2015 22:41:57 +0200
+Subject: [PATCH] argz.h: fix musl compile (add missing defines)
+
+Upstream-Status: Pending
+
+Add __THROW, __BEGIN_DECLS, __END_DECLS and __attribute_pure__ defines.
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
+---
+ argz.h | 16 ++++++++++++++++
+ 1 file changed, 16 insertions(+)
+
+diff --git a/argz.h b/argz.h
+index 582be55..bdf9f62 100644
+--- a/argz.h
++++ b/argz.h
+@@ -48,6 +48,22 @@
+ # define __const const
+ #endif
+ 
++#ifndef __THROW
++# define __THROW
++#endif
++
++#ifndef __BEGIN_DECLS
++# define __BEGIN_DECLS
++#endif
++
++#ifndef __END_DECLS
++# define __END_DECLS
++#endif
++
++#ifndef __attribute_pure__
++# define __attribute_pure__
++#endif
++
+ #ifndef __error_t_defined
+ typedef int error_t;
+ #endif
+-- 
+2.1.4
+
diff --git a/meta-networking/recipes-daemons/atftp/atftp/0002-tftp.h-tftpd.h-fix-musl-compile-missing-include.patch b/meta-networking/recipes-daemons/atftp/atftp/0002-tftp.h-tftpd.h-fix-musl-compile-missing-include.patch
new file mode 100644
index 0000000..093054c
--- /dev/null
+++ b/meta-networking/recipes-daemons/atftp/atftp/0002-tftp.h-tftpd.h-fix-musl-compile-missing-include.patch
@@ -0,0 +1,43 @@
+From 77e399899d9d7297d23c321811b628febdf0fd92 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Thu, 16 Apr 2015 22:43:49 +0200
+Subject: [PATCH] tftp.h/tftpd.h: fix musl compile (missing include)
+
+Upstream-Status: Pending
+
+Add sys/types.h include for u_char typedef.
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
+---
+ tftp.h  | 1 +
+ tftpd.h | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/tftp.h b/tftp.h
+index 12bd6aa..32a3f63 100644
+--- a/tftp.h
++++ b/tftp.h
+@@ -19,6 +19,7 @@
+ 
+ #include <sys/time.h>
+ #include <sys/times.h>
++#include <sys/types.h>
+ #include "tftp_def.h"
+ #include "config.h"
+ 
+diff --git a/tftpd.h b/tftpd.h
+index 945065e..60d3a49 100644
+--- a/tftpd.h
++++ b/tftpd.h
+@@ -20,6 +20,7 @@
+ #include <pthread.h>
+ #include <arpa/tftp.h>
+ #include <arpa/inet.h>
++#include <sys/types.h>
+ #include "tftp_io.h"
+ 
+ /*
+-- 
+2.1.4
+
diff --git a/meta-networking/recipes-daemons/atftp/atftp_git.bb b/meta-networking/recipes-daemons/atftp/atftp_git.bb
index b222c34..a9949d5 100644
--- a/meta-networking/recipes-daemons/atftp/atftp_git.bb
+++ b/meta-networking/recipes-daemons/atftp/atftp_git.bb
@@ -15,6 +15,10 @@ SRC_URI = "git://git.code.sf.net/p/atftp/code \
            file://atftpd.service \
            file://atftp-0.7-sorcerers_apprentice.patch \
 "
+SRC_URI_append_libc-musl = " file://0001-argz.h-fix-musl-compile-add-missing-defines.patch \
+                             file://0002-tftp.h-tftpd.h-fix-musl-compile-missing-include.patch \
+                           "
+
 S = "${WORKDIR}/git"
 
 inherit autotools update-rc.d systemd
-- 
1.9.1


