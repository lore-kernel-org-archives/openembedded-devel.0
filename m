Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48021.1795411829988095836
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2026 21:30:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=d8Cf1Ang;
 spf=pass (domain: gmail.com, ip: 74.125.82.178, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3869b68caecso3586103eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Nov 2026 21:30:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795411829; x=1796016629; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=voLQUShQ1e23eXqJ6EoLfIIMuJKxQqi+FWA0SNqP31I=;
        b=d8Cf1AngaF0gR4bnGj8P7ImJBCK3yvdyfwsDC3MDAYBFM4o8EuMyToYWqjyHM+JXwZ
         2njPXHLwoD7QO07SxKcKrqHsAoDRwC72/U41RAe45y7n/fzUCS4D8nwCbwzfEuFauKHw
         5D40sS0btvIjRiRgExLlpTvFFUPiyH2KShbU7Zh4wc7kVIal1RV5hwiimDOdQgJZvKgN
         o3EXnO5wU//kFZLvUoejRnyEj5YtOQB33gGOaraY0oQl0LdTN11QmnofHvzIxj/x+Cqm
         iUhkTns97pACvJeFltgQ7f3s0YSVXiou3op3FldbetsCY8f2q7/rgtaqXiLwAOah1uS4
         faOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411829; x=1796016629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=voLQUShQ1e23eXqJ6EoLfIIMuJKxQqi+FWA0SNqP31I=;
        b=FYg1nzfXN6Ot7AaLpZwAUEB8CQ2aDqC+ig24jSOmKUik8CSnhMdN2Fqq2O8Kr8rPb4
         xdNXmNvGgIfI553w5XizAMPldGs4kieKi4k/dp+FORc54Ypp55f4rxdPRwS/M+MGlZKy
         CeaE6DX27kdkBf3xLZqxUmoFBC025Hlr+X/dqBqG6kwZB6ojYOyKxr5Qm58ryR+LbNzy
         +1VMT9KjqSNaSgy9dbPBW/kDSQnbB0WRnmrC9cwhRw/IivDXBPPYqugx+l5CCjLvtU7e
         UyTTTNqcgZPQurXP8QC5ALKr2xIvDKhDKzr5JgOLfWBn1KwOpNziA+h7upgy+8JwKEQ6
         EbnA==
X-Gm-Message-State: APuU4Z+vEbg70ebxKFh9x0ebTBg2kHlh+pp4oIzBFDUqTBmLMkW1AiA8
	ErPsPfx3yZfzOo8TuZyAX1uj97Og0nMmfFwXyOg2XrLqG66MJ5FsWDhYvn6tchGR1aY=
X-Gm-Gg: AZFdTZdvq1203uvw/+hPUsu3tKP7aP/1Bg0EPd1cXkUkhx3Lwc4UFtIUbsBvoPTbubf
	z6ts3DGI6I23Shkr1p5gjjiJSxKBqLr2TRbPPEn9LJPsfAfQ7TiO70gkZ91rueOi4V5VEc66AIj
	fxHYhRZThytgqMbvGL+dB6k5U8IZr65L9lRJGj02wjBGIjOpaC4ZQWP3DTow4XWAqI8LZkwNd78
	QFa72Y/6M2G8FE/1pjdVpDcZR1I26xyzwpsKvolY55Sl26ErE6l1L4kKsfdBbVeUrtWfw3ppST9
	9F45UmYyOQgYU5Gk2PSj98GHfMut0flx/ukE+7Bd+dT281fbkpQVISf1FEIj+01ClWWqhLBlazu
	bhWKzvDjLgmB5goE3qqVBH9z941iGkQ1xXFDAstFoEy/Ek3Q7GoBRPqqRDqnJXpMfKMBm1Nl8mu
	7Pvvdq6qrz7MCJ5V1swGDKf4yEFelglXKMSqySjusoO2PLQy+gao1ouRQdN7HByJRllUZ0DEpGn
	QMPYbK2QNYH2BeVLX9s3sSCiDuHdZrq7U2zbi1iRlmCFrCgC3mTDL0lqIhiYduqgG+IsO7bLY2Z
	6men4SRynJ/M29ljwXCU2s+YFAPO7mskYPWDLbnUfegCeedAJ/wS/jb5PmUzyV10IeouHwdDJsf
	Bhdy6Oav6EX95T4N4msWDOfPz5V1mOnkXgu5Aq42xQHc6Iilv9/fjOz3TMip6pY0o9fM0znoUCu
	wevIegj4BxfQ+z7ujx/RFjKdyGZrhMAH73t27Pb3N6gsrpUFWojDrgnepy9/JvvAYhn8+oRoxID
	6req2L6pt2QgbaRP7grCxNvigimCxk6w7VLojHIZQXmrqmyvJeo6ZzY9lT74Cs3SpASP2dKyeXm
	yA3j
X-Received: by 2002:a05:693c:60d4:b0:37e:fac6:7ef1 with SMTP id 5a478bee46e88-38571120627mr11048760eec.39.1795411829363;
        Sun, 22 Nov 2026 21:30:29 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm36573136eec.26.2026.11.22.21.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:30:28 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 9/9] wireshark: upgrade 4.6.9 -> 4.6.10
Date: Sun, 22 Nov 2026 21:28:43 -0800
Message-ID: <20261123052953.3658549-27-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
References: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 05:30:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132814
Content-Type: text/plain; charset="utf-8"

Security fix release: fixes 39 vulnerabilities (wnpa-sec-2026-111 to
wnpa-sec-2026-149, CVE-2026-130434..CVE-2026-130469), mostly crashes,
infinite loops and memory leaks in many protocol dissectors (RTSE,
NBAP, Kafka, TLS, SDP, PROFINET, ...) and file parsers (ERF, Ascend,
Android Logcat, K12xx), plus iLBC/AMR codec crashes. Also fixes the
LoRaWAN decryption ZDI-CAN-32851 issue and assorted dissector bugs.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../wireshark/{wireshark_4.6.9.bb => wireshark_4.6.10.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_4.6.9.bb => wireshark_4.6.10.bb} (98%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_4.6.9.bb b/meta-networking/recipes-support/wireshark/wireshark_4.6.10.bb
similarity index 98%
rename from meta-networking/recipes-support/wireshark/wireshark_4.6.9.bb
rename to meta-networking/recipes-support/wireshark/wireshark_4.6.10.bb
index a639d69894..5dd610a45d 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_4.6.9.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_4.6.10.bb
@@ -31,7 +31,7 @@ SRC_URI:append:class-native = " file://0001-don-t-look-for-iconv.h-for-native-bu
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src/all-versions"
 
-SRC_URI[sha256sum] = "d062d416a1ab3a49975aafe3a671c882dde0562ccd71b078808ceb59d465fc0f"
+SRC_URI[sha256sum] = "268f41bdf8acee561b670217cf6ea74cf9e779477543e59f92f1cd00294a03dd"
 
 PE = "1"
 
