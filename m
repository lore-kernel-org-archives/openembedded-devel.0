Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF864D35E2B
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:54:55 +0000 (UTC)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
 by mx.groups.io with SMTP id smtpd.web11.27722.1730831891203197703
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:38:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=At9k++Cm;
 spf=pass (domain: gmail.com, ip: 209.85.219.174, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e28fd83b5bbso6266245276.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 10:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730831890; x=1731436690; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TYWU3eIbEKIRswE5xtUrx4tuDdHwwOI95hhAzeTPd40=;
        b=At9k++CmaZPMdDVA98/ZiLpWrnqSwiJ12WP8f6iCvG1+wnc0Ho8NeRAcPxnpOiUb9u
         33p6PbsNU6wMVh+sT3MzwSRV4ofWyUZrnIIrCDdw0QumQZF9WcdE7loFr2Q+3ZZWV9V3
         O6jiqyyZ1rNa/0w0uV4XQ+sMnp0ag43eh4BN6MUhqieol58zrj0XhOQNkqMywz/EAMvj
         kysPyAQ9RIh1IyWMKBxLPqM8HkvUF7TElMFtGJTI7GTcccHjdRTRIw1umn+M+qYMQVZQ
         CZCsENSa6xv9zy0QtkSu3JwLKrDQYGRN3KVgq7OHmbQQpg3PJDuFpPYkF8b5/Wz/xNJb
         Lijw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730831890; x=1731436690;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TYWU3eIbEKIRswE5xtUrx4tuDdHwwOI95hhAzeTPd40=;
        b=Rm12phc9LzYPgoxF3R1TjhXHigA6wTPbpAIPitfi9fcVrx62IrvlgFJs15meTVKj01
         CnmljnNQi5mYKoxzuTvMH8H55NTl/5H25SpVVFRjUcgIcY10wGrJA/RirsTs5SCyWZBb
         btr2NpJJ1HJo67N1jbhONYy6PwNCCDvcLYgQy9LVMrwYTSbIoF3yI84UaXdVE3EkfTaJ
         ZyhEOnlZjkuhUK4zqNc7+eElAnTHyPgnBwZRjBTWiytOoCv0yyEm52uYGtHTXUYgdYHo
         748EyDi+QSk2vPApTPbjSltHpf0ZFGvUmks2a1HNlKwzMXGpvP0Uqffp6qJ9FIV6HkzT
         goqA==
X-Gm-Message-State: AOJu0Yx+8Ffgd9QPfX2wAz8MnYJjvgJckO85LIQPJQy6+19KEuNmckTv
	NPhafucQ15U4gpZ7jLFurpB9/LmAhzk1n1ICsR2NyA/UicVaZ7PO/0luQgvG
X-Google-Smtp-Source: AGHT+IEqcybR9c3qaphqiR0DiXu6G7W7ZQvXYlUxa4Mw+0ueXDCEzj9ZjbVDbo/k+9JE22a/02Ycqw==
X-Received: by 2002:a05:690c:c07:b0:6c7:a120:e0ec with SMTP id 00721157ae682-6ea64b11504mr179994937b3.22.1730831889887;
        Tue, 05 Nov 2024 10:38:09 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c48b6esm23957617b3.103.2024.11.05.10.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:38:09 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-oe][PATCH 016/161] openobex: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 13:24:52 -0500
Message-ID: <20241105183658.34982-18-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105183658.34982-2-schonm@gmail.com>
References: <20241105183658.34982-2-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 18:54:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113531

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-connectivity/obex/openobex_1.7.2.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/obex/openobex_1.7.2.bb b/meta-oe/recipes-connectivity/obex/openobex_1.7.2.bb
index 7d373a65c..fecf9b129 100644
--- a/meta-oe/recipes-connectivity/obex/openobex_1.7.2.bb
+++ b/meta-oe/recipes-connectivity/obex/openobex_1.7.2.bb
@@ -12,7 +12,6 @@ DEPENDS:append:class-target = " bluez5"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}/${PV}/${BP}-Source.tar.gz \
 "
-SRC_URI[md5sum] = "f6e0b6cb7dcfd731460a7e9a91429a3a"
 SRC_URI[sha256sum] = "158860aaea52f0fce0c8e4b64550daaae06df2689e05834697b7e8c7d73dd4fc"
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/openobex/files/openobex/"
-- 
2.43.0


