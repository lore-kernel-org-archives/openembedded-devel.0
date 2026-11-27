Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8087.1795739729907987683
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 16:35:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=DhyeV/G0;
 spf=pass (domain: gmail.com, ip: 74.125.82.182, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3866a784546so10294181eec.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 16:35:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795739729; x=1796344529; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QkSt0v9rc3EiqVevS2dtDJy+L1jZ9CSaowma7f2DpQA=;
        b=DhyeV/G0UfPNHwy0ZBGO+EiKZ+U28U3nj3BVZF/rFeMdh4sTir4BDY/7LO6umhVej4
         PpwuTTHyGcdWVJQiNkGhtfrUom3ZI+2UIt2dSx2c7igjXqZMXjFW+ZfT2/g7eKVR4vpf
         Vb+40bcZFFjR/ea06B+F71FfNqh6V5aAnCGv+ElbmffenhZl3xi+5LJPBZQYq7obTgvW
         LCE07UEpzPAXnIbmBO4RhyNEK0HTAvJTt5nykRVRb/d1Q0uHlgdeG6ePFfAEkBNwi1eu
         yPJastB110d+t77BgTJ4y0DtnSSBMmd32FwErrKXMsoSBRrXBKXmV+SfSC88CtMsleQt
         fMwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795739729; x=1796344529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QkSt0v9rc3EiqVevS2dtDJy+L1jZ9CSaowma7f2DpQA=;
        b=YT1Yo5UabG/Jv6aYL444+PCDYm6j9LDo3a+owgGhAMFdtfKG2fo9ylbCVkKQ/PthDr
         z2UXUkvl/CMwvJEy0xABjAHX9jJDSger9FDqLiudeuzprmhAuXoBjVnVcwGroZqR6xVi
         BV2IWojisSaTMQW8L+GUH+LkqTFM1oH99oUINccVEcMhCiNrj0M+LkK0OJ9ntMWk5x+H
         0lkPu61GGK4evoQec8SUqcvEi2ask5V4twbzEF+/OUFO2e1Qqln8QSVjlS1D0x/4U7Dt
         VnLoIsPmX7ZqT2RH01aLhoLEP3KSf1RaIkpOFormbhMyE6eoI/WjZFWvv0QoAJjbtPgw
         hGKw==
X-Gm-Message-State: APuU4Z8qnI/3zGk0fAOokrjXufoCODOK3tP/QltDt69qmeb6j46uA2NV
	6qyT8O8RcYtFvwFf93nFuVw2boe9fGtfzaez1r31fhPmysWTYlzq9HEIxgN+fSYg
X-Gm-Gg: AZFdTZeMw0cPXxmkNsbiBpSheIItXHhhviKEKzhwrRr1MmpxDAN62Mk99EESs/z8vcO
	dTViKI94FdZtkzsFCRBBX+1ATFTgEZy/L8negacmTba1moHN01A0eUxYNIuyPCmqZMrcBNU0CD7
	axpebuQM7z1JoA6trHGTtBmj/JzfKMYBxg+CNzmuZyjz/7n0ETDTdRvMKmRQ1bvDR1FbYQ1Q8C+
	FepyJTkTYl+VA6fEqU/aF+Ft+xGo5fWfM6Z993ZmGpMJkwxhjr8LU6hu7gO7qH8D35olTw6JUPi
	GJkuQQdZN5Kac7CeuDT6tCRyp2X4v1mvNneYZ+oEufWxATVTVaVKESuaYyai365P30FtLvUkwCk
	9ZRqvBVfjVVombWOg4bV9JWFlmZeAKPoltLISRho/GDxiybM9QPE2DZAzIORD2ffPNqAzaEyCna
	WjxoAZMxx5gJ2bl8J1NPhKV6t1G2QGcvzo3Z9gW5nxsozO3Lo+5ohD87PegVhapIjMTai+qoOWS
	QQ3N6qyrfvP11d+GZEyqp6olzmCCK3bb9B30EDxJDURhC1YZWeVbvlZi7cEj5kMGpct1dDr2b16
	VY35ksVmdR+Pl4pZ6NG3kISqlpDjPmVbFQfmhZnVZKTs0aHvPtF4kBIO5/d3Ov2Ugx8KWLU+CFQ
	klNG+NFB7BxDQ3ksKpK6IQl2o44TUPT9ER8XhABDtOu7olA/gf+MeW3KNlv5j3DuC5L9AkIpjaS
	9SWrUWvxCsx1jyHLK2yYEv2RKOXBNgb0EYR7DUMj8vIZBmFzIhfWgR3Tjcwu35GE31ECLuCUIEF
	TNE0IUKaa+e0lG1W7zfwbJfoYqR1SIlILjIhbgq5Yj0lcETrvjwngMLVg1T9pfjTI2RkoYbaPlR
	htA/
X-Received: by 2002:a05:7301:6e9a:b0:37b:e01b:9f15 with SMTP id 5a478bee46e88-3857025f802mr23816740eec.24.1795739729174;
        Thu, 26 Nov 2026 16:35:29 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm63029314eec.16.2026.11.26.16.35.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:35:28 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 56/69] serial-forward: Fix upstream version check
Date: Thu, 26 Nov 2026 16:34:12 -0800
Message-ID: <20261127003425.2166632-57-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
References: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 00:35:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133156
Content-Type: text/plain; charset="utf-8"

cornucopia has no tags for this tool and the default tag regex matched
digits in unrelated component tags. Track new commits on the master
branch instead.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-support/serial-utils/serial-forward_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/serial-utils/serial-forward_git.bb b/meta-oe/recipes-support/serial-utils/serial-forward_git.bb
index 05e965fc63..aaa88b83e1 100644
--- a/meta-oe/recipes-support/serial-utils/serial-forward_git.bb
+++ b/meta-oe/recipes-support/serial-utils/serial-forward_git.bb
@@ -9,6 +9,7 @@ SRC_URI = "git://github.com/freesmartphone/cornucopia.git;branch=master;protocol
            file://0001-serial_forward-Disable-default-static-linking.patch;striplevel=3 \
            file://0001-correct-the-typo-in-include-file-name-string.h.patch;striplevel=3 \
           "
+UPSTREAM_CHECK_COMMITS = "1"
 S = "${UNPACKDIR}/${BP}/tools/serial_forward"
 
 inherit autotools
