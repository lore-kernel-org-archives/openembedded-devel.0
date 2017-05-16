Return-Path: <liu.ming50@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 5C14F77D42
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 May 2017 11:21:09 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id k74so22177327qke.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 May 2017 04:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=8z01tF6uUwKA/WgZ3Vg8E1/HdrzP0MVqIT9d+2I/IV4=;
	b=TZchnOUBN3r3mU01xfYlhSqXx9g+dbLWTxuFoWfBdEpWMMLEOV1xlSRf0l2c5lVvdX
	RgyM4DAhFPv3VNMjk2EQ/1NQg8RxPCLRmsT8uWxCa+0ZXYBiDH98FP7K+kAXmXsM0av1
	yEBbPDypSlNcQeRI2p4NoLkelyNJ3R9a78bIpYRrGUe3uhCf32VZCnOX0ofzqKF1lfAZ
	OByqfPNACbpbLp4WNCpTyjaqfvkus0EMtS7RLNMCjvtLCaErCG0qrQuTenSWvFduejyK
	16ncM6UkP4b7WdvhG1XdGTI4go+xrvM9IMvJF4He2rUEfK+bpqLe82Mf+UVzJokE37Eo
	2qGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=8z01tF6uUwKA/WgZ3Vg8E1/HdrzP0MVqIT9d+2I/IV4=;
	b=S9Fpb9F+ivtrSs1IQTqeZJuSDRnLB6YTYoa7qw7DknolW0S1OzEiyyJlxnmsk9h1Fh
	sl/S+3tgjFBgrn66x41uMqBcxc0TUpfroYDnuYP+3u6NyYNvl8a/YOKjt+CoHmvlXi1d
	J2PaLdXCAFA+0dA6WiYYMu/Xmf5n0AMtZ+6Oi8nyk5IFfhZcJjdJSXkgwnv23CeWczvt
	4y36ZoXoA1YZFrBxCgpv5tFyuJD3B1Kt7WR3CJ8b8klzXz9lvRukIkBDlOxj13XnQc9s
	v7OJyXmqHq6GReiMi8DpcikK+1uTO73eaFYtnupBCNmGCD+dPsdPv8xRAp/xuZZdFvs7
	vR8g==
X-Gm-Message-State: AODbwcClYp17PmEppm6EZtZL/CKryeXOVV+q7ZSl0JcLJauatkMrH+fk
	W5rIdRjXEADGzQ==
X-Received: by 10.80.131.5 with SMTP id 5mr8190333edh.134.1494933671266;
	Tue, 16 May 2017 04:21:11 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([106.119.199.218])
	by smtp.gmail.com with ESMTPSA id w29sm842507edb.33.2017.05.16.04.21.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 16 May 2017 04:21:10 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Tue, 16 May 2017 13:21:01 +0200
Message-Id: <1494933661-24149-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [meta-oe] [PATCH V2] xerces-c: fix a wrong PACKAGECONFIG option
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
X-List-Received-Date: Tue, 16 May 2017 11:21:10 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

In xerces-c's configure, these options is being referred as follows:
......
    curl_flags="-I$with_curl/include"
    curl_libs="-L$with_curl/lib -lcurl"

    icu_flags="-I$with_icu/include"
    icu_libs="-L$with_icu/lib -licuuc -licudata"
......

so they shouldn't be set to ${STAGING_DIR}, use
${STAGING_DIR_TARGET}/usr instead.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 meta-oe/recipes-devtools/xerces-c/xerces-c_3.1.4.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/xerces-c/xerces-c_3.1.4.bb b/meta-oe/recipes-devtools/xerces-c/xerces-c_3.1.4.bb
index b848b06..64ac747 100644
--- a/meta-oe/recipes-devtools/xerces-c/xerces-c_3.1.4.bb
+++ b/meta-oe/recipes-devtools/xerces-c/xerces-c_3.1.4.bb
@@ -16,8 +16,8 @@ SRC_URI[sha256sum] = "9408f12c1628ecf80730bedbe8b2caad810edd01bb4c66f77b60c873e8
 inherit autotools
 
 PACKAGECONFIG ??= "curl icu"
-PACKAGECONFIG[curl] = "--with-curl=${STAGING_DIR},--with-curl=no,curl"
-PACKAGECONFIG[icu] = "--with-icu=${STAGING_DIR},--with-icu=no,icu"
+PACKAGECONFIG[curl] = "--with-curl=${STAGING_DIR_TARGET}${prefix},--with-curl=no,curl"
+PACKAGECONFIG[icu] = "--with-icu=${STAGING_DIR_TARGET}${prefix},--with-icu=no,icu"
 
 do_install_prepend () {
     sed -i -e 's:-L${STAGING_DIR}/lib:-L\$\{libdir\}:g' ${B}/xerces-c.pc
-- 
2.7.4


