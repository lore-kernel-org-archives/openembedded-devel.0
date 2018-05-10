Return-Path: <twoerner@gmail.com>
Received: from mail-io0-f193.google.com (mail-io0-f193.google.com
	[209.85.223.193])
	by mail.openembedded.org (Postfix) with ESMTP id EA7AB74561
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 May 2018 04:22:08 +0000 (UTC)
Received: by mail-io0-f193.google.com with SMTP id d73-v6so1540218iog.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 May 2018 21:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=DzeqxRcEQkN0EbbEcLhlGlepexEm7luN055YHC/TH2A=;
	b=CvWDadFnm3QtHtjjZ+yBTrOqSnLsf2+VxgdFz2eyDaJEySLNy7yx18PbcUabGq9+W3
	+xzjwQST0oXzTNZtAvrwMg7qn46rmP/+xHZwuLyiHGan+itJ05CTFLimd5ki6wD0Xipy
	aYZPrLIlv4fBskkF7Ot5iDDJFALHX1nk3kyckPfWJylvMMpvH90Yg3hVw95F+YhzBBqw
	GgESJEkGazLMCJur1YE8kPnFWCJSe7I0Qkqu70Cbbup8w5DunwVZfaF90vZ8SH1LA/FA
	NK91EopAU2s+hdjtQkaMsCAZD6aSJTnk2sI02YH7fCuFcYH2ksbHdyDRLisLS6IhMwbE
	DKEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=DzeqxRcEQkN0EbbEcLhlGlepexEm7luN055YHC/TH2A=;
	b=bVA7uW8c5rSwqu8ydVoEn4Ff2W2yYc/WOnPatWVoZekdAXEZ9vhZXbCUdDmOW7JgT1
	kyH7sZOrf/VleizP87YqPFj8maAjag0ov/MyxjKlJiswAbnFVetMni8nmJus+26dD5xG
	yrFMkqYPQTXCz+jClB+gAx3Gr7JoU9LBvBhQitGHaMZ3TKO1EP/uOFgbXzpkZofVD7+I
	JAj7mjr1Oakd41WgsA/pEqy7TdqDRzK6IY4Jyt9LowC18R0g2mqaNVlF/dAbtbLaDTjQ
	Q7Dgi98ybxeoScciPnY/4q/ixHR4IOk5WjHvSC55eohKnKufkYpSo2mQb6Lbn0IggIH7
	bqDA==
X-Gm-Message-State: ALQs6tAfX0rg/jVbsH30LT9v80a0/ywqsvRSXWoSe/OfGSomoh1AKtzb
	d5cWYlKl856pT6lgtSwVHfib0w3y
X-Google-Smtp-Source: AB8JxZqi4IsFvaD5HhG2RQAQO5w2OgW41vVU3u5sr2lmo2QZJ4k/rKcc6XKHV6dbkkASZcGIQJvIAg==
X-Received: by 2002:a6b:87d2:: with SMTP id
	r79-v6mr49875494ioi.275.1525926129475; 
	Wed, 09 May 2018 21:22:09 -0700 (PDT)
Received: from linux-uys3.suse ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id
	c80-v6sm69586itd.7.2018.05.09.21.22.07
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 09 May 2018 21:22:08 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 May 2018 00:22:04 -0400
Message-Id: <20180510042205.28212-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.17.0.rc2.3.gc2a499e6c
Subject: [meta-networking][PATCH 1/2] geoip-perl: switch away from github archive
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
X-List-Received-Date: Thu, 10 May 2018 04:22:09 -0000

Since we know that github archives which are automatically generated have a
tendency to change their checksums[1], switch to using a git clone.

[1] http://lists.openembedded.org/pipermail/openembedded-devel/2017-September/114916.html

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 .../recipes-support/geoip/geoip-perl_1.50.bb          | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/meta-networking/recipes-support/geoip/geoip-perl_1.50.bb b/meta-networking/recipes-support/geoip/geoip-perl_1.50.bb
index a8c8bcf580..95147bdad2 100644
--- a/meta-networking/recipes-support/geoip/geoip-perl_1.50.bb
+++ b/meta-networking/recipes-support/geoip/geoip-perl_1.50.bb
@@ -9,17 +9,12 @@ SECTION = "libdevel"
 LICENSE = "Artistic-1.0 | GPL-1.0+"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b7a36f55e8ba62aadd74e4f0886a405e"
 
-# Note that we do not want to use the upstream file name locally.
-#
-SRC_URI = "http://github.com/maxmind/geoip-api-perl/archive/v${PV}.tar.gz;downloadfilename=${BPN}-${PV}.tar.gz \
+S = "${WORKDIR}/git"
+SRCREV = "47f7d49bd15cfc2e5f8c0f5c4068dc8bb0e10e96"
+SRC_URI = "git://github.com/maxmind/geoip-api-perl.git;protocol=https; \
     file://run-ptest \
 "
 
-SRC_URI[md5sum] = "2d7f8b1b54e6ba6d9e3fefce52675815"
-SRC_URI[sha256sum] = "86da0dd67f417a43dc70f15a49bd3619f668970c117b9e7f737b4ab246c240a6"
-
-S = "${WORKDIR}/geoip-api-perl-${PV}"
-
 DEPENDS += "geoip"
 
 inherit cpan ptest
-- 
2.17.0.rc2.3.gc2a499e6c


