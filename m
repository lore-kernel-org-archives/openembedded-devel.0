Return-Path: <ticotimo@gmail.com>
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
	[209.85.210.171])
	by mail.openembedded.org (Postfix) with ESMTP id 5A12D6D4C6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Jan 2020 07:04:51 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id q8so2224457pfh.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Jan 2020 23:04:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=9zzq3vNCY+V5wh4xk0lVSi4lB/X3SAlESH/yHjRn4lU=;
	b=UjaE+kGWbjkdyUfGiWBvmAvuKK5GA5MinGGvyL9B1IuB3FBztPdeIUVGPCB+gXVRlj
	x1+7f3B2CFLcKgL0d8CgFHZWVLJoePcDdy9vy4s4vuVUCWsfLeOwSFdxLDmXTf8cg8l3
	fY8jhU54BSXvVMVSCYCQBNBvcHvpXcngBBRrS7lcbM+MRadFokX8ZizRnDCLUrXXuATM
	TeYL8KYPEs4ptb0ySIgvlBIjR9jankmOxsT5rMl/2vUI7tBrnwMcXqJh009pwmpUgFSH
	QU3UI+uFdR4/uXOgXL/MuSCboNJ7cMxRBQS3tNP6cmbfQDbJQpqYOEEl+NF+jZ+1w1Mk
	KTIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=9zzq3vNCY+V5wh4xk0lVSi4lB/X3SAlESH/yHjRn4lU=;
	b=hbqGMoCbWlHnWJElrJvT0KtKeNXqpnkB1r/WA5hjNnZFViXuSgSmjp4y/1rLULydFY
	O5vT+GH3tHXeR9syTjnCQDh56S5d0WAVLslfq/7SsIABG+2pucWyQizXPGZ0Crw6/Jd8
	YD+LzsMQXbKCyK+nO5PUnWqaOl68diyHtxe6NrXpPV540VOq98ytIhXd6PdnTU6qMxIn
	dvhNgpa32/TP3xzIZZDjwShrN3Rf2DW1Ed+okYPobZKyXR/6cCa+19mkEkaAYgXqFPh0
	NdpRxsSetVnEeXENAtpjkQr/45TR/f5KSPEX+7V/4tC0Hprzt7YR8tUMY5QxAMET0bSv
	9VSA==
X-Gm-Message-State: APjAAAXxgHvWMfvufjvGNuSfp3Qah25/pEC1olKQzkQhiJ6MWGUX0h0i
	kppfQOtEX6bJMfWod8XMbY307aSZSRI=
X-Google-Smtp-Source: APXvYqylqCn/60tbl2P8Rz3T4Vn0YuH7mYrI1diazbhSm0fjDt62lX5N3qYfgwLHZVNyiOc6/AwyMw==
X-Received: by 2002:a62:e912:: with SMTP id j18mr6923751pfh.4.1579935892129;
	Fri, 24 Jan 2020 23:04:52 -0800 (PST)
Received: from thetis.hsd1.or.comcast.net
	([2601:1c0:6080:4500:ddac:a57d:b60a:6cb7])
	by smtp.gmail.com with ESMTPSA id
	b98sm8260132pjc.16.2020.01.24.23.04.51
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 24 Jan 2020 23:04:51 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 Jan 2020 23:03:28 -0800
Message-Id: <20200125070328.34395-1-ticotimo@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [meta-python2][PATCH] python-javaobj-py3: add RDEPENDS
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
X-List-Received-Date: Sat, 25 Jan 2020 07:04:51 -0000
Content-Transfer-Encoding: 8bit

* Missing target run-time dependencies:
  - python-lang (functools)
  - python-logging

* Missing general run-time dependencies:
  - python-enum34
  - python-typing

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 recipes-devtools/python/python-javaobj-py3_0.4.0.1.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/recipes-devtools/python/python-javaobj-py3_0.4.0.1.bb b/recipes-devtools/python/python-javaobj-py3_0.4.0.1.bb
index a16c9498..97468d6c 100644
--- a/recipes-devtools/python/python-javaobj-py3_0.4.0.1.bb
+++ b/recipes-devtools/python/python-javaobj-py3_0.4.0.1.bb
@@ -12,4 +12,14 @@ SRC_URI[sha256sum] = "18c44cfaa214813784a823432b4ab9829c9626b2b00072011627b4008b
 
 inherit pypi setuptools
 
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-enum34 \
+    ${PYTHON_PN}-typing \
+    "
+
+RDEPENDS_${PN}_append_class-target = "\
+    ${PYTHON_PN}-lang \
+    ${PYTHON_PN}-logging \
+    "
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.25.0


