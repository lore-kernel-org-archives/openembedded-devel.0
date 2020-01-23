Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail.openembedded.org (Postfix) with ESMTP id CA9427FDCA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jan 2020 16:44:13 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id q10so3823866wrm.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jan 2020 08:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=xsXJSzUeVqlg5sUjULSSdGenZbejTgDs59wrODiw0kU=;
	b=GhjX+FsMvqPEIy0hQk3DO1KFciDYyrcRPubBwPXCZMyp5yP6E49McX/D0USUvrY5z7
	EEW7bZzV47Dl7MeK1R5lZ1d9lwRrVF4g2tMjTcATlF4Nl2Y0iKMr8falBAGVr4AZjgtG
	Oml2k4lMiKqEDq/GIkNgV+SWzxU/Aiksu3NtqZMWH1N92aMzwjADqIJkPvEUldUnfCVn
	eZVKpA0t6ATIcTaPZpjy4IhIdXwGuEqBkH20sG2Q4YGO5ljMJJS0YM7mmAFFnX0P14Ca
	/jWhmcwxgAud2NpXUzlbIyz7rWbZ/1IQKLlDddqyQoVWWSq3i/oEPCQmmhqYua8w48Js
	aVtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=xsXJSzUeVqlg5sUjULSSdGenZbejTgDs59wrODiw0kU=;
	b=qU3a6W8oGc+szr++IgNQ2AZ4Jkiy2QpZ9ECYNcU0olycmWJV6u+tKjzDqmwCu5ur2d
	AoGdWUa7P+YgUoJotzqZ5yHV+BL89zPVF/kai/gNnZ8qNlqf4KnDzQgUoTb93KcJWu4b
	AzCvnxCmPghtaCk4vW0ZhhPj5rKF6TQKQFRs54RPO7Yg8dRYH2izxEyAZM/zW41heEVQ
	oMFZkQUfs9CPAPNMuIbOdLkH4TxL2ojlYhOYB9wO7yQe94JgVp0YXLiVWM+Lbjnp69Mw
	2IGQhh1xHr3utzujlAI9yQxo6ss0PXfbH2wVD9Y+AxRfdBLtLF6eJtkMrCBVUFzxcjbd
	b4ww==
X-Gm-Message-State: APjAAAVO5llYWV+9prPt3wkqPA90ZsZPIC/IzZDPswmMeGuhj4eo+Hmk
	et/wgBY2rVjeAw+jl/WF+ssXKiCB
X-Google-Smtp-Source: APXvYqyrQsxwOB53cn73hY+qcMrBkPJyPo92kX964W9ARE7dKfXmOPqVc2R5gyp2o0aiV9g2FmOOQA==
X-Received: by 2002:a5d:5091:: with SMTP id a17mr18260912wrt.362.1579797854224;
	Thu, 23 Jan 2020 08:44:14 -0800 (PST)
Received: from localhost ([109.238.218.228]) by smtp.gmail.com with ESMTPSA id
	l15sm3451450wrv.39.2020.01.23.08.44.13
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 23 Jan 2020 08:44:13 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Jan 2020 17:44:07 +0100
Message-Id: <20200123164407.5600-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200123164407.5600-1-Martin.Jansa@gmail.com>
References: <20200123164407.5600-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/2] nodejs: upgrade to 12.14.1
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
X-List-Received-Date: Thu, 23 Jan 2020 16:44:14 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../nodejs/{nodejs_12.14.0.bb => nodejs_12.14.1.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_12.14.0.bb => nodejs_12.14.1.bb} (97%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_12.14.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_12.14.1.bb
similarity index 97%
rename from meta-oe/recipes-devtools/nodejs/nodejs_12.14.0.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_12.14.1.bb
index e4a2aa18c4..e9ec500e51 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_12.14.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_12.14.1.bb
@@ -24,8 +24,8 @@ SRC_URI_append_class-target = " \
            file://0002-Using-native-binaries.patch \
            "
 
-SRC_URI[md5sum] = "6762f5629f6f68fb9bdf83a741cba038"
-SRC_URI[sha256sum] = "088a217ba2af641b8cc15be29f6e2956b8a33e6badb85596bbc2cdea9df9be71"
+SRC_URI[md5sum] = "1c78a75f5c95321f533ecccca695e814"
+SRC_URI[sha256sum] = "877b4b842318b0e09bc754faf7343f2f097f0fc4f88ab9ae57cf9944e88e7adb"
 
 S = "${WORKDIR}/node-v${PV}"
 
-- 
2.20.1


