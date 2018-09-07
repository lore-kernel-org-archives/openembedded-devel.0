Return-Path: <yevgenyp@pointgrab.com>
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
	[209.85.167.45])
	by mail.openembedded.org (Postfix) with ESMTP id 086347982B
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Sep 2018 18:10:19 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id e23-v6so12712194lfc.13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Sep 2018 11:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pointgrab-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=riYAvASm2VR5zUVLylNiqv4n+8BPfRfGIYA456Grx/o=;
	b=uwgb4R3HwMxF+LVIHbUKQhGspUmEAtHhec+wwrkVrI2jAqzzoExbhs1bzKqWlHA15d
	a3+e80tgjz2hhjzaXtfIRoQwk3jc9wyKYobzj+xoYdeJ/4yniGRwwBnWeYPqWjvLYwO/
	vpD5HFLugrQ01MYFSp64ZNt4N9adI+ECTGk6Ed6jh5QTaqueJzATyUU29fF6NEncBoLk
	0/yS0+z/N1SsJVS03Wvg/5O9mt1nT5L/6rn/SVdwiTkUyasTSgAjao6BjDt4K6z5CDB9
	m/3AvCiVprm/rVj/VEpLJtrAbPJAh5buc/zIoNZbFV7NgVDtlGrZwMgz8bx4RYrvYzS6
	6TDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=riYAvASm2VR5zUVLylNiqv4n+8BPfRfGIYA456Grx/o=;
	b=PaxfJ9HTcfdOr+IaBj6W7welf5xqp6sBIjo4ef/eXTSjBMBZD7B4ER+VO/lt15eX45
	IegHOdZIseFlFGgE0TRgVPdK7PbA37lgDREFeoOvFvfawv6IDtvzvv8GdEy2jSQXLwCO
	h6cnSe1TI480ElhYq8hkuE1/BP2RFzZiFL+6/v7BWt81MZ2TR1HVxm6PM89Hx4fNgfmd
	rilRUrl65KE0Xj+uoT/Pc9nRVo1spykNzIdl6D7QPM7KPSVNdtcCdvqnetHKw/xK51SF
	pr5rBIe+bRbURRRRpRgNAG1/76i8PEC9BvBGpsFWoY47HY+0KzyXx8autWQ3reSa7JSm
	8D3g==
X-Gm-Message-State: APzg51AAyNVfzo4p5wCuFQ/dIYnv7c906cFwswYtPv52FwccoKsd+CqD
	lraz/9wqD8CACO5GZwElMGbJ0XCSS34=
X-Google-Smtp-Source: ANB0VdYMv8ML7NZzh9HyEg7Xo0LghMp7tGpf4ABcFQIcd2iR0mJ/OBE+hK3StslkFsTR4xh3+30Yzw==
X-Received: by 2002:a19:1dcf:: with SMTP id
	d198-v6mr5756793lfd.144.1536343820407; 
	Fri, 07 Sep 2018 11:10:20 -0700 (PDT)
Received: from yevgeny-lnx.localdomain ([77.222.132.139])
	by smtp.gmail.com with ESMTPSA id
	j24-v6sm1391050lfb.62.2018.09.07.11.10.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 07 Sep 2018 11:10:19 -0700 (PDT)
From: Yevgeny Popovych <yevgenyp@pointgrab.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  7 Sep 2018 21:10:08 +0300
Message-Id: <1536343810-87649-2-git-send-email-yevgenyp@pointgrab.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1536343810-87649-1-git-send-email-yevgenyp@pointgrab.com>
References: <1536343810-87649-1-git-send-email-yevgenyp@pointgrab.com>
Cc: andre.draszik@jci.com
Subject: [meta-java][PATCH 1/3] ca-certificates-java: Fix sysconfdir for -native recipe
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
X-List-Received-Date: Fri, 07 Sep 2018 18:10:20 -0000

When ca-certificates-java-native is built, sysconfdir variable will
be set to value that includes WORKDIR.
Avoid patching source with this value - use sysconfdir_native.

Change-Id: I8ac79c3cd5016a8139d9d8c8d58bc2976d0b6fa3
Signed-off-by: Yevgeny Popovych <yevgenyp@pointgrab.com>
---
 .../ca-certificates-java/ca-certificates-java_20180516.bb        | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/recipes-core/ca-certificates-java/ca-certificates-java_20180516.bb b/recipes-core/ca-certificates-java/ca-certificates-java_20180516.bb
index 2db1915..7db5110 100644
--- a/recipes-core/ca-certificates-java/ca-certificates-java_20180516.bb
+++ b/recipes-core/ca-certificates-java/ca-certificates-java_20180516.bb
@@ -41,9 +41,14 @@ do_patch_append () {
     bb.build.exec_func('do_fix_sysconfdir', d)
 }
 
+# sysconfdir will include absolute native sysroot path in -native builds, avoid this
+# (see 36.24 of https://www.yoctoproject.org/docs/2.5/mega-manual/mega-manual.html#faq)
+SYSCONFDIR_VALUE_class-target = "${sysconfdir}"
+SYSCONFDIR_VALUE_class-native = "${sysconfdir_native}"
+
 do_fix_sysconfdir () {
-	sed -e 's|/etc/ssl/certs/java|${sysconfdir}/ssl/certs/java|g' \
-	    -i ${S}/src/main/java/org/debian/security/UpdateCertificates.java
+    sed -e 's|/etc/ssl/certs/java|${SYSCONFDIR_VALUE}/ssl/certs/java|g' \
+        -i ${S}/src/main/java/org/debian/security/UpdateCertificates.java
 }
 
 do_compile () {
-- 
2.7.4


