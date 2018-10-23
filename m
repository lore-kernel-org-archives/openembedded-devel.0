Return-Path: <jpewhacker@gmail.com>
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
	[209.85.167.194])
	by mail.openembedded.org (Postfix) with ESMTP id 2607B74623
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Oct 2018 16:04:57 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id y81-v6so1550646oia.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Oct 2018 09:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=4bbTb5sZRtijBha9sqp/VbNdIkckiwwMOMZ45PMUuxA=;
	b=rfyz33OR3ctctuLGgR98O//097xalJ/ffc+1KObhQAfXye+IIWprrIuTptdgq/kCpR
	WpHBBuEbeqiX//CKjCWNyZ/RbG0VoM73DIcdGWggYVV5PrsmczyYFeijrAH9VJiLzsbp
	NS5tXRChELy+mDsf+zFvrV/BzDkJvDeAXA7xlkrvWxJIE7RAoDq+QRojBerbtVe0UIQu
	wPOstWubEkjsOPuNjBZOp+gTIkGI4pYI+ho98ns7lbXmKCPxjnjLIuWJSiQymtVd2LiS
	3Atb19ZIazKdualJWZgzQTGI8iwjiGoZ5nX5meQvNs/VFmNde/en7q8NolkiyhdDt8V+
	gM4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=4bbTb5sZRtijBha9sqp/VbNdIkckiwwMOMZ45PMUuxA=;
	b=tt/fDMZQDWZlFFTMnhJKyzx1nZ5Ub4YiLaryCK0dq7fHGM9qkvhX1JAPNawOxPwvkj
	YSUs+7JMqcupLGPYGUUfPyyMitRF5+//pEGW8+1zbEm1EcKvDPIwKCe8D0vyOdx+8ZB1
	TMs9XgySseEvqMVQwdeGWHhFdokQ6TQv62XOe//howzGfkrUsHVMrFOErQ2kleBT2LEO
	v8NlC/vgZZbWnI6ntgeE2HLyDAIJrEXQUGL39gy0i15hB9ESYkZ+5orZrdmzeABuzjNu
	05gAyDei63ePKUWzDI6B65OBEqavhBkySDl8eNxTH6ZEWw4VrhS6QCquNQYXxvyyLEIa
	ibWg==
X-Gm-Message-State: ABuFfogFOzhbcnV4pQ9vmyHqV9OGUx9r4iuBnQJcgk1It94v2Ws3H17X
	u1bik4JLJt9UfRozwySMPT7cb3g1
X-Google-Smtp-Source: ACcGV63TTNPwFJTza7YWW648kAfg4CT2Wgj6tb/d632/xclkR1zsBnTpw4WkvENxPwZMM6rdvrqYUg==
X-Received: by 2002:aca:1c6:: with SMTP id
	189-v6mr1551512oib.325.1540310698717; 
	Tue, 23 Oct 2018 09:04:58 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	o88-v6sm552481oik.27.2018.10.23.09.04.57
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 23 Oct 2018 09:04:57 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 23 Oct 2018 11:04:38 -0500
Message-Id: <20181023160438.19552-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: Veselin Georgiev <veselin.georgiev@garmin.com>
Subject: [meta-oe][master][sumo][PATCH] rapidjson: Update to newer 1.1.0 + git
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
X-List-Received-Date: Tue, 23 Oct 2018 16:04:58 -0000

Bring in a newer version of rapidjson which includes a fixes when
running on ARM, specifically 748a652f04 ("Fix SIGBUS due to unaligned
access")

Also remove the existing patch file as the issue was resolved in the
mainline by 4c9a28a28e ("CMake: do not pass -march=native or
-mcpu=native when crosscompiling")

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Veselin Georgiev <veselin.georgiev@garmin.com>
---
 meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb b/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
index 76e01f824..ec3df8263 100644
--- a/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
+++ b/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
@@ -4,11 +4,9 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://license.txt;md5=ba04aa8f65de1396a7e59d1d746c2125"
 
-SRC_URI = "git://github.com/miloyip/rapidjson.git;nobranch=1 \
-           file://remove-march-native-from-CMAKE_CXX_FLAGS.patch \
-"
+SRC_URI = "git://github.com/miloyip/rapidjson.git;nobranch=1"
 
-SRCREV = "e5635fb27feab7f6e8d7b916aa20ad799045a641"
+SRCREV = "6a905f9311f82d306da77bd963ec5aa5da07da9c"
 
 PV = "1.1.0+git${SRCPV}"
 
-- 
2.17.1


