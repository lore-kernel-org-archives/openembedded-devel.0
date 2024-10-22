Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D7E9CDD0CB
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 18:21:21 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.web11.21770.1729612079395936881
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Oct 2024 08:47:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Rxui3vj7;
 spf=pass (domain: gmail.com, ip: 209.85.128.173, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6e38fa1f82fso54601747b3.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 08:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729612078; x=1730216878; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rw5oXXQSgha89auv72hBkBw+39wVdXdlIXY909xEbLM=;
        b=Rxui3vj7/WnvYedWS5KjX890pgxO0lO1pEof1u9AzbHkOD1Td06wHXgJmi0ajqXur5
         4M7PwzlSDPjyf4JROEHC4k0SLFmlbn96CFHlJ4kZK/zQt5dL+40riZUX4ObILm/yJKxy
         IXuzD7kYTc1yOnjKzvthLEEiEz/at+hyDtTK31GZwWveExF+fhi5gVhrffNhHFVLjwXI
         UcNMfWAjn62hUBCWGcNyIVOx79ju7HxSE+WDaYZ68t9/J5Nw9ZAWHqCSWvIXEC5KKgEK
         0jhMfugvYLchYRSF1ZpDq/j/Vf+Uq1vFsWDw6YZUU1KSG6UPQO9vhEd1AZlWMWbsYu9Y
         tB0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729612078; x=1730216878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rw5oXXQSgha89auv72hBkBw+39wVdXdlIXY909xEbLM=;
        b=i7Vw7pUskIEsybZSHJKAkjuUIY4qtGX8Ul8V5K3rCIt+cQnvDa74jFXfFsoaNnycx8
         +JaMJa2PNfOr7tkXyv9XpNXTQ52wb7MDpIHagdsTKtULV6Q80kWqrX23UtChamq5USpD
         5tFmNy2fu7UBXHKroE2T4TqCRYJf/EsQnHrJCYrkcO9Z3NI05ICW+kgIQIRAJe/qXm+1
         MkeG+C4B67WmX+jsrbCjbtrH/A9Uoa59jpqdgg2uEiPgzOWOd0w/FAH/VzsMfQaHBTtp
         JTMXF3WQD6fLjkOSzVD3Dx2GmdIekK2/10Ji6yxx1llwdTh08z+HO34cYov2qyuSvkqN
         ZguA==
X-Gm-Message-State: AOJu0YwWvTOd/Il4mifpa+K0hnz7ecrLiZLNdfx7Ocg41dynO4Tfozuu
	13KAIHvWLS9/ikBwBDGXcwoxfUC804Cpk3oLb+bj7WBZBtSo0BiVOSxB5A==
X-Google-Smtp-Source: AGHT+IFGiQQmGzJcDQygyOb8YjloIoVBC216TwtNZI19+i/JlkiZ4Q5+O5MzILjX2S5Pd4t2mXHxzQ==
X-Received: by 2002:a05:690c:f93:b0:6e3:21a9:d3c4 with SMTP id 00721157ae682-6e5bfbecf81mr147051567b3.1.1729612078088;
        Tue, 22 Oct 2024 08:47:58 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f5d085dfsm11187407b3.123.2024.10.22.08.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 08:47:57 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 06/46] libcapture-tiny-perl: Drop unnecessary SRC_URI md5sum
Date: Tue, 22 Oct 2024 11:44:24 -0400
Message-ID: <20241022154729.20331-7-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241022154729.20331-1-schonm@gmail.com>
References: <20241022154729.20331-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 18:21:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113097

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/libcapture/libcapture-tiny-perl_0.48.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libcapture/libcapture-tiny-perl_0.48.bb b/meta-perl/recipes-perl/libcapture/libcapture-tiny-perl_0.48.bb
index a51d327a3..43d6b03f4 100644
--- a/meta-perl/recipes-perl/libcapture/libcapture-tiny-perl_0.48.bb
+++ b/meta-perl/recipes-perl/libcapture/libcapture-tiny-perl_0.48.bb
@@ -15,7 +15,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=37a4918a30ace24395020e5b8c03b83f"
 
 SRCNAME = "Capture-Tiny"
 SRC_URI = "${CPAN_MIRROR}/authors/id/D/DA/DAGOLDEN/${SRCNAME}-${PV}.tar.gz"
-SRC_URI[md5sum] = "f5d24083ad270f8326dd659dd83eeb54"
 SRC_URI[sha256sum] = "6c23113e87bad393308c90a207013e505f659274736638d8c79bac9c67cc3e19"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
-- 
2.43.0


