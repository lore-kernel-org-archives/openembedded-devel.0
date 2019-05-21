Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
	[209.85.214.173])
	by mail.openembedded.org (Postfix) with ESMTP id 219F57E140
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2019 03:56:49 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id r18so7714649pls.13
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 May 2019 20:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=d3K035TFHeeDaiBdI3nIcMlIxDeQKDykFm7JRqeyPdQ=;
	b=g6bem7Uiz37TK8cnpDronO07N06HcGgfhJMHTHHmEvzA4jUa+LZne1IPGsFN/wPwLU
	pd2blbey/5itL89I1f3CVlUt1gmWOnqZHwzPeAh5luMQdtWPOVydEOIwJmw8isCxgged
	EW+sdWTkLCabH0wNHoPlHojZykQKSJRd3TBVs/k3aLKmvhU8QYErZl9tAsi/Uih56QqA
	prj3vJfAjTDzD/I/zjGyVJD2kY/Z8RCR062/sVAyo+huuItQiI11niwXoUlTNQBVIatQ
	4B8wREuDifpsAwl/POPyG5r7lVVbct8M2CBFZgWNHP35TQyNcSnfiUshlUFKQJyIB/MQ
	5/pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=d3K035TFHeeDaiBdI3nIcMlIxDeQKDykFm7JRqeyPdQ=;
	b=rPMp05VPUZQS52YOli8lHwUTKMg1gcbm8OXagXCCj6rv4TU85KNm6MbmWd/FyZtejZ
	4Ap9ZeVsd8ZM1FMRbZZH74Mh7YwyfIjibF6naj696PKmGzfJckW00ht516MvwefTNUKh
	eRlpQxAmnR4Dj1Iwzuv3DAy+RiXMisR24gaeQo+e0AtBY35jX3yRag/+qi2idnT3mH2A
	YxAa+y1My8HiBj8DPGQN+7bjs4k2ZLYLdrDi+y4mn1gXtnpLeRxDxWPi9dWglXtWwJTm
	omy5NwMfoxTuN8wzW7KXvtQujKdImXjlbXYngz8JXc+FE2vkrzpD86xYdNcL2xqCbHO6
	BYkQ==
X-Gm-Message-State: APjAAAXfEu1yfwXC7qrGTL2KxqCDclsSrxuiVOCGCnW1PM2I0YxLfbdz
	cpQou456L1bvMfmNqa/qd+jLTkaD
X-Google-Smtp-Source: APXvYqy+5IMWmfMEHfmCMpOu71FGdQfdVPddWRA0wMJdG4NRqe2sCN0TipbN+b1M7rSV2aITMSBKHQ==
X-Received: by 2002:a17:902:3143:: with SMTP id
	w61mr72551511plb.292.1558411011067; 
	Mon, 20 May 2019 20:56:51 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:199d:e2fe:5a4f:97f4])
	by smtp.gmail.com with ESMTPSA id
	h13sm23045273pfo.98.2019.05.20.20.56.50
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 20 May 2019 20:56:50 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 May 2019 20:56:15 -0700
Message-Id: <f34317eed09a09ef75a469e9b4cc616adf7aef60.1558410874.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1558410874.git.akuster808@gmail.com>
References: <cover.1558410874.git.akuster808@gmail.com>
Subject: [warrior][patch 15/34] python3-pillow: Set CVE_PRODUCT
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
X-List-Received-Date: Tue, 21 May 2019 03:56:50 -0000

From: Akshay Bhat <akshay.bhat@timesys.com>

pillow is used in NVD for CVE's like:
https://nvd.nist.gov/vuln/detail/CVE-2016-3076

Signed-off-by: Akshay Bhat <akshay.bhat@timesys.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-python/recipes-devtools/python/python3-pillow_5.4.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pillow_5.4.1.bb b/meta-python/recipes-devtools/python/python3-pillow_5.4.1.bb
index 746c184..6fce162 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_5.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_5.4.1.bb
@@ -23,6 +23,8 @@ DEPENDS += " \
     openjpeg \
 "
 
+CVE_PRODUCT = "pillow"
+
 S = "${WORKDIR}/git"
 
 BBCLASSEXTEND = "native"
-- 
2.7.4


