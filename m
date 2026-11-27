Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11830.1795763044083986978
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 23:04:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=rl242YgJ;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3b4a93d0814so2721193a91.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 23:04:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795763043; x=1796367843; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c3Wjy0pE0g+zZZSZvEMXGIx5advgSNJkZ3/Xpi7e2uk=;
        b=rl242YgJFpLAL1Io+9lJNtiGPmOPaKzIgB8c6AfZAkpRpgG4IXWaFAbtaIS7jWHJJs
         nJk5R1N80asKztTp9VwPbjy75xn4MIAm+iNHxKH+1im9llb50iejDlGjpUpDN56TsGAr
         vYdzCo8A27z/DWVbIPe9ZWo4EOFugWX8ZU4vUxqL4P4RMFGfLg21g+soNkqFWYB42P4T
         i9Zt3DU9xytbCNnHIErcCw8MY7qrPz1gl8LSvB/pBzR38ydcil73jptBY/7a7X7yS7Uy
         uZAeo1b2/YwJSgAA/SGzTWlWtrdLpvMC0ccl05153TBzeyg1RXilsLLZb9fCLovvrXOk
         fMDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795763043; x=1796367843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c3Wjy0pE0g+zZZSZvEMXGIx5advgSNJkZ3/Xpi7e2uk=;
        b=ODoUqtg7xy79d6MrIuzjty6zdunXpmZIyU7EhWyEtqxfNGaGw0kLMCu+twW6Y1KbUO
         +SSzqafSypEQJ9T48cs8GLUWEqHGGMklfpC3vTrWc0jjiQmGDvszWERtuBuJ3h4vkB/U
         UfhGkqYvT6l2dpVt8v/ERgbUv4CkJMUxKjTGGS4xaB0pUNJJISeWhykYE4cyN9mz9ZGZ
         YifJOTx2bt3b7hGMgPyDBcE2OYtMjzrXrYmpHy8e7kS/6HO3S6pUPr4reR6NkTOsPIBj
         0auYNwlg39Hr/bstLDQJZYfxBd8O9psdeRHLutnrv5KloQsAa5Z7VebWOYRJ9a9R8bOm
         Ax8Q==
X-Gm-Message-State: APuU4Z+CmTZaA2Z8djyJtfGdAUUbUqhgIJkzSNNS2cWRhaOkf2EZiJaZ
	yLCFaFsW1rSsjlu7LJDW8HXAsRuZkkrL9pw6m56Fih50hOHiciNQBrP2UQ7srtAm
X-Gm-Gg: AZFdTZd/JNcxdrNelG/R7ABtYQcn2x09GSL0alCnj2teXLUJ0DyV2f5dBo2SOAGVxc1
	XDXHPjJiOoL1+eisfWI3sXS+neJeXD4tT1AuY3Gc0nGKg3tgi7g5Nsqeb8tk42IgQuwy8c1oxnx
	FwvYjCK0daCEIa1ENpvcujRkPBAQDxBV4PAz6JlyfXf0yWGDFs2ag0yMt5F7DndQPeXKXhIYWC/
	hKCkWfuA725+iIExdyIz4MrZAuk+5td24oP27eoG2BA6kMieIEL6E4wDAFEREpCldzM8+NJfZVH
	b0amG+bli6d5c4vyiNLtxgbeVES2S1QyqNCeI4mx9Ku+gBiQfSzrXJMY8Bc0vP20kZjUZK16y02
	QCByy6XvN7AXXztRQJSS2WY6w/8Av/MND+WPxCypBMwSz51w6llO7tsaVYEgTtz4XDhhqgBcTup
	nl3XjGclcM7UwouNxOaHo1zHZpaCGamZo7HN5M3YFUTbnAMq0kvqSecQcaVZy5Brht1Jb4mleBC
	SbWyTU9+vothkK3LaqBYn9TgHvpzqx3T6BOuvxhwqg43o+FMvGTdUX9HnU10DjGfQTlPuih498z
	6GcjkHkrsjx8mLDknbKaZGNiNXrtGuOAkEeNhSpAlRWVJSjYUcTVqpY8fKTLeHBQzWiEEhh3Drq
	xKbm0iS9YDUj6og0hs1lzgUY2lhsrjTVdVK/ovPbsDhG5hjO+mtYfzR3bQ3mB6QMyFWUfdlyPSV
	u8dwOFymTIbRTlH/Vw9PYbOhxrg/DHOgz4Vb8g5y1bpLRX0YoI549/MbrpA3cruj1NiuZBmgDsi
	F7dGk97OPRUan/Pl8/3rG/yChfeliG3hKtR3jW0nLRF0Lp/nP2VQsUbvCVNELje8b67ygLdCfME
	U7LGBw==
X-Received: by 2002:a17:90b:164a:b0:3b5:a3:442f with SMTP id 98e67ed59e1d1-3b500a34654mr6820776a91.41.1795763043391;
        Thu, 26 Nov 2026 23:04:03 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40578dca0sm39785288a91.2.2026.11.26.23.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:04:02 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-xfce][PATCH 1/2] libxfce4util: upgrade 4.21.0 -> 4.21.1
Date: Thu, 26 Nov 2026 23:03:56 -0800
Message-ID: <20261127070359.2405078-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127070359.2405078-1-khem.raj@oss.qualcomm.com>
References: <20261127070359.2405078-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 07:04:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133370
Content-Type: text/plain; charset="utf-8"

Adds systemd wrappers for SuspendThenHibernate, makes gobject-
introspection scan warnings non-fatal, fixes a gi scan break caused by a
missing prefix, and bumps build requirements for Xfce 4.22.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../{libxfce4util_4.21.0.bb => libxfce4util_4.21.1.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-xfce/libxfce4util/{libxfce4util_4.21.0.bb => libxfce4util_4.21.1.bb} (82%)

diff --git a/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.21.0.bb b/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.21.1.bb
similarity index 82%
rename from meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.21.0.bb
rename to meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.21.1.bb
index c8c98d8022..e484a9e27d 100644
--- a/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.21.0.bb
+++ b/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.21.1.bb
@@ -11,4 +11,4 @@ GTKDOC_MESON_OPTION = "gtk-doc"
 
 inherit xfce gtk-doc gobject-introspection vala
 
-SRC_URI[sha256sum] = "205677cb96b778e5079eeac80f3a636d2a909b08fcf2aa05bfe4513c69c27f29"
+SRC_URI[sha256sum] = "509e0ead3bc98c4f04b79069be7521b7cc35b63702262e148c5364b5a08e2e9a"
