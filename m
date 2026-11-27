Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11753.1795762843741454823
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 23:00:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=DYiPjHvf;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2f07a960666so54281365ad.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 23:00:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795762843; x=1796367643; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zgMmtCY/EBFHclIyUEMh2PjDVDF+yYfry37S5b/h6z0=;
        b=DYiPjHvfhlmXLn2TAyGOzUFZEtDGRYWFBxeX3KigFN+7vbt7CS6m8agU1nYoWYHkLL
         k7F+NjEleraKiwoirgMDsAYKq97Pd6AEcqEBIGNFH70Hj0dvTuJZRuuhG70A3I5lpb2Q
         5tfKOm+8avOCA/W4QIRJqet5+t+amVzpEaSx7c0QGU4RaIybjlbph37P5ObtZsK2J0AH
         7xuhWTQBPBRWT/yiauK3QiOs1eDMyy/4ZZy/RtT152cCDjuSJA+fMQLiMSOffJXiFnMl
         e/U+0EGQJT2dtNl1iHGqP37yjicNgLJIuqM0oeVqqlTg5O6Bd1ZW5SWXtV11xtpVGSXZ
         3zlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795762843; x=1796367643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zgMmtCY/EBFHclIyUEMh2PjDVDF+yYfry37S5b/h6z0=;
        b=UBnJVxe2wgvD1cyzUvRdDSvEOD8/S0cFeClGDcJJfIBDqZjBq0814dKjgGxRQsW3us
         mieE3/xD01t5uDg+zvz6/UeJjq750uEyFmmFO7Pt6C1yOH+dbcUal2EiruKrll7Avw2b
         8M5zlj20os5naWKuwRRAAHnq4E4q3v7DHp8VrxFdr7fLTYaTeP0Zd/0S2iamckCIIrs7
         KBtI20WmP5HIYi00LpD9M0M7Vwyr0wcmnmu+kuvgS9X+40DPScNbuIwoTMxz4AK3WQLB
         DKpB9E5GP/YTV+8PdF2liYUxTWRZe+QgDD+LjHqxLCav0VcbzrVl8vGhyt6qITIOrIgG
         aUiw==
X-Gm-Message-State: APuU4Z8PW2zjPFpMgf9ZNMaH0nzy1ldCeg3AaRkOd8tbaRzMnbcQqOf1
	hjjq6nSkfrGtTVKK83hYGd40xvW5sOHf/SDnntfNJcyttUQaB8RsCAUgyQ1Xl3n+
X-Gm-Gg: AZFdTZcBQ/QoPT2Kdu7o5OmTRlMtgNxNxgYTnSvvxaB8VSH8gUWjUsYK6H/BAxNJVgK
	2nj//Jtq0mflmgBD4fLMboRLj7rM2E489G4fKwy4IOYf/ZfKj/cWwW/ZrKkzuv3pELPQFZKBZTn
	KTzM8/E/TlpcylPNM2WiDLtzFyMVM23fdG6zlROtmEAlN/CLYW9QHjxeKGln9ZeV0h9VkHVIybm
	qmwA9Zaq7Qd9E5Ak97pJlJrmwjCk+mPMB4141z4N6jQVNyXYKVi6qUTAhrEuyj6zr1ZefCym2s9
	6R5wU2CPQOpAhJCJK63WGkHtchjLYNQvnLv1w4yKDHYzwLQAagCtnTqRl2/UCGMbkdDg6ucMLNs
	rflq8P9J3oqBa1ASMzHi7lTMikXnie6YNEdzqy3C6ZmU+Ma1NY9nKkw9m0IQ7HzqM9dO2WkBc7O
	tsHapPnpdSWP/6D4e7cIk/BzXnP2Nrhsxvz/SGunQIuQZYE5zJtV3yfIs5Ch3ORDUkuezQm8Jus
	VOOTstF/VmCLnY60zxV2cYjXTMLeKyc6fziNYxio6Ej3R43acEW0IMeyt0UnptIXEwM2An32fXw
	78Xb0hS03C7Us7nDLEwV1UuK1tfQP4Isl21HklxdHNHDjWWr0z6RjjnNQFpe6wXPbbywKrRWfiL
	FTD0lkAifoS6k3aLmycFqm10phf7Kr3DPp+v4bBK1ktA1t+8l/+ZrOJTOBP4rksn1lfZNqw1epc
	36xt7w7yyJh4iN52Lty5IevIJgDl7HsEc3a0RZTdJi2UcZAxCxTjKbCtKA5oAu3tRgqAFzf8g22
	+Wz5YGyas73Bgj5+7NJZ3M++he7HznS2iSJZx+xwaJy0HgvH+L1j7pcaNXJJHPbblW4LxxBkLLE
	OVph
X-Received: by 2002:a17:902:eccf:b0:2e9:77c0:c7ab with SMTP id d9443c01a7336-2f03f1277f8mr235439215ad.29.1795762842962;
        Thu, 26 Nov 2026 23:00:42 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f146b84sm113719395ad.71.2026.11.26.23.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:00:42 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 11/15] postfix: upgrade 3.11.7 -> 3.11.8
Date: Thu, 26 Nov 2026 23:00:34 -0800
Message-ID: <20261127070038.2221538-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127070038.2221538-1-khem.raj@oss.qualcomm.com>
References: <20261127070038.2221538-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 07:00:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133300
Content-Type: text/plain; charset="utf-8"

Bug and security fix release with a few behavior changes:
- The SMTP client enforces a 100 second limit on server IP address
  lookups per delivery request, and no longer lets an SMTP server
  exhaust memory with a stream of empty reply lines
- local(8) defers delivery of :include: files that the directory owner
  cannot read, preventing disclosure through bounce messages
- TLS protocol lists: ">= name" and "<= name" with a space are now
  accepted as ">=name" / "<=name", bare ">=" or "<=" are syntax errors
- Fix milter cleanup committing a queue file in an undefined state on
  a lost connection during "replace body", a milter macro list leak,
  and a panic on 1-character "match=" TLS fingerprints
- Fix corrupted mailbox From_ lines for envelope domains containing
  whitespace

The recipe needs no changes. All patches still apply without fuzz.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../postfix/{postfix_3.11.7.bb => postfix_3.11.8.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-daemons/postfix/{postfix_3.11.7.bb => postfix_3.11.8.bb} (99%)

diff --git a/meta-networking/recipes-daemons/postfix/postfix_3.11.7.bb b/meta-networking/recipes-daemons/postfix/postfix_3.11.8.bb
similarity index 99%
rename from meta-networking/recipes-daemons/postfix/postfix_3.11.7.bb
rename to meta-networking/recipes-daemons/postfix/postfix_3.11.8.bb
index 99a77dd6c3..c20051087a 100644
--- a/meta-networking/recipes-daemons/postfix/postfix_3.11.7.bb
+++ b/meta-networking/recipes-daemons/postfix/postfix_3.11.8.bb
@@ -29,7 +29,7 @@ SRC_URI = "http://ftp.porcupine.org/mirrors/postfix-release/official/postfix-${P
            file://0001-Fix-build-with-musl.patch \
            "
 
-SRC_URI[sha256sum] = "a2f3242345753448072177fae83c322a403c9263696996406201145dab8e8625"
+SRC_URI[sha256sum] = "244bca208c86f678ad0a72ff1f744ec8ef922ccf3310851f6c992ff44bb5b4ff"
 
 UPSTREAM_CHECK_URI = "https://www.postfix.org/announcements.html"
 UPSTREAM_CHECK_REGEX = "postfix-(?P<pver>\d+(\.\d+)+)"
