Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
	[209.85.208.50])
	by mail.openembedded.org (Postfix) with ESMTP id 378EE7ED0D
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Jul 2019 11:18:55 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id k8so7930392eds.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Jul 2019 04:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=M7RI4oRVjae1+0Fc2H5zjwpdbT7thInQWE73i0JWHms=;
	b=HWQtnC93uM6xvMj6hp4vl6/jK+nmbF8XHHcqiLKbWQ8PqqlAfrQz2kTiso46j67U3L
	lkxY/IpCaag/WbcM0xIAHvdkvuiLRYmTo3TFlAYq9D3xreBH/Tl4kQe+C8Y+6AdVgMHO
	pdkJMlJVQpCXfDnqQEcSG170fpoMNDkltCbekieiSLE4jH1+9EdkI835oz2c1iWxLR4w
	agW0+V6rhPqF8VTq1z4JK5q6WTq2/wqz0nkAHc86dTqjqnJZBaejXMz667I3abLZpReo
	f8eF9jpfBVRrTDBMwG57XIxjil9oZIlCWAPHDIdRVHeKNSYHFDIpDDaIWRv9f39is+BC
	eYkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=M7RI4oRVjae1+0Fc2H5zjwpdbT7thInQWE73i0JWHms=;
	b=lCZmJ+dQjpCC62071YDTZv6vABJrsvD8kSoVCowTXAFSDjuxZe74lGGBqunS8F4l7u
	942Tdfh7q36A+iAERJug9QMfIutN/YAqMw5joZXZpP8+v34/45U4sHqI1yF6g1wXruS7
	3ZeUUK0YfdzJv22CDZG25VoYXDmc2eLemOixYy0mi1e6tgRjRcCHYteUBtID41Fzi2T8
	zEAHW+NgMg9FmVcAIkp6d1tuX1WHXGMqnUbQJp3KPaD6/uaJCj25H9fkcOsGPwEpeLYA
	6Fz9VPcxtUNZff5arcjaM1ErCGCDt3Wy8OQAdVx8jXOPbdByNJRitnWyaSbm0SuSfm5x
	yrtg==
X-Gm-Message-State: APjAAAW1rzjvX+fKwoYMwrtXT7PVHjulpfNWOdvZPwfvP73cOMqmh5dz
	uewF0m5kTtT4edrsMSr8gJ4JfdF5STo=
X-Google-Smtp-Source: APXvYqzx4F568z0bWvWChWBzmEqKOC5suBlx65irb0nKVHdtdy+B48wtUt2BPjmlqLVaNb4SUTNY6g==
X-Received: by 2002:a17:906:1914:: with SMTP id
	a20mr2855907eje.294.1562325535595; 
	Fri, 05 Jul 2019 04:18:55 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id h10sm136604edh.64.2019.07.05.04.18.54
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 05 Jul 2019 04:18:54 -0700 (PDT)
Sender: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
From: Ricardo Ribalda Delgado <ricardo@ribalda.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  5 Jul 2019 13:18:09 +0200
Message-Id: <20190705111824.22255-9-ricardo@ribalda.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190705111824.22255-1-ricardo@ribalda.com>
References: <20190705111824.22255-1-ricardo@ribalda.com>
MIME-Version: 1.0
Cc: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Subject: [meta-java][PATCH v4 08/23] jdon: Fix location of S
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
X-List-Received-Date: Fri, 05 Jul 2019 11:18:55 -0000
Content-Transfer-Encoding: 8bit

Otherwise License files cannot be found.

Fixes:
WARNING: jdom-1.1.3-r0 do_populate_lic: Could not copy license file /workdir/build/tmp/work/all-poky-linux/jdom/1.1.3-r0/jdom-1.1.3/LICENSE.txt to /workdir/build/tmp/work/all-poky-linux/jdom/1.1.3-r0/license-destdir/jdom/LICENSE.txt: [Errno 2] No such file or directory: '/workdir/build/tmp/work/all-poky-linux/jdom/1.1.3-r0/jdom-1.1.3/LICENSE.txt'
ERROR: jdom-1.1.3-r0 do_populate_lic: QA Issue: jdom: LIC_FILES_CHKSUM points to an invalid file: /workdir/build/tmp/work/all-poky-linux/jdom/1.1.3-r0/jdom-1.1.3/LICENSE.txt [license-checksum]
ERROR: jdom-1.1.3-r0 do_populate_lic: Fatal QA errors found, failing task.
ERROR: jdom-1.1.3-r0 do_populate_lic:
ERROR: jdom-1.1.3-r0 do_populate_lic: Function failed: populate_lic_qa_checksum
ERROR: Logfile of failure stored in: /workdir/build/tmp/work/all-poky-linux/jdom/1.1.3-r0/temp/log.do_populate_lic.4246
ERROR: Task (/workdir/repo/poky/../meta-java/recipes-core/xml-commons/jdom_1.1.3.bb:do_populate_lic) failed with exit code '1'

Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
---
 recipes-core/xml-commons/jdom_1.1.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-core/xml-commons/jdom_1.1.3.bb b/recipes-core/xml-commons/jdom_1.1.3.bb
index 8997bcc..8073819 100644
--- a/recipes-core/xml-commons/jdom_1.1.3.bb
+++ b/recipes-core/xml-commons/jdom_1.1.3.bb
@@ -14,6 +14,8 @@ SRC_URI[sha256sum] = "d471718c4ac7a1a2f10715b93cb3fcd2ecbab60384b73ad1c089712e47
 
 inherit java-library
 
+S = "${WORKDIR}/${PN}"
+
 do_compile() {
   mkdir -p build
 
-- 
2.20.1


