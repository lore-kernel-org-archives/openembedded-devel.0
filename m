Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 86840771F8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Apr 2016 19:41:53 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id a140so16801833wma.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Apr 2016 12:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=6JfjdR7DFWyLlbQNJwDPmFog1QcKRCcnkw/xXVzLfIU=;
	b=gzADi7BzBbSV6t5lr+SFT8LhEfGtzTrI3e2pfzGSq/P52yWfwnnwoRZX2EB1AGvsNi
	xKCkPfNYSKHay7VdSIGihE6Mt8/gj2zEdQa5yaVC/yyM22QOTEUtMIRjo28lR77BS1vY
	lUu8lIBc4kuElSgaoeYVQQoF7jQR9zBCDFMlPEYnXWPWloljNGP+FsKCFVruWLNwCfpG
	Ord2WIX3YW0njoUIkHFYSRVtBREW8U1V9fxHv2fiB50gV7EyaBy80ZiV3lnXHokrAIkw
	NXhoXQQpPFsxu099WTr9RscnNp7gNuyz++xclk/EZpsasbZzeq2T2bJneqTvqGemNl8c
	n0hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=6JfjdR7DFWyLlbQNJwDPmFog1QcKRCcnkw/xXVzLfIU=;
	b=HEJGrCgSgZerbCI2f4vbYSfC1Oi7KjKaSBFAWR2dFMd5PR9U6oCxYDTbcq1gXZ3EUO
	N8K4zDtwRxmyTFuBwmvfVPeAA0j+C0ulR3+GHha90pZfZgH1P0qjwdgxw3MSGc9aEM8o
	s3dt0nwoMbTeR298jl4UMgEelItazyBVjb+vzsKSgSVu3n3xeuorAaCejSMMPtO47pPE
	rQf9UpV1EH7oyWazitoXFjO415Va+w7HRvKdcEApWZSTPJjzcJQ4upU/hnAzpCyCChth
	4eKyIH5JyH08b/0ZPyVbcLtqMIEK+cf78DUkItaKTS/onqGPUsjoEkqjD7RyhwWsQZ9j
	uFdQ==
X-Gm-Message-State: AD7BkJKk7MBeS6iZeJ7Brp7FOHv3HakicBE9dGak5Akm/oRdcxVGnOnSPeAaygCN8Fygyg==
X-Received: by 10.28.188.197 with SMTP id m188mr13870062wmf.92.1460317314128; 
	Sun, 10 Apr 2016 12:41:54 -0700 (PDT)
Received: from localhost.localdomain (p5B0A33F1.dip0.t-ipconnect.de.
	[91.10.51.241]) by smtp.googlemail.com with ESMTPSA id
	u79sm13612910wmu.8.2016.04.10.12.41.53
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Apr 2016 12:41:53 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Apr 2016 21:41:08 +0200
Message-Id: <1460317290-4787-10-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1460317290-4787-1-git-send-email-schnitzeltony@googlemail.com>
References: <1460317290-4787-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-qt5][PATCH v2 09/31] qtxmlpatterns: update sources to 5.6.0
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
X-List-Received-Date: Sun, 10 Apr 2016 19:41:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-qt/qt5/qtxmlpatterns_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtxmlpatterns_git.bb b/recipes-qt/qt5/qtxmlpatterns_git.bb
index c424562..2f24933 100644
--- a/recipes-qt/qt5/qtxmlpatterns_git.bb
+++ b/recipes-qt/qt5/qtxmlpatterns_git.bb
@@ -13,6 +13,6 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "a8d103a05bc195dd045779f3aebdf67bd0140df1"
+SRCREV = "de2dadb8af67f9d425c3a8d2353a7d5b07588915"
 
 BBCLASSEXTEND =+ "native nativesdk"
-- 
2.5.5


