Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEBEFD40CE3
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 22:57:59 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web11.30343.1730838785201801752
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 12:33:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MM/rs4YB;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6e330b7752cso1524237b3.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 12:33:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730838784; x=1731443584; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zAF7MKcEYZWTu4+De/3C9z9pCPXOZBcqt/95JKwJjKc=;
        b=MM/rs4YBSzBh3eabVne5BvKTlp6BEJN7Xph2QjRQPqInR0D8zeo3Wcn9g1DriX27Ot
         65fP466i4PibOmpq0I+UhE4ubk5avUbqa7KlWwm+hxZiX/TZOXKqq9CQqmIfbFjuVa3N
         AvFc3D/fwOBqjiwKxvoulOIJBH4cjbMFUEbNrgwlzbJF7pk/KK5X6MQgG5sohktkYA1C
         0aQ5T1GRDOWocwmnPEaXZu7CCveH/GySiDtrJi2+A6PEMVl+KrBmQq9H9Y/UDKb5iQeU
         5SoGBRIwwgIvEJzkTHj+rRSSWYJZ/fXT+c0Stij+d9/fTl8Aha/dPgx2X6kUDVvJiNAP
         PahA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730838784; x=1731443584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zAF7MKcEYZWTu4+De/3C9z9pCPXOZBcqt/95JKwJjKc=;
        b=rafgNzmZSQR30y8zCMYlO7ulPP5I6yJ+E8qTmPRoOlGId3oJoi/JoVDn/sP8NqmeHN
         kwh2e11RaL+z264qJPWJQEjRZMAI4l9/9vhJpKY+nWXmACJrLlRVQOKk2FzTG+RFTBr8
         b/R3d7VU8vVpFHFEn/1rUUuilcjOaMVpl+ohaBI/KwlDpl++jfUVA2FOVtjB5yDS2SkJ
         duMv3XqhPZhbrPPIUfHrAMwRlO0YVNHo/38Coo4Cpk54VzfM9hj0CR+dFWRDXOX1EYRr
         5LT9XAM686Y2rQGnaHbHrrCd8sY5k1LEH8EC8UXsYfWW8zeu7CroR2Egtg6QjKefGbZX
         vkOw==
X-Gm-Message-State: AOJu0YyOhpqnBeB29uSIWCfpjQJbVI6/vP/+VfVtvYyH8r26R3jJzA9L
	5HmrwhBFAe1nBE1FNlmfUazTZ2zelZtTSRzROxedPCbguWgN+09wGFDNv+ku
X-Google-Smtp-Source: AGHT+IGIXASeFCQ6P2RzPZ/+Sp10oA2iHHvD+wdzZ35thIDwSJL08pqU4NRcPqnGEwoHqjQn2LYE8w==
X-Received: by 2002:a05:690c:7482:b0:6dd:f81a:80fb with SMTP id 00721157ae682-6ea557df57amr177264797b3.1.1730838783876;
        Tue, 05 Nov 2024 12:33:03 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55ac9d34sm24295827b3.15.2024.11.05.12.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 12:33:03 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH 114/161] atop: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 15:27:39 -0500
Message-ID: <20241105202827.3104-114-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105202827.3104-108-schonm@gmail.com>
References: <20241105202827.3104-108-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 22:57:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113631

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-support/atop/atop_2.4.0.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-support/atop/atop_2.4.0.bb b/meta-oe/recipes-support/atop/atop_2.4.0.bb
index df45eede2..2ff5a4d74 100644
--- a/meta-oe/recipes-support/atop/atop_2.4.0.bb
+++ b/meta-oe/recipes-support/atop/atop_2.4.0.bb
@@ -21,7 +21,6 @@ SRC_URI = "http://www.atoptool.nl/download/${BP}.tar.gz \
            file://sysvinit-implement-status.patch \
            file://0001-atop.daily-atop.init-atop-pm.sh-Avoid-using-bash.patch \
            "
-SRC_URI[md5sum] = "1077da884ed94f2bc3c81ac3ab970436"
 SRC_URI[sha256sum] = "be1c010a77086b7d98376fce96514afcd73c3f20a8d1fe01520899ff69a73d69"
 
 UPSTREAM_CHECK_URI = "https://atoptool.nl/downloadatop.php"
-- 
2.43.0


