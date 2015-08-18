Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-pd0-f172.google.com (mail-pd0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id 1BC4260043
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Aug 2015 16:50:09 +0000 (UTC)
Received: by pdob1 with SMTP id b1so14574843pdo.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Aug 2015 09:50:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-type:content-transfer-encoding;
	bh=8F3ECwRaDWTen8DHOVF7U4rsvzNZGUvBubOEBUfLNCU=;
	b=hbK2THMI8zHiG8m6Z/QHzrjqF2fTAYK3FSWtuL/GKB3F0PHNUAQFNJerfzVSYEuJJJ
	uBmIQiaX3o+W6lB2KzOSX/tP+XcxGaV9RvzXPSFo07OThtFt0qV4nGkGpjrxQ14QSBp9
	FYiU6fM8qo32jOqokd0pqKnIp95VRS2Oq9pSzwUZFrHI9nTxQCGDTaYBe5fRd99Oh3jS
	TAm1vwrTzNDijfSzSOWL30b3h3rHspMOgiQ1s+qtNXdWu7H2Yst6a3jefwxJWB7cHrpw
	oJ9Zlghp+GvoImMeq9fDc5Z0eDVqPgB1cbXMXHPVTiLbaZpxiA6vUWUzax7fCFPB5wji
	15Fw==
X-Gm-Message-State: ALoCoQksaQthRvUcRhr4hIV3QkfvoHT70Hsp3FKWFU8ZqZbHmQvlt6oPthorfeh3A2L2BhCOv6OP
X-Received: by 10.70.53.101 with SMTP id a5mr15246026pdp.49.1439916610051;
	Tue, 18 Aug 2015 09:50:10 -0700 (PDT)
Received: from ubuntu64.mvista.com ([111.93.218.67])
	by smtp.gmail.com with ESMTPSA id
	un2sm18797034pac.28.2015.08.18.09.50.08
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 18 Aug 2015 09:50:09 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Aug 2015 22:19:53 +0530
Message-Id: <1439916593-11597-1-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] pmtools: add new recipe
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
X-List-Received-Date: Tue, 18 Aug 2015 16:50:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

pmtools contains small collection of power management test and
investigation tools,
acpidump - dump a system’s ACPI tables to an ASCII file
acpixtract - convert ASCII acpidump output to raw binary table
madt -  parser for ACPI table

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 .../recipes-devtools/pmtools/pmtools_20130209.bb   | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/pmtools/pmtools_20130209.bb

diff --git a/meta-oe/recipes-devtools/pmtools/pmtools_20130209.bb b/meta-oe/recipes-devtools/pmtools/pmtools_20130209.bb
new file mode 100644
index 0000000..1d278fc
--- /dev/null
+++ b/meta-oe/recipes-devtools/pmtools/pmtools_20130209.bb
@@ -0,0 +1,27 @@
+DESCRIPTION = "This is a small collection of power management \
+               test and investigation tools"
+HOMEPAGE = "http://lesswatts.org/projects/acpi"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
+
+PR = "r0"
+
+SRC_URI = "https://github.com/anyc/${BPN}/archive/${PV}.zip"
+SRC_URI[md5sum] = "98b63903e61b1145b1b17bcfef6ac0b4"
+SRC_URI[sha256sum] = "a043a959d44d616f06dedd30e2045e8e95fed93580e2c146818b6ed3a4b6e448"
+
+COMPATIBLE_HOST = "(i.86|x86_64).*-linux"
+
+do_configure[noexec] = "1"
+
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


