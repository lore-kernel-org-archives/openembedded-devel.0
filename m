Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7653.1793265716316052975
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Oct 2026 02:21:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=p9a+doc9;
 spf=pass (domain: konsulko.com, ip: 209.85.221.44, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48b042c0759so962576f8f.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 29 Oct 2026 02:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793265714; x=1793870514; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tenru8kvV1uzzBivKfy77ufdDtk3BY1R0z4bsDAZCdM=;
        b=p9a+doc9FDsgn6M20TR4W3TXuygX6RASiYzaM6lqgV8hYPuD5npFfE3CLEdVVMSgEG
         65XgAWN07iWXRbl4qoI694glj0dikaYNxQb8jc23C5kb7JSaLRtefO9c82QOmf2/4T/a
         pKYyiMQSD88HCjJxQnDf9JtzH3E6tM1nSEOA0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793265714; x=1793870514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tenru8kvV1uzzBivKfy77ufdDtk3BY1R0z4bsDAZCdM=;
        b=cz0Rsj97EKS3v3Q/HdIWTk/Y34y2sLQZEtUebokmOLydk/SqGHrPGvoy+wi+6tVgY7
         Bjps42owLF7Hq3C4py4B/hdYKnugFUDUPUl/4Iw1vS2oN3xy5ZdHTHy2yQM+2FsLM4su
         3/UClqbeWBD7CxAUJxYF7QT32Q5T3ZrBaQ8NTFHOv5IX88K7KmZQ10zy5j6DvZe60++Z
         iHM2aLGoFpjTPZQBrweIWwLVSc+ld2bMH3+DmXSuUh6fgBlgX6qCIG1IF/+5DHVjh8dj
         NjihwH/4YYlUObloJcbVcZh/j2DmGgdQpMYvukryehgxalqjNQ15MlEUTy+uVQybv0Rl
         OVWw==
X-Gm-Message-State: AFq9FYJdmwbC1IXg7Eav6L+e3vMY98yaE4WPZrgGiGuW3sMXG3W0lL+T
	KtQAV6xC2QQlfD07nCYE1yxRDHF86+yCv1rCL2xctToIpDP3nMoKvh0TYKzx8vad0uXrFj5SXKx
	0YZaA
X-Gm-Gg: AYBFou3m9neMohD7CIx4HRjXqL/tfDxa3Iy6nKUlrhz8UlN7hTJOz05jqDdmgRbjSqN
	YtxgZJ64NY1/TYDCs2qOfkzVtf0M4p0MJHJ4DrJJ/2Gh71CHjlCED0vtqqt4Ekk4Mf83L/llVqz
	AaYWIvLGMF4QKEtfx48oYcdStTO3KccCF/rD8EdMFKCPvkKrbeskPYLC5Upj6b+YJcS8FQ9I9+W
	vn26F5ses8FsOdrTTvfSpDkRUvDFCoD4BQibuE0ftvU5PIxNX4cU4+9fyN9ukAx7MMVp8wND5Pv
	yAAGqPmQmzwvj0D/sKIQQLim6Vd2IbW1qfuLC264VKIwjsEsbxsH7pvPm4Xt//c+hQW3E6ru9p6
	6kIZZIoNiHgksp82BeCIMxQ52umAYK6Fm4bEzrMA4yVE/HDMOhV12dSAV18JajzWHz1PVESayDE
	73Gtdbb5Dbk0shjFUU5XR2izZ2RQM5a03unotoSoYBz/JZO/nrQHSks6M+XSiIDsepAzcMnVmDQ
	EpOGq6a1/XZZSagEHB/oPMgzvRvOjr2ZAK9MBLM6sR4q2H4EGqCyT0tqybJeCLzNVUVBZGKRebG
	S9ocikB93mJvugq6Zkept1QydTWV5OgbgwsmybzsMW4q+KvpTQ50EVThNhQiekn+b0PEuT9cMHY
	/dxEAvpQXb9LBcUfidKu0N2KMeR+7HbwX/93npJ+XMzWnjFXJklc84Q==
X-Received: by 2002:a05:6000:2207:b0:48e:61c9:4e32 with SMTP id ffacd0b85a97d-48e61c94e5emr6609475f8f.32.1793265714485;
        Thu, 29 Oct 2026 02:21:54 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecdf9bdsm31901084f8f.55.2026.10.29.02.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:21:53 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCHv2 4/4] python3-jsonpatch: Upgrade 1.33 -> 1.37
Date: Thu, 29 Oct 2026 11:21:47 +0200
Message-ID: <20261029092147.791220-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261029092147.791220-1-leon.anavi@konsulko.com>
References: <20261029092147.791220-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 29 Oct 2026 09:21:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131648
Content-Type: text/plain; charset="utf-8"

Upgrade to release 1.37:

- Clean up in-place output after write errors
- Reject invalid patch document containers
- Use UTF-8 for JSON command-line file I/O
- Handle source pointer objects in move location helpers

Fixes:

WARNING: python3-jsonpatch-1.37-r0 do_check_backend: QA Issue:
inherits setuptools3 but has pyproject.toml specifying backend
setuptools.build_meta, use the correct class [pep517-backend]

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-jsonpatch_1.33.bb => python3-jsonpatch_1.37.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-jsonpatch_1.33.bb => python3-jsonpatch_1.37.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-jsonpatch_1.33.bb b/meta-python/recipes-devtools/python/python3-jsonpatch_1.37.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-jsonpatch_1.33.bb
rename to meta-python/recipes-devtools/python/python3-jsonpatch_1.37.bb
index 6a1715c6df..2b782d2eab 100644
--- a/meta-python/recipes-devtools/python/python3-jsonpatch_1.33.bb
+++ b/meta-python/recipes-devtools/python/python3-jsonpatch_1.37.bb
@@ -3,9 +3,9 @@ HOMEPAGE = "https://github.com/stefankoegl/python-json-patch"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4f81c84f9a053e31fe9402a2a4e78864"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "9fcd4009c41e6d12348b4a0ff2563ba56a2923a7dfee731d004e212e1ee5030c"
+SRC_URI[sha256sum] = "04288ef93e60084bcb118101cd9d53424e627b91bb47ec5a95c02ec3795f6d23"
 
 RDEPENDS:${PN} += " \
     python3-json \
-- 
2.47.3

