Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE63CC3DA4A
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 09:16:15 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web10.64019.1722503771309298745
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Aug 2024 02:16:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KcRRR6K1;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a7a8a4f21aeso889683866b.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 01 Aug 2024 02:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722503769; x=1723108569; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iu6p9UGqn4V9/H06aSVq9Roke3n9gTU/07fQ2DW6tkM=;
        b=KcRRR6K1WCXcA/SI4Thesx5m0DGBAKszhhWhqVUnL7XISB4a0VALyt4Rp8yhIjPqIc
         CBwrJldl99RWAM/rDGRsLLoojeT5dXdAODQsc0t0aCbGnN4rG2Kmq315EVnsYC07WogZ
         em8z/ak/ioed68F02J/Y3ML+D3rZfsZ9YB7y5O6t+RZb7ktOt+gPzVo+MlNaNyx9OK3v
         9FqLd8gBdVhyaYjKnSQdj5vyQsewJfAjQsf+vBmJ6LHQCS6jyBcNCfKcl3ZOfUvng3T7
         HWP3Cewmuu22dqC+w/ljy7jEgnW/K2bJPvLoIdG/vIIAxBoBKJZNuLDRyfU0w0Ygfqnu
         LdPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722503769; x=1723108569;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iu6p9UGqn4V9/H06aSVq9Roke3n9gTU/07fQ2DW6tkM=;
        b=iH//8uo40xRez87x+zsqVhpBm1hCu8SvGZWfvyK3cFclu/367v0Kt2Zq+ddhATscP/
         vGvZthjrjJrAOCqMSPTk19BvRwo+JekT9GfZPxxiTUAKV9bCtSQuLqfvmcHsum5qWEh0
         dwlMU2e+vsBjk0uMVTJwlpnwIz23YGG0iduQNcLA8HOY+ibu0EbD5ZDM/mwjOXmfZ9zX
         4dXNU1KPxFRXzwnDvgVhI77F6IWdfiTsSlMctz+A2mmeVduknoVpqcxHAsE/lXudwCTv
         OFuw4E2nSzW+kEVzPDWTieYQd+YKs9jJcnrWffoqEuIvi3b3nw7sk9SiQzvkAlWe7AH6
         ofEw==
X-Gm-Message-State: AOJu0YzmecE38Xht9NtgduXhteKdlTzCu5Trwb7uKT5LO2vD+Or12ZGj
	aQm5OeM/JvSxvZRQottljOE1kmZu4q0fR3Qs14OiKvF8do+8gg8zkFWMFxJK
X-Google-Smtp-Source: AGHT+IE4+l+pag1/hroMvqSgBVvoMTsB/V8TroJnelEvVmCoGIs5IO2P55V9tyOkiKwwyMZUg8DI5w==
X-Received: by 2002:a17:907:60ce:b0:a71:40d4:b1d7 with SMTP id a640c23a62f3a-a7daf667cdcmr142795966b.56.1722503768782;
        Thu, 01 Aug 2024 02:16:08 -0700 (PDT)
Received: from localhost.localdomain ([176.33.65.192])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acab52c95sm869701066b.76.2024.08.01.02.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 02:16:08 -0700 (PDT)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH] etcd-cpp-apiv3: Fix contains reference to TMPDIR [buildpaths] warning
Date: Thu,  1 Aug 2024 12:16:02 +0300
Message-Id: <20240801091602.56943-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Aug 2024 09:16:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111491

WARNING: etcd-cpp-apiv3-0.15.4-r0 do_package_qa: QA Issue: File /usr/lib/cmake/etcd-cpp-api/etcd-targets.cmake in package etcd-cpp-apiv3-dev contains reference to TMPDIR [buildpaths]

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 meta-oe/recipes-extended/etcd/etcd-cpp-apiv3_0.15.4.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-extended/etcd/etcd-cpp-apiv3_0.15.4.bb b/meta-oe/recipes-extended/etcd/etcd-cpp-apiv3_0.15.4.bb
index 88a8ba346..7b7e3bc7a 100644
--- a/meta-oe/recipes-extended/etcd/etcd-cpp-apiv3_0.15.4.bb
+++ b/meta-oe/recipes-extended/etcd/etcd-cpp-apiv3_0.15.4.bb
@@ -19,5 +19,9 @@ S = "${WORKDIR}/git"
 
 EXTRA_OECONF += "-DCPPREST_EXCLUDE_WEBSOCKETS=ON"
 
+do_install:append() {
+	sed -i -e 's#${RECIPE_SYSROOT}##g' ${D}${libdir}/cmake/etcd-cpp-api/etcd-targets.cmake
+}
+
 SOLIBS = ".so"
 FILES_SOLIBSDEV = ""
-- 
2.25.1


