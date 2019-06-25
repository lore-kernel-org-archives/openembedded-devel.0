Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by mail.openembedded.org (Postfix) with ESMTP id CE4DB6C230
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jun 2019 07:52:30 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id z25so25719580edq.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jun 2019 00:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Y6vxU/8PJmyF1YpIDc1S/U6palD+xzWd/Kj3dYZWKyI=;
	b=MGfTGxyYsOj61qKFgTkbHPQ3Wb1dOI7sQ8rHNhGaeyE1rdVgyOg9yhjfDPFvD2zUPo
	ad4N6abWaOwbILdPaYpDBc1jWG2ro9S8raD+2rxZ0Hz63wd5qBkVfQ77UPveXqoPCcc0
	PfUrtOphSpBXfBoXwq+7JmeTU4cNJGCeXbiCLTepSvlOh1LjPkAmbMLb31cZg+ZF2qHc
	oDdIGl90khF7AgHgkVAs+D8zQdMwl+q78adOswZVTMEtC0IY3pC3njw3PY7tfGoAWMqk
	TFGmMwW1GNKvHgcKfWALaAmFbHSzEJzgGtqT+ff5/E2jDUQG+xGFaClisJgq5Mc9gFfo
	DuTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=Y6vxU/8PJmyF1YpIDc1S/U6palD+xzWd/Kj3dYZWKyI=;
	b=ta8INF4lb7anjb3rrt4lqkAPar9pWmhaZhE9QZuPeXhFMg5J1jOIMmu9RbJaxBZqWF
	uWya8VxxQSDy0zFo+8Zk3ycz1cJScGUJDC9YTW3mqpQzsMVAxJGhtBM+5t2LmfITKD/B
	FAiybE9wk4VqkiZE81mYK1lwG3P5mSDI+6abiNywZr3Fs8EPOmUwisXKEPA1v+xUt0kE
	m8EPhTxhFiPpawwqfWVwD937a6Sql+z96Oasdd+m/WxEw76DbD+XyfX2U0pzg4SjnjHk
	wGSDMfg+RQLu0e9iu8L0rWdLT5ybkaUwJyU8O+7wiQZtNhAMO2DIA0J/Kw4Y4H6rbVNn
	Y/UA==
X-Gm-Message-State: APjAAAU5Egu8B+aNKI2Mf3YXBS0MgWyz1gvbCWvNzhW+GNnG/Jot2MAO
	6+59yE6tCkKZPKQVTFs2V/bMe8PCMvY=
X-Google-Smtp-Source: APXvYqx09Z76G0h+FlTk4HmwF7IUEQiDLcAL/hornoW00rcN+rqb6IlH3stYtl7UMGmUt5ymkTkeKg==
X-Received: by 2002:aa7:d617:: with SMTP id c23mr88953067edr.54.1561449151401; 
	Tue, 25 Jun 2019 00:52:31 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id
	y22sm4308640edw.94.2019.06.25.00.52.30
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 25 Jun 2019 00:52:30 -0700 (PDT)
Sender: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
From: Ricardo Ribalda Delgado <ricardo@ribalda.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 25 Jun 2019 09:52:03 +0200
Message-Id: <20190625075223.13585-4-ricardo@ribalda.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190625075223.13585-1-ricardo@ribalda.com>
References: <20190625075223.13585-1-ricardo@ribalda.com>
MIME-Version: 1.0
Cc: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Subject: [meta-java][PATCH 03/23] openjd8: remove support for kerberos
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
X-List-Received-Date: Tue, 25 Jun 2019 07:52:31 -0000
Content-Transfer-Encoding: 8bit

It triggers a lot of dependencies, and it is no clear that
is needed.

Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
---
 recipes-core/openjdk/openjdk-8-cross.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-core/openjdk/openjdk-8-cross.inc b/recipes-core/openjdk/openjdk-8-cross.inc
index d04b0d3..a2bd23e 100644
--- a/recipes-core/openjdk/openjdk-8-cross.inc
+++ b/recipes-core/openjdk/openjdk-8-cross.inc
@@ -3,7 +3,7 @@ JRE_HOME = "${libdir_jvm}/openjre-8"
 
 DEPENDS = "\
     openjdk-8-native zip-native ant-native libxslt \
-    krb5 libffi fontconfig freetype \
+    libffi fontconfig freetype \
 "
 
 PRIVATE_LIBS = "\
-- 
2.20.1


