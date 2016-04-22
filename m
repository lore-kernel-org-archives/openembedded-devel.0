Return-Path: <straka.derek@gmail.com>
Received: from mail-qg0-f42.google.com (mail-qg0-f42.google.com
	[209.85.192.42])
	by mail.openembedded.org (Postfix) with ESMTP id E811C6E667
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Apr 2016 17:37:24 +0000 (UTC)
Received: by mail-qg0-f42.google.com with SMTP id f92so10256008qgf.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Apr 2016 10:37:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Tdy5tcF8kvvrDVXJB4e0iTckNbgvasumI6q+Gik9e3E=;
	b=U4jrukG+bqGDEcCWIRBJqP40lZBIPvDc5hC5dsE0pvosJzPlb/CI0LSA4kALLFy7V8
	w+CuEelc3TByYN5v8mGd+r5wuV+SQYum6tkyC3ZjhhYQ13edRFu0F7b1lIxeeMIjYPrZ
	wmd/b72vHLX9wBkyNahEeB4Cckv7Sjphs3ycl9OccRzqSjI9L6lsPSh1zwSQ658sZFUC
	Y0VoS4V9zyOil1ihfKBqTKBRKE14IhLbfPZkRvBvbQelAhshs2h1irkKwuih/Q/kW5p1
	s+G87+XASY+RSfZIOr2uouTvdPDBYVc3KJFne6gcZXjs3API50KMdjbRdoxN80dVlPLr
	2MNA==
X-Gm-Message-State: AOPr4FW0yjIBZEcqEWKAY4kDC8xSTqkj0Cw0RGQ8IbP9kHS8ZWcnBbuEKoWO5xpyTPcR9A==
X-Received: by 10.141.46.71 with SMTP id x68mr24263266qhe.70.1461346645049;
	Fri, 22 Apr 2016 10:37:25 -0700 (PDT)
Received: from lnx-desktop.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	s85sm2680733qke.29.2016.04.22.10.37.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 22 Apr 2016 10:37:24 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Apr 2016 13:37:15 -0400
Message-Id: <1461346635-29910-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-oe][PATCH] libio-pty-perl: update to version 1.12
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
X-List-Received-Date: Fri, 22 Apr 2016 17:37:25 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../perl/{libio-pty-perl_1.10.bb => libio-pty-perl_1.12.bb}         | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-devtools/perl/{libio-pty-perl_1.10.bb => libio-pty-perl_1.12.bb} (54%)

diff --git a/meta-oe/recipes-devtools/perl/libio-pty-perl_1.10.bb b/meta-oe/recipes-devtools/perl/libio-pty-perl_1.12.bb
similarity index 54%
rename from meta-oe/recipes-devtools/perl/libio-pty-perl_1.10.bb
rename to meta-oe/recipes-devtools/perl/libio-pty-perl_1.12.bb
index a5f887f..b1a95e5 100644
--- a/meta-oe/recipes-devtools/perl/libio-pty-perl_1.10.bb
+++ b/meta-oe/recipes-devtools/perl/libio-pty-perl_1.12.bb
@@ -1,12 +1,12 @@
 SUMMARY = "Perl module for pseudo tty IO"
 SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0+"
-LIC_FILES_CHKSUM = "file://META.yml;beginline=7;endline=8;md5=f86a66cc3d9522a227298d6898b181a2"
+LIC_FILES_CHKSUM = "file://META.yml;beginline=11;endline=12;md5=b2562f94907eeb42e8ce9d45f628e587"
 
 SRC_URI = "http://www.cpan.org/modules/by-module/IO/IO-Tty-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "46baec86a145e57f0ec661fa412b097c"
-SRC_URI[sha256sum] = "31a6e21ad187ec5ea93c2b898d6b3519647c5fce9f394b6d3c05a1f7c3f6f8b1"
+SRC_URI[md5sum] = "11695a1a516b3bd1b90ce75ff0ce3e6d"
+SRC_URI[sha256sum] = "a2ef8770d3309178203f8c8ac25e623e63cf76e97830fd3be280ade1a555290d"
 
 S = "${WORKDIR}/IO-Tty-${PV}"
 
-- 
1.9.1


