Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC031D35E43
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:55:16 +0000 (UTC)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
 by mx.groups.io with SMTP id smtpd.web10.27902.1730831956389516318
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:39:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EgUkhlwI;
 spf=pass (domain: gmail.com, ip: 209.85.219.171, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e2974743675so4939905276.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 10:39:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730831955; x=1731436755; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jH9OcWh9WHiWBJXSc3lpQ8jKlWz4kq97nTkq6sLoiuc=;
        b=EgUkhlwIQWNmTeK7scW9nAzXvzmGJt6Ra42MFfD7UKeCmjFL0dWa+0Xz+kTQrPILim
         DmnwxTP1vu0FoHqA74fmnEVuChrvyE6ne1xnt+/1aC+Po+XbQ2zFin81NY5EP+zMhzMY
         Y/5gXJn/t3lHUtwKO8OTIYuhVEPbpmcNEiw1AmmGfObYGvroUgidt7tgFeP3arN2cHan
         luysrAILPRNIc0+B47XOCYhcd+V14vxARahPaftt6ideiGOUieDR19SL32jQQmECYcU5
         ZNUWLuoDcmXkSE61lRPtDUiCfEWW6BJSvB8NAXsV75lVYMUZmRgIADBMMYoVRel+X8/F
         tipw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730831955; x=1731436755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jH9OcWh9WHiWBJXSc3lpQ8jKlWz4kq97nTkq6sLoiuc=;
        b=U7Xap5OQeKYVia5O0ffoLza+OcUbiET6d1/YdPcKU2ySFlvnZ6GjBqfUztovUjum9D
         QNpoWwnKvFL9Bt0EJfyho96pRd3P2S8Xxb9Z479qmvDL+z7iwfK8FQZkqC1abtSrMBp/
         qIyAv2aBY2elZgE9tpIbV0YQkTHDVA7AK5qsmbNfEwNrrH1Cin+/B66rpftTEI9YEJoW
         QkuBaHLac+1gG29goZyUpgXq8Kj88sVrrjIP6qsthl+u+6FivExaztJQeWOB8txCfe6m
         xqPdtn+f5Qjh4EH+jbALlOnLtwvF/IUaE/XhyXxnV87S9IV3yRgNMwS98QyInMaT0UH3
         yFWw==
X-Gm-Message-State: AOJu0Yy/rlDSOICBTYczVHW4J3wM+DPY4iI9tJZOllGHWRvgLExws4Ss
	Svw5O/PssbMqbe5/TDFVVQvMP4c+Wy0Nrc43Eg8MPmvxJJOKqKirdfZakvkM
X-Google-Smtp-Source: AGHT+IEWYiq/WW1dM2wz78mKRctTaE8owMCJuXQzBOa9wJn3F55m4rNB+AEQaYewglRRC0X0sqZu4g==
X-Received: by 2002:a05:690c:338c:b0:6ea:8bd9:6b12 with SMTP id 00721157ae682-6ea8bd973a6mr89482667b3.19.1730831955049;
        Tue, 05 Nov 2024 10:39:15 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c48b6esm23957617b3.103.2024.11.05.10.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:39:14 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-oe][PATCH 094/161] font-adobe-100dpi: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 13:26:10 -0500
Message-ID: <20241105183658.34982-96-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105183658.34982-2-schonm@gmail.com>
References: <20241105183658.34982-2-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 18:55:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113609

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-graphics/xorg-font/font-adobe-100dpi_1.0.3.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/xorg-font/font-adobe-100dpi_1.0.3.bb b/meta-oe/recipes-graphics/xorg-font/font-adobe-100dpi_1.0.3.bb
index 36f05b727..52d5892c1 100644
--- a/meta-oe/recipes-graphics/xorg-font/font-adobe-100dpi_1.0.3.bb
+++ b/meta-oe/recipes-graphics/xorg-font/font-adobe-100dpi_1.0.3.bb
@@ -16,5 +16,4 @@ inherit features_check
 # depends on bdftopcf-native -> virtual/libx11
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[md5sum] = "1347c3031b74c9e91dc4dfa53b12f143"
 SRC_URI[sha256sum] = "b2c08433eab5cb202470aa9f779efefce8d9cab2534f34f3aa4a31d05671c054"
-- 
2.43.0


