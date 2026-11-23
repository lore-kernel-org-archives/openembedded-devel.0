Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48525.1795411850427162207
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2026 21:30:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=r3neNUNV;
 spf=pass (domain: gmail.com, ip: 74.125.82.179, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-38692f62b22so1250599eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Nov 2026 21:30:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795411850; x=1796016650; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nYcAdyMwPHUSueXuccF9ZMjJg/2WqtIa0VMfEYY3YWg=;
        b=r3neNUNVkf65EABJ7Sln+dMuvx8El9MPIm+x32g43zNGc47qu6Bnn3TDjs44lbBp3k
         zdMMWu8b949vMlY+zeuUT3GS8xHoChBRl7WAxj9s5D2V12D0msVHXs+wORxIgMa9tT8A
         tjBpUxMQkWxC6wAfHVfelEMlopVkKnx/VNc/KzPjyfpYnxjGUnOJdsFTQr/9JOwYaQ8u
         CIKnoJb0rS17+lM9kSCV40hdvoe6HBp4PoK1GJ4ycC+9CrdcVaOGxOd9O0fUTiGXrQGv
         mc1gaHZdQMtijzQNrh+XG38Bp0MrPUOSDntO45uiOhvhonbvGbYRRSpIg9HcI6Gelfmy
         ViTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411850; x=1796016650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nYcAdyMwPHUSueXuccF9ZMjJg/2WqtIa0VMfEYY3YWg=;
        b=N3fXV0BRnjXODH660Lw5gDoLZna2k23VRhERRoZfZFpRE14T1IW3lqGFQZ6Ntwd7Pp
         4ye5T7O/bFvC0wi+Sv8xy+rE5eJSmTzl2t4pxk5EV03WTcgqTdWfdehaOIihn8cSZEwW
         hDEappSjSxZe437QTPNyeXpqQPQWcm8a6VJ48hQTOU0w6NGzzjMsvy01c1nQJAH9+OGT
         KAPktH68oVYY8+ASWL6IkaTMmO7u14iIn56u3z6Mrk9vFx2XA3UGxrsP/cmeIb4AkBZe
         hIiSjlGiIjOPvQg3omhw45NFFq/IjTrqnN3h3cwx9VoustXahzMFgc8hY68MJYQg69in
         wCEQ==
X-Gm-Message-State: APuU4Z/7XIW2yocGS0/8pLjOamVV7X7z5TDS/esDJMXkeW0uFP3FxCLP
	cpCan87iEWM7u4ZdhGsKqU6k/vahGmHUqAjDRwHQNW+W1jzWPFp0ZEF2G8qo3wEKEx4=
X-Gm-Gg: AZFdTZdC4N9LCDhtRyyJ8C2OTGATY1bzLuj1MBzBH9AXJWJBsQpxZsTfKEOzTDXqXGf
	CUfTK9sMcnbJwvaUBhxzDNEFPEPJelTxUKCFdYx1RJovtLoeeGGgZE3osEcGn1tkTeHLv/Qafjm
	rdSsSmjknM/UWElt2wa0FZJY85gX89chQx2GFrSC23w0tJl4UtzDX5bG3AmEnKQ/AOUP37p19NJ
	U2UTij9X4TxtErCxDhlg4VtZfvTsXONao85IFfIqE4FU+faIlOGMK5ZwXzTHOhVOQpF3OWFWKqk
	0PKQawF/Bxv/W1bMqtCgXaSZilDz3e75i3HTtpC5oistrH7RoUfFgKGPrBCeIMmSwnqbrZT9d0W
	gLQcd+/J+M5v1G5Hiel5clpJdIxHZ8P0E5qgh3gMRL4sLq+LQHEe6ottz7/Xmv7sADVIg7JIGC3
	iv/Vw1cKNGhF6YydA/CvtvdFmBa50ArNxh/eLBuiY/F/2I7l/RBSk/7QgXcx3yddXXKBZfgIhgc
	soBDXXOUidaLtU+1NvZVOL/13SR7nI/Xpat7rtaKPQyi5fbeROZd21r5s9Z1n969ko0efZCYjXo
	O7+/931vAhGDjRX244pKT7lrymVpOYMWouJtJLLZcBHS3vObju87TVbFpVg55pBC1K3Fq09dpIV
	BM8fDDgwUhL/hrCy3kbGu9/le/TYQ3pEYFrSa/FdByYMPstXggyeOtoVfjWi64e/mkzsl08aPTZ
	QjcrKo2Ed1vg/irO4nApOBnA35S+TZ4J9JHPvbqfml99x8UEs5kRzY1aK1wgiqTeShsjv94x79I
	Bv0yMEUdtnc+fF2OD1g6USTSIltqxLZW/i+aLeuVXSDwtdltyJSANYac7rzj81omJUVl1v/4dyo
	g4Fe7PCPTpmV3yMJTrMSxS44eA==
X-Received: by 2002:a05:693c:8957:10b0:386:b089:3520 with SMTP id 5a478bee46e88-386b0893ad4mr2044100eec.19.1795411849686;
        Sun, 22 Nov 2026 21:30:49 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm36573136eec.26.2026.11.22.21.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:30:49 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 16/42] imapfilter: upgrade 2.8.6 -> 2.8.7
Date: Sun, 22 Nov 2026 21:29:00 -0800
Message-ID: <20261123052953.3658549-44-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
References: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 05:31:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132831
Content-Type: text/plain; charset="utf-8"

- Fix buffer overflows and out-of-bounds reads when parsing malicious
  or malformed server responses
- Better handling of control characters in mailbox names in UTF-7
  and UTF-8 modes, plus other UTF-7/UTF-8 conversion fixes
- Fix truncation of long commands, NIL personal namespace handling
  and several memory leaks

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../imapfilter/{imapfilter_2.8.6.bb => imapfilter_2.8.7.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/imapfilter/{imapfilter_2.8.6.bb => imapfilter_2.8.7.bb} (91%)

diff --git a/meta-oe/recipes-support/imapfilter/imapfilter_2.8.6.bb b/meta-oe/recipes-support/imapfilter/imapfilter_2.8.7.bb
similarity index 91%
rename from meta-oe/recipes-support/imapfilter/imapfilter_2.8.6.bb
rename to meta-oe/recipes-support/imapfilter/imapfilter_2.8.7.bb
index 6485316a23..2f533474c2 100644
--- a/meta-oe/recipes-support/imapfilter/imapfilter_2.8.6.bb
+++ b/meta-oe/recipes-support/imapfilter/imapfilter_2.8.7.bb
@@ -2,7 +2,7 @@ SUMMARY = "IMAPFilter is a mail filtering utility that processes mailboxes based
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c9e8d74e78283c6319317d3cb15eded4"
 
-SRCREV = "e9a00548a6d56030b99ffde2985c4af32cb8aff7"
+SRCREV = "89be8b401fe41222d05fd8899a5103869a51e713"
 SRC_URI = "git://github.com/lefcha/imapfilter;protocol=https;branch=master;tag=v${PV} \
            file://ldflags.patch \
 "
