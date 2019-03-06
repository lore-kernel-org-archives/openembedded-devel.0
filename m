Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id C8AD47CCA4
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Mar 2019 05:46:02 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id u9so7625247pfn.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Mar 2019 21:46:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Olhy15v3TNNRisM8UkEhyOr5x3bA/F/7ZRgc9YNJUCY=;
	b=SeGW/rVTQ5XRmgl/oBsVCbnCDw+o+RhuqRpU+V48di8oujF/6Y1e0WFKBQMQH8WPUn
	Rk2o6eMVCMsjAdGl0c6CfKScKRWIa7KGRST4Ty5ZP3xmACFTT0fSpFQj9k5YPm1FxiSJ
	mKZOOQsZZWgT9U2Paxh5Sn1z+Em6r6Wbm7VzDXzSyLyUuR1SQ2nyazSKJwYFGJztWrwr
	dCK92r15oMt/CNETVCWjuNrqjbI4TuTws/UDwCWAm/R18EMiTQDcIRbDq1krpGmq0BjN
	shzMPHHEP/mEGmqUNaCqViBKqHzTtG2kmbsDt8Fv7ZoaNBnWR6dLwllp0qH6CoOYIdmZ
	e5xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Olhy15v3TNNRisM8UkEhyOr5x3bA/F/7ZRgc9YNJUCY=;
	b=JQFji/UfhyQanr7MY1V/Dc0PhffcDt52JlfDXejDIt2NbNpMUKP0f7P7Ka+ayWK7Xi
	HK3CXqTpGibCxhv9cmeLQSFP02x9DdmPGPzbvUeToAhl+vth+GdPhG9NBVb2kZMTls/9
	+r5mEfnDwSc+E3i572QS3nedBViulYQZVh2lJahkeskwq+nj08YsoGLK4piwJl95pVLB
	YJWrsDXItLF/JciWKHK4j34hTzlX4E8B6lOcQBjA0xkRouiDsJqi9WJYLI+ZyfyNwC/C
	tzIa+SIIcAzwUBJwwwmFXCjoX1Fje+uqv/vMu7fdeIzfJy8L5FyVyLO5l886/GRnOtjX
	5MyQ==
X-Gm-Message-State: APjAAAWGG06Ftr2hSJ5VWb5Tr5Z0hA9h3WFleHF9fxvDT/GYOsyZXS/+
	Qe3adqN1amiOMmMurrSLMgqG7Y/l
X-Google-Smtp-Source: APXvYqzI3+G+rMta7suwVUyPHmWjGK4dMXeTv2xfPXi7bsN0/Fz8H7ipxrVlmRZZTYUGcR6SaOYlGA==
X-Received: by 2002:a63:4e1d:: with SMTP id c29mr4816700pgb.433.1551851163429; 
	Tue, 05 Mar 2019 21:46:03 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::3401])
	by smtp.gmail.com with ESMTPSA id m24sm1001144pgv.1.2019.03.05.21.46.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Mar 2019 21:46:03 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Mar 2019 21:45:47 -0800
Message-Id: <20190306054548.16430-11-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190306054548.16430-1-raj.khem@gmail.com>
References: <20190306054548.16430-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 11/12] rabbitmq-c: Upgrade to 0.9.0
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
X-List-Received-Date: Wed, 06 Mar 2019 05:46:03 -0000
Content-Transfer-Encoding: 8bit

Switch to Cmake

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{rabbitmq-c_0.7.0.bb => rabbitmq-c_0.9.0.bb}           | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-connectivity/rabbitmq-c/{rabbitmq-c_0.7.0.bb => rabbitmq-c_0.9.0.bb} (67%)

diff --git a/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.7.0.bb b/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.9.0.bb
similarity index 67%
rename from meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.7.0.bb
rename to meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.9.0.bb
index e9846fdea5..5096d6cd3a 100644
--- a/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.7.0.bb
+++ b/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.9.0.bb
@@ -4,15 +4,16 @@ LIC_FILES_CHKSUM = "file://LICENSE-MIT;md5=6b7424f9db80cfb11fdd5c980b583f53"
 LICENSE = "MIT"
 
 SRC_URI = "git://github.com/alanxz/rabbitmq-c.git"
-SRCREV = "4dde30ce8d984edda540349f57eb7995a87ba9de"
+# v0.9.0-master
+SRCREV = "7e693a23f7fb7120f85995d3c922814495be30db"
 
 S = "${WORKDIR}/git"
 
 DEPENDS = "popt openssl"
 
-EXTRA_OECONF = "--disable-examples --enable-tools --disable-docs"
+EXTRA_OECMAKE = "-DBUILD_EXAMPLES=OFF -DBUILD_TOOLS=ON -DBUILD_TOOLS_DOCS=OFF -DBUILD_API_DOCS=OFF"
 
-inherit autotools pkgconfig
+inherit cmake pkgconfig
 
 PACKAGE_BEFORE_PN += "${PN}-tools"
 FILES_${PN}-tools = "${bindir}"
-- 
2.21.0


