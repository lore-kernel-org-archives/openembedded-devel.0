Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id B7B5B6067D
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Mar 2016 13:05:16 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id q184so6280034qkb.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Mar 2016 06:05:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=Plo4y8O4BfcuvHcOVZq4rlpxWCmTI14D6OoC/ZJNS9U=;
	b=ZwmyOhboMT5Upp7WSgrH0kPwVU6EkKT8waZ7QP65cW0Y2EwO0KqGgZ8I1hoQmTkgx+
	EHMl1ChyWucttyMIFBUeP6x5Y0ZTJyiuFw+rib0DCwLpe6hWGzbued6QroujszmNar+R
	caOHs7txfc7wEZHFWNzdatL7Oy0MLxivXnztpfrnTPQGRdh4rlbT2whXGEzqHoJoBq+x
	Bynbxa0j+JKpsO1T54dNm5SSzI2E69v5laQkCOtw/NEoKs6lzDLJWDJ3w6qi1ooI//A2
	e5vAuyQOKCXfTGaiccWrS5u2kGg/9HffQ7Pe00QbcOKezVrI0mLG8JiAfQJCdwzS7C9g
	Jnpg==
X-Gm-Message-State: AD7BkJJP82QmCdgbCt5G/2QHPRgLaDWxyXhYUGJEoqdwarWajZUKCOX22S0+8jRajqLxhg==
X-Received: by 10.55.77.206 with SMTP id a197mr23221401qkb.43.1458997517463;
	Sat, 26 Mar 2016 06:05:17 -0700 (PDT)
Received: from build-slave.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168])
	by smtp.gmail.com with ESMTPSA id x6sm7678649qka.16.2016.03.26.06.05.16
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 26 Mar 2016 06:05:16 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 26 Mar 2016 09:04:34 -0400
Message-Id: <9c680360e59da176e13958adc747618b0afb0bc5.1458997082.git.derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1458997082.git.derek@asterius.io>
References: <cover.1458997082.git.derek@asterius.io>
In-Reply-To: <cover.1458997082.git.derek@asterius.io>
References: <cover.1458997082.git.derek@asterius.io>
Subject: [meta-python][PATCH 14/30] python-jsonpatch: update to 1.13
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
X-List-Received-Date: Sat, 26 Mar 2016 13:05:16 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-jsonpatch_1.12.bb => python-jsonpatch_1.13.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-jsonpatch_1.12.bb => python-jsonpatch_1.13.bb} (67%)

diff --git a/meta-python/recipes-devtools/python/python-jsonpatch_1.12.bb b/meta-python/recipes-devtools/python/python-jsonpatch_1.13.bb
similarity index 67%
rename from meta-python/recipes-devtools/python/python-jsonpatch_1.12.bb
rename to meta-python/recipes-devtools/python/python-jsonpatch_1.13.bb
index bb5a5ff..085ba59 100644
--- a/meta-python/recipes-devtools/python/python-jsonpatch_1.12.bb
+++ b/meta-python/recipes-devtools/python/python-jsonpatch_1.13.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=32b15c843b7a329130f4e266a281ebb3"
 
 inherit pypi setuptools
 
-SRC_URI[md5sum] = "76ae3183db5f2a8f85dd7705e9b6f278"
-SRC_URI[sha256sum] = "2e1eb457f9c8dd5dae837ca93c0fe5bd2522c9d44b9b380fb1aab2ab4dec04b1"
+SRC_URI[md5sum] = "4d6650ced683f632e117bafe5d9f093b"
+SRC_URI[sha256sum] = "9470656a08002e309632b59772b206ce0564c9a77b44c25f05f49dd2cad248d5"
 
 RDEPENDS_${PN} += "python-re python-json python-jsonpointer"
 
-- 
1.9.1


