Return-Path: <koen.kooi@linaro.org>
Received: from mail-we0-f169.google.com (mail-we0-f169.google.com
	[74.125.82.169])
	by mail.openembedded.org (Postfix) with ESMTP id 57D1065D32
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Jun 2014 09:38:41 +0000 (UTC)
Received: by mail-we0-f169.google.com with SMTP id t60so989689wes.28
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Jun 2014 02:38:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=yqV3Aq1lLsxLnUwBQDEcWZbZCuniVQwiDmQNu8zZYmA=;
	b=eskjBciuiv2wFk9AsJtSrfhHUIP/KBgBNIQGxIvks8dDZJ4u3AeJdDMdIdp0U0sZgb
	aLnd3ceFglSySqc6DhHnJiojrueYpgIyh7409zRX95sRqpO5Kkc5HKBxgRwQP2nvOZPy
	yqy2N6+nU2kEf5N+IQSKICzcgPom+f7hoj9pmOL8eDTWmV8r3kSq41/O4A8TgJM/Rf83
	2rsW+YmsHp/j35WA+XzV8janLdqsmHLK5Y3Y9w/Ma4xV+HWVjMi7h1m864Uv4GnzOAXi
	kDpAYISHPUKyGJt8DpDbVoBvxNm4fj9mGYVf9U5U83kEm+N+uwgdj2bvyufbrvnMESCd
	OZHA==
X-Gm-Message-State: ALoCoQkF2InH0vt1N2gYg/EjQcG9N9gmmUPLgJiNCVPJLu2+rT2fNVCCz9n7DOmA5sTy+9exsWcp
X-Received: by 10.195.12.34 with SMTP id en2mr60505526wjd.13.1402565922141;
	Thu, 12 Jun 2014 02:38:42 -0700 (PDT)
Received: from localhost ([2001:610:612:0:5e51:4fff:fec8:7c15])
	by mx.google.com with ESMTPSA id wj4sm707594wjc.23.2014.06.12.02.38.41
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Jun 2014 02:38:41 -0700 (PDT)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Jun 2014 11:38:38 +0200
Message-Id: <1402565918-14474-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 1.9.3
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [meta-oe][PATCH] acpica: pass target cflags
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Jun 2014 09:38:46 -0000

This fixes:

| make[1]: *** [obj/aeexec.o] Error 1
| In file included from /build/linaro/build/build/tmp-eglibc/sysroots/genericarmv7a/usr/include/features.h:402:0,
|                  from /build/linaro/build/build/tmp-eglibc/sysroots/genericarmv7a/usr/include/string.h:25,
|                  from ../../../source/include/platform/aclinux.h:115,
|                  from ../../../source/include/platform/acenv.h:150,
|                  from ../../../source/include/acpi.h:56,
|                  from ../../../source/tools/acpiexec/aecommon.h:51,
|                  from ../../../source/tools/acpiexec/aehandlers.c:44:
| /build/linaro/build/build/tmp-eglibc/sysroots/genericarmv7a/usr/include/gnu/stubs.h:7:29: fatal error: gnu/stubs-soft.h: No such file or directory
|  # include <gnu/stubs-soft.h>
|                              ^
| compilation terminated.

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 meta-oe/recipes-extended/acpica/acpica_20140424.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/acpica/acpica_20140424.bb b/meta-oe/recipes-extended/acpica/acpica_20140424.bb
index c302d27..d10a31b 100644
--- a/meta-oe/recipes-extended/acpica/acpica_20140424.bb
+++ b/meta-oe/recipes-extended/acpica/acpica_20140424.bb
@@ -19,7 +19,7 @@ SRC_URI[sha256sum] = "72ece982bbbdfb1b17418f1feb3a9daaa01803d0d41dcf00e19d702cdf
 
 S = "${WORKDIR}/acpica-unix2-${PV}"
 
-EXTRA_OEMAKE = "CC=${TARGET_PREFIX}gcc 'OPT_CFLAGS=-Wall'"
+EXTRA_OEMAKE = "CC='${CC}' 'OPT_CFLAGS=-Wall'"
 
 do_install() {
     install -D -p -m0755 generate/unix/bin*/iasl ${D}${bindir}/iasl
-- 
1.9.3


