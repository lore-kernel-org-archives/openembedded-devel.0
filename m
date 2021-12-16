Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C077C433F5
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 15:23:43 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web08.11883.1639668221873437432
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Dec 2021 07:23:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JR/0FTKd;
 spf=pass (domain: gmail.com, ip: 209.85.215.180,
 mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id 200so14505682pgg.3
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Dec 2021 07:23:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=aFkuZabvlEsDsIXTUfGfjtwDjnVdkeKYJ9ChXm/MXDo=;
        b=JR/0FTKdoqFybfbr8YvIv1OJJqzuC0TFpX0G+XH5h4J4WeLV1924VDX7df6woTFQkK
         nOXAJpz3CHsba0k0Hz77RUI7wKlOmsCgBGYjxHfARlMcfBgrq9ohHZnu4YHO/H2+hiBu
         coBRkZsb0wVDBMQbygi0o+tfmRCNZpyDtY2jMMU2osyZDz9TJAAYT52bWBoNZwDQ/hUV
         k6/Ci111A5GstBInCDn4EtWYY3gLO882MbA71xFLRH0jgI+hBhdW7QJKypycEarTkaRg
         lQY76nALR/579M7t7vt1nOyjDtTR8LDt/RVGL4ZJJ5zok04iJEhC8/pqjx52FC9U+hnA
         6aEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aFkuZabvlEsDsIXTUfGfjtwDjnVdkeKYJ9ChXm/MXDo=;
        b=rTMJ8xTuZKQ+Ijpexan9qLj92CwyUZnHeRvLV6QxWUN7T8R34/zwRTjegV3mCmDs6A
         SLgFnAlCt8B48pZPZjz/tiWkutlGRhfsPYxlyPed+wPErqcDn5RGy3hsNUEVdarQMgxq
         N94mlaF41a/kcFbDu1xZ9dEowqOl8p2c1gvsRIGuC9Y32E2qV2ksnhkyA8YcUiNVv9ui
         awblEZBIxRFrcMUJw2ScNFUvnrKlDSD5PPq1UIQzYZmlC8lT0wNVZJGo6ImMosfwW24k
         q62nB6ydsLjQdpUb/2iDx8FaH93gA2XqXXMcGid84jFoVNHU8zSsxg65lugkL7bC6Wlh
         YlaQ==
X-Gm-Message-State: AOAM531Ic7xQ6HrHXXXDwIy0sFBbMRi3mn2O4iqpi6NWDeKZ4y5QVy8K
	Lx/HkZNOoU98A5+arL17v6yKnQf28lg=
X-Google-Smtp-Source: 
 ABdhPJxUFuSXp6dYyPdaQzDje3SNFo4FuCp3joQrLmZ1Fmmr0LCHzBh2/TOYtN2iHve1HXZqeXTp6g==
X-Received: by 2002:a63:1422:: with SMTP id
 u34mr12580628pgl.135.1639668221243;
        Thu, 16 Dec 2021 07:23:41 -0800 (PST)
Received: from keaua.hsd1.ca.comcast.net
 ([2601:202:4180:a5c0:7d7:ca51:b150:8ee7])
        by smtp.gmail.com with ESMTPSA id
 k15sm6795703pff.215.2021.12.16.07.23.40
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 07:23:40 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [honister 17/18] python3-pyzmq: set precise BSD license
Date: Thu, 16 Dec 2021 07:23:22 -0800
Message-Id: 
 <1a8108873029a3787dbcc42bcad3c7ada11eaa52.1639668121.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1639668121.git.akuster808@gmail.com>
References: <cover.1639668121.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Dec 2021 15:23:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94402

From: Ross Burton <ross@burtonini.com>

"BSD" is ambiguous, use the precise license BSD-3-Clause.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
(cherry picked from commit 57647ea0d6b87a02bf812192ae39f2d81644b744)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-python/recipes-devtools/python/python3-pyzmq_22.3.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pyzmq_22.3.0.bb b/meta-python/recipes-devtools/python/python3-pyzmq_22.3.0.bb
index 3c91eee16f..87605c2b3e 100644
--- a/meta-python/recipes-devtools/python/python3-pyzmq_22.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyzmq_22.3.0.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Pyzmq provides Zero message queue access for the Python language"
 HOMEPAGE = "http://zeromq.org/bindings:python"
-LICENSE = "BSD & LGPL-3.0"
+LICENSE = "BSD-3-Clause & LGPL-3.0"
 LIC_FILES_CHKSUM = "file://COPYING.BSD;md5=11c65680f637c3df7f58bbc8d133e96e \
                     file://COPYING.LESSER;md5=12c592fa0bcfff3fb0977b066e9cb69e"
 DEPENDS = "zeromq"
-- 
2.25.1


