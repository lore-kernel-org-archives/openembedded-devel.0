Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11784.1795762911331021718
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 23:01:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=pZea6z5w;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cde4b4e936fso3734229a12.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 23:01:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795762911; x=1796367711; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hDuTSskvw2AfqnK0qtw3KqyVCMECIYNBYmOPmiVL95k=;
        b=pZea6z5wlH3NaA17TdiI+jXQdcWS5mCSfECJyhFWTw7IenBPOc60xjdWd4DAc7hrct
         NYAwfGeMYInLNhX888HSZ1OezeerYCoVxbfhDnqPXBN8zHSU154KbfQd2vu4tjd95Jgn
         /1IYUuyTHXS+cHw35x9fQNzp03zBD0g/lCbpKObdebRh6vpQp4KrWF35XB7hvd49+dlI
         GVIsnts+Hm3aMQ76kbcyfp4cL3sSi0zQIPA92f2ZlT0vtWyxxVMy7MF1VHomqjLS8zxt
         max1O5X+BZmoGI90WGwypgAryDpMWbDKhUaVL5Ef28yZmhZyxCf/iIATMt/nibP1tJTy
         fd9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795762911; x=1796367711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hDuTSskvw2AfqnK0qtw3KqyVCMECIYNBYmOPmiVL95k=;
        b=VUzd8137iIUz2xK6rHJhYrJez9vaVRW6iGqy+4C9P4SIJKnvWuBNLF1rUvWHfLKaaX
         6tVffRyGRpg36Hjc7r6PU1yfIc0v+B0T39F3DezBQ2Mq3ctIgtory1Izt6tNX7w2GXmf
         ol8dOa0urjtejbj2+A6AoQcCDh27KcKiyPm5Ivv2OLOw97dZe2CSDE679V9bNJAYKNpI
         XUJsNLGNJ6yVOxJ0PiKTRjCindum66WAHXd2Ng9QVC+9pN/PQdyQgLcEBObeKa4hdipa
         nYbfnZVhLvFnRXVkJg25ETUNXAIoyNFqj2ondNHElRJC86HzxFZQTaKdHAdJBVdRjAAQ
         tPcQ==
X-Gm-Message-State: APuU4Z9RP98GIJctG9aEBGHI6ofqsTGCbP3g3WPv9/YVAJ8/NIOqe7YJ
	WK3biLIsfCDfP7ETt6WwJAVwIN7/OwqOgiMRkgXDo4VIlQXPYluc5kZVfQgXi2c6
X-Gm-Gg: AZFdTZeiZBdSLw8UZkT2G3EqXt4KqdypbmScMvu9I1ZpG9Ba2/Ljov36r8Z5nGOkMsO
	/oatHli3W6LZPmTU/DQLB06+iH0vo5ez/rH5o8MWV4GSW24VBfhcj6FwticMBE8DozT/WcifKLU
	V2Pmr7/vtx/uBBSgqNdXbpy04ZMd9KkveqN51mUv3av2Efd8Bq2d9YEQi9Mf4GfDXFmIHTgEawv
	aCRWgNOz6giOwmvtO1sqWCZ49Z75xuvn0oq/EBSh7NNdw/5DUgdKMIasHPoXU4lGFkUXpw9B/ET
	xuNbEWyFwc+unl9XseDtxqIP8vpe+fFuhrvY+sO+9/GSCRfctNav8Y2vB3NZavInpVSFEfhaQfM
	DYOnIHBDwdcAPqvMfmw6pxv+rDWIxcxgEr0Xpev1WLpGTdswHHCPzd4wflu5+GXbhAtHZBaV3XB
	2/oKRSxXXhDSK5ZTmpcEKpWXgFHmDThT3jFpVoHA2msdOd4l5Y4ThsMtmGYF44X54yXqBRaVXby
	5VSvIT4R0gcGdBoHysDcLcl9f7dPlkDeqmMJuAa1VJbCTrp29qjAozMKgA4SLsPsaOgLdL5pl6I
	aYN51xEqHZy0KIM8AArTIr/JXD7FlEv3lOEVMPOZJlQlGMNXwiTEXexgwjBlKuqia6Y5FF0qMZ+
	EkIN5v4u2C4mdkfde4aJon5r74FHuaqmTT8uw8CqGdZeTVix7UrQ6/SX6+nRg2V3j2keVAheoVF
	nnrC6urW/1x2fshFvD7eOUx6FLeQjRxdIqAStQr1GIlcNDURizayaN47bQSIn0ZIR0TO6vyaHTf
	MoRuVBd+gk8HB7CQTFzN6RFAPsjHTaRFQJlf9TcOaBMI9xTHQlimmT00xkNELX5PimhHLRKxh7Y
	hUo0EQ==
X-Received: by 2002:a17:90b:2f8f:b0:3a0:d82b:237b with SMTP id 98e67ed59e1d1-3b41c938926mr14814138a91.25.1795762910512;
        Thu, 26 Nov 2026 23:01:50 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b4efb59622sm6385312a91.4.2026.11.26.23.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:01:50 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-multimedia][PATCH 1/6] fswebcam: Fetch from codeberg
Date: Thu, 26 Nov 2026 23:01:40 -0800
Message-ID: <20261127070145.2286713-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127070145.2286713-1-khem.raj@oss.qualcomm.com>
References: <20261127070145.2286713-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 07:01:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133321
Content-Type: text/plain; charset="utf-8"

The GitHub repository was replaced by a single commit pointing to
codeberg.org/fsphil/fswebcam, so its master branch and tags no longer
hold the recipe's SRCREV and a fetch without a mirror fails. Codeberg
has the same 20200725 tag.

Add an UPSTREAM_CHECK_GITTAGREGEX for the date tags.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-multimedia/fswebcam/fswebcam_20200725.bb          | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/fswebcam/fswebcam_20200725.bb b/meta-multimedia/recipes-multimedia/fswebcam/fswebcam_20200725.bb
index bc4f324da5..fa0f5c3f23 100644
--- a/meta-multimedia/recipes-multimedia/fswebcam/fswebcam_20200725.bb
+++ b/meta-multimedia/recipes-multimedia/fswebcam/fswebcam_20200725.bb
@@ -15,9 +15,11 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=393a5ca445f6965873eca0259a17f833"
 
 DEPENDS = "gd"
 
-SRC_URI = "git://github.com/fsphil/fswebcam.git;protocol=https;branch=master;tag=${PV}"
+SRC_URI = "git://codeberg.org/fsphil/fswebcam.git;protocol=https;branch=master;tag=${PV}"
 SRCREV = "db35d4bbd336885a44f017ff142bc9523dbdce3c"
 
+UPSTREAM_CHECK_GITTAGREGEX = "^(?P<pver>\d+)$"
+
 # Compile gd with PACKAGECONFIG fontconfig for easier font selection
 RRECOMMENDS:${PN} = "ttf-dejavu-sans"
 
