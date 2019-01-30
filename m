Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 7A8087C1F4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jan 2019 05:29:27 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id c73so10860089pfe.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Jan 2019 21:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=VkH6593TmdzyKwsha9ayCQUF5y5vKOLfF8jZgKcJyxo=;
	b=eOWPkbLwVOBWQHoQViD7qiUIKrTzptVJIWhbES3a4vLf6g0V2Kj3a+dkT2BVle9/nl
	wyxKDuZsHsUCZI4DRCkyWJh+GWrOL/kV58RwqNk/dO6oR+U3beEcByUMKjv/DK7l+qzh
	nJIhFDsPU1C+oXi1sPW1VD3cJG7gpQKz+AFrRxEfdiMjD3pIhlWs1dY8S3id7BUhwb9C
	RF2Iz9wC24gM9XYxKseeQHuc1IZU08kDc++dRgEAMjh4W79o5f4UZF3pg4ltwsq3zzRk
	BqJOBzgsC4acEWxhRrVqPTkAES3kpliqKREFIrskxfzlGljFkuaxDpETWlT4V1nv5+Zb
	r57Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=VkH6593TmdzyKwsha9ayCQUF5y5vKOLfF8jZgKcJyxo=;
	b=Shxj20W8IQ62pXmNImhIledoXLz+YUzqGK0ljnVCJ25x3VJZVI5wNSD4RzmDeEGCtE
	S1hecctiNOsJahY665i1twcHCmKdQUFu9C2kEuuNB8d9LhUXTfxO1uPoYwYpH/90b2cj
	0CWGQZY2KXHHWv96U9XAgf605plRCKm3F82f+MCnBh1XqA5OZ0is7ZL4g/8B2mMLFmfj
	BrgF9xAh+tqRM7NhgArdGbS9BDLGUMEhk4whD8c6JOZtCGHtEnQJTVI8/UYgPykZOw7z
	eRoVzFcOWpFrZbuX7uK5NEg6IieLFWC41Oxyavr3P5HvhTyiqWfkPuqpaGm2/68D9NkV
	oK6g==
X-Gm-Message-State: AJcUukcek0VGf9uHrpqXnSbLAb0KvzBV6zZ7WQwGGYMg8rDuNct4isiM
	GmCnagmgYPrPqaYQYcvAZROdNo9QHvc=
X-Google-Smtp-Source: ALg8bN5FiO4Kyj80nZp0MwCXmzeebQbDqnsnOqtoCUgogbqUwSuDB3Lm1tGcCMuPn+j0xAZYsMJdYQ==
X-Received: by 2002:a62:5f07:: with SMTP id t7mr28958690pfb.108.1548826168284; 
	Tue, 29 Jan 2019 21:29:28 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::26b6])
	by smtp.gmail.com with ESMTPSA id
	v190sm652633pfv.26.2019.01.29.21.29.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 Jan 2019 21:29:27 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Jan 2019 21:29:11 -0800
Message-Id: <20190130052911.36336-8-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190130052911.36336-1-raj.khem@gmail.com>
References: <20190130052911.36336-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 8/8] mozjs: Fix symbol visibility with clang/libc++
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
X-List-Received-Date: Wed, 30 Jan 2019 05:29:27 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../mozjs/mozjs/JS_PUBLIC_API.patch           | 37 +++++++++++++++++++
 .../recipes-extended/mozjs/mozjs_52.9.1.bb    |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta-oe/recipes-extended/mozjs/mozjs/JS_PUBLIC_API.patch

diff --git a/meta-oe/recipes-extended/mozjs/mozjs/JS_PUBLIC_API.patch b/meta-oe/recipes-extended/mozjs/mozjs/JS_PUBLIC_API.patch
new file mode 100644
index 0000000000..6c87ff2a4c
--- /dev/null
+++ b/meta-oe/recipes-extended/mozjs/mozjs/JS_PUBLIC_API.patch
@@ -0,0 +1,37 @@
+Patch from https://bugzilla.mozilla.org/show_bug.cgi?id=1426865
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Submitted [https://bugzilla.mozilla.org/show_bug.cgi?id=1426865]
+--- a/js/public/TypeDecls.h
++++ b/js/public/TypeDecls.h
+@@ -21,22 +21,23 @@
+ #include <stdint.h>
+ 
+ #include "js-config.h"
++#include "jstypes.h"
+ 
+ struct JSContext;
+-class JSFunction;
++class JS_PUBLIC_API(JSFunction);
+ class JSObject;
+-class JSScript;
+-class JSString;
+-class JSAddonId;
++class JS_PUBLIC_API(JSScript);
++class JS_PUBLIC_API(JSString);
++class JS_PUBLIC_API(JSAddonId);
+ 
+-struct jsid;
++struct JS_PUBLIC_API(jsid);
+ 
+ namespace JS {
+ 
+ typedef unsigned char Latin1Char;
+ 
+-class Symbol;
+-class Value;
++class JS_PUBLIC_API(Symbol);
++class JS_PUBLIC_API(Value);
+ template <typename T> class Handle;
+ template <typename T> class MutableHandle;
+ template <typename T> class Rooted;
diff --git a/meta-oe/recipes-extended/mozjs/mozjs_52.9.1.bb b/meta-oe/recipes-extended/mozjs/mozjs_52.9.1.bb
index a28ecc57d6..74dd15bfcb 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs_52.9.1.bb
+++ b/meta-oe/recipes-extended/mozjs/mozjs_52.9.1.bb
@@ -15,6 +15,7 @@ SRC_URI = "http://archive.ubuntu.com/ubuntu/pool/main/m/mozjs52/mozjs52_52.9.1.o
            file://add-riscv-support.patch \
            file://0001-mozjs-fix-coredump-caused-by-getenv.patch \
            file://format-overflow.patch \
+           file://JS_PUBLIC_API.patch \
            "
 SRC_URI_append_libc-musl = " \
            file://0006-support-musl.patch \
-- 
2.20.1


