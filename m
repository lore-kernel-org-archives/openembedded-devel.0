Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
	[209.85.210.175])
	by mail.openembedded.org (Postfix) with ESMTP id C0C647FDF8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2020 00:59:44 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id i6so2424908pfc.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jan 2020 16:59:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=A5mUfCtJmuj0MiPRQL5TgqDXfY2MHHQ//LQ1OURbZkc=;
	b=Yi0rEaJnoVpatyzOlO8yYXr6AD17L54Wf80c+RnMBqGztczhfxCFB31v5mYY0iW34G
	AUhn3ZwT6ZbgYDcfOo6vBWLEhinN1/Y3eJOaEfW8djYbkY/wuexy3pySNH+m0F/kO5sU
	bWgSN7IiUfhJlqK4U9Ivep/750l+txB0Yvb9xx+F3O/8JLJTTYs48fDxDp/KkWK2oqsL
	xgEVan53/YdUPLUdVg1zBvtgad4hFk8Xe0XJjGAF58ia0o/oTc/NC3BOH00l5R2bjT7m
	x/tUcTbVnohBRKWlFRNyUKx5Gm9x9YQ0qY0s5gJS+a+9ya7L4WjdTfZ2XLIlgk7C8BGe
	tDQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=A5mUfCtJmuj0MiPRQL5TgqDXfY2MHHQ//LQ1OURbZkc=;
	b=Z1TtQKbiIR2tx+dkgtfUgXVUoFPZXvZVpb0++04JAOFzhU2+IngIBNkmLmobBgWZ6a
	NscATnn95r1wSVrQ23kzxoIj8TFwsksK1eTv/X3fCYhda+OsA0tY+/ZWtoljZFv1SaU4
	r9pdSO7jEJZ2+AP3jkp9j53zUE3htYcm5lR5N43DjAvyHlE3Ieap4zdgHWxVz0/s/g5Z
	163Fp24Q01VbHWgbN7hjTuV2kgnp3b5iruinpHBIHPAQk4tvFeFk5WuXaiW1XwvnfObo
	GCN9zwKKr9qhO++EWmLE2wTi6+bPhw+vckRETsxugktFGyAzysUYhxaQnmMZkhZWBMxL
	Mzyg==
X-Gm-Message-State: APjAAAWgVB96bBBl9x5AVcqAG61SckDTb9hYQcgDfDb94nMf6asUtkvG
	wOd2ZrYc/6QAZ74XAaf8ibDbYFIDmIo=
X-Google-Smtp-Source: APXvYqwg4dgNpX6VUXyA5qgGzd8AOHhGFGl4oJnkd/AWFvioKyLurQOz8ciwwFLk7WZYaiq+7Cdv+g==
X-Received: by 2002:a63:ce55:: with SMTP id r21mr8167844pgi.156.1579654785546; 
	Tue, 21 Jan 2020 16:59:45 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::cab1])
	by smtp.gmail.com with ESMTPSA id
	z26sm46107269pfa.90.2020.01.21.16.59.44
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 21 Jan 2020 16:59:44 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Jan 2020 16:59:38 -0800
Message-Id: <20200122005941.3706171-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200122005941.3706171-1-raj.khem@gmail.com>
References: <20200122005941.3706171-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-python][PATCH 4/7] python3-txws: Fix deps to py3 modules
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
X-List-Received-Date: Wed, 22 Jan 2020 00:59:44 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-connectivity/python-txws/python3-txws_0.9.1.bb      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-connectivity/python-txws/python3-txws_0.9.1.bb b/meta-python/recipes-connectivity/python-txws/python3-txws_0.9.1.bb
index 6d1327ac42..e235682cf4 100644
--- a/meta-python/recipes-connectivity/python-txws/python3-txws_0.9.1.bb
+++ b/meta-python/recipes-connectivity/python-txws/python3-txws_0.9.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/MostAwesomeDude/txWS"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=76699830db7fa9e897f6a1ad05f98ec8"
 
-DEPENDS = "python-twisted python-six python-vcversioner python-six-native python-vcversioner-native"
+DEPENDS = "python3-twisted python3-six python3-vcversioner python3-six-native python3-vcversioner-native"
 
 SRC_URI = "git://github.com/MostAwesomeDude/txWS.git"
 SRCREV= "88cf6d9b9b685ffa1720644bd53c742afb10a414"
-- 
2.25.0


