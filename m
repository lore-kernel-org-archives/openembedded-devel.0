Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B5F1EE57D4
	for <webhook@archiver.kernel.org>; Wed, 31 Dec 2025 07:54:49 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.81865.1767167680367158317
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Dec 2025 23:54:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KdtWiEHs;
 spf=pass (domain: gmail.com, ip: 209.85.128.67, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-47775fb6c56so81194105e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 23:54:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767167679; x=1767772479; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=3zCHW6q/C7fUzean9kzGm5jCqNb2WJxostlxHsTSf0Y=;
        b=KdtWiEHs15ZC94BTeZ8vEGGS8UnOyuMeU/SDfrQKZmGmazWVgdgbmjDrDnZgHsPSXs
         tD46wt+iZ/p4EoNTpy4fITCnR4qL4Aj0oQWW3wQgCfTB+nZp+TRXXb9OHAek2H6EvGDV
         JDiHct/uiJDlp1nrAgoys+STQVNxSQjfn/FPgVB9pzCMottx+8bvMOaqUjVWbRMcxeW1
         XutafF0j0nHbNU1MsIxgEWaYLmoDZ+tomwaTRU4+Lnht3UhH/KS4sqiOnrD71OE5vjHx
         BJylBJSnevNxvPx4K+fKRW6tfigqKmFedEkUX/z+gs5aXIKYtSTLL5enu2IJgoItC/fz
         JHOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767167679; x=1767772479;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3zCHW6q/C7fUzean9kzGm5jCqNb2WJxostlxHsTSf0Y=;
        b=fD7MuxI6bAVgSTgJtgzcgpU3pwp4xQOZtXmzvOPLofGr9+V4WjxArnjy1vq9pbNI2A
         K32A9k9VkEz63VqE3TjQiPf0bgxnprCUrzyjGRSsxmU9KdxNSVG0agRzoP7LQLr/y0wU
         rAVY8DUNtOufkfdjKqC+h/7ShYBX6UMZe7V8TCP2l2CekpnAMHk5vDMZtprltVuAcoWQ
         f/Vp6YaORPadRPWkFZfwIsddIRGD3yAegrGeFjx3Yml5sXL+0vg42/iVAFTo4Z4r+t58
         PBVLXWj3Glvzlp4xvP3h1Yy/Dijk4/DNED5Pk80gKMluCH+Ar81uY6HlvIAnJLZuYL6u
         SkXA==
X-Gm-Message-State: AOJu0YyASpkueC6C/tPX5I/qt+Ru5EAWSBO20YfH6ZNSmYUtmJF6/MNc
	/JshjFgphseQSHylxBHANr1QWeTCOcnWWwCW/uNcPbeg4z2kQZdySJgktt//aJ1G
X-Gm-Gg: AY/fxX5yw4TeO0a03pupGQvLE5xhIwfWTUkb7p0JtSRd+YC560vjPpatb+tYkNgOw6P
	2boTXVpsDlbq16iqFRn5kiK5/u2enFVot5NnVnmTTbkQ5xCWMhAR3G79QkakHSLrlRTr40QNKhN
	nrvLUh5CUZyNU4R/3BDLDWC6AP9VZ/4UvSrXFVZfofQ1ms7c6ApkzzffYj8nZqpGhEgjo6rOb8B
	AidVfbvDmjYMXGKzQvSOuWZHk4ScXik6EPBiKQTlzFnJ+c4PoO8eENDE5d1F8T8lRfmIhx1m5vI
	wr+/GVsi9jgeklJFLNS+10KXgIkZJUJRyCFT04ha53jmI8SP8uhuOMPghGV/fXQG/SGNLb2OKgC
	0mIr4iAhGvWYiQTDgmO1dlowFuHjmDbed315J5g/Qn2o2V0o3Fok7ouhl4nTvO26Ul1loLgNCtL
	jKs3GOX3Lw2+OqewQ1vms=
X-Google-Smtp-Source: AGHT+IFzAiMgxkHbuF8tQ3ntEIWUFlH5AVmjWHOgjVFlKq3Hmd6MRtSNiaJf6Ez2s9x6RivFgYcJDw==
X-Received: by 2002:a05:600c:1d0e:b0:47d:18b0:bb9a with SMTP id 5b1f17b1804b1-47d195a87b6mr441768235e9.33.1767167678474;
        Tue, 30 Dec 2025 23:54:38 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be273f147sm700559825e9.7.2025.12.30.23.54.36
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 23:54:38 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 01/34] python3-pandas: set CVE_PRODUCT
Date: Wed, 31 Dec 2025 08:54:03 +0100
Message-ID: <20251231075436.771395-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 Dec 2025 07:54:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123041

Currently there is only one CVE associated with pandas, and it is tracked
using numfocus:pandas CPE by NIST instead of the default python:pandas from
pypi.bbclass.

See CVE db query:
sqlite> select * from products where product like 'pandas';
CVE-2020-13091|numfocus|pandas|||1.0.3|<=

Set the CVE_PRODUCT accodingly.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/recipes-devtools/python/python3-pandas_2.2.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pandas_2.2.3.bb b/meta-python/recipes-devtools/python/python3-pandas_2.2.3.bb
index 60cc01800f..91333d129d 100644
--- a/meta-python/recipes-devtools/python/python3-pandas_2.2.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pandas_2.2.3.bb
@@ -15,6 +15,8 @@ SRC_URI:append:class-target = " file://0001-BLD-add-option-to-specify-numpy-head
 
 SRC_URI[sha256sum] = "4f18ba62b61d7e192368b84517265a99b4d7ee8912f8708660fb4a366cc82667"
 
+CVE_PRODUCT = "pandas"
+
 inherit pkgconfig pypi python_mesonpy cython
 
 DEPENDS += " \

