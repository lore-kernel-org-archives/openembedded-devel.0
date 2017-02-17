Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f52.google.com (mail-it0-f52.google.com
	[209.85.214.52])
	by mail.openembedded.org (Postfix) with ESMTP id DCE23719AC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Feb 2017 13:14:43 +0000 (UTC)
Received: by mail-it0-f52.google.com with SMTP id k200so13301891itb.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Feb 2017 05:14:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=OtRsgbkN7JjcAFWPLsYsZ2btoCMlBD1sTxNe6QpHAUI=;
	b=2LCy8wxaYWLmmm9Jro9Glk0MNM7K9NBWWilUOhrN614vvAnwhi/WuL/LvVmIEhnNsp
	NGoo3+XLaW4txwfYNBk6tI9RSkcSqYbapYePvHusQNdBRYt3+3n0no4cPE1WhisI7nu6
	QYAshjU1q7xfcS8GOu29AdwcSjr5yy+gpXqQbBALtnIrqPFf9RTuWEuLgZyMHtTvArYE
	De17vTn9kcdMc8aeoBAz1e7d+qTLIvAKlsCavl1pNrVZAW9t4L2B51YX+EzEVGWKWMUM
	IjDf7msiepp7TpZS8V4BMxxcM1JZkzyyHSTulASCqOtDpDgDUNRWJMZelivbSpmMFNM1
	NtIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=OtRsgbkN7JjcAFWPLsYsZ2btoCMlBD1sTxNe6QpHAUI=;
	b=A1AyJYJTkNYYX3zbgdTIEsDDzzE0vKm8emSjg6SHeeR8qSSUqwRsyNliaXuMAsSM2R
	XfivEOMCm4Hg8ftKWYWm3EPFdpbJckwQmrz9gkdcxti2ulMlMyUztRLIxkXi/pjfnT9Q
	zK9acyOttL4vXFbpCwQLHdPWgzVRjpg7FcAgnN//FTvTOXvXp/nzu2qR3s/zLIwwrYgP
	koJN00wloXZkgciDboOPnJq3Dn4KWu7xii93SZTy6B7qIOhoiy3s1ttX1BNAuYdNMz01
	nBgLNnRjNWiRpIK+lSZZZtgBJ5ZioAco3jmZGYHgCwwz+chNMq412M2i5pEUtWbCL6NP
	AvXA==
X-Gm-Message-State: AMke39nCW7qaCRwhMze8gVkkVDNdt0ClzWN7ECgrzDb2upSg7L4QCTQDDFs6cLruN+6+C1rz
X-Received: by 10.107.184.6 with SMTP id i6mr6787121iof.153.1487337283441;
	Fri, 17 Feb 2017 05:14:43 -0800 (PST)
Received: from pohly-desktop.fritz.box (p5DE8FD56.dip0.t-ipconnect.de.
	[93.232.253.86]) by smtp.gmail.com with ESMTPSA id
	n30sm4669021ioe.32.2017.02.17.05.14.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 17 Feb 2017 05:14:42 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 17 Feb 2017 14:14:33 +0100
Message-Id: <7c0bb7e31f494d156a237529fefda577b3a1843e.1487337000.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <b0a782f34afd1a1157936114a7288ef963521bd2.1487240872.git-series.patrick.ohly@intel.com>
References: <b0a782f34afd1a1157936114a7288ef963521bd2.1487240872.git-series.patrick.ohly@intel.com>
Subject: [meta-oe][PATCH v2] multipath-tools: fix ARM build failure
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
X-List-Received-Date: Fri, 17 Feb 2017 13:14:44 -0000

Updating to 0.6.4 introduced a build failure on ARM when thumb was
enabled because of the embedded valgrind.h macro calls. The easiest
solution and thus the one used here is to disable thumb for this
particular recipe for affected machines.

The more elaborate solution would be to patch the macro calls out of
the code when compiling for ARM with thumb.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb | 10 +++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb b/meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb
index 6706bec..effd92e 100644
--- a/meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb
+++ b/meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb
@@ -27,6 +27,14 @@ PV = "0.6.4+git${@'${SRCPV}'.split('+')[-1]}"
 
 TARGET_CC_ARCH += "${LDFLAGS}"
 
+# multipath-tools includes a copy of the valgrind.h header
+# file and uses the macros to suppress some false positives. However,
+# that only works on ARM when thumb is disabled. Otherwise one gets:
+#   Error: shifts in CMP/MOV instructions are only supported in unified syntax -- `mov r12,r12,ror#3'
+#   ../Makefile.inc:66: recipe for target 'debug.o' failed
+ARM_INSTRUCTION_SET_armv4 = "arm"
+ARM_INSTRUCTION_SET_armv5 = "arm"
+
 # The exact version of SYSTEMD does not matter but should be greater than 209.
 #
 EXTRA_OEMAKE = 'MULTIPATH_VERSION=${PV} DESTDIR=${D} syslibdir=${base_libdir} \
@@ -59,5 +67,3 @@ FILES_kpartx = "${base_sbindir}/kpartx \
                "
 
 RDEPENDS_${PN} += "kpartx"
-
-PNBLACKLIST[multipath-tools] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130529/"

base-commit: 044e5189549de11b2a94efd29a6009a76162b8f1
-- 
git-series 0.9.1

