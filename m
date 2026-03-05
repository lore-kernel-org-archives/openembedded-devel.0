Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7738EF33A7D
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 14:52:04 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45919.1772722310887013874
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Mar 2026 06:51:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gtyR7vpr;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-439bc14dcf4so2907170f8f.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Mar 2026 06:51:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772722309; x=1773327109; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7EnLTDMSEuL7ZSYbIS49zM4LdDCFdlGS2XiR4DGQAN0=;
        b=gtyR7vpriMxjW8TTcTX6lJVyprH1vdnxviSOGA6t8WTmlv1ENnZSy6/IkDXiFD7eIg
         LPj6jLjHZUbnLNERselH5R/KYNjT9fu1galmQDQujI0b7Avv1Cm2+RjYduv5Ia5jacJT
         uEIA5lo/vpMx7tWONWUeQmTRMhF6ylGeBixGiXjsoxP3nd/VbMLEHwaIWDnhr9upXVqN
         Su5Djkrjo0VREzoE48mBdVEKwbwSHrT2QNh27z/emQDj1apjldypb72hqw1d3fwco+NL
         9JoLs3Ip1t8DRVSrwB9115U3y23cj4eqU6xmIlYJzVMYb2zAaoSVfpI89FRmtGVP+mY8
         Vb/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772722309; x=1773327109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7EnLTDMSEuL7ZSYbIS49zM4LdDCFdlGS2XiR4DGQAN0=;
        b=sq5eHEqtcB937rH6ZiQfq2lox0NNt+5nPC9PAfP/5s1U1TH0y1R384o18rxYuGP4jK
         VxGeweGesl84iGUP6ANgdkrm2G9jA+HS6SmfaCZ74/ERo+IyiZJ26+aGU21l3wlSxZIk
         xOaIVUd5a/bqa2doUsEDZDF6qxiqPfk70ms5YqO6uWEzLJByLqWbrfZqGWV8YZQpG3KX
         1THrPkSjfJSRlcyRH9zgBoJ0njv5fSYs8WoYwIkW/ZQ6f6X1LnFUJzv2aX3+n3eOMOuX
         EQUKErXLMLi/TVlxTVTKE+A/wBZ9Wn8BiOrLOOk55ZK9dK1WgNeomplaMSTq+XkKu42v
         aA/w==
X-Gm-Message-State: AOJu0Yw5m15GFkNqCO05LrmjFhUfVLmfvEWlUf23q5DFGbK8hoK0y4j2
	kHvD2h/9hn/oRUc2lnsBjxxvM+JDshQKVQqE74tfFOpCgJ8HJyr3lIs4DFTxxg==
X-Gm-Gg: ATEYQzw/qlaemIOZ+ty+qA1lFbrELWVpg98VXkAWSySg4g2lfS89nHKumdVSgZD4Gwj
	K10w93VOEA5Q4hfXh8xxhsPgaFZ8rWvaeVcHBsUhkh1CBmGxmTDd/5UDxjn7zAakyiCFLE/dnw2
	y9O0LiMakWJ5SofnHX3hS5NUZsql19YHngTEKra4jSYMgQcqYuj7LhsQW4lVUGmRWN4yJLCG9LP
	ux8FdbGgH04tu7aDk9LfgnGLbnXLYRNCUhhL3S0DK8oCDDCOlpCKjVwTSu1vyz/AnVKgjpMRNc2
	CPQsYtLkhdaK4E53hIjtz5/B0VA8MrPDS1O2hX8qHfgVOv12oxQ8CiaxKNCY5o0HEijF8bBnhzI
	vo7OJ8F0NvUuH82rPIL9IJ/JeIeezVHFG7IF49ndmqS4o29icoQQrc+g96TggfxyvTUcirdlvk4
	6sNSzE864obYrv1+ScVRie
X-Received: by 2002:a05:6000:2405:b0:439:c39e:d9ed with SMTP id ffacd0b85a97d-439cfd3790emr4558281f8f.17.1772722309196;
        Thu, 05 Mar 2026 06:51:49 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c75b272sm49302136f8f.24.2026.03.05.06.51.48
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 06:51:48 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][scarthgap][PATCH 4/4] spice-gtk: mark CVE-2012-4425 as fixed
Date: Thu,  5 Mar 2026 15:51:46 +0100
Message-ID: <20260305145146.3068524-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260305145146.3068524-1-skandigraun@gmail.com>
References: <20260305145146.3068524-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Mar 2026 14:52:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124881

From: Peter Marko <peter.marko@siemens.com>

It is fixed by [1] since 0.15.3.
NVD tracks this CVE as version-less.

[1] https://cgit.freedesktop.org/spice/spice-gtk/commit/?id=efbf867bb88845d5edf839550b54494b1bb752b9

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 7e17f8cec02d20813fb8368ccc1c5ae27b291383)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-networking/recipes-support/spice/spice-gtk_0.42.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-support/spice/spice-gtk_0.42.bb b/meta-networking/recipes-support/spice/spice-gtk_0.42.bb
index c8a3f7f532..4ef39f0904 100644
--- a/meta-networking/recipes-support/spice/spice-gtk_0.42.bb
+++ b/meta-networking/recipes-support/spice/spice-gtk_0.42.bb
@@ -12,6 +12,8 @@ SRCREV = "f04479c16f0969fb394ebe74b6eff74e560a42f0"
 
 SRC_URI = "gitsm://gitlab.freedesktop.org/spice/spice-gtk.git;protocol=https;branch=master"
 
+CVE_STATUS[CVE-2012-4425] = "fixed-version: fixed since 0.15.3"
+
 S = "${WORKDIR}/git"
 
 DEPENDS = " \

