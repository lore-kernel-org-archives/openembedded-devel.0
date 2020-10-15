Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web11.14004.1602773606230958539
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Oct 2020 07:53:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@dresearch-fe-de.20150623.gappssmtp.com header.s=20150623 header.b=wbgRwDgI;
 spf=pass (domain: dresearch-fe.de, ip: 209.85.128.67, mailfrom: schuknecht@dresearch-fe.de)
Received: by mail-wm1-f67.google.com with SMTP id q5so4032128wmq.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2020 07:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dresearch-fe-de.20150623.gappssmtp.com; s=20150623;
        h=mime-version:from:date:message-id:subject:to;
        bh=q/4v9wWzJiBO9kwDe74VqCGdYjlsP4z8ldoilQEb7Zs=;
        b=wbgRwDgIFT4VDX7g1sGi12uyF3nK20nBTJrimSNvrlVgCJUHqRJTNuDuiKtY+xv7P3
         N5+tIcOhD6yRJgETdUa70dZPHKfrkVIpt/Qnl1OJ+KOHOswWeFnr4hINr3m2Q/MAGBoQ
         veI1uUxr5GCSIsOs8GyYztktJtBRftg5iHKSreazhL9KqDDSWZmr+Kfo9cTB+yqwyxYJ
         lyhuAlElsYY+YAeAFQYGsNPLxQoAIz60Z29Fv9ZosaufWf02JvA4LomV0VGrR6MOm4hA
         e9/ZX73TxFYMz5xMgf6/HuzjcdNJoFou7KC7MK6atBlnjkRkOnEEp+FnUVgyDJQW8kLJ
         Y00A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=q/4v9wWzJiBO9kwDe74VqCGdYjlsP4z8ldoilQEb7Zs=;
        b=U3a4+vTdT7xoQcd3l/xM+sNpBNahxW1yOYgo4Mi2W8rd63lf69faNMxyYTzTN7wWvw
         PbrYsKwcpRD3WjgynVBkI72OE4OBvxERTfFXWzhFgPKxblUaGa33X6ncN6hrewg6saAn
         Zf5hqvf8QtnOWjPMN1IKdlkRBY64HW7teNFp/ZjbVLEa/N0dlVrkDjJfql9IeoAmecNL
         9B9sXlkYqeoTdWoE8wPU9StbLvD0PtRMXOm8wi6IOyaMEtQh2fAMgeVabr1ehcTdFSsp
         hYTcvIGr6MHndUJBLA/11FBkHiWT7j55i1W+kilFaiSZMrIUXgsuopFvqsjAosx17CPG
         ZPVA==
X-Gm-Message-State: AOAM5311oJ1+Crq3sAg3VC+tyjjjit7K2kWnwyUMYP2MOBJH/baK98rE
	BOPE/jlnOUMbMWuGF0D93b4N4Vd7Lm55MJL7VjBx/ra3CAQ9skGE
X-Google-Smtp-Source: ABdhPJzEUA456v5j5v0UWAErr7h6tszVK9wlsvUys4MeTc3BybIcaCdmSJWF7MMHW/Ai8yzKucP/OYQhdaz4N6KYAWU=
X-Received: by 2002:a7b:c847:: with SMTP id c7mr4620370wml.41.1602773602972;
 Thu, 15 Oct 2020 07:53:22 -0700 (PDT)
MIME-Version: 1.0
From: "Mario Schuknecht" <schuknecht@dresearch-fe.de>
Date: Thu, 15 Oct 2020 16:53:12 +0200
Message-ID: <CAAwVp3tHtO0ZLp5WVtwxfMXLj4eYjm4dtQb+Xc2w6DNGLrNo7A@mail.gmail.com>
Subject: [meta-oe][PATCH v2] wireguard-tools: Fix systemd service installation
To: openembedded-devel@lists.openembedded.org, stefan@agner.ch, 
	raj.khem@gmail.com
Content-Type: text/plain; charset="UTF-8"

Install systemd configuration file wg-quick@.service into the proper folder.
Use 'systemd_system_unitdir' instead of 'systemd_unitdir' as the installation
path.

Signed-off-by: Mario Schuknecht <mario.schuknecht@dresearch-fe.de>
---
 .../recipes-kernel/wireguard/wireguard-tools_1.0.20200513.bb          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20200513.bb
b/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20200513.bb
index 31b33a045..3403fd943 100644
--- a/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20200513.bb
+++ b/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20200513.bb
@@ -9,7 +9,7 @@ DEPENDS += "libmnl"

 do_install () {
     oe_runmake DESTDIR="${D}" PREFIX="${prefix}" SYSCONFDIR="${sysconfdir}" \
-        SYSTEMDUNITDIR="${systemd_unitdir}" \
+        SYSTEMDUNITDIR="${systemd_system_unitdir}" \
         WITH_SYSTEMDUNITS=${@bb.utils.contains('DISTRO_FEATURES',
'systemd', 'yes', '', d)} \
         WITH_BASHCOMPLETION=yes \
         WITH_WGQUICK=yes \
@@ -18,7 +18,7 @@ do_install () {

 FILES_${PN} = " \
     ${sysconfdir} \
-    ${systemd_unitdir} \
+    ${systemd_system_unitdir} \
     ${bindir} \
 "

--
2.16.4
