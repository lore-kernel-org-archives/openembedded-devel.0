Return-Path: <twoerner@gmail.com>
Received: from mail-it0-f67.google.com (mail-it0-f67.google.com
	[209.85.214.67])
	by mail.openembedded.org (Postfix) with ESMTP id 54ECF62134
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 May 2018 20:55:17 +0000 (UTC)
Received: by mail-it0-f67.google.com with SMTP id j186-v6so5568080ita.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 May 2018 13:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=JyV4lPJCYu4dSBHRwVQgZ5WGJdDowVZxxljC93N6+oc=;
	b=SUjvbRN40O1GqbdEOK49XQ54yaUaytcr7/LFtWKePklBEw2SxZfQq7dQ3bESrvfLpB
	Enm5S+s8QvVX2OeGbaW18tVEWNx5vYeUH/uWEYg+MVIU7Okic6eMJl8/wMt20WEvIYad
	k3tWbTbvPAwye8YMBHB4hG/bnNSo5iE3hznwnwm9umgoYHQI6LIXAnNhQ5c+A3cKjcG6
	/zq+LLDsqYDi4zQu8mAC4LsuKcSpN+iX/Q6ix+QKLHv0AT5GNbYwlVYP27jYkZ3VuQsF
	seds3kkPBQ6730gLGSMIEHHM5ic+gW1z2Zy34/7A4+q5GYhw6YQF/pkjrNMNDdhH7tSR
	JdUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=JyV4lPJCYu4dSBHRwVQgZ5WGJdDowVZxxljC93N6+oc=;
	b=ucGIrCeXhLnc0JPFuig13m1/24Bs66scgfJnsU3PEKxM3ivU0puiFDcZaN1DI+t2Rk
	lL+vtbE+CvuPxLmRY51Wmw2KRvQCEN3YGXeX+Wxs1jzUovu3it9qQPSLnKbIr++sawGW
	9YsowmtYF55CLcMqFQyQxcpsJ76sFntQ1LDbl5ZOP3IaE+Nh6QAKdtATAo6likPpEa7X
	xDJXpwvMJjNotXox2HNihaRjEBHFr7rJ9Yrt4UobivGPxv8YQlE508T03osvRTWRlByu
	JIOcJWFsywTgTRzNJDTZNVXQGuwi0zucuNSpRf5i+iSXZQh089pFpoMFAIeKPE8g2NHk
	g5Ng==
X-Gm-Message-State: ALKqPwcwrQVZHR4au6AglqV57ASZOxdxL9NfrNel/0cV6ZU/HXwjj/6r
	kLyaHCfYOiDvS2876Yx9RQPUUaje
X-Google-Smtp-Source: AB8JxZr35IIQ+Jh2fRqcmpVfVESQeyUblNlnNEV3tk3H5SlEAZgDkIfC4ODv2JAmsu8G9xmOPyMlBg==
X-Received: by 2002:a6b:a89b:: with SMTP id
	e27-v6mr2769304ioj.180.1526504118502; 
	Wed, 16 May 2018 13:55:18 -0700 (PDT)
Received: from linux-uys3.suse ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id
	z9-v6sm2005944itf.8.2018.05.16.13.55.16
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 16 May 2018 13:55:17 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 May 2018 16:55:14 -0400
Message-Id: <20180516205514.11301-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.17.0.rc2.3.gc2a499e6c
Subject: [meta-networking][master-next][PATCH v2] grpc: switch away from github archive
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
X-List-Received-Date: Wed, 16 May 2018 20:55:18 -0000

Since we know that github archives which are automatically generated have a
tendency to change their checksums[1], switch to using a git clone.

[1] http://lists.openembedded.org/pipermail/openembedded-devel/2017-September/114916.html

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
changes since v1:
- rebase on master-next
---
 meta-networking/recipes-devtools/grpc/grpc_1.8.5.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-networking/recipes-devtools/grpc/grpc_1.8.5.bb b/meta-networking/recipes-devtools/grpc/grpc_1.8.5.bb
index 0883ec176b..a0c943d114 100644
--- a/meta-networking/recipes-devtools/grpc/grpc_1.8.5.bb
+++ b/meta-networking/recipes-devtools/grpc/grpc_1.8.5.bb
@@ -10,13 +10,13 @@ DEPENDS_append_class-target = " gtest grpc-native "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI = "https://github.com/grpc/grpc/archive/v${PV}.tar.gz \
+S = "${WORKDIR}/git"
+SRCREV = "db68cb3652cc7697647e9934b5316d98a6ba04d1"
+BRANCH = "v1.8.x"
+SRC_URI = "git://github.com/grpc/grpc.git;protocol=https;branch=${BRANCH} \
            file://0001-CMakeLists.txt-Fix-libraries-installation-for-Linux.patch \
            file://0004-CMakeLists.txt-Find-c-ares-in-target-sysroot-alone.patch \
            "
-SRC_URI[md5sum] = "b565fa6787e42f4969395870c2ad436e"
-SRC_URI[sha256sum] = "df9168da760fd2ee970c74c9d1b63377e0024be248deaa844e784d0df47599de"
-
 SRC_URI_append_class-target = " file://0001-CMakeLists.txt-Fix-grpc_cpp_plugin-path-during-cross.patch"
 
 inherit cmake
-- 
2.17.0.rc2.3.gc2a499e6c


