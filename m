Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
	[209.85.214.177])
	by mail.openembedded.org (Postfix) with ESMTP id BC039915E0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jan 2020 05:41:14 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id b22so845789pls.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2020 21:41:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=TxOdEHSeBn5J+GY5Bpo9E9qhcL8ZzAUAeHJdgfibBPA=;
	b=ovnYX6KJ1LA2WZvmP7JRMj0PtSl8Tx5yoUDCp7chaj65O8g4MISZAwxM/DlxoGgvSg
	UkfJsEdJ4RfVREkZqPXSjk2SEbvUY8+M/+CA1pafa3zvz+o+nqAevPrVCw6wJF7vm2oe
	P87MiuLRW14sr3Bx4M4Yg5KA9uAQwWJK2fEdPlUIVkcLxNskXAxqVUcoX8dDujSiZkAf
	S3/PUGHqS/7S9e5Rjdw84Nb9ECwd7+Y5VknMcya2urzq1Vr2Ke7CQBMCrhx9gXeD2Zra
	g5YkC+2UluoAMYK/AHhkwUZzTlrAYpy4kWFfVE1YZ/jbTXsxwmtIo7F45NNJIm/GeH1k
	SW6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=TxOdEHSeBn5J+GY5Bpo9E9qhcL8ZzAUAeHJdgfibBPA=;
	b=DoVLa0vzpGM26t6CTVdQyjPT5wemc34CrNrmKed+UciZsOV5lF2S6ubwHD7kkmiTa9
	ggrDqg0jxLF1vZpPc8niu9tUsQHSb8pPmpoHPg3QPQrZd5QpRcXYnA79U6+WBuu163ED
	F3cWnauQwucv+bJ0ZkxBzZFqQAUkPv/b0C7z4zEcXwa8V3bCwbtKwrBGRFZOUHq1oH1j
	o/HPm2NC+A3ljrBWlK9BqvZ+o9XuxTKmGwNbp7bW3CNFyUw3bT1ljwD9v1OGqwYvwosN
	kgWDy1xm/8Brwqp8L+bJJ5gHLHLbyIBolv9zZWP8iGeB9QZkDIm+LgDY0xywx9A6oGPQ
	PYHg==
X-Gm-Message-State: APjAAAW0vlyio/PtW+lArc+td42y3gEzfp2X+xqb8Sc6Nakt7Yxv1Cv5
	iryyrdIkokyGNJ1EgKh7LS9AvPhbsK4=
X-Google-Smtp-Source: APXvYqzHPGME9rrzL/ABDp/MZHv40rGIWNFxyFtvtT/MEGWROV0hEVnSM3TMKJ2y4FfZbU7fPpNfUA==
X-Received: by 2002:a17:90a:cf11:: with SMTP id
	h17mr2616226pju.103.1579758075452; 
	Wed, 22 Jan 2020 21:41:15 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::cab1])
	by smtp.gmail.com with ESMTPSA id e19sm848164pjr.10.2020.01.22.21.41.14
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 22 Jan 2020 21:41:14 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Jan 2020 21:41:14 -0800
Message-Id: <20200123054114.352300-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [meta-python2][PATCH] python-pygobject: Drop option to select python3 support
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
X-List-Received-Date: Thu, 23 Jan 2020 05:41:14 -0000
Content-Transfer-Encoding: 8bit

So that accidentally its not set in downstream layers which can conflict
with python3-pygobject from meta-python

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes-devtools/python/python-pygobject_3.34.0.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/recipes-devtools/python/python-pygobject_3.34.0.bb b/recipes-devtools/python/python-pygobject_3.34.0.bb
index 0cbd07f..287846d 100644
--- a/recipes-devtools/python/python-pygobject_3.34.0.bb
+++ b/recipes-devtools/python/python-pygobject_3.34.0.bb
@@ -22,11 +22,12 @@ S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 UNKNOWN_CONFIGURE_WHITELIST = "introspection"
 
+EXTRA_OEMESON_append = " -Dpython=python2"
+
 PACKAGECONFIG ??= "stagedir"
 
 PACKAGECONFIG[cairo] = "-Dpycairo=true,-Dpycairo=false, cairo python-pycairo, python-pycairo"
 PACKAGECONFIG[tests] = "-Dtests=true, -Dtests=false, , "
-PACKAGECONFIG[python] = "-Dpython=python3, -Dpython=python2, , "
 PACKAGECONFIG[stagedir] = "-Dstagedir=${PYTHON_SITEPACKAGES_DIR}, -Dstagedir="", , "
 
 BBCLASSEXTEND = "native"
-- 
2.25.0


