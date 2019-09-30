Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id CEA707997D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Sep 2019 04:37:53 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id h195so4849828pfe.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Sep 2019 21:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=+eEWXw/cnEV6C+NC5PbxjPq4hIvH3fzDtJzePANDl/I=;
	b=bq8P4ahJ/xhB4bXyFThOxnpMNgfRPxz0wR3gdcmljTWbHbec/9Ow+Ymhl0jDy8ObRj
	8rs6uTKXObSal/4NOrd+gpSkQuqLf6W0LrbH8fiqcCawIpvD2xKjfOEPCD35Mp1Yzh2U
	p1IwgeL+9MyLR9QI4o/egXGbSVFnXINCxneYzWwMTBHNJ0w4BuyBJNQLqP8MyvMtwGaj
	uma+1jVzMdCdnSnGGaAK70C0PLYaCJ6T5I5NtHxR1uDvShNa9TT9ndxyk3V7kn4MgJoA
	Uu55cpqVhBu5zFW4Xyv/YlTGrkicjquDk8bqyjGGJVK4y9PoBs/BAsnixCqULeKSGpA3
	DiCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=+eEWXw/cnEV6C+NC5PbxjPq4hIvH3fzDtJzePANDl/I=;
	b=RfY2ciIgwNVYexQxfSSp0W/iwrSvBfzGGwbqKPlpHDP27kyhecMok1dQ5C4HMvvLyj
	HGYZ40Kim966dLd9Z1B866Q3gigZ3wPmuTuIh3XXE4T20XTcaKovJXciBi+Aihbol2oA
	fs89Uh+Fk0lpQOQd5+YvBj+n7EWB3soi1dSZi8gbQY5qVtgDk1a2NA8E8/rm0Y+SP2Ly
	yUAjLzpnK1vwF1W1uE3tggTSnTMdcX7SAMC5QikPnSiZgEK9kz/NrmpPkMWvNPFfpo8D
	rZRTvPoK692Xyt483EbOoehSdfSosVblue4Lt525mkWDt8sJR+laWda8o6wyrXvhhayC
	pNTw==
X-Gm-Message-State: APjAAAUbSuAQem3Hxr4rZXXu1HERxBVZsa8VIVZMM3WKCCnWLpDK3bEm
	egdWWzP98TDo3SdfbMoSKuni/AJJfoA=
X-Google-Smtp-Source: APXvYqwtXlFK7bPuEOzCmmJVrzKnnUMLC2x7MiyVV96wkFAntcPZlSMhe6e3GbOXhWZno7JcIDRMfw==
X-Received: by 2002:a63:1310:: with SMTP id i16mr20668846pgl.200.1569818274497;
	Sun, 29 Sep 2019 21:37:54 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	u31sm22513345pgn.93.2019.09.29.21.37.53
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 29 Sep 2019 21:37:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 29 Sep 2019 21:37:32 -0700
Message-Id: <20190930043733.2840975-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190930043733.2840975-1-raj.khem@gmail.com>
References: <20190930043733.2840975-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-python][PATCH 3/4] python-configparser: Mark license as MIT
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
X-List-Received-Date: Mon, 30 Sep 2019 04:37:53 -0000
Content-Transfer-Encoding: 8bit

Debian copyright also uses MIT
https://sources.debian.org/src/configparser/3.5.0b2-3/debian/copyright/

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python-configparser.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-configparser.inc b/meta-python/recipes-devtools/python/python-configparser.inc
index 7f4385e77b..a1fb6cd29d 100644
--- a/meta-python/recipes-devtools/python/python-configparser.inc
+++ b/meta-python/recipes-devtools/python/python-configparser.inc
@@ -1,7 +1,7 @@
 SUMMARY = "This module provides the ConfigParser class which implements a basic configuration language which provides a structure similar to what's found in Microsoft Windows INI files."
 SECTION = "devel/python"
 HOMEPAGE = "https://docs.python.org/3/library/configparser.html"
-LICENSE = "unknown"
+LICENSE = "MIT"
 
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=10;endline=10;md5=23f9ad5cad3d8cc0336e2a5d8a87e1fa"
 
-- 
2.23.0


