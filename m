Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5759.1794975206322038441
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Nov 2026 20:13:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=t2z9FXRd;
 spf=pass (domain: gmail.com, ip: 74.125.82.179, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3282db206d3so1568375eec.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Nov 2026 20:13:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794975206; x=1795580006; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=djtPIh+QX6kJ+MjzNY+TBji9fgub/jlhpQvuDaY6Jfw=;
        b=t2z9FXRdzhriKiCclP3dpBXAJTTjmXj6S32czk7ENzpcbCcc0sdgk5feMlD0+SooGR
         icrHN4HnOnvqXw8QzWoxarA2+9AahvOng147L+Cx01xxCufGug4zZf4zdjArdN5TZo/R
         EAgz2VNKmL+aPJ27m1BuvkMUyNrdDUFulkkXRSYJrEQepex5fUy17yVAnVWOeQqjtwoo
         m//bhgZK0CXDVzYGGqe2IjiiJZF5msRcYZnoDhxgtsGNjnfHhxij6VzmASZMtHaVwNXV
         k28GwFlHkIHYq38jhWM5QYbBOoH2AJ9kCPnBXorwYvA11fKBOj6mTE8pJec6ESHXPszS
         2R+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794975206; x=1795580006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=djtPIh+QX6kJ+MjzNY+TBji9fgub/jlhpQvuDaY6Jfw=;
        b=Lw0FlHXLfeKgGfkBOEEEkgv+L9r1rehdNZcHQ6yPjSUztWTNwftQz9jed6ePyVeNov
         pwwdRpNgbaig9IHNne0C0nKge0UgUAs+2J8/PQt+4CuHrokVhB1MIve+KlVwlPD3onHE
         ODk7DyD93qbGc5TyQrJb4mK3gXEA3vPOMvKZKFcb9Li3k7e726KNvQpV0oVo5cOG3eR4
         8m099jlra6oPyZ0m3N8e4BgLsWAUoKiwIeSP5zfaLGygf5m1sF15qNJkeQ3GTUprp8gl
         wXaDYOsYjWptg4JircVHUlwdtyl9+WYbfLtOU89xklXwMyyYHSM4wt23N0XPayS1cUtS
         bljQ==
X-Gm-Message-State: APuU4Z+y98kogi/ZFTSkNKD1hRIDOvQb0gjApVctIzhLFKXelKkh7HW/
	d7sBt2m8L+C2d4+MzIn3XvWSkTvTKcO6jYcCBwBDgrrQ43X+QDKo87CVCkmHyfds
X-Gm-Gg: AYBFou3Y78MwxzUPx++nHqEl2z8MlAHlDkuVepUzdYdqwYrpsNkMJyQJqnRQugWDvnN
	WOELLxjiBp5k4eGRAYzIXXVL1AX2ZNo9jt0yC/j1WYsJFLhMvjm/Q9tJVtOTpRmb/EkBotvzpa6
	9DHOWnYHvRLIk74pkMCje+ZUjPaPg8iSIsvfTtiVX/GxQOqm32twAXPWt67rHkf+KpcpOgvnooZ
	3Rjutb6LFAfUAr3aNmhQoQ2xY5Cuv+GKs35Us8RUw/skyhpJB8kIRzk6NbBZrNZAAQxkl0brxwU
	N3zAlSi5jDakBEcusIdH4YjSrCJ7Uo29IrBwLdaLAclTOeu/3oGrp0A1WeZn8muwxDHqEeimrWg
	vX8l14fithYZrn/KyEuZB3ayTRJ73jYGC5Vb77quP1bZfgWIna2YVaZmbTeLNVbxijUQqrWLqFj
	ClcuTh+MCxkZ/0eJwgl+MbvLiwOcU7aZgRpCP2sYcbrne0rwwwW32PYxkW4pBhI5lEcwK+XK2jc
	ITW872TQdaJTcGtUn9MqbHB99XMPMXmgdFGOmSvMNj9bOEeVjeMDJYsLFMw65qc/Eygihvahe3a
	boIudR6G2HNAaLOJ09tfGFLtDVmaN+WIm1WwN9ecpsQo4zSCOEs2QSUxGo5b1f8vwlITkJUXmI3
	VP9bh+Ny6zu3mZavrFCtfOncYxOcEyMRXhXGOr/Vjr3nTCIdC3xvu3EOWxtioISf4RWf9c23eOm
	eQ5ia6lVOmVO6Lka7pSf5zWJ4fk6dn8lYSsqTWi7SE5hdKsRwb+wD47q2e4wbFLl0Cn56HjL0lZ
	7aEkyHyMmi4rpZIn7kBLVBOjrno/iMAWn63hGceOUYAln4isaJ3h0Q3MmKfy5vFhQ3xf341hJkX
	Byx7
X-Received: by 2002:a05:7022:7e85:b0:1a6:7a2:cfc3 with SMTP id a92af1059eb24-1b543ce6b18mr1770539c88.13.1794975205629;
        Tue, 17 Nov 2026 20:13:25 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447f4eafsm2655742c88.14.2026.11.17.20.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 20:13:24 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-multimedia][PATCH 05/12] gupnp-igd: Fix LICENSE to LGPL-2.1-or-later
Date: Tue, 17 Nov 2026 20:13:10 -0800
Message-ID: <20261118041317.2287415-5-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118041317.2287415-1-khem.raj@oss.qualcomm.com>
References: <20261118041317.2287415-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2026 04:13:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132628
Content-Type: text/plain; charset="utf-8"

Sources say 'version 2.1 of the License, or (at your option) any later
version' and COPYING is the LGPL-2.1 text.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-multimedia/recipes-connectivity/gupnp/gupnp-igd_1.6.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp-igd_1.6.0.bb b/meta-multimedia/recipes-connectivity/gupnp/gupnp-igd_1.6.0.bb
index 307d912483..de14e50d41 100644
--- a/meta-multimedia/recipes-connectivity/gupnp/gupnp-igd_1.6.0.bb
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp-igd_1.6.0.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Helpers for interacting with Internet Gateway Devices over UPnP"
-LICENSE = "LGPL-2.0-only"
+LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                     file://libgupnp-igd/gupnp-simple-igd.c;beginline=1;endline=21;md5=aa292c0d9390463a6e1055dc5fc68e80"

