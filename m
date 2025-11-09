Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25945CCFA13
	for <webhook@archiver.kernel.org>; Sun,  9 Nov 2025 16:00:47 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27208.1762704042816751282
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Nov 2025 08:00:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lOUrWj16;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-471191ac79dso23459345e9.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 09 Nov 2025 08:00:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762704041; x=1763308841; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4ZSx4402tj0KJrlTgFn876QEVuhQj8bwuopKkopwA/U=;
        b=lOUrWj16dyuD105Yy1CxDHyan/QIoI4fYS8QCGvQFO7udVBQp01Mj/Xlr1RzfaO3P7
         i2qQCHrFaUWoc2LTmvRfBKWwEkI4aFN4KfhvnLAOMJEUHcqHq9ca/kcL6QsG9YQXNG5E
         x/qUow7vz+BvevDpEigvbunvdnETuIAwVWAFn8NcpftHbOWSXtVHk62euNwdG7i07AgM
         XbRvICBytNWWD/MDR8ZuHEv9dgdPNfu44t/doVOja5JDVHgLLBqEYNEe++uKcqn2+i3x
         QLfK6XBHC5J2jp8W7i2zghid6vzFdKyHf/jEfQcv9Hx+9YvBJ/WE+diWYs2blfSRvFD9
         GzNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762704041; x=1763308841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4ZSx4402tj0KJrlTgFn876QEVuhQj8bwuopKkopwA/U=;
        b=Cd8SwyLsvAzY3H6RYmWPnbYBgYT2gd9P7/dW1EDYyP2D6u6zVb/KOkL+nWZkNWyzys
         F41Hc1IljCL1QvsByuDalEJ5+ggCzrbsO/YY5eCxHj5lQQlVqucYO1wbspmHDkJDKTrO
         UufVvgpLxDkd2e+txHMRm/3/TkqktD4CX2tOMuJEKeO+vPZ7sVoTE0Vwy4dK2o2LcTs/
         qFADrBnyux6Sn1t/kFxCYJqQF3jaWfig4GeWz/9fiyOgt95dBMgrNA0cRR2BwyaW7Vvr
         ERXMKnn76ENFNg0YglsgS/2y79WOlxXPMHNzr6bzHwZQgGbr0HxknHKcKhKPZaqeaKkq
         rWKA==
X-Gm-Message-State: AOJu0Yy35k3nemVVeLqVC6kJuf1Xg5i7anLTNF66Mb2RkJCGe/NHKDYP
	nTiLoBV+qgEN4nM9vJuXfvR2R3tfEywwTXokZBAtzJ/Skbu9W5pIL3AfZnXumZBe
X-Gm-Gg: ASbGncukZCPymR0MwodQei8mHR3UhZGsBZ+cluATcQIIZEwWjNistuRVTPQtOTUC9kG
	INMtG5fFM+B1QeP2PVbodp7nhgz41aeUjfK+rnsv/gysGpruNPz7KBMGe+5u79hdKK8e7O30eoc
	YT1WQ3DLHOFB2bX/sGClCyYGIDsHIiaCrAI3wYttAADYpq6WFRiNa1cZLpdM8f2e0tv6qw+Fms7
	yatyDWcA3MzmXWh5VAO4KC8bH5hwtI7LNtIrZSQv6sX2JzdpADGu9YLihKqIu9taBUv7jTxAgnB
	CMMDYZFGK0mM6sL+Zcx9qBahfwZZP41Tvrge6Vrr28D6UWuOpQ3SIMwmu+sbg48bIdy7R3gTqhB
	b/ok9fbVkYMzZQptnkB8cwO/19FfHPGQszztIZBhPOwtVT/bPRj0sbHng8lpWu5aFZXhTpybMgA
	==
X-Google-Smtp-Source: AGHT+IGXJZIu0yFIZkt+QEQYW+yV6U6shQD8cy+O653vRe4JUSfJ3aXXTNNwRC8zGVYfP1GKTVSoJQ==
X-Received: by 2002:a05:600c:a6a6:b0:477:79cf:89d4 with SMTP id 5b1f17b1804b1-47779cf8b43mr13325875e9.31.1762704041107;
        Sun, 09 Nov 2025 08:00:41 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42abe63e131sm17406445f8f.20.2025.11.09.08.00.40
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Nov 2025 08:00:40 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 18/27] id3lib: update remote patch SRC_URI
Date: Sun,  9 Nov 2025 17:00:10 +0100
Message-ID: <20251109160020.2522353-18-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251109160020.2522353-1-skandigraun@gmail.com>
References: <20251109160020.2522353-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 09 Nov 2025 16:00:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121434

The URL of the patch archive from Debian got out of date - update it.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-multimedia/id3lib/id3lib_3.8.3.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-multimedia/id3lib/id3lib_3.8.3.bb b/meta-oe/recipes-multimedia/id3lib/id3lib_3.8.3.bb
index 379c7e1b63..9e4b516aad 100644
--- a/meta-oe/recipes-multimedia/id3lib/id3lib_3.8.3.bb
+++ b/meta-oe/recipes-multimedia/id3lib/id3lib_3.8.3.bb
@@ -6,13 +6,13 @@ DEPENDS = "zlib"
 
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/id3lib/id3lib-${PV}.tar.gz;name=archive \
-           ${DEBIAN_MIRROR}/main/i/id3lib3.8.3/id3lib3.8.3_3.8.3-16.2.debian.tar.xz;name=patch;subdir=${BP} \
+           ${DEBIAN_MIRROR}/main/i/id3lib3.8.3/id3lib3.8.3_3.8.3-16.3.debian.tar.xz;name=patch;subdir=${BP} \
            file://acdefine.patch \
 "
 SRC_URI[archive.md5sum] = "19f27ddd2dda4b2d26a559a4f0f402a7"
 SRC_URI[archive.sha256sum] = "2749cc3c0cd7280b299518b1ddf5a5bcfe2d1100614519b68702230e26c7d079"
-SRC_URI[patch.md5sum] = "997c764d3be11c9a51779d93facf1118"
-SRC_URI[patch.sha256sum] = "ac2ee23ec89ba2af51d2c6dd5b1b6bf9f8a9f813de251bc182941439a4053176"
+SRC_URI[patch.md5sum] = "3ea90c0aedfcb56a53ac760a94bacb9e"
+SRC_URI[patch.sha256sum] = "6170f085972fdeb5fd69e346860100416707bb0b9f3a73a17a64945dc8b7cfe1"
 
 inherit autotools
 

