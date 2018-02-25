Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id BF4CF7889F
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Feb 2018 21:33:58 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id i14so524027pgv.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Feb 2018 13:34:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=ADZLKa6D7LVM6/AQAHAOmFfbd5miO4uxihdsXkTCAhU=;
	b=hBNgPL0QAs4II0jYjaaFett7hUGKxYLYJQ8v5PrD9VcGm1IbOcpnc+3K1kPkndkvin
	GCQar9OOlXpDZi/pg8k8ISJeGlvazlwD6o6Ycv5MlaMgm2v5CiiTsPE/8paDUQf7D7JI
	nE1oAUFUCZOKihDFAhGWAqzkBm5JZCVbruxjRVuV5RMv+1IAKD1cTCuikSMAI2Bg9no8
	CpqRDVeESlbSHizCz5OZ+aIDszGTHLwnVfYZh41m5bT1Gxn7G6eZhfoVqn4k1u+004ZM
	Xp99TKo6OoHF1HKzTkaiEadgy4j4veN1WOa0+JTbV6ofYG609oB4mVnZ9j/J+XEvB3SN
	66Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=ADZLKa6D7LVM6/AQAHAOmFfbd5miO4uxihdsXkTCAhU=;
	b=oDPtlYffkHUAKCPLHm8JTZMsTLfO7krV3Lm/itn1QFg0vFw/Y7WDVLpUSCIiL/SovZ
	yKyBZa6nKKd+LnMwTjXXLA20a2+qpDNlvlhEqhncmk+pElrVCzL5pMhE6k+CgDxHIGxY
	7V2hcFKs2k9IVs0SEJfhoAR7irLu3DzIIZlWtrXl2gsYmG5dWM7uLG4srpc4AZ66/x6/
	LA1mIOIbeCR3KdhrALnls2gPXBH97+7cQDEvJVajCS3BUJ/k8GFhelPXZ+osPcoCE8nW
	/spIAaiiINcTwzlhQIyQBJPlyCAcQw5DD0cMdDF34Q7T3++MnEMkgolLo1fowA7mRyRZ
	SogQ==
X-Gm-Message-State: APf1xPAfeJyzDByaaAPl0Pl4qKASPt6xFbkbZvxXDhf+tIK+vA05UV8Y
	3IjIGldoYq+JjMB5GcBQ0xRtFQ==
X-Google-Smtp-Source: AH8x225OOdJ/uUT7KNEL8rvhfRn1AJlDbbx8BRCP7r/DadRLGJrwn9ak2SkO4MZIwnxJkMjXuLSsWQ==
X-Received: by 10.98.229.21 with SMTP id n21mr8358687pff.158.1519594439913;
	Sun, 25 Feb 2018 13:33:59 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:ad95:2a34:2e02:2fdf])
	by smtp.gmail.com with ESMTPSA id
	64sm12014600pgj.39.2018.02.25.13.33.59
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 25 Feb 2018 13:33:59 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Feb 2018 13:33:21 -0800
Message-Id: <1519594406-24490-31-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1519594406-24490-1-git-send-email-akuster808@gmail.com>
References: <1519594406-24490-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 31/36] lsscsi: move to recipes-bsps
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
X-List-Received-Date: Sun, 25 Feb 2018 21:33:59 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/{recipes-extended => recipes-bsp}/lssci/lsscsi_0.28.bb | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-oe/{recipes-extended => recipes-bsp}/lssci/lsscsi_0.28.bb (100%)

diff --git a/meta-oe/recipes-extended/lssci/lsscsi_0.28.bb b/meta-oe/recipes-bsp/lssci/lsscsi_0.28.bb
similarity index 100%
rename from meta-oe/recipes-extended/lssci/lsscsi_0.28.bb
rename to meta-oe/recipes-bsp/lssci/lsscsi_0.28.bb
-- 
2.7.4


