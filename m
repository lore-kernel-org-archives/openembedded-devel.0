Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f177.google.com (mail-pf0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id DF44B77FFE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jun 2017 02:08:39 +0000 (UTC)
Received: by mail-pf0-f177.google.com with SMTP id q86so25368384pfl.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Jun 2017 19:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=V0cvMaCtUtYkFG7Wt8DnhA3b96ElrrUmR3MWXZT5wXI=;
	b=bePoO9piVNNIeNNWmp92Mzn1WAaYS+9/0E6U+7MflOYY362jXXmC/Jqn6pjPYJRdim
	BaJkCgoNYdoCeoG5NfbpbOPGNYgbJ62Gh2qrlhJ79RQCjsGa+KOVGEay/eE3WLhilCE5
	s4eK+XgULOJccBmUxYWzAxCx60F16kx1cedI/FsnCN8S/TG4ddEryiMNo/IrekQgd8vp
	jpTuJv3xk41mo9XfURRCdG+MBS79bb0Dkss8pqg+j9SiaUvE4dNg11qlOyS+7Mxj5bhG
	5yNY2iauGX1lfFf9s/bFKJqWhf+FeqPSWpWykYBL5/gtWCTbH4ed1YK+hWW1XW8PBFYY
	bxdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=V0cvMaCtUtYkFG7Wt8DnhA3b96ElrrUmR3MWXZT5wXI=;
	b=bi83XJ/7Puk5WfF2+vKYUdI2ts1cDS60qIrB7XFEj0utYZTrfVMvKgENBh+VmNDW//
	EACgv29f56UvwaYi/vjzpLNBpVO70IIsSBj9tAkBsN4qE4yJvimjYISHP6Zq2mKoow64
	19m4eaGU0O7rv1J95Y1COb/0AUcSgqcfB+/dkSSR3uIupTsTjp0tYXBMuV6qTQcH5zSu
	vPVtj2dWCTS44sHM0qCRTNzq2oaeqIHQ1iTIZXapVqEQks6amAGigneMEfS0POXQsXKC
	CGCl+FAcwrAaWfYy7RodTjJCP/6e/lmFFHJUzCjRuEKKdl5ZIlGJQNav/UVOyRO+IDit
	Dm0w==
X-Gm-Message-State: AKS2vOwI3mN+f8Oye1ieXKQs8GyTytnykcnheMEyMR1M4+uVPV6CdR72
	mXn8arHuaVugrhOg
X-Received: by 10.98.58.11 with SMTP id h11mr3540728pfa.148.1498615720450;
	Tue, 27 Jun 2017 19:08:40 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id b8sm1003591pfd.65.2017.06.27.19.08.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Jun 2017 19:08:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Jun 2017 19:08:09 -0700
Message-Id: <20170628020819.17047-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170628020819.17047-1-raj.khem@gmail.com>
References: <20170628020819.17047-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 03/13] strongswan: Include stdint.h for uintptr_t
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
X-List-Received-Date: Wed, 28 Jun 2017 02:08:40 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...1-memory.h-Include-stdint.h-for-uintptr_t.patch | 26 ++++++++++++++++++++++
 .../recipes-support/strongswan/strongswan_5.5.3.bb |  5 +++--
 2 files changed, 29 insertions(+), 2 deletions(-)
 create mode 100644 meta-networking/recipes-support/strongswan/files/0001-memory.h-Include-stdint.h-for-uintptr_t.patch

diff --git a/meta-networking/recipes-support/strongswan/files/0001-memory.h-Include-stdint.h-for-uintptr_t.patch b/meta-networking/recipes-support/strongswan/files/0001-memory.h-Include-stdint.h-for-uintptr_t.patch
new file mode 100644
index 000000000..7ebc39818
--- /dev/null
+++ b/meta-networking/recipes-support/strongswan/files/0001-memory.h-Include-stdint.h-for-uintptr_t.patch
@@ -0,0 +1,26 @@
+From 2a3ab04bbdc4624792886aa51579eadb427ef99e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 27 Jun 2017 07:42:11 -0700
+Subject: [PATCH] memory.h: Include stdint.h for uintptr_t
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/libstrongswan/utils/utils/memory.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/libstrongswan/utils/utils/memory.h b/src/libstrongswan/utils/utils/memory.h
+index b978e7c..55aaaf5 100644
+--- a/src/libstrongswan/utils/utils/memory.h
++++ b/src/libstrongswan/utils/utils/memory.h
+@@ -22,6 +22,8 @@
+ #ifndef MEMORY_H_
+ #define MEMORY_H_
+ 
++#include <stdint.h>
++
+ /**
+  * Helper function that compares two binary blobs for equality
+  */
+-- 
+2.13.2
+
diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.5.3.bb b/meta-networking/recipes-support/strongswan/strongswan_5.5.3.bb
index 9215233b1..3fb56bcfe 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_5.5.3.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_5.5.3.bb
@@ -8,8 +8,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "gmp openssl flex-native flex bison-native"
 
 SRC_URI = "http://download.strongswan.org/strongswan-${PV}.tar.bz2 \
-        file://fix-funtion-parameter.patch \
-"
+           file://fix-funtion-parameter.patch \
+           file://0001-memory.h-Include-stdint.h-for-uintptr_t.patch \
+           "
 
 SRC_URI[md5sum] = "4afffe3c219bb2e04f09510905af836b"
 SRC_URI[sha256sum] = "c5ea54b199174708de11af9b8f4ecf28b5b0743d4bc0e380e741f25b28c0f8d4"
-- 
2.13.2


