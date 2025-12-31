Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51723EE6459
	for <webhook@archiver.kernel.org>; Wed, 31 Dec 2025 16:35:03 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.88290.1767198902804666101
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 Dec 2025 08:35:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hcHC4h5U;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7f1243792f2so7338152b3a.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 Dec 2025 08:35:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767198902; x=1767803702; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DMmax4qrqk+q4BJO5ZT4y0fqAQLRTxL5I2sa9iszDyg=;
        b=hcHC4h5UJHcosakXw8/AfmlLMxmR6/bE+FDOb6siPD+byFwELm5/uDmBQoSC6cFAdC
         nqVheH1zSqQANLUDe1eGkQPLBEx7yyLQRZaoCiRJLDhJAQ8EUThGsUqFajPMYG3m8tNJ
         6eQccbKRRg4vpdHENtkBfEMIsVlpHeqs3aPcowvkVAC06ghN3dsdGBxTVVJp5PryAicZ
         60C82vWPd0P49H+CJU4xSsh5wnRLrb4SI31lQaORQnhP+oPN8Rb3pj3POaGa90oDzzRO
         rHw1fupLQWKnaqzjSgerzN2lj+SPN6LUBBwwiS4AfYApLG8asjn4Wc9rgwvgB7sgTYlm
         4jxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767198902; x=1767803702;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DMmax4qrqk+q4BJO5ZT4y0fqAQLRTxL5I2sa9iszDyg=;
        b=tavQRehXYN5FAskBtU0NLgnT5sUE83zg23SUHur2LFQXQxvHYiIaR4c32dXhdvWIm3
         bQa32OdJJRWF3Y/V/CEy3WMvQFJ9bx6UCJsMFE5JznxXQShSBkaI/MMg1zoIAESlGzvU
         2gZ1yXR8uDb9mPDKAwVdyPt2zt+CpGOEBhBC9hf1D4pob36BMTvxA+AeXJVsRFgr8QRs
         tHTMWoSdBVd6mMihUWCBwfWOTrQedw9TSb1shvKdplyU2MeXjrEi5A8yQ7AHPlgzDqAW
         rQen2zyIBVrxhuzQVzBwq4b3pBi+cfCXn3lVBqcb1DG2ebNK0OEKKCeJSn3OTV+197C5
         WsWw==
X-Gm-Message-State: AOJu0Yw/gpE5ijk2DrfC/n2SITsb+b0IKFQPTyIvDLT2FnMVoyvE8DCp
	IzonIiOoO6sWSSSZf7M91xOA0m/HIToURGs6PdSe5D7y8+MW8Vp3/gVzZJJLmQ==
X-Gm-Gg: AY/fxX6eVxhTrYErZr6Itaxwu5IqMcXsESBRxh1D31i4L/i0BU7IwTOWLOokF6eFEiz
	ZLzT1t5pY2qdPgTqQxeF+zt4doUmPGBkvEb14zBfYBakydiDd1JzSM7e2ChQgrLdDKeNlu+3T8L
	27UZkh4GAYTGMKcAmL0FqFtGWRXC69AtX94niqktiQyD0NQCipjQN3QrvGKePeuXT8n417r5h5I
	6yarZdJfDDaD22uVn4Aap/IJQAm2RZRX7lWib4MlyOSePtOLU4muKsmsANTTFAih5uYc7K162ko
	BK9kqbYFdSsoLx2NmCTT41qN09dRQ2aLq3QvJd3aw62vGqqcrbYThvmjZ+Q+MbxdqmUGaPT2xni
	7wULeJ0m7Htz4MEQvyceonNAx5ROnRvkhfVw/j8o3/qhemLSVhIo1fPbbHcbejBRal4YTsn14rs
	+F0gHqdtNVLFTV0sbLIXH39XaCs7/DlLUJAcVjTQHUkUPtqjIsi9BP1G5Nj03t0TLOZOh892Ymx
	AMnhUWHAunEPvl4MluaFDZBc3x2kD0=
X-Google-Smtp-Source: AGHT+IFx3YkLBffjdUgjY1HGjV7cfu+iySkhMf+QAqJA+y16QLmatdf0s0gUYnfuDukAOVXAm9ZEkA==
X-Received: by 2002:a05:7022:7e0a:b0:11b:9386:a387 with SMTP id a92af1059eb24-121722e9e48mr41222543c88.42.1767198901675;
        Wed, 31 Dec 2025 08:35:01 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::28b])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121725548b5sm141302534c88.17.2025.12.31.08.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 08:35:01 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 1/2] python3-pyee: Add recipe
Date: Wed, 31 Dec 2025 08:34:56 -0800
Message-ID: <20251231163457.2607226-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 Dec 2025 16:35:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123081

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/python/python3-pyee_13.0.0.bb   | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pyee_13.0.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-pyee_13.0.0.bb b/meta-python/recipes-devtools/python/python3-pyee_13.0.0.bb
new file mode 100644
index 0000000000..fba54324da
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pyee_13.0.0.bb
@@ -0,0 +1,12 @@
+SUMMARY = "A rough port of Node.js's EventEmitter to Python with a few tricks of its own"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b2b1cc8797dff32cec5d783148fceab5"
+
+DEPENDS = "python3-setuptools-scm-native"
+SRC_URI[sha256sum] = "b391e3c5a434d1f5118a25615001dbc8f669cf410ab67d04c4d4e07c55481c37"
+
+inherit pypi python_setuptools_build_meta ptest-python-pytest
+
+RDEPENDS:${PN} += "python3-typing-extensions"
+
+PYPI_PACKAGE = "pyee"

