Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C813CCFA769
	for <webhook@archiver.kernel.org>; Fri,  4 Oct 2024 10:59:53 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web10.13799.1728009622698507587
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Oct 2024 19:40:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cVnvipjA;
 spf=pass (domain: gmail.com, ip: 209.85.128.176, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6e2326896cbso13845237b3.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 03 Oct 2024 19:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728009621; x=1728614421; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K65LMJA++2LRdBvIq4Gisp89wj9B3rSbf4RpI5RzYMQ=;
        b=cVnvipjAd/Xpg04Q/XMImD15zEpAlygXqS6dNexDWliKSc73NS2qGlcKcIhw1Lsnlq
         mns4InIuxam80oz05QqPmPreDGr6JvNyQ9ISrTyvbJCzAd2pBK0MYcCh+Di9rwqKsKpL
         LV/joUMxXIuPXHwAIb93roR+ZLdhAaxjZZtP348hPAoE8ZOV2D9nGlmIhOPHcSePLzf+
         eaQwe8TlIon6Y8BowQmDKx4NihmdjqON+5HErrxNU1cdW3kYN3fgSaQcaRmmzMqRMpmv
         j5Z+LLQO47RM9qvZCaFvuoIP18HLWxynlYSrAvCgVyZXv2qv58j493IGMl8BUB8PpD/X
         3H7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728009621; x=1728614421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K65LMJA++2LRdBvIq4Gisp89wj9B3rSbf4RpI5RzYMQ=;
        b=Ipjjb59mSJl7qk6KnSriCgFrh88gzE70stS7tLloNsef42h1ppnVEuixHr5QI3WJay
         P7OgIZfiAlAfasjSGqsLVOGM9fZz+2f1yL/9jB03IAhLZnlJftQuAa1qcmKcsCT4hrsx
         sNRpnS+v2RAnP3MqNmVC49RM78Xguk/zfzxjulD/nhEwe5gm71c95Slb4yv58aN84mPT
         5TIJfM1U/eTcvfxI739SHMWGvy8vCcESAK9BiwTpg89XjBsRSkOFEUPKLbRBv/C/kbX9
         V/09GK12+0N0+XFecH10s6TQKwXOdQVU9EfP3J3Ni/netrMQrMxBXKqEx5+mfKCdkR95
         j83w==
X-Gm-Message-State: AOJu0YxKwGrM7/fRcDsRlT1hI3mo/tO8Oyp0bfsftzoDY0T6VKio9xwr
	uAfc4VdKj+fEkPRoDGRorHDNYgwxaNj3aSnZFAT9u8v2vFRtM72HMohazA==
X-Google-Smtp-Source: AGHT+IFHKEdsVO3zIJBhZs9OaXU+Ak0OwNr1EZdSIfTJllDvHGEaMWpd8QONef9+/Jp4ipZGO2DaJg==
X-Received: by 2002:a05:690c:dd4:b0:6e2:18b8:c01d with SMTP id 00721157ae682-6e2c72413b4mr12799197b3.22.1728009621083;
        Thu, 03 Oct 2024 19:40:21 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e2bc2d1bf3sm4908547b3.74.2024.10.03.19.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 19:40:20 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH 3/5] xfce-dusk-gtk3: Drop unnecessary SRC_URI[md5sum]
Date: Thu,  3 Oct 2024 22:33:06 -0400
Message-ID: <20241004023842.14172-5-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241004023842.14172-2-schonm@gmail.com>
References: <20241004023842.14172-2-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Oct 2024 10:59:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112661

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-xfce/recipes-art/xfce-dusk-gtk3/xfce-dusk-gtk3_1.3.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-xfce/recipes-art/xfce-dusk-gtk3/xfce-dusk-gtk3_1.3.bb b/meta-xfce/recipes-art/xfce-dusk-gtk3/xfce-dusk-gtk3_1.3.bb
index 4cbdb4e08..4dacb203d 100644
--- a/meta-xfce/recipes-art/xfce-dusk-gtk3/xfce-dusk-gtk3_1.3.bb
+++ b/meta-xfce/recipes-art/xfce-dusk-gtk3/xfce-dusk-gtk3_1.3.bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8f0e2cd40e05189ec81232da84bd6e1a"
 inherit allarch
 
 SRC_URI = "http://sources.openembedded.org/141404-xfce_dusk_gtk3-1_3.tar.gz;subdir=${BPN}-${PV}"
-SRC_URI[md5sum] = "b3ad37ad8173b14ec090e60a80e65d8f"
 SRC_URI[sha256sum] = "bfa8a88607d1a1da5bd0b9e4e075767c54400a3c5a0fae88b619ed71532f30b4"
 
 do_configure() {
-- 
2.43.0


