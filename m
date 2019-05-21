Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
	[209.85.215.181])
	by mail.openembedded.org (Postfix) with ESMTP id DA0BC7E106
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2019 03:57:03 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id h17so7854711pgv.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 May 2019 20:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=4BMGhy3qrCxCBTM1mwBcn5ISfc5lvk6seT4q0Sagd6I=;
	b=Nii0wiKfsRz9Fi50pXWy2yJR4yItir7nUmrwnJEKrfP7LcoKRybXkDsGDThAMqMDmZ
	XDyUMXcOT9eGE/f6BzjHOdl+9nC6lLffwqjBD32/VrS0sEB1WhioyGQMf9eLcJ5Hhs02
	qSDPYWspKZ4pLYCEFtEU+dGaqYMRYt/nKPWNJf+fU3WJY/ggq0Bsm+5PYENkUzwqe0M6
	Q7+0RZBUX4XezB9SQhrgOSV2j6tSiNUg4i107yi1c9/3RoDrCSpRXNZ/gsD168AAH9oI
	RFEMCkuCAzSieh75KACxFc+/3TAXBNvFHAMKMN5g7SJJTCwVQQSEwUNKt8XHDisxmidT
	CW/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=4BMGhy3qrCxCBTM1mwBcn5ISfc5lvk6seT4q0Sagd6I=;
	b=R8ka4FwPIg/d4UVd9Z/glZtVAnbnOazg0wRtyKD2BL7IMa07OSNbJYUKEQmvdpTlbr
	/pmKD9wKYtIhN6ZpJKlnzg4W0OJjJWgwM0AaT2x+ak0mN5aTRuq1y+eoJAJzj0qhdyEG
	9JzAhOwYZvD/ggXp+qYDf815Fm5n/II+kQ9DZ12xqOdblrD7NtA1713KkMtIL+1xim5v
	qj5mXQymJ5e3F1RMQYYTKdkwoq4GBj+Oo8lLmkEYbwxFmNndDNaqVGI+Aj36H6YsOAT8
	gswLYsaMreaGpbdu/33tLk+TYLzBM+sJnsXXet/7AbAJBlv7b8/l1vK0t934iM7f0FVh
	0dng==
X-Gm-Message-State: APjAAAVG90RLQB1Pxv91u7oicDsrEsk2STS3der+0KS5N5oFMrNSWiHb
	OO1VVm6l/ZEOyakvO8LXJddAq8ED
X-Google-Smtp-Source: APXvYqxLXRaC+cMH5drGRoWJFpdsU/XlZu+unUrtZegCw2L5QsjRFjCLX0efHkGa7RQv0w4UopVazg==
X-Received: by 2002:a62:4e86:: with SMTP id c128mr83943776pfb.39.1558411024807;
	Mon, 20 May 2019 20:57:04 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:199d:e2fe:5a4f:97f4])
	by smtp.gmail.com with ESMTPSA id
	h13sm23045273pfo.98.2019.05.20.20.57.04
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 20 May 2019 20:57:04 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 May 2019 20:56:33 -0700
Message-Id: <4c4d69a8556ee047508a871bd130b19e94d34f41.1558410874.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1558410874.git.akuster808@gmail.com>
References: <cover.1558410874.git.akuster808@gmail.com>
Subject: [warrior][patch 33/34] libdbi-perl: prevent native libdbi-perl depending on target perl
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
X-List-Received-Date: Tue, 21 May 2019 03:57:04 -0000

From: Martin Jansa <martin.jansa@gmail.com>

* detected with:
  openembedded-core/scripts/sstate-diff-machines.sh --tmpdir=tmp-glibc --machines="qemux86 qemux86copy qemuarm" --targets="libdbi-perl-native" --analyze
  ...
  ERROR: libdbi-perl-native different signature for task do_populate_sysroot.sigdata between qemux86 and qemuarm
  Hash for dependent task perl-sanity/perl_5.28.2.bb.do_populate_sysroot changed from 00c0f30e40a144255fc3054e9a71ce73170a89832318774bd2a8fc5e8dcd20ad to e22ff8375c4ee6bda646dae8a1d6b1ddeb6d373678fc036fdc406e91a026b497

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-devtools/perl/libdbi-perl_1.642.bb | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-devtools/perl/libdbi-perl_1.642.bb b/meta-oe/recipes-devtools/perl/libdbi-perl_1.642.bb
index 3c03164..ff4a9d0 100644
--- a/meta-oe/recipes-devtools/perl/libdbi-perl_1.642.bb
+++ b/meta-oe/recipes-devtools/perl/libdbi-perl_1.642.bb
@@ -7,10 +7,11 @@ database interface independent of the actual database being used. \
 HOMEPAGE = "http://search.cpan.org/dist/DBI/"
 SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0+"
-RDEPENDS_${PN} = " perl-module-carp \
-                   perl-module-exporter \
-                   perl-module-exporter-heavy \
-                   perl-module-dynaloader \
+RDEPENDS_${PN}_class-target = " \
+    perl-module-carp \
+    perl-module-exporter \
+    perl-module-exporter-heavy \
+    perl-module-dynaloader \
 "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=10982c7148e0a012c0fd80534522f5c5"
-- 
2.7.4


