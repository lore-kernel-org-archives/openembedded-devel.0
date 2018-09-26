Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 86CF67553F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Sep 2018 12:18:27 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id y13-v6so2088690wmi.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Sep 2018 05:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=gfStnJY23EGzo/1bcR/Se6q1hSJqt6moZTklFzwxQlk=;
	b=JnyLNxQETwcIUwTWB+0XsPs6eSWIA4N0Yp+ZurpML48F09n5ekThPnIiisYaHVSR4h
	ColWo1c8myOOnl7ggmCepXsJGb3MToXey+0CzWzHu3/AIEB6zGKy/yi4TgU7/vtYLTol
	EYWqdSnmcwOgAYSuJaG/4DBbmTt633QfbXfY0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=gfStnJY23EGzo/1bcR/Se6q1hSJqt6moZTklFzwxQlk=;
	b=EAoe+HzOV0Tv9hYkllsayZQWLs/dDd+8olaHOnAGe0n+uCqDF3bYmi6mMcxImevKS2
	bMMnBTFiBLogxFJgXKmSqOAIt6ZLreu7TxqeKfqekdtEpNOB9oudVZTgDm+O9is4P4bW
	gFbLx8hK415ziG0uJ4+O6bi79hKSn2icO9F6MKad/wEE39JNSN1exoryAnOp59zyhgBS
	tn9C4wvNRl+MINTf0sqrukVkdEWSHTab69zChenf/uZcyRtnfM34y3GSoop0yZq+VSIS
	SX5ke8edQxSaKb3nI9Kj3BLsJLafSYp0Py4KMWMIRBVqCQgFqocTbnTAqa6rDv6+SLOc
	e4gQ==
X-Gm-Message-State: ABuFfogvfQaZbAsYm99MeoB/qZvRH7rYPQfMkBy814rbLSP/wL6SPBJ8
	otKYdae7BhkcZuDQs0ZHeixPfPev0dg=
X-Google-Smtp-Source: ACcGV63BRXKTtxXf3C0uViGNdt5U4XvKnT8R93+6MT+cAVc+p95e67kdCX3uXRonr9QRn+L2o+nAWQ==
X-Received: by 2002:a1c:780c:: with SMTP id
	t12-v6mr4202635wmc.133.1537964308084; 
	Wed, 26 Sep 2018 05:18:28 -0700 (PDT)
Received: from localhost.localdomain ([92.154.90.120])
	by smtp.gmail.com with ESMTPSA id
	z12-v6sm4247960wmf.23.2018.09.26.05.18.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Sep 2018 05:18:26 -0700 (PDT)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Wed, 26 Sep 2018 14:18:05 +0200
Message-Id: <20180926121806.30667-3-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <20180926121806.30667-1-nicolas.dechesne@linaro.org>
References: <20180926121806.30667-1-nicolas.dechesne@linaro.org>
MIME-Version: 1.0
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [meta-oe][sumo][PATCH 2/2] grpc: move it from oe to networking layer
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
X-List-Received-Date: Wed, 26 Sep 2018 12:18:27 -0000
Content-Transfer-Encoding: 8bit

From: Armin Kuster <akuster808@gmail.com>

grpc has dependancy on meta-networking packages.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
(cherry picked from commit 251878e8b6b993b159c949f7e4860faf085e17f5)
Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 ...001-CMakeLists.txt-Fix-grpc_cpp_plugin-path-during-cross.patch | 0
 ...0001-CMakeLists.txt-Fix-libraries-installation-for-Linux.patch | 0
 .../0004-CMakeLists.txt-Find-c-ares-in-target-sysroot-alone.patch | 0
 {meta-oe => meta-networking}/recipes-devtools/grpc/grpc_1.8.5.bb  | 0
 4 files changed, 0 insertions(+), 0 deletions(-)
 rename {meta-oe => meta-networking}/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-grpc_cpp_plugin-path-during-cross.patch (100%)
 rename {meta-oe => meta-networking}/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-libraries-installation-for-Linux.patch (100%)
 rename {meta-oe => meta-networking}/recipes-devtools/grpc/grpc/0004-CMakeLists.txt-Find-c-ares-in-target-sysroot-alone.patch (100%)
 rename {meta-oe => meta-networking}/recipes-devtools/grpc/grpc_1.8.5.bb (100%)

diff --git a/meta-oe/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-grpc_cpp_plugin-path-during-cross.patch b/meta-networking/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-grpc_cpp_plugin-path-during-cross.patch
similarity index 100%
rename from meta-oe/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-grpc_cpp_plugin-path-during-cross.patch
rename to meta-networking/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-grpc_cpp_plugin-path-during-cross.patch
diff --git a/meta-oe/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-libraries-installation-for-Linux.patch b/meta-networking/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-libraries-installation-for-Linux.patch
similarity index 100%
rename from meta-oe/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-libraries-installation-for-Linux.patch
rename to meta-networking/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-libraries-installation-for-Linux.patch
diff --git a/meta-oe/recipes-devtools/grpc/grpc/0004-CMakeLists.txt-Find-c-ares-in-target-sysroot-alone.patch b/meta-networking/recipes-devtools/grpc/grpc/0004-CMakeLists.txt-Find-c-ares-in-target-sysroot-alone.patch
similarity index 100%
rename from meta-oe/recipes-devtools/grpc/grpc/0004-CMakeLists.txt-Find-c-ares-in-target-sysroot-alone.patch
rename to meta-networking/recipes-devtools/grpc/grpc/0004-CMakeLists.txt-Find-c-ares-in-target-sysroot-alone.patch
diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.8.5.bb b/meta-networking/recipes-devtools/grpc/grpc_1.8.5.bb
similarity index 100%
rename from meta-oe/recipes-devtools/grpc/grpc_1.8.5.bb
rename to meta-networking/recipes-devtools/grpc/grpc_1.8.5.bb
-- 
2.18.0


