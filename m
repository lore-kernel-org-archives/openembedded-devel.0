Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEC2DC4332F
	for <webhook@archiver.kernel.org>; Wed,  2 Mar 2022 01:22:32 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.2771.1646184152547262214
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Mar 2022 17:22:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Fr4LaTAZ;
 spf=pass (domain: gmail.com, ip: 209.85.214.177,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id e13so247692plh.3
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Mar 2022 17:22:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XXkVsxSzKMV4HOvNZlaP1yVa2gL3N0o/g84yNUjXD3w=;
        b=Fr4LaTAZdta0Et5tz4S3MIxKfnruG45Wk1Bw/6tJd8KXypdw70hg3MhayoQYxJLKsd
         sF//J3cNY6cS+pf5vdvLQpXNkMGmsvv370wqZZPgfFJJFcv013dlcETChvUn7HqANtoL
         +l6ShwqLQvQpXVTT9S5KgH2e4jnezXI9LRn2pS3oLbn8Y9HzEK2VnDHpjN5bXXVadsyk
         EXdo3N5Zg8ezBczBrpfe0MiTK9SGhLJPKjb7jzhn6fIz5O8EYx+IMFADhV8AFnCdZf9U
         7Fx4aTkcdGOtL1xo/M6q2R91VaeN+QpM0WxP78VwpmDQe+9YCmdM1hx2G2y8JF28ng/j
         XYqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XXkVsxSzKMV4HOvNZlaP1yVa2gL3N0o/g84yNUjXD3w=;
        b=F7FYKDMToX8AW2WS5VdWPYaA11IGF9KtuIT9/4XaosqGiefloEUKgnPy/xI5wRJurv
         5JZoqNEXnaETetR7jFZtY+hvdQtPNXjiQjkMF885WOZsYnK2SITfW1FuExt3HZFtEuU4
         zY7ffUKecYBz+jkMzkSZKl9MofsLnYesbWl2j5eMzO6e0Wm/3iWV1KXIyhHu12r9sMCi
         HzLL/xQrxwS4U+Rt9/ECWt7XclOfI13uSz/OxfQLabPj8baedjDpT/9EjApGTdxWBxqO
         yGaN1ZQEo7jHaC6XP5UBRTrUCnBH64wiGwgXRKOFoq1AGYu7AHlkDFEcOCe3wJ83Meo7
         mD0g==
X-Gm-Message-State: AOAM5338je5QnSoZDjR9l3hi59ALUFxA6lt1jIz8sVJSDezklSo5lCjr
	+vTDqRFDCxtTD5MWCQCKgaLn5UT8K397aw==
X-Google-Smtp-Source: 
 ABdhPJxad2drZEHHtwmGUd0Pht4oZYTuXupcp9FNeexDxWukz2wj04H64C+eeVZonbxQJCY0boE0cg==
X-Received: by 2002:a17:902:d101:b0:14f:b339:de9c with SMTP id
 w1-20020a170902d10100b0014fb339de9cmr27954197plw.37.1646184151847;
        Tue, 01 Mar 2022 17:22:31 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::1a20])
        by smtp.gmail.com with ESMTPSA id
 h12-20020a056a00218c00b004c3a2450acasm19681487pfi.147.2022.03.01.17.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Mar 2022 17:22:31 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 3/4] python3-dateutil: Define PIP_INSTALL_PACKAGE
Date: Tue,  1 Mar 2022 17:22:27 -0800
Message-Id: <20220302012228.2337827-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220302012228.2337827-1-raj.khem@gmail.com>
References: <20220302012228.2337827-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Mar 2022 01:22:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95674

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-dateutil_2.8.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-dateutil_2.8.2.bb b/meta-python/recipes-devtools/python/python3-dateutil_2.8.2.bb
index cd0bdf6671..75221d8f9d 100644
--- a/meta-python/recipes-devtools/python/python3-dateutil_2.8.2.bb
+++ b/meta-python/recipes-devtools/python/python3-dateutil_2.8.2.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e3155c7bdc71f66e02678411d2abf996"
 SRC_URI[sha256sum] = "0123cacc1627ae19ddf3c27a5de5bd67ee4586fbdd6440d9748f8abb483d3e86"
 
 PYPI_PACKAGE = "python-dateutil"
+PIP_INSTALL_PACKAGE = "python_dateutil"
 inherit pypi setuptools3
 
 PACKAGES =+ "${PN}-zoneinfo"
-- 
2.35.1


