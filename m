Return-Path: <uvv.mail@gmail.com>
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
	[209.85.128.47])
	by mail.openembedded.org (Postfix) with ESMTP id D3082799F4
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Oct 2018 09:54:19 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id 206-v6so1270485wmb.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Oct 2018 02:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=mL0LB/p2r5BOotWLmKrWS8A8Em1ATt/GzJuKct4vZ/c=;
	b=H4L45pld8FtDCS+q6pRniujhsACktVQWuHmT6T9d2f0TtX2QQkBWS2dC9K/CvgdmP1
	JEjLWjYSnqqUB483nPJWzENZ/qhf+mw0HTQC/aXxkbVE2a3LMBlt5MObfNIByEN1oqjR
	fntkef8D/rJyTwdk5traELlpY9oJ2o4456YBAjdgtPhqLlUqbX1gGpNteoqSCMaisdP4
	vBSqsN2ksIja+oQbqtpq7jh+LT4jEX3CHJH3wVoKQf5e6Pl+usCsNxIipTWzQ1C/fT14
	NIgE/WX+tHowqP7ywiOL6S09/wXsSxGPC61Rc0RSjwlGFXZrjEyWANqFgulkhjMIDB+k
	t7BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=mL0LB/p2r5BOotWLmKrWS8A8Em1ATt/GzJuKct4vZ/c=;
	b=fZCeTAp2coS4PNk6n/+NyPCR+L6OTf3WTZ2Oupa6PRFWeAIi1RD+8EawAs1Vb8WUyd
	+xGsrLBMOZSQ1KQTP46imzeoWrhNXRB/OGjhRdz/13ighJBBzhGVKEL1PUgxPsFuBB1J
	PViXeCSFGjlV3YoQoBBgu17NgdSZ3kSzJMP+O+3Up5SHFsa8uG8Ah26dXlCkkufPmXgj
	LyVqDITAkO+qYX2PIqJHy6NsJaUIF9yQKbYanaNJI5dZbwAi+1n1Ra+Vgc27csl3ixR2
	8H6OJKAl4oLMLa4a3ot5K8MLcxxIku//18nyd+iwVCHz+xqILqkxhSh6C+k5KNnHWvWd
	CsiQ==
X-Gm-Message-State: ABuFfoiunbtajwV1CcsbmES+p3ORmv+xdh0cDavz8tEVBaMCnR8b2YKh
	yDk4OTcJqNaM1d4x0b12AUO2FrHJju8=
X-Google-Smtp-Source: ACcGV624LN82vr6iWF/J9EdFPZ2W1+h236z2PKMToLAmJ8qXIVKO6zHFUs8GVt1AI801fcXriX3ufQ==
X-Received: by 2002:a1c:3288:: with SMTP id
	y130-v6mr7221369wmy.11.1538733260282; 
	Fri, 05 Oct 2018 02:54:20 -0700 (PDT)
Received: from localhost.localdomain (ip-109-42-0-21.web.vodafone.de.
	[109.42.0.21]) by smtp.gmail.com with ESMTPSA id
	i15-v6sm4422156wro.58.2018.10.05.02.54.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 05 Oct 2018 02:54:19 -0700 (PDT)
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  5 Oct 2018 11:53:39 +0200
Message-Id: <20181005095339.129424-1-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.19.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH v2] ceres-solver: Removed empty package
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
X-List-Received-Date: Fri, 05 Oct 2018 09:54:20 -0000
Content-Transfer-Encoding: 8bit

By default ceres-solver provides a static library and headers.
This change removes an empty package and sets an implicit dependency
on dev and dbg packages.

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 meta-oe/recipes-support/ceres-solver/ceres-solver_1.14.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/ceres-solver/ceres-solver_1.14.bb b/meta-oe/recipes-support/ceres-solver/ceres-solver_1.14.bb
index ad7c8f2a3..a62e5ef23 100644
--- a/meta-oe/recipes-support/ceres-solver/ceres-solver_1.14.bb
+++ b/meta-oe/recipes-support/ceres-solver/ceres-solver_1.14.bb
@@ -14,4 +14,6 @@ S = "${WORKDIR}/git"
 inherit cmake
 
 # Only a static library and headers are created
-ALLOW_EMPTY_${PN} = "1"
+RDEPENDS_${PN}-dev = ""
+RRECOMMENDS_${PN}-dev = "${PN}-staticdev"
+RRECOMMENDS_${PN}-dbg = "${PN}-dev (= ${EXTENDPKGV})"
-- 
2.19.0


