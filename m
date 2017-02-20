Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0665B77247
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 18:07:48 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id v77so15740701wmv.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 10:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=MvsbLtuBOp++7N206042bX7YXtjWviu9rBFRtjRPniQ=;
	b=ajZBK/cvogH2X14LS44VlZOeS/uoat3QI7UUahk3HlwUtqILEQwlXmTDffTBOiRTpW
	FKNooj8DkFFlDYRtiAb2Eq463fSjAkO6f4BXhTuaYaadeTJlhBTOmQlm0dec9Yk1rnQm
	qiBL7b1rFSBEMB5Gs7tpDrBwQEO6N9qAd9tQjEJInWBbjg9IOOF9SewYYpwG/tsHD8oj
	TBGGoNSvk3eqDhcl64Q7nnBL3CQS0wP7Oe4JI0BYRtMUzGBQEPfWQLArMM/AKK2sgCrw
	DFnQcnnv6MwlAVRyu3HegDWdr86HdYi+xtjZsyHFIJfa+TV66OHzMNgV1Nrzou929PGO
	B5JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=MvsbLtuBOp++7N206042bX7YXtjWviu9rBFRtjRPniQ=;
	b=Rvbed0OQruHdUmaz9J5nae8Q2mhQlRMy4S+O5aaAPB0uBo4KTvJdGn1KTvhTCu8mWu
	5GqYliN1fe7GGPirT0sb0ALri7L9bsPBQJUqdp63A8wJQywYY8Cmm0kDKKnsg8bcJPwW
	euS5dBTxagdfSmqOjbaiE4mUWSAgWmYTNC2YmFXTU+qlLlJW/aO/ZA0s93ZDQmhBMeyl
	FA7Zos8sX/M+JndI3/NT5Ys7DD1qZ7rlZLFbTa+bioP8zmv326MLN63NaA9juJWQb8EU
	3EhIKOTHt6iWm0KxFYVfuyWGuleawFk00TVgdL4BsyDTcnrTFBaY5nA3w17LS9iYXtJF
	1nUA==
X-Gm-Message-State: AMke39mc4kLrNBK4E4/JuICm2dOQ13YW+cmsiGQpYDo4ETaNaFW/PG2zBKGJP1ZzNvq2OQ==
X-Received: by 10.28.113.9 with SMTP id m9mr21406762wmc.60.1487614069110;
	Mon, 20 Feb 2017 10:07:49 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E911DE631E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e911:de63:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	96sm2863710wrb.14.2017.02.20.10.07.48
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Feb 2017 10:07:48 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Feb 2017 19:06:50 +0100
Message-Id: <20170220180700.29836-35-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170220180700.29836-1-schnitzeltony@googlemail.com>
References: <20170220180700.29836-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 34/44] gst-openmax: unblacklist - gstreamer is back
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
X-List-Received-Date: Mon, 20 Feb 2017 18:07:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-openmax_0.10.1.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-openmax_0.10.1.bb b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-openmax_0.10.1.bb
index 8b2bf75..2e01579 100644
--- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-openmax_0.10.1.bb
+++ b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-openmax_0.10.1.bb
@@ -33,5 +33,3 @@ FILES_${PN}-dbg += "${libdir}/gstreamer-0.10/.debug/"
 
 SRC_URI[md5sum] = "4d0370bfe99dea20918c84347abadb4e"
 SRC_URI[sha256sum] = "9074d5a0591995133d19cfb15144f19664f902c1623f996595695cf2c2070e1f"
-
-PNBLACKLIST[gst-openmax] ?= "Depends on blacklisted gstreamer"
-- 
2.9.3


