Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35869.1792987109328477871
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 Oct 2026 20:58:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=cz0ft0II;
 spf=pass (domain: gmail.com, ip: 74.125.82.174, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-35b2c599f43so469262eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 25 Oct 2026 20:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792987109; x=1793591909; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CDc5Y8zMFx3OcjsHdt4HSGR/86gJbhL46DyRCpJCHW4=;
        b=cz0ft0IIFUtDcpvvrewJF9u9SIUPtoY0nBE/Rg79nHRkaV1z6AZmtBbJy2SvfzXYEJ
         PNMZp44Po49CyV7QoHNkyNLtvXD1Y/2H6iSbWtP9WP/xZGDft5yiaaUEQ6Ig4bpeQRZn
         XnL2nQZAEdSYhC871nGBNgiUX2u1FLyq4W3UsmRcbh4CnskHPyHoJg3n8FjfcGK3Op5l
         ErFXVLatCnhq2CCIgIg0ed0mRJCZ7Tu/PTZOwRILXZa6Q56mhm5SoyqghHHybmSaSplY
         +oqgyU/MnmEk8Y8pDO/k1Wogc5IVNIwbNHCddU8t0xzDFwwy9QJIcUgGMNUvM5y33nGK
         GEBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792987109; x=1793591909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CDc5Y8zMFx3OcjsHdt4HSGR/86gJbhL46DyRCpJCHW4=;
        b=zePElZyV2l1rqayea5pbRjmsXr0WaZQ6X7raib0ymBcVVeX2mG/KnR/JF+md3gUYPx
         bC29pFtKscSjkBPrcnET7nAhYh3JZy/CmxSS9dgSiVizUFredi7W1h96J30prkg/SPvH
         YUXgwM0XVX7TA3s6WcuzhY0fsvIaf9ocUJ8x3fwN6JI8M4cm6QDmSP9nA+1KFNvcdnZa
         Tt8AaKRqD0ANGgSsjl8nBxmcIExsjPiPq3Kx5QxytQT8fP4EComzSCOXYosgy3VP3boC
         goAqYutcysLvRsh2Jv3lmsMmE1ckSEXMu6M1wCFyciHqqNxFD0dG9VOLy4suunJQb9WG
         /d8Q==
X-Gm-Message-State: AFq9FYJ/kQC5Ag/gbTTJlz6+UTw1W6/k1bSNuL7l9ip/N5BSWIsyxiSD
	NZTIZd0lVa6JTGB1ikoDAmhNmI8hj0elF1qx6HkPbK5uBW1UEzTHTqNKYTuhsMk2pKg=
X-Gm-Gg: AYBFou3VphvRcuijlh8PeQvgVzX553eqcUnPJcZqzs8nD/NmgpqHNSI8IHEVDe9MR5j
	5MIlCc0+qPsU/fu6ipagyy789iWx98TfvDIOYlebgbESdQqqDCE3h1WSQJkZ3L2DT29V6ttM/cT
	NFKNrzpWXl2RgkLZo298+trH0tIbfGO8ewbztq13HCHY2pM76mNF5Ailm4uGBsShAry47KcldSA
	7kGz65IPmCilwXpEDjGHlT38ndlHnbnXfT8vdwQNmpaAG89DM3Rzw1rB/r5afCsh3lT4zJ5Yw0a
	kQUX37RNq1CoB7Lb1ZHsTuOEgV2nzTQYTpInZXUkMTi1ezzY3IcAhgxeurVgIQKXEoYn1CdgYEF
	4KiIqLhrKDq20DNU2zmKSm59AWgzAEWmcs+6LYYSRjoY0r3k9Z3hDJshgPfkXXYzkIFL22NXAt7
	pcqRI4EAUpMogCrtnqE0dGXndEJTd6iOG4m1ikaZU3x0G6M7MIXyIQv30eeCOiG1WeG+ctn4BlA
	KlJ2msjtERgKs4JiNW/kN5FkHMzpouy20A0h2MQV3cycAfrIhcgw/X6BoCb105c2sAkTZnPLLWN
	M7ZXQhHcsIRpnzydg3tFYMPQpQk/IaRtsxlrkuiHsQr4ny4q9YMLi/owM3Sw66Y3te2dj5pM7uu
	ZxtToHRgWNyr4lQq0vNAkbfpK5/zHM451A5qvqYmKW1J0n5W/3fVy44f2/F34N609ELkmFAKMey
	N4fUy4TPVhc/a4AHQl26D6Ydr+raH0pk5meRexEnXJdg6XIduE6Vv3OP7NzCHktDidyXsRC8vDE
	Uk1s+2kj+0EiSKzIWjeEaeTEKJ2ogAvV9rb8HxSH4CPsAlXXamc
X-Received: by 2002:a05:7301:d816:20b0:369:f277:7f09 with SMTP id 5a478bee46e88-369f277b32cmr6872593eec.25.1792987108472;
        Sun, 25 Oct 2026 20:58:28 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369f44bd644sm13277417eec.15.2026.10.25.20.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 20:58:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 8/8] python3-engineio: Add missing runtime dependencies
Date: Sun, 25 Oct 2026 20:58:14 -0700
Message-ID: <20261026035814.55254-8-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261026035814.55254-1-khem.raj@oss.qualcomm.com>
References: <20261026035814.55254-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 26 Oct 2026 03:58:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131420
Content-Type: text/plain; charset="utf-8"

simple-websocket is the only hard dependency in pyproject.toml, and the
default threading async mode uses it for WebSocket connections. The
threading driver and the client also import queue (python3-threading),
and the client imports ssl (python3-io).

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-python/recipes-devtools/python/python3-engineio_4.14.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-engineio_4.14.0.bb b/meta-python/recipes-devtools/python/python3-engineio_4.14.0.bb
index cabee98d00..3811ca332c 100644
--- a/meta-python/recipes-devtools/python/python3-engineio_4.14.0.bb
+++ b/meta-python/recipes-devtools/python/python3-engineio_4.14.0.bb
@@ -15,6 +15,9 @@ RDEPENDS:${PN} += " \
 	python3-logging \
 	python3-compression \
 	python3-asyncio \
+	python3-io \
+	python3-simple-websocket \
+	python3-threading \
 "

 SRC_URI[sha256sum] = "eaa1e386baf9c2c7959eef7f9d9165c5ea910c5b392f5316e78d29ed073cb43d"
