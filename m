Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 228EAE65D2B
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 05:51:54 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.web10.17930.1732254707944271333
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Nov 2024 21:51:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iWCD27Uk;
 spf=pass (domain: gmail.com, ip: 209.85.128.180, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6e377e4aea3so13380227b3.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 Nov 2024 21:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732254707; x=1732859507; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ri+z6EkwlWoUNgyE4jMWUYe+duVk5l2esN8TkhGHgNs=;
        b=iWCD27UkNdSVOdHFndDKzMRSGHm5NBGxEKSni9JsK5eeMXFFs1X/AVSdymzyDuEnRL
         Q2D32mJ0RtGdUJx0EyKNLyIWkhNmIRmEbl2p9qqrkUdZTqCIoLGnOwHqT7GqDb+SOFza
         XiO5O7sp38LBdRIOZGdMvrYiKgAwYrc8NsLTc/RKFkWaMpWNSuub6OlwP6Fn4u7SQ5YJ
         zQf3doGJYzvgOXor50IDKavGEVzjG+qfiIZu3PwDkuxXz9mOe8LIqUrx+wGkAxDxNqpE
         jX+G0grfjTaNLfRXNX0byjvPXI5b+orRmCQQyR6n5GW2Fi1yinjs2/pIAcAHwc2glh16
         byHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732254707; x=1732859507;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ri+z6EkwlWoUNgyE4jMWUYe+duVk5l2esN8TkhGHgNs=;
        b=Lk+OxDLTPk1VSn0CecuMajCmlVA4B98JDAVhRhbZqVY74baIj5P2YXVaHzY5KCTu/J
         e80kobZCcaSXfx/Gw4lOq2xbSSkOXLKfFC9X8vCBhRqwBrLH3f9pnLq2UuatO15yJ1M7
         KuRC7YyTLNeTqP+xqmK9WxWKZTOluvvIzrzcFjk3om+sNv8Iix+HZex6sg5GQcbWJnwD
         Gv9zPR6w0UR5b3Zi6Tp9Y1zMHs1uHMq7ge87CJP/tYnSQEj1s58SDTfN0N+MHnj2Hfpi
         QFRv/76osIgu2Kos3LvK334T7A1LhrWCKOdbjt1gyOCF03bCFv5FRj5tWLFw6EPrmay6
         BWnQ==
X-Gm-Message-State: AOJu0YzrtCQ5xEKObt/pRu/2uDjpNcxpj4+azvY6SDtIYojqKs/cEedC
	zwOf38Q+ufs1ZgQpqpVPNmr/1iP4bg/eIJNqZA3OJ2+yvqU4APl6rKVUsg==
X-Gm-Gg: ASbGncv2fDA2Vwx0tsty+xjgVXqu2x+uJiYg1q8GAVySpruM5ZRijdF4QArzObTo7UG
	nd9O4SZ+geqd/9H7rKv8+FRNqeYgzVSc8UfrpkuVUUoqZihd8iZMesJdlk9PmIat2Ab1eGBQeUI
	H+uowttVFz7w/fv6uaG58KpcVBCziEjWL/9Qg8ZS0Ysnqp2wxQkmzug/8lSAIP2KT1VQt+lLWGH
	YPeL0UgydeIJWH4ov09xJpNUwkiJwt2Jg4tnjpzFmB1ZVP/Cws=
X-Google-Smtp-Source: AGHT+IFQqM9CBnOH+sIPw5gjceNobqKnLsuLUsXC0R9zxAKy7yOXycga/DKAdzjdDNG09s7x6a0tQA==
X-Received: by 2002:a05:690c:690e:b0:6ee:d9a3:c85a with SMTP id 00721157ae682-6eee0a26568mr19230687b3.27.1732254706894;
        Thu, 21 Nov 2024 21:51:46 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8201:fd20::1dd])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fbcc3df00dsm641396a12.64.2024.11.21.21.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 21:51:46 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH] libdex: Inherit features_check
Date: Thu, 21 Nov 2024 21:51:44 -0800
Message-ID: <20241122055144.887666-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Nov 2024 05:51:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113990

Fixes
QA Issue: libdex: recipe doesn't inherit features_check [unhandled-features-check]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-gnome/recipes-gnome/libdex/libdex_0.8.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/libdex/libdex_0.8.1.bb b/meta-gnome/recipes-gnome/libdex/libdex_0.8.1.bb
index 42be14d4c6..1648639c3e 100644
--- a/meta-gnome/recipes-gnome/libdex/libdex_0.8.1.bb
+++ b/meta-gnome/recipes-gnome/libdex/libdex_0.8.1.bb
@@ -2,7 +2,7 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 GNOMEBASEBUILDCLASS = "meson"
-inherit gnomebase upstream-version-is-even gobject-introspection
+inherit features_check gnomebase upstream-version-is-even gobject-introspection
 
 DEPENDS += " \
     glib-2.0 \

