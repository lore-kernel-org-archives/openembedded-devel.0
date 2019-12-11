Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
	[209.85.128.44])
	by mail.openembedded.org (Postfix) with ESMTP id AB1F77FAB2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Dec 2019 00:08:52 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id p17so5121066wma.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Dec 2019 16:08:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=+MP3CkRZZrqSKJdtPs3dKHd83XHQBoh4czm/LNzVrOA=;
	b=uPYPk/ZU5MPmunjM2rMHrw7eYUGVwig2BVL2BmYCSQ1qJ8KMN2RPisuOrmdGee2WZI
	MGTR7/AMnY7m5A5wBWMmeiCBM8gy6Mvake8HLptxjywLPYgc1XVPWgvVQX13O8Vqnx1S
	mY3qyMAdEtyHD478ur+UTZRp++54/Wkn/CDgRe9VGqHRkqGYyhLc9PeTMSX/dVAjNlat
	S9j0+NKgmWdrhwvaL0WuJeXacPQYI/8JRizzPXjMh6CVmWOCqu1pSALc69GtpxOhhcET
	XyWtPgJuXsqxnoeDxtDdmHNUDYP9NtF/dKnbiZ8fZZnZdNO0PBaPEIuhr1BFDw0f3phg
	hT2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=+MP3CkRZZrqSKJdtPs3dKHd83XHQBoh4czm/LNzVrOA=;
	b=gnr4EmTA99vRHbdEryAnpJ18W2bc1du78XwUAKBIuR0XKySjgJPnaUYnpaeHLT6USB
	l8tncJiZmEg7yMJ7pHy0J59If1Z2LgeAOertiL0dZW32w5QPvH2lubzxJlTP6vSQXioq
	pRuRXtGdId4/iyqmt1BoH/EgvUPBk9p4sCiV33WvcOnYVUdcxPIGCBs/2j0dZaVb1hOL
	xDfkl3AvqKslWvHexzZFXcPElrVP3blguzicXlNhlGSEVC1o6c+79UPyfOFlghUOCPyO
	qjX+GEPb5TGHoUk4038J/NVtQkt9PWMVr6/bCIqwBEfnHJ2/7sKO6PVipLpxbRibMxlc
	FPkQ==
X-Gm-Message-State: APjAAAX+sleIlE3sbeQFW86SEpg169kDZ4jG3JJ6g8o7u8eWwO0D4a9z
	fl4Rt8G+8bJjqdVSzEMmTtqA6kjA
X-Google-Smtp-Source: APXvYqzUUPs+8t+X7mYftWz8xjC7ZzrREQgcEb3V/8UEVqDCZ9qNoPQOTjhonlNG2rvU//FcxSB0Cg==
X-Received: by 2002:a7b:cb0a:: with SMTP id u10mr83151wmj.104.1576022933148;
	Tue, 10 Dec 2019 16:08:53 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F05A278D51D7E1425A5C61C.dip0.t-ipconnect.de.
	[2003:f0:7f05:a278:d51d:7e14:25a5:c61c])
	by smtp.gmail.com with ESMTPSA id h8sm163481wrx.63.2019.12.10.16.08.52
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 10 Dec 2019 16:08:52 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 11 Dec 2019 01:08:42 +0100
Message-Id: <20191211000845.13166-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH 0/3] GNOME follow-ups
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
X-List-Received-Date: Wed, 11 Dec 2019 00:08:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Andreas Müller (3):
  accountsservice: fix build for systemd not in DISTRO_FEATURES
  gjs: exclude mips build
  gnome-font-viewer: fix copy & paste typo in SUMMARY

 meta-gnome/recipes-gnome/gjs/gjs_1.58.3.bb                    | 4 ++++
 .../gnome-font-viewer/gnome-font-viewer_3.34.0.bb             | 2 +-
 .../recipes-support/accountsservice/accountsservice_0.6.55.bb | 2 +-
 3 files changed, 6 insertions(+), 2 deletions(-)

-- 
2.21.0

