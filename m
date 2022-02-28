Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB464C433EF
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 17:33:02 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.458.1646069581336753017
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Feb 2022 09:33:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=REtszA5C;
 spf=pass (domain: gmail.com, ip: 209.85.210.179,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id y11so11620163pfa.6
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Feb 2022 09:33:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KuRhLqXuJ0+ROgzL8XPkP4lqXsbTgAODGTG0pT/eImk=;
        b=REtszA5Cg826f1O8EpmDOWBryO3VMGbAM+t9jE6BIMTgrh/N+c2LRxHtr2vDhvKwu2
         3S4LFY5Bmta30C5xGtBvZb+Nof1nd5CHQ4+8MoBR8jp20M2op3kbP28WfaiRVgp7LVBb
         UtHyISN0DXfZ883OOKEfknn60efohqNG5kmEyXkPe7BZfONDRRRc86cqzoEVdtuNOjmB
         LXiSznln8cQ4viLUWiFbiqqq52x6iOVNtEJgNXci/w3FNjMix/OEILPI6GvaHE+mJOC3
         2vpF80jfioyCFI2UOLI85VLrDQysld5QXj27EOujxEcP86sblSG9/dMlwEx/3GNzlbuv
         8Fhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KuRhLqXuJ0+ROgzL8XPkP4lqXsbTgAODGTG0pT/eImk=;
        b=Y0I4QADzJXFLiFvhENxXA7ETx/VV+bze76+RtIvcN16+6OsLJDCAkDn1cR9rUC7Zs4
         kg4VZscpgc0gWffXUu5Z7kmqiUT0ilHZDV2H5zu8NgGwwGRYSiMtlOEEGwrBuPeQRT6l
         m8sXb/oxvRxrYlL5h4A9f43y7MDehJ2NEobCkHRYBKtxNldp4yP8/ZZj6PF3oUfUCbJN
         KFWVqiGcUWQRN310g21V6w5cuq0eKMNK2otYJyY4Wle8tPribNThk9/Ws35uaak0Vkwx
         SAa94kGocUKRG5qLlWbTzRl2RiI6UeOF5jlbs0qhffKYDPKGuqOHs98/qFvcvrCtS/rj
         hSmA==
X-Gm-Message-State: AOAM530+lbEmNeb9tswnj0/NS3tav5fEkm22BxGtVmXYFkwNhGLigeaz
	zz9pjcALJLdqa4Z603YQ+tbzmRhcd5M=
X-Google-Smtp-Source: 
 ABdhPJzBmUa+KpMwyhKTpMID+pbLWZKwMpduKedkuajz/yIkDBX0+TpFtWjZ+HntwHJyZgW7L0uFbw==
X-Received: by 2002:a63:195a:0:b0:372:bae2:d124 with SMTP id
 26-20020a63195a000000b00372bae2d124mr17894777pgz.412.1646069580279;
        Mon, 28 Feb 2022 09:33:00 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:197f:1785:dac1:56d3])
        by smtp.gmail.com with ESMTPSA id
 186-20020a6214c3000000b004f3e534b49esm9519748pfu.122.2022.02.28.09.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 09:32:59 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [meta-python][PATCH] python3-pyiface: upgrade to latest git
Date: Mon, 28 Feb 2022 09:32:52 -0800
Message-Id: <20220228173252.1277254-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Feb 2022 17:33:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95589

Upstream hasn't done a release, but has commits which among other things
switches from distutils to setuptools.

Now DEPENDS on python3-setuptools-scm-native

Set PV to what the version of the 'wheel' is.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 ...on3-pyiface_0.0.11.bb => python3-pyiface_git.bb} | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pyiface_0.0.11.bb => python3-pyiface_git.bb} (52%)

diff --git a/meta-python/recipes-devtools/python/python3-pyiface_0.0.11.bb b/meta-python/recipes-devtools/python/python3-pyiface_git.bb
similarity index 52%
rename from meta-python/recipes-devtools/python/python3-pyiface_0.0.11.bb
rename to meta-python/recipes-devtools/python/python3-pyiface_git.bb
index 3022d08343..847efd8cf8 100644
--- a/meta-python/recipes-devtools/python/python3-pyiface_0.0.11.bb
+++ b/meta-python/recipes-devtools/python/python3-pyiface_git.bb
@@ -5,7 +5,14 @@ LICENSE = "GPLv3+"
 
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4fe869ee987a340198fb0d54c55c47f1"
 
-SRC_URI[md5sum] = "b066aa984656742738127c9c75436ab4"
-SRC_URI[sha256sum] = "e231e5735d329c5b2d4fc8854f069fdaa5436d3ef91ed64ee49e41e3f5e8a3f5"
+DEPENDS += "python3-setuptools-scm-native"
 
-inherit pypi setuptools3
+inherit setuptools3
+
+SRC_URI = "git://github.com/bat-serjo/PyIface.git;protocol=https;branch=master"
+SRCREV = "4557dbda96d2e4b1142c60603d4a27d007a9ffe6"
+PV = "0.1.dev33+g4557dbd"
+
+PIP_INSTALL_PACKAGE = "pyiface"
+
+S = "${WORKDIR}/git"
-- 
2.30.2


