Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB2E1EE4982
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 15:49:13 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.66706.1767109749314168728
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Dec 2025 07:49:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PjAySMXw;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4779aa4f928so100836425e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 07:49:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767109748; x=1767714548; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g8V0Qfitm1kGlx4fDHO0E0IeWbmMt2AkWr5sm54Uwbw=;
        b=PjAySMXwn4CgTtGAkt7bhW5ZxgRlor9/Qua44uKsl8lMKfGKDqusvNxYwsIP7zCxnh
         au7r0gKE2FWASWweZ35+Z2LMA7Zb8DuEVk3RlM3LKxmhPPL/yfsu9d0O4lt7/x+1m1jJ
         nxMCgTbLzdz9YgLbkll5XSyTbSymlBcGynxb/mJ/oKwBcn+mnhln0nRTf/JxnCD31a7i
         nTvKHbtr70DVBb/8U6SSUqdj7J6uWxTPXK33BCipoaerHpFUD6p4rKwSm9IyD+/BElSy
         bQN0ZJfKBaUdaIQ5JI4felUCs2UPOz+sW3/33Yiu/FWe0QcFvCv7iPFJh5HrFIhSb6Tt
         hX+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767109748; x=1767714548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=g8V0Qfitm1kGlx4fDHO0E0IeWbmMt2AkWr5sm54Uwbw=;
        b=JIm3pZaeLkxyRo3fWSCqeYOea8NtfIxRKg3UmKjX6ugyEcHTsjfwJAwp+IUvVAgTdj
         QO6tYEYwyelMmySIoUMPwFy3tbEl4CvTU6zWZ37rVnsDXmeiAdZfkkw5YvpcdTdxLL6v
         El1IrWD4ndff4pcFCPFzT8qTwoqRQRTd+xox/aukPqMLiTCr5uHaiueS0vVMRVlFjfod
         j95uZ6EFl4V6rRiFwCn8qAiDSkiW7Ky/0sVoVAkXaCHTk+G6k23ebj126g5GyckkmBYN
         XOebE40PiJzQpQLi7geq9JpXZ8+w2NYRSoyN4G65dvVB0z2O0plntkkIaChpRAqci7uu
         Jfgw==
X-Gm-Message-State: AOJu0Yzp/HdowZD4wzkFXqic3d3OEQ+IaAyxgFmDCyfpJLThn6pmsIgH
	HenNFsy7NSL7Kfe6mb1aGJyT6WJTnIp88ucj9uuIWn/YTmJPG+7WW3VGYA4q9Q==
X-Gm-Gg: AY/fxX5/RvE6e3G6RL2RdRgQOXmBGMxQBqn4Ylw/ebFyWx9ewmCPB6APeGhFC8a2O44
	1dg1OexTbBaZVMezLknF8e6jEv38xmQ1bq6Wn2ZAkuc2eNmnHUriOA9EApN5IijAEfM9ZppdB8h
	3w1WpLxp/91sf8sSmI+j0Cq+ksYqi2G8+w03zg/RKVRIvUg2NO9bhjAYf/iofio9bKw84m8T63B
	wQzA2MZ+20lKUDsmyfFqHF5CYWbfdbg3ynjWDAKiwQYa4GxGbBJ4K1OkN1ioiZywRFg7N1b27Du
	BuuPLXJNUk4Y/t56TycpcJ8jXo5sP9GoeNFS8/RPEZU6FBlR04v3iZ1wnIPmldt4VUDSTONskBN
	8vghxX1ciZJCK6kxTNcc25gWdhISx6DMkDYrvW5uNwF2iB7Ck4WOsBNXjVmzBMKPH4mduIAf3yN
	Dd6jypODlDrQ/fJH4ybKo=
X-Google-Smtp-Source: AGHT+IEMbi6cX7SjQ+89JWAf0duITW7QoCUtHnI+2m+ihELsJ0aGnWYGKUx2zsOxsHPp+ufzamWvtQ==
X-Received: by 2002:a05:600c:46ce:b0:477:8985:4036 with SMTP id 5b1f17b1804b1-47d1953bb1emr430974535e9.1.1767109747650;
        Tue, 30 Dec 2025 07:49:07 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be3a210e7sm253051225e9.3.2025.12.30.07.49.07
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 07:49:07 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 06/10] python3-waitress: set CVE_PRODUCT
Date: Tue, 30 Dec 2025 16:48:59 +0100
Message-ID: <20251230154903.736590-6-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251230154903.736590-1-skandigraun@gmail.com>
References: <20251230154903.736590-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 15:49:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123031

The CVEs for this recipes are tracked using the agendaless:waitress CPE,
which doesn't match the default python:waitress CPE, making the cve-checker
miss relevant CVEs.

See CVE db query:
sqlite> select * from products where PRODUCT like 'waitress';
CVE-2019-16785|agendaless|waitress|||1.3.1|<=
CVE-2019-16786|agendaless|waitress|||1.3.1|<
CVE-2019-16789|agendaless|waitress|||1.4.0|<=
CVE-2019-16792|agendaless|waitress|||1.3.1|<=
CVE-2020-5236|agendaless|waitress|1.4.2|=||
CVE-2022-24761|agendaless|waitress|||2.1.1|<
CVE-2022-31015|agendaless|waitress|2.1.0|>=|2.1.2|<
CVE-2024-49768|agendaless|waitress|2.0.0|>=|3.0.1|<
CVE-2024-49769|agendaless|waitress|||3.0.1|<

Set CVE_PRODUCT accordingly.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/recipes-devtools/python/python3-waitress_3.0.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-waitress_3.0.2.bb b/meta-python/recipes-devtools/python/python3-waitress_3.0.2.bb
index b8e90807cf..c495132c59 100644
--- a/meta-python/recipes-devtools/python/python3-waitress_3.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-waitress_3.0.2.bb
@@ -6,6 +6,8 @@ SECTION = "devel/python"
 LICENSE = "ZPL-2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=78ccb3640dc841e1baecb3e27a6966b2"
 
+CVE_PRODUCT = "waitress"
+
 RDEPENDS:${PN} += " \
         python3-logging \
 "

