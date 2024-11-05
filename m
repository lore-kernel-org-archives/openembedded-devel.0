Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3198D35E2D
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:54:55 +0000 (UTC)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
 by mx.groups.io with SMTP id smtpd.web11.27720.1730831889778082817
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:38:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TdAhSulz;
 spf=pass (domain: gmail.com, ip: 209.85.219.178, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e30d1d97d20so5013580276.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 10:38:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730831889; x=1731436689; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BMZydOyvxtcRtQa0+ZKn5RZXVoPHjjznN3VSBQtifNE=;
        b=TdAhSulzWEv7bhbHjDXfuUKtKnZU5h2VZg/KgdzFBVppFtuih9HECgPmiPVsSabT2P
         YBNlykwQLPiJSTPjzVu4Y4z9C6d3y9zGiwDYAu14zke+rbZTHSfjUA/4ej0FrLxuWF74
         xDsX5Tp2h91KVVmqf069+AII44q3Lv2FYA0a6jAI54v7LumfALYIyTwYtSNR96aW9eCO
         o36xi3GhONLw5Y/P1FsxnREItw/FdruaPey4GqrtXsGIPZNf7V8dD0jBF8vEi7nvn+W3
         Px5QFDZnJK/cdZChF8KoRrDaopjAl1Kx4a0P1LSNq7TURLDXpTlocPyNr5rPol/VGszq
         t1iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730831889; x=1731436689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BMZydOyvxtcRtQa0+ZKn5RZXVoPHjjznN3VSBQtifNE=;
        b=LfyB15CoPLE3fsTanl98K60dAxRxII2Bo4SPxWnk+ejeZ5wlvZSvd5kWxY2fH4c8ah
         8IgYh/J05h0U1eoCxAOHxebLmlYiz8oj+/rzgGFfVpds4wvmJxaauWay5JlNGSEprezU
         J3ZV7RHw4sR2XhCxbgTlFiUgJo2kL4cGmRpCJ9OU+dh1eIzpF5FT8/NA/tXiXl2ZU/t9
         Rmz7GOaKEDiaZrAPiKQ3AJlxEB2LyVc6GlNAECrWJj2CNwDyOSQ0J11JQ7XpISWcImMu
         yZWziJJYf2HXZo0GJpBCPPcAV/mcR+x+PjOVIcsonCpMD8De8bM0lXT1d9NCQhQ+NH/j
         d3xw==
X-Gm-Message-State: AOJu0YyjtrcAWxHsSgwbWiDCV9kj+7ZLKFD8i4DPkKpP+xRmBpSdifIJ
	Vg4QS3P4LKX7EQZFZ7O5+4GwDp6na/Sg2/WGNSivehdQu0CfGr2VPNSRHRMp
X-Google-Smtp-Source: AGHT+IE8xUU7j5fnoQss9UCsS65r+OkPtYuol2ZyiMJuvNWlquLZl5W839ftw4jwhfTVlWHfY76J6Q==
X-Received: by 2002:a05:690c:31a:b0:6ea:6876:5226 with SMTP id 00721157ae682-6ea68765303mr155417217b3.23.1730831888482;
        Tue, 05 Nov 2024 10:38:08 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c48b6esm23957617b3.103.2024.11.05.10.38.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:38:08 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-oe][PATCH 014/161] ifplugd: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 13:24:50 -0500
Message-ID: <20241105183658.34982-16-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105183658.34982-2-schonm@gmail.com>
References: <20241105183658.34982-2-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 18:54:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113529

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-connectivity/ifplugd/ifplugd_0.28.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/ifplugd/ifplugd_0.28.bb b/meta-oe/recipes-connectivity/ifplugd/ifplugd_0.28.bb
index 62651bc30..14104ffcc 100644
--- a/meta-oe/recipes-connectivity/ifplugd/ifplugd_0.28.bb
+++ b/meta-oe/recipes-connectivity/ifplugd/ifplugd_0.28.bb
@@ -12,7 +12,6 @@ SRC_URI = "http://0pointer.de/lennart/projects/ifplugd/ifplugd-${PV}.tar.gz \
 
 SRC_URI:append:libc-musl = " file://Fix-build-with-musl.patch"
 
-SRC_URI[md5sum] = "df6f4bab52f46ffd6eb1f5912d4ccee3"
 SRC_URI[sha256sum] = "474754ac4ab32d738cbf2a4a3e87ee0a2c71b9048a38bdcd7df1e4f9fd6541f0"
 
 inherit autotools update-rc.d pkgconfig
-- 
2.43.0


