Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCDFDC5DF88
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 04:36:19 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.694.1787286971495585376
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Aug 2026 21:36:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=YsQzpb0l;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38f0f132f56so1193130a91.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 20 Aug 2026 21:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787286971; x=1787891771; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=91HD9I6tDvq3Y5hZ5vluyr0kkszPwgvqHGto2GvT6Y4=;
        b=YsQzpb0lP8vcijsDmZvRbbTLW6z3pGbZsPKxs05WVKCrHPAwfXinb2I/X2CTowOGkO
         SsjZOKdwUnTO0o4J27QYuurZq7ORa2LEEfm2EbTWIXPT2vIgYOtUAo/HmevrxgHBbdlR
         rbwlQUBFGaMBOp933lEtv0HDVNk9fmfLtXRKUuN++95pVFyEn0F3Ch8F2gdwlNWxoBPz
         +v7YB+w2UGat7CMUWHjbSTsSjXiTfWk/UzzthjxTHThtaN7kgZCLB/gkiMTvdQTskVYG
         BFVUPvUV0nCHW8stTiMhtHTxa+8RDVeIgm9VUZBmMy5NY4WGv4g4HRs5PnLsYLn9f4K3
         1BMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787286971; x=1787891771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=91HD9I6tDvq3Y5hZ5vluyr0kkszPwgvqHGto2GvT6Y4=;
        b=iHjh/Rp9O61mvhisk2NEYvmxVkiirGU8epVO8lmFsKPNFps8MTxbuBLY+sUe/0on1m
         pk9FRVFYCNqBxqgHRSvRyreDqVvDtYqOf4+K5PZVur4DbKogNfiShNB+e62Jk4rmzSLX
         AiCk9mwCjujzYUbhz8jFfWXFUwmIV8Qev5m3VR8iTRi8v6O/PSU5Wrz+7u4JaQtqkw9q
         nqJcWJZfWsrTmw3ha1xIjjLNMMoS+SjU67Pis5OI7DAeaMPBFOllHrh5eMMFbI3Q+1QM
         BzXVQ4ph/0weMRVHtUi3p3lSBFcjuphZvIdHp9Bb+A8z4EzbNmRAzahaJh1jy12ZjV3+
         wVJg==
X-Gm-Message-State: AFuF++nUz73xGmZL+SUYabJwCLYT9rUOjbUt3rniYFzSe4juY9jY0dX7
	osoL4lxZEytKEu8FncTk42o+0uuSRWzl1UWSLI1o7nrWlpGA8gGX9FKOOht7BQ==
X-Gm-Gg: AR+sD11RCw+dIvuLqOj7w3xwipQO+0z2N4v4R6Chf2gKJe7hsYlJoyibpLqzu1bHNZP
	TJZTeVZnVFyJlOJ+7ozSFAE/7NitEUt8J0zklHGP/sM8lQIYzgE8ufawWSDMhQWQb7l3prEtYdR
	egmCQPkzZCdqkHrInWqRX8ZHnhNnz8KZR9V6n+wdlsIShLcpOhXm28rjeWYouVywV4Wv6tPVq1B
	TMdEWvRz4D7Ww8uiHLiBlhajJiTr9pBMe/ztNZtJYuJS584OxGqH39Ajxk6oIvGjVyQIIx1XSWX
	OY0vDQRdYyUZfHCeLhdY9XGMlMdaQ/p8HZjdHrcOZd6LA88pbNJAmDCTPY45cmEEjspkZEdSgtU
	JwwSLMawCO6GAB0YgzL8SVr92CPoUXAt1r6CcXYooOR0eWujFDcfdqGsXcWUINOTU/LvGHGLUWa
	cHzv6ki/Kvfsy4MVi5IZ+yfTL7fOhAYb5/0QiiBcKS61XqmSPYt7TvK/IRBViVtslAx/Etj6Qoh
	LUoSKsqSMypTZs2UcY=
X-Received: by 2002:a17:90b:54ce:b0:394:ed5c:ff9f with SMTP id 98e67ed59e1d1-395a06c097bmr15057494a91.17.1787286970827;
        Thu, 20 Aug 2026 21:36:10 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([161.29.95.207])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bef6ec40sm23626097eec.7.2026.08.20.21.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 21:36:10 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-webserver][PATCH 15/15] cockpit: add UPSTREAM_CHECK variables
Date: Fri, 21 Aug 2026 16:35:24 +1200
Message-ID: <20260821043525.448011-15-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821043525.448011-1-ankur.tyagi85@gmail.com>
References: <20260821043525.448011-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Aug 2026 04:36:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129410

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Fixes:
$ devtool latest-version cockpit
...
INFO: Current version: 364
INFO: Latest version:

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-webserver/recipes-webadmin/cockpit/cockpit_364.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-webserver/recipes-webadmin/cockpit/cockpit_364.bb b/meta-webserver/recipes-webadmin/cockpit/cockpit_364.bb
index 07e2b9d163..2b9c7677fe 100644
--- a/meta-webserver/recipes-webadmin/cockpit/cockpit_364.bb
+++ b/meta-webserver/recipes-webadmin/cockpit/cockpit_364.bb
@@ -11,6 +11,9 @@ SRC_URI += " \
     "
 SRC_URI[sha256sum] = "514cea072e1ef137323ab92bdb07a66bbb5106ecd584e7a046294cf0170cb690"
 
+UPSTREAM_CHECK_URI = "https://github.com/cockpit-project/cockpit/tags"
+UPSTREAM_CHECK_REGEX = "releases/tag/(?P<pver>\d+(\.\d+)*)"
+
 inherit gettext pkgconfig autotools systemd features_check python3targetconfig
 
 DEPENDS += "glib-2.0-native intltool-native gnutls virtual/gettext json-glib krb5 libpam systemd python3-pip-native python3-setuptools-native"

