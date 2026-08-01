Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3260DC55172
	for <webhook@archiver.kernel.org>; Sat,  1 Aug 2026 21:45:56 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13607.1785620754262652889
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 Aug 2026 14:45:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=QvD0W6HP;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c9cf07d2df6so1612423a12.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 14:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785620754; x=1786225554; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Th3vCUEL4fXsVl7PYYwZF9oPunyPtzLWSsTJW0N9GNA=;
        b=QvD0W6HP5Lwcvr4rmDS73L8XH6VWo1c3uLkXySJ6vhjl+glVBA5hHwK/j/8GHlvSad
         N/a0xRAC1pnp3qnAub1f52BEWFp6i3h0iyqvHbjAehgNI8KhEzq0KbtKgsH3cEnCXYvv
         Z2n0behANy5mrAhjnju9T1/qs5k28VSfiJ9OnoVrhOcfSkXEf6TzbpB3oIhNyV930bTP
         TrQbQG+dy1uXLWvsabDqq+G+yQ29Lqv4X4B9Ojis3HCePGU7fcB5j+s6DvGe22G1v59U
         Qacm44Efd/RnyzaiIsC+MCO+ZBshvnBDRQKxDSGdzLZ0dQWRf0WxojbrXX3IF7jrAeFC
         sf3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785620754; x=1786225554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Th3vCUEL4fXsVl7PYYwZF9oPunyPtzLWSsTJW0N9GNA=;
        b=IgfWo6SPuaEHlGkHnRoqlpDlXVoXGnfppCKsSS/lKEb9EDllFBiTqDHAUcDRZNpw/x
         9DymA7d1wKbjP2zvkMkQ4eUdgYo8L4pCkM+xJ/eDvrV6Qvnyh6In8i1ViM6OvouMDxKO
         q7OCLCFXtF2/Xx/fLOk4ut3ibIASoeSkv3jEkWYex1nAiaR2zYJM/16ZBWhr2aW8jTfq
         FUD5fkJiFVXACjQOWsBM614OAw2pMf6JgV/k50aTZYobfaD8Yfw+QJ0tdQLLGKkRJ0yg
         WS2tjiMo7nW9dBKbw9lrn0SFhfkVzBfNvVoEGnHdTnkSb+gUa0QhtPk1HeQO6KDH51pP
         W3dA==
X-Gm-Message-State: AOJu0Yx2sE1NMPFLEKX3aipPg4YTPR7bdU0us2PqFiv0ZcxgSO0KLPiV
	ej5QGSph/hEvSGdItu3yLjwF4HUW0hyD7YuoXM47ZiKmg9VubdFgE0alQlTNU6t8
X-Gm-Gg: AR+sD10XqxG3kOTGBd/DT9I2KIfs0jI/9JNldbS9d0sXFzU8zKRZg391ajj4JWmzBUE
	eXNRhGC9v8SrqN+EkqmNfg+mYmeC6WcIDpQXOL+KyWwyNkUNBfCPdtL8CuZNMFXcSjoGhjPfmxt
	Da3Co9xxAf/8SP4bYkO8YrgM5LPAf1n7ZjN+fBRn02BM0ATtV9LmQJLQHm0qsCoXAFpfqEuSMMC
	jidoB2XXnS6LV9r4iF/q+kb+2gVD/uyM8Ef80KAbldPIEiy2rRsfISH+BWUnWxbwcV+WW+oZZk/
	NnlmauGjofSL+hZXmLq457iawjRvEY4/bvaEqWg1KwlOTaD5tIpP7tIU6oMvr4sm9SZH2+ppcBl
	eCokC5WTNQ3QKDPHBTeJAA8qVFlxCYQcCiQZSqL7d93TnpL4JoqI6Oa8f3A/t8kgkSJ7luOYtuG
	gDsyRy2OF9NHvToElQGxKdbdb9fT3ltpl188iyWMUZHApU7aaVktRw/nAv24za54fyL4+UNDQdU
	uZTIyuFY526SjqWKzSXt6XDINKDLghas0UeJ4Nb2H8U6arIBVwzz+wkmj6tUYnCR7EBWSKBAd87
	Zi/k+PFuFhIfOAaXmmfHLnC/AGB2y92+Vdo43hq67XuQ9QBL6cSS+0TB5kh8Xwpn/BK3A/GPzRF
	Mpxowu0Ngsw3p7g==
X-Received: by 2002:a05:6a20:e20f:b0:3c3:c3fb:2473 with SMTP id adf61e73a8af0-3c92a53cb12mr4831820637.20.1785620753514;
        Sat, 01 Aug 2026 14:45:53 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd4e5b0sm19105102eec.1.2026.08.01.14.45.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 14:45:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-multimedia][PATCH 25/31] xdg-desktop-portal-wlr: upgrade 0.8.2 -> 0.8.4
Date: Sat,  1 Aug 2026 14:45:20 -0700
Message-ID: <20260801214526.788343-25-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260801214526.788343-1-khem.raj@oss.qualcomm.com>
References: <20260801214526.788343-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 21:45:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128642

Upstream changes (git log v0.8.2..v0.8.4):
 * screencast: drive the PipeWire graph ourselves; default SelectSources
   to monitors; guard xdpw_pwr_enqueue_buffer() in the PAUSED state; fix
   stream freezing on PipeWire buffer starvation; print an error message
   on the Y-invert flag.

Version-only bump (git tag v0.8.4); recipe unchanged.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...ktop-portal-wlr_0.8.2.bb => xdg-desktop-portal-wlr_0.8.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-support/xdg-desktop-portal-wlr/{xdg-desktop-portal-wlr_0.8.2.bb => xdg-desktop-portal-wlr_0.8.4.bb} (94%)

diff --git a/meta-multimedia/recipes-support/xdg-desktop-portal-wlr/xdg-desktop-portal-wlr_0.8.2.bb b/meta-multimedia/recipes-support/xdg-desktop-portal-wlr/xdg-desktop-portal-wlr_0.8.4.bb
similarity index 94%
rename from meta-multimedia/recipes-support/xdg-desktop-portal-wlr/xdg-desktop-portal-wlr_0.8.2.bb
rename to meta-multimedia/recipes-support/xdg-desktop-portal-wlr/xdg-desktop-portal-wlr_0.8.4.bb
index ce5a92da14..f150fabc58 100644
--- a/meta-multimedia/recipes-support/xdg-desktop-portal-wlr/xdg-desktop-portal-wlr_0.8.2.bb
+++ b/meta-multimedia/recipes-support/xdg-desktop-portal-wlr/xdg-desktop-portal-wlr_0.8.4.bb
@@ -18,7 +18,7 @@ inherit meson pkgconfig features_check manpages
 REQUIRED_DISTRO_FEATURES = "opengl wayland"

 SRC_URI = "git://github.com/emersion/xdg-desktop-portal-wlr.git;protocol=https;nobranch=1;tag=v${PV}"
-SRCREV = "01171a150b705cf07066ebc0fb7e1ff537027bec"
+SRCREV = "34153094662acd713241ca6cbbb20003ef67da5f"

 PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', 'basu', d)}"


