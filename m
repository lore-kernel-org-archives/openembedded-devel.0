Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id ED7EC7064B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jul 2014 15:21:39 +0000 (UTC)
Received: by mail-wi0-f175.google.com with SMTP id ho1so6121629wib.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jul 2014 08:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=2nwAg87zTrYCEHDeSHfC/wV5eCfn/s9LfaWiBp7h+lg=;
	b=u6WFNGJhDZ+m4BRP9G7nEnutyFtc0YPivyRfXldCUri/6SzWMxBVGKcg2MRtgFKZTg
	5S9i/1WYr0tPZ08v1huRt+UMtWvhZxrcYOKhRZELpNXmBqZhno4FNG1nr3ZoZlQ8GDsR
	We7ZjtRY5bSFFtCUK4VUzWBgGTCqjIyXeQzWu7K340p66woXXMU0qWEn+mG7hN/Ho+Ya
	n+efwrEJR3j5JHGECRyYdQurJAWZsTRX1Zkf+xk4w80gyWJqwL7AvPoV1CfckMEAHqrg
	i8C+J6WguBHUuChztKdcmpTWN6IHYZsfKHsMyPkJOgZ39yvYQQuOESYR5iTVOA+LI0Bu
	LQpw==
X-Received: by 10.180.189.107 with SMTP id gh11mr16030474wic.40.1406042498645; 
	Tue, 22 Jul 2014 08:21:38 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	fw4sm3697724wib.19.2014.07.22.08.21.37 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 Jul 2014 08:21:38 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 22 Jul 2014 17:21:51 +0200
Message-Id: <1406042511-9394-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.2
Subject: [meta-oe][PATCH] snort: add openssl dependency
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
X-List-Received-Date: Tue, 22 Jul 2014 15:21:42 -0000

* otherwise the result isn't deterministic
  WARN: packages/armv5te-oe-linux-gnueabi/snort/snort/latest lost dependency on  libcrypto

* I haven't used PACKAGECONFIG, because there are --with flags for
  openssl, but then configure.in still checks for sha.h header with
  AC_CHECK_HEADERS([openssl/sha.h],, SHA_H="no")
  and autodetects it, I'll leave patching configure to someone who
  is actually using snort (this issue was reported many times and
  nobody seems to care).

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-networking/recipes-connectivity/snort/snort_2.9.6.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/snort/snort_2.9.6.0.bb b/meta-networking/recipes-connectivity/snort/snort_2.9.6.0.bb
index 16c9bbb..b7a5437 100644
--- a/meta-networking/recipes-connectivity/snort/snort_2.9.6.0.bb
+++ b/meta-networking/recipes-connectivity/snort/snort_2.9.6.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.snort.org/"
 LICENSE = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=78fa8ef966b48fbf9095e13cc92377c5"
 
-DEPENDS = "libpcap libpcre daq libdnet"
+DEPENDS = "libpcap libpcre daq libdnet openssl"
 
 SRC_URI = " ${GENTOO_MIRROR}/${BP}.tar.gz;name=tarball \
             file://snort.init \
-- 
2.0.2


