Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DF64D35E4B
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:55:06 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.web11.27745.1730831915986518055
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:38:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hW341eGT;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6ea053b5929so47993507b3.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 10:38:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730831915; x=1731436715; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DosQcJWK3VmpxeXzdpkahQaV82EQZKxSWxt8zIpuxu4=;
        b=hW341eGTDi1vIkt55UrGxX0EGT7U5RjNPvz+CxEPwspOqP82zEe9sj7CCTNeNQxq/2
         e1Wxg3uP8f1BAHoM+qNN9sAq0lOjGz88t7ZJgpzCpEgByYLSGO8rDFklYhsm0xYok2rr
         OKzJLlsMfnSAqQcTOFfWS0vkWzrRcTl+K5+uWaHPmrHoQ34g7Bcfpq+DBZCdXaZ7cNV6
         79rJxoTEcZmXZ1MrwI1YXsHy/u4mhpsknvS7xVA6Pp2BCitkoaGoP+RYl6PcAxtyCgUE
         nLRgJislYB5V9gHEmhd+tr0fP2u2hfoyL6Radg5dvEp1aEa++jFEjl8FU8w3zDgPnaTx
         aW6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730831915; x=1731436715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DosQcJWK3VmpxeXzdpkahQaV82EQZKxSWxt8zIpuxu4=;
        b=qpPQH3bR6FQMm2MJIhTOqrrna3uTopJ/xuYtbiTTClUWF16Pqb/FRmaX3iHSb/k0tg
         B9uQAcOCuRr3s2vpkgYUJva/qJCezYrba0Bc2P1iN0HBSS1fW29vncZEUDwo/YTn6tW5
         w6Xet/Nf3zwWK3JPGHyRv1BG88cKcgkOuH2if3QIScwy0vinc8IHg9G471YbGthBl+Wb
         gzHDgTPwwal9MqKIj8cGUrlI64sCLGf6+39x6JaGcUh/+TJhwvIusp2PYikOihB0wRce
         99rqTAHTAwAGWNiHadNs2dF7/SUR2chGLF3rWo5ToVAM0JuBDZ/HnqrKcEK+iIBrwO6N
         CQbw==
X-Gm-Message-State: AOJu0YzUdnQRkFDAE67WbIGyBRAiawHVoGdbM9bm8PUjV8X8hu5uCFR8
	uxBRHSNug0B4wLZGwyCdlOab7VUGf47N6H9Xbllm64DKDHYOVQvKKUZBwWXQ
X-Google-Smtp-Source: AGHT+IFemmWr4em59odAIQzz/rTP+2VU4h2CfZYlfibzy0lHDVFm3hY6sbBWDWQvi0VLgFB+KpGZaw==
X-Received: by 2002:a05:690c:883:b0:6e5:e714:3bdf with SMTP id 00721157ae682-6ea64a9f501mr170719487b3.5.1730831914690;
        Tue, 05 Nov 2024 10:38:34 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c48b6esm23957617b3.103.2024.11.05.10.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:38:34 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-oe][PATCH 043/161] libconfig: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 13:25:19 -0500
Message-ID: <20241105183658.34982-45-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105183658.34982-2-schonm@gmail.com>
References: <20241105183658.34982-2-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 18:55:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113558

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-extended/libconfig/libconfig_1.7.3.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-extended/libconfig/libconfig_1.7.3.bb b/meta-oe/recipes-extended/libconfig/libconfig_1.7.3.bb
index 638256992..ad030b8f4 100644
--- a/meta-oe/recipes-extended/libconfig/libconfig_1.7.3.bb
+++ b/meta-oe/recipes-extended/libconfig/libconfig_1.7.3.bb
@@ -14,7 +14,6 @@ UPSTREAM_CHECK_REGEX = "Version (?P<pver>\d+(\.\d+)+)"
 
 inherit autotools-brokensep pkgconfig
 
-SRC_URI[md5sum] = "15ec701205f91f21b1187f8b61e0d64f"
 SRC_URI[sha256sum] = "545166d6cac037744381d1e9cc5a5405094e7bfad16a411699bcff40bbb31ee7"
 
 PACKAGE_BEFORE_PN = "${PN}++"
-- 
2.43.0


