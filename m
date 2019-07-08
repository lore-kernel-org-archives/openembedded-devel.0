Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 499DE7D30C
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Jul 2019 18:36:51 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id n4so18281611wrs.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Jul 2019 11:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=PgRfIvtayKD9M8ycEjcgWsC/7QPYZ3/OrwEOsEApapE=;
	b=TjXCUCraa1UG9gam63m67TtSGNdtQWNUgHs1SfMRtOKE7+pdbTKe7UWNxSuWeCIwns
	kwUGGvECNxqMcixhDL6G1g3KZo+yOjCFpkKDV4c+QpfRyUI7wMddYwzCm5u+Qc2ppQq1
	sdGY9M5SfT8HpqnJZYqFic5rsFMhDCr07V3E6HqhNZGZOTGOd73GaGL1L9HvarzaRcB0
	6MKsxJzJwYMZ2LpVNC7k3oozef1kzMJWEo2X57kybwu/MqgqtB2Z3cSl9BWqpW8n40P3
	4ZA+kqMPnMJzf7KVHsIFiY1LWTzmtZywUtXe4x8JVKb5C/Hu3fAAM0zWXDn1B1+0t5e1
	FpXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=PgRfIvtayKD9M8ycEjcgWsC/7QPYZ3/OrwEOsEApapE=;
	b=Zc+xaQ9Q7tW31hzwEpPXFeRLn7N7DWnKmJNb5tdAx/t3/Dca+NWhSab1r3tPPUBF/I
	WxR+cAhU8XqAcn8YRDSr/Ne8JoOXYW5qGpnriABimxIXdkWsjp1ZSu7p13CCi4pCIY2c
	EKN0Paoe8xLyQrQLn1cAeayfXTOC9dFNoWYSRsBdRPW8M24ljC3mJYeSXR0orG7XTorr
	EgjKOHIBCzs1Yl/OqiksfUu/9JEN6o0iIed0TQKHPc0u2Hy1V5kGGOctZwIkOo3BGwsN
	o2CTofQZIMaEl3EZ+DxrMifCsjhxjbMNhdD1MkqiqS4WpdW0chNFl6sgHylY2iUeyfwx
	GEWw==
X-Gm-Message-State: APjAAAVjrT4ymkL0XYRkrEHisq5/RY+CviFlF2VfWGLZPI35+PfM22fS
	A/ZuB1F4aN2zlR4mZqRqKkovrmx/
X-Google-Smtp-Source: APXvYqyg3j/wq4yODcFgdv8j4Sl2j6BD373JrbvoEen6OMRFGeSGGZBfaRBD6NmDIZXdgdyqDsBdnw==
X-Received: by 2002:a5d:4e8a:: with SMTP id e10mr1421594wru.26.1562611011766; 
	Mon, 08 Jul 2019 11:36:51 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	c30sm18050681wrb.15.2019.07.08.11.36.51
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 08 Jul 2019 11:36:51 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  8 Jul 2019 18:36:50 +0000
Message-Id: <20190708183650.1057-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [warrior][PATCH] turbostat: copy bits.h from kernel to turbostat
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
X-List-Received-Date: Mon, 08 Jul 2019 18:36:51 -0000

From: Liwei Song <liwei.song@windriver.com>

because bits.h was included in msr-index.h, so we also need
copy bits.h from kernel to tubostat to aviod compile error.

Signed-off-by: Liwei Song <liwei.song@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb b/meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb
index dc3e78febb..3f25e6f004 100644
--- a/meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb
+++ b/meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb
@@ -41,11 +41,13 @@ do_configure_prepend() {
 	mkdir -p ${S}
 	cp -r ${STAGING_KERNEL_DIR}/arch/x86/include/asm/msr-index.h ${S}
 	cp -r ${STAGING_KERNEL_DIR}/arch/x86/include/asm/intel-family.h ${S}
+	cp -r ${STAGING_KERNEL_DIR}/include/linux/bits.h ${S}
 	cp -r ${STAGING_KERNEL_DIR}/tools/power/x86/turbostat/* ${S}
 	cp -r ${WORKDIR}/COPYING ${S}
 }
 
 do_compile() {
+	sed -i 's#<linux/bits.h>#"bits.h"#' msr-index.h
 	sed -i 's#MSRHEADER#"msr-index.h"#' turbostat.c
 	sed -i 's#INTEL_FAMILY_HEADER#"intel-family.h"#' turbostat.c
 	sed -i 's#\$(CC) \$(CFLAGS) \$< -o \$(BUILD_OUTPUT)/\$@#\$(CC) \$(CFLAGS) \$(LDFLAGS) \$< -o \$(BUILD_OUTPUT)/\$@#' Makefile
-- 
2.17.1


