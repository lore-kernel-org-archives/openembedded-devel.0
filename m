Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8270D3E1B2
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 19:48:42 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.web11.30077.1729278805640624795
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Oct 2024 12:13:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ScXV4M1B;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6e1f48e7c18so20081787b3.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 12:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729278805; x=1729883605; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E6+zhN+yqF5UbNUkGW03nFVx1zAthSg0/Iiod2IbAU0=;
        b=ScXV4M1B+Q9X81vBL9KTRBbGQte7VS8N5avKvJX28GSQMcaBBWTgrqMJXkP6SWo9gg
         MR3yPDVO7ViBcGxV1EzHaQPnVIvtcbRZJrYPic55qg9ERPtsPrYksfooDDO+7ZntfiKL
         kkgcItUe/EnSY8MMnP9pikiePB5oGQBoGb76n+pNAH+KNRS0Es8DSFVwjA5ew+E5m35F
         ORmD4ccZA9VQVD8ZM3JhLzzg3WgH3Y1VUfbFtf1fDMfFGWZKfea/gR8Xp5z6bShIh8HK
         XVwZECsUC0kvUiOStpagq7D6XCL1YN8JJ4HpI9I7j10oRjJMXR6+9vGGccnx2XF0JMu6
         4Wug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729278805; x=1729883605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E6+zhN+yqF5UbNUkGW03nFVx1zAthSg0/Iiod2IbAU0=;
        b=hGE/Miiv92NN+2mOWWQFinKxej4bJOm1rVvjK0rk2mh14T5YrXnjT7tebrMj8oBm/+
         6T//CBPMWv/hLXs6WHA2KugbDm0KsPS0qXujqBON7SaSbBfLuHzxh03tzCRr3VARfZLx
         YZWmlHkwq3sOf0QnrSAgcPXJOaDUYKVKU0XenfM7fA3OUQ2vmFkO3gQCbaI3GT+iM1oo
         O+h2gFrGfCWx8n8+3wo8ZhjUE0OHjSSGLSAiC2D9m9YST1uKjTcTUTTKDYNXndmrhrvZ
         97oKmVVOhzSNBq9IuQcLsFTcqil2qchSmhJkZk6ginSNfu0VzVC2Vw3d8//sh4ac/RB+
         ELog==
X-Gm-Message-State: AOJu0YzXxUs/bjyhx83x4d8TMLoOCW3H/VZZaBBHHt1lW+tcV810rmvm
	UWmF/sUAtXMMh26E+2lwg7VkpjmrXAlf4f4EX+QLVOvNr4PTKae8hLRhSg==
X-Google-Smtp-Source: AGHT+IEarRK4QVzmw+YsuePnA1TFDDc2UxYT46DKjwSPBIMtOGRB3Ukikk+DGF81jLef7IGDh3bSyw==
X-Received: by 2002:a05:690c:ecd:b0:6e2:1467:17c0 with SMTP id 00721157ae682-6e5bf632349mr37649847b3.8.1729278803186;
        Fri, 18 Oct 2024 12:13:23 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5c00df1d2sm4280517b3.31.2024.10.18.12.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 12:13:23 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-python][PATCH 19/68] python3-flask-jsonpify: Drop unnecessary SRC_URI md5sum
Date: Fri, 18 Oct 2024 15:06:06 -0400
Message-ID: <20241018191101.25184-20-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241018191101.25184-1-schonm@gmail.com>
References: <20241018191101.25184-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 19:48:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113007

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../recipes-devtools/python/python3-flask-jsonpify_1.5.0.bb      | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-flask-jsonpify_1.5.0.bb b/meta-python/recipes-devtools/python/python3-flask-jsonpify_1.5.0.bb
index 76c6fb773..93ecf0845 100644
--- a/meta-python/recipes-devtools/python/python3-flask-jsonpify_1.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-jsonpify_1.5.0.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM = "file://README.rst;md5=bd59445a234a0c8250b39178d42e3148"
 
 PYPI_PACKAGE = "Flask-Jsonpify"
 
-SRC_URI[md5sum] = "8a10e37942c43d93d107644a3fe77d98"
 SRC_URI[sha256sum] = "8ac4c732aa5b11d9f6c2de58065d3b669f139518ca8f529bce943817e2fedbfb"
 
 inherit pypi setuptools3
-- 
2.43.0


