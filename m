Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16546D35E38
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:54:56 +0000 (UTC)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
 by mx.groups.io with SMTP id smtpd.web11.27735.1730831903462155079
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:38:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CJ5pFEQn;
 spf=pass (domain: gmail.com, ip: 209.85.219.172, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e28fa2807eeso5345371276.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 10:38:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730831902; x=1731436702; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8JaTSM4j+v8HIZKdLrR8cN4rmfgXb4VqmPFj5SuyTGE=;
        b=CJ5pFEQnbzj8XRegabXDzLwDHbJ2pnhQGL8n0olQUorJwVoLNXRWm/dVXNVyq1jnkU
         QWNbLHSk0NT+mdCxZVr08mWoDpvPfNQm1ncfOjFZfJ9CJ3XucasC2SbZNtvJoHXpmhqq
         4sPL+6nzjiLwRxGtDXUveNb51q5AhMbQmFrr/lPyoCJr3lWsB76SIRNdTZeXDXj/ldAj
         77Jkr+2Vyy6KL7AeCoyZ/7tDOhuIxZ+P7xSYuUoh2vEnehlNYmkJEzZ7cWD7mjIsBfX5
         tnjnroURInyk6lIiDv+MLQe5W5T0an3kIb/HqMK9AyxdNXCmDDA0kEN9JOpm4Onnp9+4
         ngLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730831902; x=1731436702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8JaTSM4j+v8HIZKdLrR8cN4rmfgXb4VqmPFj5SuyTGE=;
        b=nUzYv5O8+qg8F5iQY/r1iDJd5uH8NYIgy1kauNgQPgeYa5mWRPkABPUBbf6Je/p45n
         CoGOqGPNCa8WlVq3/qfASYCt8zKDTWEI789p/EQhTiEAYzSBQ5iUtwZ1F/f2TjDw88Ez
         AQm86s5gI7CWsE8aW1u2vHhR4ZGFENhKDmeKb2j6Pqe+2zmuWXuRmx0gv8nETpHuETUr
         ey4DNwGeO/ij8LJnYL/3vzXBdLVhDXwG5DUM+PhfCJ8hew4SIiqBFkVE7slP3aopJQZo
         /80omc0YynBY62jiHZmDP+6GmaOjtWKxXCdSzlzHVdKRA/1XtMybKPWydeM/7K1ZelmD
         Cmog==
X-Gm-Message-State: AOJu0YwDN+vdypDAqIc2r+4BAGsPsi+3WR5tNH6djpZ4xNqP+z8m4Arv
	Zx8I3dknHh5iZm+dhqX9A9IildOC4ymDVkmKe6ffc+yAIrAXe1jWY+BWKc9e
X-Google-Smtp-Source: AGHT+IHRehVZj0146zNpOgwCd1oEsNE5FaSKUBay1+4ayWgGUqqQyYKyIgKkkvJD9FHPkjJT4EndYA==
X-Received: by 2002:a05:690c:dd2:b0:6dd:d5b7:f35d with SMTP id 00721157ae682-6ea52525cebmr191512637b3.30.1730831902003;
        Tue, 05 Nov 2024 10:38:22 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c48b6esm23957617b3.103.2024.11.05.10.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:38:21 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-oe][PATCH 031/161] icon-slicer: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 13:25:07 -0500
Message-ID: <20241105183658.34982-33-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105183658.34982-2-schonm@gmail.com>
References: <20241105183658.34982-2-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 18:54:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113546

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-devtools/icon-slicer/icon-slicer_0.3.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/icon-slicer/icon-slicer_0.3.bb b/meta-oe/recipes-devtools/icon-slicer/icon-slicer_0.3.bb
index 8e7b0ba5a..991133185 100644
--- a/meta-oe/recipes-devtools/icon-slicer/icon-slicer_0.3.bb
+++ b/meta-oe/recipes-devtools/icon-slicer/icon-slicer_0.3.bb
@@ -5,7 +5,6 @@ DEPENDS = "gdk-pixbuf popt"
 
 SRC_URI = "http://freedesktop.org/software/${BPN}/releases/${BPN}-${PV}.tar.gz \
            file://0001-Makefile.am-no-examples.patch"
-SRC_URI[md5sum] = "5c5374d4f265b0abe4daef1d03f87104"
 SRC_URI[sha256sum] = "05f0216dd0c25a17859de66357f64da5033375b6fbf5f31ca54867311160b64d"
 
 inherit autotools pkgconfig
-- 
2.43.0


