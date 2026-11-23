Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48497.1795411804946275432
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2026 21:30:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=ZSYoTovF;
 spf=pass (domain: gmail.com, ip: 74.125.82.180, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-38190551625so6113888eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Nov 2026 21:30:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795411804; x=1796016604; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GaHIb+IAyE9Z6M/A+TxocMi4JAe5ll0laW+CTmoPyN4=;
        b=ZSYoTovFHgg+tY9IqW7ZNAiWiXoT7VDVaEWFDjehQzCgOwtQQmLT6lFsP5sJfVzStm
         CoRA+5PA+LFUY7ATdUEfIdCqgYxxedBA8/tI+FL2Pjb9cSzAdAdfY4c2s5I3pkUqoWXJ
         V/8zO4RB63UGMJ9ftETsss6j2qRq6GFOLBIBH0RzIBJ7C17bjYT1AthmFUUg819AlEYM
         XCo7QYFCb4PmtjpJ1Ton9dInQ1FmEJXUGFrtbyQzZuBcQGBBe72H6jhfPncfjuW3udGI
         cyvdwzjhbJGRtAjCcIaADAFc7MPDi9FriBhWicZU7+GK+7jHaY5sC4XHEciwKGl7KrNa
         YmCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411804; x=1796016604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GaHIb+IAyE9Z6M/A+TxocMi4JAe5ll0laW+CTmoPyN4=;
        b=dDXIvY2/jBFMMDgZ3QIqSbysW4W5OSPUeXyyjJTJlSKfHc/8vWMQrE0LSBIZggwFOR
         wxAIuxSMxiGEfjeZC56vuOLTw8SLQi7UWbzG7fUVmG587Z/YOhZa8T5+xfRuAbX/qTDt
         zVmmXv9SUfaLnsoxZuXHr/LGJ8Oq7zJkmxk4+umCbDwUmrfLwLEfOfnQdGCcw5vMcDWT
         BZ5RE4roXu4lSC9xabb7Z/TuDJKSIzPry9vBC/CPtsiY21RQNtEl8N92hJmOXSIuTyN2
         Ftv4gR9ogMZXAk/auGCoS09nn6q0kWZ5UUJL/2/2SGw2AiZmIbfmyeRiwqgtsnulc4cG
         0y3Q==
X-Gm-Message-State: APuU4Z9b3zMEMo/kvlDB+o+gHZQfuto48mQkLruTxoxsXFBa85+fGwfC
	yye2eVHIelqHUTcpyGOTWEpg8iXQX2TSav13RUnlfADJ/g8cBdbKuXTCXRWp0CBgF5k=
X-Gm-Gg: AZFdTZdmAFzjisdbKdVQKFnEVS4dr7PT5EAknQYnK3uf5vzkIo3sqJYYZAVBLolYeYx
	TdWI3Mm/BuOtAjFOq7RleKKYhnKkDo8aACwMl8cedaXtCFj4CaduNbs/JdUPeAnTp9B7tA3UW1h
	S991D0GhxieH8m1TYBQA9rS4T8Ual6ZRlGp5LADEYEPEaSQ3ng+ZHSd4M/vifA53dgatZfpm2hU
	NEI6rYkDmTyZEG6YS1Rp9Uv6euP6u20xlIYpz8poPBKsHk2xQrBbUxsx6NJ7oTBQof6PdnV/bCI
	V26Y3fqjHOtLDxdElJAdi9kJsxigrvxeBXT+SPq5LTRfEUUDi/yKlR++hZepvn8dii2gbwKI5sr
	EqLdoET3U1p12coGMKq5YwV1BzYQwHFkFt4qWRjnKkV2AlJJiamTxxa4aj3SDGnh5/OsqgeDQ05
	7y9WC0VTiH60t1ytOlefmJlCdKGjJ6bgLi5WFaKpAYPOg8fi7fmQqZnZrWB9GAfmgx7IPtGv826
	JEpFlBI0gwoSxERHi1l0kCTDG/RfMQl3gomqq3w1uQn4V25r7wv0zsmxMVNsNuX/r6EZDIgrz1m
	Serm1c9NnqC6lBajt0WF2LSiHDFRZB7oNPBOlze6eNE+QSRzRmZmB1NSK9V31joQepN6Sq9a+Af
	AN5tUEfvyJMTK+kZjDHNwQDqU5Pod30JpN7vV746lgeEsimWHKI0peBoIpeiUTcrDpDQiOZxx2J
	qrFAkUKJb3FLvXQ337mrO1+nDM5RS0HJmtau+bUNe6ZaKm8IXNEW09gbxgCMDvKicg0ei9Y5XDb
	U2mKkN/3qWj7wo3rWqXHBFzXfGLWfXTd0+dksLfsL+pENZaUlOvSQkqnQ4tSvRVIPUWvBJFISQB
	4v2L
X-Received: by 2002:a05:693c:88cd:20b0:386:a16d:1bce with SMTP id 5a478bee46e88-386a16d1cb0mr5510441eec.36.1795411804183;
        Sun, 22 Nov 2026 21:30:04 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm36573136eec.26.2026.11.22.21.30.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:30:03 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-gnome][PATCH 3/5] gnome-online-accounts-gtk: upgrade 3.50.11 -> 3.50.12
Date: Sun, 22 Nov 2026 21:28:23 -0800
Message-ID: <20261123052953.3658549-7-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
References: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 05:30:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132794
Content-Type: text/plain; charset="utf-8"

Translation update only; no code changes.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...unts-gtk_3.50.11.bb => gnome-online-accounts-gtk_3.50.12.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-extended/gnome-online-accounts-gtk/{gnome-online-accounts-gtk_3.50.11.bb => gnome-online-accounts-gtk_3.50.12.bb} (94%)

diff --git a/meta-gnome/recipes-extended/gnome-online-accounts-gtk/gnome-online-accounts-gtk_3.50.11.bb b/meta-gnome/recipes-extended/gnome-online-accounts-gtk/gnome-online-accounts-gtk_3.50.12.bb
similarity index 94%
rename from meta-gnome/recipes-extended/gnome-online-accounts-gtk/gnome-online-accounts-gtk_3.50.11.bb
rename to meta-gnome/recipes-extended/gnome-online-accounts-gtk/gnome-online-accounts-gtk_3.50.12.bb
index 9ea6b662b5..c1b9d5c84d 100644
--- a/meta-gnome/recipes-extended/gnome-online-accounts-gtk/gnome-online-accounts-gtk_3.50.11.bb
+++ b/meta-gnome/recipes-extended/gnome-online-accounts-gtk/gnome-online-accounts-gtk_3.50.12.bb
@@ -20,7 +20,7 @@ SRC_URI = " \
     git://github.com/xapp-project/gnome-online-accounts-gtk.git;protocol=https;branch=master;tag=${PV} \
     file://0001-Provide-the-org.gnome.Settings-launch-panel-interface.patch \
 "
-SRCREV = "2796ab3cc4e5b29f64a92b239eb3f4b1eef190be"
+SRCREV = "a356874606b6f9512d4fc20f5cd7002506e96f36"
 
 inherit meson pkgconfig gettext gtk-icon-cache
 
