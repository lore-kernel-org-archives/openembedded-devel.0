Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id 2860D608B7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Aug 2015 10:23:05 +0000 (UTC)
Received: by paccq16 with SMTP id cq16so254232pac.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Aug 2015 03:23:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-type:content-transfer-encoding;
	bh=1H7IrvhK5ZHvp3Dq1R1EyXyPE7vZZb1o+uhIfyHvE9k=;
	b=GGRbxutlpZHe3b8wkY4bnyKYMOX3Nh9LR4zCFdK98crGfRJLwrgBZJWIw6UpXKfPdf
	YluQkzz5ZxGKDpsyiJcr9boAQGHFh/16hjLTV5w8yJOTcUj1FblCuFMH0YC8S7psZnzX
	kTV6XwHElL08QkqUwJGzWB8i3h4FFWs7LKQqu3EFV+WApBvfDfSWfkbKzknrbFbuE5NE
	nNVGZP1Txk90zDHUn3MR8xxWMAZS/z+ezV/hQyXUbMaqiohiDnT3JpgRsxYccAtKYlwV
	CHjZY3Qsx+iGlh88gdV9a3aXFdZcAHFMQamtPVcpnUpbqaMWOlsPMV5319+wwTmQECFA
	r2Sg==
X-Gm-Message-State: ALoCoQkMvnjAJ2cZwd+a3pcIGCOVCLAAGC5EmbFTTgK1QVfImJGiygCFvuw/capttAnI5LRUsizl
X-Received: by 10.66.185.165 with SMTP id fd5mr16390121pac.32.1439979785710;
	Wed, 19 Aug 2015 03:23:05 -0700 (PDT)
Received: from ubuntu64.mvista.com ([111.93.218.67])
	by smtp.gmail.com with ESMTPSA id ak10sm369639pad.3.2015.08.19.03.23.03
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 19 Aug 2015 03:23:05 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 19 Aug 2015 15:52:56 +0530
Message-Id: <1439979776-3789-1-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH v2] pmtools: add new recipe
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
X-List-Received-Date: Wed, 19 Aug 2015 10:23:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

pmtools contains small collection of power management test and
investigation tools,
   acpidump - dump a system’s ACPI tables to an ASCII file
   acpixtract - convert ASCII acpidump output to raw binary table
   madt -  parser for ACPI table

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 meta-oe/recipes-devtools/pmtools/pmtools_git.bb | 27 +++++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/pmtools/pmtools_git.bb

diff --git a/meta-oe/recipes-devtools/pmtools/pmtools_git.bb b/meta-oe/recipes-devtools/pmtools/pmtools_git.bb
new file mode 100644
index 0000000..602da5e
--- /dev/null
+++ b/meta-oe/recipes-devtools/pmtools/pmtools_git.bb
@@ -0,0 +1,27 @@
+DESCRIPTION = "This is a small collection of power management \
+               test and investigation tools"
+HOMEPAGE = "http://lesswatts.org/projects/acpi"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
+
+PV = "20130209+git${SRCPV}"
+
+SRC_URI = "git://github.com/anyc/pmtools.git;protocol=https"
+SRCREV = "3ebe0e54c54061b4c627236cbe35d820de2e1168"
+
+COMPATIBLE_HOST = "(i.86|x86_64).*-linux"
+
+S = "${WORKDIR}/git"
+
+do_configure[noexec] = "1"
+do_compile() {
+	oe_runmake
+}
+
+do_install() {
+	install -d ${D}${bindir} ${D}${docdir}
+	install -m 755 ${S}/acpidump/acpidump ${D}${bindir}
+	install -m 755 ${S}/acpixtract/acpixtract ${D}${bindir}
+	install -m 755 ${S}/madt/madt ${D}${bindir}
+	install -m 644 ${S}/README ${D}${docdir}
+}
-- 
1.9.1


