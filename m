Return-Path: <ankit.tarot@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id 7D5B971A36
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Oct 2018 04:43:51 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id f8-v6so10372116plb.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Oct 2018 21:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=etdl1xhJAxGlLrmv7h/FyKDmxAZz6Zb3D0fKQpMCBkI=;
	b=mxfz4JgU4nUe5NCKDllEp3SzMliTIMsPWwoRzORtHEeWq76Zk2eCuls4mQKH+O4DR6
	N1RNjCJhHTyMjV1a8CtykIF/oldhc6Tvak/BnHEa+JwbE2PqsA6UaDxBcCMzL3h8/tuY
	UTMqCBzMIBgiqS4mCK6H+iYPW4ao71PzOjDf72IcM64uLZKtjOrnqwamTqa/P8uZhMaj
	f8DFLLdgw/rsAQqRrfFIhCLItGQaUf4I3htbBYzVdCnwebnKm9JCN7rbG8aagqsEEnIj
	IAZkh0SHydeWCGR8gvNtYvW7mC82qv3k7oYjrIsDirYFqxxn//0wWivfnXGIHM0k22VY
	rvyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=etdl1xhJAxGlLrmv7h/FyKDmxAZz6Zb3D0fKQpMCBkI=;
	b=b7mZEKmwzp25PaQFkXhF7lHi4XU8aBmo03TSJoIh3+nRkZgZx9OyvWA3o2sZCdrFfP
	1KMRZOsnHFCXuLmfwZf3ssK2OiQh1CW34Dtmg7tETEPOWO0dEp/VFrP/xAytCUlI6ZWl
	xcXyiIv+xhTg0t6fOQXh3/CPgYbAGCsL2RsPlu2CvSJ9mfsHeUWJiyrbfJ4WWUH90y20
	9Hfl1A2q6M0OTmh9U2rUlao1inzDLqVCfqsuFxZWV2kEMuE2iZv0Tp30s3Q+SkOHrqmi
	Pkz9KtmGJCVqraZlw0c7Sl14P/lI/QEK5SYbKVKeW1/Od8Om/xkQX5yAMKVyxZPYlQAp
	BThg==
X-Gm-Message-State: ABuFfohZ+cGYU+9JnB+IhLQRtqwQFI7EICRxFZQVXSi+0pzLpXOiq5cX
	y88sx8XddOGeCDjf17Jxc9J8/3AwPfo=
X-Google-Smtp-Source: ACcGV63cFXZHWqGcNXRj9J/spe06Mq1eUStOI51+O0840gV1hxIcsiT0AcivhSPkJUABe8+7/r1W1w==
X-Received: by 2002:a17:902:6a83:: with SMTP id
	n3-v6mr20201262plk.288.1539665032303; 
	Mon, 15 Oct 2018 21:43:52 -0700 (PDT)
Received: from ankit.iind.intel.com (fmdmzpr04-ext.fm.intel.com.
	[192.55.54.39]) by smtp.gmail.com with ESMTPSA id
	m27-v6sm21127808pff.187.2018.10.15.21.43.50
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 15 Oct 2018 21:43:51 -0700 (PDT)
From: Ankit Navik <ankit.tarot@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 16 Oct 2018 10:10:28 +0530
Message-Id: <1539664828-29601-1-git-send-email-ankit.tarot@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH v3] opencl-headers: Initial recipe for OpenCL headers
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
X-List-Received-Date: Tue, 16 Oct 2018 04:43:51 -0000

Add generic recipe for OpenCL API headers.

Suggested-by: Burton, Ross <ross.burton@intel.com>
Signed-off-by: Ankit Navik <ankit.tarot@gmail.com>
---
 .../recipes-core/opencl-headers/opencl-headers_git.bb   | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-oe/recipes-core/opencl-headers/opencl-headers_git.bb

diff --git a/meta-oe/recipes-core/opencl-headers/opencl-headers_git.bb b/meta-oe/recipes-core/opencl-headers/opencl-headers_git.bb
new file mode 100644
index 0000000..818fd31
--- /dev/null
+++ b/meta-oe/recipes-core/opencl-headers/opencl-headers_git.bb
@@ -0,0 +1,17 @@
+SUMMARY  = "OpenCL API Headers"
+DESCRIPTION = "OpenCL compute API headers from Khronos Group"
+LICENSE  = "Khronos"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=dcefc90f4c3c689ec0c2489064e7273b"
+SECTION = "base"
+
+S = "${WORKDIR}/git"
+SRCREV = "40c5d226c7c0706f0176884e9b94b3886679c983"
+SRC_URI = "git://github.com/KhronosGroup/OpenCL-Headers.git"
+
+do_configure[noexec] = "1"
+do_compile[noexec] = "1"
+
+do_install () {
+	install -d ${D}${includedir}/CL/
+	install -m 0644 -D -t ${D}${includedir}/CL ${S}/CL/*.h
+}
-- 
1.9.1


