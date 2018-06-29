Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f181.google.com (mail-qk0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id 1E59C751FE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jun 2018 20:46:00 +0000 (UTC)
Received: by mail-qk0-f181.google.com with SMTP id z74-v6so5670045qkb.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jun 2018 13:46:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=tE9l/MQXMHFUf4BxenjltDzA8+j8ALpMxmQXud5op9s=;
	b=YgR856x8wSfTWsoBC/9TYtal5mvHD3SyHbzYchf3H1m0fm6CeX848inJPqlmtc9XX8
	UZfk6V/3wrZ99SIdB47fm9PIa/QEervWEkepXthLBLf/1F7LAgpIJb+ouC+luvPqrTUd
	4mZls0reZtm0LnGcCWRwLe/3Ssc8lLgowwXt1PLGRx/u7i3nEpa7/ue0GCtmi2otLSX6
	K609yVxiHUMyK69Ckt9TOjUrXf1i9z6Lg+8nIenp1YYx7aejV2N/Jt54otVxEX/3E5Fi
	ETBNzsZd2IooCNn8GCBQdoPAyhULf31Qn5CBYp4u8nPSqIdrJjeqGDxKtLFZmcCeCgzp
	ZV1Q==
X-Gm-Message-State: APt69E1O+37Qwg+izQYZnx8BZfUdHv1vgsLDqMrzcsoEy8DYrmBZtdKb
	XZKT7nALTBBeqAzrvBSjxAbNAi62
X-Google-Smtp-Source: AAOMgpd9Py3MKR5SexhPr6gAxBARqsyWuSemRY6wm686EVLYGTGS4fuwzsDzwHkNfIzWHE979g7ICA==
X-Received: by 2002:a37:8346:: with SMTP id
	f67-v6mr13310117qkd.18.1530305160492; 
	Fri, 29 Jun 2018 13:46:00 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-100-33-240-84.nycmny.fios.verizon.net. [100.33.240.84])
	by smtp.gmail.com with ESMTPSA id
	13-v6sm1632876qtn.75.2018.06.29.13.45.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 29 Jun 2018 13:45:59 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 29 Jun 2018 16:45:43 -0400
Message-Id: <1530305144-2721-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH 1/2] python-cryptography-vectors: update to version 2.2.2
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
X-List-Received-Date: Fri, 29 Jun 2018 20:46:00 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-cryptography-vectors.inc   | 4 ++--
 ...yptography-vectors_2.2.bb => python-cryptography-vectors_2.2.2.bb} | 0
 ...ptography-vectors_2.2.bb => python3-cryptography-vectors_2.2.2.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-cryptography-vectors_2.2.bb => python-cryptography-vectors_2.2.2.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-cryptography-vectors_2.2.bb => python3-cryptography-vectors_2.2.2.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-cryptography-vectors.inc b/meta-python/recipes-devtools/python/python-cryptography-vectors.inc
index 31461ec..4e59b20 100644
--- a/meta-python/recipes-devtools/python/python-cryptography-vectors.inc
+++ b/meta-python/recipes-devtools/python/python-cryptography-vectors.inc
@@ -8,8 +8,8 @@ DEPENDS += " \
     ${PYTHON_PN}-cryptography \
 "
 
-SRC_URI[md5sum] = "303a08ff50a5590d0ba05252981417ee"
-SRC_URI[sha256sum] = "cf601c7d87ad6a938bcea29062375dce1d3e26dabd1db52bbc37eeaf4aac970d"
+SRC_URI[md5sum] = "189bee4491a1856169790e8683f269be"
+SRC_URI[sha256sum] = "28b52c84bae3a564ce51bfb0753cbe360218bd648c64efa2808c886c18505688"
 
 PYPI_PACKAGE = "cryptography_vectors"
 
diff --git a/meta-python/recipes-devtools/python/python-cryptography-vectors_2.2.bb b/meta-python/recipes-devtools/python/python-cryptography-vectors_2.2.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-cryptography-vectors_2.2.bb
rename to meta-python/recipes-devtools/python/python-cryptography-vectors_2.2.2.bb
diff --git a/meta-python/recipes-devtools/python/python3-cryptography-vectors_2.2.bb b/meta-python/recipes-devtools/python/python3-cryptography-vectors_2.2.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-cryptography-vectors_2.2.bb
rename to meta-python/recipes-devtools/python/python3-cryptography-vectors_2.2.2.bb
-- 
2.7.4


