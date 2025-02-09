Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5841EC0219B
	for <webhook@archiver.kernel.org>; Sun,  9 Feb 2025 17:06:31 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.32338.1739120784586772782
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Feb 2025 09:06:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=A1t+LoM2;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-436341f575fso42575155e9.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 09 Feb 2025 09:06:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739120783; x=1739725583; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JVrQ+cWQnRqj3AkGPfVnBWqtRTAivm+UMSX9uca4tTM=;
        b=A1t+LoM2RK93ZqytXjxxULSgPhLqXEDoMh/w9rptg7ihwpHLo9KsQAsq5tGT4363fn
         rCICL13X7rlJFcwHPRa5+NKd5x6oLS5SpQwELqoRLz80PCkYaAVrvC7lNLAeOwA4bk7c
         BIg58hhH3lCBXx2AdF6Ch41EzvZkVjGnFn7Jn3MFdgFFRojKQsnogkOCzWTm+pMbQkn0
         Vx+bYiaNupChwYpTZNWE6pzaPd9cpib7p6hTUa1pnvqUAz+wdeM9UYdQM6/I188pR1Ag
         kzJqUhfE8NKdYNUP4NqGDiU9CI0iVHWRvInkLC6zibCFG+9xiOpQz3AqrLcBSTblwu31
         f1nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739120783; x=1739725583;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JVrQ+cWQnRqj3AkGPfVnBWqtRTAivm+UMSX9uca4tTM=;
        b=BP6Rhlep+IRlG6csgxcBqViTH2wnoTL/IoXiDxKWyR67ypn/rjpFDhQOoAHIgtgflW
         MsoPpcrDs06EzgPaN7CT4ECfGZO/GLgArjVojAB8EbJh7OgPEyKOz+/+QcwAEBxoSFl3
         eY7k3PdtoqrZioug0NXQKWNV6tkxEViGQT/4xxrmS4VEVluBpn5Qe98b74dJs7bwYt3R
         +RcCKxqCxaclFVAGJ2ogzWcrIFQW0u9ZBS0d86iw832KhGj8lZ6rhR9JnqOpo+fz4EPX
         LKBl58c2IcActmaELg8moJ/IClC0u4s5jdow7SSJV/ZWPdJeyvtSA0BC3GW35h8OJApi
         bGlw==
X-Gm-Message-State: AOJu0YwG9aJeVICXHDW1pxVxWclUoY3wsO6T7OFk7eDjo08FvE5OQJ63
	Lri5HSzetHRCB/9B3DSM5D4PH1NLe2PoahpFeizjqeAypYJcnzZPy8h2pQ==
X-Gm-Gg: ASbGncuphxKWhm5PZauamfKDyUevg6eF/jlvIxrS5sbcXlxvVvMyWlZPQg3O8ZsxbkF
	kZLug9JWoBGbkYOx1pDO7coloJxKiChEoYsLx5hOhzOsf3ocgpuall2scLZwsvVlLUN2atInKle
	w6PYkVgbb94UnuINgcxL+dmN4uITi1siHkWFsA4aMe1AFslOWOdg+p5gWfWYxxMhSKFpY3aAWEq
	Lb31ClzRzV9nhrhiBIR3xnMreOb1P8eo1nlTqIyWrtdRNY35HJz6yBt2yr4KD7kT4X0/nMzoxJ2
	JYZ6s3PvIWC8xhnDvdT2jnRu7P2utCs=
X-Google-Smtp-Source: AGHT+IEinH6/eHO/MKD/IZ8KUUd3Aj6hrL1a/rQTKHSuZlYE29PZICFmhsd2RXDYhAh89vyqvYz1UA==
X-Received: by 2002:a05:600c:458e:b0:430:57e8:3c7e with SMTP id 5b1f17b1804b1-439249bd34fmr84786885e9.28.1739120782672;
        Sun, 09 Feb 2025 09:06:22 -0800 (PST)
Received: from localhost.localdomain ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390d93379fsm157916355e9.5.2025.02.09.09.06.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 09:06:21 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>
Subject: [meta-gnome][PATCH] ibus: missing installed file w/ gtk2 PACKAGECONFIG
Date: Sun,  9 Feb 2025 18:06:19 +0100
Message-ID: <20250209170619.3727086-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 09 Feb 2025 17:06:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115319

In case gtk2 PACKAGECONFIG is enabled, do_package task fails
with the following error:

ERROR: ibus-1.5.26-r0 do_package: QA Issue: ibus: Files/directories were installed but not shipped in any package:
  /usr/lib/gtk-2.0/2.10.0/immodules/im-ibus.so

This patch adds the missing folder to the FILES variable.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-gnome/recipes-support/ibus/ibus.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-gnome/recipes-support/ibus/ibus.bb b/meta-gnome/recipes-support/ibus/ibus.bb
index 141341e34..479498d82 100644
--- a/meta-gnome/recipes-support/ibus/ibus.bb
+++ b/meta-gnome/recipes-support/ibus/ibus.bb
@@ -30,6 +30,7 @@ FILES:${PN} += " \
     ${datadir}/dbus-1 \
     ${datadir}/GConf \
     ${datadir}/glib-2.0 \
+    ${libdir}/gtk-2.0 \
     ${libdir}/gtk-3.0 \
     ${libdir}/gtk-4.0 \
     ${systemd_user_unitdir} \

