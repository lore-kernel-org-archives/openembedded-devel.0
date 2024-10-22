Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C97ACDD0D1
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 18:21:31 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web10.21946.1729612090099743936
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Oct 2024 08:48:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bQdJ9kCZ;
 spf=pass (domain: gmail.com, ip: 209.85.128.176, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6e7e1232648so7160517b3.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 08:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729612089; x=1730216889; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qc6kiMnTIDtOiqMHpZNRFxop2Hc2lrIHUUo4VpS7k8E=;
        b=bQdJ9kCZ8wpYUPkRLDB9XX8FnJyB7oDnnLISIwMQTaU2f2rTX1l2F+P/NeZ1w97y+h
         ZeOTDsYGWCrzSY2AQklUoO0/YIy4n06NbObKr5dSrme5E+CuUh8ryGR0ZOTWoicIrXWs
         AEMMeyr1/P2p/9VoD/7HLK62EC7LUETeTIJzG7G1CUVbsfsCnu+pNjofaE13IyN+rY6a
         67LUlFGD3f03CwBbNa4Whk+az5sxnBVeqTlKIJleK0dThfd6039YAC7lEAfIYwNZsuzY
         oqZF81i1SWmFL1fvmxS0+OfT4PnAeFwYx/d0GOPWZKtGUEjIEAc87d4m+6HY870WtZgc
         sshA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729612089; x=1730216889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qc6kiMnTIDtOiqMHpZNRFxop2Hc2lrIHUUo4VpS7k8E=;
        b=LCdFj4TM6DTuMwLqlBBfZc9fTME6FPKvuAH6Aslqk+7BqyivODs3tyhaujJkUUtw1m
         /iP1csA0FzczKzdkDloiXXM+OZmZ1jXRCe0PpfzwsHGH9OiIP9Ph8kYQqZ+Yi61wiARU
         c842G+U/U5wMsfgpytE/8K5WMqICbMZVWdxcgNZJyr3orX8Aw2qPnxIWl8CKuv0Gc0e0
         EGfa8aABIbroe8sAIvbdtMw7VxzTjV/qo8zR0pnV0E6RREoaRtzACG9fFiFrM5g7odq3
         B07JyW0wkUsyTVZQiJwnRx+HYOHE60sFgslx6OlBVP/w6zre3B3AdUVk0JD7LmzViWEQ
         uY2w==
X-Gm-Message-State: AOJu0YzgizNZhHQxUnkuWjtVu2za34l95PuTFtTBdfkeMlKsKHdguz6p
	/xKNKEYkaCMO/2/sCoPEpto8HEwXNQexcwLfpnN4N5Iks9Dfnic8WVRPWA==
X-Google-Smtp-Source: AGHT+IF3ls/vOq1bVlMMJKX1m08IZ0c+3fggFtDdkVQ8R76/SfX+kOQxlaFioGr+FxotXWgfsLZRsw==
X-Received: by 2002:a05:690c:2f0f:b0:6e3:7eb7:b600 with SMTP id 00721157ae682-6e5bfc8eb42mr105182987b3.43.1729612088693;
        Tue, 22 Oct 2024 08:48:08 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f5d085dfsm11187407b3.123.2024.10.22.08.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 08:48:08 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 22/46] libio-stringy-perl: Drop unnecessary SRC_URI md5sum
Date: Tue, 22 Oct 2024 11:44:40 -0400
Message-ID: <20241022154729.20331-23-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241022154729.20331-1-schonm@gmail.com>
References: <20241022154729.20331-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 18:21:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113113

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/libio/libio-stringy-perl_2.111.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libio/libio-stringy-perl_2.111.bb b/meta-perl/recipes-perl/libio/libio-stringy-perl_2.111.bb
index b74593923..5c5ccf7db 100644
--- a/meta-perl/recipes-perl/libio/libio-stringy-perl_2.111.bb
+++ b/meta-perl/recipes-perl/libio/libio-stringy-perl_2.111.bb
@@ -10,7 +10,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=01406e4ff2e60d88d42ef1caebdd0011"
 
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/D/DS/DSKOLL/IO-stringy-${PV}.tar.gz"
-SRC_URI[md5sum] = "e91acf0a800b190d13585a47de775bdd"
 SRC_URI[sha256sum] = "8c67fd6608c3c4e74f7324f1404a856c331dbf48d9deda6aaa8296ea41bf199d"
 
 S = "${WORKDIR}/IO-stringy-${PV}"
-- 
2.43.0


