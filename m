Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95E21C0218E
	for <webhook@archiver.kernel.org>; Fri, 24 Jan 2025 10:58:52 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web11.9324.1737716329083366200
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Jan 2025 02:58:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=m7dJe9pt;
 spf=pass (domain: konsulko.com, ip: 209.85.218.49, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-aaf57c2e0beso419067466b.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 24 Jan 2025 02:58:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1737716327; x=1738321127; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=483/p8ymbFE0TEPp/CdeeobBXHZg5fBZ0QRKL2kzpp0=;
        b=m7dJe9ptZKVJgLlpneIi1kw+qImRikGsUt11/Bx0AiT74zJREcj4rMyyp4Jb/VovmG
         1h173oJKCfw8FGMRMqxeOFmNNvZZMPObULHT0p1u5EVFfjsDuy81zsNPdbeYcLer4iVc
         bJtdyvSHrTMX4UwXPgkNOFXt1jfH3X1/mgDHY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737716327; x=1738321127;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=483/p8ymbFE0TEPp/CdeeobBXHZg5fBZ0QRKL2kzpp0=;
        b=nPXzFlu4ZoX/lZseKQOrLOo5Tn4E3CG68VZSIMVSP5rkn6oNEyTDd1F0GFKFeSG4CW
         7by0qbImWzG5F94bPMo4G+tNGEnhOWHYrcgBv4d5Om1ZzmDwb1kFtRUydLvbdvQvFdJv
         fPhM/tHMF9QoCVc1W2Xd4UsTqnqy9fHMQyNgvM7ETXtvdDAQFcpU0HmHSR6IJbCttauV
         1y+SNvmF1RtnaA9ycbLoTyHhGDG0IPjpSQzKhsSj4e7tvd0bLfPPW+kKDSZfbuMc3ODT
         Ogo6F55sZhMq0pNpwpiHOhTfmNDMfQeynxRmqf+2S5uOgnbvsz9yrTJUFrawYYHvKrWP
         xIhA==
X-Gm-Message-State: AOJu0YxMIS7BYtmLnLi4sYEgyPfIigDG1xIR1nE8pINkzSkJtDXQ1coN
	xewmH9GzWY+Oq6DoWNVQoczZKxUe4RHFmzA/2WMIVY8zEMaj5Ae1CsGcw27PVIeEpOsI1JmSgeE
	s
X-Gm-Gg: ASbGncvIywI+ad2B6swq0B/spCL+tuw8x2qQyzGgVfjJ6MO6E45wa4EAb4VfAmHHHZj
	mOoUkj1ZlnTH6Li6vgNdDQvyQN9eheaahCvxZDdJbFLa/yTTVbK+snmaWM7m0UXqlUbtxI5Tghu
	SKV992SPY39ABusoW6z7IecIsgO9wjZ9AWA2ncsmAwqIBJ88qIsMqpprXBHLlNzF5Oi3rrd+fAq
	nNxUl3sNrFgfDg08yUXKVbqcafUJv8kb+u3gsYuXnTCpXIIw4YjIK8KVhTKxchIF2HvRRvELzJy
	1ZinM6XF3ATYbjEVR3g=
X-Google-Smtp-Source: AGHT+IFm6mBUqZkYEWEvgcevwa52jbgIIgsh/kgU16r3CGRif2XeJTk+ldUVYQ9aESUfmiJtRA7ZVg==
X-Received: by 2002:a17:906:dc8c:b0:ab2:f937:b3aa with SMTP id a640c23a62f3a-ab38b4cff42mr2777798566b.56.1737716326150;
        Fri, 24 Jan 2025 02:58:46 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab676117260sm107842766b.185.2025.01.24.02.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 02:58:45 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-pocketsphinx: Upgrade 5.0.3 -> 5.0.4
Date: Fri, 24 Jan 2025 12:58:39 +0200
Message-Id: <20250124105843.2035512-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Jan 2025 10:58:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115053

Upgrade to release 5.0.4:

- Fix _pocketsphinx.pyx's set_alignment example
- fix: evil version pinning must die.die.die
- Fix typos discovered by codespell
- GitHub Actions: Add Python 3.13 to the testing
- Add a simple language model maker script
- Add suggested packages to README.md

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...hon3-pocketsphinx_5.0.3.bb => python3-pocketsphinx_5.0.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pocketsphinx_5.0.3.bb => python3-pocketsphinx_5.0.4.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-pocketsphinx_5.0.3.bb b/meta-python/recipes-devtools/python/python3-pocketsphinx_5.0.4.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-pocketsphinx_5.0.3.bb
rename to meta-python/recipes-devtools/python/python3-pocketsphinx_5.0.4.bb
index 4391da177e..2276ea8571 100644
--- a/meta-python/recipes-devtools/python/python3-pocketsphinx_5.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pocketsphinx_5.0.4.bb
@@ -6,7 +6,7 @@ LICENSE = "BSD-2-Clause | BSD-3-Clause | MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c4d720cdc9c6953091f65e8b01524bb4"
 
 SRC_URI += "file://0001-cython-Use-cythyon3-in-cmake-check.patch"
-SRC_URI[sha256sum] = "27f4de0ca2d2bce391ce87eaab84fe6f0bc059b306fd1702d5fe6549b66e1586"
+SRC_URI[sha256sum] = "17d2971e998490def9554b6ba41886708422af5b4ae888723b1b077aab0fe8d4"
 
 inherit cmake pkgconfig pypi python3native cython
 
-- 
2.39.5


