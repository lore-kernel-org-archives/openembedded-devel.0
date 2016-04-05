Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id AE13A770CD
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Apr 2016 05:39:19 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id a140so1214071wma.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Apr 2016 22:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=Tqb1EDc3aCHCy7bEdhrScjp/rIfPgrUeKBQO28KnuhU=;
	b=Jo5CiXHj+aF26O9Q/0QmRyKZZTxjQPtkVvWNuLu2nRfLm6pF4NYUgDIwNs5lkJF3+I
	LTtrJpj7xJGmV3bfsxpU1qQhxSGYKyaGIr6vqiddbzBqzwWE1Wki5W0J8ebxHpoEJe9O
	xpZmU2H0eXbuOL1mBfnPhHUl1W3thBZP5PiFQX+k37j1is6sqToKZH3q/p2jJPX9O3N9
	reyZhFF7NFIgNiYU3fa186p98aNH2um3P754jPU7IRb6noDsUA0Jhc2bYY/u/03sZ28h
	PmDddQvFYkWaP+Im56T3WO2fJ+3cXBPY6WcAGQLBYQBqAZYENrnkESY3gndd8cVJZWNX
	nZXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Tqb1EDc3aCHCy7bEdhrScjp/rIfPgrUeKBQO28KnuhU=;
	b=Rbfse8lCYAuVds4o0BHZuIW/UNDaHqXyBpMLFwrPnuUXO0mC9b8fwMSkfVyxeznZKh
	Xzin/U6cTDxFCr7/tOp5Rd2a11PwTutf/B6Cwa6R88AYVMdhMpMlLNtMZcII0FRTYyt1
	g0Hozsp3MMX6GrmGikzltrCCg8421GWZkrip+bMY66/HTAFddmQCyxWeOT0h/HuuF3xp
	F5X+a56F4N5swsLGTKCCzTL4n8xMDrtaO4g0iEudwZxbsfxmogqmIE1TWwg9fakWyUW0
	7DDBnwhcxLCM2zVTwOHtMceIusvSR9cJnq15KFFquXmT63/vbhxJXdfVSt9m2D5YoGuV
	1GwA==
X-Gm-Message-State: AD7BkJJWd8YdVeu23S9qLM07MJvmhtxTMm1s5WKRa6+qjdhpEob0sLJJsJn0XLIboaZE+w==
X-Received: by 10.28.98.137 with SMTP id w131mr15615908wmb.30.1459834760345;
	Mon, 04 Apr 2016 22:39:20 -0700 (PDT)
Received: from localhost.localdomain (p4FDF0B5A.dip0.t-ipconnect.de.
	[79.223.11.90]) by smtp.googlemail.com with ESMTPSA id
	gt7sm32641516wjc.1.2016.04.04.22.39.19
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Apr 2016 22:39:19 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Apr 2016 07:38:39 +0200
Message-Id: <1459834720-17165-31-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1459834720-17165-1-git-send-email-schnitzeltony@googlemail.com>
References: <1459834720-17165-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-qt5][PATCH 30/31] qt5-git.inc: set packages version to 5.6.0
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
X-List-Received-Date: Tue, 05 Apr 2016 05:39:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-qt/qt5/qt5-git.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qt5-git.inc b/recipes-qt/qt5/qt5-git.inc
index f6149fb..8a6d93e 100644
--- a/recipes-qt/qt5/qt5-git.inc
+++ b/recipes-qt/qt5/qt5-git.inc
@@ -11,4 +11,4 @@ SRC_URI = " \
 
 S = "${WORKDIR}/git"
 
-PV = "5.5.99+5.6.0-rc+git${SRCPV}"
+PV = "5.6.0+git${SRCPV}"
-- 
2.5.5


