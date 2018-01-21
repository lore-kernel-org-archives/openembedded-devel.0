Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 16D8778493
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jan 2018 16:21:26 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id c2so15147943qtn.9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jan 2018 08:21:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=7klo7mnGPRPjrt9gOASUgA4yRn9srPpbLGKnaRjOKyg=;
	b=hLBwoePNMHYmAffzxkhMb+sBDtDjdid9kFGzCPyVUcgAOkP247x1B6+cddmfh6iB7T
	XHOrpetg0wLWgrctht1ySTlkD3kWyHr22hu38EUjyIq9b/ekN9Gs3dZnID6c3+2IfKvg
	LAmbGQnIcIZHSpLH09nOELuOcphvCaUBwKMdhI1lRmsgBIBJsMfjBgbDRxoGlNj2rkt5
	YBSWbhNzd7n85sUS3zjMKhuE6GObkz4aey74qTEtOZ52beP2yva2K8a6Km/guTCRSdBF
	NuUNgSsn6Bx4HXSo/msjP54bp9EVeuYjcGWh37owSDY/kFzmo5agERzn0YsPNwbA2njT
	BJLw==
X-Gm-Message-State: AKwxytemA7GPxWkrUIZ2aZcujr7fERlbIjXI9UdiA9QUMOycXTqUrB27
	EsNLVrqzeBijWltd7h6LGpI0ApVU
X-Google-Smtp-Source: AH8x226puBc5gXzifFDfdV4taYAyTgwwWunHfl9ShwfEzhXAkcEuElUo6CK35dGuaWjcdwwnJJML5w==
X-Received: by 10.55.143.193 with SMTP id r184mr6121351qkd.193.1516551687176; 
	Sun, 21 Jan 2018 08:21:27 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	g103sm10121879qkh.75.2018.01.21.08.21.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 21 Jan 2018 08:21:26 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 21 Jan 2018 11:20:35 -0500
Message-Id: <1516551637-32255-9-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1516551637-32255-1-git-send-email-derek@asterius.io>
References: <1516551637-32255-1-git-send-email-derek@asterius.io>
Subject: [meta-python][PATCH 08/10] Remove deprecated python-readline from the RDEPENDS
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
X-List-Received-Date: Sun, 21 Jan 2018 16:21:26 -0000

The python-readline package was merged into core as part of the
json manifest migration

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-connectivity/gateone/gateone_git.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-connectivity/gateone/gateone_git.bb b/meta-python/recipes-connectivity/gateone/gateone_git.bb
index 8b2a192..4577873 100644
--- a/meta-python/recipes-connectivity/gateone/gateone_git.bb
+++ b/meta-python/recipes-connectivity/gateone/gateone_git.bb
@@ -69,7 +69,6 @@ RDEPENDS_${PN} = "mime-support \
                   python-pkgutil \
                   python-pyopenssl \
                   python-re \
-                  python-readline \
                   python-setuptools \
                   python-shell \
                   python-simplejson \
-- 
2.7.4


