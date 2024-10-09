Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4051DCEE342
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 18:21:33 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web11.24250.1728498089067763937
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Oct 2024 11:21:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QABSGvyV;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a993f6916daso19075866b.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Oct 2024 11:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728498087; x=1729102887; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AGwtGFSzb2rkK5x/T3tzZHED+E8Nfc7hzbIfWpHk0v0=;
        b=QABSGvyVrV1RmgCjfO3g81ecJO7xEirbOOWVDzvlLYylmCasd9L6AdnkPHLKChxm85
         JGyOYn2lrrOF7OxtASeMuSqFHgJJwWDIfY1QaaPKOh/BRCIScxLOhvjpyATrQFedQs7o
         sQ1r0ccMX/9Hr/xlSSo3haw+i7VB6KutVd7kpl3DOOLiOrPpFWX2HRrLscoR/C8q1ajg
         GthooL3pyea3kyrST14SfX6xhi0dRbcP/nlH7hHf5EIe8pLdiFINbQxzm2JPDrxKmj1l
         mGfd0zAYoptKY0ld4O5yz6vSKTDuu7iBqjGaG2mSDk63o1mq3pcqchw8iHP3ZzL/5YXU
         z9bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728498087; x=1729102887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AGwtGFSzb2rkK5x/T3tzZHED+E8Nfc7hzbIfWpHk0v0=;
        b=oYToHeT4K+nE9D4G8lA46QKNCnHEsWP2jXa18JxPpNqLFb/sSYlO+SQkPsWC0y+hMm
         RmboKVEYMeoObTArkgVfYGNOmoZhlBcee0qvQVpbWJjoSyB2HuoxTuHZA6UK1Za+oZxM
         G3IXyShm3W2baLrIJAs4htFEFAC0YbdRRElC7iDeHaQGWZn+o56l0wonZgCLzx+56lHH
         USOzcw6uyns5ZvJSzx9Z6yGZVAjvI5IaS9ztQZNX64b5x46D1YjPlp6g7erjpftlv5MR
         OhTHIuIzRpG7Y9pItc3hrF2Ow/jAQvx3cyuaWXUmC54D/EFdyDmMvyDYWOd1pmvBDRcb
         B0HA==
X-Gm-Message-State: AOJu0YzJtpR5pa50rXSTUm/dczLbDrctdCIVRE2nfij0kucB2xV4YITR
	DnamgBsj8JOXA9rVqkzPhy5pScP9accJxCTzUAVY75ie9r58cgeKYAKppw==
X-Google-Smtp-Source: AGHT+IF5aBDO/GYLtQZvn3QGTbcd/oI6cRp3mgtTj2w0oKTLYcV5KFZiQyvTP9xNBniYGX90MpNZPw==
X-Received: by 2002:a17:906:d259:b0:a99:42e7:21f with SMTP id a640c23a62f3a-a998d224f32mr330771066b.37.1728498086742;
        Wed, 09 Oct 2024 11:21:26 -0700 (PDT)
Received: from localhost.localdomain ([176.33.66.209])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9954cd8395sm446754466b.30.2024.10.09.11.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 11:21:26 -0700 (PDT)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH 7/7] python3-reedsolo: switch to PEP-517 build backend
Date: Wed,  9 Oct 2024 21:20:31 +0300
Message-Id: <20241009182031.242045-7-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241009182031.242045-1-alperyasinak1@gmail.com>
References: <20241009182031.242045-1-alperyasinak1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Oct 2024 18:21:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112743

The project has a proper pyproject.toml which declares the setuptools.build.meta PEP-517 backend.

Fix:

WARNING: python3-reedsolo-2.1.0b1-r0 do_check_backend: QA Issue: inherits setuptools3 but has pyproject.toml with setuptools.build_meta, use the correct class [pep517-backend]

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../python3-reedsolo/python3-reedsolo_2.1.0b1.bb                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python3-reedsolo/python3-reedsolo_2.1.0b1.bb b/meta-python/recipes-devtools/python3-reedsolo/python3-reedsolo_2.1.0b1.bb
index bd2b59d36..6884e908a 100644
--- a/meta-python/recipes-devtools/python3-reedsolo/python3-reedsolo_2.1.0b1.bb
+++ b/meta-python/recipes-devtools/python3-reedsolo/python3-reedsolo_2.1.0b1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=ffde61aeb8917e70e0257e0a4b6d103c"
 
 SRC_URI[sha256sum] = "e11528d63e75461d45b86c23f9db8260303d6ab6cae075fa9eddb44527ad8ece"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
 DEPENDS += "python3-cython-native"
 RDEPENDS:${PN} += "python3-core"
-- 
2.25.1


