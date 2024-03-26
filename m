Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC458C54E58
	for <webhook@archiver.kernel.org>; Tue, 26 Mar 2024 01:50:54 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.9182.1711417853565939368
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Mar 2024 18:50:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XnZ8qaYE;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1e0411c0a52so36470325ad.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 25 Mar 2024 18:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711417853; x=1712022653; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OpLpfzdADJyhnM2+gcp2JJxQ+T3qCc1hVqeVdIrH4i4=;
        b=XnZ8qaYE4bw43/tCtwXnkmM68zhIxlX7IHLz5wMXoFH2HCT5iX+kGlil3xRXvcmbG+
         csMPEM/AHTVt0d8vPN+nJcbINUQ1wN1AQpx+6SnO1zCkFXyCO2asBZy55vYC46jhxOKf
         I967drxgaLnmUF+fDkOvZWzNW8aDmecB3DQWvfVFLgh+lnFaiudSHBlJEuqOUQYeg5Pe
         bslRPQg9LYJNijEqdKzO/Ubc4sstF9a3IOu5qfIEdz6jrG6ewzqcgcK2i/19rumF0l96
         kv5G3ePJjY5SSZt3JsvETj7A1amnKZRGPQHOLwqTYefKyxKNW0MTbsJu+uQ2Dvgsay2p
         ZDtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711417853; x=1712022653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OpLpfzdADJyhnM2+gcp2JJxQ+T3qCc1hVqeVdIrH4i4=;
        b=JIh+YU8mmApPSwcpKiscnkw1Pt2Bns5qWLRXONKfzigAvWSqpi+Sthapy7noV0EIW/
         zVnU6eqEzFDFidmfIftwpzLUDY6yPVn8RRywvIucABNEo48TwBLMAo9TEVqqJ8aFV+Fe
         pl1eExCxdLoyt+lA8bYpLV8WQm5cq/X8FcMeJFA8qQA1K3q1uK9ZQpAj3syzuF96kenS
         2MnVElOrP6+W+GaGLPF37r2oCJm2tvLogmVmKXhLSSXHmaqvULsI0liwJjfNxdk2QuxE
         ZX2Yg8QfgP/N2spsP+y6mnF1986DVTEWpp7nsS+dEQZhvOYA8xmcHHPIVW1xdoqxwTig
         qc3Q==
X-Gm-Message-State: AOJu0Yyb4QKYNXdEVYmMc550+o4J5jUeGMQGQRwBBnYik1y0NXQCkuMa
	MsC+dcJNNucMMFVUALkhmES91SwfKs1Nrtc4jOxuLRRp+az6sLBUmlBHsLp0
X-Google-Smtp-Source: AGHT+IHOyRef3DrlhER0rZzR8XufRTMMQ0rvYui2xlFMafZcD7TaqlE6QqsGkhqOgTUb1LYJ+Ab78A==
X-Received: by 2002:a17:903:298c:b0:1e0:8931:d372 with SMTP id lm12-20020a170903298c00b001e08931d372mr9967426plb.23.1711417852667;
        Mon, 25 Mar 2024 18:50:52 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::5eba])
        by smtp.gmail.com with ESMTPSA id n1-20020a170902e54100b001dcfc68e7desm5425070plf.75.2024.03.25.18.50.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 18:50:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 04/10] sdbus-c++,sdbus-c++-tools: Upgrade to 1.5.0 release
Date: Mon, 25 Mar 2024 18:50:39 -0700
Message-ID: <20240326015047.543274-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240326015047.543274-1-raj.khem@gmail.com>
References: <20240326015047.543274-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Mar 2024 01:50:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109612

v1.5.0
- Improve handling of exceptions from callback handlers
- Add support for async registration of matches
- Correctly add libsystemd dependency to pkgconfi
- Fix request name signal handling issue
- Add INSTALL_TESTS CMake option
- Minor UnixFd cleanups
- Additional little fixes and updates in code, build system, CI, and documentation

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../sdbus-c++/{sdbus-c++-1.4.0 => sdbus-c++-1.5.0}/run-ptest    | 0
 .../{sdbus-c++-tools_1.4.0.bb => sdbus-c++-tools_1.5.0.bb}      | 2 +-
 .../sdbus-c++/{sdbus-c++_1.4.0.bb => sdbus-c++_1.5.0.bb}        | 2 +-
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-core/sdbus-c++/{sdbus-c++-1.4.0 => sdbus-c++-1.5.0}/run-ptest (100%)
 rename meta-oe/recipes-core/sdbus-c++/{sdbus-c++-tools_1.4.0.bb => sdbus-c++-tools_1.5.0.bb} (88%)
 rename meta-oe/recipes-core/sdbus-c++/{sdbus-c++_1.4.0.bb => sdbus-c++_1.5.0.bb} (97%)

diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-1.4.0/run-ptest b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-1.5.0/run-ptest
similarity index 100%
rename from meta-oe/recipes-core/sdbus-c++/sdbus-c++-1.4.0/run-ptest
rename to meta-oe/recipes-core/sdbus-c++/sdbus-c++-1.5.0/run-ptest
diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools_1.4.0.bb b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools_1.5.0.bb
similarity index 88%
rename from meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools_1.4.0.bb
rename to meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools_1.5.0.bb
index 956b4b82f4..6b1af25280 100644
--- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools_1.4.0.bb
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools_1.5.0.bb
@@ -8,7 +8,7 @@ inherit cmake
 
 DEPENDS += "expat"
 
-SRCREV = "b482cd6d0890e3f9ae141b4aeb07d3724e48b3db"
+SRCREV = "30d9f1d46258c2be4ce29b7f7f168ecdf6d4f328"
 SRC_URI = "git://github.com/Kistler-Group/sdbus-cpp.git;protocol=https;branch=master;subpath=tools"
 
 S = "${WORKDIR}/tools"
diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++_1.4.0.bb b/meta-oe/recipes-core/sdbus-c++/sdbus-c++_1.5.0.bb
similarity index 97%
rename from meta-oe/recipes-core/sdbus-c++/sdbus-c++_1.4.0.bb
rename to meta-oe/recipes-core/sdbus-c++/sdbus-c++_1.5.0.bb
index ca91b351ed..f52ba141e1 100644
--- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++_1.4.0.bb
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++_1.5.0.bb
@@ -16,7 +16,7 @@ PACKAGECONFIG[with-tests] = "-DBUILD_TESTS=ON -DTESTS_INSTALL_PATH=${PTEST_PATH}
 
 DEPENDS += "expat"
 
-SRCREV = "b482cd6d0890e3f9ae141b4aeb07d3724e48b3db"
+SRCREV = "30d9f1d46258c2be4ce29b7f7f168ecdf6d4f328"
 
 SRC_URI = "git://github.com/Kistler-Group/sdbus-cpp.git;protocol=https;branch=master"
 SRC_URI += "file://run-ptest"
-- 
2.44.0


