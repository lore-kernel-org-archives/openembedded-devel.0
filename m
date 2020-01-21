Return-Path: <ticotimo@gmail.com>
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
	[209.85.215.181])
	by mail.openembedded.org (Postfix) with ESMTP id 6F1B37EC40
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jan 2020 05:03:22 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id k3so810649pgc.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jan 2020 21:03:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=U/b3DjHigIiXFPtCzK6aa49eWhup4pNAaHDCLAVQTZE=;
	b=dXhWWU7CA+F9EL4RmnQGhNAGmDZM14J3MQ9dlAhh1Dd1Pw3YevIIWs5OTBawZwIBlm
	b/tVaU57jLMKpHgzzEc1G8JaCFvlwesor8JbdLNePaWyQHEnW7sn/vyuUn4oncZEkFk4
	NZps4EpHppqUpX/GaH+sjPfyVZE+GhMXSWm7tFPQr4Yxi8insrUPPGtYQuG/qBo8TkDz
	LE1FCVGZEn9xk1ANuIZ5YagT8++xYFuzv1RE/+0fQ4/j94bWXVz8CALGelmVlHuwM/tA
	HinUOKA+B3Aw/GpcAdT7XdFQ3uJqKyA05nuJbZ+soWcJWC2x7uQtB5HbxgpLYvhdMBb8
	uM2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=U/b3DjHigIiXFPtCzK6aa49eWhup4pNAaHDCLAVQTZE=;
	b=TP2m7UvOzln+aTZPkHp1drTrMXA4yReuvLeDFpRCnTBEwyMFkQ3xn4LTIYkkBVgVBe
	Uejmx9Fwf6iuxrMFEvs1SzGw1VkXrMqRbv/ptB4SWz1F1oJZG0XPyzg3+UlAzMmQAmZ+
	MHRFqwkbOu+Ska09GH6Fyh6qxHV1cr/cvK0yAtjeYxIKAp6avZxk2QPxwdRoPZLqNFvk
	H6BkB0J7bked05FLp9P5NTOB2GY2NA6A3zXhNNrasNhbtQI/LgEOB0UxU2gv+da6w9dK
	lHLVisox4gqQm1+4vA3NB6/h4HopbYXDAbsizq+gmTYsnwKk9rNnmiZB+S2iTqZJMVMw
	ktng==
X-Gm-Message-State: APjAAAUytTt970uimH+0hC1WiSC4jyBhLPxAdQCqTPG30hEZD96DZFHE
	f90I0QBqXYIhCQwILgy1xX+lRQuX1ys=
X-Google-Smtp-Source: APXvYqwEB2IiB4RigxszcPbPO6fOOJKOmN4bN88PmOOobYE5VOgbG9cHcuxihAChbITOt304Rp3tpQ==
X-Received: by 2002:a62:14cc:: with SMTP id 195mr2652320pfu.160.1579583003163; 
	Mon, 20 Jan 2020 21:03:23 -0800 (PST)
Received: from thetis.hsd1.or.comcast.net
	([2601:1c0:6080:4500:7c96:1b52:3429:d935])
	by smtp.gmail.com with ESMTPSA id
	y62sm43387877pfg.45.2020.01.20.21.03.22
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 20 Jan 2020 21:03:22 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Jan 2020 21:02:57 -0800
Message-Id: <20200121050257.16561-4-ticotimo@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200121050257.16561-1-ticotimo@gmail.com>
References: <20200121050257.16561-1-ticotimo@gmail.com>
MIME-Version: 1.0
Subject: [meta-python2][PATCH 4/4] python-pymisp: add missing RDEPENDS
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
X-List-Received-Date: Tue, 21 Jan 2020 05:03:22 -0000
Content-Transfer-Encoding: 8bit

* differentiate target from -native,-nativesdk RDEPENDS
  while we are at it (for that day when someone wants it)

* Add missing run-time dependies [1]:
  - python-cachetools
  - python-deprecated

[1] https://github.com/MISP/PyMISP/blob/fac748dd4c63c9eef4056c5fc5201e811a97be10/setup.py#L44

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 recipes-devtools/python/python-pymisp_2.4.119.1.bb | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/recipes-devtools/python/python-pymisp_2.4.119.1.bb b/recipes-devtools/python/python-pymisp_2.4.119.1.bb
index 097328a4..627716b5 100644
--- a/recipes-devtools/python/python-pymisp_2.4.119.1.bb
+++ b/recipes-devtools/python/python-pymisp_2.4.119.1.bb
@@ -13,11 +13,15 @@ SRC_URI[sha256sum] = "594ea0a9e150052232425009eac6dd104a80f494d0e273cc48dd114d7e
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} += " \
+RDEPENDS_${PN}_append_class-target = " \
     ${PYTHON_PN}-dateutil \
     ${PYTHON_PN}-json \
     ${PYTHON_PN}-jsonschema \
+"
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-cachetools \
+    ${PYTHON_PN}-deprecated \
     ${PYTHON_PN}-requests \
     ${PYTHON_PN}-six \
 "
-
-- 
2.25.0


