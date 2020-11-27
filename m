Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web12.20609.1606491469344897337
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Nov 2020 07:37:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=D9+onK1t;
 spf=pass (domain: gmail.com, ip: 209.85.221.66, mailfrom: beniaminsandu@gmail.com)
Received: by mail-wr1-f66.google.com with SMTP id p8so6002877wrx.5
        for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2020 07:37:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yCgG2tJ9GanqbjpODxDKvmnjeKIPSkkY6qS1mVb/TEU=;
        b=D9+onK1two0v73prOJRbpOzHFlmcsxfTvok4pfB3TbN7cy0/QWVLUD3Oj0GK2MofbQ
         Be3/xUAQsdz3XVtS7iU2O7QJ04ewaRMw4Dztu+VgXNDWVx4eH3OmSaz9lnXtDNqWjjNk
         pnMQr6C623ESLM2KxZrfKS+IAgHipZa2IWLL+GWFaeebNL9cq/ZqUaawK5M/+KCxSdqh
         y9YUSpyBUTg7V9OZO4eNp6bIqXIiH9rdNd8Me/7lbzhgW42TGLmvWOdOLza4VhCiYoHS
         blrI1yFezjLkiHgy+FlgBOpk7WdMkqPGLh6uRP36yx6sIP39UJ+kejPy1Zr3CzQlyRWa
         9gAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yCgG2tJ9GanqbjpODxDKvmnjeKIPSkkY6qS1mVb/TEU=;
        b=WbEkBK+Vk4JLX8idQByCmrtbXLerAvPokGASuCQ05hcT+Daho2TBtFe1ao9qr1d74g
         LLMg3AOAQEFCFPl3LgrYHpZ1uZT7DTig0oNRQ5ucSUqKretXX7Or4CL/KV7rSwNQdxcJ
         TzpTuqM8CirIZBRaEQ+0Y4GvPtNUJ66IuHyPj2h76eiUF1r4UxklFPPq1p30bCtbKfEC
         3gtrxS/gTMXyhPPi314UiEo2yVEa7GWTdMLqxFgCzk8qpYlNTsYV4y6USmQ2rHF2UsSE
         IHLEFLAjZRxzFEPBPYb9yERFn3qN7bevNNI/9sHHf/pw2nW86hW7G+zzOhA+2V/YIJhH
         MGFA==
X-Gm-Message-State: AOAM531axa/v+gE+REtXT9gYpoHLZdV7eEEh5MMqxNXjbf9FNuCNgeUE
	Ni1fAHEmL6X2Yo3kB23o9DXSoCUrKsk=
X-Google-Smtp-Source: ABdhPJzd0s9eHRkxqmvUj/FCZQS/rbkTwoIt3o2qO/gA6WyREWs+lqx7myg6o4+yRiMOiR1D9KQGWA==
X-Received: by 2002:a5d:45c5:: with SMTP id b5mr11663898wrs.14.1606491467347;
        Fri, 27 Nov 2020 07:37:47 -0800 (PST)
Return-Path: <beniaminsandu@gmail.com>
Received: from localhost.localdomain (5-13-193-159.residential.rdsnet.ro. [5.13.193.159])
        by smtp.gmail.com with ESMTPSA id n123sm8393704wmn.7.2020.11.27.07.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2020 07:37:46 -0800 (PST)
From: "beni" <beniaminsandu@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Beniamin Sandu <beniaminsandu@gmail.com>
Subject: [meta-oe][PATCH] trace-cmd: create recipe for version 2.9.1
Date: Fri, 27 Nov 2020 17:37:34 +0200
Message-Id: <20201127153734.147135-1-beniaminsandu@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
---
 .../recipes-kernel/trace-cmd/trace-cmd_2.9.1.bb  | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-oe/recipes-kernel/trace-cmd/trace-cmd_2.9.1.bb

diff --git a/meta-oe/recipes-kernel/trace-cmd/trace-cmd_2.9.1.bb b/meta-oe/recipes-kernel/trace-cmd/trace-cmd_2.9.1.bb
new file mode 100644
index 000000000..d9599c046
--- /dev/null
+++ b/meta-oe/recipes-kernel/trace-cmd/trace-cmd_2.9.1.bb
@@ -0,0 +1,16 @@
+SUMMARY = "User-space front-end command-line tool for ftrace"
+
+LICENSE = "GPLv2 & LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=873f48a813bded3de6ebc54e6880c4ac"
+
+SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/trace-cmd.git;branch=master"
+SRCREV = "530b1a0caef39466e16bbd49de5afef89656f03f"
+
+S = "${WORKDIR}/git"
+
+do_install() {
+	oe_runmake DESTDIR=${D} install
+}
+
+FILES_${PN} += "${prefix}/etc \
+	${libdir}/traceevent/plugins/"
-- 
2.25.1

