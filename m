Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
	[209.85.214.172])
	by mail.openembedded.org (Postfix) with ESMTP id 487E779702
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Sep 2018 17:22:22 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id b12-v6so5284604plr.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Sep 2018 10:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=K7iZYX9VpzSVGqcPfax/C8EMMGdr6c25OW9zmcVdAjc=;
	b=BUbFOqJzCfvrjSWfe9QiGjhXVkxQh1jDYSvonffRkshTKbSGTkrg4ixFXuezdMQNys
	QGWokUjg+SZ1N4U/eSOHqfB6fWkaAjVBYIwmLYXgBely/YufMfavFumJQ7XuKCDFztxm
	JuX0PSOBjumJFwRX+jLh8MX3XHYE5aelTAiazbjPsEKcWKrZ7BYPdWEaHuO7qZG8HAgg
	3nYiMzXY1GLp1Lddb1V6ud4yiA5c91AHUJccOv7DoFlnbAdivSIfuSGEM//lJhhofqK9
	YW56nZnU0bCumY58grgU8LFyRx9QmFMVpfcC5DG/EMCgWyxR6ZOl8oxYWLncbc7W6GUX
	Jr5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=K7iZYX9VpzSVGqcPfax/C8EMMGdr6c25OW9zmcVdAjc=;
	b=eU+TBku/jQiHgI2hi0158W99ts/p3VV1V1TrbKNJ8kP3pR+kjR6Jwkmr50Sj0oJVYy
	J2/+0lWPezTlLQAuH/09jeECH2hGxSnyxe9eVx3IpxKMGdzURg+VUxpYtZge8I2Rxdz1
	FSdQDaJlEUTkN9Ex4FfiSJvwObCeRA/hSUiDvv/PIrwD3yXjkO/aZJe1kWw9HTSMcntq
	TeztHMj6MlibYIDfihQzvj/cQ8UUzShCe962pJbitV9Fb75QJoWC/sfoW1GJSqJEtZHS
	GQiec8cmTALuXIZfyE+0slF1rsf0G8LWNU5l5mM5T6cNnfq2r+nkxuTiMGBOEvN3ep7N
	lcgg==
X-Gm-Message-State: APzg51B3lTryVe28P2hIAeoQQ/1aR2X7dWP1IyBo1hlQITu5ZDynkfDt
	0zS8IsQXikrxaZoB99VHRhStJQAU
X-Google-Smtp-Source: ANB0VdbdtRMTF1ZBwDgX/YUtw5dA7xPC4k4V7sONjRKYpQk+EDYr/omGS3BaxEaUmkcheHSQOqOJVw==
X-Received: by 2002:a17:902:a413:: with SMTP id
	p19-v6mr3775459plq.220.1536254542880; 
	Thu, 06 Sep 2018 10:22:22 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::71e7])
	by smtp.gmail.com with ESMTPSA id
	22-v6sm8319828pfl.126.2018.09.06.10.22.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Sep 2018 10:22:21 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  6 Sep 2018 10:21:57 -0700
Message-Id: <20180906172210.42551-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180906172210.42551-1-raj.khem@gmail.com>
References: <20180906172210.42551-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 04/17] znc: Upgrade to 1.7.1
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
X-List-Received-Date: Thu, 06 Sep 2018 17:22:22 -0000

Fixes build with OpenSSL 1.1.x

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-irc/znc/znc_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-networking/recipes-irc/znc/znc_git.bb b/meta-networking/recipes-irc/znc/znc_git.bb
index c2d71563a1..8c6979c2e2 100644
--- a/meta-networking/recipes-irc/znc/znc_git.bb
+++ b/meta-networking/recipes-irc/znc/znc_git.bb
@@ -5,13 +5,13 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 DEPENDS = "openssl zlib icu"
 
-PV = "1.6.0"
+PV = "1.7.1"
 
 SRC_URI = "git://github.com/znc/znc.git;name=znc \
            git://github.com/jimloco/Csocket.git;destsuffix=git/third_party/Csocket;name=Csocket \
           "
-SRCREV_znc = "f47e8465efa4e1cd948b9caae93ac401b4355df8"
-SRCREV_Csocket = "07b4437396122650e5b8fb3d014e820a5decf4ee"
+SRCREV_znc = "c426898b3a1b899dfe8a8b2a3eeb4b18d8be1bf2"
+SRCREV_Csocket = "e8d9e0bb248c521c2c7fa01e1c6a116d929c41b4"
 
 # This constructs a composite revision based on multiple SRCREV's.
 #
-- 
2.18.0


