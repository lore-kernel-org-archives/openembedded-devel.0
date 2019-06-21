Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67])
	by mail.openembedded.org (Postfix) with ESMTP id 919A47CF98
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Jun 2019 08:31:38 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id r12so8903697edo.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Jun 2019 01:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=93lA0f4bfTsdUvytvdJ4eGQmnaIIyQcR0kp+teSxpFM=;
	b=fBV9GMBIHIz2UYXwf0r0qcbecsHX1jv9xM/x7uqvhKJyVgaFhITWV4Upz73Y4uq93h
	oaJmAmahAGpvokc5Z4RcrSHQrgARFmbUY4EyXgjcbsKGXVaLBlC0LsmJtqRZfti8MeLV
	F7hAs5029fExjNG8SWLxThx4/7dsSveQ3qRFR+A9HPg16BjAAqxj0fg9tZOAmBcb35PX
	bmKN8yHFnViwF2cz1JGBEB7epRfqHU10ybkR8Whx94WFtCCb9rMoFmrxM+Lm7h8ulgXV
	B2s8gXgTa+e7ZGQZtiTyWFnCRfBYQxidoaSWxh+w+/CCBBhQTBGgWjDHLGiYbGWSuMl8
	U9VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=93lA0f4bfTsdUvytvdJ4eGQmnaIIyQcR0kp+teSxpFM=;
	b=fpnJQFzic1DzzAOAyN+pPJEASD5lUOOgXDPdqP7WdZ8HTZNhObOapLOtxefLEcJPlh
	xTBFfa5RDsOix/F/FMOvDsbWrRdp6I9tGUDdWzJ/D/sd5Vd82cNBaK1cwgEDq8uZfVcY
	b70fSttwUY6uT3T/eo08JjvZKffvTj0IPS2IKzXxkEMCuXdXnE9BLu26kzN8b9XQJ1qp
	OxKmrRHLl8tww9JtnRHHmeEFYe5mBQX9R5TUKIGKyKvWBCceKbSO3KqE1XGb+Griogg6
	70DslYO2q/lzuZ/S0c9zRogT3LaFeB0FrQoDAeP2Bf92AcrbO/kUlmObJ5ONwH3mEZfw
	Q8vg==
X-Gm-Message-State: APjAAAX6h1eaKgeN40G53+gfRaL0/xOMks0SuiaWuR291f8t7B1WGa4K
	fx7BRuKmiJmm1A2Gs9IawGz5njC0o6U=
X-Google-Smtp-Source: APXvYqxpQkFUXKWnfsWv6OZTrJ1tNQA0W+quYH8vucmaB4EVSUZ6GkGdfSRkbwwh6/5O9Lwo1ZDYvA==
X-Received: by 2002:a17:906:4882:: with SMTP id
	v2mr40950551ejq.100.1561105898947; 
	Fri, 21 Jun 2019 01:31:38 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id 93sm617455edk.84.2019.06.21.01.31.37
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 21 Jun 2019 01:31:38 -0700 (PDT)
Sender: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
From: Ricardo Ribalda Delgado <ricardo@ribalda.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 21 Jun 2019 10:31:36 +0200
Message-Id: <20190621083136.21492-1-ricardo@ribalda.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Subject: [meta-java][PATCH] classpath: Fix build with aarch64
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
X-List-Received-Date: Fri, 21 Jun 2019 08:31:38 -0000
Content-Transfer-Encoding: 8bit

Fixes:
| In file included from ../../../classpath-0.99/native/fdlibm/fdlibm.h:36,
|                  from ../../../classpath-0.99/native/fdlibm/e_exp.c:76:
| ../../../classpath-0.99/native/fdlibm/ieeefp.h:163:2: error: #error Endianess not declared!!
|  #error Endianess not declared!!
|   ^~~~~
| In file included from ../../classpath-0.99/native/fdlibm/fdlibm.h:40,

Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
---
 .../classpath/classpath-0.99/aarch64.patch    | 19 +++++++++++++++++++
 recipes-core/classpath/classpath_0.99.bb      |  1 +
 2 files changed, 20 insertions(+)
 create mode 100644 recipes-core/classpath/classpath-0.99/aarch64.patch

diff --git a/recipes-core/classpath/classpath-0.99/aarch64.patch b/recipes-core/classpath/classpath-0.99/aarch64.patch
new file mode 100644
index 0000000..4de40fb
--- /dev/null
+++ b/recipes-core/classpath/classpath-0.99/aarch64.patch
@@ -0,0 +1,19 @@
+Upstream-Status: Inappropriate [upstream is dead]
+
+Signed-off-by: Ricardo Ribalda <ricardo@ribalda.com>
+
+diff --git a/native/fdlibm/ieeefp.h b/native/fdlibm/ieeefp.h
+index c230bbb..700dd3a 100644
+--- a/native/fdlibm/ieeefp.h
++++ b/native/fdlibm/ieeefp.h
+@@ -158,6 +158,10 @@
+ #define __IEEE_BIG_ENDIAN
+ #endif
+ 
++#ifdef __aarch64__
++#define __IEEE_LITTLE_ENDIAN
++#endif
++
+ #ifndef __IEEE_BIG_ENDIAN
+ #ifndef __IEEE_LITTLE_ENDIAN
+ #error Endianess not declared!!
diff --git a/recipes-core/classpath/classpath_0.99.bb b/recipes-core/classpath/classpath_0.99.bb
index 6aa3baa..714503a 100644
--- a/recipes-core/classpath/classpath_0.99.bb
+++ b/recipes-core/classpath/classpath_0.99.bb
@@ -14,6 +14,7 @@ SRC_URI += " \
             file://toolwrapper-exithook.patch \
             file://use_libdir.patch \
             file://freetype2.patch \
+            file://aarch64.patch \
            "
 
 SRC_URI[md5sum] = "0ae1571249172acd82488724a3b8acb4"
-- 
2.20.1


