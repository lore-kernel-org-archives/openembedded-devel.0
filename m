Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53494C77B73
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 06:20:08 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.121804.1683008398139241523
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 May 2023 23:19:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=gae0Jlbx;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-63b51fd2972so2402632b3a.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 May 2023 23:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683008397; x=1685600397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=33QkZ71tAWk09A6/tAHDgEF40l7A5hahyU6xbXWOU+w=;
        b=gae0JlbxiljzHfpWXPzDm8EwJCoPZEw7DfgNsMM914Nzp98wR1i5XZnSKC/W6qr0J3
         Xo0Yd89vAZ5FMKTsQuC9ARi/MymXnRlLQkC2roNzxuILXk8UyZQ7zafMHnw2oa8U3s9F
         o/22Hrw9iFihZovmrLeRJlFCCs7q3BmXnGXBeJzRqBVDNUUccgjFayPIjg6/mxkGJJA0
         sVdkUwUU6/5vRUixe9YUG4/4nzt7IXPeQMcmfrorYXaeNOBXQUFGLJrViBN7PyjLPoc0
         Pj/ps2bc/FpJIH6DhuMDKSGHEZWfOQEgTa4QqgVhWUUXcSDIVLC9V0t7MBoe/JKZSUT7
         aqzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683008397; x=1685600397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=33QkZ71tAWk09A6/tAHDgEF40l7A5hahyU6xbXWOU+w=;
        b=G6iEq8a3ZJuetRl+4Q1w9jHjgF+Kzk5DsgD8fOFM8S5YDV1/BZhecmKQq2ZEPtSSLv
         m9cg0rq43f7ZgOaAnkzTUqIUgmx6RneEsI4bTUvdUBnhX1MaLXtyGqddAbp5mBZwzyw2
         D8sjBxagbrzgpSzS1pM3DlFFYBhVsV14f6rgv+J9eH3ymMKj6O5azC30bi+ib1rw1jzl
         FG5WXk8daQJyn0suWDHqAS2Qgybwcvuyfk/usLhRIBDOG3I4f4y1LPZZ8TB9E0/0XSQy
         DpEZJs90QF8LWzD9FlC3FRpBpuqRQ32dnAvIFkS2733yhZskyEGHrYmV4nLeJ3HHTbQ7
         HqnA==
X-Gm-Message-State: AC+VfDwfzy3N8l5KfIuQlpXwJZj55JCP7ECfXYjGkJMF8IwTVvZ8y8+I
	1NFDDcksp5achsNuw4/FQYoPARvaEcHq1A==
X-Google-Smtp-Source: ACHHUZ4ff1GhEtmlOdTzngcRdAqxyHIGkfcTO1quWCxt1COUGj4iPxQqBZtXebhne5Puy48R4MoZHg==
X-Received: by 2002:a05:6a00:139a:b0:63d:3278:9b11 with SMTP id t26-20020a056a00139a00b0063d32789b11mr26805638pfg.16.1683008397204;
        Mon, 01 May 2023 23:19:57 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::f98d])
        by smtp.gmail.com with ESMTPSA id o8-20020a62f908000000b0063b5776b073sm20735612pfh.117.2023.05.01.23.19.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 23:19:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 02/11] radiusclient-ng: Point SRC_URI to archive.ubuntu.com
Date: Mon,  1 May 2023 23:19:45 -0700
Message-Id: <20230502061954.3782607-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230502061954.3782607-1-raj.khem@gmail.com>
References: <20230502061954.3782607-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 May 2023 06:20:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102248

This tarball is not available on debian ftp archive anymore

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-protocols/radiusclient-ng/radiusclient-ng_0.5.6.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-networking/recipes-protocols/radiusclient-ng/radiusclient-ng_0.5.6.bb b/meta-networking/recipes-protocols/radiusclient-ng/radiusclient-ng_0.5.6.bb
index 4696c3baeb..6baa83e83e 100644
--- a/meta-networking/recipes-protocols/radiusclient-ng/radiusclient-ng_0.5.6.bb
+++ b/meta-networking/recipes-protocols/radiusclient-ng/radiusclient-ng_0.5.6.bb
@@ -5,11 +5,10 @@ protocol (RFCs 2128 and 2139)."
 HOMEPAGE = "http://sourceforge.net/projects/radiusclient-ng.berlios/"
 SECTION = "net"
 
-SRC_URI = "${DEBIAN_MIRROR}/main/r/${BPN}/${BPN}_${PV}.orig.tar.gz \
+SRC_URI = "http://archive.ubuntu.com/ubuntu/pool/universe/r/${BPN}/${BPN}_${PV}.orig.tar.gz \
    file://Modify-configure.in-and-etc-Makefile.am.patch \
    file://config-site.radiusclient-ng-${PV}"
 
-SRC_URI[md5sum] = "6fb7d4d0aefafaee7385831ac46a8e9c"
 SRC_URI[sha256sum] = "282a9f1355f190efbb06c0d7c4e062eaa652caf342ed3ad361ac595f72f09f14"
 
 LICENSE = "BSD-3-Clause & BSD-2-Clause & HPND"
-- 
2.40.1


