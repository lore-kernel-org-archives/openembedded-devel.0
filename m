Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f179.google.com (mail-wr0-f179.google.com
	[209.85.128.179])
	by mail.openembedded.org (Postfix) with ESMTP id D014277F38
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jul 2017 09:20:32 +0000 (UTC)
Received: by mail-wr0-f179.google.com with SMTP id r103so174727502wrb.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jul 2017 02:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=IOANunbONa8y65twVEgUvEmI5JQPkTNhMDiCBc4Kg4A=;
	b=GJLWuVHh6JSIzhGKzMMN1ov2+afs372XTCL+JYL9is7AAfBBugXmgb3NwHjoO/0qie
	OR31wj/igjNpD4NvV40cbQUdYcngPl29nchNNtpSlP+wuhSlFhH6V776Ji6B+U1jZzgG
	QLpNN45EtZVaRHRMmp1Vvjo4ZchgsE7UDOkpTHmgq5EymotSHl57fNpH0NoW5u0v04nz
	qodSZ8+luBAuLflwberPRDwzYemJopqZwlIOlS9DysZQvA+04xbq7sP3LRJRfofAM/Gu
	sSL33EeCRrZv1k9OOI2C72HdoLb3m9olnHH7w6c06knG0wy7So4E4Ure8eRyYIKiW73d
	GIjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=IOANunbONa8y65twVEgUvEmI5JQPkTNhMDiCBc4Kg4A=;
	b=Iu7+VEQPCLD2pEqkECUQqqSDakNMA/dJKqrKs2aIiGvTAQM4UYtZcLM5yMFTFuphD2
	OhzmeWedqsJZF75kVdQm/JtTkJM/VZdYeooUecSeNhFXQHxsjHzr27+bobLsfw7AREhY
	IAseWYWbIoex0df9q7IwaO+WCaE7bc8j6FliKuBjji4t9mf8EIWVtndUscFeFk3WzRvm
	PNXVAG61Lv4i45QYHdbRCh9DPishqcaIDM1VIgh4My+7LWG+FaEDppn7Mt73AYCWtiyC
	IGkF7YU/HjWlCm3fZwp1cjjaRyrdJIG+W9fptw5IobPonSbYDEHsI/UF5jBzeE6BMMKR
	wdTg==
X-Gm-Message-State: AIVw111swg/eYW5euaGNwoKesRc+TOjof+544QqWJZnAFWvSpxu3Rjrk
	OZ0aAQFhHhJCvBVh
X-Received: by 10.28.181.6 with SMTP id e6mr1794234wmf.25.1499764833036;
	Tue, 11 Jul 2017 02:20:33 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	143sm1338064wmo.11.2017.07.11.02.20.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Jul 2017 02:20:32 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Jul 2017 11:21:10 +0200
Message-Id: <20170711092110.22992-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.13.2
Subject: [PATCH][meta-oe] fluentbit: fix SYSTEMD_SERVICE name
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
X-List-Received-Date: Tue, 11 Jul 2017 09:20:33 -0000

* the binary and service name was renamed in 0.11.11
  from fluent-bit to td-agent-bit, but unfortunately
  SYSTEMD_SERVICE wasn't updated in the recipe with
  the upgrade causing do_package failures as in:
  http://errors.yoctoproject.org/Errors/Details/147040/
  ERROR: SYSTEMD_SERVICE_fluentbit value fluent-bit.service does not exist

0.11.3-r0/image/
0.11.3-r0/image/etc
0.11.3-r0/image/etc/fluent-bit
0.11.3-r0/image/etc/fluent-bit/parsers.conf
0.11.3-r0/image/etc/fluent-bit/fluent-bit.conf
0.11.3-r0/image/lib
0.11.3-r0/image/lib/systemd
0.11.3-r0/image/lib/systemd/system
0.11.3-r0/image/lib/systemd/system/fluent-bit.service
0.11.3-r0/image/usr
0.11.3-r0/image/usr/bin
0.11.3-r0/image/usr/bin/fluent-bit
0.11.3-r0/image/usr/lib
0.11.3-r0/image/usr/lib/libfluent-bit.so
0.11.3-r0/image/usr/lib/pkgconfig
0.11.3-r0/image/usr/lib/pkgconfig/msgpack.pc

0.11.11-r0/image
0.11.11-r0/image/etc
0.11.11-r0/image/etc/td-agent-bit
0.11.11-r0/image/etc/td-agent-bit/parsers.conf
0.11.11-r0/image/etc/td-agent-bit/td-agent-bit.conf
0.11.11-r0/image/lib
0.11.11-r0/image/lib/systemd
0.11.11-r0/image/lib/systemd/system
0.11.11-r0/image/lib/systemd/system/td-agent-bit.service
0.11.11-r0/image/usr
0.11.11-r0/image/usr/bin
0.11.11-r0/image/usr/bin/td-agent-bit
0.11.11-r0/image/usr/lib
0.11.11-r0/image/usr/lib/libfluent-bit.so
0.11.11-r0/image/usr/lib/pkgconfig
0.11.11-r0/image/usr/lib/pkgconfig/msgpack.pc

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-extended/fluentbit/fluentbit_0.11.11.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit_0.11.11.bb b/meta-oe/recipes-extended/fluentbit/fluentbit_0.11.11.bb
index 83818c84d..aac981302 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit_0.11.11.bb
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit_0.11.11.bb
@@ -21,6 +21,6 @@ inherit cmake systemd
 
 EXTRA_OECMAKE = "-DGNU_HOST=${HOST_SYS} -DFLB_ALL=ON -DFLB_TD=1"
 
-SYSTEMD_SERVICE_${PN} = "fluent-bit.service"
+SYSTEMD_SERVICE_${PN} = "ttfluent-bit.service"
 
 TARGET_CC_ARCH_append = " ${SELECTED_OPTIMIZATION}"
-- 
2.13.2


