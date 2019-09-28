Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id 150946C193
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Sep 2019 01:35:55 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id c17so4353038pgg.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Sep 2019 18:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=S7D9af+L5PGoP91wPIK0p7+J7CqM0vq3SRnsbXUDHxc=;
	b=dEnvvfsgEVHF1prNzcX4KCMboupjYJKu7as02QVZYFW1MaYE/YvVmO9FOxkqSav5+J
	GJF0KIIy+djFnSzsBwKVGivkhmMK0nkA4wBI1AsF2Rv5clY/HZwdzkbFLqdb//PuhKCa
	PCOUyKiJyITuhSQfiBK1PHrBk7uf4KDooBeJkCj0ugy7vp4TCLPtdlO5ROhnLOB1hhN8
	n9QjqNo1p5ElDRqmTY9FraCucS0karxlc8bQuEOi/BNgB2Epii/hRe/BodLE8getrrlV
	QC1yCQYimCOMgyBFUeIE2hSG6SfWOZ93VdTKpHLkKmg3aRHkU4yGISqQi+r3ilV8DkOO
	8gig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=S7D9af+L5PGoP91wPIK0p7+J7CqM0vq3SRnsbXUDHxc=;
	b=ScHyJ9KqG0OvxfGlhlC9vD1LzgDOIAO6vKxJ9nNyIJUnsfCkvLwdVyldj37PVcY4op
	fCtjGkH+/CqOR0yR9Vpnx/PVi0NZC5sQblauh3iZAyQE+oBI0alDtemqmLH/5Ydhh0fB
	6xji49fti3MPpmDkOvYMGMMPMYYWcu+aB9lqJxgQuesac8SwkuN72oLo9I9kmHYg9gPl
	F8SWrnxI+6ZJJ+dmEABU6K+TP3XTI47Jtv6hd62mM8TnSD+XdWMrLxp+RyNhV5cEOcEm
	NXgDXKv9rcRzlTWRhh/JTwblAAMs5fNaR2T/aXU1hUx5AcYHhlssvGHWriwEidBkg3mn
	ks4Q==
X-Gm-Message-State: APjAAAV8xerzeK/S4xbfn87LE5jMmjDG+NQQBBu6tYut2RCt/M4AS2LM
	jEuwPuRpkSOIzn2OHrbHMheJGtcXVUIkeA==
X-Google-Smtp-Source: APXvYqzCVAnjWPN6vWj0Lk2LGkqUDTrF5uatk8zGmL4GFh1E8ho2oR9k1WTbCDLN3OUnBuGWwHFw9A==
X-Received: by 2002:a63:cf4e:: with SMTP id b14mr12557799pgj.109.1569634556368;
	Fri, 27 Sep 2019 18:35:56 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	bx18sm5206525pjb.26.2019.09.27.18.35.55
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 27 Sep 2019 18:35:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Sep 2019 18:35:43 -0700
Message-Id: <20190928013543.3537073-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [meta-networking][PATCH] openipmi: Mark libOpenIPMI.so.0 as private lib in openipmi-perl
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
X-List-Received-Date: Sat, 28 Sep 2019 01:35:56 -0000
Content-Transfer-Encoding: 8bit

libOpenIPMI.so.0 is SONAME for openIPMI.so in openipmi-perl package
which means the shlibs code will automatically add it as a provider for
this shared library but actual public library is provided by openipmi
package, and it results in

ERROR: openipmi-2.0.27-r0 do_package: openipmi: Multiple shlib providers for libOpenIPMI.so.0: openipmi-perl, openipmi (used by files: /mnt/jenkins/workspace/Yocto-world-musl/build/tmp/work/aarch64-yoe-linux/openipmi/2.0.27-r0/packages-split/openipmi/usr/bin/openipmi_eventd)

The library in perl package is actually not required to compete to
provide for public interfaces

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-support/openipmi/openipmi_2.0.27.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-support/openipmi/openipmi_2.0.27.bb b/meta-networking/recipes-support/openipmi/openipmi_2.0.27.bb
index 51cc256890..f092780399 100644
--- a/meta-networking/recipes-support/openipmi/openipmi_2.0.27.bb
+++ b/meta-networking/recipes-support/openipmi/openipmi_2.0.27.bb
@@ -51,6 +51,7 @@ PACKAGECONFIG ??= "gdbm"
 PACKAGECONFIG[gdbm] = "ac_cv_header_gdbm_h=yes,ac_cv_header_gdbm_h=no,gdbm,"
 
 PACKAGES += "${PN}-perl ${PN}-python"
+PRIVATE_LIBS_${PN}-perl = "libOpenIPMI.so.0"
 
 FILES_${PN}-perl = " \
     ${libdir}/perl/vendor_perl/*/OpenIPMI.pm \
-- 
2.23.0


