Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 795B5C44508
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 08:12:49 +0000 (UTC)
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.69158.1782634368888047022
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 01:12:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=J7REEVMY;
 spf=pass (domain: gmail.com, ip: 74.125.82.173, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-30e7eb50b83so778880eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 01:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634368; x=1783239168; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YsOBmMNMfZPECIoa3pYfq1sCUi7Q8nNYZW3MFqpTtE0=;
        b=J7REEVMYmd4icICE8wvu+ZgZwYc+AAvj9r7BnDNz9ife0rvoZ/O7d5FSYb3WG6QaLV
         TR8kC/i7VsgZuiBiIhpZLe/ZkHWcGoE1XUr4kGVaYKEMyjGmCxEQLhAczw+bu+Edt5ZM
         1sPZFJ0dG+N0nq1zehJ5AFsXHnALKRr8IcvoOmLyBbd5sl7wainJbVoMq8WvfPZWjjHo
         piW75aboH2tPgWNbJ6sh1A0RtjcksfTcSMdJfgKrrkwPSmTNCDBHVrLNjhBeV71SCrVO
         zegz5mGfDchvRbOLpx+fjjb9R7bYyqArEIPWkquzmvmZ600fpA3ad8iuVTNqUDEkGCml
         meKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634368; x=1783239168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YsOBmMNMfZPECIoa3pYfq1sCUi7Q8nNYZW3MFqpTtE0=;
        b=dlQeO6erfzprS/pAH0tUyPu6Xisfb+zpRMqWgpNyC51JNwba8ZxtbtvioVxli0UYw/
         p6k4NbremFKhRUg+OTKShrEoqg/WLQmSH7rsMiZo/UlCXjV/8SK3PQ3U/eYqhYOhIvGS
         XH7CBLE9iVoBs9WFt4kSF8vOA4WgZTMYNT3bfdg+6NUEWceiJsXxqbd5jK/8keI+BT0q
         xfUDltEjaaUV1tqtz3rCEzhugNVv1OcRJYArrK+gWz531NlISgXVaWfFr7vGe7AncuQJ
         FUelv7nL6uwj9tXG5Oj1zs+gHKrEdnpQTLIjJCvu+fd/mM4vJWw+p0bup9U2w895tMi2
         vrBw==
X-Gm-Message-State: AOJu0YzDSSyDcUksr++cnPsoJA2OVIGOlriG/egd2nt6XAgVqtOSiwT4
	WuWnl3qNJPaxuglAveE9wd/AzlaLyRh+z2EpUPFNS2XXfhSnqKD+lBolfMfSwjupuWG9oQ==
X-Gm-Gg: AfdE7ckRhD+W7EosCiVUPi+cYi+43x/U/qwy2glcDcnyOLtHCcZge6xMNHSVaSTakYI
	gSWKTYHfmmdHvcfvg1P3uS0T4XEUdcroXVJp+TIZJdmWBLe+V52JaKcSfDw5tgw7EzCjYbU3AJh
	ENYunxX6KRftrh66gK+xvm1JPUhuyxl21szdG41rseLmXlMmQcxJh0FlxkyheQkJhv4mxtIHViV
	0SXFHQAk2aYqd6vWApi8mkzlAvlGeAxa0z5hECC9GLGtZ0tDTlL+RcFK/nl7fxkjcTYKCFVM3ZS
	jEw+scLSasAc2G/rSoW1WCx0zAG3Axkqa8Q0OnSMBzBQKblSg0SyVkDBksn5LvhDAQIuIXkp9CV
	TzxpTH/J8tltFnG107IPbh0xbKeEolmermO7gWjbH4zNHW2vWyhm2YFaCkZQnLwOm/of4lzFTGU
	oF6MR4vbxf21eUpcHg3EXnQkmVpw+AlOayUfbVRT8YVjaRuMaIaMcMT4pUmq4hcpJYHH9BdwM/q
	rka7/gpD6t6UgnC5ZZtrsbi2dSM9IBlG8oh8t3OHcOP2CK3C0qKrfmphn9fYMwM60Z0AQruR/Ee
	9IxIiI8nZUYeNUWsdEMIPFDGcmJ7sQ==
X-Received: by 2002:a05:693c:638b:20b0:30c:9f31:b625 with SMTP id 5a478bee46e88-30c9f31c385mr5025054eec.23.1782634368218;
        Sun, 28 Jun 2026 01:12:48 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ea81b39easm6306040eec.31.2026.06.28.01.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:12:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 090/128] cairomm: upgrade 1.14.5 -> 1.14.6
Date: Sun, 28 Jun 2026 01:10:41 -0700
Message-ID: <20260628081122.178348-90-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
References: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 08:12:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127900

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../cairo/{cairomm_1.14.5.bb => cairomm_1.14.6.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/cairo/{cairomm_1.14.5.bb => cairomm_1.14.6.bb} (80%)

diff --git a/meta-oe/recipes-graphics/cairo/cairomm_1.14.5.bb b/meta-oe/recipes-graphics/cairo/cairomm_1.14.6.bb
similarity index 80%
rename from meta-oe/recipes-graphics/cairo/cairomm_1.14.5.bb
rename to meta-oe/recipes-graphics/cairo/cairomm_1.14.6.bb
index 33f497ddbd..b5e337e9b5 100644
--- a/meta-oe/recipes-graphics/cairo/cairomm_1.14.5.bb
+++ b/meta-oe/recipes-graphics/cairo/cairomm_1.14.6.bb
@@ -8,7 +8,7 @@ inherit gnomebase
 DEPENDS += "boost cairo libsigc++-2.0"
 
 SRC_URI = "https://www.cairographics.org/releases/${BP}.tar.xz"
-SRC_URI[sha256sum] = "70136203540c884e89ce1c9edfb6369b9953937f6cd596d97c78c9758a5d48db"
+SRC_URI[sha256sum] = "7e0d5c7f29175d573a03ab5c45aef63f48dd91a5caf335a404cd763e4b7cea4a"
 
 FILES:${PN}-doc += "${datadir}/devhelp"
 FILES:${PN}-dev += "${libdir}/cairomm-*/"

