Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63370CCA46F
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 14:19:32 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web11.18523.1758896366844195935
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Sep 2025 07:19:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=csA3lp1m;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6228de280a4so4132615a12.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 07:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758896365; x=1759501165; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Su04W5iBFzyJk3xwwIfunSaZXHmnxbRTGBjlrU5s2L8=;
        b=csA3lp1m0OL9ITVEnjYmJn0dioU44jIHieVZhO4QAmJ9NkMboqs+5/wcYNbjPfvOxb
         LNmxSTnhWW5QdYUd+MnzL0C3/hsgbFy/LuxZxBg3CX7g6QrQtXvxX1w0opD1t+TEY2kx
         +svwA9sQIzfyPXWAzN2ojC9qhuRReywCTEhZtF5/jBUsqWI37fgjokseAR8p+z/7rYaJ
         ow572okw6Ql352sZ2YkGLyOnpIbOWPF0hkUKA2tPkHjNV65h+AmxShxNq7JHUa5nOOvc
         XZCv7Knt52fDZE13dzuKNqF1+I5ku/B/wiW2MBnL2Zhh5jwhQJOZHWCDiwW77Wjx+/RC
         pHDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758896365; x=1759501165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Su04W5iBFzyJk3xwwIfunSaZXHmnxbRTGBjlrU5s2L8=;
        b=aAks0L0vaoHDr7urKdlBJGscSPeqRkiQetng/kzOiscxFriotrwcweldrS7VKbOdX2
         gknNc09PMwyhJa5Q8EempvR3Ql275JIoY5AjP4TYDjOLkXtNqoJ4c44IWikxCRei5x1U
         y0rlJl5X0a81YRvG6vfzKZ+uYbCmgC4a7Mea2NdcHdHvwJYnv7HUAJO90kj46SALJvzY
         41+BEKBUc+8TJMAILKdgcj0tcNrkY5HZCKNTFVsRrB9OO+IBxvTaG3fkR+wgJW4pRmgI
         FY157X0mHbbK2X75t19VD8i0lXo0NmcWvI8QMnoAI9YLjd+7M0saHhwy4cwzli0ZEQkD
         QGKg==
X-Gm-Message-State: AOJu0Yz3pVtb4CtHN0OWwQDXFwKVH03xoL6+/zeAzUGhQZcby/fQQxL6
	Uw9mLHYi2pv2Y9mI2dYJruYuNUXLHPaZBHJoli+h6ePlSUzBGiLoNhFO2S6ACw==
X-Gm-Gg: ASbGncsOvSZodmtiFZiFLopO4k47x/8LqV1f8SaF1L7UjWBF9f59Few4wyoXkUeuy1Y
	peUoaWhhhwvWh2Mxed6CpaceNRvCAOOzZR7ouAZMevWWI/JK+hmfSqaxQ9gGsiYKgKp0Hd4hdWx
	Tk7OYxTPld7Ng6P0naayIy70kpOpe2I1remHEGN0VoKuI46VAkHI3l7iDElycCSbsGrx/1Kk3SG
	NPZ/FM61Pq8I2IyYRDJvDOG8T64G1EJRtPpd/j3KiVSwf5GvBdScnR7SEUTGplGWZ24wUHGi8VO
	XAEDutwFxsxDfGpEcY94iYG5l8ESa6hwC1UHKriIe+q9GCeqGPoY9l8eXWH8RHf42pJmTc6MP+u
	kAcLdfQHZJG/WOF6GrGxi9vX8aEirLq8=
X-Google-Smtp-Source: AGHT+IFlnpsjLhIQYfLzFgBCZWGIzRQ7XxouhRUdgmgrpZyMV+ANr31T6G6fh/q6aUCR3kMUjEBP7A==
X-Received: by 2002:a05:6402:34c:b0:632:67ba:f9a7 with SMTP id 4fb4d7f45d1cf-6349f9cb893mr5058415a12.2.1758896365010;
        Fri, 26 Sep 2025 07:19:25 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-634a3ae321csm3001028a12.24.2025.09.26.07.19.24
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 07:19:24 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH 03/20] networkmanager: fix iptables and nft paths
Date: Fri, 26 Sep 2025 16:19:02 +0200
Message-ID: <20250926141919.2010846-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250926141919.2010846-1-skandigraun@gmail.com>
References: <20250926141919.2010846-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 14:19:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119912

From: Jim Broadus <jbroadus@gmail.com>

The NetworkManager meson.build is searching for iptables and nft by
passing absolute paths to meson's find_program. The result is that it
locates tools on the host machine when they exist at those locations. If
they don't, it uses default locations. This often works out, but in some
cases, such as when the host uses a merged usr scheme and the build
target does not, the paths will be incorrect and the tools won't be
found at runtime.

These could be PACKAGECONFIG options, but since they have fallback
values, completely disabling the use of either iptables or nft would
require patching the meson.build or setting a bogus location.

Note that this meson.build file follows the same pattern elsewhere, but
most cases are already covered by PACKAGECONFIG options.

Signed-off-by: Jim Broadus <jim@thruwave.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 7c440945326db26c3ff2b413956bb3dad223891a)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../networkmanager/networkmanager_1.36.2.bb                     | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.36.2.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.36.2.bb
index e3b1296a6b..da856622bf 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.36.2.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.36.2.bb
@@ -51,6 +51,8 @@ EXTRA_OEMESON = "\
     -Dconfig_dns_rc_manager_default=${NETWORKMANAGER_DNS_RC_MANAGER_DEFAULT} \
     -Dconfig_dhcp_default=${NETWORKMANAGER_DHCP_DEFAULT} \
     -Ddhcpcanon=false \
+    -Diptables=${sbindir}/iptables \
+    -Dnft=${sbindir}/nft \
 "
 
 # stolen from https://github.com/void-linux/void-packages/blob/master/srcpkgs/NetworkManager/template

