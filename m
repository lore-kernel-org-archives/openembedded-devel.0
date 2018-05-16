Return-Path: <twoerner@gmail.com>
Received: from mail-it0-f68.google.com (mail-it0-f68.google.com
	[209.85.214.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0597A7483E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 May 2018 19:18:19 +0000 (UTC)
Received: by mail-it0-f68.google.com with SMTP id n202-v6so4788969ita.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 May 2018 12:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=7jY6Ux1sMABJXYMKdN0OFduYcnDkU01IzuBO0vmuHm0=;
	b=JU8xaJd1Wp9WAYXBIeimQy40/OkP5OmtKclDrTwfrNAPpdArOpP/sgrfffMSQBVLvv
	ffu8On4OlTcz+AsvwPe2Q5LbKtAC/zwBaqr7Ri9d6qK32K7AQdlFgTG8qePtf4ZuKMRp
	gEERtiiC9jJVN0ihZg2ZrOs7Lhr9DE5MpjK+UdJvsjNEhofT0s7nWGwd39HTsYdYd8Gz
	oK+KLBfqnCFTW0XhHIGrIlMyhojZBvTTk0QLOY4XjHt5TlcwP7/pwbBKp9Pg5MBnigaJ
	F5NZFFeTZjWHRwxO+ENAhZSaKBWfny0F6T0knzrco9VOdCJxPgzm1Ay0bsiLAKKlJyod
	YIHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=7jY6Ux1sMABJXYMKdN0OFduYcnDkU01IzuBO0vmuHm0=;
	b=Ne8ZtT02zGgeBov9YHGfUWvHeqssFO/SaIFeG4ZYO9xurg1xXjl3twxEELNmcK7auq
	mYiu9mYUpyrTaETN+WcDugdQ6vlgQrnuGOPv0kwNnHUcwm/NItfCP14l+i9AnmHIo2qG
	0MXFP4WSIRht2zMdcQY8sLvdMLkcIbk+jq8xar3Ytyl2Je5llQc4lk2xQswRo8SXw1G4
	An/4aUs7EvTxgiYfnJjtgffuRE0+80OkLWZypkhZra1l7E9bUuJc0pDraVrY11oOYh8j
	TCFWJmOSgaDWflZFxbBD6qUaRriyNtHnBjmppzPPTIwSCE/cwOhYQUIzyWjTtRcpPV8W
	iQ8g==
X-Gm-Message-State: ALKqPwf+ozZcvCCqyhSX7lV5eujps5Fte+sH7tzqzVbUuB0ftiqqBVy6
	jT79sz4SArw+PWUwDT8JXQXaT7Mf
X-Google-Smtp-Source: AB8JxZoyz0F0sY4Tkhj+mdpQ8Hal/Zwodyfr4MxsnqewvLMkIhvbJyhOfOjYEYS+CbkTId28u8QqiA==
X-Received: by 2002:a6b:a2d1:: with SMTP id
	l200-v6mr2835641ioe.166.1526498300316; 
	Wed, 16 May 2018 12:18:20 -0700 (PDT)
Received: from linux-uys3.suse ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id
	w124-v6sm1746595iod.39.2018.05.16.12.18.18
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 16 May 2018 12:18:19 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 May 2018 15:18:12 -0400
Message-Id: <20180516191812.23307-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.17.0.rc2.3.gc2a499e6c
Subject: [meta-oe][PATCH] gtest: switch away from github archive
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
X-List-Received-Date: Wed, 16 May 2018 19:18:20 -0000

Since we know that github archives which are automatically generated have a
tendency to change their checksums[1], switch to using a git clone.

[1] http://lists.openembedded.org/pipermail/openembedded-devel/2017-September/114916.html

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta-oe/recipes-test/gtest/gtest_1.8.0.bb | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-test/gtest/gtest_1.8.0.bb b/meta-oe/recipes-test/gtest/gtest_1.8.0.bb
index 483dc1f2e9..48cf4e04b0 100644
--- a/meta-oe/recipes-test/gtest/gtest_1.8.0.bb
+++ b/meta-oe/recipes-test/gtest/gtest_1.8.0.bb
@@ -7,16 +7,13 @@ LIC_FILES_CHKSUM = "file://googlemock/LICENSE;md5=cbbd27594afd089daa160d3a16dd51
 
 PROVIDES += "gmock"
 
+S = "${WORKDIR}/git"
+SRCREV = "ec44c6c1675c25b9827aacd08c02433cccde7780"
 SRC_URI = "\
-    https://github.com/google/googletest/archive/release-${PV}.tar.gz \
+    git://github.com/google/googletest.git;protocol=https; \
     file://Add-pkg-config-support.patch \
 "
 
-SRC_URI[md5sum] = "16877098823401d1bf2ed7891d7dce36"
-SRC_URI[sha256sum] = "58a6f4277ca2bc8565222b3bbd58a177609e9c488e8a72649359ba51450db7d8"
-
-S = "${WORKDIR}/googletest-release-${PV}"
-
 inherit cmake
 
 ALLOW_EMPTY_${PN} = "1"
-- 
2.17.0.rc2.3.gc2a499e6c


