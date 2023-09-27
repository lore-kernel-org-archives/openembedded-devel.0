Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81FCFE80A82
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 04:42:45 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web11.10808.1695789756364371687
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Sep 2023 21:42:36 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.222.181, mailfrom: straka.derek@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7740aa4b545so652361385a.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 26 Sep 2023 21:42:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695789755; x=1696394555;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jxTh4StcD27G5T6a0C9+yNsSDh4wWxd9MkP7QK2P1Ng=;
        b=uI3KFiIzZC2Mw9yiatH76g1f1utYu7krBsCkDGEAI+KW/ppGQUeQ34EZkMYWBmLTP8
         bgtGXsl/VmFRwz1cLpvAvt/fH9MwC4wj+yacye84Cck6WhhPSQP+uPVoQzx4CdvFJ75a
         xjznESLrkpdeDr1wwkQyNxC2QC6wsKjU+HZ69dPqjI0AbOGqmgnGi7TTF2Fde4ZYxdnF
         Z9SstV5UGsRzDPiil+lociz6XtC8ZbxTQX5PvxUlqSJHA2UMWtrYyFWgkunTMnhsuj57
         PL/HdMpFY3MJ+cLdog7hTP9xCYHDHcYTUzFRn2GrLwm04Oksm23mHScKUf8z3qT8OJUn
         d3ow==
X-Gm-Message-State: AOJu0YwX/dX+WQZ4LLf98LPCgkiNZvlOjc/KVEvRPbKnRvlFM+nZPBlk
	6tu0ln727nh3LTRrb6+nlvZfthMm+mSFjg==
X-Google-Smtp-Source: AGHT+IEy0ZwbpMgzcisbLDm1UiYlcK/tD6wjpnyfCag3uOenJpEj8DwrxYiePLdvqQz8LIGMbx0o+w==
X-Received: by 2002:a05:620a:2590:b0:767:1d7e:ec40 with SMTP id x16-20020a05620a259000b007671d7eec40mr909446qko.1.1695789755031;
        Tue, 26 Sep 2023 21:42:35 -0700 (PDT)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id u25-20020ae9c019000000b0076f18be9a64sm2615578qkk.81.2023.09.26.21.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 21:42:34 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-traitlets: update version 5.9.0 -> 5.10.1
Date: Wed, 27 Sep 2023 04:42:26 +0000
Message-Id: <20230927044226.1680981-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Sep 2023 04:42:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105160

Update license file location, verify BSD license still applies, and update checksum

Signed-off-by: Derek Straka <derek@asterius.io>
---
 ...python3-traitlets_5.9.0.bb => python3-traitlets_5.10.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-traitlets_5.9.0.bb => python3-traitlets_5.10.1.bb} (57%)

diff --git a/meta-python/recipes-devtools/python/python3-traitlets_5.9.0.bb b/meta-python/recipes-devtools/python/python3-traitlets_5.10.1.bb
similarity index 57%
rename from meta-python/recipes-devtools/python/python3-traitlets_5.9.0.bb
rename to meta-python/recipes-devtools/python/python3-traitlets_5.10.1.bb
index fc2527144..7df1d66cc 100644
--- a/meta-python/recipes-devtools/python/python3-traitlets_5.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-traitlets_5.10.1.bb
@@ -1,9 +1,9 @@
 SUMMARY = "Traitlets Python config system"
 HOMEPAGE = "http://ipython.org"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://COPYING.md;md5=f17a3ba4cd59794dd6e005c8e150aef0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=13bed0ee6f46a6f6dbf1f9f9572f250a"
 
-SRC_URI[sha256sum] = "f6cde21a9c68cf756af02035f72d5a723bf607e862e7be33ece505abf4a3bad9"
+SRC_URI[sha256sum] = "db9c4aa58139c3ba850101913915c042bdba86f7c8a0dda1c6f7f92c5da8e542"
 
 inherit pypi python_hatchling
 
-- 
2.34.1


