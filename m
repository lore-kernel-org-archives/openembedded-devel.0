Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id 1A05173243
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Sep 2015 08:59:44 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so135981706wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Sep 2015 01:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=STR/wrxX356xE++F+4pytrwfS6FyAeLb4sSEjCYsNPQ=;
	b=aYlza8x1WFSU2UeLX0R++3hI57FheMaHrDzHltEHeoMeFD9OKYTK6Objp+7cUayMhw
	6HD4N0eCn2ujitQKD6tVBTSx3BGcJmVZIpqynd1JQdCcPZ7hTDF5P2l8Oq1J9eXTgNFQ
	5ymA0ZVJYno7DJn62psxtlV99W7jcIUl4uw3i5pPHbAxnzPWNtNUt14E+8pWaIRcdjWx
	LM0+2+wq2fcr/frPrPm6uu3HffvJU6reMmeT+zM2jYwyByvER/81dJVsseywRhi3tLlV
	7mvt3zjDsfLATuCBhzIZyOxXCunpas1wzChcUU95A8kdstZVyDbV1v2n22gZy99j5LY6
	3mVg==
X-Received: by 10.180.89.41 with SMTP id bl9mr11838571wib.85.1442825984577;
	Mon, 21 Sep 2015 01:59:44 -0700 (PDT)
Received: from chl500346.neratec.local (mail.neratec.com. [46.140.151.2])
	by smtp.gmail.com with ESMTPSA id m4sm22970274wje.5.2015.09.21.01.59.43
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 Sep 2015 01:59:44 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 21 Sep 2015 10:59:32 +0200
Message-Id: <1442825975-8950-1-git-send-email-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.4.3
Subject: [PATCH 0/3] libgudev fixes
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
X-List-Received-Date: Mon, 21 Sep 2015 08:59:45 -0000

Exclude usage of libgudev with older systemd versions providing libgudev as
well.
Fix networkmanager and modemmanager to use libgudev instead of udev.

Adrian Freihofer (3):
  libgudev: exclude use with systemd <=220
  networkmanager: depend on libgudev not on udev
  modemmanager: depend on libgudev not on udev

 meta-oe/recipes-connectivity/modemmanager/modemmanager_1.4.2.bb     | 2 +-
 meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.4.bb | 2 +-
 meta-oe/recipes-gnome/libgudev/libgudev_230.bb                      | 2 ++
 3 files changed, 4 insertions(+), 2 deletions(-)

-- 
2.4.3


