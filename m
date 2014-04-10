Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by mail.openembedded.org (Postfix) with ESMTP id DB4E6609A7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Apr 2014 16:58:26 +0000 (UTC)
Received: by mail-ob0-f179.google.com with SMTP id va2so4698519obc.38
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Apr 2014 09:58:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=8U3Pgp6VA2ypE8oFV5raSsbfQW5D3zwTvd49dnWxM1o=;
	b=VWKA8evTnzhIQH7Gk61UqTzWP03tSZ7mpIqbcAE+fy3p++vky9Wc5QNp/sYBWH/tpZ
	3pDWAIUV5Fv5MDn9NwYLNdNYGGW4MxnYP3ss1aOI/W8SV3L1aTpu4X+WrrM8+GiIL8WD
	bFtNM5s+r6eBHRQXiYg0oa1HTiiYppYDEiBzGYabtLdciHJJgnkD9Z4L4Ir1H6KsFxAX
	lcPC19GQJtsUo+YKp2eg4hp8le36Wc/bB/9UZ27vAEDAkD8hasP9L3rRrUg3MCL7kZh4
	oLINDMP5RzjpTdDeAaEGap4iNlXqq11AS6Va2467+pnOZzvIw4CKgxvh4u2dcvkwA+DR
	zaNw==
X-Gm-Message-State: ALoCoQnDHSRE4yMfUuEVXgsY3Iat/xdzE2lPv9VXm1IVwVwSE0rDt8mC1mfGmHUvA/xSTXDs1fvg
X-Received: by 10.182.33.6 with SMTP id n6mr14737310obi.48.1397149107617;
	Thu, 10 Apr 2014 09:58:27 -0700 (PDT)
Received: from openSUSE-i7.site (69-165-220-158.dsl.teksavvy.com.
	[69.165.220.158]) by mx.google.com with ESMTPSA id
	oz15sm19863136oeb.13.2014.04.10.09.58.26 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Apr 2014 09:58:27 -0700 (PDT)
From: Trevor Woerner <trevor.woerner@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 Apr 2014 12:58:16 -0400
Message-Id: <1397149098-1303-1-git-send-email-trevor.woerner@linaro.org>
X-Mailer: git-send-email 1.9.0
Cc: patches@linaro.org
Subject: [meta-oe][PATCH 0/2] updates for terminus-font
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 10 Apr 2014 16:58:33 -0000

In order to successfully build terminus-font, the xorg utility "bdftopcf" needs
to be available on the native host. This patch set adds a recipe for
"bdftopcf" then updates terminus-font to add this DEPENDS.

Trevor Woerner (2):
  bdftopcf: add recipe
  terminus-font: update DEPENDS

 .../recipes-graphics/terminus-font/terminus-font_4.38.bb    |  2 +-
 meta-oe/recipes-graphics/xorg-app/bdftopcf_1.0.4.bb         | 13 +++++++++++++
 2 files changed, 14 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-graphics/xorg-app/bdftopcf_1.0.4.bb

-- 
1.9.0


