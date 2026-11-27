Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10287.1795753071442985168
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 20:17:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=QBKdWPxh;
 spf=pass (domain: gmail.com, ip: 74.125.82.51, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1b589050416so1676861c88.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 20:17:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795753071; x=1796357871; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vXGB+8VOgObLu2falRImbnuRMyGdylgbHij9Q6tQpbA=;
        b=QBKdWPxhDjBsDd4PCWy2uE/jPbTqx5RyLJNnwgeGBvPpBoZcxin8cSwvOJdqpmX0VE
         UeFrlZtZtpE7foGAYvJt2WuYCSIKwTLd9oNZoUd46EUAeUQNSN2iSgruFUOHCsgDu7W/
         SWn7CyNQBjk4fokjw0fCEUm2ezIuCN9h/6wFZo5Jk251BZDctP90mEjWuDIcAcudYMX/
         jbP6zwAdGiDfG+dDsyGR0rNyMOCzsY8VaC+dvZ9QYz0//WSbmkNLLzU6RyyiBLPgYHja
         tCM8c61zCYyV8iw6Rkl/Xeg10NgARDuXKX4UK3rs4CyCSQbgFC3DS6162+TIbDqp1k1b
         r3yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795753071; x=1796357871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vXGB+8VOgObLu2falRImbnuRMyGdylgbHij9Q6tQpbA=;
        b=V6GEBTDuSaJT03V4O3Eb+2Xh454fzyixploHN0o4Ih86DHXoc1EgFlhbk2OsJPHfhm
         oEpJjFCerd8GRCjhQi9f5dU7H44BBEvUW2ufpm0XwUheL+LRJwDQUXVrsNhCfpYb8B6Y
         I1M0j8vfKwZ54yLsvRDkuDTDQ9+ESr+H/ILJ36tvFQy6vfVFt7Kyvd1npgsz05oPpYI1
         16q5IgG2qehO146rSb+J6PxjMgnVpBI91gjEeFbcIQdbZQZbVuiA3bdq53bJ1SPHblYV
         PQPkJ3h+EHunEmuPwZ98KODH/wIDquXHqiQHiO7SWNVdz3HXAZnVR9d4Q0+5bmoXkmJC
         7cfA==
X-Gm-Message-State: APuU4Z/i+TMKZ/9mqD3D+njupHjgHgEERXTCw/2KfZysD6jLxkAyuNnu
	GaL+qXZzeeht93NMwtRNLK4SmCxH78eCO7zk3dO3MwSAo8Y30n4mOrJsCT7x6SXF
X-Gm-Gg: AZFdTZeMX2rylUVUqqgyPiKlFjqp8uYb0KrZR0fIB2UznqQC9JrnmyRpoSnnApCjYzH
	L5NeXPXn5HN3yC2gEU5su3GWLJXfABaxARMRsR4bwRjry25zwExSlDTX28mrnyMDKLL6T+itTAu
	8A8g3M4g7oO0OK7TslP08ME10AO0RdQpRGVvo2a5JKg4QK0GuiDSrZWpjT5rc+7AoPikRQgXBIi
	8JsbDQmotXGfyb3U7dJUk8f7R6e0xrZsm5wpYEbJopS0xDIwI3QXo4kdaTH2mQJs7sOX7q50j4d
	QO1oc/EQoV9/YSxq1UI0XHEP6mj+JIglbw6kLsgj5wWanUEvMCq+XgDeD9KCynhKIWKP+W0B8qX
	SEKbLI0ypRMv9jer16BFyBq9hNGIHDr/VGcS/4NRsFsGzu1+uDjQ2I4PCLQDMeFQxg2lBeR/tkr
	950fp7GATKai7WObdS6xC8abBvWW/Sd2J7x/vnBFjGwyxa6XqpM/3lHL5AJCqemM6m0SnLQ82/p
	ivq/RaW5cJy7jZ0gzfigrXBBQNTBI8lTu0ZBmMvp5rI6I7g0y7yw8QCuYlmPkNCPl6y86iD1I+r
	vQPNmXyzFNIDtQtslWMZttIn8wCsqWo9XwACy+bH6x4IUXIcEjppW5wMMqfPs+pAAJDPDnj2OT4
	R7l1NinOV7iL9onU9EGweIS9y/NkP392cnRks5YBP9kDXyrjxApHlgCg5z6OWtgTj235Ybj2kQi
	eu6N9x4kZKi+sJVJL56fzYstZ6RY/HFtjh1tlwrAJya4/Y1KJQPGykfM3qLuDLyeVu7y9euRj/v
	SdDDcfqwcPDjSz1PydXjqM4wsSZhsI7zjSVf7orE1Toe1iPWk1VQJ7XCIOCuQr9v+2sWAGQoaRu
	8aIo
X-Received: by 2002:a05:7022:3b8e:b0:1b5:10cf:c402 with SMTP id a92af1059eb24-1b5568a17d9mr24937871c88.10.1795753070795;
        Thu, 26 Nov 2026 20:17:50 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556840494sm53880225c88.12.2026.11.26.20.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:17:50 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 29/35] ypbind-mt: Fix upstream version check
Date: Thu, 26 Nov 2026 20:17:09 -0800
Message-ID: <20261127041715.1776485-30-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127041715.1776485-1-khem.raj@oss.qualcomm.com>
References: <20261127041715.1776485-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 04:18:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133281
Content-Type: text/plain; charset="utf-8"

The GitHub release download directory is not a listing, so nothing was
found. Check the releases page for vX.Y.Z tags.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-networking/recipes-support/nis/ypbind-mt_2.7.2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-support/nis/ypbind-mt_2.7.2.bb b/meta-networking/recipes-support/nis/ypbind-mt_2.7.2.bb
index e29730a23f..7e101ce9b6 100644
--- a/meta-networking/recipes-support/nis/ypbind-mt_2.7.2.bb
+++ b/meta-networking/recipes-support/nis/ypbind-mt_2.7.2.bb
@@ -35,6 +35,9 @@ SRC_URI = "https://github.com/thkukuk/ypbind-mt/releases/download/v${PV}/${BPN}-
            "
 SRC_URI[sha256sum] = "064f2f185673c5493df83f6400b799f3a359de56118b6ba37c4327111f2fcd8b"
 
+UPSTREAM_CHECK_URI = "https://github.com/thkukuk/ypbind-mt/releases"
+UPSTREAM_CHECK_REGEX = "releases/tag/v(?P<pver>\d+(\.\d+)+)"
+
 inherit systemd update-rc.d
 
 SYSTEMD_SERVICE:${PN} = "ypbind.service"
