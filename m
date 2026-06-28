Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE4F2C44507
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 08:12:27 +0000 (UTC)
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.69144.1782634338136037159
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 01:12:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=cSGe/qvi;
 spf=pass (domain: gmail.com, ip: 74.125.82.178, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-30e7eb50b83so778687eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 01:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634337; x=1783239137; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dqhmnFDiURk5nYx/DS3dRtDDOul6kMrQXmez0aKdQB8=;
        b=cSGe/qvibos7t0HaQRHFcBj8atdQ2KyD4iC7SWIXVgqvuOcbpLtuPbJnbO5VK3fGu2
         pkcStHQfKSGxx6uTY/jGPYFAvCFwk27nleCV3y43QEghMK5zPENKnhGYB8g+bd8Bv4z2
         T2x4qM52mGz+RHesQFHynMErKQ4oQ/6Jh2/+TlidfxfGFShsziXpFKc1Wwtlru1RHQ19
         hswBjxjRyX+X/PUW25WnnsV9P/hvNdlRdo3e1h96dnUjtk2EQGX0pfzMxvdaLU3eBDWp
         ssKVJlgd+ofkOjivGuy46d0NzNS3e6cF0l5u+X+GsGe8fKB5iiIfB43uO+cUinJyT3CM
         VIhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634337; x=1783239137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dqhmnFDiURk5nYx/DS3dRtDDOul6kMrQXmez0aKdQB8=;
        b=A6ypInGRjGz2OZFOMdPSUkfhDZ29PBkXYVfa4DcoGYVtMFB6gIHObi+BqhA/f5FJfs
         o7rExGfi0XAiMjXCbDATnEloxQAznxllDCoMSAwj138EShcB3zP5KBLWbpj2VDpWJqql
         bkWaki7HeGnJjcGKmMh2zfmOmKYVK/w3a/TqtnMb1MZTEhWnlKhee3B5cAPZhQUBga85
         dgN+k+XryJ5fZzNO3jtiVu9WRXsZhLkmPtXeUW/UD3DHR3KlfCMs3+Vu94NshQiAiAqo
         EX3soBZ7xBED4zB+awkCDAaLMuDRPTnA+vORDyAmiJbMtDHRPyOq+DydG85rmtpGpRTz
         Rhew==
X-Gm-Message-State: AOJu0YyLVNzOKhxXAhZeJB9z0gGGJQ8S1/7+9GRm00IMDRLR2PjU4vA+
	8IycNowVrI3pdhdJPcHFI3t3o9T2J8lp1veCE0/npiClGTm/A0ka5BoIn+ZXZg5bsQrFJA==
X-Gm-Gg: AfdE7ckgBb1ruZrAaA3DWSe3txC5blAaHTlj8yCLWZDAjsefzkey3h6iCS6sFIt5zhg
	LXUt0fLl87PsqiL9p9+U6YAa1YUBGJGkloDyycPlb77gqmZzmo2G9XU2V5uB+hYDByiKDAaQPbD
	RtgtQ6m45Rv4BcY/Rv6WYSMrr9k1ll6Ci62IC8lC744YdYysiXAW7t8cAEdE1cZOahUCEtVmlx9
	aiZWc0lMA4YMJGNgYT8BuB5VSc68u4arQC34J/xFVArmPbTtz0UA9/LJk+vPW78ihIZGPa0XTe1
	IgvNEKKQ/DC90gPcTQRKJZ3LiZKl92pzWFKOSh3freLyPbohxZnRUqZqhVeUjmr4HHyMqyr6krX
	6Qm1sEPHaxP9K4RdmefZVT1uqXmA3rCp1HEd4dAB6WyNkTpwhioelRBA/MuBddcAyFI6i5Mpofg
	iqt9mt7K+iXPzop0UeDEl6il3Bj4I01fc6oC+VK417WE5HfoaTdJvlsKoy4c5kPy8ZZtYSt8PZa
	k7ohLS7TMzvIUiOUD2eY9dmc7AwwUI/0lKrax+KoqdFO2b2F3+VXG0JfUoG3CXzOEw3WoJCA+1s
	UOW3quijAtOrtPpceYZEutWVNHPCsg==
X-Received: by 2002:a05:7301:6007:b0:2ed:27a3:eae3 with SMTP id 5a478bee46e88-30c84d409dfmr11841797eec.26.1782634337453;
        Sun, 28 Jun 2026 01:12:17 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ea81b39easm6306040eec.31.2026.06.28.01.12.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:12:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 057/128] cfengine: upgrade 3.26.0 -> 3.27.1
Date: Sun, 28 Jun 2026 01:10:08 -0700
Message-ID: <20260628081122.178348-57-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
References: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 08:12:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127867

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../cfengine/{cfengine_3.26.0.bb => cfengine_3.27.1.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/cfengine/{cfengine_3.26.0.bb => cfengine_3.27.1.bb} (97%)

diff --git a/meta-oe/recipes-extended/cfengine/cfengine_3.26.0.bb b/meta-oe/recipes-extended/cfengine/cfengine_3.27.1.bb
similarity index 97%
rename from meta-oe/recipes-extended/cfengine/cfengine_3.26.0.bb
rename to meta-oe/recipes-extended/cfengine/cfengine_3.27.1.bb
index 28ea16ea6f..799d84a621 100644
--- a/meta-oe/recipes-extended/cfengine/cfengine_3.26.0.bb
+++ b/meta-oe/recipes-extended/cfengine/cfengine_3.27.1.bb
@@ -18,7 +18,7 @@ DEPENDS += "attr tokyocabinet bison-native openssl libpcre2 librsync"
 SRC_URI = "https://cfengine-package-repos.s3.amazonaws.com/tarballs/${BPN}-community-${PV}.tar.gz \
            file://set-path-of-default-config-file.patch \
            "
-SRC_URI[sha256sum] = "d3c3884b314dae48a6884e919d0a12acac5aea95d970544e4632a1773857d19b"
+SRC_URI[sha256sum] = "878e52c4a6cc3bd28048b527a920fba86ce4cd99c5760adc42417a811efa6e6b"
 
 inherit autotools-brokensep systemd
 

