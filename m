Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
	[209.85.160.175])
	by mail.openembedded.org (Postfix) with ESMTP id 1C8207C4D2
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Feb 2019 17:37:05 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id n32so750153qte.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Feb 2019 09:37:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:organization:content-transfer-encoding;
	bh=o6AHm8HTweHlRDiRzOMFROr3LHrgpHrNEqya5ukGkkA=;
	b=tsfqx/nEOxFWiTk4GXIP1nVdl9hs+LBPROXnORZoS4d9lPK8q0a1ew0rCsT5zS+y7r
	aD4Ud1Ypy/YLRRpw+YnU9FFyluW9LJ0y4wTFRdUfR9OD/kreyoeXRwFVWiHQiB/gNhV1
	mNQM/6USViWvNdVFjLR0D1F2EpLepsHf5kDjjOGqTa+12oC9+6r1yhEgLxr/6XXPYk/a
	nu3RH5JkqQiPG8C35NQ/9BT2D+ZAkU2opibeD8UiKC2Ct1KC/FhxBbzRkQjlrOiSoWGu
	xpq3/5uvj9vAZL9nJ5pRWT7nLFGxqqTUcKBMj/PDo4D/7oY9dXYduGh7QBgVgvCX1VPS
	Fwtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:organization:content-transfer-encoding;
	bh=o6AHm8HTweHlRDiRzOMFROr3LHrgpHrNEqya5ukGkkA=;
	b=oXIIM1kOUG8ddDZMbt6zjXT7DzyZlj75MYbe/ybTR+MP/h6xYWWFHnRfD/AwCvsMTz
	pH+aoFFx/NZeCtp7w7IAm+n2Unp8Z0gB0SnkLvhMRZfRyH5VoWXsPjgESRT+rjIC7Jlq
	g1rLomkUUB+zNEA0nIJG65x0AgTfl1JWBOxvdTrlgzJP4+oV+9W9EQ2snEY87f/HWLIT
	Htt2DywU2amaav4Nh/qHUBIrVwKSv0tGks0267zXSERYf9tm9PcDGEqnQQjKIF0X8MUq
	+YNZLqjBcPhIAVmMdVfsLJpI2LHIziyhbdyaB7vBsiqpgTYiwAMAw3wIgsUN9IcHdMP1
	Qwsw==
X-Gm-Message-State: AHQUAuZKnSzGfQ5liMbg23c2lKXMgZGItLCEfr1nsGiQ8miRMlxPOkt6
	lCp9QUU1jdF3HCIp5TmXTB0E46Qd2WpKOg==
X-Google-Smtp-Source: AHgI3IbY4ymkfMIemGzgp3JThAYz7V/dcwzWBz407oHZyB1d6YQQyNTq4Ggeg/NZyM0pwmWgSKY3nQ==
X-Received: by 2002:a0c:aca7:: with SMTP id m36mr12650501qvc.237.1549561026928;
	Thu, 07 Feb 2019 09:37:06 -0800 (PST)
Received: from centrium.lab.ossystems ([181.220.86.121])
	by smtp.gmail.com with ESMTPSA id
	n9sm10983987qtn.59.2019.02.07.09.37.05
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Feb 2019 09:37:06 -0800 (PST)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Feb 2019 15:36:42 -0200
Message-Id: <20190207173643.20893-3-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190207173643.20893-1-fabio.berton@ossystems.com.br>
References: <20190207173643.20893-1-fabio.berton@ossystems.com.br>
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Subject: [meta-python][PATCH 3/4] python*-xlrd: Add native and nativesdk to BBCLASSEXTEND
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
X-List-Received-Date: Thu, 07 Feb 2019 17:37:06 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 meta-python/recipes-devtools/python/python-xlrd.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-xlrd.inc b/meta-python/recipes-devtools/python/python-xlrd.inc
index d1ab05d4f..893e82e05 100644
--- a/meta-python/recipes-devtools/python/python-xlrd.inc
+++ b/meta-python/recipes-devtools/python/python-xlrd.inc
@@ -10,3 +10,5 @@ SRC_URI[md5sum] = "b85c9916ac755cad489a9005f5a0d390"
 SRC_URI[sha256sum] = "8a21885513e6d915fe33a8ee5fdfa675433b61405ba13e2a69e62ee36828d7e2"
 
 RDEPENDS_${PN} += "${PYTHON_PN}-compression ${PYTHON_PN}-io ${PYTHON_PN}-pprint ${PYTHON_PN}-shell"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.20.1


