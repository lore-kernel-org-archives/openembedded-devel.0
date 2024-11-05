Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 076C1D40D03
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 22:58:10 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.web11.30395.1730838950538615227
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 12:35:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XG7RrliP;
 spf=pass (domain: gmail.com, ip: 209.85.128.171, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6e2e41bd08bso62376727b3.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 12:35:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730838949; x=1731443749; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rXewUv0iqyMnaUuWpwhZVZsyXMPxEEygrc8lz0B76fo=;
        b=XG7RrliPKbjB/qJDFSGxpKZdVKk1UeSw86C711alzrWFlEiOqXBOEF2BQwQH66PQbZ
         W+/3wn33SFBvrLG5KJ2d2yfWFmHyD4BvRIuV9Ca8ZD4y9KXnLBc3LdrcsVDEhqIwHlwv
         m04c4rkDyl+UGiW0pXAdwD1Obdu+pqjSeB3oURbNv0nQ/9A23nVSaylqXEeXpn6egQNY
         j5e7BpfztdhOVmSyH4/C137AbRE1xeoxZeiX3UxJH2yCuxknAA3BdHaXUa1NYxn098Y5
         nR6toHYHFtIFwwAs8iyIDq5ZNRwcwemLV3dKOTmH/qIxRFvkw+AQ8a13gqJtqylZWK/5
         cMQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730838949; x=1731443749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rXewUv0iqyMnaUuWpwhZVZsyXMPxEEygrc8lz0B76fo=;
        b=TQaUXiolvBLgRNCQbPB9yxOIQBBZfQuAZWfe+rGTzOFnq2zu0y4Sb4TwayeAOjS++a
         x4k09cOWZbXHvuXYVJbNhagpSQmNvJt0sHF8niu2W5+igmCew9iEoIt+IlNuQpgL5Bgm
         2VCOXPDo5kBYs89XPRTLmD1JOJ/1e5RUxqewC5VzqOww4OCTJ8bc1pMduoeOCF6P0Pfv
         tofY36yXZnwdzdVQQyRuDn4D41lQVjftRbuy9GT2IDpc0w+sJBr2BiVWlj5tP7OQJX0K
         78oBp+x+A8ZJUpE/V3odnInr1dE7JRiGEw8uNxXKpxcHOVaAycS/ueSwKDljSfIDhJ9I
         B01Q==
X-Gm-Message-State: AOJu0YxQqVmjSkraStU5YnlfoBQlrZOkj9nhJfFFvvEddelOrNZeKD13
	NXgsURpkOAWXGqM+N+27/EmZfb31QdDZUwwWq6wnIsiIxJEqq3+JQSQPMiaE
X-Google-Smtp-Source: AGHT+IGg+oyyty2f5eps1Moe0rELqVaDNwLRBEEMqgL4AiGcp+ey7vXSzWKMulxV3doTPlUaZf6tUA==
X-Received: by 2002:a05:690c:d1c:b0:6dd:c474:9cd8 with SMTP id 00721157ae682-6ea64af0eecmr171232857b3.18.1730838949308;
        Tue, 05 Nov 2024 12:35:49 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55ac9d34sm24295827b3.15.2024.11.05.12.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 12:35:49 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH 129/161] libcanberra: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 15:27:54 -0500
Message-ID: <20241105202827.3104-129-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105202827.3104-108-schonm@gmail.com>
References: <20241105202827.3104-108-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 22:58:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113646

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-support/libcanberra/libcanberra_0.30.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-support/libcanberra/libcanberra_0.30.bb b/meta-oe/recipes-support/libcanberra/libcanberra_0.30.bb
index 95c947958..b6165c4fc 100644
--- a/meta-oe/recipes-support/libcanberra/libcanberra_0.30.bb
+++ b/meta-oe/recipes-support/libcanberra/libcanberra_0.30.bb
@@ -14,7 +14,6 @@ SRC_URI = " \
     file://0001-gtk-Don-t-assume-all-GdkDisplays-are-GdkX11Displays-.patch \
     file://0001-remove-dropped-templates.patch \
 "
-SRC_URI[md5sum] = "34cb7e4430afaf6f447c4ebdb9b42072"
 SRC_URI[sha256sum] = "c2b671e67e0c288a69fc33dc1b6f1b534d07882c2aceed37004bf48c601afa72"
 
 EXTRA_OECONF = "\
-- 
2.43.0


