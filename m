Return-Path: <gijs.peskens@munisense.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A407AFD0655
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 08:22:19 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16096.1773217334225329502
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Mar 2026 01:22:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@munisense.com header.s=c12e0d22-ac12-44f1-aa93-b49ab5265a0e header.b=Krp9Kp7T;
 spf=pass (domain: munisense.com, ip: 209.85.218.49, mailfrom: gijs.peskens@munisense.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b972641eb96so128743966b.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Mar 2026 01:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=munisense.com; s=c12e0d22-ac12-44f1-aa93-b49ab5265a0e; t=1773217332; x=1773822132; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kxauHdrjnXz9J/2pkePwPmIFxM4X3Dh0+4OZs/1h7qs=;
        b=Krp9Kp7T1uMQbMf2O987FxtgwnuBW+hMDBVoVC2xX6DDrQv1COW3xU09Z+Rc98kOTr
         9s/Thy+ttCoYteTxPhr9JvYfYAImmMOgZQ/Voo6PvCDGNrKO8LSW+LMIhRQJJIioCuej
         VsGmRD9TXfO2cqhBbMEWr7NmYuOM1/xeIWx+/MxPfO9zXgsPqfPJu9ZvS5kKbmotoLlK
         fV2SI+tnjBH3Y8rn3ijyVdUahRPvNWc2DTP2EmBFm02HX4EmAO69tLvhXtwuK9kkZhZ6
         iZy3ESQWkp1UFwP+HS8MohluJ5Tv7McnhEILb/UKrGpZjB3aodwzW0fj6BXtEBIzDSlb
         brXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773217332; x=1773822132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kxauHdrjnXz9J/2pkePwPmIFxM4X3Dh0+4OZs/1h7qs=;
        b=O/+wzFLmEJML40yRB7oWR4ZCXsRo5aON4BUerBTyS6bv0w8sEiGnJBFJE7dXoQN2uf
         ZjoUR534FNV1AS+U49tlX98Mp4XWsVLmW8isoIy5TO8hoEK98m0Nq3v80pMEForuPSJ8
         Fy3AQgAGiUvVxp9VgxdvlIWSO4OeEe3RD9xsBmSLQWYW6BkXPgVe048A2sLbOx4Rs5Hk
         sg4UauNblRR0sT66HWFkoLDFUUBo0EAQeM+elE81/z/s0fMF7jM2vLLYEFPMqL/cXeTL
         C1PJ10l1SdtZYm+sL/c+T22leQ6f8Iq2ebvBs1h6AMH5ZRlmlZ7TRuTLy3weZnvxMybs
         7Omg==
X-Gm-Message-State: AOJu0Yy85poVtqLf99LRkTdHw5VGK5hUC1CGHWFsld4mqf6T8g2622KT
	yTrWF8J89HC5vh7csps3Zu5kANA1K/viZgfDwfhUKPaqTwMhPQ1bC3xks3hHOwsihKUN3GHOxrv
	CciH/3nQ=
X-Gm-Gg: ATEYQzxyQnDAnc/RaRZRRg/pirLRpXygAY8Qt2QgRVcZaHWVlSHmov0c1j9S6N+BQh/
	xY4t7iuWBavTqn2U8sLPiU76LaaHfD63CYMNQmQQq397sBk2jvGzOdUpQS0tCoQy/N8kJkbnVC7
	GPQ4ss/6Q9BdP//o0n9XGkhLQ+WAJzRMip2je6mpTEhB3qnxIYEZtk5DFs8nmW32D0eVYpV+L6F
	yPJyAIM0wnxdbYLum4uUYF+iqalpO0/GS9yZdpXr+NUG7gxsbkIj3wKCzgcoCWghyg3OqjS/tQz
	+StWlJ837Cqr7dtPKMYfqLfEIZIH5XkDish0g//UR2ucnJ4fX3eQI+K0BaLTSSOpJ1j8s3CYNDC
	k7lQ0yG6yNVTVaen1Ba8WxbR8mbVgpPIFIUdAieg9nsYS6F4Xe3I2oR6MSEwJa7gO0237Ib1erb
	uY7cjZcxMVx8LTIRWBV19b5R38dVawCDWeP7QG9tFTvHCOKx8awbU4AzWxEQAthahvwIUt0iM0H
	3kkEmZwvU4Z3NRk6w==
X-Received: by 2002:a17:907:6d20:b0:b93:5385:327e with SMTP id a640c23a62f3a-b972e24b4acmr85579466b.21.1773217332325;
        Wed, 11 Mar 2026 01:22:12 -0700 (PDT)
Received: from gijs-peskens-ThinkPad-E16-Gen-2.office.munisense.net ([2a00:1708:3ba6:500:f314:c4a5:a3b2:cae2])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97313230desm23993366b.26.2026.03.11.01.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 01:22:12 -0700 (PDT)
From: Gijs Peskens <gijs.peskens@munisense.com>
To: openembedded-devel@lists.openembedded.org
Cc: Gijs Peskens <gijs.peskens@munisense.com>
Subject: [meta-oe][PATCH] libssh: upgrade 0.13.3 -> 0.11.4
Date: Wed, 11 Mar 2026 09:20:35 +0100
Message-ID: <20260311082153.258506-2-gijs.peskens@munisense.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260311082153.258506-1-gijs.peskens@munisense.com>
References: <20260311082153.258506-1-gijs.peskens@munisense.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Mar 2026 08:22:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125066

Signed-off-by: Gijs Peskens <gijs.peskens@munisense.com>
---
 .../libssh/{libssh_0.11.3.bb => libssh_0.11.4.bb}              | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-oe/recipes-support/libssh/{libssh_0.11.3.bb => libssh_0.11.4.bb} (92%)

diff --git a/meta-oe/recipes-support/libssh/libssh_0.11.3.bb b/meta-oe/recipes-support/libssh/libssh_0.11.4.bb
similarity index 92%
rename from meta-oe/recipes-support/libssh/libssh_0.11.3.bb
rename to meta-oe/recipes-support/libssh/libssh_0.11.4.bb
index 5928581312..fd4631cc55 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.11.3.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.11.4.bb
@@ -13,7 +13,7 @@ SRC_URI = "git://git.libssh.org/projects/libssh.git;protocol=https;branch=stable
 
 SRC_URI:append:toolchain-clang = " file://0001-CompilerChecks.cmake-drop-Wunused-variable-flag.patch"
 
-SRCREV = "301d0e16dfa8a5cac1cff956b6880ca90eb82864"
+SRCREV = "ca9c055d7c78ce357346ac7c2b14047568d47aa1"
 
 
 inherit cmake ptest
@@ -50,3 +50,4 @@ BBCLASSEXTEND = "native nativesdk"
 
 CVE_STATUS[CVE-2025-5987] = "fixed-version: The vulnerability was fixed in 0.11.2"
 CVE_STATUS[CVE-2025-5318] = "fixed-version: The vulnerability was fixed in 0.11.2"
+CVE_STATUS[CVE-2026-3731] = "fixed-version: The vulnerability was fixed in 0.11.4"
-- 
2.43.0


