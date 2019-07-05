Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
	[209.85.208.42])
	by mail.openembedded.org (Postfix) with ESMTP id 6647B7ECFD
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Jul 2019 11:19:05 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id m10so7936151edv.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Jul 2019 04:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=J1XfRq/vqjfHHAGsvP3TQC11JFE5ke/BLSP9Ewh4AtY=;
	b=rFB567euNgrs4/auPa3ocLIDGEYOAYjZ30DyIAyAGukTq6RTZIvWIV+JVTmYOQaPe0
	zPglDRRXh1Rcn0yDCwy+7LQQCdLNCveA+JClQPEI/g8VXUSHKvUsCjnu+ilc9pv9G8bA
	HqQ9QcxNJl7xsel1t0hr0G5XSRIgB1WyK8LW2zHPCJ84YM+G6M7mwqmL1fCWDGDR4Qq0
	YOBGkFdA9F1y+iXTXhmUyiDMX/mSLuBn69nAmGwhHII8iNItfDq0hENt41LjLN+tJeKW
	3vvYY2F8bBm8nNLfLCDLJ2TrjULSPpVQbzjnEp4WSlQG9VUQXO3PT90gsLP6yUaT6Z2Y
	n8hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=J1XfRq/vqjfHHAGsvP3TQC11JFE5ke/BLSP9Ewh4AtY=;
	b=NRQBwF57CG+rJGf7R4IQX4zpU+VSQlGjbzExkC7MqgvkNMUq5MKENNPXAMSslaMbk5
	yY9ecmd/KdrqM5t/kGbvVneJ+Q9sS/750WQ0Zp1Bk0F+aJTCzOxW7bPRRFNxHSsuL5br
	1PGXLWuEIMszb/CD7bYW7R5Gf+OQPT8iDDSiGHmPeC3wYZHKs9rJTnp28pVbE8I0U0Kx
	7GWtD6x48gDzdLLQx5pHZw5jpquaB+PD9jmLjdDGHz5rV6kZQaQNmg5nJpXvy6frGpkW
	NoNmwZb39Lhkpa59sX3oVEVXDuoVPte7lARUIsv5frdEZdVsJf1feP57Y6Mp7bvvJijM
	EhOA==
X-Gm-Message-State: APjAAAVZUpL4WZeHk9RU6o7SwMkpaPgvD6SlmsNu/m4+2o5kwQCwoVQG
	1YM4RxOOEYIqqYSHYXI+MJ6ntiPEU1M=
X-Google-Smtp-Source: APXvYqy8s4DO7Ozc7edQjXx+JFBlaSsazQkxgNybnnByLa4wjWKpobBeDCHZ+sdd6UMwab+ORtjVQw==
X-Received: by 2002:aa7:cf0c:: with SMTP id a12mr3886477edy.146.1562325545969; 
	Fri, 05 Jul 2019 04:19:05 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id h10sm136604edh.64.2019.07.05.04.19.04
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 05 Jul 2019 04:19:04 -0700 (PDT)
Sender: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
From: Ricardo Ribalda Delgado <ricardo@ribalda.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  5 Jul 2019 13:18:17 +0200
Message-Id: <20190705111824.22255-17-ricardo@ribalda.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190705111824.22255-1-ricardo@ribalda.com>
References: <20190705111824.22255-1-ricardo@ribalda.com>
MIME-Version: 1.0
Cc: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Subject: [meta-java][PATCH v4 16/23] xom: Do not use all as PACKAGE_ARCH
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
X-List-Received-Date: Fri, 05 Jul 2019 11:19:05 -0000
Content-Transfer-Encoding: 8bit

It RDEPENDS on packages that ar not PACKAGE_ARCH=all

Fixes:
ERROR: mc:qt5507:xom-1.2.10-r0 do_compile: Function failed: do_compile (log file is located at /workdir/build/tmp/work/all-poky-linux/xom/1.2.10-r0/temp/log.do_compile.3256)
ERROR: Logfile of failure stored in: /workdir/build/tmp/work/all-poky-linux/xom/1.2.10-r0/temp/log.do_compile.3256
Log data follows:
| DEBUG: Executing shell function do_compile
| mv: cannot stat '/workdir/build/tmp/work/all-poky-linux/xom/1.2.10-r0/git/jaxen': No such file or directory
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_compile (log file is located at /workdir/build/tmp/work/all-poky-linux/xom/1.2.10-r0/temp/log.do_compile.3256)
NOTE: recipe xom-1.2.10-r0: task do_compile: Failed

Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
---
 recipes-core/xml-commons/xom_1.2.10.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-core/xml-commons/xom_1.2.10.bb b/recipes-core/xml-commons/xom_1.2.10.bb
index 0e923d4..8755ddc 100644
--- a/recipes-core/xml-commons/xom_1.2.10.bb
+++ b/recipes-core/xml-commons/xom_1.2.10.bb
@@ -22,6 +22,8 @@ SRC_URI[archive.sha256sum] = "39985c2debb8044005fd07b09cb06f10e75652b3c048c9b443
 
 S = "${WORKDIR}/XOM"
 
+PACKAGE_ARCH = "${TUNE_PKGARCH}"
+
 inherit java-library
 
 DEPENDS = "fastjar-native virtual/javac-native xerces-j xalan-j"
-- 
2.20.1


