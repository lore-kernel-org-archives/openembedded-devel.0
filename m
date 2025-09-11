Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CC8CCAC58D
	for <webhook@archiver.kernel.org>; Thu, 11 Sep 2025 11:22:49 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.43995.1757589763337987868
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Sep 2025 04:22:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PgX5ufHz;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b04271cfc3eso74859166b.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 11 Sep 2025 04:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757589761; x=1758194561; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=174jIO4xTrdbP+5nxTi0bkQabjh2qFyfR+sU0jmM/DM=;
        b=PgX5ufHz1j91OYkmn8oNzkDhdBwyd3aO+TPHKuUqg13faSNqRsM8yEYn5W1X8wbSmK
         SXtIRP10Kpo6pmkRJPiqxjxhfAp9Z329xeRX127QgBz6qB/hsB11+eemkckHkJrqJk5X
         fK8Sa731xdnwwbSJ2b8s31vWNZACmqK6wz5bDpOdkDzh312+SgPwS1VVm8IqlAvCPmMG
         +gVNVgpMBv1HCTDQnE9NbZtJWUfVpdBRydFH4ekX8mlvfNbq365dI2mS/NluhoJx5DkV
         qkLDfGW7kIhNjHrpd53ssbcsC0f3fF1QP5fJTfi+l5RGYfRj5T/M3EHDnsR77EF2x2aM
         54WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757589761; x=1758194561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=174jIO4xTrdbP+5nxTi0bkQabjh2qFyfR+sU0jmM/DM=;
        b=gOnhgjjYl58EG/mwP8HZEuswzCkn0F2S1wqfhgHT3lqlZch1eChUMKM94bIDM5w9D1
         5djaXs8xWgVcrAC0enWL+7Jg+e/jn7KRoOId2pnscZBJSGDQI7mHu7SyNeFDZAgchyJZ
         PZYMromoFBzNq83T/DIfjIeLBQjtZcjy8DtO6CgL1E9gkOjb1rihUb5OAh3ndHnkP1g8
         XDul/GUXBotDy+SvmQmvXBt6snL8x56E1P/eNpCLFh/s90wG7Q9MUSzNUairg1a3ykvI
         y9xrGPvWa44TjcnVCqD5X95imRYMonhkoEHiYpMXcVFdecev4ZWx2cZLPJn4qwqh2A4X
         KtKw==
X-Gm-Message-State: AOJu0YxNZlqi1b2zlLMWchqPEvZ8KZ+Zxw68G+sJgThaB6yBD+KsVGeJ
	gzTEISeu85k6LZH9qLpqgJWXEY+mOyF3fnRv6ioj1HSmWsRVkeD3wINroDXWMA==
X-Gm-Gg: ASbGncubdyRXn5v3q+KywTmDwt28ftQmcB4cHLsH+oGl0ElXwZJs7v4fK9k+hHE58pq
	RCOpKuWWoO2XDBOHAsqPref571jR8Yl8xNuQ94hW0RSUSPx78P73349I2A91LXzvA3b5wuKLShQ
	TGQ9kXFY9tnrFwy2p46yNdUIWGmAs9UtvKz4JKuv0feDs5PD8f7dUOvjgOwVSfSTMQrwzhORPdi
	w7oAgpvbPcl9SU21SMvN7OHzA0PQ33DaBnzoGZbbnWKJ8QCN9LoG0RClJPY+E2gg+pfrYMlvGdK
	iq2Wc5fuqFjgRmlC51VS0ZUMrwPoWGvqkJ9J19AQeiTYifROm8wEoC6SbVIHp4jdVFxqNAf2NrR
	9ZPL2W7+yRv4AMB73dvt6OaAoXRkamwM=
X-Google-Smtp-Source: AGHT+IEg+qPovbdy5MUO02nwMlw9Ht907GRCq6SWXQZqwZstZCg8UkrO81PRAM2DBvl1nv0FVatqsw==
X-Received: by 2002:a17:907:3cd4:b0:b04:3e43:eccc with SMTP id a640c23a62f3a-b04b1687dcfmr1992619766b.40.1757589761487;
        Thu, 11 Sep 2025 04:22:41 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b31295c9sm114824166b.43.2025.09.11.04.22.40
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 04:22:41 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][walnascar][PATCH 3/4] pgpool2: upgrade 4.5.3 -> 4.5.4
Date: Thu, 11 Sep 2025 13:22:37 +0200
Message-ID: <20250911112238.3277434-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250911112238.3277434-1-skandigraun@gmail.com>
References: <20250911112238.3277434-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 11 Sep 2025 11:22:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119365

From: Jason Schonberg <schonm@gmail.com>

This version brings a fix for CVE-2024-45624

Changlog: https://www.pgpool.net/docs/latest/en/html/release-4-5-4.html

Signed-off-by: Jason Schonberg <schonm@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../pgpool2/{pgpool2_4.5.3.bb => pgpool2_4.5.4.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/pgpool2/{pgpool2_4.5.3.bb => pgpool2_4.5.4.bb} (95%)

diff --git a/meta-networking/recipes-support/pgpool2/pgpool2_4.5.3.bb b/meta-networking/recipes-support/pgpool2/pgpool2_4.5.4.bb
similarity index 95%
rename from meta-networking/recipes-support/pgpool2/pgpool2_4.5.3.bb
rename to meta-networking/recipes-support/pgpool2/pgpool2_4.5.4.bb
index 09d756b289..d3bfd4ba79 100644
--- a/meta-networking/recipes-support/pgpool2/pgpool2_4.5.3.bb
+++ b/meta-networking/recipes-support/pgpool2/pgpool2_4.5.4.bb
@@ -16,7 +16,7 @@ SRC_URI = "https://www.pgpool.net/mediawiki/images/pgpool-II-${PV}.tar.gz \
 	   file://pgpool.sysconfig \
 	   file://pgpool.service \
            "
-SRC_URI[sha256sum] = "25ed340d7b7dc00c20e4ba763d3f9c07ba891b150d9d48af313a1351cafdd778"
+SRC_URI[sha256sum] = "d1392e74ce2807f8ae628872cb1ab7914249921180dc99df40a1d602647a10fd"
 
 S = "${WORKDIR}/pgpool-II-${PV}"
 

