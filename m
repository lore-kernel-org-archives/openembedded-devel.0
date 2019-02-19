Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 12F296C198
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Feb 2019 13:50:42 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id w17so22005478wrn.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Feb 2019 05:50:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=+XA6kBhydktzdlgGJA2KMHxBFZh6hXzVGJaA+8JFbkA=;
	b=Qp0+cyjChUniFEcp8stwKOAr5f/bWlRR7hFJrybvNxrAA0mYmIgdp8PVX19Q0IU455
	SqHbWIc/329QSuh1F7x2aLY1zOclqXWAALV63gSfjeJwnn3NMwbWUwLfLdyHF1Zuf9Jl
	Fjt/5XWZsLTgZG3bXHhsp0fwerOuBtXoOryreer2hx4aGTEf/TZ/jqnshbNRLxvkmaum
	oi0ZDc/o4r+OuxQpv1C/3KR7OGjXqpiRgDaZI/0AO/28NcolO5zb57thPZavMBX77I5z
	EbrxtDI4hEr+hDk0ws7sw7MYc9CwjfhudJ93/I7+qXLX2YXXGkVHVssvcIQAh3H9cXYh
	e0XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=+XA6kBhydktzdlgGJA2KMHxBFZh6hXzVGJaA+8JFbkA=;
	b=nCiNeSxbgdGPfe4d9OqNoK2tFwq+PR4hDp0LlvTbphh6clKW73Mjpea8gp41xRFows
	iifVUj7EvkKnST+fgmc9wVFvEVO6H76ezXnIoZhX+e225pIYsbi0PHvOt23TrSqLuIss
	pcW1E2NTSPbvC0F49ipTFoR95kLa02mZFXCavoOn8jA0TGf7lcmCEsedgQzIscXdlq09
	HFhfGvCLcME1iCrQYm6t0zA8ZbR1owCnJz5g4yl7IJtyNSx7amNaQLL0qT5myU4+VCx+
	GaRLmCJHS2leUSDB8udMoXiU/Eoyt8GgWyaZuvEmD79gV7Dc2c9S5YD2wfYYRxzTMynJ
	L7bw==
X-Gm-Message-State: AHQUAua5NYN3bJBgSo6I3GAlLqd9nWmgYg167rSzIRPP2ljJTfmUIdJr
	Ec3fZkgUjmuMyXVe4U2KQdfqeQ==
X-Google-Smtp-Source: AHgI3IaAqHf7x2XIJe4pborORSJ3kBu++SmWMs8OkYFqT/HrgtpYUlQfkKSSbDBhqe4RlR4SigMvmw==
X-Received: by 2002:a5d:6846:: with SMTP id o6mr20328806wrw.160.1550584243432; 
	Tue, 19 Feb 2019 05:50:43 -0800 (PST)
Received: from localhost.localdomain (lns-bzn-59-82-252-132-4.adsl.proxad.net.
	[82.252.132.4]) by smtp.gmail.com with ESMTPSA id
	z15sm23737495wrh.18.2019.02.19.05.50.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Feb 2019 05:50:42 -0800 (PST)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Tue, 19 Feb 2019 14:50:06 +0100
Message-Id: <20190219135006.20859-1-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [meta-oe][thud][PATCH] packagegroup-meta-oe: drop ptest packages that do not exist
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
X-List-Received-Date: Tue, 19 Feb 2019 13:50:43 -0000
Content-Transfer-Encoding: 8bit

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit bbde0a3d3012da1d6be824959b0ad0a930573650)
Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 08b4bbfc4..2a23a6170 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -234,19 +234,15 @@ RDEPENDS_packagegroup-meta-oe-test ="\
 
 RDEPENDS_packagegroup-meta-oe-ptest = "\
     zeromq-ptest \
-    libxml-ptest \
-    soci-ptest \
     leveldb-ptest \
     psqlodbc-ptest \
     lua-ptest \
     protobuf-ptest \
-    libdbi-ptest \
     rsyslog-ptest \
     oprofile-ptest \
     libteam-ptest \
     uthash-ptest \
     mcelog-ptest \
-    openldap-ptest \
     libee-ptest \
     numactl-ptest \
     poco-ptest \
-- 
2.20.1


