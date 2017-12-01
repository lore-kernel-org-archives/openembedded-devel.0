Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id E178A78654
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Dec 2017 12:45:11 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id a71so12903053qkc.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Dec 2017 04:45:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=htonfe5SEnBAeo04+8Aeb0RPlq2rUXC7iA+xoTniY2Q=;
	b=amAsOOrw0q0YI/YHyBGfWC5ybYCbyvo1btHzB2uM/oCuhGTfZP9kZ1TBNPROfbqalA
	V8kZHXyTfMmCzJN7rX0VhkO+JuchKWJB6Jd77ahGVVqoPMoPnowlgfEnBW4c7fmUeOeG
	j5piT0ZqJx/ENYkXMsZpntXZMUOewjx0va569XG2c5nxh7n4tc+wNCbv8L9AwkEOPtqU
	4eKCZCfgCeoXZi+mIMWoOI3R+3mxUOtwdc6oAHkWhvRL6AwKB4KFRfXJzipxmEBCxYsR
	IqXyEdOlS3dlP8BvyFs/PQ/7gtuRVOip94gRlbAIREHsEDLU7slHpLVNsqznrrELA3LL
	bG/w==
X-Gm-Message-State: AKGB3mJ6o6sggvdEuPJF2bOdrkXVXgT70fHXalJd3tnqZnAlkARRavuS
	Eqodvl/eEV0zZPvHl+/Y5LUSKw==
X-Google-Smtp-Source: AGs4zMYvO9BmN11iJeVubPssLH2X/TdqqxAdJFrYD00fbPmRqad1RrM07vHZ1I/gjPIPya0wfAMuZw==
X-Received: by 10.55.201.11 with SMTP id q11mr7163332qki.303.1512132312458;
	Fri, 01 Dec 2017 04:45:12 -0800 (PST)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	a19sm4511107qtj.74.2017.12.01.04.45.09
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 01 Dec 2017 04:45:11 -0800 (PST)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Fri, 01 Dec 2017 10:45:03 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Fri,  1 Dec 2017 10:45:00 -0200
Message-Id: <20171201124502.18190-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.15.0
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-python PATCH v2 1/3] python-asn1crypto: Add nativesdk variant
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
X-List-Received-Date: Fri, 01 Dec 2017 12:45:12 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v2:
 - rebase on top of master

 meta-python/recipes-devtools/python/python-asn1crypto.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-asn1crypto.inc b/meta-python/recipes-devtools/python/python-asn1crypto.inc
index 41b734219..8f402b783 100644
--- a/meta-python/recipes-devtools/python/python-asn1crypto.inc
+++ b/meta-python/recipes-devtools/python/python-asn1crypto.inc
@@ -10,4 +10,4 @@ SRC_URI[md5sum] = "97d54665c397b72b165768398dfdd876"
 SRC_URI[sha256sum] = "0874981329cfebb366d6584c3d16e913f2a0eb026c9463efcc4aaf42a9d94d70"
 
 inherit pypi
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.15.0


