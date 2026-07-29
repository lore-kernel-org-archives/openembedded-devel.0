Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1BBCC54F55
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 02:44:48 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3039.1785293083017145681
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Jul 2026 19:44:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=NSZdFjcj;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cacf197759so7796985ad.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 19:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785293082; x=1785897882; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D3RXiU732Rg4r3cHmIIgtwLE1Jb7+T5DkhHhe8hCHqg=;
        b=NSZdFjcj2glFYi5NYij90uuwCvpq6QmRiclS0GZuoiSYN6yogq9q93fFXgpfAdESRg
         BqTiHCTsfgWXaXsJszQS+ksqT/PTe51SCZq3R4ZUHF/+xRKzJBhDZDCrobRZD3dofQzu
         0g+nJ2pB5+hIWEmzK8r0SiI2ctcsYE7uDYWobi9Kugl83ywh5cYc41EDMKxlhQxAdfQk
         wHJgf1urZF18Zf610N1fJzNntmdH0MCbtkWiHRCWRDSmP4BT7qOrOHTgJuptz3Y1jbTO
         IDzIBv46lylgFyF0gAPs4/J4Gbft57hyHWQDtRUg3rI3RDQ2zq6MOuJ7nATr2YWbMxca
         MjAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785293082; x=1785897882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D3RXiU732Rg4r3cHmIIgtwLE1Jb7+T5DkhHhe8hCHqg=;
        b=PqcfBlL7kq3betVmBghPSFIXtjJFDalo5P5I2b6o4bhNuCvYZfd0YZ25v2swJlTnSl
         7hL/12qdFxPjSrTIJwSaLFk8Tg6caxAZP8dG0hlh+Tqa1G/tF7beBQjx7nnXqoSqoVJU
         VdZSWzel3IyRkdEAXPOM/rFM6NB1c1JMw7dGj+Ki/MuU7nCY2Tll1F2vPRtJKJQVju3T
         lFKY5sThtJ3F/pubVFi2Zqf4pAniiAi77LNJtIgb5ygR6cjlbDWcGtNHj3tCODNYwGco
         OnB1oo3221+2vnSRKRkDAmUVp4GrdvfRNGJAMNPooAAsh3LHEh7v0DQkROuM9LeVi46O
         p+DA==
X-Gm-Message-State: AOJu0YyGqQqVpcd1PiM1JoijuSqyqM7RCV6qtH1tRfPLh/d4a8AncGeB
	uNlVgYIFCx5U2hpDsdp/ucIGSWpbv+Pd9gMLP89FEcrXFhlH2u4qK+pbKVoAg2Um
X-Gm-Gg: AR+sD10dyQqVWZ5DOnSaz/jUvWKDpRgT7cLCfCG8dYF52sJQm2TRTTx3OvpF6ny9SrF
	dKDOn1zbxDz0v+7VhjAXSye1WKk6KwWTunnvRLe/gChS1oJNXyEEjA7UcaZNJ1uv+nj38DrPy48
	vzqZQomKZaGH8Y7HUajtZvjJctiaMBXwOqFS0aErH0gtkwxD9pAdPluM3E/C3yu3/8NrgMAkGV1
	G7FGVztX0YRx15izw4W/9a1RuEDwu67CufWvkeFVbfaU83RmGw6ymsYoeubYfXszy2XyDeGhIuA
	vDdJiSmCmd6rhR8MGwRxgmV2qVkOm2IEQ+Biv9bdsY/Wdy4UhYuL3mQIJoAsi9lmAqvRDQBT328
	do4vvDk8CkVVd19g0Jq9YK1cClfC7J0AST12VD//lLfjzRVr6oZ1hQYqINkGG66g0XQy/f5owAY
	w3RiDKq71+h7k/ghPm0Ce6Mm0ehQ7glj4yfRbhN2hl+KzBFOyNW1VHoSXb/iQXvqd4TftVbfG5H
	ixqMXw3qqcGS11jvOItFdc/EjQb2uHhOJ6iCALDeNtN7A/Jpiu/qIkGZ9hrGZMteYo+4d/kwthC
	shB7ESWYyi/s14J+fFBQBQP19qThBRJywp9n1KtntHNwVn9E5PUwBYZWHqV+xX/PROiCPyYs4NL
	r9A==
X-Received: by 2002:a05:6a21:9089:b0:3b3:223f:d3fc with SMTP id adf61e73a8af0-3c8ba5d8984mr5708714637.45.1785293082380;
        Tue, 28 Jul 2026 19:44:42 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e72643a12sm5787402c88.5.2026.07.28.19.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 19:44:41 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 18/18] tmux: upgrade 3.6b -> 3.7
Date: Tue, 28 Jul 2026 19:44:20 -0700
Message-ID: <20260729024420.2328180-18-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260729024420.2328180-1-khem.raj@oss.qualcomm.com>
References: <20260729024420.2328180-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Jul 2026 02:44:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128534

Changes:
- Add floating panes: non-modal panes that sit above the tiled layout,
  created with the new new-pane command (bound to * by default). Early,
  currently limited release (move/resize via mouse only).
- Allow run-shell arguments after the shell command to be expanded as
  #{1}, #{2}, and so on.
- Add -g to kill-session to kill all sessions in a session group.
- Add line numbers in copy mode via the new copy-mode-line-numbers option
  (off/default/absolute/relative/hybrid) plus matching styles.
- Tighten read-only checks on attach-session, detach-client and
  switch-client; various control-mode and paste-detection fixes.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-extended/tmux/{tmux_3.6b.bb => tmux_3.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/tmux/{tmux_3.6b.bb => tmux_3.7.bb} (90%)

diff --git a/meta-oe/recipes-extended/tmux/tmux_3.6b.bb b/meta-oe/recipes-extended/tmux/tmux_3.7.bb
similarity index 90%
rename from meta-oe/recipes-extended/tmux/tmux_3.6b.bb
rename to meta-oe/recipes-extended/tmux/tmux_3.7.bb
index fe84600276..a81fc8592e 100644
--- a/meta-oe/recipes-extended/tmux/tmux_3.6b.bb
+++ b/meta-oe/recipes-extended/tmux/tmux_3.7.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://tmux.c;beginline=3;endline=17;md5=f256b76d52e7b4d02bf
 DEPENDS = "ncurses libevent bison-native"
 
 SRC_URI = "https://github.com/tmux/tmux/releases/download/${PV}/tmux-${PV}.tar.gz"
-SRC_URI[sha256sum] = "390759d25fdba016887ec982b808927e637070fd7d03a8021f8ef3102b9ae3c7"
+SRC_URI[sha256sum] = "2344f191501b8a73eb71dd6c5fd5dcf8c765f5066f34ab46f04b3013dc7bc1a5"
 
 UPSTREAM_CHECK_URI = "https://github.com/tmux/tmux/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+[a-z]?)"

