Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAA65C46CA3
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 20:46:50 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.44450.1701895605410528128
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Dec 2023 12:46:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eVVTqixK;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-33330a5617fso221313f8f.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 06 Dec 2023 12:46:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701895603; x=1702500403; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PWkmQ3aq3UFJwShgpkJ6QHLfhlzp+6y9Cse6E2pGODs=;
        b=eVVTqixKtn8rqzqTBrG+rURQ/2TLWmZoDBTCFyR5/vyuf46GwRD+aDaFI/0SwOz00+
         Uq3/53VQouMzXK5CpxdRVkU8r6phlqcNXfTZmc6URpzDR4QCIh70/pU8mM/MV4QQ5JqA
         338LTNh0ZXuHoSvV+JFG8YpKR4YkVRe554VMBlvJfmd/nMPzSft3QW9YLP3vpuxXMd/8
         zE843DwlYl0tJ1qU36TCtRtnsgYdGCFMBnn1E0WridATJLgZcgnCIpnNGxvRfU0Ptm37
         KpIgMEm0I3+gEC7ctrUY62LaSUuA1OfW5UaKJzXBcaZ4pM6bBMwYNPImR9mAaeqH9IYq
         kjcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701895603; x=1702500403;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PWkmQ3aq3UFJwShgpkJ6QHLfhlzp+6y9Cse6E2pGODs=;
        b=bV/9kqBVk6vTqQtdkGknFlp5C6qV4xWMDfatjlhzZ38lvyF/CDADJYDT7Jevll+Emc
         NIZxAWMppZtL53ItsSgYeSgHJx9Hmvl8toUV8SNfk6LJDoB4pk0o5tQz+nHeB75FRMYA
         Bjvon6mcx5JuoUeFClj+AEJznKCPHXmDa1XoWQExbxACWqo6Lg2fLmw1vKR3f6dZIoy5
         /BcDqeFDh8bjN/Q0j8WN4mW6iPqgD+CWBhtQdx0SeVFQ/IA4pOvmpmODSNzhkqHOH+6c
         lUyk28rL//0RLIFpa/30eSUbc4diRXRAPBBgQkWZxK/EDAS2vsj6tj5Qwc02/RLs47r0
         jPHg==
X-Gm-Message-State: AOJu0YwaXhdKz+RmctE4Y5YMVs+ySZk95rZdqjE/ztwf2PWZjHHHL5EH
	7QvJH+0HxRpRqb4krqfSrDr/yhwEjugwfA==
X-Google-Smtp-Source: AGHT+IFnEwtZ+RTWgGbK1ZEXaY7pTk3u97jR0wzkW0OCW0/hK8qiuwfpDwv5Yy9ED9dpheBTFBZyAQ==
X-Received: by 2002:a5d:6e42:0:b0:333:2fd2:5d4d with SMTP id j2-20020a5d6e42000000b003332fd25d4dmr1067883wrz.127.1701895603218;
        Wed, 06 Dec 2023 12:46:43 -0800 (PST)
Received: from localhost.localdomain ([176.33.71.251])
        by smtp.gmail.com with ESMTPSA id p17-20020a5d48d1000000b0033359ae2d52sm535760wrs.17.2023.12.06.12.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 12:46:42 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH] xkeyboard-config: add recipe
Date: Wed,  6 Dec 2023 23:46:40 +0300
Message-Id: <20231206204640.459279-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Dec 2023 20:46:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107267

The X Keyboard (XKB) Extension essentially replaces the core protocol
definition of a keyboard. The extension makes it possible to specify
clearly and explicitly most aspects of keyboard behaviour on a per-key
basis, and to track more closely the logical and physical state of a
keyboard. It also includes a number of keyboard controls designed to
make keyboards more accessible to people with physical impairments.

There are five components that define a complete keyboard mapping:
symbols, geometry, keycodes, compat, and types; these five components
can be combined together using the 'rules' component of the database
provided by this project, xkeyboard-config.

The complete specification for the XKB Extension can be found here:

  http://xfree86.org/current/XKBproto.pdf

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../xorg-data/xkeyboard-config_2.40.bb                | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/xorg-data/xkeyboard-config_2.40.bb

diff --git a/meta-oe/recipes-graphics/xorg-data/xkeyboard-config_2.40.bb b/meta-oe/recipes-graphics/xorg-data/xkeyboard-config_2.40.bb
new file mode 100644
index 000000000..ec511c4f9
--- /dev/null
+++ b/meta-oe/recipes-graphics/xorg-data/xkeyboard-config_2.40.bb
@@ -0,0 +1,11 @@
+require xorg-data-common.inc
+
+SUMMARY = "The X Keyboard (XKB) Extension essentially replaces the core protocol definition of a keyboard"
+
+inherit meson
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=8fc8ae699974c360e2e2e883a63ce264"
+
+SRC_URI[sha256sum] = "7a3dba1bec7dc7191432da021242d17c9cf6c89690e6c57b0de048ff8c9d2ae3"
+
+FILES:${PN} += "${datadir}/X11/xkb"
-- 
2.25.1


