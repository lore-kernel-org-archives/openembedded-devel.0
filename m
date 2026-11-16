Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22043.1794808948085785315
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Nov 2026 22:02:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=IEwX39li;
 spf=pass (domain: gmail.com, ip: 74.125.82.176, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso3687417eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 22:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794808947; x=1795413747; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8sDroBLAMW21QtwjcjUl5GI5BG9S6R92K/O7MNdS5Q4=;
        b=IEwX39liw+uOD09wmyZOipATeqBzAviBJxWZgo9trx9YrjpjE1Xcup1Ot4X33abVfh
         ESGwwZztgUJOHFnj1fPgGRp296MGMjtxtVFHm9cXRC1ZjTszZJLf30beFqw5buqW7Lch
         +I5USlhhUEoTMGZ0BRs+nR3fJJXlpY4d4BVJqrCQIVVPYgBl8FASooIFH5qjTNjvaXIA
         ofeCFou4KDT8Gea9CNlxmX5RpqLx68G6kU7MWWIBO8KEfBRg2PuTpg0GjQZqpo3TeMkz
         yHwSsauFiojHaGQ8qaKmk9IwD3lBCcgSkmgt8XxljEN7vHFamO5ZeQlXFwB8P4GKx0KF
         F12Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794808947; x=1795413747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8sDroBLAMW21QtwjcjUl5GI5BG9S6R92K/O7MNdS5Q4=;
        b=13XY5PZ1jBkJsKkAI7WukxEQaHkLPtKmr+umXy/IgCgi+LdbjTpfnwPVMmO2DtqA14
         Pb5IRagAan1QslNys6lyPdVlqt2c7jpowRhn5Vs/yKqeMnK6h4mwbZLNZ+HZMsojm6Jz
         FelP7JLWkGBzmS6zXFb+29j41rVlUfK5DVsltBDgBtO6KTj5GvWvNB2LB0zPikXnIXVr
         r35+5FDyltzE58Ta+2AXKk5SNojsUSqSoIop2xhhFf/yyzHQQBKYuTYk8howOygkPiuJ
         NPkN1p5Aku0qL88Y4qqqxVT6rRrIdqvZNLLPL7Kd8NhTTKyBoENqYS/bc73NqRamWJ0h
         979w==
X-Gm-Message-State: APuU4Z+LmUvO6chheN3ldwoaYjKcnSXcyYL2CsroNZzQNkujGy5UeegQ
	Xi//wnPJkGWapRDcuVd0Vr/qBzY31GGKKdGP9Mhe6lo/7VTqEqu35aVQDZTAztjA
X-Gm-Gg: AYBFou08CjvEEK2TPGwALKXlGWBrtBNbVpJBgG1Fhy6UfbVST5rWVCcbNhc+9QIyPRG
	/qIWnO6T0fOLazWz9kqsBJ9l6UO6YA6SJ8WgBFb7wx2cP1CrhQyNqlfb1isXopKCzstcY1X1IQ9
	L2zbEu/5e5Wb9pGHmG7eK1P2XCCz/up3f7GdhbOKfYeLx2qbbdIbDe20bx2c9KpQ6A1ntkQD5SA
	kR1qoAZu0JqD1cWk4PyYPGrVHP2Qh0P7kY4AaQq+tCcYa/kldsUAZoYu/xIbpbl/12vGqFgVgYp
	pqmOKDhjNP3Jnbe4Gu1/1loHf62fem4s/wtKhE+dKalPHcLBxDP4xA1AO0A1O0CQKLMrMifH4Kq
	m98ADDjNbf5oBz+JTw3owu8yiTCUyduf9964om5LN/EfPuigGqWVKUX/GQ8KHwRDbGNPtxXQggR
	vVx8ZDfqCadkrb2YHffn1/7mUptSoQ7Ic5LiDaNv6e9y1Al4CyiaGV0AXthKZS/K5fkURsv2NDZ
	Uf1dEA5QPOzJOOWF/N23LYMgAgaFuBALnNacRB9sAUCl17jabs7cnuvr05c/Wq1s/quzqvc3xno
	Ed/6FnJK0vSELg/R4U3tYr+W7QWxorKmSYSx9Vu/cSnK8LuSNrQhxjCf4scXq9YuM74t+GthXQa
	GAoGfdljIAMIx8+HgwIhzruATDDrZHbzDOnWyDc2iPTQJJoQHxdkgLcdY9b9zPhBpW3oQq4afpS
	x49B8bShvgcjA7woQxg1fjrEogVIpqO8ttBZNldU/vDga84kpXbsfRwYfwPLLBY+orhAwFMOOrP
	+AERhP1Opi+fjq+PM7T9upByAiNWOlbjTZFfw6GpXQ/RcdgUCt/4o4vDGGLme7106ch1gvWtruB
	JluO
X-Received: by 2002:a05:693c:8812:10b0:372:33cb:fa85 with SMTP id 5a478bee46e88-37967dd4b6emr9578100eec.29.1794808947195;
        Sun, 15 Nov 2026 22:02:27 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379553316fdsm31410262eec.5.2026.11.15.22.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:02:26 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-perl][PATCH 14/30] libio-stringy-perl: upgrade 2.112 -> 2.113
Date: Sun, 15 Nov 2026 22:01:52 -0800
Message-ID: <20261116060209.2916444-14-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116060209.2916444-1-khem.raj@oss.qualcomm.com>
References: <20261116060209.2916444-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 06:02:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132412
Content-Type: text/plain; charset="utf-8"

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...{libio-stringy-perl_2.112.bb => libio-stringy-perl_2.113.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libio/{libio-stringy-perl_2.112.bb => libio-stringy-perl_2.113.bb} (91%)

diff --git a/meta-perl/recipes-perl/libio/libio-stringy-perl_2.112.bb b/meta-perl/recipes-perl/libio/libio-stringy-perl_2.113.bb
similarity index 91%
rename from meta-perl/recipes-perl/libio/libio-stringy-perl_2.112.bb
rename to meta-perl/recipes-perl/libio/libio-stringy-perl_2.113.bb
index ab5eff852c..8c2e7343a0 100644
--- a/meta-perl/recipes-perl/libio/libio-stringy-perl_2.112.bb
+++ b/meta-perl/recipes-perl/libio/libio-stringy-perl_2.113.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=01406e4ff2e60d88d42ef1caebdd0011"
 
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/C/CA/CAPOEIRAB/IO-Stringy-${PV}.tar.gz"
-SRC_URI[sha256sum] = "872328f5a665c79e24a777b35e4f7fc395a1912d5e142879ffda83e8c102f765"
+SRC_URI[sha256sum] = "51220fcaf9f66a639b69d251d7b0757bf4202f4f9debd45bdd341a6aca62fe4e"
 
 S = "${UNPACKDIR}/IO-Stringy-${PV}"
 
