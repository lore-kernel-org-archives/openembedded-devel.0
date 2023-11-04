Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C77DC4332F
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 11:53:54 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.7949.1699098829544379369
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Nov 2023 04:53:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Mk3dguGe;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-40790b0a224so22737585e9.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 04:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699098827; x=1699703627; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wq5hRKE5l8Pe1IDdQn+9nlro5zwJ3dwSovY2JtyddqQ=;
        b=Mk3dguGeliEYVxo2Rb1HyEqyCGxICvUSWskWlgR7jSGBIPwiV3BpymJKqksotDw7mY
         KyrDJjIfrJ8gJARg6LtDPvP3uZwjL8Xigt8tXMFHv/i3miqrgbHOEQloNCvdPGShcnDU
         6N51H+4axirN/yRATasviKZbnkuwnoARxAwr+J4jIBSC71tCxz/C0cJ4eK0t5rMrMmPg
         vl0radHzdIds90OlTsKLe9MgtJHTiVMqgOcYza//zIUMEHt6WNrbfBP7g4G2/SjJ4rJs
         xPJWrrMWRyVgRLiZ6caa5tbUKbnDwBK4cTaTQP84EuU1/b7o2x/U30qi8cCUI3CeXW4x
         dw2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699098827; x=1699703627;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wq5hRKE5l8Pe1IDdQn+9nlro5zwJ3dwSovY2JtyddqQ=;
        b=qiuKpr5gaI5skF1YP3R+KZtfoXqIs7o9Ne/sidEo8Fwse3sXSfqvTjGjBV33mL04LS
         FIciZM4nO7bd771a84CTgMDgKDbGQ7PAh2bsWSMy8HHAKQ0ivioHyjkCFBwcCL3wGAov
         Kw8qUO39Py2ywShDiWqGJhWfTekT0QSmDrcVMumiPpTKX6IuvYR7LQmnGYAsdKu4j2q8
         kiUyyEy7Etx1ol1XKHgzEMoeaUWoZir0VGKMz94u1MW0T2n0FIXtD/ZdtwdRmXQmU5BU
         e600ZilTnCZk+W0NGq0IOnJTl9iRNmu7TasXG3Y+V0mU4WGCOjqsNa+nQ0H4h0kk4LyU
         bH4g==
X-Gm-Message-State: AOJu0Yxk8McXSD4TMjEU/uCFApaqYT53Ge51oR40YBiCbNau/OsoFZSu
	0lXNIgYcp37K50FAj02/yNld5T51trc=
X-Google-Smtp-Source: AGHT+IG/JYkqxNHEc9dRziLEGrtGhyH03OsK6V8/7Wf+MHbSO1dt92SjdwMX3bNZQApDom2Co8itKQ==
X-Received: by 2002:a05:600c:a01:b0:409:7b62:f694 with SMTP id z1-20020a05600c0a0100b004097b62f694mr897389wmp.11.1699098827199;
        Sat, 04 Nov 2023 04:53:47 -0700 (PDT)
Received: from localhost.localdomain (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id ha7-20020a05600c860700b004080f0376a0sm5369725wmb.42.2023.11.04.04.53.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Nov 2023 04:53:46 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-oe][PATCH] reptyr: Add 0.10.0
Date: Sat,  4 Nov 2023 11:53:32 +0000
Message-Id: <20231104115333.13795-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 11:53:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106370

reptyr is a utility for taking an existing running program and attaching
it to a new terminal.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 .../recipes-support/reptyr/reptyr_0.10.0.bb   | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 meta-oe/recipes-support/reptyr/reptyr_0.10.0.bb

diff --git a/meta-oe/recipes-support/reptyr/reptyr_0.10.0.bb b/meta-oe/recipes-support/reptyr/reptyr_0.10.0.bb
new file mode 100644
index 000000000000..57b31a78d9f5
--- /dev/null
+++ b/meta-oe/recipes-support/reptyr/reptyr_0.10.0.bb
@@ -0,0 +1,29 @@
+SUMMARY = "Reparent a running program to a new terminal"
+DESCRIPTION = "reptyr is a utility for taking an existing running program and \
+attaching it to a new terminal. Started a long-running process over ssh, but \
+have to leave and don't want to interrupt it? Just start a screen, use reptyr \
+to grab it, and then kill the ssh session and head on home."
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=25a0555028c71837623fa6dfa4cc45c0"
+
+SRC_URI = "git://github.com/nelhage/reptyr.git;protocol=https;branch=master"
+SRCREV = "1238097fc2cd15db058d2185cc4985daa87bcd41"
+
+S = "${WORKDIR}/git"
+
+inherit bash-completion github-releases manpages pkgconfig
+
+GITHUB_BASE_URI = "https://github.com/nelhage/${BPN}/releases/"
+
+PACKAGECONFIG ?= ""
+PACKAGECONFIG[manpages] = ""
+
+EXTRA_OEMAKE = "'BINDIR=${bindir}' 'MANDIR=${mandir}' 'PKG_CONFIG=${STAGING_BINDIR_NATIVE}/pkg-config'"
+
+do_compile () {
+	oe_runmake
+}
+
+do_install () {
+	oe_runmake install 'DESTDIR=${D}'
+}
-- 
2.39.0


