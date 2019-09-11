Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id CDE207CDEB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Sep 2019 04:54:04 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id x15so10865870pgg.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Sep 2019 21:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=TqT369hXVe1TrXsuL1NJ8vDWCiYfTnMNYmXg8xHDZkc=;
	b=eGbNzxIyQtNTiNVyPTviVL8gz3fktCp4XxSlCxhHM3VDEJ6clYo0zWKcR4I0j8d60i
	SsnIhEmMrY0L8XWFzUrlqTGRFu9UjqmF8E2VJANUKxr1d+qM3J4XPDVulAubJW4c6/61
	C9/spKIQ3T6pqVXi0IQzdmGk0XVd4yWjHFnnKWo8Lt+vcyk0M+1xKdTzI3xf86lzQREE
	qYHrfNLTmXIebon1QcG1mfJ36xQt1aECvlQgNOsTCsPNiCjPcOhEfcmtly3joKr4r7Q1
	bl7lL/qbFfLrMbAeI3AtatPzhMIA1N9cWvDuZWcs0laYcXK3L5po1X2aW+RZZPOFWOXD
	8mKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=TqT369hXVe1TrXsuL1NJ8vDWCiYfTnMNYmXg8xHDZkc=;
	b=elwPo0X/smD+f5rkiT4Ejjgc9EnZj/SHUmVmSPZfsdcOjwV0nE0WU68EMCnK6tWyAx
	6PtK7sb358Qefi2W5ccL/ySOAVm8jL+4HtB/0YKzWUNbaSVjAk66i4TA7CY7xRjdXqVH
	oc/QXVs3AEkC3Js86kSxQA7fGiqDrLUhjTLyPHU7p/KDgJMu8rbDcoGJSQfe/WVLSLW8
	TT2eY9krQOKbhOMQ5XS0SU8fRjUlErXRh3uarj/JSUs67M1t1CF05jYbPL+sLmmLssYu
	yR+1YzxZDItrpvysBJ0TrKrLTvdE2GSOQ4feJe/ZZcp1KIj9Dnq37UMq9PxqrPHUOfaF
	RDmw==
X-Gm-Message-State: APjAAAXvswGiTT879Eg9+tVZ2zsRM/SQMqnsHwjQZjOkWkSQOe6EQ7SS
	yD+Tez96sbvP4iKgENEAZ+E7bkjEOqg=
X-Google-Smtp-Source: APXvYqzsKq7nQCxKsd2Q9a7JrtpbXk7/VJL7OUU5nNCk7g80lYQRJpaSsBIU/nLXZm3yXaWbBWegwA==
X-Received: by 2002:a62:2ac4:: with SMTP id
	q187mr18993058pfq.235.1568177645426; 
	Tue, 10 Sep 2019 21:54:05 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	i6sm36123311pfq.20.2019.09.10.21.54.04
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 10 Sep 2019 21:54:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Sep 2019 21:53:48 -0700
Message-Id: <20190911045348.3308507-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190911045348.3308507-1-raj.khem@gmail.com>
References: <20190911045348.3308507-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-webserver][PATCH 3/3] netdata: Update to 1.17.0 and fix build with clang/x86
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
X-List-Received-Date: Wed, 11 Sep 2019 04:54:05 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-webserver/recipes-webadmin/netdata/netdata_git.bb | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-webserver/recipes-webadmin/netdata/netdata_git.bb b/meta-webserver/recipes-webadmin/netdata/netdata_git.bb
index 811c2c5223..d179e84e33 100644
--- a/meta-webserver/recipes-webadmin/netdata/netdata_git.bb
+++ b/meta-webserver/recipes-webadmin/netdata/netdata_git.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=fc9b848046ef54b5eaee6071947abd24"
 SRC_URI = "git://github.com/firehol/netdata.git;protocol=https \
            file://0002-Makefiles-does-not-build-contrib-dir.patch \
 "
-SRCREV = "2c4146832061635273d153a5174c85fb1d967d57"
-PV = "1.16.0+git${SRCPV}"
+SRCREV = "588ce5a7b18999dfa66698cd3a2f005f7a3c31cf"
+PV = "1.17.0"
 
 # patch to disable timeout because timeout are not available with actual version
 # of core-utils
@@ -25,6 +25,9 @@ DEPENDS += "zlib util-linux"
 
 inherit pkgconfig autotools-brokensep useradd systemd
 
+LIBS_toolchain-clang_x86 = "-latomic"
+export LIBS
+
 #systemd
 SYSTEMD_PACKAGES = "${PN}"
 SYSTEMD_SERVICE_${PN} = "netdata.service"
-- 
2.23.0


