Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F163BC5DF72
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 22:46:49 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24514.1786747601733573780
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 15:46:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=FtZ49WnD;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38759bcd877so1997644a91.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 15:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786747601; x=1787352401; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IHHyhO1GLVLmdSfWZnwOsbEIVX6sa6zuikri2VPHJDs=;
        b=FtZ49WnDu47yi79CVcpgKi+XEs+RAZxR4GOL0ybsNNMv9MNas+vvCM1350aTvsI5yq
         RvRqTHyml5aslOr+xErorXw1zDBqUd9eGXBwQpZEZ+rVrNQx8WpOiAqFMy9c0nIaqdIe
         LOYQGiFYqQRFhxp9h6tp5njSct6oR+pzFlcdqOM5gESOkOHQ/T5WqlLuNnQcFA+S0w/E
         Knrr5xoCrUOPqEba4QD/97jxZVs9DDXWf+U7/5GrFwaoXB39V0jgu5CF4drXlA+/u/qs
         I2v1mig8W1b2oJDJl9btrR7ZBpnBG0Y8Z0eM8GEFPMaS73uXMMq3lWvZ8hlgPaVs4krS
         hu9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786747601; x=1787352401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IHHyhO1GLVLmdSfWZnwOsbEIVX6sa6zuikri2VPHJDs=;
        b=fjdWmvfslvq7ruYYuJlZLuI66+e3GN4nXUfonfRJcfN7olYMnwc6i355cPSyINctD2
         vgp082fVV3NEY5bbEQUUvdVhaH6UaO2FlbebYzpbSK22D8M8Wy9dSp05GciO6n51xy/8
         4KeZf9M67Oq7C76rg9GpzxFGuC1wGJLlJzfs0IN4fRHThCOD8skjfO3WsbSbth25joZ/
         SlNZH7s1Tpy5sPkRn/9eEciGeNd7Wlf3OpvnUyCy/4jYEM93BbVZgIufGcuLSOLk8lQK
         jqDu/QzsoYR8FQmPDv8du14SJ0Z6cNBLM+S4nRNIA75rWy1Q5I+iz5qwxzBNzEV31FUQ
         uHng==
X-Gm-Message-State: AOJu0YyjTZpmhp2SGVQInQGTjdi4gEjx35TRHwx4lWmt0OEEp4i2rete
	MONDIvcrxrgdBxi9fxk7e1TsnZuYlWNt2XzcI8NBPp4YIEATa/bw6iPnAaizhnL/
X-Gm-Gg: AR+sD12vAAnwOKuYiSScqQsEvkoefHZFvflVCk3u80lmWl/ewCTvMC35OP2ys8SQV0j
	P63QbwgzhSXJ/0jOq+dO67et5mi/84mYlQpJ9yQxkQUe6ZskVYsbQMDF0Z2xp7WYNDwoymGk88r
	5kA/2Uck0bV3v/H7+H9XP/8XtzRpovNf0wBvfowwzndfVdU68uCOwYPhk1eo9Qg/v6yLWPp32SH
	HL8oQ2j5OM6ntBvnTcr9otWOiU7RHum6iNTgsUwq7QyjnYl/zByE/8Jsah8HjuhtmM6TZ/Pdew4
	WxzYrRl5pHyPf4ZRtD77g/Jactar7dldjvQJZzBuI3T8qDpDcCfwHXLr6AjJlCohVPM1qko/0Or
	55ky9e/3FoYGQJxJwAYDI3/tsLpYoaR0LIw47xASHQA6zVjebFK9LdcF+U7P09wf0/qJfqd3Vh+
	ZN7PVSFqehXNVPptCYkvJq0Lu8uME3KIvlik3ANTfXjxdQdujiv8TQCNzifhlJDCfyhbRC4AMTx
	QYDFpNOBQ9VVBr3kn15DcYp6aC8Rxk+TAdFTXR02PDcJYBp8t5vqWD5Tix9eE4oy/A7/ffNZRi4
	cssPHo/t9I/i4D53krkD1hW3EHyLS97V+qybDPAVRjj9jZLxqO2GyaV0DmYpDdS4gCoSwlC7MDy
	oZoyUi10ADTxyKBBcFqvL+0RJt0KtLfCTOo4ppU0OdKDgww==
X-Received: by 2002:a17:90b:5450:b0:38d:c74d:29c5 with SMTP id 98e67ed59e1d1-3933ed23db1mr10068294a91.19.1786747600976;
        Fri, 14 Aug 2026 15:46:40 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm14541588c88.2.2026.08.14.15.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 15:46:40 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 052/109] pcapplusplus: upgrade 25.05 -> 26.07
Date: Fri, 14 Aug 2026 15:44:38 -0700
Message-ID: <20260814224539.1523174-52-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
References: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 22:46:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129116

Major release; see upstream release notes for details.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../{pcapplusplus_25.05.bb => pcapplusplus_26.07.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/pcapplusplus/{pcapplusplus_25.05.bb => pcapplusplus_26.07.bb} (93%)

diff --git a/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus_25.05.bb b/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus_26.07.bb
similarity index 93%
rename from meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus_25.05.bb
rename to meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus_26.07.bb
index aa5fb8d417..948a694a8c 100644
--- a/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus_25.05.bb
+++ b/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus_26.07.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=911690f51af322440237a253d695d19f"
 DEPENDS = "libpcap"
 
 SRC_URI = "git://github.com/seladb/PcapPlusPlus.git;protocol=https;branch=master;tag=v${PV}"
-SRCREV = "a49a79e0b67b402ad75ffa96c1795def36df75c8"
+SRCREV = "0dbbb9c75eb232135f13fdb794318c4da3270ebc"
 
 
 inherit cmake

