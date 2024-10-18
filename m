Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70512D3F29F
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 19:48:53 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web11.30099.1729278828307235888
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Oct 2024 12:13:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=K2RuZ0Cs;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6e5a5abc915so22120887b3.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 12:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729278827; x=1729883627; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rbXELk3NSRDJMueSmc/Rk9EuF1olko0K/MNQ0VSD+vs=;
        b=K2RuZ0CszuksSFDYUbVoZfg7FGfuQCrDEjkyq3+PDl5Q9wav1QMmCpQrGOczCIETgG
         BEW0W2q4Nj7AMrWMVv8iXDPlUZTUlarP130QhsC5ilLuYvo1SqhGHJ3K3GpFDATE2Q5j
         UH/ZScw0PeJu8yGWxKIuV1r8u1Xg8k7l84HcWdPFWMp+JOK1/2efQM3ITvca+q2hMOTZ
         XdZcYE6nLkIw6wOE4/xWquYgy/kekzOtPp0BwXl0L/vTA01pehHBBV1uO9Jp0QJ0k259
         oPhYutOWdamvJTeudlr6PbAuKVLtsc55XhW2vm9/SuVGdpBTcPujaooSMGqe9w924tzn
         w4sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729278827; x=1729883627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rbXELk3NSRDJMueSmc/Rk9EuF1olko0K/MNQ0VSD+vs=;
        b=pLiVKP8Eqtx3uQjG8HB1Tvl9tkbVS9HIIMpjAUdrQH3DarOGioE5Fzokmj+wH0xG54
         dyZRrbCnvJxeu3PrLtA8TcAc2idcCU5GlbyYSh228cScjwrwIycXjCuhGZL5qz3bIml7
         yKK/mcv4wsfzFbLSpt9OqYXXkvmsG5jIigULo5BeU5bjJElUZu0WSljcf0lcqM71hvaB
         xfS+Uaw/vK4Foqp5X5VE+KAnUKgWpouL5HrFaUqx1n/M9Qcq9Ft2AA+OYfX4SVLSJhlU
         XlrJ0Z9FCaBW3u8ypPyxKOng986wsiL8PpXRGM7lGb9jcRrogLSY2hCUXRKqUBoc0gzE
         ye/Q==
X-Gm-Message-State: AOJu0YzxH2nyJnZ56p2lU9N490i/k3SD3XQ6fAV+cjo0Q9VkhzAUeQ56
	Sarp7hMPlx6OzjVbsUnOhDQgCIWQkRfGQw8QwoD/QX/PHjH0hxboDNxtDg==
X-Google-Smtp-Source: AGHT+IENa4+Vc41VvvGtJGpGBsph6zv0cvG99GOGaUN09buBDFszAQ2antPUTEU/njT67qIhZs0GOQ==
X-Received: by 2002:a05:690c:3208:b0:6dd:d894:bc40 with SMTP id 00721157ae682-6e5bfc9f3bcmr33854637b3.26.1729278826862;
        Fri, 18 Oct 2024 12:13:46 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5c00df1d2sm4280517b3.31.2024.10.18.12.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 12:13:46 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-python][PATCH 56/68] python3-raven: Drop unnecessary SRC_URI md5sum
Date: Fri, 18 Oct 2024 15:06:43 -0400
Message-ID: <20241018191101.25184-57-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241018191101.25184-1-schonm@gmail.com>
References: <20241018191101.25184-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 19:48:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113043

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-python/recipes-devtools/python/python3-raven_6.10.0.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-raven_6.10.0.bb b/meta-python/recipes-devtools/python/python3-raven_6.10.0.bb
index 79a38983d..54ae1c313 100644
--- a/meta-python/recipes-devtools/python/python3-raven_6.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-raven_6.10.0.bb
@@ -6,7 +6,6 @@ HOMEPAGE = "https://github.com/getsentry/raven-python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b9a4414e08f0571d55184531cefc131b"
 
-SRC_URI[md5sum] = "3676f31dadfa61526444dd0245c78a38"
 SRC_URI[sha256sum] = "3fa6de6efa2493a7c827472e984ce9b020797d0da16f1db67197bcc23c8fae54"
 
 PYPI_PACKAGE = "raven"
-- 
2.43.0


