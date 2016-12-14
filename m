Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wj0-f173.google.com (mail-wj0-f173.google.com
	[209.85.210.173])
	by mail.openembedded.org (Postfix) with ESMTP id 992847721D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Dec 2016 22:49:55 +0000 (UTC)
Received: by mail-wj0-f173.google.com with SMTP id tk12so50778049wjb.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Dec 2016 14:49:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ijWMeW7aCRz5oIQiT5qBC35LHg0TyIbDaCsSP4KHAJs=;
	b=XOxrysMu/5m5YCxI8t9AsGxe2elWjehr77EYEijoD7c+qP7UmsLQCQibwBH+udawkx
	/6M7Mp+U+Y9L5g2hN76qphIqLbcVtWoaL9pg823+76GyvTcw0qBQJ35dehvqujhNqgv+
	6sHbHRTsQYA7kTRVTUpyFFxMkiop1ABAI/n2fb0WrujX//yCqTvQ5CedpwKRbDiHQFx4
	tg29lenhcdbNmAXj3lc0aEEbzc3+0/A53p0PinXxMH6FKUT1mWxFz21mQtcu+S+qIgKx
	12hI1/+z55BQynAEGpNaNId5itcpU8s7B/5KybOU4IHfv0b7g89/PeqyQ2zmDUAonp2X
	Z+vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ijWMeW7aCRz5oIQiT5qBC35LHg0TyIbDaCsSP4KHAJs=;
	b=D0/F1LJXrAvVSmt/t7PPZuNxYoZTCufZnmGuclWcMFOfAGcv50+oRW9FxaUB6LxdrV
	P522t7uk+b544A/xt/ULq25WGBk61SuqAiVYx6sBZ7MWo0LYcVaeOlTnbG6pF4YmQjY5
	fAyAmgjVeixavg7pusPqd3nEhFMPmnkB3ynPGrS6fsuXBbF80o8ZFYvSyQolZ3WUCtw6
	eUstgvn2RUFI0sWtd0KCQV9Y2XH/qDoPgtRMxtmsU43Zyd4xQe7krKl+pfk3y2Qv2Ohk
	imX5y7+wYAkOZsF4BSP3MwV9OKU6G96aH6N+eOs/gnldWuikpu0a3okn/Uxsgogh0zvu
	hEnw==
X-Gm-Message-State: AKaTC03TWRUX6o6q8nr8EMHFbYiDt8YmbKNn5HL3wrN158YmeEi+IYNe9PCkWb11cZSd2Q==
X-Received: by 10.194.171.200 with SMTP id aw8mr88595675wjc.79.1481755796110; 
	Wed, 14 Dec 2016 14:49:56 -0800 (PST)
Received: from localhost.localdomain (p579CE070.dip0.t-ipconnect.de.
	[87.156.224.112]) by smtp.googlemail.com with ESMTPSA id
	d64sm9625699wmh.3.2016.12.14.14.49.55
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 14 Dec 2016 14:49:55 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 14 Dec 2016 23:49:36 +0100
Message-Id: <1481755778-16443-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
MIME-Version: 1.0
Subject: [meta-browser][PATCH 0/2] firefox fix build on oe-core master
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
X-List-Received-Date: Wed, 14 Dec 2016 22:49:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* recent 'use system's nss/nspr' broke firefox
* to build properly patch just sent to oe-core is necessary [1]

[1] http://lists.openembedded.org/pipermail/openembedded-core/2016-December/130211.html

Andreas Müller (2):
  firefox: fix configure with oe-core master - there is no nss-config
  firefox: use pkg-config to find nspr

 .../firefox/0001-use-pkg-config-to-find-nss.patch  | 47 ++++++++++++++++++++++
 .../firefox/0002-use-pkg-config-to-find-nspr.patch | 37 +++++++++++++++++
 recipes-mozilla/firefox/firefox_45.5.1esr.bb       |  2 +
 3 files changed, 86 insertions(+)
 create mode 100644 recipes-mozilla/firefox/firefox/0001-use-pkg-config-to-find-nss.patch
 create mode 100644 recipes-mozilla/firefox/firefox/0002-use-pkg-config-to-find-nspr.patch

-- 
2.5.5


