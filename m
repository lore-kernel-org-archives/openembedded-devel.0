Return-Path: <ankit.tarot@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 1DC2560191
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Oct 2018 13:12:41 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id a5-v6so9134917pgv.13
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Oct 2018 06:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=rQwWZ0EjAO4/JizaYPIpxM5gpStAxaDBcU8ISI4Egeg=;
	b=LhVvjqHDkqj7vCD8omIQpsy4dFBRH+IgSrTx3P9JboBTQ0VYjbRiRoP30l/eSNJ5OE
	bjNNPpfVzZjtNu56COWl0BOGZrRL57TDR4ceJiRWgRqEXcJofaE7oTd0u8nf2qjZcF+I
	cOuEvQFKissG76dnyZXpkxT8+Wq8teR8IHHu7ExncvfnGP01E4rmB8S8nwoDumxXxwr8
	3amAIBfKR/sMv/M5IHcwTVzekG31psxlyL8CTpNKAdTFw29UkhgVtYyLCnNE2DKVa2HA
	2Jlg6Epqpm6RYNPKTsbce7l+pbB4jQFuEginNbAa1GvIvq7mAZxlaL3ed5o6R7seQtj5
	8X0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=rQwWZ0EjAO4/JizaYPIpxM5gpStAxaDBcU8ISI4Egeg=;
	b=KuHm7P4E9hZ2edKlkIn1t++RzZrINzqX3XU0vn/s70IwAlmp+Swi5l8mQ3CQX/qI8v
	UzxDAhHzgyXYLkyKLfjxekxV214M8600O3rFKH6M6YeumiRgbkL++3G4JKKZ7TqpIUdq
	0Ll546f/7d7A1RTI9EAM2e4anqNzf64BggZHYZymw0ZtJhrTi7VssKwVtuvGvlx2QyfW
	UwSN2J+SLmS4vl6xZfPbyXTl21nxPxKRbdmVu9TwouOiqT4A2XrsZppPbYvyhONtVNMV
	VNaoTx/CQESWnkpjqDvoN6PmveYWZMEvLk4KpeHoACQwV/G9cEZIGzIRhCwnPY5b9p7T
	BUZg==
X-Gm-Message-State: ABuFfogmIswWD2uOr/1XpjMl0HzP662qMsxSzhbURHORG1E+62vp5Tjk
	RKvzWEqAPs6HS5Sm3Gc/mD3Nx0SYWQ8=
X-Google-Smtp-Source: ACcGV60B3jHaiTifwz2rSmhHaIctXnL+KC7Tm7ffdmowL1L/95CiMCKR9NJKniBb+/Qck4o0Mxn2LA==
X-Received: by 2002:a63:2218:: with SMTP id
	i24-v6mr15968641pgi.238.1539609162686; 
	Mon, 15 Oct 2018 06:12:42 -0700 (PDT)
Received: from ankit.iind.intel.com ([192.55.54.41])
	by smtp.gmail.com with ESMTPSA id
	h32-v6sm1877731pgb.94.2018.10.15.06.12.41
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 15 Oct 2018 06:12:42 -0700 (PDT)
From: Ankit Navik <ankit.tarot@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Oct 2018 18:39:18 +0530
Message-Id: <1539608958-24081-1-git-send-email-ankit.tarot@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH v2] opencl-headers: Initial recipe for OpenCL headers
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
X-List-Received-Date: Mon, 15 Oct 2018 13:12:42 -0000

Add generic recipe for OpenCL API headers.

Signed-off-by: Ankit Navik <ankit.tarot@gmail.com>
---
 .../recipes-core/opencl-headers/opencl-headers_git.bb | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-oe/recipes-core/opencl-headers/opencl-headers_git.bb

diff --git a/meta-oe/recipes-core/opencl-headers/opencl-headers_git.bb b/meta-oe/recipes-core/opencl-headers/opencl-headers_git.bb
new file mode 100644
index 0000000..3bcb3f6
--- /dev/null
+++ b/meta-oe/recipes-core/opencl-headers/opencl-headers_git.bb
@@ -0,0 +1,19 @@
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
+	for f in ${S}/CL/*.h; do
+		install -m 0644 $f ${D}${includedir}/CL/
+	done
+}
-- 
1.9.1


