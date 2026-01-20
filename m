Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DFD3D262A4
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 21:20:12 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17355.1768944010012486188
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Jan 2026 13:20:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aeczUnAS;
 spf=pass (domain: gmail.com, ip: 209.85.128.176, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-78fb6c7874cso64618747b3.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Jan 2026 13:20:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768944009; x=1769548809; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J2XZgzSbC0IL4UZHKjg5lRhXCkcPwFh8gGvY44XMWsQ=;
        b=aeczUnASOab3gRzhZITiyX4ERDsn0o8Z6JWliKQlg1GHCpBlsIllWMiijhvtgV9MBs
         iorljd60WDklhVt/PKXWlcy2tOuq//Mfw6fpdqYqyzGomrIrK53c8+V4LBz+iCgmK9Dp
         eiUXRlOaJCpgQZdtBJLYwFLiizZQhgRtvpvuPzR6LsL6WhrmczPO45KjZ2pQMDPSyTQf
         /clXUatzg/nUzIwwtozGOLX58/njjtGY65MAkzOBni162Bp0sbAurg+eJ49jKVHT3DGx
         NCf5tFGLx7jrJ3h36gH/43NTCrBaURJ/CQwi8DceRU4qOGmPkTLdElquC/gPU+U8rmNh
         Y6AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768944009; x=1769548809;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J2XZgzSbC0IL4UZHKjg5lRhXCkcPwFh8gGvY44XMWsQ=;
        b=djveUxQus7/+0O38DR3NJc/MoIVAvJRFPkHSxwtZzzBw4cw6xXNF0ScqLEDN1Gksh9
         fJn5rJsBEcbG4td9Ci0YTL+qjZqeCgUiiUXXWEhLahO3Fj/1V77l0h6KBvWPXndZDg76
         jMV0Q/vJ6EfVoXQxyz/UGnvViWHfVMUf2jTlpEIb4BIi6y5krWBwAx691w9wjm8DVVjm
         bB0bH8vm/LIy4vXOfodp+qsUOSTzWOyipre8qS3fk2khihHCmrTUArAgyYHk/61kYilD
         +lK/nwHiROw1mFcBQ8f3T9GmCj5Z9nr5nLnhn4F4qXr/ksSsWtjSgvqMB+MlnBj+0Xur
         xG4g==
X-Gm-Message-State: AOJu0YyPjCLxaV7uyz6b3OvyEYm55lBEkep4hPErFw/n/HBbYryDzGWw
	l5a3+qR+pd+KKas1/eXVBC+qm/kbaNw7eYj9q/3yWREZQYAzeR2NL7RAe25g3SYU
X-Gm-Gg: AZuq6aJE+ygSmBKHa80JPGEKzMF/FHgO9wD0iWtnJIh9MD1zkiQzYdBVZfedeWmSDX5
	NZccdE4M7O7AnNZbUYUBggY0UZeRcbPxLMVGy8Mw5XoVYCXpucnaOqGw2QPXwhrr0vwnpbuG5vt
	435E7EdWGVpffwjuvF+A4GTIRzMsoLdWDWnELv0ye9T4Zg9q6vQHAA/+PucNA9Rc6ywT87ayfhC
	mqITNvNCchicubavzAXttb6Xf1dqNlUu/omULa/ayckOn9nZxjmWvUr+CuMKmjQdug5ku7TqR1c
	4tZbJLV2Kuuu5vcBPHGVrllXKOOmt4hyjFP9XRl+Il8xkj0mf+8Jsv9QqZiDKEuyo80J+KIaFTB
	/xcWxWXzVnhEodJhrxDX5O1+yl5Z2tjwuFjXCuozCMp3L99FfXA/z+vZAu79VRxehaB+A01FVh5
	6KfPLrZpMrGn6qg++L9Z+63jiZLcdWp307V+1RYPMQ8KOr/i98hLOBAa7T43m49MMoSXqqKB1i1
	/llBxIbPLY+AddbwN8LWy4xbHQ0kTqbNgWvDg==
X-Received: by 2002:a05:690c:660d:b0:78f:f362:ec4b with SMTP id 00721157ae682-793c67e8f8emr119725187b3.36.1768944008558;
        Tue, 20 Jan 2026 13:20:08 -0800 (PST)
Received: from localhost.localdomain ([67.233.59.72])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-793c6882ea7sm56373047b3.44.2026.01.20.13.20.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 13:20:08 -0800 (PST)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH] php: upgrade 8.5.1 -> 8.5.2
Date: Tue, 20 Jan 2026 16:19:52 -0500
Message-ID: <20260120211952.6310-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Jan 2026 21:20:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123680

This is a bugfix release.  Integer underflows, memory leaks, null pointer
dereferences and more.

Changelog: https://www.php.net/ChangeLog-8.php#8.5.2

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-devtools/php/{php_8.5.1.bb => php_8.5.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/php/{php_8.5.1.bb => php_8.5.2.bb} (98%)

diff --git a/meta-oe/recipes-devtools/php/php_8.5.1.bb b/meta-oe/recipes-devtools/php/php_8.5.2.bb
similarity index 98%
rename from meta-oe/recipes-devtools/php/php_8.5.1.bb
rename to meta-oe/recipes-devtools/php/php_8.5.2.bb
index c3abf58ad5..4200363fe3 100644
--- a/meta-oe/recipes-devtools/php/php_8.5.1.bb
+++ b/meta-oe/recipes-devtools/php/php_8.5.2.bb
@@ -12,7 +12,7 @@ DEPENDS:class-native = "zlib-native libxml2-native"
 
 PHP_MAJOR_VERSION = "${@d.getVar('PV').split('.')[0]}"
 
-SRC_URI = "http://php.net/distributions/php-${PV}.tar.bz2 \
+SRC_URI = "https://php.net/distributions/php-${PV}.tar.bz2 \
            file://0001-configure.ac-don-t-include-build-libtool.m4.patch \
            file://0002-ext-phar-Makefile.frag-Fix-phar-packaging.patch \
           "
@@ -32,7 +32,7 @@ UPSTREAM_CHECK_REGEX = "releases/tag/php-(?P<pver>\d+(\.\d+)+)"
 
 S = "${UNPACKDIR}/php-${PV}"
 
-SRC_URI[sha256sum] = "55f428c426e7241752ea9afff160bb64c32a9321cbd6d17d1c145b8df8823737"
+SRC_URI[sha256sum] = "f7efdeccc3a810b18920692306536b99a3ba86610dbd0795a296cf77d3fb3a06"
 
 CVE_STATUS_GROUPS += "CVE_STATUS_PHP"
 CVE_STATUS_PHP[status] = "fixed-version: The name of this product is exactly the same as github.com/emlog/emlog. CVE can be safely ignored."
-- 
2.43.0


