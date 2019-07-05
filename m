Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
	[209.85.208.54])
	by mail.openembedded.org (Postfix) with ESMTP id DD1B27ECEE
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Jul 2019 11:18:49 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id w13so7951128eds.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Jul 2019 04:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=93lA0f4bfTsdUvytvdJ4eGQmnaIIyQcR0kp+teSxpFM=;
	b=M0pj1GvYFHL/O3fJc72oTyCIq8N6KLpJyAAL8YqfU/xc0bvwtiYybq41jiCj4++J0k
	tdIG5EJe4rwSHgF/h6uE9jM96TgihzVXFPH2xaxy+qW1nVKIH2F27Q1alWZPeYvN44Pu
	+907U3KEVNWLMQsM/6VyocnGNpp633A2kttD0zFX5lnZJa82ow6DsNAAo0dQzcML4Qqv
	bHMI2mIFQOCcxexZDT6KKKqJ1vSqgMlHnerP/6sl4DV//bZPDR5IIpbZpTwKyy3Qgn8k
	YvV051dIVGB7qJulw9Nij/VWxWd85p1uMX5PAbMVnw9W2dOl+Lgkhh1w6L+H5agsS70G
	gI2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=93lA0f4bfTsdUvytvdJ4eGQmnaIIyQcR0kp+teSxpFM=;
	b=XbFfdGD7XqpbJ9MfdyWyp5qTXGAup+8Fg3fPXf3Dj6+kqRNUbXtL4ihWPMXJBUn1tz
	W2khF9vh2BhMuxLYf5o+KEyvlvUzjg7B4S4Y2DOQCCQggUX/zDsuYAq0pCvYWLqzjtjB
	6XEiAodbA+mQ4jAZhp5J5YPIOZJcYhi2E3oGNqIkGb50L9N47IJdKD+eph4wep07gBja
	rvX9k/tgIwlUEcbB53r5CSe8/UQ7TG7IGDuRu/BUVdZGCCABDDuAtkYNIzMsl6d80bvF
	aukz2Zwy9cCbcPjbeae2aAOMK0WPfSjTnGbh/Vrmtg5URWhMbTeX54Nz303Zp7ttcmum
	l0qg==
X-Gm-Message-State: APjAAAUBuRPh+r/mxxvEcCJfGQCikofq8e+5Bwjt7/3FSGhbWLX2inLO
	otbYsTgUfzDK7xU0eFT+RzGHzoodSnA=
X-Google-Smtp-Source: APXvYqzbmNS8v19EOt6Ap4/zp0b2FyTkWY1vIX0cgsaUMeHrTyQb2MyfjJEuhLxyhkrxd62Uf54NTQ==
X-Received: by 2002:a17:906:94ce:: with SMTP id
	d14mr3011439ejy.251.1562325530317; 
	Fri, 05 Jul 2019 04:18:50 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id h10sm136604edh.64.2019.07.05.04.18.49
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 05 Jul 2019 04:18:49 -0700 (PDT)
Sender: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
From: Ricardo Ribalda Delgado <ricardo@ribalda.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  5 Jul 2019 13:18:05 +0200
Message-Id: <20190705111824.22255-5-ricardo@ribalda.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190705111824.22255-1-ricardo@ribalda.com>
References: <20190705111824.22255-1-ricardo@ribalda.com>
MIME-Version: 1.0
Cc: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Subject: [meta-java][PATCH v4 04/23] classpath: Fix build with targets aarch64
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
X-List-Received-Date: Fri, 05 Jul 2019 11:18:50 -0000
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


