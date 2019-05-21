Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
	[209.85.215.173])
	by mail.openembedded.org (Postfix) with ESMTP id 19A7A7E140
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2019 03:56:58 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id 145so7828178pgg.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 May 2019 20:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=bQUltUVRBTzUMAbSXauubf7TklMLQdwmdvUaHAypTGc=;
	b=q6MOzTtHcbAXUrxEenYSsBg2TL7qXxVwJ6zYCGzPLjMdx/m5AzSkxQNHWY4ii3G5Bn
	6F1rSslHCwsX6fRceclWHfPsjOwSXk507osMw5+7JaDG2Z0yIIKZSYF5t7wJ1AfbbhRa
	Fgl/XsB49XbHxTlTyg/4RigjoGBZof+WX7056h/x8j66Zf1Pyntaz+Kf29ffSA02C6Yc
	tHmfFBpP/b0m+tozD6rChkbcitgvJPC+UT3uGNeJafqBQr5MgZ7uM+x7HJLp29IIGj+4
	6KhVUE8oGlqC5SHaOp5I3lrlsm9hRy3lW0OyaKeavI2DdmVjCXhOOEzQpOlMxffmbcui
	CXCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=bQUltUVRBTzUMAbSXauubf7TklMLQdwmdvUaHAypTGc=;
	b=Su2z7sThtbZFl5wXVS362qDcpxa32rz5b+0kQybhYWuab69sjIJ6xjU3ws3QEWsvpC
	gxwD0W7E2wP4x1TMagB4TSXbO48TqVqeMS9s5e94uE5FheuQutR5+ynj4MlifnWXGhZD
	ziy4PMompPOaTyaR3zPqLc/xG+qy5GixPQ1hWjV0omtdNMa1s/tYEfhApQfRFtZtC/e+
	02V3eIcM88uJ39k+vjJBRFPvk5eRLMHxfi6e2hT27n9q2uAYYS2iyFew5Rp9F+63juc1
	x8H6pSpEtCoh0xkrU6t/WfsoabUu2lNafSFQql17+VVZfva9lFhHtE0IJDXqYgYREoJh
	FVaA==
X-Gm-Message-State: APjAAAX++vBvppNshe3AlTg5OkchzftI2laFnj3OYj6ztO3Effp7uPtf
	R9gf8+H7LTilqZiMKQhY2huwLHFZ
X-Google-Smtp-Source: APXvYqw7Q1zYR1oEFka9wXu9jBG4656AiBl9Q5B4fnEh42Yn6AHfiZmH4JxQd5FBBVKrLB7vrDppYQ==
X-Received: by 2002:a63:d150:: with SMTP id c16mr79215255pgj.439.1558411020134;
	Mon, 20 May 2019 20:57:00 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:199d:e2fe:5a4f:97f4])
	by smtp.gmail.com with ESMTPSA id
	h13sm23045273pfo.98.2019.05.20.20.56.59
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 20 May 2019 20:56:59 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 May 2019 20:56:27 -0700
Message-Id: <b5bf8f43fcf6e6baaddec14b2cd8489765805148.1558410874.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1558410874.git.akuster808@gmail.com>
References: <cover.1558410874.git.akuster808@gmail.com>
Subject: [warrior][patch 27/34] ipsec-tools: fix CVE tag in patch
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
X-List-Received-Date: Tue, 21 May 2019 03:56:59 -0000

From: "Qi.Chen@windriver.com" <Qi.Chen@windriver.com>

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-support/ipsec-tools/ipsec-tools/fix-CVE-2016-10396.patch    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/ipsec-tools/ipsec-tools/fix-CVE-2016-10396.patch b/meta-networking/recipes-support/ipsec-tools/ipsec-tools/fix-CVE-2016-10396.patch
index 19220c4..fec4804 100644
--- a/meta-networking/recipes-support/ipsec-tools/ipsec-tools/fix-CVE-2016-10396.patch
+++ b/meta-networking/recipes-support/ipsec-tools/ipsec-tools/fix-CVE-2016-10396.patch
@@ -1,6 +1,6 @@
 Upstream-Status: Backport [https://anonscm.debian.org/cgit/pkg-ipsec-tools/pkg-ipsec-tools.git/plain/debian/patches/CVE-2016-10396.patch?id=62ac12648a4eb7c5ba5dba0f81998d1acf310d8b]
 
-CVE: CVE-2016-10396.
+CVE: CVE-2016-10396
 
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
 ---
-- 
2.7.4


