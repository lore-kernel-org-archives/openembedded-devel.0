Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wr0-f177.google.com (mail-wr0-f177.google.com
	[209.85.128.177])
	by mail.openembedded.org (Postfix) with ESMTP id CC39B77E1D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Apr 2017 12:43:48 +0000 (UTC)
Received: by mail-wr0-f177.google.com with SMTP id o21so34968709wrb.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Apr 2017 05:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=AwLKq55Bytkm67U1PSglstxFCliMDQjiskHpak0ttlU=;
	b=Hbq5jtseyW5asNf2juo0VRLFjRdC5gQ3hakZT/szOFomqZUOEj8HXNfIKX3jNZQ2Ph
	nibpKbfvBDoKXxJZz/vOy1BiCr1b9YJuwCL3UexObrhOVWZOIYMvbNycGQdbdzYRgKzV
	n+rPw7bKjrycfH4MG9mfr8HREy8YpnNupCKY/djVZyVgHV7Asa3t4PlFAovYlag1Lgbm
	Lur3dq99gcCigXNxpaN3sOGIO2TXdDpR3b1wzv9n9uMFT/zIBTuarC/3FpU6fOgIdsCn
	gJNQmW/P+bLpCrnW/IPrNmqWGbWVN3YPRgB7YiVu8eOIMMuQ4ivcrQczfTYNtJKc9mh4
	LiQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=AwLKq55Bytkm67U1PSglstxFCliMDQjiskHpak0ttlU=;
	b=nIl/5NmFFHyTzZKf+Xu7ISDRjBSZrOrLuRNIQlSB7YzSnc2t+o35DeFn+JUzZos5GY
	5aqHvPLFsbDjiOcydlDyU2SRILfd3zZrG2m7x2dNWYcH0y8Cl6+febwP5le5RiSuYb6i
	FK9u6EMpW6SYKh0BXGwoGbVP26iM3C/zfDfMU39XdDFnZhrOaq2OU9EIkAPw/b02eUCl
	NcUaFYQ9tghycdFoRHZRdhMzPH4o4SrpVOLUjd8kx5KTbDenghj5piyyQzq4mc52Vst3
	NT0MtNbFKvnew6hHxzfciGmxXlGv1pGZdyoAiGb373rpTz5M25k7wkXAuyDtN4ggvc/a
	cQUg==
X-Gm-Message-State: AN3rC/7dK3dhn73v4MQvD/FkU/47mZLXaK/PSgrjh0+B5Foow5kex67W
	8DTn/4oh5ORm4MFZ
X-Received: by 10.223.168.23 with SMTP id l23mr2696066wrc.185.1492087428982;
	Thu, 13 Apr 2017 05:43:48 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	([2003:46:e911:f105:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	t24sm1842834wra.44.2017.04.13.05.43.48
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Apr 2017 05:43:48 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Apr 2017 14:43:21 +0200
Message-Id: <20170413124323.22507-1-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
Subject: [PATCH 0/2] further fixes
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
X-List-Received-Date: Thu, 13 Apr 2017 12:43:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

0001: slipped through
0002: Fix on top of master-next see [1]

[1] http://lists.openembedded.org/pipermail/openembedded-devel/2017-April/112283.html

Andreas Müller (2):
  openzone: make build and unblacklist
  mpv: fix typo in wayland PACKAGECONFIG

 meta-oe/recipes-multimedia/mplayer/mpv_0.24.0.bb      | 2 +-
 meta-xfce/recipes-art/cursor-themes/openzone_1.2.3.bb | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

-- 
2.9.3


