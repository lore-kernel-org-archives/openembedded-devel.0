Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by mail.openembedded.org (Postfix) with ESMTP id 73CEA7ED21
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Jul 2019 11:18:57 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id v15so1297654eds.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Jul 2019 04:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=m9aSAk9d/bgKXTmXATTFgyDa5v4oI8VmMcaUWB34WkQ=;
	b=PisTvw+uEivHu2syrRy/VeZAtWsFfgbtS7eWRH5Ph0YpOhLrs57POC0dWc7ExW0Pm3
	5Yk1CCVX0q9vxAa4WELbB1rxPAgc6sypaFqNhiFXl6w9mkxVrfpmvXWk4TS7njXmtOSr
	/5ELFl3TktLTogaTHEIMBaEIPwHBdGWLc+o2NdNeTcAQM6JiCnlnEwZYiVBbZBC6+nep
	08SbyAU6x1exsO0ottxi1zWtTzt5huElu094pDhAhst2YET7HkFQbxatkMmC9nOOQOwJ
	vRUKfrUbRIGIP2OsLkxVLrqJeyaWQZb6fBIpXT/9x7065LIODgPTVnb39A6FK3oy+BLC
	ejrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=m9aSAk9d/bgKXTmXATTFgyDa5v4oI8VmMcaUWB34WkQ=;
	b=JbCWkqFhi9S8rc7D3W5OUDkRw5rcKns7GozDHXSoWJPCUWtoyIZvueTD6CsgHTcV3w
	U9Z02KeGNBpd90epXGHnHQkFjZhCeiS9orDRGTS/JWUXXtMkjy4gKhiSMacggO1660e3
	IYdYvuhTeXeHc4N3RExDEb/vELAlYXgHe1ecT6qBtK+zZwAsuWKqKV/tp/jKBxRe6uIw
	cPeBKgJ8f8CX2iy6s4U725GWMnRExUg2VFTiNPIpG9wWMbcDO+Mr+jdTh3KrrVXVf2R3
	aV7WviO/m9msxl3Rv7DHmFxyofd304rKBbaKg2nAGxsru7B2hWoRQQ/Z0wVWe+lH6TOG
	9c3A==
X-Gm-Message-State: APjAAAUXYalieuoTh7s2913i80ugDXOGYkayi+CiAI3HpgRJFwg8tNwC
	GWYv+nFn3Y1l5ZWwKDFBzn4ELAcmUH0=
X-Google-Smtp-Source: APXvYqzDEnkFAp8FPdj51UlQh9ppCwq14QB6aqgJTZ7puU3cqmiZ9YjzeC91TtuvAb6RqkGqlCmswQ==
X-Received: by 2002:a17:906:12d7:: with SMTP id
	l23mr2971209ejb.282.1562325538039; 
	Fri, 05 Jul 2019 04:18:58 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id h10sm136604edh.64.2019.07.05.04.18.56
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 05 Jul 2019 04:18:57 -0700 (PDT)
Sender: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
From: Ricardo Ribalda Delgado <ricardo@ribalda.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  5 Jul 2019 13:18:11 +0200
Message-Id: <20190705111824.22255-11-ricardo@ribalda.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190705111824.22255-1-ricardo@ribalda.com>
References: <20190705111824.22255-1-ricardo@ribalda.com>
MIME-Version: 1.0
Cc: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Subject: [meta-java][PATCH v4 10/23] jamvm: Fix binary name for javac
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
X-List-Received-Date: Fri, 05 Jul 2019 11:18:57 -0000
Content-Transfer-Encoding: 8bit

ecj-initial-native is not a dependency, and even if we add it, we get a
compilation error.

Fixes:
| /bin/bash: /workdir/build/tmp/work/dbfp4-poky-linux/jamvm/2.0.0-devel+gitAUTOINC+6cef41d859-r0/recipe-sysroot-native/usr/bin/ecj-initial: No such file or directory
| Makefile:663: recipe for target 'classes.zip' failed

Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
---
 recipes-core/jamvm/jamvm.inc | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/recipes-core/jamvm/jamvm.inc b/recipes-core/jamvm/jamvm.inc
index fc21380..cdf087e 100644
--- a/recipes-core/jamvm/jamvm.inc
+++ b/recipes-core/jamvm/jamvm.inc
@@ -34,8 +34,11 @@ EXTRA_OECONF = "--with-classpath-install-dir=${prefix} --libdir=${libdir}/jamvm
 # Needed for big compilation targets like OpenJDK
 CFLAGS_append_class-native = " -DDEFAULT_MAX_HEAP=1024*MB"
 
+EXTRA_OEMAKE = "JAVAC=${STAGING_BINDIR_NATIVE}/javac \
+                GLIBJ_ZIP=${STAGING_DATADIR_NATIVE}/classpath/glibj.zip \
+               "
 # Enforce usage of ecj-initial.
-EXTRA_OEMAKE = "JAVAC=${STAGING_BINDIR_NATIVE}/ecj-initial \
+EXTRA_OEMAKE_class-native = "JAVAC=${STAGING_BINDIR_NATIVE}/ecj-initial \
                 GLIBJ_ZIP=${STAGING_DATADIR_NATIVE}/classpath/glibj.zip \
                "
 
-- 
2.20.1


