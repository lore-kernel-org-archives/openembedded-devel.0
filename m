Return-Path: <jonatan.p@gmail.com>
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	by mail.openembedded.org (Postfix) with ESMTP id 9B874605F8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Feb 2020 12:43:55 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id u2so2164241lfk.13
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Feb 2020 04:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=QbSiwZSJrmRQY2/mPvYEwcfbzun8tOTiBdKEGPUDi3M=;
	b=nXAZIvzECN3wc2iM6i2XxzUTyUy9yMDYiVnu0ue4rITTD9zsZasPCTr0v2h9ejDo9w
	DdtjuwI1WCy3UmmjliRfPlN3xdTv08Mhun3NebKIb05pBK410BVDTrloSZDNH9VhrxnM
	ISVg4WLUdwHi2AkAd/eUf/rhyAlbsSktih9eGVN3T4G8ty5sZpsffRnj1t5aBAIJoUNC
	eRlq/nsnp2LyTe0dTuL5yIw6g07OshSHG35BqgMEN+THnMXtgXMjAoaN5aEIpfohVHNf
	dToDrQw8IGbVCiPWbqgIO6FVyi/iEmH2gwe8hUVabMnIY/BM7AEOz3iUsrwZTozmK/O/
	0BTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=QbSiwZSJrmRQY2/mPvYEwcfbzun8tOTiBdKEGPUDi3M=;
	b=qqkupnn0XPMhAqkAsJ9jkRHuuTpvzOm4ZtBfmQK2OyXWhz3N1OlHJClXVyAOdpo4rh
	EJ8XwQDxB0FF8crmB0ThzN/chsSe8NwEpRboPUmEMQbmFVnTMV6S9i7nfYmPq26RyFPt
	/ZBfC9fLk3DR8yKsBGriUBcYb6gYRP641jl7fEW94tXFSnhot2Tq+7scUC5G/CmnAbQO
	asb9XAaXjIOj2w/hPWdHKlLr1QQRRQmDqr3llaMuKB+fPLDnpbRXoy+JJ+E5YeZ/buEE
	wyWtGD0wI/7jTs4Yw07Yqy9ahZUAMD0raFJ4tNGJlFfyiJhm6ZkIFW6kJEHrbPppoXcd
	UMFw==
X-Gm-Message-State: APjAAAWWKVIFIPQcNMtDB0f5jESZRgpR2vKwqyO2d3UrN4Kzf4cvedro
	1GygeP2GcZ25utPAksxdBugRpexlYxY=
X-Google-Smtp-Source: APXvYqx2Mq1OZqrsf9oVjrGDPKrJdXtMBv6+eySfme6pnW03RrDI7WZ/Tf2OQymrCnvoNaGIV1zXgw==
X-Received: by 2002:ac2:4add:: with SMTP id m29mr24980379lfp.190.1582461834547;
	Sun, 23 Feb 2020 04:43:54 -0800 (PST)
Received: from localhost.localdomain (h-217-237.A357.priv.bahnhof.se.
	[81.170.217.237])
	by smtp.gmail.com with ESMTPSA id y7sm4520339ljy.92.2020.02.23.04.43.53
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 23 Feb 2020 04:43:53 -0800 (PST)
From: =?UTF-8?q?Jonatan=20P=C3=A5lsson?= <jonatan.p@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Feb 2020 13:43:23 +0100
Message-Id: <20200223124323.1892142-1-jonatan.p@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [meta-python][PATCH] python-h2: Add missing RDEPENDS on hpack and hyperframe
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
X-List-Received-Date: Sun, 23 Feb 2020 12:43:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Jonatan Pålsson <jonatan.p@gmail.com>
---
 meta-python/recipes-connectivity/python-h2/python-h2.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-connectivity/python-h2/python-h2.inc b/meta-python/recipes-connectivity/python-h2/python-h2.inc
index 42629c261..c457836b7 100644
--- a/meta-python/recipes-connectivity/python-h2/python-h2.inc
+++ b/meta-python/recipes-connectivity/python-h2/python-h2.inc
@@ -8,3 +8,5 @@ SRC_URI[md5sum] = "950b5a62a2a608dc4547a01edf99aa8f"
 SRC_URI[sha256sum] = "b8a32bd282594424c0ac55845377eea13fa54fe4a8db012f3a198ed923dc3ab4"
 
 inherit pypi
+
+RDEPENDS_${PN} += "${PYTHON_PN}-hpack ${PYTHON_PN}-hyperframe"
-- 
2.25.1


