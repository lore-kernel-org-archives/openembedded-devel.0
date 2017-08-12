Return-Path: <jpuhlman@mvista.com>
Received: from mail-pg0-f44.google.com (mail-pg0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id C1A94700F0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Aug 2017 22:04:33 +0000 (UTC)
Received: by mail-pg0-f44.google.com with SMTP id v189so27865212pgd.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Aug 2017 15:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=7j1rvZF/kxSaxIoinqvnOUV/+JPQTN2FPSfOoh8H664=;
	b=aMPDkmUr500vl8I1jVBLjR5DPlgyEf9JTNzihQw92b0XNXYhfvNTc0Y+/SJKuwMYE7
	PI95U4uQg3VMUe4c/RE8/OCHLDkXQHU3pku67PTvhn+fXXPVUDhORcZcY6imr6wJwY+9
	JVrkmtH8Aj4TsuB4gQRQYW4rZ9FEMAwm/c/NZBiUIyMX61D2Oo3S3XABoAOo9bd5cnKm
	X4cNMilQUrKOYSpQDajtj9u6zVpwZGNqzWkb37zBTBFBmYGee46ASwcVQouiMqa8bEIE
	8H2eLRaM4CR3MpywZQ89OD3yltKvuhw3x5RwLkqhIx2WcJLDuvdqnorSRiNMr1L6daDI
	hqNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=7j1rvZF/kxSaxIoinqvnOUV/+JPQTN2FPSfOoh8H664=;
	b=RdRUzWUEwasWXDpKAehumGLGmwVa5SHok0cEWSL8mAbuuOd5+nD3ixbNJfJZN+koSn
	WouDyBc2fzPhkswmtZ+oXuJgcOx3WdjEEWZHKosuN3pNkcFLIrUYPYlcCNnie82+yt+D
	cgu4NbLhqtrN5WLqJFnuJAb37JEFxQt9XxChIasFoyDNHKuTw38OrPBgDLJnLNTEJOwX
	7Kptyipg/wFmuRmVcrZqrRcWGTr6ZbJqJQnP1wgIQmvPFp8ZLk3EvSHwsgUdTBxDEU2/
	sz8lO39Vp6PEcBYOBzS7X2ahQapK1sF9RXBd6hs2n4Pw+PNLyPpmgZVTzbMXQ+La2rJk
	q7Nw==
X-Gm-Message-State: AHYfb5haeoPTDlBbr/CBXxShV6arVJyALyQhlqlQ5t+eMTUsHlKoF6Xn
	H95gMObLjCnG/zLor+o=
X-Received: by 10.84.231.198 with SMTP id g6mr13984853pln.36.1502575474336;
	Sat, 12 Aug 2017 15:04:34 -0700 (PDT)
Received: from workhorse.mvista.com
	(99-0-9-164.lightspeed.frokca.sbcglobal.net. [99.0.9.164])
	by smtp.gmail.com with ESMTPSA id
	l22sm8874651pfj.138.2017.08.12.15.04.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 12 Aug 2017 15:04:33 -0700 (PDT)
From: Jeremy Puhlman <jpuhlman@mvista.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 12 Aug 2017 15:03:59 -0700
Message-Id: <1502575439-5591-1-git-send-email-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.6.2
Subject: [meta-networking][PATCH] Strongswan: Add stdint.h to resolve build failure
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
X-List-Received-Date: Sat, 12 Aug 2017 22:04:33 -0000

From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>

In file included from
../../../strongswan-5.5.3/src/libstrongswan/utils/utils.h:55:0,
                 from
../../../strongswan-5.5.3/src/libstrongswan/library.h:101,
                 from
../../../strongswan-5.5.3/src/libstrongswan/library.c:17:
../../../strongswan-5.5.3/src/libstrongswan/utils/utils/memory.h: In
function 'memwipe_inline':
../../../strongswan-5.5.3/src/libstrongswan/utils/utils/memory.h:99:15:
error: 'uintptr_t' undeclared (first use in this function); did you mean
'__intptr_t'?
  for (i = 0; (uintptr_t)&c[i] % sizeof(long) && i < n; i++)
               ^~~~~~~~~
               __intptr_t
../../../strongswan-5.5.3/src/libstrongswan/utils/utils/memory.h:99:15:
note: each undeclared identifier is reported only once for each function
it appears in

Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
---
 .../strongswan/files/strongswan-gcc-7.patch        | 25 ++++++++++++++++++++++
 .../recipes-support/strongswan/strongswan_5.5.3.bb |  1 +
 2 files changed, 26 insertions(+)
 create mode 100644 meta-networking/recipes-support/strongswan/files/strongswan-gcc-7.patch

diff --git a/meta-networking/recipes-support/strongswan/files/strongswan-gcc-7.patch b/meta-networking/recipes-support/strongswan/files/strongswan-gcc-7.patch
new file mode 100644
index 0000000..388261b
--- /dev/null
+++ b/meta-networking/recipes-support/strongswan/files/strongswan-gcc-7.patch
@@ -0,0 +1,25 @@
+Fix missing definition of uintptr_t after the switch to gcc 7
+
+In file included from ../../../strongswan-5.5.3/src/libstrongswan/utils/utils.h:55:0,
+                 from ../../../strongswan-5.5.3/src/libstrongswan/library.h:101,
+                 from ../../../strongswan-5.5.3/src/libstrongswan/library.c:17:
+../../../strongswan-5.5.3/src/libstrongswan/utils/utils/memory.h: In function 'memwipe_inline':
+../../../strongswan-5.5.3/src/libstrongswan/utils/utils/memory.h:99:15: error: 'uintptr_t' undeclared (first use in this function); did you mean '__intptr_t'?
+  for (i = 0; (uintptr_t)&c[i] % sizeof(long) && i < n; i++)
+               ^~~~~~~~~
+               __intptr_t
+../../../strongswan-5.5.3/src/libstrongswan/utils/utils/memory.h:99:15: note: each undeclared identifier is reported only once for each function it appears in
+
+Upstream-Status: pending
+
+--- strongswan-5.5.3-orig/src/libstrongswan/utils/utils/memory.h	2016-04-22 13:01:35.000000000 -0700
++++ strongswan-5.5.3/src/libstrongswan/utils/utils/memory.h	2017-08-12 14:41:04.757398239 -0700
+@@ -22,6 +22,8 @@
+ #ifndef MEMORY_H_
+ #define MEMORY_H_
+ 
++#include <stdint.h>
++
+ /**
+  * Helper function that compares two binary blobs for equality
+  */
diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.5.3.bb b/meta-networking/recipes-support/strongswan/strongswan_5.5.3.bb
index 9215233..680d338 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_5.5.3.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_5.5.3.bb
@@ -9,6 +9,7 @@ DEPENDS = "gmp openssl flex-native flex bison-native"
 
 SRC_URI = "http://download.strongswan.org/strongswan-${PV}.tar.bz2 \
         file://fix-funtion-parameter.patch \
+        file://strongswan-gcc-7.patch \
 "
 
 SRC_URI[md5sum] = "4afffe3c219bb2e04f09510905af836b"
-- 
2.6.2


