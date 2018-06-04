Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id F00FA74A9F
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jun 2018 02:39:38 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id c9-v6so10953579pgf.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 03 Jun 2018 19:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=JRtwrfIEogMy5vMhgDkwnwK1vB7cAj+Do10c/R3uQbg=;
	b=QRg+WY2X83hMV10XfbH6BNN4bzLsXx4jjq1Ilwj7/C+jT0fTdKVSPfwVSxXPfuCixa
	c97gifzTX5dCgH6t9NSUoVPpghqTHBiNrZ3IJyquBxbd3fq7r7jHNjWL4PTzxSNKKsmV
	SOU0SVP/LDK5baGydD/cS/DhYfDPbA8xAWdtxa79FZPya5frPbcU0ZgX1M+fHgg3jjjz
	8XAyMbhVTPjoHVki4hguktR+NEr8iMv97WT0qEuZhrFBp2wrBInvdvMkoDpIEKXe6kIV
	UIyli6fnmQYKhkvGycf5Ji1ng0rJe/URcuIxwzfDshZV+WnNmCSq21SNneAMB+1I4BME
	Xy/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=JRtwrfIEogMy5vMhgDkwnwK1vB7cAj+Do10c/R3uQbg=;
	b=nUTbSgyBd1JfdOXFtHrLIp7gb9svk+2t1k2UBRVGcGYmTN52xNxZncxsNTJ083tKU2
	Eht1B52dQvJ1q/YN4HUb2BE03Dw6Obxn3e63sJM0cbieCTmMI06QGtkbcrRTJ9UFWPNU
	ldxiSedwdBbVrSBh4dOGyZrVj2X8jq+S6XTERixrRQv6hRS2Z6+9ombWi4tKlOiSXPHK
	iRH6opR4ryeSicTa95iXQN3xEqWP5IkDNMB16qI+8encY+e+sbphaHfat6R3QSfH2xU5
	GxZtJk3kFymKm9tJp6PYKwD0EdgYmpBCZRkUdtlzqSL/UAd7ty2s4STYlByacZaYoa31
	A16A==
X-Gm-Message-State: ALKqPwdtUia0rkoy0bVvWu4hMcLzvn1JXDR8jEZ5VME4svKVXbgvV70q
	K4e5JyMuP5vKDAoWIVLMLZc=
X-Google-Smtp-Source: ADUXVKIiBMZe2HJIG3nq4iYzSflxC4PiYo2enRKw/sDd9GB5jxgn2caxlTCFUPuD6o21DCjftGdjfg==
X-Received: by 2002:a63:64c5:: with SMTP id
	y188-v6mr16136383pgb.37.1528079980050; 
	Sun, 03 Jun 2018 19:39:40 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:f1bd:c539:22b:bbf1])
	by smtp.gmail.com with ESMTPSA id
	m11-v6sm12069697pfk.42.2018.06.03.19.39.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 03 Jun 2018 19:39:39 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Sun,  3 Jun 2018 19:39:30 -0700
Message-Id: <cover.1528079821.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 0/6] pyro pull request
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
X-List-Received-Date: Mon, 04 Jun 2018 02:39:39 -0000

please consider there change for pyro

The following changes since commit dfbdd28d206a74bf264c2f7ee0f7b3e5af587796:

  sip: update recipe to 4.19.2. (2017-10-16 14:43:15 -0700)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib stable/pyro-next
  http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=stable/pyro-next

Andre McCurdy (1):
  dnsmasq: update SRC_URI for versions 2.69 and earlier

Armin Kuster (3):
  wireshark: update to 2.2.10
  wireshark: Update to 2.2.11
  wireshark: Update Package to 2.2.12

Ismo Puustinen (1):
  opencv: fix runtime dependencies.

Paul Eggleton (1):
  dnsmasq: upgrade to 2.78

 meta-networking/recipes-support/dnsmasq/dnsmasq.inc   |  4 ++--
 .../recipes-support/dnsmasq/dnsmasq/lua.patch         | 19 ++++++++++---------
 .../recipes-support/dnsmasq/dnsmasq_2.76.bb           |  8 --------
 .../recipes-support/dnsmasq/dnsmasq_2.78.bb           |  8 ++++++++
 .../{wireshark_2.2.9.bb => wireshark_2.2.12.bb}       |  6 +++---
 meta-oe/recipes-support/opencv/opencv_3.2.bb          |  2 +-
 6 files changed, 24 insertions(+), 23 deletions(-)
 delete mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq_2.76.bb
 create mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq_2.78.bb
 rename meta-networking/recipes-support/wireshark/{wireshark_2.2.9.bb => wireshark_2.2.12.bb} (92%)

-- 
2.7.4


