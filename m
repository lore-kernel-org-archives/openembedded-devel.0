Return-Path: <prvs=087ee24f7=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id C1D837EDF9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jul 2019 07:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
	t=1562743998; x=1594279998;
	h=from:to:cc:subject:date:message-id:mime-version:
	content-transfer-encoding;
	bh=t6iIhU75sflRcNin3uQD6aM4+VLFn9aRL8DUMgje3Ag=;
	b=bySfVmJKmpZIlS9nv45Vmk7ClRlNg4XOjMiEeI7ZfOwBelmrMFfqnEtI
	EPUywz8uta9T75u2y57d3R0nP5pqAKryGpRIawBWGa1XBZFVlgsLHujqH
	YNUha5Eo3mN+DwETTXBHivZywk/PuoskCGddZTqrw30ndrmWOYrrilXMw
	6iLn4+lFHS4IYFDMYzxMCEXYzea+5vKzTf5NG2xZ6O6epAr/fr4JHqNu3
	XpSUmLJqT7Tc2lhpF02k+DWEcB88RgLSosbRkwp10txYpLkUyYQNZmmPa
	gRYi4U6e+V/xJttkVKuUDWObLCc/5SGYBqcMBFxXzrfUfNJXHWbx9qJGO A==;
IronPort-SDR: StHENnD6xpLJWddRULa/XCZ+gMN0we/m7sBP9ym1zqwlQOYmtIk7yZTkrQUjVe9zBjSBI3JJB/
	0pahBDB+G+1YUvJWU+p9V1UqsIBTOntII50SXfPi8ivHmyTsh63vQQ8yRU3im+wf21So3SlVAW
	1rl/lZReiTTMC1nrdTvSZx2IJDhCWL3sOWb9sYsE08Ywmz9YMMLdGbX6aDB6cp64RwqH75jrOa
	esgP3G01bA9NdF1U236hPdSJFNSZxLzjF4K2mquF3UXX7cslA/Krl712JQH78EwaLd4PihHK7p
	5tE=
X-IronPort-AV: E=Sophos;i="5.63,473,1557180000"; d="scan'208";a="18259420"
From: Richard Leitner <richard.leitner@skidata.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 10 Jul 2019 09:33:01 +0200
Message-ID: <20190710073301.21945-1-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex4srv.skidata.net (192.168.111.82) To
	sdex5srv.skidata.net (192.168.111.83)
Subject: [meta-java][PATCH] openjdk7: fix arm32JIT with current gcc versions by disabling optimizer
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
X-List-Received-Date: Wed, 10 Jul 2019 07:33:18 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This works around a severe error in the arm32JIT when built with current gcc
cross compiler versions with O1 (or higher) set.

There were different errors thrown for this problem when built on
different machines, some of them are:

	fatal error: only PUSH_EA or PUSH_FD available on Thumb
or
	Segmentation Fault
or
	Illegal instruction

The currently only "solution" found was to disable the optimizer
completely. This is a quite dirty fix, and more elegant fixes are warmly
welcome!

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
 recipes-core/openjdk/openjdk-7_99b00-2.6.5.bb | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/recipes-core/openjdk/openjdk-7_99b00-2.6.5.bb b/recipes-core/openjdk/openjdk-7_99b00-2.6.5.bb
index aa165f5..3fd17cd 100644
--- a/recipes-core/openjdk/openjdk-7_99b00-2.6.5.bb
+++ b/recipes-core/openjdk/openjdk-7_99b00-2.6.5.bb
@@ -78,3 +78,14 @@ export DISTRIBUTION_PATCHES
 #
 # NOTE: When updating the recipe, please check if this is still needed
 CFLAGS_append = " -Wno-error=deprecated-declarations -Wno-error=narrowing -fpermissive"
+
+# the zero arm32JIT crashes during runtime when built with current gcc versions.
+# The following compile adaptions provide a workaround for this issues.
+ARM_INSTRUCTION_SET = "arm"
+TARGET_CFLAGS_remove_arm = "-O2"
+TARGET_CXXFLAGS_remove_arm = "-O2"
+TARGET_CPPFLAGS_remove_arm = "-O2"
+CFLAGS_remove_arm = "-O2"
+CXXFLAGS_remove_arm = "-O2"
+CXXFLAGS_append_arm = " -O0"
+CFLAGS_append_arm = " -O0"
\ No newline at end of file
-- 
2.20.1


