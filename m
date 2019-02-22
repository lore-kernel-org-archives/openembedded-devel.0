Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
	[209.85.128.48])
	by mail.openembedded.org (Postfix) with ESMTP id 04AE97CC0C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Feb 2019 17:30:05 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id v26so2690620wmh.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Feb 2019 09:30:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=QELnbAvjZSwx1BweYinJ42OK0vAJ6XDLAX3SxdcBfZs=;
	b=jwShEvCecds7D2nYAFYY/guRe/5ezdgfuMDNp3f+9Pv1K9qYFC5z0+rxjY2wOIYmLM
	T/BtyEIvhvPeG3se69yLRvq8JrBEZVJB/pSudLMIBPBOhF5TJR7T6zzfDDpTJwTgjODd
	qqhWqu+Sr/wuhnj3l2JxmE+Yty1qq0safvyOb9c8hdNRN2Y4gvWjiSlW9umEO0hp1S96
	WBMbBEcLuhoMMHkfoNdXVdum1saXDQbAVdGhfJbGehSKiy+vyzNFuomo/HaK6tOKteNm
	80vWVcMNEY1fiBP3RHPP3LXuMV7QbsRJbZ/m4nSOo8uieOAV5UODV5hITu4WL/XR4Lor
	4pOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=QELnbAvjZSwx1BweYinJ42OK0vAJ6XDLAX3SxdcBfZs=;
	b=qwUE62Tz76ZPzqay/Kzn+vum2Hu9kKsRSTtrOtvsK//VODyPLiI9Osehq1bMalWIO5
	SAlAZyMLXD1KX1NhBBthMZ0+fPorEVwAqXnOrp/7BonNEau9/+FcnxiQ05o+q+7J6neL
	9zG+eal6Bq/MA3+bPLBDqs4OYNRMFCYi5SDKHmnpUYtu3b/cMs8/uqIP7k3uJ3Jx9fVU
	jeQJMT84hBM5m6awaUYafpK9R6R8Kz8VbY3qImDwp8ignpd1YNjLTiH53Sfep9SQYiWG
	QaAemWMgWpzACP0OJ6ZV2MIy1MH0G3KiZcsuqh9LW72UJAqHNGCm8mku8W3t0+6mWJ+3
	BpWg==
X-Gm-Message-State: AHQUAua31lPJZrunfoZFPi3HDMxkd+gNjZY6ZtrJ7zfsuMtQeI2Z3son
	C206MaxXtdEfr5X8Kr+aYPyfQph1ew4=
X-Google-Smtp-Source: AHgI3IYycPTylOvpw7vmBMtNY02kmdluS3feLqVssbWTCYUBmH4UFQj998o90nAaC6mx0IIrjSSG4g==
X-Received: by 2002:a1c:1b4e:: with SMTP id b75mr3364644wmb.88.1550856605815; 
	Fri, 22 Feb 2019 09:30:05 -0800 (PST)
Received: from localhost.localdomain (static.8.26.4.46.clients.your-server.de.
	[46.4.26.8]) by smtp.gmail.com with ESMTPSA id
	q24sm1337597wmq.16.2019.02.22.09.30.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Feb 2019 09:30:04 -0800 (PST)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Feb 2019 18:29:45 +0100
Message-Id: <20190222172949.3661-1-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [meta-oe][PATCH 0/4] A few fixes when trying to run yocto-check-layer
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
X-List-Received-Date: Fri, 22 Feb 2019 17:30:06 -0000
Content-Transfer-Encoding: 8bit

I was trying to run yocto-check-layer script and it has caught some issues. 

Note that I was able to get a PASS status for meta-oe, using two additional patches 
from Mingli Yu <Mingli.Yu@windriver.com>, i found on the list:

upower: add REQUIRED_DISTRO_FEATURES for polkit
udisks2: add REQUIRED_DISTRO_FEATURES for polkit

Nicolas Dechesne (4):
  meta-oe: fixup LAYERDEPENDS to include meta-python
  polkit: add REQUIRED_DISTRO_FEATURES for polkit
  packagegroup-meta-oe: fixup package that now require polkit
  udisks: add REQUIRED_DISTRO_FEATURES for polkit

 meta-oe/conf/layer.conf                                    | 1 +
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 3 ++-
 meta-oe/recipes-extended/polkit/polkit-group-rule.inc      | 3 +++
 meta-oe/recipes-support/udisks/udisks_1.0.5.bb             | 5 ++++-
 4 files changed, 10 insertions(+), 2 deletions(-)

-- 
2.20.1


