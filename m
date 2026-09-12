Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FF00C88E63
	for <webhook@archiver.kernel.org>; Sat, 12 Sep 2026 23:51:51 +0000 (UTC)
Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16731.1789257106488076251
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Sep 2026 16:51:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=KswJZUQ6;
 spf=pass (domain: gmail.com, ip: 74.125.227.141, mailfrom: raj.khem@gmail.com)
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccd66bb5so676445a91.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 12 Sep 2026 16:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789257106; x=1789861906; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WCfMwhbNzSK3H/l3WnsZ92zNJTldP8iWxwLNVBYNejg=;
        b=KswJZUQ6V+HyQiQfLpWoDaiX8HDf2Q4WiSMCxjJdmwQjPEB81krFwkjGqf+LgHzpw3
         TW70YqKepFJWzyukKex4IRi/u0/+2JcIms4/Hrl+C9FCy5nCx8A2jLEut6PlcSYtSxet
         ZoDCGdfg/773CgKGHvEZZc+eYEzjVp6SA1oZxx8LEyX3jMkWgl6GATtkN1HFjxlQgyWv
         yvJ8/1fnm3oneiAgtXPXym50GOMxSYQE0sYSHMtAtnIwqpn7SEVa4x6ziJE99VZdCBzc
         wMOw/CONARofBWLHORyo/uFbkhB02NsNsWvxkHrg41V+hA0xH3CkK5He3zmUQMyDFTdz
         OfPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789257106; x=1789861906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WCfMwhbNzSK3H/l3WnsZ92zNJTldP8iWxwLNVBYNejg=;
        b=byWHSbMgFPy+SfF+jfFEh0DUZqzI//DPAWFnMS/7/glLkAHitQBgqpkq/iEhn9AdV1
         paQQPYjDVux14RLwO96P7XBca9bfXwml1Re51Ez3gy/vr3ZquTLHZ8rC7eNX6hApkfYh
         INNzKbXKZl82ksz1OyxKGUJdVCPogf+3YdUnc+sDNGj6Hdpj99wXhaQK8sSdox5qnAJd
         rahOLtrn2z/WcxnipVrelCeFblIOu/2Oewh1KAy1HJmMcJApobELuIcd7XSFzkzT0KTo
         jiXAq/4QH6LPx0YtugyoNB22T9yJ4k8jXO4Q/Zb0zP7kU+iq5ni1HWSq7wpwNDbrMYQs
         7ckA==
X-Gm-Message-State: AFuF++nImFl+fY7+/lLf4K2en8G5sH3HSFoN2512UCdK0NFYc/hpj/8m
	ztgQTwaD6NQFdolVkIexNx/S2GGTG+QNDocH+ftmC2nEZAcqqBDAs+9v0wP/tQ==
X-Gm-Gg: AYBFou2rhKYby1MXxsMwIub68K5J8jf/1oraSx1VUkwcAaREmalWDhRG01KeE0KVcSb
	B8kU+dxWJE5M14AebRkxvnZgRDWl3rSysvomsmoja/HYsnv8puqG1pRB5JhqqZ/LBM06eQT1sQ6
	pqDIXVZFGRxwbR0bpmK7fp8aaG4hAuRj1eMwhu1ceTNaR1huBkj5DG1VdnFqV+ZccvKePTpx/BU
	41XDED/+HoYzvjeWHxrQgIwliilhDAr/iS/knpgFTxwetgekFZeZyc/rZ9R/kRbZ2drQchsofZ1
	oM+VGkpcydRiCaZlYvysP0VrOEXGDEAYQETAbl7+HM9YQQrtB/SL+SnY+w9rRRIsl/ek2LumZCi
	JVUCrkFn1BWKy/fUA9tUspN2q6Pj1YJhxQCCzIGxr51q2XJWfk7lU/DUNs2Xc1LNNfq4KM9sm0e
	n15bhm/lRw4OuVctR73I3K/pa9srsAmtyt4gDM2zuTvbYw4hzOL6N7YzgGex2Pr+tgbIcxfWCPZ
	Cu/d/RazAF7CRA+2sdbDW5ky5TQwDL5Yb6bEnnuMfQFeeoyYlIn6TJeqqak+76huDY3HcGMHXo4
	lzVRrkx4QcPNRbYvCgTVG4IOjiY7QYzl5/9KDe60b1QhZwh6dKALTIUCrdcZSs2knGPqI9Wtl8R
	W9Y0aqSpSi+SntAL1lpJn6n33hVSJ+R+nARtylZWBh0nSyXfKyF7FG4EO
X-Received: by 2002:a17:90b:5408:b0:39b:3109:10ce with SMTP id 98e67ed59e1d1-39dbc6a0196mr9153580a91.16.1789257105801;
        Sat, 12 Sep 2026 16:51:45 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4e52a60sm16093307eec.6.2026.09.12.16.51.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 16:51:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 2/5] python3-glances: install config and test data for ptest
Date: Sat, 12 Sep 2026 16:51:37 -0700
Message-ID: <20260912235141.2355852-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260912235141.2355852-1-khem.raj@oss.qualcomm.com>
References: <20260912235141.2355852-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 12 Sep 2026 23:51:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129982

tests/test_core.py runs glances with ./conf/glances.conf and reads plugin
test data from ./tests-data, both relative to the ptest directory.
Neither was installed, and tests-data is not part of the pypi sdist, so
four tests failed:

  test_023_get_alert: AssertionError: 'DEFAULT' != 'OK_LOG'
  test_025_npu: IndexError: list index out of range
  test_026_mpp: AssertionError: 0 != 3 : Expected 3 MPP engines
  test_108_fs_zfs_: AssertionError: False is not true

Fetch tests-data from the v4.5.6 tag and install it, together with
conf/, next to the tests. Only tests-data/plugins is used by the tests.

With these in place tests/test_core.py passes 52/52 on qemux86-64.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-devtools/python/python3-glances_4.5.6.bb | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-glances_4.5.6.bb b/meta-python/recipes-devtools/python/python3-glances_4.5.6.bb
index 41516e07bc..311d38cac3 100644
--- a/meta-python/recipes-devtools/python/python3-glances_4.5.6.bb
+++ b/meta-python/recipes-devtools/python/python3-glances_4.5.6.bb
@@ -11,7 +11,19 @@ inherit pypi python_setuptools_build_meta ptest-python-pytest
 
 SRC_URI += " \
 	file://run-ptest \
+	git://github.com/nicolargo/glances.git;protocol=https;branch=master;name=testsdata;subpath=tests-data;destsuffix=glances-tests-data \
 "
+# tests-data/ is used by tests/test_core.py but not shipped in the pypi sdist,
+# take it from the v4.5.6 tag
+SRCREV_testsdata = "ce2f8506289c71e48ed8bf186f2c04d8256203d5"
+
+# tests/test_core.py runs glances with ./conf/glances.conf and reads plugin
+# test data from ./tests-data, both relative to the ptest directory
+do_install_ptest:append() {
+	install -d ${D}${PTEST_PATH}/conf ${D}${PTEST_PATH}/tests-data
+	cp -rf ${S}/conf/* ${D}${PTEST_PATH}/conf/
+	cp -rf ${UNPACKDIR}/glances-tests-data/plugins ${D}${PTEST_PATH}/tests-data/
+}
 
 # psutil/jinja2/packaging are oe-core; fastapi/uvicorn/defusedxml are
 # meta-python.

