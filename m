Return-Path: <andreaskleist@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB387C6FA8E
	for <webhook@archiver.kernel.org>; Thu,  2 Mar 2023 13:44:49 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web11.15671.1677764685645271060
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Mar 2023 05:44:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kEQ5i4nB;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: andreaskleist@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id g3so12322757eda.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 02 Mar 2023 05:44:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677764684;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RDIPNYl1mhq2/xSDRJdmtweFNOJA/VjJdoL3o7nH2JY=;
        b=kEQ5i4nBtyqnD9NA5q6iTUOGT1UKBW08HJ/4tIo+SxFKT/tcKixEEuq/Ooky8uxTUH
         0dKCo1NBc9UAY7dPYvJkzg18PcSwSDS2crJQBCQECLWrcRRIKqB5lF4Nh0w7gZoINzsF
         kmHY6dl5/Sufsj116LeZuPAvvx7ue8ETV8sT4NRFg2Ce+Ebjn0kUe9R8dMxx3mDM6U/m
         j2JddYMY+yWUrS/CFsBILM2sEcPxzBCf+7hScWqfLL9tgPBGxkVS6xdtdzmeO8of0+hx
         EckGmQJY2JTvq96Vhl8oHX0EWMAwUTfV3M8qYsRmgcpqLFm8M5LowZmOw09J2eISvuY5
         5ANA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677764684;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RDIPNYl1mhq2/xSDRJdmtweFNOJA/VjJdoL3o7nH2JY=;
        b=fdIGuB+BYC8V7cqwVvfMCjBxkw3Rkxenc7nsGj+9zDxVlI5ggn48xFQEOh7OfpsxcJ
         OpzxNI3/RbFQGWJvWPKLn6HZwyN0kOwSMKo/ON88bohWEWnUDVrT2lo3TwdXWurEQO7m
         /keV6sa5+lRalAoVh9jCyQrWp/nM9kgpzQEbHpHkqGJNsFouxmR+hhx7AHm9gTN5qVhy
         wIUOj+5uOqKaWDAffEwJFpycPA+si+SIB57CuTQWOnoC93YPgl+GgrVKOVLG+du0LROw
         2slqnANoUWE0AmaFd2OF7HXnJ+fOY6Nb6dExVjlxjyECLCWvGWWSd4eTlc27aEM8zbio
         EkTg==
X-Gm-Message-State: AO0yUKWcUu+9oExZmRBCJr7C0qreWv6bdWUGgBACaTzIDKi5oCW1+Lsb
	xHi/QoAkkRnO6pOigYha2wfvbmIYdOc=
X-Google-Smtp-Source: AK7set//jG3e7QqkmnqMeDg5Q0FkS1t91mb3cI1AeFRZnZdDf4qZDl5piY8S80lLMUloTHBdQmI3SA==
X-Received: by 2002:a17:907:c68a:b0:87f:546d:7cb5 with SMTP id ue10-20020a170907c68a00b0087f546d7cb5mr11533342ejc.37.1677764683980;
        Thu, 02 Mar 2023 05:44:43 -0800 (PST)
Received: from localhost.localdomain ([77.243.43.130])
        by smtp.gmail.com with ESMTPSA id la14-20020a170907780e00b008bc2c2134c5sm7103469ejc.216.2023.03.02.05.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 05:44:43 -0800 (PST)
From: Andreas Helbech Kleist <andreaskleist@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Andreas Helbech Kleist <andreaskleist@gmail.com>
Subject: [meta-oe][PATCH] cli11: enable native/nativesdk builds
Date: Thu,  2 Mar 2023 14:44:41 +0100
Message-Id: <20230302134441.1816761-1-andreaskleist@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Mar 2023 13:44:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101333

Signed-off-by: Andreas Helbech Kleist <andreaskleist@gmail.com>
---
 meta-oe/recipes-support/cli11/cli11_2.3.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/cli11/cli11_2.3.2.bb b/meta-oe/recipes-support/cli11/cli11_2.3.2.bb
index 313973326d..b9ff914da4 100644
--- a/meta-oe/recipes-support/cli11/cli11_2.3.2.bb
+++ b/meta-oe/recipes-support/cli11/cli11_2.3.2.bb
@@ -23,3 +23,5 @@ inherit ptest
 
 # cli11 is a header only C++ library, so the main package will be empty.
 RDEPENDS:${PN}-dev = ""
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


