Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48018.1795411826607983863
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2026 21:30:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=PiglClZu;
 spf=pass (domain: gmail.com, ip: 74.125.82.170, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-385c497bf94so1284117eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Nov 2026 21:30:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795411826; x=1796016626; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tCsiXbNa8kT4ojX6yK3dQr3XUexzyGVb7VZOLZTCSoE=;
        b=PiglClZuoM9u30MxM/JGifmbIuF0H6w6e68sXAgqROy0Jrl8CB+gfGwEfxeFYGx59l
         dYDf9Djh/1EP9KFRaSHh06stTGwHOawA4917hheO4fWIOLc+EyiqFYoRdAhf6Rl9Wsul
         JcH79vf+D4JiD0uInIi/G9xAYVi3iQSVJPtyDjI6gBeN+D2KVK/MyB+kvc2iBjoSG6QL
         a97mE78Qg5BbM1T+zhRO2n8muWPY4SAaQsz19t7z7v4/zkmjI0TOaeS7dmUwJ367cODv
         a4MZAj25VQ7GUPnubE0EZi078HYqtPRV16Zsg6/oCPd6x1VTcbahM4ZInl0xBPRVlQjH
         vTsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411826; x=1796016626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tCsiXbNa8kT4ojX6yK3dQr3XUexzyGVb7VZOLZTCSoE=;
        b=VfSEs8lXnPda1td7W3vwoey0VMHsuM8Rd+zBRetsb0OhZsmO/pcwkjem6O59XKHtJx
         D5FKfrL3JAbTUrlMtM6jKa6mjVMJ7FvE52+2G0pew52hl8iyMn0eUnuthtJLlpksN9mk
         4Rg7BAwYXO2arZTbMXexYVKxtV3SWBLdmjvR4XS6zIbiMGCjspij4w4ziCwByyZu/lz5
         +riQl1yq85xkA+9sHCvjHYrY6ZSgnWP3RmEXOdLX0utbZRQzZkGCxnro5GvbCjkzqAVW
         iA+wDEQgi5guDEXbLQKCS2+2v0jz5BW5riD5+A5VVJ69qjHNlBY9dHrCfFMRY82W7EKC
         9RqA==
X-Gm-Message-State: APuU4Z+rfUnSrWUDy/4KhRXqEcpjvdFkkaWAa4p/7CciLmXWTih/3sHc
	p8SaxxxJ9CHYjdou0xjDirf5BNvOhNeQuA4lID32SKrLSbJoGZRD3UCKZ0pptn+XgCM=
X-Gm-Gg: AZFdTZfpsS4694HBUJK1l8jFjXKfY95Mrf4lwc7GCQGzJsVMxpkNuUo2RFjYyXhAkRv
	CmFnHYM50Bn9qWam8ok3ghZURtEx5cjsLqEB3S7ro1sN6PQu/aNcbaLROIsADJz82Aei6uOvjyV
	zrBpnqAAPyxNsSz/trDJ3WFw/EuVBF7YkeywTvi4NHFqnjfTkbCJCo5u2GWZwfBx51Cots1rpwN
	s1ZOCpQu3saeNANLeqL62yp7vbigJkiv3B67BlgUzJkGAatTqzlGVPJRuFE//Lna9mvU345aJ/x
	ro4FG+kSzKiL5iyCbwutQxmVa8GKaX1p9cB2ua9f3jLB+66rPWR8JQ+3cO8kshRVFtRYjVT6iJ4
	agRyJTHfJYqxnzx5L/ickMxhttbLk/ljgZlJRL6DlaJj77OutzrVIRBkA5PYBgZgzYVvR2WpzzD
	NS3L6IFrcTuYR7JqPCG62Gxj4rHMI7fzMO3ddGEzE3UTNvLdOiEHdVkYGcMnZIDgVpiG+EUjE9U
	gM4+rdddUX/5f8NFEz05BiYtxxffxO58yRW/2ytBzAqrcxJJml3Y9Ecc2TR8xgw4h5IR0HB14L1
	AJKs3OfhNnO2h2IhM+NEMmQGpeUQ3kNzAruJJ2xonLH7vJ+WEomMU+unodwTMIKPuGUSGuXbUVM
	ET40bY3GdZnXNhCzfSKLrNmm5zbeIR4YTwwDopiQ+WVU0nl958Ym9mwcXD3rpOx3pG/+ciMq5k/
	jrO8qjKe9rDEUwN5FqPqvnx/2xszQ7DEsayx0VHThsYlZkiNucyjEJ6rfGo2TGQ6ePiJiQrYoPu
	heqVTQI0C+jUUG/wklc28nY6jEpOzo0KuXLLaGLRaXg+xYQ5lu0v6/ajg2CNDA2yqed3EvSh2EH
	jEdw
X-Received: by 2002:a05:7301:fd06:b0:369:f05d:6c5c with SMTP id 5a478bee46e88-3856f549471mr11143434eec.28.1795411826012;
        Sun, 22 Nov 2026 21:30:26 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm36573136eec.26.2026.11.22.21.30.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:30:25 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 6/9] openipmi: upgrade 2.0.37 -> 2.0.38
Date: Sun, 22 Nov 2026 21:28:40 -0800
Message-ID: <20261123052953.3658549-24-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
References: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 05:30:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132811
Content-Type: text/plain; charset="utf-8"

- lanserv: reject encrypted messages on unencrypted sessions
- lanserv: add the VM enable/disable command, persistent Set SEL Time
  and all SDR operations by default
- Fix generator ID on platform event messages and the record_id in
  delete SDR handling
- Fix the get_id() return check in sensors and controls
- Accept the invalid padding length of 16 that some BMCs send
- The ChangeLog file has been removed

The 2.0.38 release tarball no longer ships ChangeLog, which automake's
gnu strictness requires, so create an empty one before autoreconf.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../openipmi/{openipmi_2.0.37.bb => openipmi_2.0.38.bb}       | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta-networking/recipes-support/openipmi/{openipmi_2.0.37.bb => openipmi_2.0.38.bb} (95%)

diff --git a/meta-networking/recipes-support/openipmi/openipmi_2.0.37.bb b/meta-networking/recipes-support/openipmi/openipmi_2.0.38.bb
similarity index 95%
rename from meta-networking/recipes-support/openipmi/openipmi_2.0.37.bb
rename to meta-networking/recipes-support/openipmi/openipmi_2.0.38.bb
index 9409a67d4b..a637b19d20 100644
--- a/meta-networking/recipes-support/openipmi/openipmi_2.0.37.bb
+++ b/meta-networking/recipes-support/openipmi/openipmi_2.0.38.bb
@@ -36,7 +36,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/openipmi/OpenIPMI-${PV}.tar.gz \
 
 S = "${UNPACKDIR}/OpenIPMI-${PV}"
 
-SRC_URI[sha256sum] = "c62d38f5da7df4299ac3a652508e959537752440181e34c76b2aecebd7f301b9"
+SRC_URI[sha256sum] = "614097444340519eeeacb1d5d052103b1e6dd353e1141d7da524e09068442f5a"
 
 inherit autotools-brokensep pkgconfig perlnative update-rc.d systemd cpan-base python3targetconfig sourceforge-releases
 
@@ -67,6 +67,8 @@ FILES:${PN}-dbg += " \
     "
 
 do_configure () {
+    # The release tarball lacks ChangeLog, which automake's gnu strictness requires
+    touch ${S}/ChangeLog
     # Let's perform regular configuration first then handle perl issues.
     autotools_do_configure
 
