Return-Path: <straka.derek@gmail.com>
Received: from mail-qg0-f65.google.com (mail-qg0-f65.google.com
	[209.85.192.65])
	by mail.openembedded.org (Postfix) with ESMTP id D934873198
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Mar 2016 13:05:19 +0000 (UTC)
Received: by mail-qg0-f65.google.com with SMTP id c67so8515122qgc.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Mar 2016 06:05:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=bGU4/IxKdgxGbBG0ps7O7lvAP48KPCutN1Q8pJTHRLI=;
	b=lYgH1bgVcKX5KIRq+szXWiMuDm9cslk5ydYXkl+CcYVeEhQXuXiy2wMOe2NpnUh7EM
	ZU2iiJXTEILXZ2QN3GdXEVKdVeJiRdpiPPOhXEecAK5Bbw3opaPASDRtLqz33ufsQcdn
	cUflGsSiDeqj7YyzOC8w45119l52B8GFq4O0n78K2GQEHi1ML8Fy/LtqYCMeHQntQteN
	Qn8Rqa240vmaHbTKdytzleAMyUu1rfqA5tmQPdY29gccT1Ng/Hdqa+n170EXznbM8wi6
	hjYPeWp21RVGoTIxwpSgNV9oWyp2k7/7mZZe/CT1Qz4PVzR6jZ6+7SsF81Dtlf1DDj16
	Vobw==
X-Gm-Message-State: AD7BkJI64Oy2pS/yEGmcCgToHQLSm3ekXcbYx7SFUIwn8hNiwhyJvoxsM3+nQs0adsczEw==
X-Received: by 10.140.158.135 with SMTP id e129mr25270662qhe.84.1458997520357; 
	Sat, 26 Mar 2016 06:05:20 -0700 (PDT)
Received: from build-slave.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168])
	by smtp.gmail.com with ESMTPSA id x6sm7678649qka.16.2016.03.26.06.05.19
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 26 Mar 2016 06:05:20 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 26 Mar 2016 09:04:39 -0400
Message-Id: <6e83313d79d7d500bd64603035f222f8e923bbba.1458997082.git.derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1458997082.git.derek@asterius.io>
References: <cover.1458997082.git.derek@asterius.io>
In-Reply-To: <cover.1458997082.git.derek@asterius.io>
References: <cover.1458997082.git.derek@asterius.io>
Subject: [meta-python][PATCH 19/30] python-psutil: update to 4.1.0
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
X-List-Received-Date: Sat, 26 Mar 2016 13:05:20 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-psutil_2.2.1.bb => python-psutil_4.1.0.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-psutil_2.2.1.bb => python-psutil_4.1.0.bb} (63%)

diff --git a/meta-python/recipes-devtools/python/python-psutil_2.2.1.bb b/meta-python/recipes-devtools/python/python-psutil_4.1.0.bb
similarity index 63%
rename from meta-python/recipes-devtools/python/python-psutil_2.2.1.bb
rename to meta-python/recipes-devtools/python/python-psutil_4.1.0.bb
index 1d643eb..6a210ee 100644
--- a/meta-python/recipes-devtools/python/python-psutil_2.2.1.bb
+++ b/meta-python/recipes-devtools/python/python-psutil_4.1.0.bb
@@ -2,8 +2,8 @@ SUMMARY = "A cross-platform process and system utilities module for Python"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0f02e99f7f3c9a7fe8ecfc5d44c2be62"
 
-SRC_URI[md5sum] = "1a2b58cd9e3a53528bb6148f0c4d5244"
-SRC_URI[sha256sum] = "a0e9b96f1946975064724e242ac159f3260db24ffa591c3da0a355361a3a337f"
+SRC_URI[md5sum] = "017e1023484ebf436d3514ebeaf2e7e9"
+SRC_URI[sha256sum] = "c6abebec9c8833baaf1c51dd1b0259246d1d50b9b50e9a4aa66f33b1e98b8d17"
 
 RDEPENDS_${PN} += " \
     python-subprocess \
-- 
1.9.1


