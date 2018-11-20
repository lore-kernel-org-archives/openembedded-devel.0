Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
	[209.85.214.172])
	by mail.openembedded.org (Postfix) with ESMTP id 6314B6B8AC
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Nov 2018 20:38:26 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id u6so1982791plm.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Nov 2018 12:38:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=uggW6Q2eB1sT4nT6wB+bt+KprHWDia71nFegSzreoTU=;
	b=W6hhFeIBLEMa3xyzXbedt3xNKE2toTAG2lM/5pmpZcf3a16MARiFHShyvLG7iR8LyY
	1ibqRIEBa41QnbKuavzP/DH1FePQw/u4fVebfkCnZ+pS8LAlK8We1b7KimQxRWLUcUEI
	eMR4ITYpHAYO3d7THGe7/bdmHz3ESXgDFL/hs/8iQ9eXE5Aaj4tS3qfPWD6Z5e41ZwfA
	u75ZQfXWg2KwZlT0wCoqXWbHw6glqXdP0+TjZuS3gHg9qjSfszBrxjhdTwu3KDftXqrH
	f670q267eVKd2uUVBHdRcM7IBrSu2/gnP9m80bSshCOpyl/TANaBmn2VZ00AWX3UOwWg
	C07A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=uggW6Q2eB1sT4nT6wB+bt+KprHWDia71nFegSzreoTU=;
	b=VGxVThOphC+frHTHeXVuF2WKc/XRh8hi6QurhmcvSKmxp5nPMezjjB17ET+gF6iR9h
	QotPdWNKV5gSkc8c27jv3WJQhLX0WfQ74zH14L4EK5ocLz3lQ25cN2pgbxfEboa8+duJ
	SrcZQ+vsMfglgGNdM02DN4YNkCZrVck81kUOh3b2oIZUSubK50HFpv7ZPUWAmY/TGTcA
	NAPZlh2y9gwwZUFodZKPAo8u45BxJ91bq1JrX4XLSe4uskJspYYRnmDQyeamHcRD8Y4g
	SY8lfyGOpMIGh4IrwdOj9Y/2saL8Vs9jpVs8Jv94sjAW9bgjA0b8pDpo+25OfCAxwWJr
	cqsA==
X-Gm-Message-State: AA+aEWbrnM3wGdT3CUYhpDf+zsOTA1E0PsTTXau2qQY+JGiD+xawTeYY
	KbQEFtL3C+X/GwkEt0DA2hQbPWCPVq0=
X-Google-Smtp-Source: AFSGD/X2yJabBualeWKwNCUKWjIULJwuNLQHEYXIRHMwg/sYD064jTNxL5lgYqFn3vJx7HNZ+rk95w==
X-Received: by 2002:a17:902:544:: with SMTP id
	62-v6mr3565731plf.73.1542746306981; 
	Tue, 20 Nov 2018 12:38:26 -0800 (PST)
Received: from localhost.localdomain ([2601:646:877f:9499::26ab])
	by smtp.gmail.com with ESMTPSA id
	x26sm24325479pfn.50.2018.11.20.12.38.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 20 Nov 2018 12:38:26 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 20 Nov 2018 12:38:08 -0800
Message-Id: <20181120203814.11500-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181120203814.11500-1-raj.khem@gmail.com>
References: <20181120203814.11500-1-raj.khem@gmail.com>
MIME-Version: 1.0
Cc: Nicholas Pillitteri <nicholas.pillitteri@jhuapl.edu>
Subject: [meta-oe][PATCH 04/10] Bump libiio version to 0.15
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
X-List-Received-Date: Tue, 20 Nov 2018 20:38:26 -0000
Content-Transfer-Encoding: 8bit

From: Nicholas Pillitteri <nicholas.pillitteri@jhuapl.edu>

---
 meta-oe/recipes-support/libiio/libiio_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/libiio/libiio_git.bb b/meta-oe/recipes-support/libiio/libiio_git.bb
index fa6f4c2ca5..cc0efccf99 100644
--- a/meta-oe/recipes-support/libiio/libiio_git.bb
+++ b/meta-oe/recipes-support/libiio/libiio_git.bb
@@ -4,8 +4,8 @@ SECTION = "libs"
 LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING.txt;md5=7c13b3376cea0ce68d2d2da0a1b3a72c"
 
-SRCREV = "fa82974d8bd1fded78e630ab71a7ded1b11d0e33"
-PV = "0.14+git${SRCPV}"
+SRCREV = "6ecff5d46e1b12c2859f0b63a73282940e3402bb"
+PV = "0.15+git${SRCPV}"
 
 SRC_URI = "git://github.com/analogdevicesinc/libiio.git;protocol=https"
 
-- 
2.19.1


