Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CFD4C7EE2D
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 06:20:08 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.122288.1683008399896984326
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 May 2023 23:19:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=khQfeKwA;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-63f273b219eso2457278b3a.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 May 2023 23:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683008399; x=1685600399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ZgtUYOv/NSVF79ftJnkJXKwvQs63slCdzaRgsb5klw=;
        b=khQfeKwAnYxre88C8444TzTqUkqLWfn4jm6nKA2w6PksyX0l2a9euinLkATevsr7ad
         q4faDCF6svaGR8oILe8nL9Y4cNHr5CUP1QwhJlBvZf03TlnvZUdAmnnWh4EBFovWwN+N
         v8TEtONvfOxmNkaTTHOk8X1CZciLyL8MCHVFSGZvN+IPGESwunxHlDChbWjqJnB3Y7FI
         BABBMWi9zHEsvFaYfTaICjs8w4xH0TIIrQMWnV56GkSPYFhPa0yot+58dxDFlXozknR7
         ApF3dnbzYDVogEFlFJyFHELz17hkFajkXl34NfOxwXcscoB6BtroaOIhxy4U9DIuW3va
         BoOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683008399; x=1685600399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2ZgtUYOv/NSVF79ftJnkJXKwvQs63slCdzaRgsb5klw=;
        b=UdFREXEeoBkMxLa4kpcUJ8KQgOtFYac18EzUWrKFND1jubRSpIK9OIzG8WE5T3T/Wu
         B7SIBxRBsUiqX+PVY9SYe3UgnRt+3YYl+l+T5l3L11HcoPaAvmYu7FcpfRZmSyI6wTDL
         msVqOEMw9QFvf1ldxSpxy0IiXe94sLnwu4QOjrp0zflIw/5FyWiRgdw8Dt3YgIDAgjL9
         Dov+TlW/9eu0vPXwg0lIY1C0L9lsfzjEKPqPYJorySvz100O5eM9sxFhzRYMy7RobWVe
         XRDjSVqWuz6Z1Cd2ICA1a6+w/PB9i1BZZSGgUtYZTdS8CoX/BY732ef/3HxWRLECf+Ir
         PvOg==
X-Gm-Message-State: AC+VfDw0wKW2DXZdnYGFJBNMq26jtmJmqa6SRB/u63E0tpFTxLJGMtan
	JU3ZpZm19eCku81b580ZIh+QxB9+xve9/A==
X-Google-Smtp-Source: ACHHUZ6NvgSmGkwaip3vJwURhrEsTjiOL9qlJ48pybDKE1sGUjnNyF07/tdK0REruX9dI94OXiEmbQ==
X-Received: by 2002:a05:6a20:12d3:b0:f5:2b11:5a0a with SMTP id v19-20020a056a2012d300b000f52b115a0amr20671769pzg.10.1683008399078;
        Mon, 01 May 2023 23:19:59 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::f98d])
        by smtp.gmail.com with ESMTPSA id o8-20020a62f908000000b0063b5776b073sm20735612pfh.117.2023.05.01.23.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 23:19:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 05/11] mosh: Point SRC_URI to https://mosh.org/
Date: Mon,  1 May 2023 23:19:48 -0700
Message-Id: <20230502061954.3782607-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230502061954.3782607-1-raj.khem@gmail.com>
References: <20230502061954.3782607-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 May 2023 06:20:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102251

mosh.mit.edu does not have the tarballs anymore

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-connectivity/mosh/mosh_1.4.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/mosh/mosh_1.4.0.bb b/meta-oe/recipes-connectivity/mosh/mosh_1.4.0.bb
index 4537a09412..2869e06336 100644
--- a/meta-oe/recipes-connectivity/mosh/mosh_1.4.0.bb
+++ b/meta-oe/recipes-connectivity/mosh/mosh_1.4.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 DEPENDS = "protobuf-native protobuf ncurses zlib libio-pty-perl openssl libutempter"
 
-SRC_URI = "http://mosh.mit.edu/mosh-${PV}.tar.gz"
+SRC_URI = "https://mosh.org/${BP}.tar.gz"
 SRC_URI[sha256sum] = "872e4b134e5df29c8933dff12350785054d2fd2839b5ae6b5587b14db1465ddd"
 
 inherit autotools pkgconfig
-- 
2.40.1


