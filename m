Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CB0ACC6B2A
	for <webhook@archiver.kernel.org>; Wed, 14 Oct 2026 10:22:50 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10231.1791973368575040139
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 03:22:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=HyO1GJOY;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3a813079a55so3428039a91.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 03:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791973368; x=1792578168; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xhuUXHKvoUDDwDJb66wVl+OGBzgyKcAcSEozvYiWZ7o=;
        b=HyO1GJOYiKfGYttq2KQL1Awtwof+6trz5pWzBgRbTzuniQl+2gTJ21Ap9cVQx0ccEY
         g0FkdTdWW6MtZY0HCro9CTtoFEVWm/vpc6wRKE4m0PQzFuvp7tVlqFx65f2CrwIKqiAI
         SCmRk2OBZHlZ8y0MUO30uujHEXQAsCdyjmigoxB1aO10fqsI8CZptlIq4z7PF64puOi1
         GOiGocb04hMY/OebM7i6LU4CKbvH26Jxs6tPza0QFcMRSaQ3klJs+0iLBPBNayySZg66
         iKZNvUz/ai61kNNK8m908vPMiwh6/kzagdMGLOqqPb/WELYsMCKWpSOsW/EwUQ3459mw
         32VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791973368; x=1792578168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xhuUXHKvoUDDwDJb66wVl+OGBzgyKcAcSEozvYiWZ7o=;
        b=GDNU+T6eo3Jd/Qc2NedbnT3k/j4qdFsZzEdwdMID7MoO4P+QzMGkZk2+OYpVklbHrV
         h42/6C5mpdUozOl+G4a2oNSJzRuDW4ymawNzgNXekx49fEKIDK/QvXV71bMW97uexI/E
         YCn2JD4+T0ELq90bwZ+94HYpUSnrkv+AD6zUq4kU+sQ4EYw5X8Ceuj8kSJ2/6yudhgBe
         7ahRYkIrIeyMMbPWvpGmUzGvGYtoHaGZn4cx0IV/+9bF7I6XaUOqVoxoWhcTv4Q6zFnF
         HKENhlv7tP6LzUD4f+y8bbQyO+KyQXBgkPPe9nW4OOIHZWNmNP6rB+f83Tj+wSW3QiSk
         W/gg==
X-Gm-Message-State: AFq9FYI9zA0yucCpl1jlJjji9G/C3yc+6DTf496Z0PJnx+6CATbrQFkI
	yii+JnswoSzsgEP14SYtm9o3MfhbNqys7Doxpt2iKtWHkmBN3PAA1MKZj5Zqbg==
X-Gm-Gg: AYBFou2zDI8Jh3zHrSfkNdgLl4wLEopL0FjkT08KA+Z08tklxlSCREBpqzhj8k9VMRJ
	vJTp+aROWV7EmkXdtYxojrxpU0E98Mcp/oLNw7BB/E6tODQvOEQA8BP/6ZzNhu3LLzoalAesksN
	bqPXXLiQ5x4h78Jv85DUokd5wJ89GQBsUqD17+UZP0gXohxYPpkbzXotZa/3b+bQNvMqiNsvgPp
	1+3/R6nZp3h3X1X+cH+RIrcxdjBIcohdtIbW1XQsTYX5olj+adZBa8SL/XDybY2v8lBdy3leEmd
	ShKUxjpozUxWa0cDMocg6JKB9UAlIIZfkQ8dvESTc43AV5x0C9h9pIee6LEm6UFy7RztF+vhzi7
	q2T+p10lxPkRwhz7yLW9UBTlrHfxU5Sgr+/HLRY+eWXqPaSi7T4rf/36WKA8TAVpy9LpETCsOxN
	W1R4XlX/XPGjOzkuHr5zqZFdimBqa+y9gK7agrlD/g3OL8PaPKwlAyu/BILJwfir+CPpoAcABww
	o1kFLVPqxD2YNZA9Z0gZiFYQGqvjG4TzPaSK0Y=
X-Received: by 2002:a17:90b:1d50:b0:3ab:4e4:e97a with SMTP id 98e67ed59e1d1-3ab3ab227d9mr8628734a91.26.1791973367419;
        Wed, 14 Oct 2026 03:22:47 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac61170b7bsm4017740a91.16.2026.10.14.03.22.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 03:22:47 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 10/11] libspdm: upgrade 3.8.2 -> 3.8.3
Date: Wed, 14 Oct 2026 23:22:16 +1300
Message-ID: <20261014102218.880640-10-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014102218.880640-1-ankur.tyagi85@gmail.com>
References: <20261014102218.880640-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 10:22:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130896

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/DMTF/libspdm/releases/tag/3.8.3

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libspdm/{libspdm_3.8.2.bb => libspdm_3.8.3.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libspdm/{libspdm_3.8.2.bb => libspdm_3.8.3.bb} (97%)

diff --git a/meta-oe/recipes-support/libspdm/libspdm_3.8.2.bb b/meta-oe/recipes-support/libspdm/libspdm_3.8.3.bb
similarity index 97%
rename from meta-oe/recipes-support/libspdm/libspdm_3.8.2.bb
rename to meta-oe/recipes-support/libspdm/libspdm_3.8.3.bb
index 7d227d4148..68208a0380 100644
--- a/meta-oe/recipes-support/libspdm/libspdm_3.8.2.bb
+++ b/meta-oe/recipes-support/libspdm/libspdm_3.8.3.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=8f9b59a81a88da8e812af43728b72dd7"
 DEPENDS = "openssl"
 
 SRC_URI = "git://github.com/DMTF/libspdm.git;branch=release-3.8;protocol=https;tag=${PV}"
-SRCREV = "f55cf6d48ec69b4ac60a63903e9c6a2cb0fd155d"
+SRCREV = "98253fee253c9e0b4313e64b373af3c7614c90e5"
 
 inherit cmake
 

