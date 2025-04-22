Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 391FEC369D9
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 17:57:58 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.46953.1745344670709860100
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Apr 2025 10:57:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ufk/H457;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-39c14016868so5517137f8f.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 10:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745344669; x=1745949469; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W2Ik75B+v1pTU1E5i+JATD12WPA53gzuVT++Epu+Ii8=;
        b=Ufk/H457Y3w+HSm3OHEB+kHCVyJtAu2ZqaitFlRNmwhxIhviw83r87uL4zdfnQMNvd
         blL793sh+NSej7Pb/FZxMbpjezLAvMdq4zQpa3lZMXPnoeshSSWKIS8R1oIDJ/aVe7CG
         TMoHultFweIpH5U22DWnFWBJ15H3ccJqcf56YXcOSr4Ko7UaiCAixzkxV6J1G44OTiZ+
         MJHIjNYTMvDHVsNe4TufkAqHh79gZH1sFv3SQ3+PD5tM/m4bic9v9g2SsjZsdgYNQswk
         V17h6oeTpD7BhzVVRCaoEfAjDzhgvgqMunQRNJrEhtUG2aGTziT7hcpJhNIALFDT0ry9
         2yMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745344669; x=1745949469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W2Ik75B+v1pTU1E5i+JATD12WPA53gzuVT++Epu+Ii8=;
        b=j1TBB016O8MLzSxfXhwNVfNNW3W369Hsbol95jBmcHQbQpCK9s4GbdTov6n5geHBrE
         N7ZGryVUDEqYQ2sJG0j9NnjZEaxtRnP3N+JNNSaxBs9tSJnijI0AdtgMItujhM6da71O
         U7J+QmWQmj1gauAIW3hIbrHM6eiwzHzZZoYdhWcyPqUdwl34xEijbZZ5hKyfF9U6oSqj
         9JnEhZYjTXVdkEbJQDlQHOSsK/B/RwRd4Xwf+n1JKNWzctNrhMx1y3eG1xQxTv/pQIEL
         y5uuUvfG/YECzwAsEeVprBEwiFw8HSNRKc4jZH26Al+cm3Xd6/eWU4oLuAx9BAWkuijL
         s3QQ==
X-Gm-Message-State: AOJu0Ywy7TAsV7WZqaQV5003IJSQhwW/CCWVBJpSDAvmajb9Bo/xwIW8
	QizZdGchYdwQkdohMn+nx9jl2CgXF9gklbWwC6s8pGfNhnt0bk47TUniSYCV
X-Gm-Gg: ASbGncuS+Lu/YAK2YrFmhU7sw00wWbM5T/RXhYESZtDRq/UjIhqJMskRcxgNIp4U5f6
	lxxxXRyM2Cujn/kThP15TLbzWNE1IJ/dGQUFZ+4RgIbCq7GKlrdUo7KJhjt/6Egdfhrs93Toa/f
	ag5ca4SboM1fAmcuQ/2WZN23mwrahdrTtXEui66bjYbg2PfabL8STxuT2caUkf0xk/sr1j5q6Ej
	U1vVhCl+kyHdIxtOBEj6o2cY+U4yhObtjWYinfrkGwnpW9nzl63uQsIlDhO58+RygDnEArey8DW
	LN/IBwsuoEHYPajRkt9aGRR0DP3YQQN5LSrjB0mXm41fsw/qPVJS3oC5XB8qTh2LvI99K/fpBA=
	=
X-Google-Smtp-Source: AGHT+IEsQsqs5ebAgRi/M/AuJ9M7RZ9/d/XJ5BUjVXPrdPfBujz//P3hprpqaZMcc525k7emFdUGUA==
X-Received: by 2002:a05:6000:40ce:b0:39c:1ef5:ff8b with SMTP id ffacd0b85a97d-39efbaf2652mr13531943f8f.48.1745344669010;
        Tue, 22 Apr 2025 10:57:49 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39efa4a4be2sm15713858f8f.83.2025.04.22.10.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 10:57:48 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH 2/6] sysdig: fix build with gcc-15
Date: Tue, 22 Apr 2025 19:57:38 +0200
Message-ID: <20250422175742.786560-2-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250422175742.786560-1-martin.jansa@gmail.com>
References: <20250422175742.786560-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 17:57:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117062

From: Martin Jansa <martin.jansa@gmail.com>

fixes:
http://errors.yoctoproject.org/Errors/Details/852848/

In file included from TOPDIR/tmp/work/core2-64-oe-linux/sysdig/0.28.0/git/falcosecurity-libs/userspace/chisel/lua_parser.cpp:20:
TOPDIR/tmp/work/core2-64-oe-linux/sysdig/0.28.0/git/falcosecurity-libs/userspace/libsinsp/./gen_filter.h:87:17: error: 'uint64_t' does not name a type
   87 |         virtual uint64_t get_ts() const = 0;
      |                 ^~~~~~~~

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../0001-libsinsp-fix-build-with-gcc-15.patch | 31 +++++++++++++++++++
 .../recipes-extended/sysdig/sysdig_0.28.0.bb  |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta-oe/recipes-extended/sysdig/sysdig/0001-libsinsp-fix-build-with-gcc-15.patch

diff --git a/meta-oe/recipes-extended/sysdig/sysdig/0001-libsinsp-fix-build-with-gcc-15.patch b/meta-oe/recipes-extended/sysdig/sysdig/0001-libsinsp-fix-build-with-gcc-15.patch
new file mode 100644
index 0000000000..9a81f1c74c
--- /dev/null
+++ b/meta-oe/recipes-extended/sysdig/sysdig/0001-libsinsp-fix-build-with-gcc-15.patch
@@ -0,0 +1,31 @@
+From 47a86dabd065096ffc8818a1cffca96964d18120 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <martin.jansa@gmail.com>
+Date: Tue, 22 Apr 2025 18:43:46 +0200
+Subject: [PATCH] libsinsp: fix build with gcc-15
+
+fixes:
+http://errors.yoctoproject.org/Errors/Details/852848/
+
+In file included from TOPDIR/tmp/work/core2-64-oe-linux/sysdig/0.28.0/git/falcosecurity-libs/userspace/chisel/lua_parser.cpp:20:
+TOPDIR/tmp/work/core2-64-oe-linux/sysdig/0.28.0/git/falcosecurity-libs/userspace/libsinsp/./gen_filter.h:87:17: error: 'uint64_t' does not name a type
+   87 |         virtual uint64_t get_ts() const = 0;
+      |                 ^~~~~~~~
+
+Upstream-Status: Pending [gen_filter is removed in newer version with https://github.com/falcosecurity/libs/commit/47e245f3d343eff27ed178ec2449caa3a01faabb]
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+---
+ userspace/libsinsp/gen_filter.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/userspace/libsinsp/gen_filter.h b/userspace/libsinsp/gen_filter.h
+index f4cfa08b1..79ac30dc3 100644
+--- a/userspace/libsinsp/gen_filter.h
++++ b/userspace/libsinsp/gen_filter.h
+@@ -16,6 +16,7 @@ along with Falco.  If not, see <http://www.gnu.org/licenses/>.
+ 
+ #pragma once
+ 
++#include <cstdint>
+ #include <set>
+ #include <list>
+ #include <map>
diff --git a/meta-oe/recipes-extended/sysdig/sysdig_0.28.0.bb b/meta-oe/recipes-extended/sysdig/sysdig_0.28.0.bb
index e9aa48da54..9b95c14de0 100644
--- a/meta-oe/recipes-extended/sysdig/sysdig_0.28.0.bb
+++ b/meta-oe/recipes-extended/sysdig/sysdig_0.28.0.bb
@@ -26,6 +26,7 @@ SRC_URI = "git://github.com/draios/sysdig.git;branch=dev;protocol=https;name=sys
            git://github.com/falcosecurity/libs;protocol=https;branch=master;name=falco;subdir=git/falcosecurity-libs \
            file://0001-Add-cstdint-for-uintXX_t-types.patch;patchdir=./falcosecurity-libs \
            file://0001-cmake-Pass-PROBE_NAME-via-CFLAGS.patch \
+           file://0001-libsinsp-fix-build-with-gcc-15.patch;patchdir=./falcosecurity-libs \
           "
 SRCREV_sysdig = "4fb6288275f567f63515df0ff0a6518043ecfa9b"
 SRCREV_falco = "caa0e4d0044fdaaebab086592a97f0c7f32aeaa9"

