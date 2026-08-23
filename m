Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AA89C5DF98
	for <webhook@archiver.kernel.org>; Sun, 23 Aug 2026 11:52:38 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12921.1787485949181105961
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Aug 2026 04:52:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=h2D4FAv8;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-381c51fde6bso2867764a91.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 23 Aug 2026 04:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787485948; x=1788090748; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A7PHEhV73LJoQU9Gqn5PAO/LzQK/ZMaTTgCit8UtjH8=;
        b=h2D4FAv81Dpv39pvxHzmcnJxzRETpgPFzPYKppb1pmu7cfXLlmhklvooko6ByhpJCY
         fStTAYfi1tQrp8ifEjCjqS2a40NIDX7ESh0j8QWczLOQn8Bu6PFMdY5noK2QkKtf4YJs
         XleHQPJsthoLok1DL8lliw+3QhEtfakqTM9roo4q/OmOS75ZxaQNsy5xS/ibYTaDUU/A
         pgiFKx/uE3wYwaMgJ1hGG/6a7MgjhwDqVJtgQlQ83FGwjqsK4YZ715YsJNrJPXAuYQka
         nKAEQKA+egu8bUD2MN9HNWh0rKi8yZYcC/KB0ZyUgxJPMYjMX11lPjU9xaIl6UCOssJd
         maEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787485948; x=1788090748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A7PHEhV73LJoQU9Gqn5PAO/LzQK/ZMaTTgCit8UtjH8=;
        b=lGk0EHOc71OK9QJSmlPMq2uSDPsM65sJuYk0gjPoMpbaraRF3yw5fkCzZpvK9aR71A
         wOObD8/3489b9+bHBCkKAvViIKixk9wF67N5NfpoUy4Xt1V0KIE8KoPpN767EHW2M48F
         MTeWhrLcqNH1QOUVDARFEP73Ns5X3xQx6En8leuZHzUsFCNRRwjurtGbDla5C5KSwukU
         RyQm4eNpBAMVSmR/c1y90w6DchAC8qzvwX6vbbhWhwC82RA89m53O667Ceq0h2WJUcfW
         aNtCWVghcoo+9amLKzhjL15/lMmd9nKNbxcB51KNs+oO66F2gDzk1Lko7F4ETqshpdhT
         DfWQ==
X-Gm-Message-State: AFuF++kiTQkak1y/uGuXzFzA6JTIZLboQ9xI6/0RnG82lvn6moo7o2P2
	giySLi8ZPuYhEkqa/qDGpqqTn+wXDh6at5JIgt/Sg1ONywhBO+v86sKF4sXCuw==
X-Gm-Gg: AR+sD11dui89jYA1m0yripBHnmEhdUfU9E58aniWkjODiXmjTT2GSEas++HSBWmjU2U
	Dgi62zKHBTPdg7Pcx3dib1Bus2QrOH6cmRV5wTnShCeibgXYNMngaTvezAs8m0Fma1dSpgJpIL1
	zug3shs+GQvPyKgwWT+mgfTIcow/3ovpz8hR/Pb0/nUb1opV7zy+TkL/wqkXAFzJD7SZXZGzm7I
	c7V9ZydbdbIgk3QYUASTtAUqm/MSqiB54vpKgkK4r9QK9rQweYTF6yXSfyhnWysssKdeOEc2RMe
	jxX0aN9qAaiOUN47vsv5oISaCPKEu337LFSreYrNGCG2poN8Si+xJ4i58J4CTaHd97HS43Ci45D
	JCl8w65oll/Kmr6tpQrWAMrANcGmT+K5Wvij+7HkMeEV1SsOtWn6KwmxOD14gCyqcXOiPGmUpav
	KaWQNqy5+sqI0wh+RKDrX8o+HzGq2+dnsVa78U8vEhey4HG9qGGGX4DyiUWqUChyLBRYB1YNn7j
	g==
X-Received: by 2002:a17:90b:5112:b0:37f:c22a:c188 with SMTP id 98e67ed59e1d1-395dee8a5c5mr21578724a91.4.1787485948540;
        Sun, 23 Aug 2026 04:52:28 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395e494fa7esm5793398a91.1.2026.08.23.04.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 04:52:28 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [oe][meta-gnome][wrynose][PATCH 9/20] gdm: upgrade 50.1 -> 50.2
Date: Sun, 23 Aug 2026 23:51:47 +1200
Message-ID: <20260823115158.1582363-9-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260823115158.1582363-1-ankur.tyagi85@gmail.com>
References: <20260823115158.1582363-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 23 Aug 2026 11:52:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129443

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://gitlab.gnome.org/GNOME/gdm/-/blob/50.2/NEWS?ref_type=tags

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 2a4ad6ae3a853537494399384ef7b77a77ad13b7)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-gnome/recipes-gnome/gdm/{gdm_50.1.bb => gdm_50.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gdm/{gdm_50.1.bb => gdm_50.2.bb} (96%)

diff --git a/meta-gnome/recipes-gnome/gdm/gdm_50.1.bb b/meta-gnome/recipes-gnome/gdm/gdm_50.2.bb
similarity index 96%
rename from meta-gnome/recipes-gnome/gdm/gdm_50.1.bb
rename to meta-gnome/recipes-gnome/gdm/gdm_50.2.bb
index 9332c7836c..8b4470ec98 100644
--- a/meta-gnome/recipes-gnome/gdm/gdm_50.1.bb
+++ b/meta-gnome/recipes-gnome/gdm/gdm_50.2.bb
@@ -21,7 +21,7 @@ GIR_MESON_OPTION = ""
 
 inherit gnomebase gsettings pkgconfig gobject-introspection gettext systemd useradd itstool gnome-help features_check
 
-SRC_URI[archive.sha256sum] = "770159373512192410f412b5d0c4678ec1573f1ae4b39c81fe75861fe8890174"
+SRC_URI[archive.sha256sum] = "8a4679e47cddfe8b0a1bd9d3836042deb68fb3e1b0e7e62dfd0631dc5b6fc541"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
 PACKAGECONFIG[plymouth] = "-Dplymouth=enabled,-Dplymouth=disabled,plymouth"

