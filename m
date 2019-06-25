Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by mail.openembedded.org (Postfix) with ESMTP id 61C3E6C230
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jun 2019 07:52:32 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id w20so18121124edd.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jun 2019 00:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=93lA0f4bfTsdUvytvdJ4eGQmnaIIyQcR0kp+teSxpFM=;
	b=T2RGttR64bMbTeBT4Jgl1Yol8TB3+XFmmmQTmY15SvHTS0jysxoGWSF7UQTcJ1GgF/
	gf5fpf2Qd7AoCA/ewoZ8Fsx8kTb1w5SsfvgpPrDI9ucSkNGFL+a1gIALgPFAC+O2VPxn
	OyDjJIJBHJrAHevTujE/3pDN2B61qssCHSkvcCNkWekj4ohCplqqRvwMXeA1Dggthwwt
	sH4iyZiwROkmlgqKAyZ0qvn27lttfEINt9m4O19kR3CNdzX1vj6c42V6s61VMNSgGchT
	uv9F6/B4jXd/gXimVP/iNctpugRusKvr4OhyzMqgXi3ahbhEz3dx3ScKqDZ31wKS82yx
	eHcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=93lA0f4bfTsdUvytvdJ4eGQmnaIIyQcR0kp+teSxpFM=;
	b=CXv8aifWZUkn/xo1oFfc3zrXcFcr+Zf3IzDGNBCILZNlYaxpT7jmFYY2/stcU1FR6P
	Ukr8t1P9JrdMzMiC4Er48FNku8+Ym8Uvdc7rclB6PfCZZNsbn4PhDajAUMYgJ+Hr+aIB
	kLDr7MoBF2cJhNduKbMyknQYQf1gWWT7rxvxGKUBlHFZ9r/x/sSshH2R6CUqPv6I8NVB
	AYEblMaGQ0RWsq3zg10W7kZZOfVSU4tx9JuJg6TqWdZUED82B8XoFQNmfFBFZKRS85l+
	AC1OM238GX5S6MzuQjrbrCuT9tYEC+E8jReyeQLjZ0EZgRQbQeAMQXs73gogAa+H++qa
	LWWw==
X-Gm-Message-State: APjAAAWoMjPufQEpTDj9/IOZN/mfyyNzXbYSFy1q15N4P3kPiqdDyTMH
	QgTsM8Kp3u1nJdXGUbwCAwVfVS+BMu8=
X-Google-Smtp-Source: APXvYqxeF/0EjvnM4ncO4OLh/YEnqqt7KYnAFSKlRbBUy8BZDpeyAA3PA+4wa8nnfy+lqkOmGKEdjw==
X-Received: by 2002:a17:906:45d7:: with SMTP id
	z23mr82182625ejq.54.1561449152811; 
	Tue, 25 Jun 2019 00:52:32 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id
	y22sm4308640edw.94.2019.06.25.00.52.31
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 25 Jun 2019 00:52:31 -0700 (PDT)
Sender: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
From: Ricardo Ribalda Delgado <ricardo@ribalda.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 25 Jun 2019 09:52:04 +0200
Message-Id: <20190625075223.13585-5-ricardo@ribalda.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190625075223.13585-1-ricardo@ribalda.com>
References: <20190625075223.13585-1-ricardo@ribalda.com>
MIME-Version: 1.0
Cc: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Subject: [meta-java][PATCH 04/23] classpath: Fix build with targets aarch64
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
X-List-Received-Date: Tue, 25 Jun 2019 07:52:32 -0000
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


