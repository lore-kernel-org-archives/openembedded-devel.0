Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A322CA9ED3
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 00:10:33 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3504.1791763824814094086
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Oct 2026 17:10:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=JNklg1wS;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3a0aaa0fd13so949489a91.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 11 Oct 2026 17:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791763824; x=1792368624; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oB7tE+PbDjYkzFxeiwzFxCxaGcxBXKY4yXEBtK1GdQM=;
        b=JNklg1wSjeMcuU1NzxGtuBv80Q8PJOLGkelbEzry5tOj4VfUbGsq1DTIXV9rd1kY+E
         J+t2fjzQqnPUFmf2SwiMxoNUtRreVNnzfUpStP3kfy2iGEyMNFDDiqCQupLVutQEQ++c
         VLg4pTpluiRnVnET6nplJ9Dc5nhZTJgrJwdcxBay6+liE9R0u2GqFZQ1ALb9ooCq4g6h
         NjrtrKyirHYumuk3WMlcGwTNAEKlTZ8nWgwD9V1MX+H6kaL0fL+ar8JYGle4FgARJWPX
         FhrXGlIIpFS4luSUIdTGfv2D0OyfQjtaWJXro3ihB9osU5RVe656F1BvLr6gHBmCUItZ
         XBqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791763824; x=1792368624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oB7tE+PbDjYkzFxeiwzFxCxaGcxBXKY4yXEBtK1GdQM=;
        b=029o8jCcWRTUXn7o2jCFk+JGsN7t9KipHKUJQIVnOfy2+avVIehruBERYw/UCldiPE
         zjHmk2V/bBunsF0Fsnp0uTkLbWfQGs4NkOg4awum4XED78CEvmS5h9o9CRANyobYB/1/
         I+jyl1RVNF9Jkot5jtOj4WAN1H0U1OcLX7mHABzHg2rcq+XfsE1aYQKMSQX945Rpuju/
         kblIWqwL+9lF1HoiNuWkIho6gvDptNWuDOd0SWMXk/ijc/xiBKxbjUZCUrwOLW47yHu4
         VvvggPPLZeiqQHhJtKABaJ7rnsdrLYpsqVZKyLLX1CWAbS9G6ZBCjAY9X/yO3hYHVS3Y
         j8fg==
X-Gm-Message-State: AFq9FYJp+S9X2PtiWxrIjgodV9UoS5OYEU6p3WsOO81u9ji093SA5TWU
	m0NYuRDQat1Jdu4kg0PDqGueq0RtjrIs2dlQJrLx20eoUHmj32oi4fzClBf2RAEnNCg=
X-Gm-Gg: AYBFou169TnMkkOI/0da4E6ulKH6Fymuji/WteKv6zJC8/GQz2Qmd8SBW9yPDkTzxpP
	lMoQ57IvGladiK0kskngLM+DR44j4kyZyZfnbRmq5TP8BsRCZw46s8kNpvEXPYbokle9WB3ky4s
	em3RkSef+8700Cc73RAXBrEu8q7OUtQ3GuxGc920hdc+Jw//ZTZBAXXKeD4A3rzeARVqgAHaW0y
	9j4cqqUQsxTtru2n+1l/VJEIhNgsOVGNrH2eieet4xD1vSiyrgddfDHnpe4O3gumg4EQins2w3A
	B8e23iDUjfR8/bEogi0InvD6++3+bAeSWwzViTPawjbE5bGlIC1gYnu8CCzZ76tGXZ5JbiRQnDn
	vx31agDlWcSshX/9Pb2FFIMJHl1iNcnZc0XY6Qfmj9sRAFe1tL6iXwN/7R2hxSqPh//AQ6OOoRh
	XD1H+opLftCwi7QKHbUvTgGAar0e+kZ1mL2rDzyh2xRLPaY7DBJhHXFr3f25OWmHriEvdFS8CFu
	A6jZK97OMEwS/ZZmQMKcW9pJF6vc0+mPlnHUzY=
X-Received: by 2002:a17:90a:4ce3:b0:3ab:a188:b8b7 with SMTP id 98e67ed59e1d1-3aba188beb4mr1942678a91.22.1791763824077;
        Sun, 11 Oct 2026 17:10:24 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab3966dc7dsm7850379a91.2.2026.10.11.17.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 17:10:23 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Subject: [oe][meta-oe][PATCH 4/28] eject: ignore CVE-2026-28065
Date: Mon, 12 Oct 2026 13:09:42 +1300
Message-ID: <20261012001007.2541673-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012001007.2541673-1-ankur.tyagi85@gmail.com>
References: <20261012001007.2541673-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 00:10:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130729

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-28065

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit e6d111c16938dab4a377826147bfc86b72bca8a1)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-support/eject/eject_2.1.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/eject/eject_2.1.5.bb b/meta-oe/recipes-support/eject/eject_2.1.5.bb
index aa0e86db12d..90630ff791b 100644
--- a/meta-oe/recipes-support/eject/eject_2.1.5.bb
+++ b/meta-oe/recipes-support/eject/eject_2.1.5.bb
@@ -34,3 +34,5 @@ ALTERNATIVE_PRIORITY[eject] = "100"
 
 ALTERNATIVE:${PN}-doc = "eject.1"
 ALTERNATIVE_LINK_NAME[eject.1] = "${mandir}/man1/eject.1"
+
+CVE_STATUS[CVE-2026-28065] = "cpe-incorrect: this CVE is for WordPress plugin or theme"

