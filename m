Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
	[209.85.214.170])
	by mail.openembedded.org (Postfix) with ESMTP id 222CF60F57
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Mar 2020 19:37:00 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id g6so4417617plt.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Mar 2020 12:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=5O1fng0qbwfhEULENFYSyxpqbuDnjNCMCBW/UmDfDhc=;
	b=qVzCxl4bQ1TUvbnEkEKDP6R1Qe299yM1asRoz3kudDKDCMzBpdr9H9RehclBX89MBj
	aFwZ0P7KjHrmLfd2eP/bVG8jqE27Rgk5czfwgtWwrWYmayFJYVuzrC4aQq4BymuzdTaB
	faoFdhGY1tfnwMGDOjDpyUseAnRtjlK122YNK3PdRBTUjcgMchFaFDq8elbqWPB1u1Jm
	rpOYvUhjagTh9azF0vlgYMZN9Y7QZLB2cI+QVIkX2psDaDQCiBb1tFiIFmDqgFyOWF6j
	6tVcyosO0KxboZ1PTR0yRAWqSILjQuXTIE6ui/96m7FkEZTbjp18U6rpP1f10/jJqv7R
	E5dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=5O1fng0qbwfhEULENFYSyxpqbuDnjNCMCBW/UmDfDhc=;
	b=fY86LE7Ih6GMi9lFoA48dal3ZzyyTqf6owUPCqUA3oSrPl/1f607wC76QghlcyDznW
	iPSFHTukoGJz5Jfw7oTwXrxXxp9J4JRb12CONm/QZTTyFNXtkJ9XaoDvR+JqGpRiQcsz
	bCz+Z6LT2fhTGSeGZwXduTGr2U6PyPUlY5uoYC29qaA3kXAgxiHCoEyxDwXQeRGCrW4M
	Vz0OxanKi/BADirjjcpGCfGqP5gUV2uhqZ01/7Sc6p/P9b59CKBXqSvSr9w7Q6nJyuxc
	YMVyoO87UbJLVP0Ds+V/2Oswcv6TyKQaJLrGBdmpewNbfZEqMuRxwZcShiPSi76hdEsI
	c5iA==
X-Gm-Message-State: ANhLgQ0m3C75Xpa8mfYdSH1+4yJnCJGkNb0cT+e0OvLqAcG8/HmFlfh4
	Yj0332J/pgDtg1PIksUDSa16SKPjyPI=
X-Google-Smtp-Source: ADFU+vsWUVGxL06cM7s6N1E1DbSmg1tKogtAHLlQj3b9K6Fe27/ELU3faM0mJAVpcKXDPytgoc0JzQ==
X-Received: by 2002:a17:90a:ab0e:: with SMTP id
	m14mr241815pjq.96.1583782621380; 
	Mon, 09 Mar 2020 12:37:01 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::1c34])
	by smtp.gmail.com with ESMTPSA id
	s11sm16221436pfh.7.2020.03.09.12.37.00
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 09 Mar 2020 12:37:00 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Mar 2020 12:37:09 -0700
Message-Id: <20200309193712.1028142-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200309193712.1028142-1-raj.khem@gmail.com>
References: <20200309193712.1028142-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 2/5] kronoset: Disable sign-compare with clang
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
X-List-Received-Date: Mon, 09 Mar 2020 19:37:01 -0000
Content-Transfer-Encoding: 8bit

clang isn't suppressing warnings from system headers like it should
Fixes
../../git/libknet/transport_udp.c:326:48: error: comparison of integers of different signs: 'unsigned long' and 'int' [-Werror,-Wsign-compare]
                for (cmsg = CMSG_FIRSTHDR(&msg);cmsg; cmsg = CMSG_NXTHDR(&msg, cmsg)) {
                                                             ^~~~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-extended/kronosnet/kronosnet_1.15.bb            | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-networking/recipes-extended/kronosnet/kronosnet_1.15.bb b/meta-networking/recipes-extended/kronosnet/kronosnet_1.15.bb
index 24aa27a87b..6bf268da9d 100644
--- a/meta-networking/recipes-extended/kronosnet/kronosnet_1.15.bb
+++ b/meta-networking/recipes-extended/kronosnet/kronosnet_1.15.bb
@@ -15,3 +15,9 @@ SRC_URI = "git://github.com/kronosnet/kronosnet;protocol=https;branch=stable1"
 inherit autotools
 
 S = "${WORKDIR}/git"
+
+# libknet/transport_udp.c:326:48: error: comparison of integers of different signs: 'unsigned long' and 'int' [-Werror,-Wsign-compare]
+# for (cmsg = CMSG_FIRSTHDR(&msg);cmsg; cmsg = CMSG_NXTHDR(&msg, cmsg)) {
+#                                                             ^~~~~~~~~~~~~~~~~~~~~~~
+CFLAGS_append_toolchain-clang = " -Wno-sign-compare"
+
-- 
2.25.1


