Return-Path: <twoerner@gmail.com>
Received: from mail-it0-f68.google.com (mail-it0-f68.google.com
	[209.85.214.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3D1D67608F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 May 2018 15:21:16 +0000 (UTC)
Received: by mail-it0-f68.google.com with SMTP id j186-v6so2596630ita.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 May 2018 08:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=PzKhcNXY84CYuSGrF6bn7lpEgXBLS/Vtskh7A6QQPq0=;
	b=lSmTU05MJv6j9Oz99I4Fxb69uCsug8vQV3L+HCZCNkErCyIImUIydTEwPQQvt7nt3Y
	ZDjhYAV/Ic6XZ8Gqj8if+eZ1/NVF7Wf/dl3hCF3ESKw2sSTlSPO47Qgdyv0HFERVYv7t
	AoQHg81iX8rfPTAB+789gnHp+hxmlEbP2wLNYR4IV4i0wgat3TRmW/ogxEr6aT/22ljf
	Adi0LVyZvz5slCEniNx82y+nmCI7AAOyhYJEczBLo6Q9PY2Qf1aqNC29/SRb1gdkVPa1
	NzPS0nFHoTxAg9MR9Zp57nMN+IVbHpiKwVF/oNwOh55fa72FJfXdqVzjkg0zWA4TyVEY
	4uOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=PzKhcNXY84CYuSGrF6bn7lpEgXBLS/Vtskh7A6QQPq0=;
	b=nmy5BC3upicAjnXyO2QUxOqeX4az7mNRPXyEYSCRPv2TWUJZ/qBaZQEZZJrrKDk4sK
	FN6tkCmr8c2DshYmLvYbJz8V4+z/+RuC/WaMkUDLB8HPpx+ikz4A+F5j+9VPI/MccgHY
	TSyYayo59VS2zv/5br/Zi9zlJbAJS4hlP3PQon8yDHqEBjLm1EXBbEK1/zu5Y3M3P3i0
	UmqO8EC3OtEhFdYXmBNNaA9YNBb8GQUZJvk7KAOjzMWcSxfkG9ZMg5kx4AE7m3/CCTWi
	AQow0GJQiXAsgsm9Mlb2WIDeRUObMNaa8MmS+l/M5xRkBeeGy/T7gXHwdZnGqILlTkzT
	RgQQ==
X-Gm-Message-State: ALKqPwco8mfzWLnAWSAu+d4mlVdysmPQZ+w27idINmj34+RP/+k57GGJ
	tdol0vc+jbuLrVNdIDEwILjnBY+8
X-Google-Smtp-Source: AB8JxZouKR8upRBvRemkIUCXj7wNVpRfKKcibM4ub8+rYX+YGUfJ552EQW78CFH1hTzFfuHySQY6tw==
X-Received: by 2002:a24:6e16:: with SMTP id
	w22-v6mr3757626itc.67.1526052077019; 
	Fri, 11 May 2018 08:21:17 -0700 (PDT)
Received: from linux-uys3.suse ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id
	y204-v6sm1625101ioy.88.2018.05.11.08.21.15
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 11 May 2018 08:21:15 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 11 May 2018 11:21:09 -0400
Message-Id: <20180511152109.28074-2-twoerner@gmail.com>
X-Mailer: git-send-email 2.17.0.rc2.3.gc2a499e6c
In-Reply-To: <20180511152109.28074-1-twoerner@gmail.com>
References: <20180511152109.28074-1-twoerner@gmail.com>
Subject: [meta-oe][PATCH 2/2] libuv: update 1.11.0 -> 1.20.3
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
X-List-Received-Date: Fri, 11 May 2018 15:21:16 -0000

The license change is as a result of removing one of the files
(pthread-fixes.h) from the list of files from Google and Sony.
No change in license has occurred. Here is a diff of the license
file:

	--- LICENSE.old 2018-05-11 10:50:19.024581228 -0400
	+++ LICENSE.new 2018-05-11 10:49:53.088488515 -0400
	@@ -62,8 +62,8 @@
	   - stdint-msvc2008.h (from msinttypes), copyright Alexander Chemeris. Three
	     clause BSD license.

	-  - pthread-fixes.h, pthread-fixes.c, copyright Google Inc. and Sony Mobile
	-    Communications AB. Three clause BSD license.
	+  - pthread-fixes.c, copyright Google Inc. and Sony Mobile Communications AB.
	+    Three clause BSD license.

	   - android-ifaddrs.h, android-ifaddrs.c, copyright Berkeley Software Design
	     Inc, Kenneth MacKay and Emergya (Cloud4all, FP7/2007-2013, grant agreement

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 .../libuv/{libuv_1.11.0.bb => libuv_1.20.3.bb}                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/libuv/{libuv_1.11.0.bb => libuv_1.20.3.bb} (78%)

diff --git a/meta-oe/recipes-connectivity/libuv/libuv_1.11.0.bb b/meta-oe/recipes-connectivity/libuv/libuv_1.20.3.bb
similarity index 78%
rename from meta-oe/recipes-connectivity/libuv/libuv_1.11.0.bb
rename to meta-oe/recipes-connectivity/libuv/libuv_1.20.3.bb
index ca4685ab3e..a11ff9d2c4 100644
--- a/meta-oe/recipes-connectivity/libuv/libuv_1.11.0.bb
+++ b/meta-oe/recipes-connectivity/libuv/libuv_1.20.3.bb
@@ -2,10 +2,10 @@ SUMMARY = "A multi-platform support library with a focus on asynchronous I/O"
 HOMEPAGE = "https://github.com/libuv/libuv"
 BUGTRACKER = "https://github.com/libuv/libuv/issues"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=bb5ea0d651f4c3519327171906045775"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a68902a430e32200263d182d44924d47"
 
 S = "${WORKDIR}/git"
-SRCREV = "7452ef4e06a4f99ee26b694c65476401534f2725"
+SRCREV = "8cfd67e59195251dff793ee47c185c9d6a8f3818"
 BRANCH = "v1.x"
 SRC_URI = "git://github.com/libuv/libuv.git;protocol=https;branch=${BRANCH};"
 
-- 
2.17.0.rc2.3.gc2a499e6c


