Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
	[209.85.214.172])
	by mail.openembedded.org (Postfix) with ESMTP id 070256C0ED
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Feb 2019 06:18:01 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id p8so1214673plo.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Feb 2019 22:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=eB/mwSDlFWX8qoTakOUKIgMj/m7QNKIHGQi5UdpnbJo=;
	b=X/Pj4P0CNay5W9GP0dcnYoY7N/3aL2Iis2dY7h/7wIiBG99HEVr9W2zYpOlsoHosch
	vmAjD/PQ71kuDmNHu98FAjKkuj9lRwPXR/JYm0L6o4eJ30hrrML44kpZoUphkr3tiedM
	qbWNEOVXGuuajlJpggpbtUDWNSRtCJjXc3UUA5NXUvw4eNELiTjwQ0tXIa2/deV6qp8/
	TmRIXDmpAO1YaVDsuh9yi2FT4KQ1Q2C+sxnQLMzaMSTFEBhoZ7FtemJBNQ7+2xqBcu6S
	kloRw1EzUNWiPwhiyTaP0GICEchlijsJTHbJ4EoHYPfwLEd0z12XaJV/E/KzGpJUyrOr
	dcvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=eB/mwSDlFWX8qoTakOUKIgMj/m7QNKIHGQi5UdpnbJo=;
	b=FSQg38ZiRpBtTZlXZ+qLbdV6nJ6U4JbKXQcR/q5yo5FLrSUA9XaiYE0iScL3AWjp+v
	3N9a9xp9xLjKh8LC09jLMocwAhK35MUytMs7gkC8tQHfavOEh+4lECqsHMvtfwbCNs1K
	12NnZtDlVYOa6UIh2y7kzDJ78WfUCeq1YUQC6AdHWin0iyBjBPliecCZIQ/jt+L5coRc
	bAHDb5ANkPWTN7V43X1b2GsdgMpcooROqvH8m0NwRcqSRQz6MrGa/rf9jbIV1dmGt/qi
	pWRP/xoTz/q+68ZFhl2uUI/of/uHbN7cZxGfNKoT8iQ56Sy+mtwKdcyL0aLLJ9S7yk17
	J9ig==
X-Gm-Message-State: AHQUAuZ6trIkXqtvmWiXfXh/rCfVNRIRxmnZZ4OE0qPX+NkQcJoJctB/
	4onV5RY7eN7Slle6YhNGGgfdgVTg
X-Google-Smtp-Source: AHgI3Ibo3sxD/xFf87TUKAApdSvYVr5ukv2QY33BASZ5Yme56LC1gb5fxraQalZuQuzYDauAtKM3Jw==
X-Received: by 2002:a17:902:22f:: with SMTP id
	44mr20889064plc.137.1549606682633; 
	Thu, 07 Feb 2019 22:18:02 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::a005])
	by smtp.gmail.com with ESMTPSA id b2sm1139905pgg.87.2019.02.07.22.18.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Feb 2019 22:18:02 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Feb 2019 22:17:45 -0800
Message-Id: <20190208061748.21556-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-python][PATCH 1/4] python-gevent: Upgrade to 1.4.0
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
X-List-Received-Date: Fri, 08 Feb 2019 06:18:02 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/{python-gevent_1.2.2.bb => python-gevent_1.4.0.bb}     | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-python/recipes-devtools/python/{python-gevent_1.2.2.bb => python-gevent_1.4.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-gevent_1.2.2.bb b/meta-python/recipes-devtools/python/python-gevent_1.4.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-gevent_1.2.2.bb
rename to meta-python/recipes-devtools/python/python-gevent_1.4.0.bb
-- 
2.20.1


