Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D643D116F7
	for <webhook@archiver.kernel.org>; Fri, 28 Nov 2025 20:18:51 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3256.1764361128719414113
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Nov 2025 12:18:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Wc94KvN7;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4777771ed1aso13076195e9.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 28 Nov 2025 12:18:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764361127; x=1764965927; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LFsOHHIp5xIB7nWyZxlRZECcqMfV6k8Aq2ZGj5QdMoE=;
        b=Wc94KvN7uwKDx3Kz9DhDBu7BnAuvCEb/zOZiBasThBOqYQzT4gcxzZ0mz8yTJHXRp+
         lH+svyTch2LKSe0OciQhvPm6epn/SEkxs0G3okWm1WouZPNLjujTdWouOIEFPTTTkXM6
         x+9N4w0C8NUEV27tGAlx2jV1q7cSDJr9pxp6CwOZWRG73mzECGJ+MyUoaAWglsT0sw6h
         Alr4QrllZ6rtJesbAfveqaaVxiLlYujwaWCHeTYWy+4vXvQw+Emf1KAlvnpNlB+1yWqf
         OJdAQHsJ2Ed/ZV4K6zb0HrcrCZU91i1NZ2h5o7+/uBgkYNsGjkh63eSU6SqLH33THG4+
         ZPMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764361127; x=1764965927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LFsOHHIp5xIB7nWyZxlRZECcqMfV6k8Aq2ZGj5QdMoE=;
        b=FatMP3JK9ub29LayOBPn3W1wCmFy9AkjXNDmnYKVf4Vay2/mNwli/oj+VHjIbXEFdU
         j/QOMnqhLcq8eq2pSzkLYUH6Yq7SIP9gp4xMqxYth1k00A04x9CwIwgiKxXZVFjQuLHm
         8n3z817ittqhpi6Kncnv9AiDCgj8D4ATAroybB+SHFV4oSGuGnfHz77jbPl0VPMyR7Fu
         s4q9O6pFXzzi2fw6hOy58ofBOxW9+eVd+c8suajC5824Jnb/OJ5SIacOO3KyTsVUsgK8
         oIqPaU664zmVttgKwI7dT930q68I3i9JP/NTSr6rMNvhvd3H6rTlaAonKYlZU63IMulc
         Ca7Q==
X-Gm-Message-State: AOJu0YyxIyvf6dWdC39YhVaGjKkvqTy1Ma/rq/plXoYM5QPl34uIRpxf
	oVo03jBBSYHzfZaykn7lHKNkm94uVC+gutolk0zFQVkAtPdi4jWSFz1lFV/N/g==
X-Gm-Gg: ASbGncsDE3eU6/6cGqqVcLEwzol2cylfSg6CozZrxIzOdd2USU7lXT24FC5lcV+2qIs
	pYeEBp2ozeOaE41yJoKeF/H0o8+Osy8evsOdnCaFatvyxtNhv3GEmF2I6B6RAGjcoAt+r8ltIh1
	02SD6Gs6DsEQ47oXLvY6yDWf/pGFdd5dxMh1mp5sf3hZ8hZ44ZdtrlFRqjoblg2wOQ50U5koC9b
	E8JbiBdHpbrEivzNbuVs5pzclhd24nsiGopgzIllKCocMzym1LaQ1LYA8qHIhqwJyjjp9QSE8gl
	44KFKiepY1F5dcHyYioURuZslkaw3wzDyahV9YSPiXPg8XfV/FqY3n971wypUVjXLlZdfYcUH0B
	+Hu3iu6Cq4BuaLHDejY9W0DUoR6DoHC69s0kGfMnh8vtR70F3ouS9BYGj4eeiVJfztZPz9oamg6
	O8wthF2OZU4MX+gF0K0aU=
X-Google-Smtp-Source: AGHT+IHNXblez7puJPX0DTwEe+53CXvAo0/BqLRRnCxw2gfzFI1QCEIGSIyNn4933YPY61ihSbDpPA==
X-Received: by 2002:a05:600c:1c1b:b0:477:a02d:397a with SMTP id 5b1f17b1804b1-477c0162cf7mr306074445e9.2.1764361126940;
        Fri, 28 Nov 2025 12:18:46 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1c5d6064sm11674324f8f.13.2025.11.28.12.18.46
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 12:18:46 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-webserver][kirkstone][PATCH 02/14] cockpit: set correct CVE_PRODUCT
Date: Fri, 28 Nov 2025 21:18:33 +0100
Message-ID: <20251128201845.2578315-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251128201845.2578315-1-skandigraun@gmail.com>
References: <20251128201845.2578315-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Nov 2025 20:18:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122134

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit af4df551eec582844a8b56154117915ace1596cd)
---
 meta-webserver/recipes-webadmin/cockpit/cockpit_220.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-webserver/recipes-webadmin/cockpit/cockpit_220.bb b/meta-webserver/recipes-webadmin/cockpit/cockpit_220.bb
index c08de89316..6f9005d59b 100644
--- a/meta-webserver/recipes-webadmin/cockpit/cockpit_220.bb
+++ b/meta-webserver/recipes-webadmin/cockpit/cockpit_220.bb
@@ -189,3 +189,5 @@ do_install:append() {
         done
     fi
 }
+
+CVE_PRODUCT = "cockpit-project:cockpit"

