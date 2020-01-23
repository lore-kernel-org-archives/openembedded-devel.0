Return-Path: <ticotimo@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 81D6D7FCC6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jan 2020 03:10:02 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id 6so629387pgk.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2020 19:10:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=gJyX3w2MBM9+cSvuqAxu2hg+zIJrxo5H+yPmGE82EIc=;
	b=O6h5dcQ5KbdgIOPKfEAYP7embF1bwPV0Ql4bl0kJ8IGps77Hbf9koG+DLWie88Mz/F
	K22QFn/Qe5COXm6q2zubp78min2H+8M6FGisaSLRSIK20nuNwlcDjkFlDDcOgY+JqmrD
	xdJNhejibnE2Tddt4u6PlSkdZTBSG663a74rDYZd2/JyeDjC90jhHnBZle8YNnPu9N60
	Z7ZHF9ZzQj22d8KsgE9HbiCFjvnk6VZUhqWmApXU+BPC4AY1zvbVn2ThTWC93wN1Ubvd
	NelBoBIvrw6YA5BJsY2F28fAvrLknEGseofWvYcMypEhBuD6v4eINFo4By6WkplPrSFu
	j68w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=gJyX3w2MBM9+cSvuqAxu2hg+zIJrxo5H+yPmGE82EIc=;
	b=mYy83wa4vWVNVlBVZrrZuLM5CCbQ8Xma0VCEGzQcVtOgUHg63Itx6wjwchmGjWUtn6
	wpsW+X0FsQauDHQMUloY7R1SCBzFo3BCAhUqVA6UrhqWDIHZXQ+ADeD7r2cjJ+vHU92K
	+ikbuvkAoOZd2QdbmVzzC1tUG4oV2/F1SxRQnwCuVtOiyhBnBNIRq+RHInqTsFs0rdy8
	Q7eIeunIys55FcYCeMhywBm8m116F+y6csY+4Vju9VYa5OFr6KnOzPNqd0bLuwDehONF
	90d2747LgE1yUCfgR3yOo5X+x5AajL8p7kwI62fZr4+KSfkpka8MYARPKRb68/KbF+DJ
	W7OA==
X-Gm-Message-State: APjAAAXWwlwWDcbq///yHLqsy0qhQqC2B4QJdukVre11Mq4irvws7xSN
	ai2CX6JJAn3AbyvP34gEy48n4hP8ZvQ=
X-Google-Smtp-Source: APXvYqw4/1so2XBccD44uWM0Bi0PAdCiE7vmDLiZMGI5rzG0dcc2M125N1FRtW5JIsDYdh/23gDiRA==
X-Received: by 2002:aa7:9306:: with SMTP id 6mr5534520pfj.36.1579749003177;
	Wed, 22 Jan 2020 19:10:03 -0800 (PST)
Received: from thetis.hsd1.or.comcast.net
	([2601:1c0:6080:4500:982e:71f9:9a69:ecbf])
	by smtp.gmail.com with ESMTPSA id h6sm310284pfo.175.2020.01.22.19.10.02
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 22 Jan 2020 19:10:02 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Jan 2020 19:09:46 -0800
Message-Id: <20200123030946.20787-1-ticotimo@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [meta-python2][PATCH] python-pyperf: add missing RDEPENDS
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
X-List-Received-Date: Thu, 23 Jan 2020 03:10:02 -0000
Content-Transfer-Encoding: 8bit

* Missing run-time dependencies:
    ${PYTHON_PN}-contextlib
    ${PYTHON_PN}-datetime
    ${PYTHON_PN}-fcntl
    ${PYTHON_PN}-math
    ${PYTHON_PN}-numbers (fractions)
    ${PYTHON_PN}-six

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 recipes-devtools/python/python-pyperf_1.7.0.bb | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/recipes-devtools/python/python-pyperf_1.7.0.bb b/recipes-devtools/python/python-pyperf_1.7.0.bb
index 20aa7a31..e722b08d 100644
--- a/recipes-devtools/python/python-pyperf_1.7.0.bb
+++ b/recipes-devtools/python/python-pyperf_1.7.0.bb
@@ -23,4 +23,12 @@ PYPI_PACKAGE = "pyperf"
 
 DEPENDS += "${PYTHON_PN}-six-native"
 
-RDEPENDS_${PN} += "${PYTHON_PN}-statistics"
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-contextlib \
+    ${PYTHON_PN}-datetime \
+    ${PYTHON_PN}-fcntl \
+    ${PYTHON_PN}-math \
+    ${PYTHON_PN}-numbers \
+    ${PYTHON_PN}-six \
+    ${PYTHON_PN}-statistics \
+"
-- 
2.25.0


