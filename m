Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11767.1795762848162802546
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 23:00:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=zi+kgKTY;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2f0464dd6b6so47540575ad.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 23:00:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795762847; x=1796367647; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t3S9l8f0x62Ujf85coKj34IowUZSPrX642OWH36EUa0=;
        b=zi+kgKTYGIi6IRP6r9WRKX6F/F2AbsQgxEqC+MOjUZiy7qaF4ap0FHmipgvIroB2MX
         qMFavWiC0lBVa0ps5GvxbzyeQU9Doz6hFpgyUHKFvufU+I2P8uHn10f+EOjDmzQzeLBG
         puPxk0bzP3LVdPmFyEXPI99rgP9sOknR7T255IrVzbF7P8Wk1jExa7SVfzFZuBPgjoNb
         46lc/aYKBanM1KZ3UIe+1qna/Y3MAxSZxbopQ4Bt70VSQ1PE3RyIDHVGoFyw274Tj3kX
         ersOGU8kIcJUWbIsMTUxkYvRowAPDUN2CxWkCOQD8EPT3A/UePi2IBdzyQB/7toweNNO
         9vcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795762847; x=1796367647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t3S9l8f0x62Ujf85coKj34IowUZSPrX642OWH36EUa0=;
        b=NnaJXoMQqP1Hp1q/gSjT8a7vNNiLvViiq3PYK4Cvc4T0EK99bA6q7qRAAqqgCbrXo1
         LZcl9cpTmNx7YD+FjiHBKfwudntVoR/runupr+bZS6eNbRsqily0h0YP/cj8XqELQ28s
         f+yhmNVKZOjv+c39vLTmJtnAtd8YkRxnGPdJTo5qGPAZ0DlehrWlhzUU1tmBj2S2AY2C
         NDAjtyU4hCa9U0dwQzp3IRLOvMNtv7QLuykgOXWRA201jJSwOufVxUYFwDc5XzTwC45I
         fnAuDiygtMPm2JULesQXWUT2PTyXCXK5KRUl7IsdEx8E5VvOje6lKNKLguzU1RR4b6H9
         TRLQ==
X-Gm-Message-State: APuU4Z//2x8m+6dZPpN7hcdCaB4PHlJV+dqprH7Y6g/7gaiPnk1mqxP6
	Ny3Hs20VdoLqQIS9dT4Qai8qMKgZMajGs2FNqZmIVe2nFTEGe4krTiqsw2fP503Z
X-Gm-Gg: AZFdTZe1aX4kSXvs49F7aeH3julSGsdb4+WNhH/m/YsNQfcU4c6n0DgPTPEqZHVhD4S
	P9vxLAu0tLvlCYqsMqdvQIH/0m7xnWiNceB0kn+vFnZyYgn8XzMTW1fNK96QQhwb8EqxQWwvbKX
	FN/QTRt+2MgbFDJh7SgSP+7MpteHiOlVtlHwJYPAqdcury7WRlLWgpomeuBmagYw29bg7dAPHFg
	8CqGWlZf1My83JZCb7EwUbEYOdhcFMtwO8ToliXyf333wG3FGdHyGTeNSZrv0D8jjlOBgoyh1E8
	fo7tUEaiKljTtqq+3oRDnrEW1Bayuf7CpoX7Fy1BPnbLhhcCj0nuTk4HPRjuIvJqP7QKCrlbdIc
	0ZeJEhAbNwEk2OlK5GHHQDbHzPzqz+6aEU7Tr+6XyGGhnkXvXYdnLHv/QRnduQgYa867zBG2X+o
	PDkjcwWbWZkdVx9EyO2AH7t5sIJ07KfBkP+2CeV0fqT4ENyc3tVhGjocCUwV9HFxP0PTHqaDnSQ
	HT4Iv6UFktTW9Dzp9RKqs6V4EHhvEhX0ohUv0SwYJuznmQulC3YZZu0BnpdUj/6cpPwVxTSJ/Qq
	b0qnpeJLZefskzANr/T241Njt9vT8X36g2HARgRitrcVR/fZVMr2LMqkEvuutMZgRSJ+rX8bObj
	olnHcoGdlR6A6LFae8aw1NI8XKvrXW2HUYNqYw+8uLWrNS3OfZazphZJBMrW7yaMMfmy3mkF/Rf
	RvVgA4Xf2IM5R2eiIUktNVoeAGenxRry1phdss5Q/Ovl8jDt7FRAHTD+D2272XU3wr2+Bu5+k0W
	FJ0tqwr5ZzImJiwDsnczQ5/GH0Gg8AhnaR4SN13lbNRIrj84Fd6cJ7z4IpuW+feNzCNdOwWArRZ
	ZBGX
X-Received: by 2002:a17:902:c410:b0:2e9:87a2:b4f8 with SMTP id d9443c01a7336-2f03f17003cmr277452455ad.29.1795762847227;
        Thu, 26 Nov 2026 23:00:47 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f146b84sm113719395ad.71.2026.11.26.23.00.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:00:46 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 15/15] tailscale: upgrade 1.104.6 -> 1.104.7
Date: Thu, 26 Nov 2026 23:00:38 -0800
Message-ID: <20261127070038.2221538-6-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127070038.2221538-1-khem.raj@oss.qualcomm.com>
References: <20261127070038.2221538-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 07:00:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133304
Content-Type: text/plain; charset="utf-8"

- k8s-operator api-proxy: only use the remote address for WhoIs
- Bump the Go toolchain requirement to 1.27.4 (go.mod directive)

Stay on release-branch/1.104. The upstream check picked the unstable
v1.107.0-pre tag, so add UPSTREAM_CHECK_GITTAGREGEX matching only
stable (even minor, no suffix) release tags. go.mod only changes the
go directive, so the go-mods and licenses includes are expected to be
unchanged; they were not regenerated.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../tailscale/{tailscale_1.104.6.bb => tailscale_1.104.7.bb}  | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/tailscale/{tailscale_1.104.6.bb => tailscale_1.104.7.bb} (95%)

diff --git a/meta-networking/recipes-connectivity/tailscale/tailscale_1.104.6.bb b/meta-networking/recipes-connectivity/tailscale/tailscale_1.104.7.bb
similarity index 95%
rename from meta-networking/recipes-connectivity/tailscale/tailscale_1.104.6.bb
rename to meta-networking/recipes-connectivity/tailscale/tailscale_1.104.7.bb
index 106a50e4c0..cb2a71a554 100644
--- a/meta-networking/recipes-connectivity/tailscale/tailscale_1.104.6.bb
+++ b/meta-networking/recipes-connectivity/tailscale/tailscale_1.104.7.bb
@@ -12,7 +12,9 @@ SRC_URI = "git://github.com/tailscale/tailscale.git;protocol=https;branch=releas
            file://default \
            file://tailscaled.init \
            "
-SRCREV = "c54807352ae196919497b3f8fddc3cedf88368b9"
+SRCREV = "cbc74fe48ef1b1649f69a4d9a602319427e25102"
+# Stable releases have an even minor version, odd minors are unstable (-pre)
+UPSTREAM_CHECK_GITTAGREGEX = "^v(?P<pver>\d+\.\d*[02468]\.\d+)$"
 SRCREV_SHORT = "${@d.getVar('SRCREV')[:8]}"
 require ${BPN}-go-mods.inc
 
