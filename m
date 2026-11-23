Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48506.1795411817215814905
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2026 21:30:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=KZWGWafA;
 spf=pass (domain: gmail.com, ip: 74.125.82.169, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3282db206d3so8805478eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Nov 2026 21:30:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795411817; x=1796016617; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N3skCQOH3f6amcb0itAcDhz20Er8Z80OO/KjI+TPDJ4=;
        b=KZWGWafA37NMdhHtry1ba97Ftf2J/sdU3ByZkL7vxteTBjuRQNi9T32ZcPDrkNH0wA
         ffgSV1E2gnuuZYvO5i8YT96G6/GpMoWLMEQbjqlsB1+5qA0wC4l4rt5uLoDzu6ciaMxm
         dmKTGolJbvy8+3Rlpmi7/IJFa2A8FrLtjsA6Km3eOkvex6gs9q6ip+qDgaF8COCc/WSN
         ORyqdJca9KADaeEtvrxqwxbRGHDcdfihAXL0bUxglSsWRE7fMA2BlL8bN6dqjeHbjxk3
         Ni8Zv9Nkp6HvTZrvntPyY0ypQMJIZIdfB7mQieUa5Ecz04uVKw6i67UvQQF38OHO72uy
         F3FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411817; x=1796016617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N3skCQOH3f6amcb0itAcDhz20Er8Z80OO/KjI+TPDJ4=;
        b=lGiuNxQsyTnlvw+ITnIndte+YIQrXl9Wr/8b7d4Mpq0wzNDvolT35vAnto6uqYRUKC
         vVQjMs4VYrx4+h9i677cm8rrz9EGx6f6WV5p8+Xhg2cqK/Msd7ZjdnmooYAIa+lUbTxK
         eXhWOraDAkef0dAl0Dhg+aBP1rnF1cH7fv//NLZRs2CYlMi0LEq6xbm0izVVildtKn9w
         FNPCeQGp2tDf3LxIXyYKfzyMBfrJTBiNa4Y8KsNAk3qK5+6wJ6pVfilJ46YtdUK19xNV
         6xF5GGl9jb+NMjQuH3bp6iKfbHdetzv+sTL7cUegggSlB88t7YsonxS293JOYbGJfBRG
         PSTQ==
X-Gm-Message-State: APuU4Z/WJ6qPgAdTFsOQLnYw8pjJ9q9N4fs3c6If/r6LQCIJcotA+wxf
	lEgz6cw8UPaMKfzrAILdAr0+qv9O4xR3+cSutC96Ua5Xc79CunUpXdYgGF5u/Ryt67U=
X-Gm-Gg: AZFdTZdmzjwg5kxsNQYgtpd4O/Ir3KV9ZaWLb40qpT5xWpdVusy/hXbYTV2MILKLbKB
	rElY0FLWsyQhT0Cr1+WGVZ/PCTEjYUZ0VpViIId5AtNC4G2mNmenITCYpkWbYbd05b9v9PAergP
	+O9XlDXeKT0MDlu203QFoLrai6/hVGh1MYgq4p85XoWDQpgn3T9lgqKDx4FaTq5kYdXXHWEifD0
	WauV/vS/1Hmxh/WuAGGbUiFAzhg1qe83VAKBcYSi/6rLVD7zCiU9UdI93Yz4IwV1w6ovg+514o4
	VyE38SWtorHhBuji1hqUkhwzVAqQAEFDG2msVwvdzMqclVe+IPxwEHQ0veW+gd//B/HZ/NqS9Wg
	bwMHeKIl8JmVTW/k8XPQp2LfNTYFg40HTY9AwE7RuXWgkOsAHi71KaRPZh9MGcsozXaR7reMG1w
	3WfBRw3Gksn4q5fmQm6+pph/X2j2XH1+GJfAqicoKkwEL00NI7OCGPLvTESRfRSXTqgPBnU1TEl
	c5V0JU+WRAZxPLIPQO336f72GmV7vOgzsQlYs28vbW+BtI4cbbNJP0TA1dHzQbq7ngZ2x4TKERN
	Exgl7V7YoWan9CeMF0+1ysy7+RXNo/JymV78E8H3lrNaX7jVZ2qjzsszug8NOg4GGhVccR83oel
	hhV9quDEcQ9ZQxAjXBaDooLcu75S8jYBi/wFyOQfhzPm/RLWMrylDBc7nf6deyuJPY8vaTnRsQA
	XcPZbGQxovLPyi6o4P5xpdNuPEEfAN23Jbhdp3S55MT4aIiBPldKLoKOaRSPjbyhLY2HCck1Upm
	q+d6qjSAMj4vSAyWqux+T3Wt9EXQ/kLO/vSf7YLJh4qzXmslFv1eh35SJHig8tsp2iAJgbHIw6e
	oQSh
X-Received: by 2002:a05:7300:b597:b0:386:9e36:df0a with SMTP id 5a478bee46e88-3869e36e011mr10030280eec.13.1795411816585;
        Sun, 22 Nov 2026 21:30:16 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm36573136eec.26.2026.11.22.21.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:30:16 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-multimedia][PATCH 5/6] ncmpc: upgrade 0.54 -> 0.55
Date: Sun, 22 Nov 2026 21:28:32 -0800
Message-ID: <20261123052953.3658549-16-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
References: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 05:30:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132803
Content-Type: text/plain; charset="utf-8"

- New page switcher, redesigned search page and new connections page
- Zeroconf support to find MPD on the local network
- Build option "iconv" renamed to "charset"
- Text input supports Ctrl-Left/Right/Delete; text_editor via $PATH
- Fixes for %grouping% tag, lyrics display, an endless loop on queue
  delete failure, and several crashes

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-multimedia/musicpd/{ncmpc_0.54.bb => ncmpc_0.55.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/musicpd/{ncmpc_0.54.bb => ncmpc_0.55.bb} (96%)

diff --git a/meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.54.bb b/meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.55.bb
similarity index 96%
rename from meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.54.bb
rename to meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.55.bb
index 81ded9db1b..82065a14da 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.54.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.55.bb
@@ -34,4 +34,4 @@ PACKAGECONFIG[outputs_screen] = "-Doutputs_screen=true,-Doutputs_screen=false"
 PACKAGECONFIG[chat_screen] = "-Dchat_screen=true,-Dchat_screen=false"
 
 SRC_URI = "git://github.com/MusicPlayerDaemon/ncmpc;branch=master;protocol=https"
-SRCREV = "55a7653d82eada7e6813dcb1e965969ceeb74dc2"
+SRCREV = "92fcda4b392364b6efc1c07b29f60d59ce9408f2"
