Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f44.google.com (mail-ee0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id 1AFD46B7E6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 07:19:11 +0000 (UTC)
Received: by mail-ee0-f44.google.com with SMTP id b47so181972eek.17
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 00:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=paFCpzoFle7ifXGyi8V6/5MbWA/8JOv3STraLPFz5F0=;
	b=cXZMgzIJLCCwfcsQDdMWf/HUaYuNspLX+e2H3B+zboNJ3L6m2zwXUn2OnY9EQbScUc
	eprvzYLxxiItRSofCSUUKGXv5Ej64Bi5ey8VyGkc4YyCPv6g7denDzu6bKIzPKwu7L/e
	gEgBNsbJ3GNN7SpRld6Rwqf0HVUOrcqhcPsee6NunE8vCS5GhawmDVnu5ZjDfvg/pIXR
	UkHwwQ1p/rAOCLgndJ2UjuZR+IpismAqFHkckbta2mRvzw+njgf9rL8fVZ7tTv8l7cup
	V1tLkpoRF3q8D5VRQvcQIk0i+3i4v0U89DPBJ7Etpg6zezssOyUQAXFo2SByDibp9KgI
	UvdQ==
X-Received: by 10.14.204.194 with SMTP id h42mr20911601eeo.47.1376551152474;
	Thu, 15 Aug 2013 00:19:12 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	l47sm37384379eex.15.2013.08.15.00.19.11
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 00:19:12 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Aug 2013 09:18:55 +0200
Message-Id: <7504087da27044796bd4f1b932891a128d0ff7c2.1376551135.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][dylan][PATCH 15/60] wbxml2: add missing dependency on expat
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 15 Aug 2013 07:19:12 -0000

* do_configure fails without it:
  | -- Could NOT find Expat

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/opensync/wbxml2_0.10.8.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/opensync/wbxml2_0.10.8.bb b/meta-oe/recipes-support/opensync/wbxml2_0.10.8.bb
index c87e477..bca305f 100644
--- a/meta-oe/recipes-support/opensync/wbxml2_0.10.8.bb
+++ b/meta-oe/recipes-support/opensync/wbxml2_0.10.8.bb
@@ -4,6 +4,8 @@ SECTION = "libs"
 LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c1128ee5341ccd5927d8bafe4b6266e1"
 
+DEPENDS = "expat"
+
 SRC_URI = "${SOURCEFORGE_MIRROR}/libwbxml/libwbxml-${PV}.tar.gz"
 
 SRC_URI[md5sum] = "f5031e9f730ffd9dc6a2d1ded585e1d1"
-- 
1.8.3.2


