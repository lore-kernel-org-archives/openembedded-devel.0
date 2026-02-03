Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93029E8785F
	for <webhook@archiver.kernel.org>; Tue,  3 Feb 2026 19:14:20 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1603.1770146051294010478
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Feb 2026 11:14:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=g2bOZ5Hr;
 spf=pass (domain: konsulko.com, ip: 209.85.215.179, mailfrom: tim.orling@konsulko.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c5513f598c0so13052a12.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Feb 2026 11:14:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1770146050; x=1770750850; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hFpRAvxRgQwevvritFuamVmEJAzlmM2ZHd5t93bCemg=;
        b=g2bOZ5HrGV9HhxU+Uze9xEEXfNFj52FymvNGfuarIpOMN/Ya/Qweo7gZkiKsRmL3hm
         aCfrxil4NRLAhdZ2z0q/oZ5eXLslK4ezFoPMrahqYe0HdcT0YHN6neIVXKwcNfUNjlP0
         At/EG4Pmo75BAAIyQT6k1uwjkTGYsR8e+y3eg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770146050; x=1770750850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hFpRAvxRgQwevvritFuamVmEJAzlmM2ZHd5t93bCemg=;
        b=ImkMsm3XzcP1GfO+gwYAg3Alb8TPC8xAXwJ4wbCm1R3RxkaQaxPC3Qmoy95r7oLd5g
         0lIpwWAT3s5XvQ3bmnrX1ctyLzpV3A4c9exAd1aiEeEloyQlksJzt+wH0CNsIQ2Gct9Q
         LDik06CkWuRECFUVsedSJcQZnnJ0Hmqvpk6qEyyetrC1/RowMYjV04A/4eohzzXPTlZ+
         lB0teICyKF/HI7L16eyGpV/z3FxL/kJD6QmpUOmAlrRdCSJZ+cVqNT6GwKWlVr4OPPeH
         EzISU2MNK5jFCJtHtC3111mJ4KK8lr0F4ll7YFB41hX4bqpqVDZRElCDN+x0yB8zbE7i
         ma2A==
X-Gm-Message-State: AOJu0YyuYD79k4x/sDZ9+9y3/KYSTBcjW2pnm522ZZICNTkgFQygQTII
	o5tSS0TtRw/biQOBtOgBoDfsQb/GsJh3E5ElQ7SuQPWK8rLPTdsl+6STevvgAwnFoE9DsRynJrD
	M4ULT
X-Gm-Gg: AZuq6aJnlsRrjoMtu9JoWWIdGKp0EVBkyMWOsv6Zu7DYbiBb79/9YGTELROdz5JB+s4
	1sozpZhz7c82PYt/0id5k+ez30KV60sF063TUeQhbeMU1yIEr6UCOBVbd/8s/GzcLPD0snp/OKR
	OefEWFFJEG/4vJ2KWIFcXsZbs1LZFVzmsgXQnv5wMKCMJFQpjP9UVBHN/fgWplSAjpunG4FPrOE
	3CdyZn7aqeQDfgLjwds0hiaSJYbARgPiJG76Hs52Td3e+LIHYy/M965PMqj8uSQgyUI6Fso4AN6
	i3OzV3nYiH1frbwcXlHrPKjNJKU0PBV9ei/eK0XUqP3eyzpzqtjnoA/cFvtOqXYuAEjx2nl6U9g
	/FJ7mUsZOwrwCG95cqi1hj9Z6COyhCflLzxN9XRiTTLCTuATTltr1nDIjs156vI6O7a+3lT79Hl
	KAtKSlSQLgqnZKc16xDHNQT4Sf4Po84gQDpmiSC2U4bJDKy5E4KUdir0Jz7yFd
X-Received: by 2002:a17:90b:1cc4:b0:340:bde5:c9e3 with SMTP id 98e67ed59e1d1-354871b1efdmr305431a91.23.1770146050209;
        Tue, 03 Feb 2026 11:14:10 -0800 (PST)
Received: from localhost (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6c83127962sm78167a12.10.2026.02.03.11.14.09
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 11:14:09 -0800 (PST)
From: tim.orling@konsulko.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH v2 v2 2/6] python3-faker: add v40.1.2
Date: Tue,  3 Feb 2026 11:13:51 -0800
Message-ID: <1c26833cd70751680d6c99767e56c1f7076fd92f.1770145884.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1770145884.git.tim.orling@konsulko.com>
References: <cover.1769715106.git.tim.orling@konsulko.com> <cover.1770145884.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Feb 2026 19:14:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124107

From: Tim Orling <tim.orling@konsulko.com>

Faker is a Python package that generates fake data for you. Whether you
need to bootstrap your database, create good-looking XML documents,
fill-in your persistence to stress test it, or anonymize data
taken from a production service, Faker is for you.

* Skip tests/pytest as this causes the 'pytests --automake' parser to fail
  for some reason [1] and the handful of tests are of questionable extra value.

Testsuite summary
TOTAL: 2151
PASS: 2146
SKIP: 5
XFAIL: 0
FAIL: 0
XPASS: 0
ERROR: 0
DURATION: 39

Dependency for python3-orjson ptest.

[1] https://gitlab.com/rossburton/python-unittest-automake-output/-/issues/9

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../ptest-packagelists-meta-python.inc        |  1 +
 .../python/python3-faker/pytest.ini           |  3 ++
 .../python/python3-faker_40.1.2.bb            | 48 +++++++++++++++++++
 3 files changed, 52 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-faker/pytest.ini
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
diff --git a/meta-python/recipes-devtools/python/python3-faker/pytest.ini b/meta-python/recipes-devtools/python/python3-faker/pytest.ini
new file mode 100644
index 0000000000..26f64467ce
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-faker/pytest.ini
@@ -0,0 +1,3 @@
+[pytest]
+addopts =
+    --ignore=tests/pytest
diff --git a/meta-python/recipes-devtools/python/python3-faker_40.1.2.bb b/meta-python/recipes-devtools/python/python3-faker_40.1.2.bb
new file mode 100644
index 0000000000..2a9970a91c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-faker_40.1.2.bb
@@ -0,0 +1,48 @@
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
+SRC_URI += "file://pytest.ini"
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
+    install ${UNPACKDIR}/pytest.ini ${D}${PTEST_PATH}/
+    install -d ${D}${PTEST_PATH}/tests
+    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
+
-- 
2.43.0


