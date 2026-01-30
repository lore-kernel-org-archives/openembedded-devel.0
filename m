Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54483D73EAD
	for <webhook@archiver.kernel.org>; Fri, 30 Jan 2026 01:07:56 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.509.1769735275532470842
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Jan 2026 17:07:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=EjTopsyC;
 spf=pass (domain: konsulko.com, ip: 209.85.210.174, mailfrom: tim.orling@konsulko.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-81f39438187so835485b3a.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 29 Jan 2026 17:07:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1769735274; x=1770340074; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BfBH6U4kpARiA6ltoceJRt3dP4qnlDl3os5q0DD79R8=;
        b=EjTopsyCaHkSjirmlK+HIilpEYoleRpgwos9PfwZMu+5Uu7ZrsnDUhK+TnZeITORQr
         AWfTXc+bk+QBpn3QdeiY4HFL5rHIV9FmOaOIpQN/LztzSBCXIrKRT8lYYCqkJLywrxAb
         gNdAihlt2G+wC043GoD+4UcFOO7i3TM7UeH2g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769735274; x=1770340074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BfBH6U4kpARiA6ltoceJRt3dP4qnlDl3os5q0DD79R8=;
        b=iuBOso9byROKl6jSUwIuFzjT83ldUO1CPAuqtDteYXtV5uwzppLvvjA/5ydhtqzZ15
         01nsrExiKWL2I1fxWklljgCRDMxgxb0Hb1WSoshwtKkOWtOURAB4rzllDevfvWPPx6l0
         yNxuR8LHO8JZzRDnzQek9xpYOO5inNCYBbTH1gjj7vvvHe4554H4v9ICt3EOhcNOp19q
         wiSwkKria2o1P3n3qyWUUzr5Szm3kxnae0PBsw+Cc6s615alIBftMk15RvI4R6v1+Vwp
         FCGYZFKixaQuYqEu4lUCYLmZ8y0UOQivLCCEvQOf0BOmeQSdNCl1SL9PrlxmZqiaTNGW
         uF1A==
X-Gm-Message-State: AOJu0Yxc+/Cv8lLz0p+GZ8OEyM8RE+FM/0VYvDSpMjl46XaiZSKVxgAn
	IACZO3RT1zPIFDvUKZPKufqfjiIXcAaMhs7DkBiwZFyiZcVzseNG8ozlLjL3Ykm6+pIsui0WzBZ
	Ea7ue
X-Gm-Gg: AZuq6aKBcRFNEBx9k/X31b+9xrBXeqo+ShVoh6hPXgOmFYC6ng/4qEXiQwNwxEdO2Yc
	RxVPrB+0o5jcfYDtJBGBOethMZC0TC8j7lXtDdAxRbLipBmLetWEi92In7Mn2SPmOA0i/ZcugOO
	aelhGYKiFfyAPJWM2aR0iZEdFxmy+OQtY8BWT7CEA/V33+kH7jbYqHI7Kp1+b4289wn1m/u4nt8
	AoiT+DIpmxoDyT/JNiLOEqugjnKX/ayUv+OGpnsGHD2wQV3PkSMrLYUn3TNpUipQbpHvRiOymZ5
	eOZ/qvgp7p4QdEgp/yrbU3wE9zS7zQmv7yfIWVWpeD85pNKbmHw3ePua/ZXIsjQq9VhM0Db0wau
	cJ3QLH3RJJVIf1JtLjtBeJWbb3aKfKHtQZ1WDSSN3LV/KuzDXQocdBuqGtQCbjyBMTETRUtz2dE
	mhpG1v8SMB9oE+5AbEfr+edC9szSiT4ggOf/KB1KDoiZ6IAekV0DM5i1H5tmJ9
X-Received: by 2002:a05:6a20:a105:b0:366:581e:19f6 with SMTP id adf61e73a8af0-392e005bbe9mr1028637637.23.1769735274469;
        Thu, 29 Jan 2026 17:07:54 -0800 (PST)
Received: from localhost (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3543d538b55sm212892a91.6.2026.01.29.17.07.53
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 17:07:53 -0800 (PST)
From: tim.orling@konsulko.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 2/3] python3-faker: add v40.1.2
Date: Thu, 29 Jan 2026 17:07:36 -0800
Message-ID: <af4b928c2acc59078b5860be35f23ac18b000126.1769715106.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1769715106.git.tim.orling@konsulko.com>
References: <cover.1769715106.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 30 Jan 2026 01:07:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123995

From: Tim Orling <tim.orling@konsulko.com>

Faker is a Python package that generates fake data for you. Whether you
need to bootstrap your database, create good-looking XML documents,
fill-in your persistence to stress test it, or anonymize data
taken from a production service, Faker is for you.

Dependency for pyton3-orjson ptest.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../ptest-packagelists-meta-python.inc        |  1 +
 .../python/python3-faker_40.1.2.bb            | 45 +++++++++++++++++++
 2 files changed, 46 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-faker_40.1.2.bb

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index 15172e7f22..a84718b704 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -130,6 +130,7 @@ PTESTS_SLOW_META_PYTHON = "\
     python3-arrow \
     python3-django \
     python3-ecdsa \
+    python3-faker \
     python3-fastapi \
     python3-google-auth \
     python3-lz4 \
diff --git a/meta-python/recipes-devtools/python/python3-faker_40.1.2.bb b/meta-python/recipes-devtools/python/python3-faker_40.1.2.bb
new file mode 100644
index 0000000000..61063fa10e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-faker_40.1.2.bb
@@ -0,0 +1,45 @@
+SUMMARY = "Faker is a Python package that generates fake data for you."
+DESCRIPTION = "Faker is a Python package that generates fake data for you. \
+Whether you need to bootstrap your database, create good-looking XML documents, \
+fill-in your persistence to stress test it, or anonymize data taken from a \
+production service, Faker is for you."
+HOMEPAGE = "https://github.com/joke2k/faker"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=53360c4126f7d03b63cb79b0dab9e9e1"
+
+SRC_URI[sha256sum] = "b76a68163aa5f171d260fc24827a8349bc1db672f6a665359e8d0095e8135d30"
+
+inherit pypi setuptools3 ptest-python-pytest
+
+PACKAGECONFIG ?= "tzdata"
+PACKAGECONFIG[tzdata] = ",,,python3-tzdata"
+
+RDEPENDS:${PN} += "\
+    python3-compression \
+    python3-core \
+    python3-crypt \
+    python3-datetime \
+    python3-image \
+    python3-json \
+    python3-logging \
+    python3-math \
+    python3-netclient \
+    python3-numbers \
+    python3-pickle \
+    python3-pytest \
+    python3-stringold \
+    python3-unittest \
+    python3-xml \
+    python3-zoneinfo \
+    "
+
+RDEPENDS:${PN}-ptest += "\
+    python3-freezegun \
+    python3-validators \
+"
+
+do_install_ptest:append() {
+    install -d ${D}${PTEST_PATH}/tests
+    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
+
-- 
2.43.0


