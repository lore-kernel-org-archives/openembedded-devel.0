Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48531.1795411858598517129
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2026 21:30:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=EaOhC0Sm;
 spf=pass (domain: gmail.com, ip: 74.125.82.177, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-38564b4b017so3109888eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Nov 2026 21:30:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795411858; x=1796016658; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tg7UCOPVQqmF44xbw2xGBYBVS85GsdT/jUjQ/4yKBTY=;
        b=EaOhC0SmNdZkMPRASXzvq61L854PkMthSwtgPlQNuCeeO1Q4UpRBmKUxTFQmtxBgdP
         8J4ePzATVe+CdqE7z5tUOxef8nhZhdxnYqB+y/F8AldP222pZTuby64iDDdzfMLaKOlg
         Wd+Re9SsZ6qzMVLbyIdbCGB/j1ncQlulBnr6bkyHzK9vbiGJCOdIb5SkfNF4WpLWLD76
         TKVA7ZqIykM6J2yKvqqFkExkMwM9hZHOihfMCUI+8C3lw78JYq8dMfuDSWWDEdZDkyAK
         a5bIkHRTHeGZHzKN2dKWSaSKGHzua3RkEj5tK0tm2uamdLQStjd+cvSXCi/1b8hFPaEf
         y/7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411858; x=1796016658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tg7UCOPVQqmF44xbw2xGBYBVS85GsdT/jUjQ/4yKBTY=;
        b=wCF9YBPOHkRphUFRDrJMcUjrHG7VXq4NfAEM6ApL0oLgkIjjxjW29nkw5TeMJq3ni8
         OC+UPkbn2hv7akgf5B71lu3x6MtqPUux/PMNQYc6evAabjZCj39bJUD1sFLwqjAknpIG
         /DgmmPiU/AiMKsS0N19hw4ZWR6czRHG7Cyl7bGBiA9Wt4N6lHuVVRlEz+pf9YAH/70XO
         nj6jRYDZghl3w+E0IR1qsPg31I3CRxoSs37HoFyirP9aNV9Hf+JekUb7txerJ5YOb1Yd
         2hoYfX7eIB2hiDrBrsPJBy+njv33YtUkcE45Guc7L8oRGF/elcPJr6y0HF645THnujZC
         NWpQ==
X-Gm-Message-State: APuU4Z93LRcW8v5bVVxKPYEVQbCBjCcfkqqcae7ksjTNFwiSKpEBLaCE
	p9D2hZtZRI0HpgNb2NT9HuSLpv5GzYO4OyXtmWPrZZr07epnDGtiOCMLL12NZb2Clas=
X-Gm-Gg: AZFdTZfE4gpxNePVVKjDTiAyfnThSJblqIIAQY83jZWt2gBY9VwpxDZN0lj491x6rKo
	0lhHPwJ+o4pR5eEn80Sv1PlTkv3TOrOPjPc2HUPzwYQPG3q2VHwOrf9bjx5ghZGyyGcSybhELjn
	s4UrYjOVT7EEJwJDPIBf4rWwYw1DqixExH0a7PD01DFGKVOarrzPCZ0U9AWV+tuRDCWzfW7nxSF
	JDiXCl/kJQEdGtfeK5OTGPB6Aja/XUOy16ADgokd+vDNT7RHcMTXDA1uSmZBvD47bop0VK+UkNz
	iVEvpkVC8OEmTGYw+urvThddltanX+xT567WmRTFoY1wK8jVNMfyhEfVatVE9Cam/0o5xc+XPE1
	n2n0JHUwM3lkKWBixyrqjsRdQDXTD23B8LQZ1SbczQlF/HR0hV40+LSEFw/9mf0lc5Som7nvOPT
	KT44iJrjRLVc/2wDWg1jgBfogqyGoywqY+pLpQUaZCiD10tL26k73WRTRqZhd+2XBXuq5AFotMZ
	aGPuUqkJmULuwVzw/TfIRCKQ6R88111uJ2cQY6dnU0VvXj0Yhj3Xs1XJ4CD40navPJPRur3OxOx
	rAJFOdQ4CB9q9w8nYJoFjCHN76N20SNex7t1dIL8wnyY1BDTkhvTclqfr7zPShaWs/ScsAjDUK9
	RP9UCcbe4jpWgWUzI5JnKwnpsA2nwRAKjPQGGVyuZb5gjg3e84tD5t4/fxfQvRRMFEwgYst6kyV
	Bt+f758F7FXt6AxFMkCbePw5SXAsK/rN+QV6m2RAQiR7AnOmzwWOngddt20V5dvnL+lU6l8zrH5
	ficaqAeobdJ67HIn3IH+uhtyY96S2DF7Bw9LbwzUPv3PdZJxJF7L34E+WzAuF75FrRvLIVyf3+H
	ceKS
X-Received: by 2002:a05:693c:408b:b0:377:82e:2d79 with SMTP id 5a478bee46e88-384b39896edmr13101964eec.9.1795411857863;
        Sun, 22 Nov 2026 21:30:57 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm36573136eec.26.2026.11.22.21.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:30:57 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 23/42] monit: upgrade 6.0.0 -> 6.1.0
Date: Sun, 22 Nov 2026 21:29:07 -0800
Message-ID: <20261123052953.3658549-51-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
References: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 05:31:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132838
Content-Type: text/plain; charset="utf-8"

- Incompatible: outgoing SSL connections now verify the remote
  certificate; the control file must be UTF-8; poll time is capped at
  3600s
- Per-test event types, so alerts flag only the failed test (space
  usage alert text changed)
- New link errors test; link up/down tests react only to state changes
- PID 1 container mode: shutdown timeout and ordered service stop
- Many fixes in the parser, HTTP server, protocol tests (MySQL, RADIUS,
  DNS, RDATE), timeouts, fd leaks and platform statistics

6.1.0 installs a bash completion file; inherit bash-completion to
package it.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-support/monit/{monit_6.0.0.bb => monit_6.1.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/monit/{monit_6.0.0.bb => monit_6.1.0.bb} (92%)

diff --git a/meta-oe/recipes-support/monit/monit_6.0.0.bb b/meta-oe/recipes-support/monit/monit_6.1.0.bb
similarity index 92%
rename from meta-oe/recipes-support/monit/monit_6.0.0.bb
rename to meta-oe/recipes-support/monit/monit_6.1.0.bb
index 5dcf1c83d6..36a277fc68 100644
--- a/meta-oe/recipes-support/monit/monit_6.0.0.bb
+++ b/meta-oe/recipes-support/monit/monit_6.1.0.bb
@@ -16,11 +16,11 @@ SRC_URI = " \
 	file://monitrc \
 "
 
-SRC_URI[sha256sum] = "ddacd2a8120aeb2351e4486ee04a17782b5004aee99f2041d829bc4dcf2a5b3b"
+SRC_URI[sha256sum] = "c28406dc922e64560095ec3ec99feb8eddd3f96e7b6eed22309a5865d1eab226"
 
 DEPENDS = "zlib bison-native libnsl2 flex-native openssl virtual/crypt"
 
-inherit autotools-brokensep systemd update-rc.d
+inherit autotools-brokensep bash-completion systemd update-rc.d
 # brokensep because | ../../monit-5.34.4/libmonit/src/util/Str.c:26:10: fatal error: Config.h: No such file or directory
 
 EXTRA_AUTORECONF += "-I config"
