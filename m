Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.web11.8556.1623249103018050806
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Jun 2021 07:31:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hKYLpRRT;
 spf=pass (domain: gmail.com, ip: 209.85.167.175, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f175.google.com with SMTP id t40so12267861oiw.8
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Jun 2021 07:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gBqipS3Mk4iWHu2LfxzTeGwImD5KV9Vph0hFzkeje4A=;
        b=hKYLpRRTuqpFsJCMsibfNrv75E7lZcGFo+7KKC7B7ieCLJy1I8GA433juu0DnxnegF
         q8FnCbrFiGZJhPRY+vHwi55VUZ70NBpedKVzzKhkQYhwgTCi0xsPJF0Ef9KYH1PiX6It
         PG0PD1/R0wUrHUnv3sajVq2+3SVU3xlSVCRR8i8MfanTce/vYCo/96aA4lylNHLiwS/m
         cJuu2+kNG7aXqAIMC8UNGEX/P7HE9cfXQnlOfWoz/tKvkM7Nyidy5KpxmI83z665PiPL
         VMge2KL/rX6WBwCE78N7seT49CQF4kwEttBt04VZAzuKW3OE1cQxxDIDmI5AdggLwgk3
         fk7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gBqipS3Mk4iWHu2LfxzTeGwImD5KV9Vph0hFzkeje4A=;
        b=Q1fsiFMqsoMz2ulNpYxdl5avaCKETnLsHS96v5ZnabsStJXP2619qVL/jSzYAWOYfr
         U5csr7rvtW3DDN3qYdlJIOdZMBOoKbrJAjqHJsyE42EsKeRGaRi6wj3fW+D1I+9JuWZG
         b9dFYJDw+sLkzliax2rCEYAooVIYTiW47fQZ7DMeCINQV9x4UJ90FD4zAd9fZSzoAbxh
         dawMLhso89pkEvMoSN3vr0jXJBzb5MAe/4Neto/1JeXyg0bdS4/roj/sNdmoqd97a03N
         tCMzNIUd1SGPGIdz0/5+XtybPEt5TXjE5DTfLzBhdyareNYPsQei33l0+RStYYi9H7Ol
         Tg+g==
X-Gm-Message-State: AOAM532UwhI1xtNXKgyOYYN5G/ivSABOXAU0aCNaqZ2hXP3zkjv+Z4nj
	e/p+1+lda+g5MTeOsuUkq9MZSMIkSuw=
X-Google-Smtp-Source: ABdhPJyafqPy5gjPnImhFVycHnslKrddSWlTw58Mp6B9m0vAQA3RLnZzWgSQNIhAWd+pwX6TCFrg/g==
X-Received: by 2002:a05:6808:145:: with SMTP id h5mr4004038oie.24.1623249102122;
        Wed, 09 Jun 2021 07:31:42 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id f2sm3454984ooj.22.2021.06.09.07.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jun 2021 07:31:41 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: ticotimo@gmail.com,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [meta-gnome][RFC] gnome: gnome-shell: Move gsettings to their own package
Date: Wed,  9 Jun 2021 09:31:33 -0500
Message-Id: <20210609143133.31680-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Moves the gnome-shell-gsettings package to it's own package so that
other desktop environments that depends on it can pull it in without
pulling in all of gnome-shell

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta-gnome/recipes-gnome/gnome-shell/gnome-shell_3.34.5.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_3.34.5.bb b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_3.34.5.bb
index 9619628c8..77b9015d4 100644
--- a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_3.34.5.bb
+++ b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_3.34.5.bb
@@ -49,6 +49,8 @@ do_install_append() {
     done
 }
 
+GSETTINGS_PACKAGE = "${PN}-gsettings"
+
 FILES_${PN} += " \
     ${datadir}/dbus-1 \
     ${datadir}/gnome-control-center \
@@ -56,9 +58,9 @@ FILES_${PN} += " \
     ${systemd_user_unitdir} \
 "
 
-RDEPENDS_${PN} += "gsettings-desktop-schemas gdm-base librsvg-gtk"
+RDEPENDS_${PN} += "gsettings-desktop-schemas gdm-base librsvg-gtk ${PN}-gsettings"
 
-PACKAGES =+ "${PN}-tools"
+PACKAGES =+ "${PN}-tools ${PN}-gsettings"
 FILES_${PN}-tools = "${bindir}/*-tool"
 RDEPENDS_${PN}-tools = "python3-core"
 
-- 
2.31.1

