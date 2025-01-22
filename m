Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACDE5C02181
	for <webhook@archiver.kernel.org>; Wed, 22 Jan 2025 15:45:51 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web11.46587.1737560745311157715
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Jan 2025 07:45:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=ePfK3X/V;
 spf=pass (domain: konsulko.com, ip: 209.85.218.54, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-aa67ac42819so999708866b.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jan 2025 07:45:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1737560743; x=1738165543; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uvX8DPSem9eCetgnUTvwJMeSycSe6C3If6FiUrSpXwM=;
        b=ePfK3X/VqzyadxmkAB/clV2F5nzDDyTjIS79ZDWCjSSU/ZgoLO/YNZuXUsE8AvMwPJ
         WEzjHLmtKvZKHz1ze1lKTQe//I/wasajMGOxIx3ClNSjlFK44ENnhaMIV2wJ66zDHGxP
         q2Mv08vVcbDkeiroLxaFdZPs5MXZsp0pZGtnQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737560743; x=1738165543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uvX8DPSem9eCetgnUTvwJMeSycSe6C3If6FiUrSpXwM=;
        b=YLzQyYxaUGUfz0dquh78YdGXh5dZ1CyXJAc0o+u9GL3glO7EMmqbIvQHZ+5u7dlST1
         d2H41qK4fBiDu6l+nbgsnJEzuZv2ja6kE7bcxYxUe//Xs8JroFM9HxicS35b9HYWgwMl
         h2rOeZ6C8ZgvnQJ3Ipj0Zp4bvJTJCkLMoZbVU02CSSz1GU2mz178VLaFcAZGCiImtdch
         DfSOzPBkmf+Mg3lZ88jY1c4d6mYH/qeGzNvlTRoNcyzOUpJn67Zi7rRWS9kz5OYqEHDi
         eqMFkS/jFlM+AVUJgAmZuVflSl2iSIemAe7OCrzXGv28jLhnifpEJAlKUjz2YuwxYyUw
         oYiw==
X-Gm-Message-State: AOJu0Yx2WR8PFl+a+8R861S9MD523fIzIBfMePIo9vZXE/92cbacKxB+
	QXHjOGHQwBtwC+zxM/9YgyX25y/foI5lzH1yCEtlZXRcBYPh1gUdzHnIqVIEzvGQ2nFVA7BH6Aj
	c
X-Gm-Gg: ASbGncuQ9TlCqr59VV4xGDQbg0dohmOT759NZOMYoRbRrxCFhAUUXZSwg5PL+q0GLmC
	uYyA8Vf/Qt/kfBxOwZkMBU2j9QM9qm3K8M9uzEdJJIq0QZ0CnePTzI9PTb6VLPZFe0odb2iawC9
	hf1HcpbX/LpuMdL0a1TN7XvEPEsiC2pADc28lk1V4lteABshgf8uKgbjhswv7rTj9xK9eB0IAtT
	/ZhhX+fo1lUBgYPuHcRro/TZ33nliaggfYwWeJsiVFTpYLX1kYu2PVfC1E9nBHqpiaDvioFBA+H
	NdilU/9J
X-Google-Smtp-Source: AGHT+IEqw6q5Gazj/rcKGLcayqgsdOyvrfAmOxO0ILzje77ujjoiONspOSBYX41ZZCyyATO1tHeJ+Q==
X-Received: by 2002:a17:906:dc8f:b0:ab3:ed0:8d7 with SMTP id a640c23a62f3a-ab38b15cd26mr2228025766b.23.1737560743333;
        Wed, 22 Jan 2025 07:45:43 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384fcb262sm913470966b.169.2025.01.22.07.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 07:45:42 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-aioresponses: Upgrade 0.7.7 -> 0.7.8
Date: Wed, 22 Jan 2025 17:45:39 +0200
Message-Id: <20250122154540.82436-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250122154540.82436-1-leon.anavi@konsulko.com>
References: <20250122154540.82436-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Jan 2025 15:45:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115017

Upgrade to release 0.7.8.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...hon3-aioresponses_0.7.7.bb => python3-aioresponses_0.7.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-aioresponses_0.7.7.bb => python3-aioresponses_0.7.8.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-aioresponses_0.7.7.bb b/meta-python/recipes-devtools/python/python3-aioresponses_0.7.8.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-aioresponses_0.7.7.bb
rename to meta-python/recipes-devtools/python/python3-aioresponses_0.7.8.bb
index 1f801877c6..1b74b839a1 100644
--- a/meta-python/recipes-devtools/python/python3-aioresponses_0.7.7.bb
+++ b/meta-python/recipes-devtools/python/python3-aioresponses_0.7.8.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pnuckowski/aioresponses"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b22b40d5974300051216633098387c57"
 
-SRC_URI[sha256sum] = "66292f1d5c94a3cb984f3336d806446042adb17347d3089f2d3962dd6e5ba55a"
+SRC_URI[sha256sum] = "b861cdfe5dc58f3b8afac7b0a6973d5d7b2cb608dd0f6253d16b8ee8eaf6df11"
 
 DEPENDS += "python3-pbr-native"
 
-- 
2.39.5


