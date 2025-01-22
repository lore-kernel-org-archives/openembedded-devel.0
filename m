Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AACDEC02182
	for <webhook@archiver.kernel.org>; Wed, 22 Jan 2025 15:45:51 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web11.46588.1737560747356047912
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Jan 2025 07:45:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Dud/nRGb;
 spf=pass (domain: konsulko.com, ip: 209.85.208.49, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5d932eac638so13921276a12.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jan 2025 07:45:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1737560745; x=1738165545; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6vDPoJrz/pIY+yCQ6HoimbmiTOiV3/qDDJ5z5/BxDHQ=;
        b=Dud/nRGbzjOSnVRBxvqn82HKvvAWGZ0g//tRhdeTsBUuNVlAl99WzrWHKvLzrJqQDJ
         iEBm+W7xGfpwK+Mzx27euAjhLmOdmibppaAvWmLuVi8z5BOaiXX9ZP8pZ9lIIwHJc+Ba
         1Fq0xvfVWWQKNl3MpNvGEeGsggI4/557cWZs4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737560745; x=1738165545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6vDPoJrz/pIY+yCQ6HoimbmiTOiV3/qDDJ5z5/BxDHQ=;
        b=cQr6CdqpU8I7jvwoA3U3rK+V3Eg71OsuzNVv9zTqjHzKQDCv99bLSxuJJ8Z5mTzN9i
         3Eq5XvDCl3q2V4hpZEvzBBzA+1ZbbTvre2uSgIrVAuipnPM9sawRBM7FJXYWUgcP0iPo
         JmI46p91sxiIMvGN/Pp0hiImtbV6A4tWQdOQwOy8AGMF709qRu0mubmCqjYDZQjkmm0T
         13WutWxmJR5ESITsBAD8lHROZWmyeLbR63X1nrtb4JAuODtFm5zbGPZpc4FIadRa7fkp
         +gHQ0YO5wI8Mo69aGOLD4KdMPIkGuvtwA+FHW7Zct9UZcajitnKIQBx53SJ7hSr57nBW
         Z9IA==
X-Gm-Message-State: AOJu0Yzz2IiJbMalh+r4VNnCC0vYeQs+BOjdbRdrhhNLhjCw/bj/GeYM
	2z88TfIwwP5B2B5TSQgw0IYz0yScprem949zaagNOKsjdqTHvgkyHr1ZidePYhu0kO5Ho4sncyM
	o
X-Gm-Gg: ASbGnctumwWHDt2BSJ7We3w/IOxQDM2ogT7jjcziijaTWeAXb8RplDwAcP4T5jGaPUg
	LaoOeEuvQ7daa9Pvs3IyY4n3NLK2wcnBBJ0s45YGvN8ThkB3a7oce9+bp0qQp7Az59+bfliGpuy
	RRLkPQusbbNdESpdZfQxx61acLNhBzKYzK19I8UdX5jZGyP8fYfJtUKpZtXS8nZBMKfBXGBqDJF
	djqlFI6jEL3JUvcUqB+SqwnI87RHW6JlVkTmYrj+lWJEqxRMeeH4bGUc2c/xXCD95L1+45OQOb9
	YweUYpDN
X-Google-Smtp-Source: AGHT+IE5R/TEBJpJNxweLPQa2FYA8iJW0nP8WRe8VjEslpbiV7h3u8+V/mXdxh11obuOMFEhMnXvNQ==
X-Received: by 2002:a17:907:7eaa:b0:aac:4324:977e with SMTP id a640c23a62f3a-ab38b163018mr2412551566b.27.1737560744272;
        Wed, 22 Jan 2025 07:45:44 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384fcb262sm913470966b.169.2025.01.22.07.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 07:45:43 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-tox: Upgrade 4.23.2 -> 4.24.1
Date: Wed, 22 Jan 2025 17:45:40 +0200
Message-Id: <20250122154540.82436-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250122154540.82436-1-leon.anavi@konsulko.com>
References: <20250122154540.82436-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Jan 2025 15:45:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115018

Upgrade to release 4.24.1:

- Adds ability to configure stderr output color

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-tox_4.23.2.bb => python3-tox_4.24.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tox_4.23.2.bb => python3-tox_4.24.1.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-tox_4.23.2.bb b/meta-python/recipes-devtools/python/python3-tox_4.24.1.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-tox_4.23.2.bb
rename to meta-python/recipes-devtools/python/python3-tox_4.24.1.bb
index cce2cf76e7..9532c6a094 100644
--- a/meta-python/recipes-devtools/python/python3-tox_4.23.2.bb
+++ b/meta-python/recipes-devtools/python/python3-tox_4.24.1.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "http://tox.readthedocs.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11610a9d8fd95649cf8159be12b98cb7"
 
-SRC_URI[sha256sum] = "86075e00e555df6e82e74cfc333917f91ecb47ffbc868dcafbd2672e332f4a2c"
+SRC_URI[sha256sum] = "083a720adbc6166fff0b7d1df9d154f9d00bfccb9403b8abf6bc0ee435d6a62e"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling
-- 
2.39.5


