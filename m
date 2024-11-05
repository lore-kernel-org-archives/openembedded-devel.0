Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C09B1D2B93D
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 14:36:49 +0000 (UTC)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
 by mx.groups.io with SMTP id smtpd.web10.19586.1730817405810188375
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 06:36:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hJE4QHZI;
 spf=pass (domain: gmail.com, ip: 209.85.219.172, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e28fd83b5bbso5912100276.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 06:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730817405; x=1731422205; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xDpQlQcc6WNlgMAf8W2uXfBe1FW4qQmH1P55Bo+Zk3k=;
        b=hJE4QHZIzxFIQPdwDq0bNZ85lXc/tEX0S5vdsI0Xsjw2At9IRYxpkCSwCQebGn1y1I
         90i/xrU7l/HS1JwsaoRxx5e/ceZvvu9PVGJgbQs5Ox88EIyHSLXxp69fBwTYAP8aBn2H
         GnvXOEFCvd47RJ6KSprO6E0xW3452fYAGl4Hc94T01Py4J1TXpB7HI7IydbC6JGwqEKU
         Q9CmI8x1N9jQC3aKCEpx8VagpNdZsK4OZO+uFnTpaqFHxonZD+A4jLe5qj8ExeC3ub1A
         vsjOEIvxchbAREGYLOWOigDB+T4RQM6v38w8zWnVe0wVpoZLBlySSEaBNw0Ec4/g4duq
         XyGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817405; x=1731422205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xDpQlQcc6WNlgMAf8W2uXfBe1FW4qQmH1P55Bo+Zk3k=;
        b=LGD8qprs6x8Pad8fkd+ZoR++tS8c1zXc39bwgZLGGjNMtJxktMzh56P4ucSOCDh6/q
         jvQYX+f1GE1hxz0YwiLlHJ2u653siEq0SFiwIlV9yLWDKYBBVFMDK7VCsNVyDoCIT3j/
         Q6jUASxRKqnIbVkSzZ2tHpcEwsdZbNMIZHgF1hJhPz3KE/ZjD7PmBsuLNTL6nkNZnerC
         6TFNiR/JSvMQnpEhRnmd4K7ObnDn/2sAwsmNK1/BoHHpSAfJRRCsK97Z/p0OcRy4Npip
         whcVchxeuTu7t0Or1n0xf8FjOX+dSCaC8lOUnNKlDpq1i9N+FxaMF58rcPvvZmj8tPWW
         98xg==
X-Gm-Message-State: AOJu0YzBDxhFfHyz7bl4FmBnXvMPejMAPjZ+DIbTHe4PyGrOo+Izx9uS
	fka6wLnQ+Yx6EZpgN52/v51fGQ9zjaHg6A5LecQtFNkKRtzBJB0cQlZsAg==
X-Google-Smtp-Source: AGHT+IG46ai11bd8FKFi37cRF5+9sVhydTr9uNrJESPw/Gi4nFZI5eRncEJoER6HWxUPO9mPVyJiCQ==
X-Received: by 2002:a05:690c:3810:b0:6e3:3007:249d with SMTP id 00721157ae682-6ea64b10f76mr22751297b3.25.1730817404882;
        Tue, 05 Nov 2024 06:36:44 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000::29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c8723esm22495977b3.126.2024.11.05.06.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 06:36:44 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 13/90] python3-paramiko: upgrade 3.4.1 -> 3.5.0
Date: Tue,  5 Nov 2024 09:34:38 -0500
Message-ID: <20241105143638.2301245-14-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105143638.2301245-1-akuster808@gmail.com>
References: <20241105143638.2301245-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 14:36:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113431

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Add support for AES-GCM encryption ciphers (128 and 256 bit variants).

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{python3-paramiko_3.4.1.bb => python3-paramiko_3.5.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-paramiko_3.4.1.bb => python3-paramiko_3.5.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-paramiko_3.4.1.bb b/meta-python/recipes-devtools/python/python3-paramiko_3.5.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-paramiko_3.4.1.bb
rename to meta-python/recipes-devtools/python/python3-paramiko_3.5.0.bb
index 498bb6d014..8ccf939f7a 100644
--- a/meta-python/recipes-devtools/python/python3-paramiko_3.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-paramiko_3.5.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/paramiko/paramiko/"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fd0120fc2e9f841c73ac707a30389af5"
 
-SRC_URI[sha256sum] = "8b15302870af7f6652f2e038975c1d2973f06046cb5d7d65355668b3ecbece0c"
+SRC_URI[sha256sum] = "ad11e540da4f55cedda52931f1a3f812a8238a7af7f62a60de538cd80bb28124"
 
 PYPI_PACKAGE = "paramiko"
 
-- 
2.43.0


