Return-Path: <armccurdy@gmail.com>
Received: from mail-pa0-f65.google.com (mail-pa0-f65.google.com
	[209.85.220.65])
	by mail.openembedded.org (Postfix) with ESMTP id F027260125
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Sep 2016 22:30:20 +0000 (UTC)
Received: by mail-pa0-f65.google.com with SMTP id r9so4615941paz.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Sep 2016 15:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=h1d4WeE17G3anKOKyj3dYkc0PqqGFvWz6LV/ciOITFE=;
	b=ArwbWinoO0LNwH5xoaDlCqf64x8WX7BBKVQpJwO+qAoWZY5bldC2xQDnk4ClU+GTEm
	cZw7AkWW+ovCD+3aIRaKDQtk8zBmbNr5lfAhskKQv55p6jj25v7mCkTQ1tsbRGbVvCrb
	lTUrD97QhnDsjWSFZf2cDmAxdmC2LeUHckHLre9dYSNg6G8GCPtofaFtZD+sOA4oNJTI
	cdIi5Nd75EkpOBGPNNeL5nPgSyJssti3jo2kXZhZyA4t+mfH9h0Fc0imG04wXEr5XZTw
	6iSzAHwoKGXVHz0yzB0QsMUinKdVTCI9gZ+PwdGenaGPD36W4Zu2rcm34o92CNIN5/9O
	/b2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=h1d4WeE17G3anKOKyj3dYkc0PqqGFvWz6LV/ciOITFE=;
	b=VQRFDHihMK+KlSVbjVNoirrt2ypVW6Pg/LmHKV9MYy0nH2n9+VRRtupN8gCmPD8ZVx
	DXucC6Dt7qhdbc3XbY4TBfCYGmL3ZOAMf1HZSHz2c6fNDOkFLz358jiR2KEtC947yvGH
	E/uDPEWCY0Vut+Ps27/eDrfVPeHsOXBu3/nRWd4btR9xrJGDIO1Sq2zRYUtOXVxaWwfQ
	aIqfAPw3mK5OxsFeLroDpUzOLLksQnGkIeKiZbfeYzdG68agWiffHJ/AnjbtSVK2Z2fu
	tHfMW5d20btg+v73XlVtq7yym952BSZXfq/sRBWpB+R9DjKQH9gyiyuTZ19xar+S8AV9
	ZeDg==
X-Gm-Message-State: AA6/9Rllearv1hPWsagwUAj3VTrMZlv2jmvuw8SmXrirlMtMmUu3XqhkO77gluENf45eKg==
X-Received: by 10.66.150.169 with SMTP id uj9mr15452094pab.23.1475274622076;
	Fri, 30 Sep 2016 15:30:22 -0700 (PDT)
Received: from e6520.adbgroup.pl
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	h82sm30125150pfh.22.2016.09.30.15.30.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 30 Sep 2016 15:30:21 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Sep 2016 15:30:11 -0700
Message-Id: <1475274614-10777-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH 0/3] Add support for jq-native + associated fixes
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
X-List-Received-Date: Fri, 30 Sep 2016 22:30:22 -0000

Andre McCurdy (3):
  onig: add support for orig-native + misc minor fixes
  onig: update 5.9.3 -> 5.9.6
  jq: add support for jq-native + misc minor fixes

 .../jq/jq/Support-without-oniguruma.patch          | 68 ++++++++++++++++++++++
 meta-oe/recipes-devtools/jq/jq_1.5.bb              | 21 ++++---
 meta-oe/recipes-support/onig/onig_5.9.3.bb         | 17 ------
 meta-oe/recipes-support/onig/onig_5.9.6.bb         | 19 ++++++
 4 files changed, 101 insertions(+), 24 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/jq/jq/Support-without-oniguruma.patch
 delete mode 100644 meta-oe/recipes-support/onig/onig_5.9.3.bb
 create mode 100644 meta-oe/recipes-support/onig/onig_5.9.6.bb

-- 
1.9.1


