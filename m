Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
	[209.85.215.180])
	by mail.openembedded.org (Postfix) with ESMTP id B0BFF6C248
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Mar 2019 19:01:05 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id b2so14828573pgl.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Mar 2019 11:01:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=t8sdYMBsPvpGcR1DTh1wvubNTJrqZzfCyD43tC0owZo=;
	b=VFfWwNfQ1eBJh9egoFrpVdx65y5u3s0W7kCA7qI6NpqDG828O8ClIQCBX1CisGc2lv
	2vk8ND+Tn35jnvvF0s5XsvKIElJ7y/SGsAMXjFYI0uCuSdOx8ngL2ETBV+aWC//TsDyJ
	zw1gDuSNLM/lh1jh0GaoylNTfRTDbyU0DQEKek39MkoXhcrvq1zJHP/UaXzlManfXZoA
	c/Vo+ReTFZhmo6JiRtxQH+Hn2mM143SdDGmM3DI5BZAOyNhYN2MdT1rGBgmhGctMiIqo
	3CkpPxbT9DwyCTR8gfCLK+qQwmygDjYyawdySQRnofGyesfuzSc5V7vKoBLVa8wtjU9/
	phfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=t8sdYMBsPvpGcR1DTh1wvubNTJrqZzfCyD43tC0owZo=;
	b=K0IXyEqf+OqeMtgsPzz+FoEp8+D+mrmHGAn5emPs6JpKdzGnHS5OAU+Bc2qb0yQY7g
	ph/JxAV1LUFie358S+zVI+Ez5uXCxeRM/Yf1iC1xZIpVwwgUdOCv97Bz1Do3UJmRLh28
	EeRRRYbM8rpR1W+PsetPPPRBArq+suDiHm4MSk+cgV8MddpH6f3pO8AnYlz00zSy09WR
	AI9fHbbFy7zOLYHnx0W91JQiCEMx05+xo8k55V6Au48yOadoF2qnLS/FA6H4tzOPsRdv
	YBOMjgxQql44BRj8RWIFxl5Rw59V5nH1K5GOAjv+1S6HGK4EVhU4Mw4mdj0Ve8E2elSO
	4m8Q==
X-Gm-Message-State: APjAAAX5K7bohfjEcGti8dMqyi6iiY+DBXcV0e/22TVoUDGPaK4kLk07
	oLcZJ4lo3jf6Ir9rpMc5Wv0kYGr5
X-Google-Smtp-Source: APXvYqwS8oxXKxuoVN8p3flCa3/FKuadKi934jlQhkPFeMQajN/f1g7pghDfZTeh9aIfsBwIJ0PR8g==
X-Received: by 2002:a17:902:aa87:: with SMTP id
	d7mr19643072plr.146.1552071666170; 
	Fri, 08 Mar 2019 11:01:06 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::3401])
	by smtp.gmail.com with ESMTPSA id
	u18sm13933654pfa.176.2019.03.08.11.01.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Mar 2019 11:01:05 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 Mar 2019 11:00:56 -0800
Message-Id: <20190308190058.18583-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [meta-networking][PATCH 1/2] miniupnpd: Upgrade to 2.1.20190210 release
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
X-List-Received-Date: Fri, 08 Mar 2019 19:01:05 -0000
Content-Transfer-Encoding: 8bit

Fixes build with kernel 5.x as well

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{miniupnpd_2.1.20180706.bb => miniupnpd_2.1.20190210.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/miniupnpd/{miniupnpd_2.1.20180706.bb => miniupnpd_2.1.20190210.bb} (92%)

diff --git a/meta-networking/recipes-connectivity/miniupnpd/miniupnpd_2.1.20180706.bb b/meta-networking/recipes-connectivity/miniupnpd/miniupnpd_2.1.20190210.bb
similarity index 92%
rename from meta-networking/recipes-connectivity/miniupnpd/miniupnpd_2.1.20180706.bb
rename to meta-networking/recipes-connectivity/miniupnpd/miniupnpd_2.1.20190210.bb
index ff40daaac9..302f5072d9 100644
--- a/meta-networking/recipes-connectivity/miniupnpd/miniupnpd_2.1.20180706.bb
+++ b/meta-networking/recipes-connectivity/miniupnpd/miniupnpd_2.1.20190210.bb
@@ -15,8 +15,8 @@ SRC_URI = "http://miniupnp.tuxfamily.org/files/download.php?file=${P}.tar.gz;dow
            file://miniupnpd.service \
            file://0001-Add-OpenEmbedded-cross-compile-case.patch \
            "
-SRC_URI[md5sum] = "a84b3647c871802abeccfc2771e8db21"
-SRC_URI[sha256sum] = "fc2d2fd044d8c3f8d02b63d70489bb35ece836a4fc1b6386865ac8fbe8d8b006"
+SRC_URI[md5sum] = "03b00c27106835e728a3b858ecf83390"
+SRC_URI[sha256sum] = "1aaecd25cf152d99557dfe80c7508af9cb06e97ecad4786ce5dafb4c958d196b"
 
 IPV6 = "${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', '--ipv6', '', d)}"
 
-- 
2.21.0


