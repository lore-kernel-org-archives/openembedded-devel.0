Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10681.1794762016494008420
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Nov 2026 09:00:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=U5Fa+rpZ;
 spf=pass (domain: gmail.com, ip: 74.125.82.52, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1a8cc11ac42so2349728c88.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 09:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794762016; x=1795366816; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KEtQMAkbcy1h5o4MDUkXpva23nMxtGBPTg7I3mzm34Q=;
        b=U5Fa+rpZ2yTsRQu/htfUjfSXp+70mKcAB3sBEAzgBKu0Qkvf+F5+mIzqSVo1rl304V
         OroL90ssG92nmSqlJksi2/8EHNFF8xYJ+fGbAwKhmJ1mwGyPbc35jbJr3UHt4KEWPYBl
         7D2EWeRqG+QqbI1I8vTCO56udaNA7T0xxs/8RybQNxTUl/8+sIV2FYufrgbzvHfDbrlx
         XmeAWaX+aqaeIQ4mcaZw3YzouGCS4NZQ3FaP0pdsJCCTUn65zvTXtN3bFcK6kR1g8QSw
         +u4v/XrpRK5bPeiakaZ0REI1ZfEvJJpdCVCQh0RnbVj6nvNAWB+I3o3J9Nk1rb7rlnq4
         R5dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794762016; x=1795366816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KEtQMAkbcy1h5o4MDUkXpva23nMxtGBPTg7I3mzm34Q=;
        b=IRbF0QCSx+4NX9LG2xiqqOR+r5aHE1PWOMJtzNZsy7qVE+EAPiiuwAWGS93ZCyxfMt
         eNBjujcE5/cq9RAOPRrVY8drTISv+ERQ79BttTC/0JWLVpf0RRu5aqGMPoPbfRjGjLXE
         dfmCwvfJwdyMQhmqjkkxuG+DucpSz+6DQA0voZ1VEcyhjph2R1khfPb9D4h94U0dKyhb
         COU4Zw4tg+f5yEMXJTC4d+aIl3vnUspvNsTR6Qcocj6dWsB9YLdhqayHz+Hs8BI59qT/
         IT7NDN7sGRWREBwxEClCY6En+ITk3P8Uh3ECeqYoq6bzHmVSsSwqnKx6qPfBUH9NBWtc
         wV9A==
X-Gm-Message-State: APuU4Z8l3KoEMbxIz+xcdTvsdKi1SjcjOwG0J3hCDRni/BhXrD2wfBMW
	WhQnEkJ2Ge2XAla30T8+AOW/AdObdn9TbniRAVjIHbjIeAbYvu1h47Ng6T4s/EMQ
X-Gm-Gg: AYBFou3JfCiY2nQBUjHmSzK+orDNJP1ElSu+4lm7IW2zSejAFED5AsB5J2HKYmDR480
	+ZHV1GbeRee7kGGQ9BFJZmn91QuF4cVZFRwL9bQPcfPhWDKDfRTJ+vEhMdhjsXyJBtRijiUtlZU
	fOl9x5mXZSHgHtvEP9n6c/BK+XrpV+mdqX/YIYA+3cAgIlNoKMMEXk/osjmEXDJlJklQu5km7iE
	OyhXBhlOVm0bxLRRexAQ6qoxg7FFJwb45b6wE4qrYXns5akUcmnJSCZ0F7+i2lR415d50ckUanJ
	eMj3EXQ+AcSj6eK7GtXDw8j3GLD4qwlU18pSrpuSBgYZ6okLqgbXRuqCHHe3hjadeK84gxzOpy7
	Fr+BpjnR8xdUVRMATICQhsPtnGWAAHqP9vHL1VqYL5Cag/CP6hz3qxX1EVsmxp7jDvJ9LMcoCaW
	CqJ5GqU0O24hJhjzZMeyAGSPXQcTDI4b0ZeZNGqT6Q9Qz4mCzwQXNqTqt7WBGlF2NM5033Ig8+P
	8dVKJVAi1RuoFSL37Xp5FUAMUoPdZghY2lOM6G0sCbUSXKgKNLw8upwKM2xe2r2kVh/JuJ/Yz0L
	2DDkMczswcLiEWJPk+2+O0OiEPm2qiOzSHxjpDe+/rXQi6Cy+7181parfiQ3O64jndVzUKiyXb8
	75QEVh9MEUelxUogJd0gT1AfkRb8Zlh11LOCWw5Afm4knsymV8f5bTqLlkrJXIjKIBorTWXU1c4
	R04o+Sd8JkY3fROhJg7QRjlPgWAkbbNV1qlTc1Uc0RXObMQnOAQ3eq7lFE+PA3jIQUoEU7RWbew
	zqrS67qiGn/5nvK3JP2j/hVth8VT6p6y3fHJ0tS6rTSGYqNS8qFH/LS72o9pg8xcjbL+cRyNDfn
	8x7k
X-Received: by 2002:a05:701b:4508:20b0:163:c5eb:d42f with SMTP id a92af1059eb24-1b503060401mr8856481c88.5.1794762015612;
        Sun, 15 Nov 2026 09:00:15 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm29442397c88.5.2026.11.15.09.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 09:00:14 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-multimedia][PATCH 11/15] xdg-desktop-portal-wlr: upgrade 0.8.4 -> 0.9.0
Date: Sun, 15 Nov 2026 08:59:50 -0800
Message-ID: <20261115165955.3485789-11-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115165955.3485789-1-khem.raj@oss.qualcomm.com>
References: <20261115165955.3485789-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 17:00:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132377
Content-Type: text/plain; charset="utf-8"

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...ktop-portal-wlr_0.8.4.bb => xdg-desktop-portal-wlr_0.9.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-support/xdg-desktop-portal-wlr/{xdg-desktop-portal-wlr_0.8.4.bb => xdg-desktop-portal-wlr_0.9.0.bb} (94%)

diff --git a/meta-multimedia/recipes-support/xdg-desktop-portal-wlr/xdg-desktop-portal-wlr_0.8.4.bb b/meta-multimedia/recipes-support/xdg-desktop-portal-wlr/xdg-desktop-portal-wlr_0.9.0.bb
similarity index 94%
rename from meta-multimedia/recipes-support/xdg-desktop-portal-wlr/xdg-desktop-portal-wlr_0.8.4.bb
rename to meta-multimedia/recipes-support/xdg-desktop-portal-wlr/xdg-desktop-portal-wlr_0.9.0.bb
index f150fabc58..20f0b5b9cb 100644
--- a/meta-multimedia/recipes-support/xdg-desktop-portal-wlr/xdg-desktop-portal-wlr_0.8.4.bb
+++ b/meta-multimedia/recipes-support/xdg-desktop-portal-wlr/xdg-desktop-portal-wlr_0.9.0.bb
@@ -18,7 +18,7 @@ inherit meson pkgconfig features_check manpages
 REQUIRED_DISTRO_FEATURES = "opengl wayland"

 SRC_URI = "git://github.com/emersion/xdg-desktop-portal-wlr.git;protocol=https;nobranch=1;tag=v${PV}"
-SRCREV = "34153094662acd713241ca6cbbb20003ef67da5f"
+SRCREV = "8388b8a6214470462146840e92909aff5983eeac"

 PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', 'basu', d)}"

