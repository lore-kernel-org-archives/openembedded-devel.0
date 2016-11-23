Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7CEC0605B3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 09:22:40 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id 3so673626pgd.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 01:22:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=goASv1lS1tWyOXRlL/rtyX+ezr6tRbZXTYX5S53DO8c=;
	b=MUMS5uf6nEgcWde/3ppA/Ft/qX9qsSjsiCoFoBAv57kBT1RJ/zyhNvLjsBhzqLi/+E
	bYEWJQ8GTnjZd08wWcAyGR5A4NS3PBt40TpEw/rDH9qrdDK3/4PFKIs1ztk0K10/c1kh
	AFnpJVYvBr2RFdIk144KG+q1XhewJTUwNA39oe5WwmA6I3LZ9Mlq+BdgtnSlHnaTTLz9
	RIVvmKa/L9SZm7JI2P1ILyMn3lpyy81oVoT8LzE8vNeJAiEFksG5570Hv46Jed1LjRXM
	hChlk9kqeKJVvDiXdLb2+NOxwAMdp0TKz7jdoTIsx0xQL8X/GcULtQJD66Q2OLlG+Mb/
	lCFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=goASv1lS1tWyOXRlL/rtyX+ezr6tRbZXTYX5S53DO8c=;
	b=LRV2kWEXF/W5JV86wdbndnsCt3OWjd4bOuCEW3EkrN+YkYIlw3G3FjgpLLshvXDTJK
	Py/NHzprSOry0Mjo9UDky5E45mqaRTWtIO3pWoFoNl0LrXhXs/J9xz8HzEefA4y0WQsg
	hSgcYc+wuNCXFNxH3roSdFR3IwtYMSWcSMk7BDtFbOXZ28XKHUY1Rc7n8K1I/D8mWPXw
	yPr6QmSFO8Yv4qq4OvdNSbeuaErUc0AFuRk9KWIQOhTEHLDeLlNEsiDKGq503nvsj7tB
	8t1MgoufbDbf/HadQpUCNNdhEE56j8AsN9vLbYibd2oDWPWOLjj0Yki6v7vwLbt0mJPz
	2DIg==
X-Gm-Message-State: AKaTC0365wAB3tTYp/o1C8qMG0faokUF0xU1KFdCKTh9hSDI261YfVQdXjqSb8YTONNC3A==
X-Received: by 10.99.126.94 with SMTP id o30mr3574533pgn.66.1479892962096;
	Wed, 23 Nov 2016 01:22:42 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	u23sm51056087pfg.86.2016.11.23.01.22.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Nov 2016 01:22:41 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Nov 2016 01:21:53 -0800
Message-Id: <20161123092209.23699-33-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161123092209.23699-1-raj.khem@gmail.com>
References: <20161123092209.23699-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 33/49] dialog: Update 1.3-20160424 -> 1.3-20160828
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
X-List-Received-Date: Wed, 23 Nov 2016 09:22:40 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../dialog/{dialog_1.3-20160424.bb => dialog_1.3-20160828.bb}        | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-extended/dialog/{dialog_1.3-20160424.bb => dialog_1.3-20160828.bb} (86%)

diff --git a/meta-oe/recipes-extended/dialog/dialog_1.3-20160424.bb b/meta-oe/recipes-extended/dialog/dialog_1.3-20160828.bb
similarity index 86%
rename from meta-oe/recipes-extended/dialog/dialog_1.3-20160424.bb
rename to meta-oe/recipes-extended/dialog/dialog_1.3-20160828.bb
index 2d8fbae..bff3d97 100644
--- a/meta-oe/recipes-extended/dialog/dialog_1.3-20160424.bb
+++ b/meta-oe/recipes-extended/dialog/dialog_1.3-20160828.bb
@@ -8,11 +8,10 @@ DEPENDS = "ncurses"
 LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
 
-SRC_URI[md5sum] = "582d804252205f73df2d892ebdc5212e"
-SRC_URI[sha256sum] = "47f5870876e778aa2902f2e91b4070418d4651b647e1a67a94127cb8aab5b5eb"
-
 SRC_URI = "ftp://invisible-island.net/dialog/dialog-${PV}.tgz \
           "
+SRC_URI[md5sum] = "a39ec183517bc1feaff017d067300b8c"
+SRC_URI[sha256sum] = "453095abaec288bfbc1ca9faced917e17742cff1ea45ec46210071ac153562f9"
 
 # hardcoded here for use in dialog-static recipe
 S = "${WORKDIR}/dialog-${PV}"
-- 
2.10.2


