Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id 18852787DE
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Jan 2018 03:25:08 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id o13so166032pli.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Jan 2018 19:25:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=MzuTUd0bn8Y8nBdb4C9U+BHE+Ey4iKBih/CIQPo+xZM=;
	b=J4DSUCMI6HiN8/7PCBgwlU/2PhTsZeW62lr5wWGNA4maNQ5Xd2yR/yilz53D44N6Ie
	6VqxahY/novTpQ5sjfOhyL0s95whuXbzn2rAag/LiFJAPg4Cc2O6qzgTAdeBkeixJvIz
	Qg/YOb997bFHQ8ncsgXMdp5XLp/lcrOAuqQffIRS/H6yZwqLqqpLJ4hEgueiMjPGAmB3
	87ZdTN5IB2CI3wZtm0r7BWQvHVFfhN29CXxgTAMV6DH0k/VAsnQTxjKCgzTM7K08XKpV
	C65RdjFI4pdFAGaioPzxhmHHoAflIoh5gB+Q5OtVdRgysK5fu9S64M4rMSTCt+hG+ttB
	c1Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=MzuTUd0bn8Y8nBdb4C9U+BHE+Ey4iKBih/CIQPo+xZM=;
	b=jK0luyI5yBh5nYp6JUAUFe5CDjnx15PlOQwL8gg/em/3HPi4XmxHKPED5GIsuULrD+
	K0bNX8yBmyHf/BduGH30J6/C10RaMuOtWNgtckgVFmviICUwqyYVDQT+NCFEm0NchrpQ
	ZLN+suN5BKWmPJy4jUToYL1S9uyV8qDgTPaUPUAHGBepnWN7pPeHNR0glNg7nrOMPWxR
	/n1/KOlCZ5gOA3VGjkN98kjZHRndR8du0KZ95tWbbxOdgZlVmLCZ6fbW35maxyRfugHY
	IjZqhzutyUqQ6PKaYgi9rNAbZLwbMYnBn6nN6nNghlLqiyNyrmhZmRorvbBKzj0RSvvt
	WcIQ==
X-Gm-Message-State: AKwxyte+WqABSDn3OQJARTFuKrjqo59EEDQN7LMtPn506K0o+IYsIXh+
	iUnjsGIu3QsV6kk1kQOikkA=
X-Google-Smtp-Source: AH8x226JgaJQy6V64SL3+NO/9UcJLWz6BB2m50j3lWbD+0Abexo5pmZthydHqk/rOwkzmSJ6qRnHhQ==
X-Received: by 2002:a17:902:bc3:: with SMTP id
	61-v6mr13872602plr.407.1517023509750; 
	Fri, 26 Jan 2018 19:25:09 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:2999:2a82:b9b6:e74c])
	by smtp.gmail.com with ESMTPSA id
	v22sm6692206pfa.158.2018.01.26.19.25.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 26 Jan 2018 19:25:09 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-devel@lists.openembedded.org
Date: Fri, 26 Jan 2018 19:24:32 -0800
Message-Id: <2c10e739ff6f72cd9b50ba4aa94754d38fcffd25.1517023286.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1517023286.git.akuster808@gmail.com>
References: <cover.1517023286.git.akuster808@gmail.com>
Subject: [PATCH 32/36] net-snmp: support openssl without 3des
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
X-List-Received-Date: Sat, 27 Jan 2018 03:25:08 -0000

From: Jackie Huang <jackie.huang@windriver.com>

net-snmp enables 3des support by default and fails to build with distro
feature openssl-no-weak-ciphers:

| ../../net-snmp-5.7.3/snmplib/scapi.c:82:25: fatal error: openssl/des.h: No such file or directory
|  #include <openssl/des.h>

To fix the issue:
* add a patch to include des.h only if it's found in openssl
* disable des when openssl-no-weak-ciphers is enabled

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
(cherry picked from commit d8e69bc9e9c183346a11eb31915c12558565f881)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../net-snmp/net-snmp-fix-for-disable-des.patch    | 32 ++++++++++++++++++++++
 .../recipes-protocols/net-snmp/net-snmp_5.7.3.bb   |  4 ++-
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-fix-for-disable-des.patch

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-fix-for-disable-des.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-fix-for-disable-des.patch
new file mode 100644
index 0000000..25eb9c9
--- /dev/null
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-fix-for-disable-des.patch
@@ -0,0 +1,32 @@
+From 270e952f58a7e5ddeabe5a15e3ddaaadf40017d0 Mon Sep 17 00:00:00 2001
+From: Jackie Huang <jackie.huang@windriver.com>
+Date: Thu, 22 Jun 2017 10:25:08 +0800
+Subject: [PATCH] net-snmp: fix for --disable-des
+
+Include des.h only if it's found in openssl so that
+the --disable-des works correctly.
+
+Upstream-Status: Submitted [net-snmp-coders@lists.sourceforge.net]
+
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ snmplib/scapi.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/snmplib/scapi.c b/snmplib/scapi.c
+index 16ac829..271684b 100644
+--- a/snmplib/scapi.c
++++ b/snmplib/scapi.c
+@@ -79,7 +79,9 @@ netsnmp_feature_child_of(usm_scapi, usm_support)
+ #include <openssl/hmac.h>
+ #include <openssl/evp.h>
+ #include <openssl/rand.h>
++#ifdef HAVE_OPENSSL_DES_H
+ #include <openssl/des.h>
++#endif
+ #ifdef HAVE_AES
+ #include <openssl/aes.h>
+ #endif
+-- 
+2.11.0
+
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
index af6fd1b..849ae07 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
@@ -31,6 +31,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV}.zip \
            file://0003-CHANGES-BUG-2712-Fix-Perl-module-compilation.patch \
            file://0004-configure-fix-incorrect-variable.patch \
            file://net-snmp-5.7.2-fix-engineBoots-value-on-SIGHUP.patch \
+           file://net-snmp-fix-for-disable-des.patch \
            "
 SRC_URI[md5sum] = "9f682bd70c717efdd9f15b686d07baee"
 SRC_URI[sha256sum] = "e8dfc79b6539b71a6ff335746ce63d2da2239062ad41872fff4354cafed07a3e"
@@ -59,7 +60,8 @@ EXTRA_OECONF = "--enable-shared \
                 --with-defaults \
                 --with-install-prefix=${D} \
                 --with-persistent-directory=${localstatedir}/lib/net-snmp \
-                ${@base_conditional('SITEINFO_ENDIANNESS', 'le', '--with-endianness=little', '--with-endianness=big', d)}"
+                ${@base_conditional('SITEINFO_ENDIANNESS', 'le', '--with-endianness=little', '--with-endianness=big', d)} \
+"
 
 # net-snmp needs to have mib-modules=smux enabled to enable quagga to support snmp
 EXTRA_OECONF += "--with-mib-modules=smux"
-- 
2.7.4


