Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 8CD4C7D71A
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Aug 2019 14:04:12 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id go14so3338755plb.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Aug 2019 07:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=nxaEIWav8OrxacT7eAp7CsSoC0XSn9oVcg8H0qStGRs=;
	b=XCXwV1O+qiTqlsd47aBo97kNet5YMRrLstSydI3Txxy/7FGnl6FoWUNUkn1AmE6n38
	TmL5nk60+T8Ng4H/YN4J1IbM5WkygYnRKoRLUvh64k9JgnUrLLIyTRWjO5wASpn1TBm+
	b7j7bDqVNlogMOHxb/Kz6mzN8yFdJdUFKaOE7k3mJRwdQursX3JZk5bxhVLo11RKq0GK
	efk5s/YXuW7FLjQBAYvvKGLWVl2ZxfNpoIlYE6JquyKm9rQtNhjh12GTbhBS1cqTn8xV
	K9FvBbig5NGvlM5ar1ijJPIv9fokvwKxBZccKHG0s9lvdDL4IpLAsSWFNLz3U03dt6uO
	m/aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=nxaEIWav8OrxacT7eAp7CsSoC0XSn9oVcg8H0qStGRs=;
	b=X1Cw2/hnFZgWLvC7STNfYt6sl8crILDWPFgMgj9qFUoCKmekOoBU2ZO+4lAWm5dIud
	rXJkpGtRf2HCXDn/FAOvVh58Lv4ljqGMcIdMS0CQ3m2Xl66W+bkXgUIE10HMqA/0j4Nz
	+IDsK2LN3nAdqnQiG+jCwp1SpnMyRNBaaX3JYRcMoijmgJzE/gAkemZrhNlnCW6MKTmv
	UVKgEta+G3doHTc/Ba3J41PDFgnlPH3p9cM5tZzFRJl5/dA9fRrAgYgJRqq2psVAk8iD
	14sBPoaGPIFZrcv28kRHOFgEu/0VEyLVGS7xGZy5R01RRcq/W4VivGWrt8sUi82bLCSP
	vSpw==
X-Gm-Message-State: APjAAAXajpCJB+E3CN+KHlPA1v7u6ugYnSHpjK8VfKsZHQQMClsB2tX1
	caaeDwNj3oSMND1F/8+IuqQVdqWwLao=
X-Google-Smtp-Source: APXvYqyPNv/NmK0TzUBm0KzHg8xfTtlIzHZf5zPS2Ra1+IswuGuJHy5ut6ZG8egfoinaYvpnjn2yNw==
X-Received: by 2002:a17:902:e2:: with SMTP id
	a89mr14372799pla.210.1566050653197; 
	Sat, 17 Aug 2019 07:04:13 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	22sm10988546pfv.134.2019.08.17.07.04.12
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 17 Aug 2019 07:04:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 17 Aug 2019 07:03:56 -0700
Message-Id: <20190817140358.17988-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.1
MIME-Version: 1.0
Subject: [meta-perl][PATCH 1/3] mime-construct, libextutils-parsexs-perl: add runtime dependency on perl
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
X-List-Received-Date: Sat, 17 Aug 2019 14:04:12 -0000
Content-Transfer-Encoding: 8bit

Use += so it can use the RDEPS from cpan-base class

Fixes:
ERROR: QA Issue: /usr/bin/mime-construct contained in package mime-construct requires /usr/bin/perl, but no providers found in RDEPENDS_mime-construct? [file-rdeps]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-extended/mime-construct/mime-construct_1.11.bb      | 2 +-
 .../recipes-perl/libextutils/libextutils-parsexs-perl_3.35.bb   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-perl/recipes-extended/mime-construct/mime-construct_1.11.bb b/meta-perl/recipes-extended/mime-construct/mime-construct_1.11.bb
index 501f3bf140..2516fbfcaa 100644
--- a/meta-perl/recipes-extended/mime-construct/mime-construct_1.11.bb
+++ b/meta-perl/recipes-extended/mime-construct/mime-construct_1.11.bb
@@ -17,7 +17,7 @@ SRC_URI[sha256sum] = "4cd7bb61b51d41192d1498c1051aa6a4ccd75aeb09b71d2ec706a7084a
 
 inherit cpan
 
-RDEPENDS_${PN} = "libmime-types-perl libproc-waitstat-perl msmtp \
+RDEPENDS_${PN} += "libmime-types-perl libproc-waitstat-perl msmtp \
     perl-module-filehandle perl-module-mime-base64 perl-module-mime-quotedprint perl-module-posix \
 "
 
diff --git a/meta-perl/recipes-perl/libextutils/libextutils-parsexs-perl_3.35.bb b/meta-perl/recipes-perl/libextutils/libextutils-parsexs-perl_3.35.bb
index 33707a0af6..f57e1224d4 100644
--- a/meta-perl/recipes-perl/libextutils/libextutils-parsexs-perl_3.35.bb
+++ b/meta-perl/recipes-perl/libextutils/libextutils-parsexs-perl_3.35.bb
@@ -21,7 +21,7 @@ S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 inherit cpan
 
-RDEPENDS_${PN} = " perl-module-carp \
+RDEPENDS_${PN} += " perl-module-carp \
     perl-module-cwd \
     perl-module-dynaloader \
     perl-module-extutils-cbuilder \
-- 
2.22.1


