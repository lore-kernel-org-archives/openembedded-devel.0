Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E3C6D35E43
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:54:56 +0000 (UTC)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
 by mx.groups.io with SMTP id smtpd.web10.27813.1730831880185770343
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:38:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IrTKG7jr;
 spf=pass (domain: gmail.com, ip: 209.85.219.173, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e30d0d84d23so4750945276.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 10:38:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730831879; x=1731436679; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CYLOEslsoYEzRLAdFfB6AOeplJDwuuUHbOZ960bOz2g=;
        b=IrTKG7jrD6FQJkVM6WUHXgFQOr2acrqa+G4WUtrxZ1d6BlLqmQ0LMQDwrx3aYnfY7e
         Vcl+oT8fDH1QVrwaHJVB+BBLbP76gPi+PEMMYhFcScougbNSXiDWO2I2PgQlfb/5dYyc
         b9dS/9ICE6ZHsaFE8PPxj3nJ13TxIJnNYOO38RsSA8RoHRZQzbYIJGlrmi64RKH/Vn+c
         iTGkHUXsUJx3YRsHxIKh3yuO8+4o+FqbY6C/i2lbnVY0YvM7xUa5JUOWeLd+hdQO9lBl
         n5MFc1VKkkCymWeTGp4D96/UApvJ6yUiHmB0gopZ10rg1ykmwca2q1OcC1T4MU+DYiLG
         Zz/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730831879; x=1731436679;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CYLOEslsoYEzRLAdFfB6AOeplJDwuuUHbOZ960bOz2g=;
        b=LjbwUZ3XAmMtu9fSGO5AIDsJucDYxJ5JKQfmcz0F4TH27fPgrudQmkEZ4kDA/qrvfn
         +skwz+gcUm/lmlu04L/GICWO2Aay5MmNwBWjDs4chrWbMecvyVvC7S2g2R5oIaQ7RS+c
         TWNiewbzCw9abvkXdGeSraU8On2X91tUVS+wVN8JOau7z/dxJCJ3f52NyIiM/2oBuObJ
         GO53SlRLWPn0bYcIi4t07XTXoor7rd0Y8pUEZ6ECviQuacu5O3kTTayNPVTXDQTQDqEn
         A0QEqs+vOgCR8xb9yKNXb/ISMJO2ol1ejrimdK7MTId9S+2k+8/FIP8HZcQGWUb8mZOx
         yEBQ==
X-Gm-Message-State: AOJu0YxutECS2hhgtnssJrQYScYFnWJIl+2Hq3WEmaKYUb58vNy7zp7g
	0tCmmT6sG3wzOLSbE1F7lbt3lNFLIcFoWLh/DULwEfbWiyc34zznh6kZUlvp
X-Google-Smtp-Source: AGHT+IFPBFOtEwfLuuYnCvaF93Jdg+GGaLUP25bJbJTRwrHqvtZWeZHO9GvlQeA5eKKGPExFI3XlhQ==
X-Received: by 2002:a05:690c:39d:b0:6e7:de90:3142 with SMTP id 00721157ae682-6e9d8b002e7mr314686197b3.29.1730831878711;
        Tue, 05 Nov 2024 10:37:58 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c48b6esm23957617b3.103.2024.11.05.10.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:37:58 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-oe][PATCH 002/161] bonnie++: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 13:24:38 -0500
Message-ID: <20241105183658.34982-4-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105183658.34982-2-schonm@gmail.com>
References: <20241105183658.34982-2-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 18:54:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113517

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-benchmark/bonnie/bonnie++_1.04.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-benchmark/bonnie/bonnie++_1.04.bb b/meta-oe/recipes-benchmark/bonnie/bonnie++_1.04.bb
index c305aadd0..c70f8a9ef 100644
--- a/meta-oe/recipes-benchmark/bonnie/bonnie++_1.04.bb
+++ b/meta-oe/recipes-benchmark/bonnie/bonnie++_1.04.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM = "file://copyright.txt;md5=cd4dde95a6b9d122f0a9150ae9cc3ee0"
 
 SRC_URI = "http://www.coker.com.au/bonnie++/${BPN}_${PV}.tgz \
 "
-SRC_URI[md5sum] = "1414aab86e2db1b4691bd4be82031012"
 SRC_URI[sha256sum] = "507bd2ce5360c7c98b91b0fdc2bed5c9320b5c9699f7d4a3d1c86b256896c15e"
 
 inherit autotools-brokensep
-- 
2.43.0


