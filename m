Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
	[209.85.128.51])
	by mail.openembedded.org (Postfix) with ESMTP id B020A7FBB7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2019 07:25:31 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id g7so1337164wmk.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2019 00:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=81eUNXgNxBkIoT1zCmHthZXO4v/CnwLaG3XL6gy50kw=;
	b=hOpoCBDQY5kcMW0c2ew/gqyet509+O4nbaBrpA4rBTc+BEoih9itMcZ79ijICisNCR
	X1zlH0/hro0hkQI0wbUUjkquzPN39Npf88P4auK9f4bSXURpWzyaQsvlpW8nJcNVJFrF
	vmILCnLRr6/KMyWhh3sQW82oR6ctF6YfZ8H1VemMBuqXIPgCqE+rNuf03Q3cPHfXwRlt
	iu01UKy4zVUpOOQqWBuKmhV1qnh19Qg0kbWuDNzcUBZpXceW98pv59I9gH8FAmDZP0Lp
	EVawKp7rHPFbjzckyYk9j0wrwTLXXtep/OGNCzj4h1W6EHKWlbw/lL4LgevTAgnH+F9d
	p6+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=81eUNXgNxBkIoT1zCmHthZXO4v/CnwLaG3XL6gy50kw=;
	b=BPvmfRe2xZkKvd2uv2F80IKeTwF+UPBCV33vmNjeyaP4VSNAC6abRNiYTJgCqUBXdJ
	dMFJdlBHdibL9E80Rak12g2fHx8u5tgutgLunjxob99Vv+faVF5ZD2MnXB8+ZCnmALVW
	IvXE1CbSvGzwTr4iqwBfibTn1JLw09zPjMwCYWYjnslr1OFP0v20FnZkgrP//Bext40U
	CzDHdyqcg9+vcU4IgpNab5F2JGl310P770B4WMzKDsvu0DjeBp3mDCz9FiWHZCgysKR5
	SHaDL3Ol+42qsV+veegI6lv00IccKKV9oumTBCwCzEQxglXEMlgoXGW8jen1Be7Q20cb
	PyMw==
X-Gm-Message-State: APjAAAXue2g/PCyIG9NGx1CdtF6hVtyrEel6hwhsotckyMOhxFP9UNpr
	DIyxVAKIe7sUzHgfpXCG+GNPmjEx
X-Google-Smtp-Source: APXvYqwZp2NPiWAImU0on5+8J3UG1T8pPBYkJQZ7SZqS7aDi45FuL2w9CD3nX3kc2qKw4L6cK2DamA==
X-Received: by 2002:a1c:4c09:: with SMTP id z9mr1084898wmf.33.1572333931833;
	Tue, 29 Oct 2019 00:25:31 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F3206791C2D7DC04F339B1D.dip0.t-ipconnect.de.
	[2003:f0:7f32:679:1c2d:7dc0:4f33:9b1d])
	by smtp.gmail.com with ESMTPSA id
	36sm28568711wrj.42.2019.10.29.00.25.30
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 29 Oct 2019 00:25:30 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Oct 2019 08:25:23 +0100
Message-Id: <20191029072523.5068-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] unicode-ucd: Set correct SUMMARY and HOMEPAGE
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 29 Oct 2019 07:25:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-oe/recipes-support/unicode-ucd/unicode-ucd_12.1.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/unicode-ucd/unicode-ucd_12.1.0.bb b/meta-oe/recipes-support/unicode-ucd/unicode-ucd_12.1.0.bb
index 88a116f63..89ab565ce 100644
--- a/meta-oe/recipes-support/unicode-ucd/unicode-ucd_12.1.0.bb
+++ b/meta-oe/recipes-support/unicode-ucd/unicode-ucd_12.1.0.bb
@@ -1,5 +1,5 @@
-SUMMARY = "C++11 command line parser"
-HOMEPAGE = "https://github.com/CLIUtils/CLI11"
+SUMMARY = "Unicode Character Database"
+HOMEPAGE = "https://unicode.org/ucd/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://unicode.org.license.html;beginline=42;endline=85;md5=67619d0c52706853c0256514e7fd04cd"
 
-- 
2.21.0


