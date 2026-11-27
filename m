Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8193.1795739681854476064
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 16:34:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Cl+7LElw;
 spf=pass (domain: gmail.com, ip: 74.125.82.180, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-38190551625so14471991eec.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 16:34:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795739681; x=1796344481; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GMjZDi351qwcvAN0mOJq2UpRppLLY/OiDG5pzlhz/xI=;
        b=Cl+7LElwFzcUbwrYXCH55+kXaBnfm+l6d8E+ge3uJ74uIYCX003ElGlWJQJTp6EEur
         nJwHT6Yl1CevCLBz+2LvU5i6IFg7yb4a0JPZHIqX73HEOBSbclWd1wtu/rBEdvpks0F0
         IWrRQ92gVwuORdV4Y/QTxDrHnrfTUhjf5x9hUU9pSxL23dZrq2Js2jdwjzvZetc6bfkZ
         0B9dqxycxhVx5W5H3vBuzUg90EOZQcZ+q89O0QEistIbqn8PSZ4Tidt87TagiRk2Y+cp
         kMV8q59VugX61N+FzZUiM4vhDK5ALVY49p25hlipRH9cEvQorZPXkmH/hz5fH8DyDrIX
         LMCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795739681; x=1796344481;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GMjZDi351qwcvAN0mOJq2UpRppLLY/OiDG5pzlhz/xI=;
        b=qSxCv1DS5zE2Kw4cPHhBv1+DlfqI1SG2PxH/ui/lsGzDjkUMKBJy7sh7mkbtfWwYNk
         w0PHuL9ai+911TWtQt4p7yhZck2H2YJwZyUUHuWcEtVtaqprl12IEpE/D3h868f/xDlz
         6Of2If/E5iBZm/76k5zzCHslGhtWipg4RDLHLiUm8k1qMtpZ3M14Al+LUZrZQPQOjzIs
         ZwW52BZQvEmC0S5q8PEFHJvgTki2lbpslvnNrsOQ3cdMqHtyR6zhJPHM2ejtRAOnbMFF
         lIXs4tBlwwjj1rIJ1pTHUUu1gpwNc2DE0GZyCyfWN2l3pt+j0UweCRhXPjQcAMKcpc6U
         8EuQ==
X-Gm-Message-State: APuU4Z//3aQHmQX7u+rh1GahDBarhvWDhb4ewCSVzX8b6BDYRAG/WKfY
	5S7T1dDKNrhWALqyxKLEsMj15jDx0XbFKHQm5/Aod/oLPzCQHBozFsJn3Q8BYTzS
X-Gm-Gg: AZFdTZdGZQsBgCnAAt2QTGfXuzJHxI1x4T1wWvaXVLwWoa+8weFcOzHmKReyiopVGAr
	o4dHweb7ErhqDFYwrPeE2n9wzFh4h0Frl+t/hyXeSwRLpzEmDDBMjKUHGD0PQSdr4WZJLD/qj41
	QRQryC/4CB+Cinp0lPXEoaYtRyqr2WpAvWsM8Zkk3NFGfp9EnGPFqJoj07hOCiin38ujd++hlVa
	oQfaG9ZzvlbdFcj80paX5DDGeM7Gwl8JJoVEaNoFr5MeL3mzPJH2y/elGSUUlUjmUrpYYQSudmT
	fpCbg3MS2GxTDn+0DhNo9SnU9QTagmKuoEq2pwdtPgkmVP0avdHZIVbcpZgHIjqtVeu+2eFmMvO
	UckD2glZt8pj60FSlAQJq/wn64nTgVUwVyG9Kd9dolpU1djWHl4ZyMNoCEta3mCgBkB9/hZAPmh
	F7teL2z0rdnmnsqF/OjXTYA12xk/NH4jA9qxqgzld7yFWWL94oXOT9JOnlXyiknE3NTUWK0dzAg
	rRpPK3jhB7ao3CATTRO8ktVIlYScZzQ0W7SgrkX2Qxteo2q2KcXOcRIVuW8pAkVNoI0sAEqI9UD
	ZugdZLAmeZ4i83ARjtFPELM+/zLTJ+EEhdiodWDI3+VJuhW7zomwbLRbBuokdusOi17k/vmZa2g
	tiHSdPcZl/w+MRl8DWZvBXrdffZf5Gcxt2t+Bz8hGBbyCMMYw0S8wwtc5qS+HcgJ8WUqpUbLnjB
	X+zhB7OzEF/xOdBky65fM5E57MENflzrBoUtMXafBXGQV0wNv9PnZICDh+7YBIPgECpfT7/61IC
	6ayzo6Sj+EV0vfLOo5u/302Y4g8s+QQoiWifjxYzTsbZJi58PnZf9jD48OIpVb+ieAke9Q9xMWQ
	aW83
X-Received: by 2002:a05:693c:8850:b0:386:b351:d5eb with SMTP id 5a478bee46e88-386b351dcddmr12256214eec.7.1795739681097;
        Thu, 26 Nov 2026 16:34:41 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm63029314eec.16.2026.11.26.16.34.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:34:40 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 10/69] leptonica: Fix upstream version check
Date: Thu, 26 Nov 2026 16:33:26 -0800
Message-ID: <20261127003425.2166632-11-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
References: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 00:34:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133110
Content-Type: text/plain; charset="utf-8"

The unanchored regex matched any number on the GitHub releases page
and reported 11.28 from page markup. Match only the release tag links,
which also skips pre-release tags like 1.87.0-pre1.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-graphics/leptonica/leptonica_1.87.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/leptonica/leptonica_1.87.0.bb b/meta-oe/recipes-graphics/leptonica/leptonica_1.87.0.bb
index 1e6edfd138..481a556390 100644
--- a/meta-oe/recipes-graphics/leptonica/leptonica_1.87.0.bb
+++ b/meta-oe/recipes-graphics/leptonica/leptonica_1.87.0.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://leptonica-license.txt;md5=809b282cea2df68975fbe0ffe02b560f"
 
 UPSTREAM_CHECK_URI = "https://github.com/DanBloomberg/leptonica/releases"
-UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
+UPSTREAM_CHECK_REGEX = "releases/tag/(?P<pver>\d+(\.\d+)+)$"
 
 SRC_URI = "http://www.leptonica.org/source/leptonica-${PV}.tar.gz"
 SRC_URI[sha256sum] = "c73363397f96eb1295602bf44d708a994ad42046c791bf03ea0505d829bdb6a7"
