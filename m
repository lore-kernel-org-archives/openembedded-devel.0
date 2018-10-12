Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
	[209.85.210.180])
	by mail.openembedded.org (Postfix) with ESMTP id 7ED4B74D03
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Oct 2018 15:26:22 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id u12-v6so6352371pfn.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Oct 2018 08:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=5tdJe2CzvTm/8PGbEb6Ra6erwEMukx0Sx7DSk3cx5PE=;
	b=Vd16TgzS4bYR2BUy7BDNHcTL7xzIi8bSiPGOBugsxBcQHDMtGvDA0nEN8lO3j1919W
	zGEqgI9y8vBLzxznMkascaBQuytXEwpwtFICxKW/eAuXUiXSqzFnmnoOergdwe1VRffc
	xc3Ql51M8jMiMNHHMoeLwrksaEQtPNvfuRlfDixP9cG44jmBPE3oFBeNuIck6UoSVuEw
	MYgmJSX/6UTyzCXP5zoFW2CurK0ngFoDa8sUXbaCJVQYreq5euLe4AllsS1DS6J1qMXP
	C7A/9Y3CvlWqxTC5a6ch00AI6Mn+0C35ZW7z64p0DJgiC3dy/33R4zIFnEHgKbxYAdie
	x/bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=5tdJe2CzvTm/8PGbEb6Ra6erwEMukx0Sx7DSk3cx5PE=;
	b=ulmAlbSrro0pG117qvC1trfQMYEra0Ce9kFY580ko6KKNQwkZPEO9+mgfT2Dt9HViT
	pmxAuR5rEKqjgf3Y457C2EEis3BPLOcvBT0GZjh7T6eJM3QjmX6S4iYTdvWa5SAo2qsZ
	8Koh3Iuf+MDSOsKFqIwxHmhezCnGCKi/+3WNMTTna0lk4R0wLr6KJ6pQYQY7f3pGqvin
	bYMHMiy/WwSFPMPakFC4Na+K2gzhJ5gbv9NJMVUstTfnCEWLXJ2aR1ee2yFCJuE59H9K
	FGRYA8OZFoNCOELeueusVfAC2BseGddVw9gvkI9riYCVz9uxKdu+tA1bmoppnQUCAN1v
	YIlQ==
X-Gm-Message-State: ABuFfojz0CVXRc4ylPp11xO9lzScFZ31kTHfS5a/KuDKAj0PK9nCeg/I
	IFVN/iyI6eJ5Pf4xgBuAgOs=
X-Google-Smtp-Source: ACcGV63jpybSzs5SIdp+983R3yUrHH8MOshxRiH3qA+Nee25e9PDm23Nnwi44c8Xnd1SsL3V2aIwvA==
X-Received: by 2002:a63:f314:: with SMTP id
	l20-v6mr5781912pgh.407.1539357983626; 
	Fri, 12 Oct 2018 08:26:23 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:1074:2cb7:7274:2f54])
	by smtp.gmail.com with ESMTPSA id
	x20-v6sm3525729pfe.131.2018.10.12.08.26.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 12 Oct 2018 08:26:22 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Fri, 12 Oct 2018 08:26:16 -0700
Message-Id: <1539357981-3675-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH 0/5] Make meta-oe pass again
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
X-List-Received-Date: Fri, 12 Oct 2018 15:26:22 -0000

There is a yocto-check-layer regression in meta-openembedded
do to new packages being added.  These changes make meta-oe pass again

Armin Kuster (5):
  directfb: add x11 to REQUIRED_DISTRO_FEATURES
  vlc: add x11 to REQUIRED_DISTRO_FEATURES
  directfb-examples: add x11 to REQUIRED_DISTRO_FEATURES
  blueman: add x11 to REQUIRED_DISTRO_FEATURES
  blueman: really belongs in meta-networking

 meta-multimedia/recipes-multimedia/vlc/vlc.inc                        | 4 +++-
 .../blueman/blueman/0001-Search-for-cython3.patch                     | 0
 .../recipes-connectivity/blueman/blueman_git.bb                       | 3 ++-
 meta-oe/recipes-graphics/directfb/directfb-examples_1.7.0.bb          | 3 ++-
 meta-oe/recipes-graphics/directfb/directfb.inc                        | 3 ++-
 5 files changed, 9 insertions(+), 4 deletions(-)
 rename {meta-oe => meta-networking}/recipes-connectivity/blueman/blueman/0001-Search-for-cython3.patch (100%)
 rename {meta-oe => meta-networking}/recipes-connectivity/blueman/blueman_git.bb (95%)

-- 
2.7.4


