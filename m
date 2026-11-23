Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48539.1795411873954581296
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2026 21:31:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=ZFdgLRPR;
 spf=pass (domain: gmail.com, ip: 74.125.82.174, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-385d8a00598so3934600eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Nov 2026 21:31:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795411873; x=1796016673; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vZwNmDQk9BwjGLblVbrZB7WVZwYAxxf2yng+85cal/s=;
        b=ZFdgLRPRXawSvg04iDc+FecZbbykeRR3nJZcoFcckALpvmIqJj4C+V9MfWrHTlJgUd
         1C3ocFWMPU5MXUrjS9AL91y67xfzDETdO/Dpt3b7pkYg7U0z0xSS8TbXSnnvNtkud5mC
         szOZAMeaVGetpXko2q+35Q11pkKsLmN1Lw6Fyo01c9qbsOr8so3AwmgvfjfTqXpUDA5C
         zEDOvUmVq3sLr0jYjyBTz+hwW2LFQvY3ute2j/JcqT4F3AUxzt68fSgYTeN+AVM3fYym
         nuMaH65+rME5zDPh6zjKcYZBbAr1AXlrdhobXv4C5fqIAGu+bhzEXBIKgR9y6m5GqqNi
         kABw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411873; x=1796016673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vZwNmDQk9BwjGLblVbrZB7WVZwYAxxf2yng+85cal/s=;
        b=vUMdGkHT8qswToH+6aIbBubpAuccdeyfJJ7BdGETLknrNEwvttjxUKzMcLNisMk7PS
         5kqrE2ck2wFgw0tHaq2Pa98zGc9JQWUrQkX4Om8PEmUSDnSjjoobPlPpkWQxlljIeRRj
         +Ag7M/AuGzHog67/N/IvFXsBdKKPoo/CbagoRU+Zq+NSdMJz2HTZbYPa5UoBmelG3LtV
         3Bfnc0HZeY/5u9D/ucCqe8haKLCgGqIdW1E22aHa7CxPF8+WvXJIYkvOlF4mE9pCZIgR
         A8lIEQDin05mHbXLuL4MuzRzuL+EetypwlC8KxXZHB3y5o+IR0tysgMXowP4O4YHSofa
         Jh5g==
X-Gm-Message-State: APuU4Z80yV+HlNT5B7ixBy6+UEiklAA6dO/Qj7fC5RUTSSvMfCKbHVWm
	sSRen3dQvEHUakwRoANHLd2lq0pNvkiIfW+85r5V3g6Ejr6YnkoZqszchR/SOBpSTBY=
X-Gm-Gg: AZFdTZcmu1Z2YGLOxDPeHABkYIBoluRNhvE1wuZVjl4sSGY9zcRGUIS9QPJ20H0htFx
	okIYckTxOfgJxi5UC/EtqdqVR/JvpyJYb6V23uv1reqrGTW808yzTPBmM7y1dk/fwW4kKKCB4Eu
	i683MuEjeJUi9iivtWeskX0snw9Um3rXkKYq+w0B0Vc4btNJxj+SIie9UMXxPyE2HwQsszkBvQH
	Vy7/40JbqVYR5zh1n5GpBOX7DpFIdCNrqDgwv/5BaXm+eob1fSnRIhYVs806NDXS0sokoAk2WWr
	CFZvLO/cRZdmC5nKJo6dGz6Fz8lTvAUSkqPVDgJRAV7kVtu5MyjCuLHZiQIHDRw405ZZ/m2LmCw
	3fbaGY2bmofd0lp2WSqItvCRGRSpvBu17PbE1752iU6g/E5JNde1oYZvJWkOxHjJku+DEsmEX9g
	L4wbUaxRK1sOuglpVzZvSIfjOOxXY9+A8bXDjaNypmQThAZyahvgQqmq70r5RsUjp5VeWK1g1OM
	dUF6cliyCvDAzZclNUDBsIvLl9HQaN6TXUyGQvHkkUIdwcHxpwY8gJaHqttzFe547XibvgbKMxW
	nWjN2ah5bnvDY9PTnNgy9z1cOdXdLt1iF5CYZmKCGEmL2uJrIwQSiNAoBi2QJrIM66v0RW4E9F6
	fCG/3uJGwCbdLAoPLRfJtW6r04LMlL/S8Xclvw+hUFVK9XbVxUh57KwQlQItB6lDCFdQtPEHqrb
	xL9ct+QFZhdPfryoHZ4y7xMco/9tLg90Yr5uENzpQ3w7qfYxYHEa4520TKxuHipFsFYj74qwODO
	tbHaweN/Kv0z6UnwvkqxlhgTcxiaxb4z7lGpzLQ7dhTcOGpTR9a2xaH0EXN+B/Det/KMZeKVLlR
	YGZT1Q==
X-Received: by 2002:a05:7301:1402:b0:36c:a44c:1763 with SMTP id 5a478bee46e88-38570843400mr11278138eec.32.1795411873211;
        Sun, 22 Nov 2026 21:31:13 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm36573136eec.26.2026.11.22.21.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:31:12 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 35/42] tmux: upgrade 3.7 -> 3.8
Date: Sun, 22 Nov 2026 21:29:19 -0800
Message-ID: <20261123052953.3658549-63-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
References: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 05:31:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132850
Content-Type: text/plain; charset="utf-8"

- Many floating pane improvements, including modal panes, and
  move/resize/split/break/join/swap support
- Layout strings now use a JSON subset format (old format accepted)
- Built-in light and dark themes and theme colour names
- Hooks reworked as events, with monitor hooks and new hooks
- New switch-mode, auto-hiding scrollbars, clear-on-attach option
- Behaviour changes: mouse option now on by default, display-panes is
  a mode (-b removed); many crash, redraw and control mode fixes

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-extended/tmux/{tmux_3.7.bb => tmux_3.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/tmux/{tmux_3.7.bb => tmux_3.8.bb} (90%)

diff --git a/meta-oe/recipes-extended/tmux/tmux_3.7.bb b/meta-oe/recipes-extended/tmux/tmux_3.8.bb
similarity index 90%
rename from meta-oe/recipes-extended/tmux/tmux_3.7.bb
rename to meta-oe/recipes-extended/tmux/tmux_3.8.bb
index a81fc8592e..2f567e6a47 100644
--- a/meta-oe/recipes-extended/tmux/tmux_3.7.bb
+++ b/meta-oe/recipes-extended/tmux/tmux_3.8.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://tmux.c;beginline=3;endline=17;md5=f256b76d52e7b4d02bf
 DEPENDS = "ncurses libevent bison-native"
 
 SRC_URI = "https://github.com/tmux/tmux/releases/download/${PV}/tmux-${PV}.tar.gz"
-SRC_URI[sha256sum] = "2344f191501b8a73eb71dd6c5fd5dcf8c765f5066f34ab46f04b3013dc7bc1a5"
+SRC_URI[sha256sum] = "e79c699c7e949dccd0a4a125e17b8d1261e311b16979dbc8eb34542f3966d82e"
 
 UPSTREAM_CHECK_URI = "https://github.com/tmux/tmux/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+[a-z]?)"
