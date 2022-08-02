Return-Path: <edtanous@google.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0B65C00140
	for <webhook@archiver.kernel.org>; Tue,  2 Aug 2022 22:52:29 +0000 (UTC)
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com
 [209.85.219.201])
 by mx.groups.io with SMTP id smtpd.web09.2116.1659480741936063988
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Aug 2022 15:52:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@google.com header.s=20210112 header.b=DixflnFY;
 spf=pass (domain: flex--edtanous.bounces.google.com, ip: 209.85.219.201,
 mailfrom: 3parpyggkal4ihxersywksskpi.gsq@flex--edtanous.bounces.google.com)
Received: by mail-yb1-f201.google.com with SMTP id
 m5-20020a2598c5000000b0066faab590c5so11900951ybo.7
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Aug 2022 15:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:mime-version:message-id:date:from:to:cc;
        bh=SV5h/Te75pNIgJkWFT1GeMVL7oy8361NA5W59jpih7Y=;
        b=DixflnFYAlm9ivFnP8o2PsPtWjtXTCpbi4sIcqaT2+FCTCoxv9iBvX/eCP0uYkEqHA
         sBlWN4xnifzafGN9C34w0TRh8r6nNhoUME9fgyqqKZhDvNiHXbfwo7SGNIthRv36lUhz
         GdhqZXa/Uv8fykhFE87PQ6Yk0+icona+ZbkiMVU2S2W43JW3aFhUVvnsFCnEAJPfnYqS
         0cqHrgw8SjyrTcxe7gv2T1kGLxK8y7R28QvuMruQ/VNd/9yZqDI9mdY7yUcootgYeJSq
         I5h0zKyHqNnUn3Twghl44cFTyo6fxFo06vwuTd9a9Ij6i3CzvWxjwh3d70OZSdYcx26a
         ojpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:mime-version:message-id:date:x-gm-message-state
         :from:to:cc;
        bh=SV5h/Te75pNIgJkWFT1GeMVL7oy8361NA5W59jpih7Y=;
        b=q0pj6yLPDyStnZn1qP5IGc1L0w8ND+4RvxkUUGfAjXF2bO6KeWcSPTgaOmHv8Dzafv
         +jJ6rcheobdS9Cw+mo95dEOW6OSRG/Gl3HF08XzlWDnnaL5c29jjUaeHWzaHWEMZq23i
         8DwwRQQg1ePpk0DuJVtFPqMt/KFWTnaIqDVoq0UoD43YnfKJUq4aMAtTwnGurGnys1es
         ptfB2+P4HpLN9bpxlsI/Ai1b+BTHE6T7D93XMZZ0KDwOxcHWSWEST/KmU6llPdd+QpmW
         2bre7Zz5uP6XiQGB++SJFYEBoaOvj9DhdieKkNHk7kl18B7fZj6V4MsBMDiSkzhN0UmE
         Ls2A==
X-Gm-Message-State: ACgBeo2CE2yuOmNtqwtKvJ3xnWvWPfCsX9uZNO3d6oWpNdFBQNj8Onma
	YNC0zsPW48Q8dKCm97LMnui3CjDeUZxj7gn7liYrZUbgNZm683i/DGSBZIZ+g9Oi0APQf9I92dz
	bBYA6SwzdS3T9DLnFBjjAFt4Z+Svw2T8f+T8XdW48FBMqTmYsH16JTFnEEGz67e0pa5nQ3fSK2k
	BPTi386Fo68r1feWaj
X-Google-Smtp-Source: 
 AA6agR6ltG7HQoUcq0u0TXx0tMCHKOzk4uu9yzuQfzzJ51pQrqs8JmFwKChc9wPjS6PVbB2eedgcp20fXz2WVQ==
X-Received: from edtanous.svl.corp.google.com
 ([2620:15c:2c5:13:98f2:886:f30b:1195])
 (user=edtanous job=sendgmr) by 2002:a05:6902:10ca:b0:671:3616:9147 with SMTP
 id w10-20020a05690210ca00b0067136169147mr17085262ybu.105.1659480741032; Tue,
 02 Aug 2022 15:52:21 -0700 (PDT)
Date: Tue,  2 Aug 2022 15:52:17 -0700
Message-Id: <20220802225217.2804578-1-edtanous@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.1.559.g78731f0fdb-goog
Subject: [meta-oe][PATCH] Add python-requests-unixsocket recipe
From: edtanous@google.com
To: openembedded-devel@lists.openembedded.org
Cc: Ed Tanous <edtanous@google.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Aug 2022 22:52:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98101

From: Ed Tanous <edtanous@google.com>

From the pypi description:
Use requests to talk HTTP via a UNIX domain socket

Signed-off-by: Ed Tanous <edtanous@google.com>
---
 .../python/python3-requests-unixsocket_0.3.0.bb    | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-requests-unixsocket_0.3.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-requests-unixsocket_0.3.0.bb b/meta-python/recipes-devtools/python/python3-requests-unixsocket_0.3.0.bb
new file mode 100644
index 000000000..330ab7c06
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-requests-unixsocket_0.3.0.bb
@@ -0,0 +1,14 @@
+SUMMARY = "Use requests to talk HTTP via a UNIX domain socket"
+HOMEPAGE = "https://pypi.org/project/requests-unixsocket/"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"
+
+SRC_URI[sha256sum] = "28304283ea9357d45fff58ad5b11e47708cfbf5806817aa59b2a363228ee971e"
+
+PYPI_PACKAGE = "requests-unixsocket"
+
+inherit pypi
+inherit setuptools3
+
+DEPENDS += "python3-pbr-native"
+RDEPENDS_${PN} = "python3-requests python3-urllib3"
-- 
2.37.1.559.g78731f0fdb-goog


