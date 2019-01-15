Return-Path: <stefan@agner.ch>
X-Greylist: delayed 344 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 15 Jan 2019 14:52:27 UTC
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id 719366BE2D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jan 2019 14:52:27 +0000 (UTC)
Received: from linuxdev2.toradex.int (unknown [46.140.72.82])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 802B85C01E8;
	Tue, 15 Jan 2019 15:46:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1547563603;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:content-type:content-transfer-encoding:
	in-reply-to:references; bh=mAp89TzKQDwwo1LxZYPOcK2F//HwLee101P86E7LkZk=;
	b=OkqZhGiFshR5ynIJXZMuOcS9iUQQZq3guBKC5XZvWNz37pzGJ8MmrDzfuevZujDqP3RLjB
	6LzlbZqQ8QnHhgD5zHHLRH6J+TbnQuIPlA4KJ0bpItVBV0fveXkfGkNhpZ+sEqmP6vB67R
	dxBwtEg818/dDlO6VAqdbG33+82Zlg4=
From: Stefan Agner <stefan@agner.ch>
To: raj.khem@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Tue, 15 Jan 2019 15:46:40 +0100
Message-Id: <20190115144640.3750-1-stefan@agner.ch>
X-Mailer: git-send-email 2.13.6
Cc: Stefan Agner <stefan.agner@toradex.com>
Subject: [meta-oe][PATCH] python-cryptography: drop python-pycparser dependency
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
X-List-Received-Date: Tue, 15 Jan 2019 14:52:27 -0000

From: Stefan Agner <stefan.agner@toradex.com>

The python-cryptography package is in fact not depending on
python-pycparser.

Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
---
 meta-python/recipes-devtools/python/python-cryptography.inc | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python-cryptography.inc b/meta-python/recipes-devtools/python/python-cryptography.inc
index dbbfe2cbe..415e823f8 100644
--- a/meta-python/recipes-devtools/python/python-cryptography.inc
+++ b/meta-python/recipes-devtools/python/python-cryptography.inc
@@ -17,7 +17,6 @@ RDEPENDS_${PN} += " \
     ${PYTHON_PN}-cffi \
     ${PYTHON_PN}-idna \
     ${PYTHON_PN}-asn1crypto \
-    ${PYTHON_PN}-pycparser \
     ${PYTHON_PN}-setuptools \
     ${PYTHON_PN}-six \
 "
@@ -27,7 +26,6 @@ RDEPENDS_${PN}_class-target += " \
     ${PYTHON_PN}-idna \
     ${PYTHON_PN}-numbers \
     ${PYTHON_PN}-asn1crypto \
-    ${PYTHON_PN}-pycparser \
     ${PYTHON_PN}-setuptools \
     ${PYTHON_PN}-six \
     ${PYTHON_PN}-threading \
-- 
2.13.6


