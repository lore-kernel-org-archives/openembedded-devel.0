Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 0F69E783A2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Aug 2017 19:51:44 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id a77so4303297qkb.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Aug 2017 12:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:organization;
	bh=sQMp3QsnkvkG21SxA3wPE1tfYLTk/KS3o2DU0S18kTA=;
	b=ZmhLWxE68jiQqvYxwWM0GSOAGHeNkvObsW1K3y8FoiUeyz9s9k99gaqzR4kZyW0yOb
	8iN6jwjfA375Pn5b1i0WKGyXKA88/lrhgQT0niWu6SD4Nviuws063VqU7NXJxHnuVLOV
	9N9C17QP8pc/5JS8QOZRPtv0IQA2+PysPoELsVDamxFZvXiSCK7iVHfT4EddzNi38xB4
	3hivX7B+NWpyuAOJ43DIcLW5Vm5hfpvPWNC7RIaTFeTAdDHf+ZqJ59cYoxCH/82yRugB
	ngBf1yVu3eCJcvKXy5QeAprl4Idx2kH+cqzSV/fMG2OH5nVX8EBU3V0Zf7STeem6wwTH
	WMSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=sQMp3QsnkvkG21SxA3wPE1tfYLTk/KS3o2DU0S18kTA=;
	b=UHm7sv8bDP0W+L1w1NmBPfjzfvJTmAbkJIyO5NSGL6ecxFxO3Vq8inKvebW2FCQ6wg
	AEykH9Dy4EYDnPjVUNL0H88KrogOy36nncB7nGkdZ/uqSkjwq4piKLPBJ2Fpxq8jeRKF
	TdokgyH5R3ifblIfDSXVVw+CFf+VU/URSmVKFB12RrSW7wGJCMOio91UzXjR9LW34+9k
	FL1ifn3UqArNcfwNyRi7tBCdflCQkhJiK0M/lHBZt/H2/A6gboZ/BijvdTX9QEPxU4VV
	Pu/k6z3YL6omsjnt5mOBNPvNvbkzEf6RWJ/Go3Mz/3fBXkYcmZojp8lyBE+L3hCYCnMK
	6Srw==
X-Gm-Message-State: AHYfb5hyWPiKZht0rhGBP2zr3+hP4srClspZlSMSES6Wz1YWss9tInFH
	KMPEYtiNT07sE4hwqjU=
X-Received: by 10.55.170.77 with SMTP id t74mr3634031qke.201.1502913105602;
	Wed, 16 Aug 2017 12:51:45 -0700 (PDT)
Received: from centrium.lab.ossystems ([181.220.72.143])
	by smtp.gmail.com with ESMTPSA id
	y66sm1035424qke.21.2017.08.16.12.51.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Aug 2017 12:51:44 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 Aug 2017 16:51:27 -0300
Message-Id: <20170816195127.12094-1-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.11.0
Organization: O.S. Systems Software LTDA.
Subject: [meta-python][PATCH] python-chardet: Extend to native and nativesdk
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
X-List-Received-Date: Wed, 16 Aug 2017 19:51:45 -0000

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 meta-python/recipes-devtools/python/python-chardet.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-chardet.inc b/meta-python/recipes-devtools/python/python-chardet.inc
index 25443f870..6035488a7 100644
--- a/meta-python/recipes-devtools/python/python-chardet.inc
+++ b/meta-python/recipes-devtools/python/python-chardet.inc
@@ -9,3 +9,5 @@ DEPENDS += "${PYTHON_PN}-pytest-runner-native"
 
 SRC_URI[md5sum] = "7dd1ba7f9c77e32351b0a0cfacf4055c"
 SRC_URI[sha256sum] = "84ab92ed1c4d4f16916e05906b6b75a6c0fb5db821cc65e70cbd64a3e2a5eaae"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.11.0


