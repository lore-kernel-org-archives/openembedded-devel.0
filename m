Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E83E5D116F9
	for <webhook@archiver.kernel.org>; Sun, 30 Nov 2025 20:35:26 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4963.1764534920437677605
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Nov 2025 12:35:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lJxVyjdV;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4779a4fc95aso28866715e9.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 30 Nov 2025 12:35:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764534919; x=1765139719; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tALSMGue9jsIHZGY2fXM0uj7qtmBCt466L7eDoG2XvI=;
        b=lJxVyjdV/iBbSJ9Et4abHkB8USiKq9LpoqdXrKwM4tBowYguCbEXXzsTnrZKxliiZf
         YG7j0tG6UCmIHdQOFxZi9WER6gTwZaKeiYq0Rp7NqhzXmpGTMqA6NJ0AUz527u45e9D4
         hkAgnP/h7/JjSwrf+wXFFR8wAuZ7NzNrvOg5E89wgiPrNSMWb8e43SgPKT1wMy0E40v3
         H9K6h8xZ/+tyYsWwla6IE5I+qtcS3I+Yo0GZD4yR4mrUNpdVPiPg2fxA03qjR5W1Q9ht
         CLCkNZ0Wf4W5h+FcoqSpt7OGkKgXNrL1Kr+9Ud4gdXpnixFiSgmmhETawavMMx9EFaFn
         zslA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764534919; x=1765139719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tALSMGue9jsIHZGY2fXM0uj7qtmBCt466L7eDoG2XvI=;
        b=qZnEhQRAvOOW3ljXfByGSfMbMv/xGBqc/llHWnBInTS8zymhBT7jkEKiffOT8w83M5
         ozhIe+6UtFUOjEbh9vujg8X+cW2OGnlWA1LZGWqbGGWdKax1TCBqAQ0tCaQPCuLqlg6b
         OtwUN/sOhKRXrUT8foHx9rnzGxyNpzOf0ooqE4GuQrTcC0iF+X7WeUlJh0A6J1rm99ZD
         f/CxFGUSNKQO6AxRrGGptuVm+R1bcXtrQLZSDMusVbKZiE7MkImFQhAvR5JpavzOU2jb
         tyIHFtbqSpA6N7+gPNac+oYbB2Av3P9IDQVt1dLSO9V1Pmt/PIaGD/8SROkog+N+L0am
         XaQg==
X-Gm-Message-State: AOJu0YzuEKwsIIEwyGaTfYJIeyaa6D8IyRWYcix9FWsChGrPjjH6nmen
	Pq0A/q4DGllpN9aVm7asb0vNfIcEDOeGMd8B3aay45KkduTaoNMiNCiu4VD48A==
X-Gm-Gg: ASbGncsSOpzNus43tEYIIbtDSQVnLecheg1e7t0PuQ5b5x3NvwAA3StOzJBDgKsuO/f
	wXFLspUCbuPu2V6NE3r8Ru8WE7TOSlbG7zAZCIEwhibOM4chtSl06BIQubVLntBFoUyC3Z0UDrV
	pUgB3H75dhHQnwWmkbyVcd4CQEkfJAWL4DRZ8auvw1leCPo1nKgQynGGqMDHdMexiLiJgVf4w62
	rtG4smBvaFbkloSGM5JfrtK8iAKZNX8DFWtyVNBjxlFdMCAdUmPdiePjG2X1N7az2YQ+uskO6U2
	IxWiznbn029BqJYX2aNwrWgKkDTO1AOsWZ1vQ3z4eapKP7l0lmW4K/CBLf62V4aUl6BjG9Zi4O4
	vWLjZToy7zbHBPJK8skQ73WT59ml/POnwNDkITBuuLO3x46wyUgspnNTyqSXr7XI0Nj3zlOrDzZ
	rSK6a7tefp7pRHW7hFcRA=
X-Google-Smtp-Source: AGHT+IEZXkkSMwNJF50SvLo/KIGtKibIFj6yuFoGAllHgI5x8nR3dPCULCGV00gr4qo604LjZTfcVA==
X-Received: by 2002:a05:600c:3ba7:b0:46e:59bd:f7e2 with SMTP id 5b1f17b1804b1-477c05139c2mr460705805e9.11.1764534918717;
        Sun, 30 Nov 2025 12:35:18 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1ca8bae9sm21338810f8f.33.2025.11.30.12.35.18
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Nov 2025 12:35:18 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 5/8] redis: ignore CVE-2022-0543
Date: Sun, 30 Nov 2025 21:35:08 +0100
Message-ID: <20251130203511.462501-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251130203511.462501-1-skandigraun@gmail.com>
References: <20251130203511.462501-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 30 Nov 2025 20:35:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122185

Details: https://nvd.nist.gov/vuln/detail/CVE-2022-0543

The issue is specific to the version packaged by Debian, it can be ignored.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-extended/redis/redis_6.2.21.bb | 2 ++
 meta-oe/recipes-extended/redis/redis_7.2.12.bb | 1 +
 2 files changed, 3 insertions(+)

diff --git a/meta-oe/recipes-extended/redis/redis_6.2.21.bb b/meta-oe/recipes-extended/redis/redis_6.2.21.bb
index e0bf92b210..efa8677e76 100644
--- a/meta-oe/recipes-extended/redis/redis_6.2.21.bb
+++ b/meta-oe/recipes-extended/redis/redis_6.2.21.bb
@@ -65,3 +65,5 @@ INITSCRIPT_NAME = "redis-server"
 INITSCRIPT_PARAMS = "defaults 87"
 
 SYSTEMD_SERVICE:${PN} = "redis.service"
+
+CVE_STATUS[CVE-2022-0543] = "not-applicable-config: the vulnerability is not present in upstream, only in Debian-packaged versions"
diff --git a/meta-oe/recipes-extended/redis/redis_7.2.12.bb b/meta-oe/recipes-extended/redis/redis_7.2.12.bb
index bc60f75b01..cd2be6f27e 100644
--- a/meta-oe/recipes-extended/redis/redis_7.2.12.bb
+++ b/meta-oe/recipes-extended/redis/redis_7.2.12.bb
@@ -70,3 +70,4 @@ INITSCRIPT_PARAMS = "defaults 87"
 SYSTEMD_SERVICE:${PN} = "redis.service"
 
 CVE_STATUS[CVE-2022-3734] = "not-applicable-platform: CVE only applies for Windows."
+CVE_STATUS[CVE-2022-0543] = "not-applicable-config: the vulnerability is not present in upstream, only in Debian-packaged versions"

