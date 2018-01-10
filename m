Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id BF2BD78837
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jan 2018 20:21:54 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id j137so630365qke.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jan 2018 12:21:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=PpJYojoAClYJlLRcw0ZNs/PTwdLXEOpbCEMp2g7WSgc=;
	b=pP13JOmJvYoWF/tCqdduSdmJbgU6XLQ7Wr253VSTUB/56HoLMkj4sOqEaXZAwN5v9n
	qk0H9joWrzpmS9peRhlw9EBJQPBrm0bKnl+gbvVwZIBkPBev9p7iUAzoTCwcE68qwcMa
	arOx9ek2wUDbXRPK41sUiBsSyHRyWZW6dJLDPLgpo6E9VmsCeH0ORK+5aPlRPfGpNZ4y
	APOuGCUnK6GPHiAloXhe66nM3vbbJTQYCeEl3qTRkFOV23X3trsCdTDelrF7XINR8nGp
	6wNmnxy35hLcuXkWyh5Ku0c51OZ35qR6t3lBcNJl6YZiBmWidAcvyNhp86UBbqm/CuUp
	cshw==
X-Gm-Message-State: AKwxytcurFpP1TNTY+aXzaPofOugu1Djnv70jWl+HAl1ePh8iZNRswrF
	/vFDLJJRrE9vB3UYLasDxp+A2tKF
X-Google-Smtp-Source: ACJfBovIlekEqQZt2EyCMlH9/pdSTKYSTxfvdViOS5BgqowpaMuCHRaJ0IFicKGYhWIS4YU4KJDYUQ==
X-Received: by 10.55.155.209 with SMTP id d200mr15089432qke.272.1515615715415; 
	Wed, 10 Jan 2018 12:21:55 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	p187sm4338770qkf.41.2018.01.10.12.21.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 10 Jan 2018 12:21:55 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 10 Jan 2018 15:21:49 -0500
Message-Id: <1515615709-23920-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-msgpack: update to version 0.5.1
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
X-List-Received-Date: Wed, 10 Jan 2018 20:21:54 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-msgpack.inc                | 4 ++--
 .../python/{python-msgpack_0.4.8.bb => python-msgpack_0.5.1.bb}       | 0
 .../python/{python3-msgpack_0.4.8.bb => python3-msgpack_0.5.1.bb}     | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-msgpack_0.4.8.bb => python-msgpack_0.5.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-msgpack_0.4.8.bb => python3-msgpack_0.5.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-msgpack.inc b/meta-python/recipes-devtools/python/python-msgpack.inc
index c2a8583..2729c6a 100644
--- a/meta-python/recipes-devtools/python/python-msgpack.inc
+++ b/meta-python/recipes-devtools/python/python-msgpack.inc
@@ -2,8 +2,8 @@ SUMMARY = "MessagePack (de)serializer"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=cd9523181d9d4fbf7ffca52eaa2a5751"
 
-SRC_URI[md5sum] = "dcd854fb41ee7584ebbf35e049e6be98"
-SRC_URI[sha256sum] = "1a2b19df0f03519ec7f19f826afb935b202d8979b0856c6fb3dc28955799f886"
+SRC_URI[md5sum] = "29ef230aab635b7d3daaa349c735a1a0"
+SRC_URI[sha256sum] = "69aa1eb0e13be1d3bd495ca937eae66df4431126f5cfd5491dc40370e5644853"
 
 PYPI_PACKAGE = "msgpack-python"
 inherit pypi
diff --git a/meta-python/recipes-devtools/python/python-msgpack_0.4.8.bb b/meta-python/recipes-devtools/python/python-msgpack_0.5.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-msgpack_0.4.8.bb
rename to meta-python/recipes-devtools/python/python-msgpack_0.5.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-msgpack_0.4.8.bb b/meta-python/recipes-devtools/python/python3-msgpack_0.5.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-msgpack_0.4.8.bb
rename to meta-python/recipes-devtools/python/python3-msgpack_0.5.1.bb
-- 
2.7.4


