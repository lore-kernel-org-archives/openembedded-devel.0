Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C69D3C433F5
	for <webhook@archiver.kernel.org>; Mon, 29 Nov 2021 18:50:49 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web09.65599.1638211848083106163
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Nov 2021 10:50:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RhU5D+/I;
 spf=pass (domain: gmail.com, ip: 209.85.128.47,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id
 j140-20020a1c2392000000b003399ae48f58so17634615wmj.5
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Nov 2021 10:50:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BLIW6F9R6lXrMjGT2Jj60ByrpqZRjMathgOIz7kPwTU=;
        b=RhU5D+/IGBBCzrkvb68VKkUo3BOSf+GE3lAPSrlt9KnfP9xYLG6WQW0ynDmByaa7f6
         LcuQJYmDb89MKjoqO7q5PBwzf2noCqDk8aZocR6LM9/dz62+iLo+WcT+ObEZecyv8OHw
         14H6ZN0RyvjEIbhhvGdPEBHOqXuXEdqshCQt8QPTwS+DQyMFSU1wmyO8kIMd+s+hpeyv
         1CCa8CtmFSV3OY14dtVVljKaVtdgIafzsUH9NCR4MLwKCqA2mvwE269ZfNbADw6uGife
         k6/jMtMhws5NQX8uyApxPivSjFvxsv8SwlBHnRigRdF1hj/7CZtURGmb9dl0GXkqeu2W
         QfKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BLIW6F9R6lXrMjGT2Jj60ByrpqZRjMathgOIz7kPwTU=;
        b=wssac8l407XREOkExkaiCvawtdVKkpkPvadKEiU+0Lpfmro1Jnk0oK4b7CS/QA1Fv/
         86bgxoPEyFNhf55Gg/hdw0hLWcJ3Sb7egOtCM+Q9jYwnZMEKNRqTvYYo2yNMdrNtU1we
         +b82VjZ766NWBV8SW3d9bXjtkIlJJ5pFK0rMQAxdvlQH2760YLvVg1FbbuBQE4CnYV9+
         XC4QaDLO5z2nqyyptwnEKB0S5z91cCFteH+TY2Gv/PE39RvONS+XHcWN9ddFiUWXNACx
         JfvPZ8Gbf4Nfu7onXVE6UrsPb252avjokqEUXcV4cg2qyytUjU0GUPi9Yl2vK9mt0I8o
         nx2w==
X-Gm-Message-State: AOAM531obbcBrWONXsfEtozqQ560LVsaBYOKwnHfIoqeEKSaTFujb0oG
	lv8u1UTXpEZCevLdRLNIf8Yu84LQ8o4=
X-Google-Smtp-Source: 
 ABdhPJyL7muBDcU0DyvUqFFaRxQ8fRmPNzU9NvfT7z+xZnUnA+1cIL1sbm6xI4cGFu6134FhpzkXNA==
X-Received: by 2002:a05:600c:3647:: with SMTP id
 y7mr15550wmq.39.1638211846611;
        Mon, 29 Nov 2021 10:50:46 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id
 e18sm14683840wrs.48.2021.11.29.10.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 10:50:46 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH] packagegroup-meta-multimedia: include x265 only with
 commercial in LICENSE_FLAGS_WHITELIST
Date: Mon, 29 Nov 2021 19:50:44 +0100
Message-Id: <20211129185044.1002338-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Nov 2021 18:50:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94141

* fixes:
  ERROR: Nothing RPROVIDES 'x265' (but meta-openembedded/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb RDEPENDS on or otherwise requires it)
  x265 was skipped: because it has a restricted license 'commercial'. Which is not whitelisted in LICENSE_FLAGS_WHITELIST

* also include i686 so that it's included e.g. with default DEFAULTTUNE of qemux86 as recipe allows that with:
  COMPATIBLE_HOST = '(x86_64|i.86).*-linux'
  i586 isn't used by qemux86 since:

  commit f3b1e577ec94c849d0354f5679257f02ef4e4fe9
  Author: Alexander Kanavin <alex.kanavin@gmail.com>
  Date:   Thu May 16 17:04:04 2019 +0200

    qemux86: use a Core 2 Duo CPU instead of the original circa-1993 Pentium

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../packagegroups/packagegroup-meta-multimedia.bb               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb b/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
index 7e581392b6..cfe96bf024 100644
--- a/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
+++ b/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
@@ -74,7 +74,7 @@ RDEPENDS:packagegroup-meta-multimedia = "\
     tinyalsa \
     tremor \
     webrtc-audio-processing \
-    ${@bb.utils.contains_any("TRANSLATED_TARGET_ARCH", "i586 x86-64", "x265", "", d)} \
+    ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", bb.utils.contains_any("TRANSLATED_TARGET_ARCH", "i586 i686 x86-64", "x265", "", d), "", d)} \
 "
 RDEPENDS:packagegroup-meta-multimedia:remove:libc-musl = "projucer"
 RDEPENDS:packagegroup-meta-multimedia:remove:powerpc64le = "openh264"
-- 
2.32.0


