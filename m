Return-Path: <andrea.adami@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id E9F22719DD
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Apr 2017 13:15:24 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id d79so2414973wmi.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Apr 2017 06:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=fnMV89qcVy2ET6iwzTTgkODM9aglioyGS22125WSjnU=;
	b=SLH37GBYmQ3bCL9OmV5SVuayPO3usVhNDi3ci636Ur9coD76mcbhFHJOgUTam72D1m
	96PQMOkAp7ucViBEKwVrj4hIstMpEPnhKG/jFHszhxZXlz+odhOa+XnCUbzKz7wezkQh
	woYzhct0YP/Smkn4aqIkby6zVt/tB3JWvxVhQCWFdyAnfIMAdFyAI3ZgNmuuQr/v94f5
	i9glL2/n312f0uxX8cUYqoZ7CG9ehgbWRN+vXsswDAvx+RRcyzbEK/vzvqZGgR5pOSnG
	ZJjfn9c7nOLM04eL5ZEYPRFTBVh86lVL2johZGQUWgYrWoKZY4n8vK8vlDn9RornTP7m
	Jv6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=fnMV89qcVy2ET6iwzTTgkODM9aglioyGS22125WSjnU=;
	b=ZvVU0BWss2JOUIcLN1SM4ZPNytQ4ZrSnemrbSmv/DdQpMfed3sCNu3rBJDk4kwVNWZ
	iVJ6Kr7h73hU4CoU3UmHrQQXwwRKp7uYyB1aRV+DZpc+Jg9nKTJYzrN8gEYI7vwp3Fpn
	VAGt3I7k+nQ43ZFvRQPk1f2SHa9+paLKWd6R1eo2ddpVrM3MkJF8WLVF3VBxmcbZfd4v
	o6ETkMC8z7tY3lTScjcp1fWnNqPROZthcfhQEn01leu5yvK4riN4LiIUwUGQg3ILugIn
	vCsUnjeBYwJqDnunbpZhNZiVVd0QF6jbeViVPKQolSOyNjrLAbp7UzLjQdOwb3xeuOlg
	KJhg==
X-Gm-Message-State: AN3rC/52bWf1kVQE8orC/xaJe5Hvf70r69QLCXV2iULPU3Lgkt/bZM25
	EqARgqWC/+0SiA==
X-Received: by 10.28.71.88 with SMTP id u85mr2489551wma.24.1492262124317;
	Sat, 15 Apr 2017 06:15:24 -0700 (PDT)
Received: from ThinkPad-T520.homenet.telecomitalia.it ([95.236.249.99])
	by smtp.gmail.com with ESMTPSA id x65sm2582047wmg.3.2017.04.15.06.15.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 15 Apr 2017 06:15:23 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 15 Apr 2017 15:15:14 +0200
Message-Id: <1492262114-20052-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-initramfs][PATCH] klibc: disable PARALLEL_MAKE
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
X-List-Received-Date: Sat, 15 Apr 2017 13:15:25 -0000

On modern buidsystems with many cores there are sporadic build failures.
The issue is known and a fix in the sources is awaited (new Kbuild).

http://www.zytor.com/pipermail/klibc/2013-May/003420.html

For the moment, disable PARALLEL_MAKE.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta-initramfs/recipes-devtools/klibc/klibc.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-initramfs/recipes-devtools/klibc/klibc.inc b/meta-initramfs/recipes-devtools/klibc/klibc.inc
index f00e31a..e039cb2 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc.inc
+++ b/meta-initramfs/recipes-devtools/klibc/klibc.inc
@@ -21,6 +21,7 @@ SRC_URI += "file://klibc-linux-libc-dev.patch \
 
 S = "${WORKDIR}/git"
 
+PARALLEL_MAKE = ""
 EXTRA_OEMAKE = "'KLIBCARCH=${KLIBC_ARCH}' \
                 'CROSS_COMPILE=${TARGET_PREFIX}' \
                 'KLIBCKERNELSRC=${STAGING_DIR_TARGET}${exec_prefix}' \
-- 
2.7.4


