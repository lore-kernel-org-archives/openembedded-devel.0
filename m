Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67AC6D35E56
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:55:06 +0000 (UTC)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
 by mx.groups.io with SMTP id smtpd.web10.27858.1730831918247307871
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:38:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=G29m9mJ/;
 spf=pass (domain: gmail.com, ip: 209.85.219.176, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e30d0d84d23so4751520276.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 10:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730831917; x=1731436717; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6zbW7v//wiQ6BQ1FfWJUnHcA+Yk+DUA9IPyWd5bz64A=;
        b=G29m9mJ/esQWczinuthmpIaG83uzKLDYY62pItdRqw4Uf+o7EO037l0oD0MjE4ZsGN
         XuuXbBwKQityZEWF0ZX3DAYUaIUT1z+y8S5lLW7vLWiduP/yvof5qJByrJQ18NOOxEdC
         assQVElCxdiN1WRVc+wF7o4lkhbWU+oN6ox1T3S0GYie71CyI4kW5bS0xgabCb9bABkU
         lRN+BWKwVE9Fi0fvygB12JGnxYSIxM7POyAZn/P1HSxLzHw/F9wpan+Knz2Zj0HRw9Ew
         BAEYW+5YvsaIB2GifgETuB3omIx3yjFd0ZjXEUMLgBW0fat8lRNeii+v1Nh0MjVBew+S
         Fczg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730831917; x=1731436717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6zbW7v//wiQ6BQ1FfWJUnHcA+Yk+DUA9IPyWd5bz64A=;
        b=VpAfyB3h/mWHTbwGgkB9kY9lXtBxm0vV5MusEecT+W/5wY0LkHnxxGCRIpK8SgafAy
         pEfV+ec5P+BJbEMIEL5y5DyNO0xEC/mTBjqv7Q1VBEbVwjCMzuGhfoo1oM6HDAtVWzxO
         xpKN2t/mmXhBBEbk0rdB8TX7yb9W7qghBTr1rsqzy3gTMXri1G0ka6n30TDogPOoI67M
         l/H3sPaLOxeJSsbt9QTaaTkX9en8KU290YJoV1Pie31pZcNd+SyIHMGICz8dLTNii/+Z
         QkrB66FDc8Jr7fqElpbjNjcGtkHNXRo2EIxgqZ1nxoNZrolUdzvqyyj6qwMUM4ILMFW9
         9jZQ==
X-Gm-Message-State: AOJu0YzJ/VOHIc23LljET8C6QhvPnIk0v3Ui0gKKQEDAb8dQqDnQeiTP
	IOc87lr9rrN/Vo0ZHcmoxDveLVBD7OofAthKIoHxWHcBYAECa//oku/KTNmp
X-Google-Smtp-Source: AGHT+IH6MW0CAHVEUlEQl8GOK/MzApS1nrV/pEPMhATOdAWN1jx2chhKrU78szwXbyXcox/AA/szvw==
X-Received: by 2002:a05:690c:91:b0:6e7:e493:2da8 with SMTP id 00721157ae682-6e9d8b002a0mr317714787b3.36.1730831916909;
        Tue, 05 Nov 2024 10:38:36 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c48b6esm23957617b3.103.2024.11.05.10.38.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:38:36 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-oe][PATCH 046/161] liblogging: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 13:25:22 -0500
Message-ID: <20241105183658.34982-48-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105183658.34982-2-schonm@gmail.com>
References: <20241105183658.34982-2-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 18:55:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113561

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-extended/liblogging/liblogging_1.0.6.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-extended/liblogging/liblogging_1.0.6.bb b/meta-oe/recipes-extended/liblogging/liblogging_1.0.6.bb
index 5c1c15159..1b7f95d57 100644
--- a/meta-oe/recipes-extended/liblogging/liblogging_1.0.6.bb
+++ b/meta-oe/recipes-extended/liblogging/liblogging_1.0.6.bb
@@ -12,7 +12,6 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=63fe03535d83726f5655072502bef1bc"
 SRC_URI = "http://download.rsyslog.com/${BPN}/${BPN}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "f215c7e7ac6cfd1f5dabdba08c522b29"
 SRC_URI[sha256sum] = "338c6174e5c8652eaa34f956be3451f7491a4416ab489aef63151f802b00bf93"
 
 inherit autotools pkgconfig
-- 
2.43.0


