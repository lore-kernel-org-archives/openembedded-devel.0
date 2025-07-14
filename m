Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB81DC83F1B
	for <webhook@archiver.kernel.org>; Mon, 14 Jul 2025 23:29:39 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.2115.1752535777111054587
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Jul 2025 16:29:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cV3Krm1+;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-234b9dfb842so43282135ad.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 14 Jul 2025 16:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752535776; x=1753140576; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h5ScqSkEEXaosMuIG/GHJpHizY8N82vlxuEjfsOcJ2k=;
        b=cV3Krm1+TMq1HNmbSN5Hr3y7MV6EPls6VZkoOEHk/f5V5T4yeBsaNqfp2slmHATv/P
         8W4FD/jspouEu8A3RQTiutwp4DKgftEANgRxfchvRiEVegq/VC98kfzQJEa0rsIWzCbQ
         UlSp2wxVzlt7O7rqifx7FBGjIO/qfwF4RWyYvWMMVV6cgJcyT5iv4lUXWGuU/xHm2f5Q
         q7bihfypGXGvm1d+els/bafyloXMKnyHePB2QL/POlXPnQ+Un2MaCjex4TrGwU+IyUNd
         EgxYY2KDE2YZgrIeI6BVsP/5dGeANUAF0PxCcOIvImvu1agc3uJ+ZCz8FcdJBLAgIC03
         4FMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752535776; x=1753140576;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h5ScqSkEEXaosMuIG/GHJpHizY8N82vlxuEjfsOcJ2k=;
        b=Ig10CeG/WPtBCX/zpEnHmHfPiuqXjXNXAgT4D0ivtuQEdit5VvCP5eoYeTmZ0il/Dy
         FWScoEwkGorZFG3u+rP0rppaaWgN+O0Z4G2AtlbrUyLfQ8XRS+KOsr+ODKklboqxzU9j
         LlNjV2n9HB1lHGI2HPAkXn6JQ+PW/bBCt94cwla+qpzE1qq0O5oPdlRqjv0wh7QtsYIm
         Ld2+4ptsrDh5y8R8KkyltzU3kpUjqKsADaV4zO+Ra3xeJ3Ee8NlAB+0HyK7Pawb+PKCL
         6OBeD7JiXDuPmHG8IVz8jJ0UR6FV6hMi2YPk6bQhPgYE/2+GfRLR/8u7ue3YQe4W1jQX
         v7kw==
X-Gm-Message-State: AOJu0YxIfTecaYea6lrKCULCSjK0bTpDfqBgBBTsRP74OE6FTfluNi/U
	MHamHNoofWcZFSpGg9dGPtPjqlOMDPISB2l/XYYghaMGkiFG3ctUp9hEf7tD8k37
X-Gm-Gg: ASbGncsr/A400vjnhakPdHCCrC+hCKHvj4DugyjLfZkLANqNMQktSkqetnCICN8SYRG
	8duIbBUoEL7j64z43PfF3KNKolr+tT6nfmRh6aDFOvJ9EsU7qjhnUMU6pfYqNailbHVy4wOHDHf
	9y6Vw6yx94hus/eJlQnr19sml72k3dQ/MeCzzLOpewXWMZJEyabzOhsmZ0lI2HT4OGy8y7l8v78
	vbYHUxtj9HrSiiflruJQJX1I0nga8pjJfuZ1i4pPTnuyZgMUjPO/MMVK+9dxbs2rttGbI+y7dNs
	nQzGpoTWL8vIA2YhZILl/Ga8scwXRL7AJFpHlfG82RLx7VwGJ1LrQJ+FOGeHOJywaQ8f+Nhp1V6
	OfVTHAFuLQqVmpwBcnlcshz6h
X-Google-Smtp-Source: AGHT+IEJrSKMC2X7b5TVm1XlU4QlYZ0esJLSJ1+6uXdBO0Uw4WVvdntFNVX4WmtYTmhcq9sGOd3myg==
X-Received: by 2002:a17:902:dac5:b0:234:c8ec:51b5 with SMTP id d9443c01a7336-23dee3a8f89mr237835245ad.53.1752535776031;
        Mon, 14 Jul 2025 16:29:36 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::1c1d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3bbe6bd903sm10929482a12.49.2025.07.14.16.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 16:29:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 1/2] relayd: Fix building with CMake 4+
Date: Mon, 14 Jul 2025 16:29:32 -0700
Message-ID: <20250714232933.230092-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Jul 2025 23:29:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118545

Bump minimum cmake dialect to be 3.5+, this is an openwrt
component, which does not get many updates these days. Ideally
the cmake files for the project should be fixed.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-connectivity/relayd/relayd_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-connectivity/relayd/relayd_git.bb b/meta-networking/recipes-connectivity/relayd/relayd_git.bb
index 17745da806..64ea4e798a 100644
--- a/meta-networking/recipes-connectivity/relayd/relayd_git.bb
+++ b/meta-networking/recipes-connectivity/relayd/relayd_git.bb
@@ -15,4 +15,6 @@ UPSTREAM_CHECK_COMMITS = "1"
 
 inherit cmake
 
+EXTRA_OECMAKE += "-DCMAKE_POLICY_VERSION_MINIMUM=3.5"
+
 CFLAGS:append:toolchain-clang = " -Wno-error=gnu-variable-sized-type-not-at-end"

