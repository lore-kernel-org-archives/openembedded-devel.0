Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FFB5E69162
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 19:50:05 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.87327.1766433002941282772
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Dec 2025 11:50:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DTLGsNlM;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-477b91680f8so36363635e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 22 Dec 2025 11:50:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766433001; x=1767037801; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x/t9nDyCMpyg7Z5YHF5MERDuCZ9DRWNftnurVJPbbdE=;
        b=DTLGsNlMlKoSN2RQO9X5IxzsdeFmlWnLZAtBJaAF8uAegwaBD/mrqzJwjvuHRPQPqt
         j9WEk4tKnPnhNTOoKaVKZYhnoHlUaRKLPFzmw3/EWePL9xxA+ypbXukG+5/pD6yuFuvl
         mQbyNfqZoZ/mOhMni8AeI7C53aKTVrADd4ZZPV1qLAfDSJdNR8x1rOBeIOsdZg/zxv6h
         q7lKWBH5Fe2T5Ca1jV7LO+rSdgC5CNc88YolY0sM9mdQO+yZZE1be62rfOqD3SrQB0SH
         L5wRiQ/iwiHUqtlXyln0E+RrbCuqnilrO2WCw1ECE51sWRQM5enb+H/oKXNaEkbAl6sG
         +1AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766433001; x=1767037801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=x/t9nDyCMpyg7Z5YHF5MERDuCZ9DRWNftnurVJPbbdE=;
        b=ItV1+XSZTdw02jRV8VP5vW32jXBsEdoJiYDbdqK/VaHVhyjFZ2sr+GZXWSomns51nc
         t7WWr7namahIBdgxXBAhSsZVzVERaB6814/SZeulQp5YnmTs6qgGlgFvcosO4wXk3wyJ
         z6jZ60xGFQY5KcRywQ6/cOnNSDIniR1FNfy1u3+qB1JjaXgoyvGv+IUK4aiCl99QO0Tv
         Q/kQCrfYWkWmf8KxHRJG5SvZqVhxooxruXZa1gKzkzSzAYcYDxU9NdYZxzb9OqdB6OwO
         714P1MbhZbL7cV+nX6VjtqtclFlIitRmTF6rRfTwgybfu3POUA7BVqA53iQaPM9h/cco
         oeyw==
X-Gm-Message-State: AOJu0YyAZZhuoez/mc6KWe3s8nVhvPI6iWzhvLNDB/0VusjiP734/SMU
	+JXcBzq5UDw7VEHBNBHz8aEMxg7ZfVd8E6zMO59cTP1VtALLWpISgkGqqgDteg==
X-Gm-Gg: AY/fxX4vbgzM0F3uDz9tXVdZ3eMaXTz4bEo4SCEh7T62A6Pdcgy3XJ8CKzPDApqqL1L
	FKTuEZYkKX0QEGR1iUHeZQF/Fxjmba29iRmOCGhU/R91H/rL+TBCh+tdaQO9JwhsShj4NFfps+K
	3qi+H06pNydp+hUEY4dzX7/m2+coTc9UbZst/rZH5XH8Zvr2LPA/CN/6fBosWGyktRdZ1KADzAN
	n9pizqS9a8qWoixmZJxq42put4eYnOj3SMk+cDOfSFH45/VkQw5htfY604VVolY95pPc7sg0PTj
	SHnioMkEhXi+g1Y9yTvDhU4a1ZsAbpZiwHOEnHuijbP07sJkNvBgnHo03t/0KwKxL9H9RUj8IN5
	RndltMz7eccbyVCzQRBlJvRVjq30vYgSM4wILLTN/lnJ9l/li1T5+GzBS4BwWHXr5tLcTk3WVcF
	NDAwbH+Rfz
X-Google-Smtp-Source: AGHT+IHp4Ab6zGNzb/Au0jlrQED8R4x3m6lpOnMiHEsqBrGW8pJN1PVMhsugtvOSu5yaW0sLMP7MCg==
X-Received: by 2002:a05:600c:45c8:b0:477:7c45:87b2 with SMTP id 5b1f17b1804b1-47d195843e7mr122085875e9.16.1766433001251;
        Mon, 22 Dec 2025 11:50:01 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be3a6c9d4sm104078035e9.3.2025.12.22.11.50.00
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 11:50:00 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][whinlatter][PATCH 2/3] accountservice: ignore CVE-2023-3297
Date: Mon, 22 Dec 2025 20:49:58 +0100
Message-ID: <20251222194959.1725672-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251222194959.1725672-1-skandigraun@gmail.com>
References: <20251222194959.1725672-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Dec 2025 19:50:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122805

Details: https://nvd.nist.gov/vuln/detail/CVE-2023-3297

The vulnerability is triggered by a patch added by Ubuntu, and the vulnerable patch is
not present in the recipe.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 071a45c9d76c9a222c8fbaa50089a8af44f44e74)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-support/accountsservice/accountsservice_23.13.9.bb  | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-gnome/recipes-support/accountsservice/accountsservice_23.13.9.bb b/meta-gnome/recipes-support/accountsservice/accountsservice_23.13.9.bb
index e3dfcfffff..c024ae3f92 100644
--- a/meta-gnome/recipes-support/accountsservice/accountsservice_23.13.9.bb
+++ b/meta-gnome/recipes-support/accountsservice/accountsservice_23.13.9.bb
@@ -41,3 +41,5 @@ FILES:${PN} += " \
     ${datadir}/dbus-1 \
     ${datadir}/polkit-1 \
 "
+
+CVE_STATUS[CVE-2023-3297] = "not-applicable-platform: The vulnerability is Ubuntu specific"

