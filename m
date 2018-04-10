Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id EB381746B3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Apr 2018 00:22:45 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id c7-v6so2973993plr.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Apr 2018 17:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=jmFRy/c5L49FqxUflGJxxMviKN1OGfC7Ng1hQewbFJM=;
	b=UgdFdaA9yPQa3aaPP5bMZfs3H+AgW/ilhF9zRKGOL+9QrbWPyx2rYOGxXewIYR0hab
	6XXFJMYIzfqiaUTOrYRW6/g7uMvt/CaIlvUtwpVhRH2wQrU1V3j3gOjUvzy2A8VFwiqh
	fVFsZoP9U3lsjlseRjPrRRqzyDyBwvoA13ZC0uOCKOepin4W84A6UR1Z6SpknkBeBL+a
	Vu4wFPkCxfPpdCgkd3VcZ8uTQg8xohCdvVUDIADdsOOn8jANSc7dp+9EpeTgKVYHY1AC
	teS0JGrLcShIfT8+Yd91e2eb5ibkFsVwhBAG/DTfqprZpyQtq4bcwNoBEfLFK+jMQ0C8
	n44Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=jmFRy/c5L49FqxUflGJxxMviKN1OGfC7Ng1hQewbFJM=;
	b=L3f9JbAbH8ofb63EYwAb+uDErXGq7cRjWGKOnYiCryavkijmgnEZtMzqHdq7oFUKow
	gRGIaoF26+vOXBFGtJyLfBPR+Ai4jzQcXo+cJuT9LRDlfmBs8aXnWssLsoAyP7PJgvNN
	FGbyWoutzUafkgIyHPw5m1UMxB9q2V+GhcGRqVg4FX5ott/+RxDsQczG2w0n/JDCgZuh
	+/aCnOsY0oKklN3jhyiBruSTy72ebHU1QwB3acDWE92P3M9nJuSAhTProvsvr0oYZ49Z
	R6xMyUa6h6uJvL9MKTHLvCMOBY0c2v3Bt8Pre8soQgEBnHAULyRptSEricXGdBr9PTTP
	iTWg==
X-Gm-Message-State: AElRT7Erl0LVMMSK0xIOY40hR2vXEzPkHQvRxv5vWJBb7xKQ6ZNuuCvp
	NmdHXNzcRbqc4JdGs7mr8xbFVg==
X-Google-Smtp-Source: AIpwx4/0Mk2t7GnPR46S3ipDTUcBUQ/CDi04cX4SZVYXr14RbSV0ygEzcj3tnPEXyzxPle53h0QNIQ==
X-Received: by 2002:a17:902:aa0b:: with SMTP id
	be11-v6mr30896310plb.36.1523319767251; 
	Mon, 09 Apr 2018 17:22:47 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:6097:a43d:5d02:3a1c])
	by smtp.gmail.com with ESMTPSA id
	a5sm2562046pfl.159.2018.04.09.17.22.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 09 Apr 2018 17:22:46 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	akuster808@gmail.com
Date: Mon,  9 Apr 2018 17:22:35 -0700
Message-Id: <1523319756-8431-9-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1523319756-8431-1-git-send-email-akuster808@gmail.com>
References: <1523319756-8431-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 09/10] python-blivet: only include when x11 in DISTRO_FEATURES
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
X-List-Received-Date: Tue, 10 Apr 2018 00:22:46 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-python/recipes-extended/python-blivet/python3-blivetgui_2.1.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.1.5.bb b/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.1.5.bb
index ac507ca..28c2565 100644
--- a/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.1.5.bb
+++ b/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.1.5.bb
@@ -13,7 +13,7 @@ SRC_URI = "git://github.com/rhinstaller/blivet-gui;branch=master \
 "
 
 inherit distro_features_check
-REQUIRED_DISTRO_FEATURES = "systemd"
+REQUIRED_DISTRO_FEATURES = "x11 systemd"
 
 inherit setuptools3 python3native
 
-- 
2.7.4


