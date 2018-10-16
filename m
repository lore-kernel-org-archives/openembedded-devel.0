Return-Path: <ankit.tarot@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id 3A6606FFC8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Oct 2018 17:50:31 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id i4-v6so11189892pgq.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Oct 2018 10:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=8skbaLtG/WjhAfgh45Pwac2jVqcrAoqZWIjt47mREcY=;
	b=varDhcxiP5hcM7akrHwNVL+kPbfaWwUZyeqbHoV1KWo+WpvDSh5Gg/UAfa4GslGY/F
	wgj/TPF2yxELhTTwTHAqUKmlxm2DAXBtr/4q/0VclkmX+nh9P7qyhEk3MYBbasH8JFXx
	6CAtmjS5vVlOnWSVb3m/6nlRMk5wJ6+bITQs6Jyb9kJLhTFIgMHMYR7N+iX6H5vXL4kj
	S+c5TA0Id/ufi1PPE6jku3ZqIU0jLbvIFX+g1hj2ADLdQwal8m7dJmVXeM2Vke5+pVOa
	7llMhPOV9SyeZdu3PiUd+rl/pGLPFxcx/OCvxqLeFVMYycMilQA1VHy2s5yBl5MnF+lj
	VwJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=8skbaLtG/WjhAfgh45Pwac2jVqcrAoqZWIjt47mREcY=;
	b=Ok1gDoCCDIeHvcg/DYJnBLb/dDJb+laFAU0eRGbBKU6m/KrX4TvcoXyDnBP3+9hNfy
	dN6itX9k8EKQYRKE8LEspAo/tnxM6hfoHJ2HcCI6Uq9HOMAS2kw1eMPePu5G/2C2937N
	Zk/1XqiRNRH2rJM3v9gI/vWNqftb6N/gQ+KBYQZVsb11qC0hHbzOFm2c6xwNyLc+6LwS
	GuRjaqew8OoAwXysQsSJXHpk/ZaUJzHxPHlGSaQmfG7MUFBjLy2xygFflIoL4a0kHtks
	6ImrJaBhUL13FZ1+wVeEJrMckyS9nRrv7uRElO9WeQTN/VN0HyVUGuRcNqXVrmwnUl6a
	KfAg==
X-Gm-Message-State: ABuFfoj/l0zSaixKpvzeHZcgCpofC3aY0RgxEIIxRkTlZA+MaA/tio0X
	YmV+lm+iwPDOFtJFnUkaJmAFzx0h0uE=
X-Google-Smtp-Source: ACcGV623kHhAMcS4Fej4yMANkVohqCg8v2PvdFYn/v6ToTbowZpWjXFS1tnTFZxommAv2C944iVczw==
X-Received: by 2002:a62:5441:: with SMTP id
	i62-v6mr23177936pfb.155.1539712231868; 
	Tue, 16 Oct 2018 10:50:31 -0700 (PDT)
Received: from apnavik-DESK.iind.intel.com (fmdmzpr03-ext.fm.intel.com.
	[192.55.54.38]) by smtp.gmail.com with ESMTPSA id
	74-v6sm23516207pfx.182.2018.10.16.10.50.29
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 16 Oct 2018 10:50:31 -0700 (PDT)
From: Ankit Navik <ankit.tarot@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 16 Oct 2018 23:19:02 +0530
Message-Id: <1539712142-6197-1-git-send-email-ankit.tarot@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <CAMKF1sqb-asvC5rAvxnLD4ahUEZFBih+JHfuECWvoc_ZoTbYsg@mail.gmail.com>
References: <CAMKF1sqb-asvC5rAvxnLD4ahUEZFBih+JHfuECWvoc_ZoTbYsg@mail.gmail.com>
Subject: [PATCH v4] opencl-headers: Initial recipe for OpenCL headers
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
X-List-Received-Date: Tue, 16 Oct 2018 17:50:31 -0000

Add generic recipe for OpenCL API headers.

Suggested-by: Burton, Ross <ross.burton@intel.com>
Signed-off-by: Ankit Navik <ankit.tarot@gmail.com>
---
 .../recipes-core/opencl-headers/opencl-headers_git.bb   | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-oe/recipes-core/opencl-headers/opencl-headers_git.bb

diff --git a/meta-oe/recipes-core/opencl-headers/opencl-headers_git.bb b/meta-oe/recipes-core/opencl-headers/opencl-headers_git.bb
new file mode 100644
index 0000000..dec1bea
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
+	install -m 0644 ${S}/CL/*.h ${D}${includedir}/CL
+}
-- 
1.9.1


