Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D88D1CCFA13
	for <webhook@archiver.kernel.org>; Fri,  1 May 2026 13:51:37 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14874.1777643492411343308
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 May 2026 06:51:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=EnmvUTrr;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.218.42, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ba6553dc720so26474566b.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 01 May 2026 06:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1777643491; x=1778248291; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MrPXZOD+SbLl2ctQYUwesbPUb+4EKZRaM+L4d/CReM0=;
        b=EnmvUTrrR2Gr35sJhOyLr/VSMoPuUqN61v7sGLYnzogt2XwBFT0vN+ilhHsCIDKAb5
         MH+3P+tT94ZRNklMSiRVG37IE11kRv3RA/as2Rl/Kjw+0+zxGF/sqXh28znzPDjkR8ll
         qFf9UWuoAaq9XxoRO9eUe/ns3VXhfM5hKiLi4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777643491; x=1778248291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MrPXZOD+SbLl2ctQYUwesbPUb+4EKZRaM+L4d/CReM0=;
        b=ALBLrXNBEFVpMpI2KJLd3VzDkiif1UfNMi25gdpliuhVh7u/wGS+/Tk94ilG+OTjOW
         P0eylf1lPV/DFgVsWjPJsaSv944lSVDn6UabCmbOVkAYTwvb9EwX9KAx2CdAg8E6WpKN
         Tfk9YNGg5SInBcyOFAq86xYQzKBFCB6gbhiJQaWywZKjcDsZXDvgcYPoHlNlJ608iwbX
         dbrFZiFAiF7LcgvNexbZe8IgGib+MQhLaetvbVM16GdwP37SLglsaaNlze3IxvtmZ1QL
         26dPPCH/gx8HnKeOkndCf0xJuJ/43PXZ5F6Aig6nkt9Xx4F01dGY2DidaDeg4C+FQM62
         0viQ==
X-Gm-Message-State: AOJu0YyCiAbvcLnT2rFGLJIaEIkFb3sVZGj8yuNAJN76KYZZ2kEhgKVg
	uUfByvrC0zSTNoIjewn64wYBN7wbCffxX8XzesD/fY5dd4va11aYtbZpLEn/3ft9NSRfyt0VB1S
	kjTAz
X-Gm-Gg: AeBDieuID/qDbFKXOLqQ75GtW3/4S70lgbI/KfRi5eACVCvQ/5wm43ycketjFMn/inS
	iTp4HNNZzYbQ5uOm29nlxMaslSwK+vq+l9gcqcW40oVBlEc7/tNxgfHWzGfFD7qQ4Yl2ztrvmet
	hRfmi9zNYTGCvCHK7HcnGvaVfwUdDtz0q1Z/DddAXu0S2G3BwoyW6oDyZ0DqA5fzSRFOWqf+EHZ
	5QLwfVxucVSfz1jh+qbu5Q+JqB8NK+sZRUXXrkiDdoxDV7z6b3PDykZB+so7WE8QcZ2pEsLTXI9
	ZzyzJE0oLGsHI0zzkmVbxo2ou1uAy44xGiOCsZjmTHegQt0s2awvbZ8qZBdzEwmjmCx8FpDg2lr
	36vMswXiVxh8Z5Bl0pshZBZBD8y/CsvXr6vH5OaU/GETNRyAgAxioDwIcYo9Tp9AwIaOaNu1VnP
	V17XNvBpntW8iiRfhuc2k93jKbbUCiNPF0zIHuWr9bamaza0pWtUMtN5BU0NVMqjxzr4BJJLREx
	OoLzGl2+pcCT9T63d+sYc/SfARj9Nm9WSkB+RXJ9hzFCbL+ccWh6Z4JhmFWPH7jvRnpPjxxiri8
X-Received: by 2002:a17:907:748:b0:b9c:131b:b011 with SMTP id a640c23a62f3a-bbac7396a64mr181659266b.8.1777643490553;
        Fri, 01 May 2026 06:51:30 -0700 (PDT)
Received: from adam.tail032493.ts.net (2001-1c00-8183-9900-dfb4-52e9-0b83-429b.cable.dynamic.v6.ziggo.nl. [2001:1c00:8183:9900:dfb4:52e9:b83:429b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bbe6d06947fsm109196666b.37.2026.05.01.06.51.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 06:51:30 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-devel@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH 2/2] kmscon: upgrade 9.3.3 -> 9.3.5
Date: Fri,  1 May 2026 15:51:25 +0200
Message-ID: <20260501135126.1386185-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260501135126.1386185-1-adam.duskett@amarulasolutions.com>
References: <20260501135126.1386185-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 01 May 2026 13:51:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126761

Changelog:
https://github.com/kmscon/kmscon/releases/tag/v9.3.5
Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 .../kmscon/{kmscon_9.3.3.bb => kmscon_9.3.5.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/kmscon/{kmscon_9.3.3.bb => kmscon_9.3.5.bb} (97%)

diff --git a/meta-oe/recipes-graphics/kmscon/kmscon_9.3.3.bb b/meta-oe/recipes-graphics/kmscon/kmscon_9.3.5.bb
similarity index 97%
rename from meta-oe/recipes-graphics/kmscon/kmscon_9.3.3.bb
rename to meta-oe/recipes-graphics/kmscon/kmscon_9.3.5.bb
index 46550bb6d1..b730faf414 100644
--- a/meta-oe/recipes-graphics/kmscon/kmscon_9.3.3.bb
+++ b/meta-oe/recipes-graphics/kmscon/kmscon_9.3.5.bb
@@ -21,7 +21,7 @@ DEPENDS = "\
 "
 
 SRC_URI = "git://github.com/kmscon/kmscon;protocol=https;branch=main;tag=v${PV}"
-SRCREV = "03e50c7db0489daaa41b5f62946fd6aaeab63a6e"
+SRCREV = "a8832afb1dcca5bb4c0476d4c13c7239fecbd93a"
 
 inherit meson pkgconfig systemd
 
-- 
2.54.0


