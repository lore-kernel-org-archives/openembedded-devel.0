Return-Path: <twoerner@gmail.com>
Received: from mail-it0-f67.google.com (mail-it0-f67.google.com
	[209.85.214.67])
	by mail.openembedded.org (Postfix) with ESMTP id C4465745ED
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 May 2018 00:49:10 +0000 (UTC)
Received: by mail-it0-f67.google.com with SMTP id e20-v6so1193907itc.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 May 2018 17:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=335TBj03WF/ytdLo087+fKhE1CeyqKpWynMUu6CT5G0=;
	b=HCt2zJabkTQF6hTn93yX1Y+tug7W0joC3G1XMSLDrLtKcv7OExaS/vq1seBOOfxKG3
	UHPwGUHOuprfJ+ZDwwcOFO6R4DHYExZFUiJbG1R1o2jV+Itl3XdUR6QPJ9bkEeESV6vf
	ea7LgJMnhDAU1yZiQygpB6ExdiCi+entuNNeAxsjor6TGi0+Day8dbSr3ntmi/rPzrs4
	3wZ+WPa8NNE+kGVHTAB/f0JJf4jzX9tx+JiC6OK8wMYNXbqXdwGxFqEqNnRFXY7Jpquo
	vdfYhBshYf3o9aTMbTJYv4vBwKCG9VeefAA4XOJqb4a+pmvCyviOep5Lg4vomWe4pE7Q
	BIPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=335TBj03WF/ytdLo087+fKhE1CeyqKpWynMUu6CT5G0=;
	b=sGySqzkkSTeSPDnw1jf8hScequr9Zw68U6uFaCzgOrfBlCJ65CND4SsjGa6xBA01hy
	95MxQlwg5qc5w+KcIq0Qad48Il0uABXvKViI/GAuodNWXf674mqh8JfNbliUC3EmECLK
	XsTi9mw2vV4+yYj8Vjp6sj1VFK1EwIfkxvUQ/3TYKjSHuZ2myrCg+MMVvRE/QVH25mib
	Or9UneF0BmWYiQwvN4TbT/5A32l5T1Y1UlPh3EieVPqmMOVWmCnGZTZ+TCO3W7zOSJVW
	QHD26Xe+qGF4TtYxOhwhkzePc31T6m+J2iPLcm6UnzWkdmhAPS0qkvVA+x5s7hFUO+Ex
	U+hA==
X-Gm-Message-State: ALKqPwdN2zw15ddiNdbLLk1Qx9trNdCNxDFy5D8ws53b32hD/ruk2HoT
	PEIceM+WDlQeyVy/weQLqz0e7bnR
X-Google-Smtp-Source: AB8JxZp+k6Gaat3s6OjnLAU5k2//VLl5C7ifoQN1VfX1Cc7tu1JbIv+i8fUIPcfutC91WBb3K/RwAw==
X-Received: by 2002:a24:6ec1:: with SMTP id
	w184-v6mr11684903itc.57.1525913351345; 
	Wed, 09 May 2018 17:49:11 -0700 (PDT)
Received: from linux-uys3.suse ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id
	z88-v6sm14943917ioi.25.2018.05.09.17.49.09
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 09 May 2018 17:49:10 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 May 2018 20:49:08 -0400
Message-Id: <20180510004908.26947-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.17.0.rc2.3.gc2a499e6c
Subject: [meta-multimedia][PATCH v2] openh264: switch away from github archive
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
X-List-Received-Date: Thu, 10 May 2018 00:49:11 -0000

Since we know that github archives which are automatically generated have a
tendency to change their checksums[1], switch to using a git clone.

[1] http://lists.openembedded.org/pipermail/openembedded-devel/2017-September/114916.html

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---

Changes since v1:
 - replace the frankenstein local variable name OPENHBRANCH with simply BRANCH
   to hold the name of the branch to use

---
 .../recipes-multimedia/openh264/openh264_1.7.0.bb          | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/openh264/openh264_1.7.0.bb b/meta-multimedia/recipes-multimedia/openh264/openh264_1.7.0.bb
index a7aaab3623..40bd493e6d 100644
--- a/meta-multimedia/recipes-multimedia/openh264/openh264_1.7.0.bb
+++ b/meta-multimedia/recipes-multimedia/openh264/openh264_1.7.0.bb
@@ -11,9 +11,10 @@ LICENSE = "BSD-2-Clause"
 LICENSE_FLAGS = "commercial"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bb6d3771da6a07d33fd50d4d9aa73bcf"
 
-SRC_URI = "https://github.com/cisco/openh264/archive/v${PV}.tar.gz"
-SRC_URI[md5sum] = "93da4e76cfda7ede8fd2df51b0021efd"
-SRC_URI[sha256sum] = "9c07c38d7de00046c9c52b12c76a2af7648b70d05bd5460c8b67f6895738653f"
+S = "${WORKDIR}/git"
+SRCREV = "a180c9d4d6f1a4830ca9eed9d159d54996bd63cb"
+BRANCH = "openh264v1.7"
+SRC_URI = "git://github.com/cisco/openh264.git;protocol=https;branch=${BRANCH};"
 
 COMPATIBLE_MACHINE_armv7a = "(.*)"
 COMPATIBLE_MACHINE_aarch64 = "(.*)"
-- 
2.17.0.rc2.3.gc2a499e6c


