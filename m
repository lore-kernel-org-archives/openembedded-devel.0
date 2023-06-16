Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30BDFEB64DA
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 03:24:57 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.500.1686885895602736481
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Jun 2023 20:24:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=L1hzj2Q0;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2553663f71eso245926a91.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 15 Jun 2023 20:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686885895; x=1689477895;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0FZUigdcX3pDepB6RS0DROZ8Ap+tPYaHWsk/RPjifrM=;
        b=L1hzj2Q0qgPuA8u0ehHYe4VkI9Jos88wSVf//m9tfAlpovFSzDUtRGiG4jwO21rU8S
         zjLyJl2UTrwgluZEa/UgLN0F49t3+vdjVGizjtWIqOQhQmhJ4agCha0RdfSjkY8cUwHa
         bFBmvUdXpsAF8O0mh3rHozlLYHvVoYqf3OtC8bzs3Hg52lgI98aXrWrvZTcq/HJ7bDWm
         da/Z02ewAcSb3tUQJSETnMjf3+WWgflSaNMyxVnBgHaUI8Sr0STLkn141N8D8xtz6xev
         DgIuFdN69/CtjEeiP3T0IiaY2gSbEIjuUVgaQ9m97FYno0pq4hY/FfB5bCxiS1TMGV5D
         Qi8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686885895; x=1689477895;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0FZUigdcX3pDepB6RS0DROZ8Ap+tPYaHWsk/RPjifrM=;
        b=cY4hNShbXmBn1T5MHBLqePeiTPMMI/hdMWcvxGKl7ymrTKPs57EFs2ESX2cXTsb6fv
         rv3T1sydZtzEcejTu1LYPW8a0I/j3i+R6rsWEWRaJEJpZiXMHpJHs4fVVtF4quvmtaSf
         hy3PqeCC0RtX0pPBp/aUrc5h9UHJvLm/1av+0plqxTUKt86FlMHx79K/FdJkg1qu/Hsr
         c61xUXmqATnuZFx9r88K0A1cv0+sivXyJvqjg4fYck4O7+IQ1Uk4kMxzXVUafqhEXMXI
         MZJbvUVFtrlOe1RGw0lz+2Vd1b4kTgAhONyAJuwpjsN7Q/G/bRBLLakEqxH+iWkcsDK6
         jiNw==
X-Gm-Message-State: AC+VfDyKrqIzqzeFG52WBA+7nrZzWZa+6Kezvo8ntzmXHthnrTA4M+Ep
	MEaijYfVb5SV4Fypu48a2Dg6rINYnNc=
X-Google-Smtp-Source: ACHHUZ6m2dQPG9ClQiBBXKsq2PRucbhJQATqBwdvihzmYm6uI/IPvmvlLA9aktMP2u19wX7ytfEVzg==
X-Received: by 2002:a17:90b:3141:b0:259:548b:d394 with SMTP id ip1-20020a17090b314100b00259548bd394mr625248pjb.28.1686885894695;
        Thu, 15 Jun 2023 20:24:54 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::eb87])
        by smtp.gmail.com with ESMTPSA id ie24-20020a17090b401800b0025645d118adsm319329pjb.14.2023.06.15.20.24.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 20:24:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [layer][PATCH] layers: Move READMEs to markdown format
Date: Thu, 15 Jun 2023 20:24:51 -0700
Message-ID: <20230616032451.1748813-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Jun 2023 03:24:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103332

The READMEs are often viewed from websites markdown format which is
much as readable as text and yet friendlier in browsers.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 README => README.md                    | 0
 meta-filesystems/{README => README.md} | 0
 meta-gnome/{README => README.md}       | 0
 meta-initramfs/{README => README.md}   | 0
 meta-multimedia/{README => README.md}  | 0
 meta-networking/{README => README.md}  | 0
 meta-oe/{README => README.md}          | 0
 meta-perl/{README => README.md}        | 0
 meta-python/{README => README.md}      | 0
 meta-webserver/{README => README.md}   | 0
 meta-xfce/{README => README.md}        | 0
 11 files changed, 0 insertions(+), 0 deletions(-)
 rename README => README.md (100%)
 rename meta-filesystems/{README => README.md} (100%)
 rename meta-gnome/{README => README.md} (100%)
 rename meta-initramfs/{README => README.md} (100%)
 rename meta-multimedia/{README => README.md} (100%)
 rename meta-networking/{README => README.md} (100%)
 rename meta-oe/{README => README.md} (100%)
 rename meta-perl/{README => README.md} (100%)
 rename meta-python/{README => README.md} (100%)
 rename meta-webserver/{README => README.md} (100%)
 rename meta-xfce/{README => README.md} (100%)

diff --git a/README b/README.md
similarity index 100%
rename from README
rename to README.md
diff --git a/meta-filesystems/README b/meta-filesystems/README.md
similarity index 100%
rename from meta-filesystems/README
rename to meta-filesystems/README.md
diff --git a/meta-gnome/README b/meta-gnome/README.md
similarity index 100%
rename from meta-gnome/README
rename to meta-gnome/README.md
diff --git a/meta-initramfs/README b/meta-initramfs/README.md
similarity index 100%
rename from meta-initramfs/README
rename to meta-initramfs/README.md
diff --git a/meta-multimedia/README b/meta-multimedia/README.md
similarity index 100%
rename from meta-multimedia/README
rename to meta-multimedia/README.md
diff --git a/meta-networking/README b/meta-networking/README.md
similarity index 100%
rename from meta-networking/README
rename to meta-networking/README.md
diff --git a/meta-oe/README b/meta-oe/README.md
similarity index 100%
rename from meta-oe/README
rename to meta-oe/README.md
diff --git a/meta-perl/README b/meta-perl/README.md
similarity index 100%
rename from meta-perl/README
rename to meta-perl/README.md
diff --git a/meta-python/README b/meta-python/README.md
similarity index 100%
rename from meta-python/README
rename to meta-python/README.md
diff --git a/meta-webserver/README b/meta-webserver/README.md
similarity index 100%
rename from meta-webserver/README
rename to meta-webserver/README.md
diff --git a/meta-xfce/README b/meta-xfce/README.md
similarity index 100%
rename from meta-xfce/README
rename to meta-xfce/README.md
-- 
2.41.0


