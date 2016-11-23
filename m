Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0204C71A8B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 09:22:23 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id p66so667954pga.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 01:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=dozy95z7AeIKtUjtU7ca7qrWPF9ahlP26lsbLcqweU8=;
	b=RRCn7D5Me++n8FaoxZSQ7J4GXy3UYuO/LeRlrSNtJ5taFoWlXV6CoFi1g4yVHihPGq
	2WN4wYdY9HCJS3zGrzuTJxn2jW4Vgu02nDxfo49s9Abd+XzBqy0w8mpRtPmn/dWYFIqH
	VQvx2xFtIzHqcw6zDwdnRYDapxWBfx0/ZdS1AMvMoHDoFO5ayz/NMrR3PAC5jlYWaWFb
	chjAeegISJ/xCTaL/tFNyRv5/Yiu6I9/SgIB4XaWS8nCca6rtDSUpxjQNcaq6NnlqT3u
	pKOBorA/nHrHHFM8VyEY5XzXoX7VgcfB15fLYQbw+od9sXYX/39r/C+O4Hqadvzzhi6A
	XZ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=dozy95z7AeIKtUjtU7ca7qrWPF9ahlP26lsbLcqweU8=;
	b=ceKKtyicVqyZ542qURhuOYXZhJo1aZxfms8gvuTJWUrT6zfMCnwmvkoHqeUAPILg30
	E+/RsvxS60VYTwrHXhWsNxqL4zBcBvklmM//72IQE5knIOCkKmps84hGL2YEA3a3oS7J
	+qEWwp9FaaDsG1U9JPdLYlajLucm1oYsdJStr/mp1axTmgHIORbisdc+L+6FfWsbPSm/
	sCe56X0CfWc5phnl8cl7dui13VUf6mPFdrRrgX3UKTAXp37ygB4z0W2rxAjL687c63fN
	558pohx8rZV7rrLD+BBgz54uMj19i4sVLwOrudnZFoVo7cMfJa5K8GDie1apiBD9b4GQ
	bxFw==
X-Gm-Message-State: AKaTC03dLFDxAAbOV+S54+8EogvYlG6/ky9lAlWuhPn8LdWA/F3scbGOgAbbrsMGQm+Exw==
X-Received: by 10.84.218.7 with SMTP id q7mr4625232pli.18.1479892945494;
	Wed, 23 Nov 2016 01:22:25 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	u23sm51056087pfg.86.2016.11.23.01.22.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Nov 2016 01:22:25 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Nov 2016 01:21:31 -0800
Message-Id: <20161123092209.23699-11-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161123092209.23699-1-raj.khem@gmail.com>
References: <20161123092209.23699-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 11/49] krb5: Add -fPIC to compile flags
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
X-List-Received-Date: Wed, 23 Nov 2016 09:22:24 -0000

Fixes errors on x86_64 e.g.
errors.so: relocation R_X86_64_PC32 against symbol `k5_vset_error' can not be used when making a shared object; recompile with -fPIC

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-connectivity/krb5/krb5_1.13.6.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-connectivity/krb5/krb5_1.13.6.bb b/meta-oe/recipes-connectivity/krb5/krb5_1.13.6.bb
index e2d0594..06f7f90 100644
--- a/meta-oe/recipes-connectivity/krb5/krb5_1.13.6.bb
+++ b/meta-oe/recipes-connectivity/krb5/krb5_1.13.6.bb
@@ -51,8 +51,8 @@ CACHED_CONFIGUREVARS += "krb5_cv_attr_constructor_destructor=yes ac_cv_func_regc
                   ac_cv_printf_positional=yes ac_cv_file__etc_environment=yes \
                   ac_cv_file__etc_TIMEZONE=no"
 
-CFLAGS_append = " -DDESTRUCTOR_ATTR_WORKS=1 -I${STAGING_INCDIR}/et"
-LDFLAGS_append = " -lpthread"
+CFLAGS_append = " -fPIC -DDESTRUCTOR_ATTR_WORKS=1 -I${STAGING_INCDIR}/et"
+LDFLAGS_append = " -pthread"
 
 FILES_${PN} += "${datadir}/gnats"
 FILES_${PN}-doc += "${datadir}/examples"
-- 
2.10.2


