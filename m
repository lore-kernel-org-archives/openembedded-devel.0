Return-Path: <koen.kooi@linaro.org>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 57E707025C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jul 2014 05:26:09 +0000 (UTC)
Received: by mail-wi0-f175.google.com with SMTP id ho1so3675572wib.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Jul 2014 22:26:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=1TedYd7IdHAmQ8SkhDXN8DquIKjUFpl0hYOGektFkqs=;
	b=OjYTHCGuqRAxsJNZo+ThyFCumGvKM7nBknX/NDBrRIeM521YEQaEQ5QWl70s+xE/6i
	AdhHfFm8oB55mkOn1wOJLrF8VAnu8rSyKaRgtpfUO3kf+fvrWJv/fkgmRCJSZn2u1TnO
	6voGM//o3y4owUT0xdx0yjDumCb4fSF7tSehaevOM9LxdTo/StNYL7YdwEdE20GOltlV
	AJDlaIv4CMIuWwhGAkv1O1EBfEbjN+PErg889rUUdJ3ekd8QZZaBy3mhSGzYmeUECPFD
	58RGg3g/+CNc5ZI6cJbKllxS/IcVdcceNRSZcrPdtcpzjbGHceGoFD6xIcK+rYVJTjlo
	lmDA==
X-Gm-Message-State: ALoCoQn2ofE7dkEOJCEo/LA7HLg3EqpN3j6ZTuNI2xpxbBrFecCGtJEpsEnScZJKVMOxHTRFa6SM
X-Received: by 10.194.59.65 with SMTP id x1mr23982271wjq.60.1405401970790;
	Mon, 14 Jul 2014 22:26:10 -0700 (PDT)
Received: from localhost ([2001:610:612:0:2ad2:44ff:fe4b:bc17])
	by mx.google.com with ESMTPSA id o9sm39323847wib.22.2014.07.14.22.26.09
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Jul 2014 22:26:10 -0700 (PDT)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 Jul 2014 07:26:06 +0200
Message-Id: <1405401967-9454-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 1.9.3
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [meta-oe][PATCHv2 1/2] libhugetlbfs: fix versioning
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 15 Jul 2014 05:26:18 -0000

PE bump is needed because "git+stuff"" > "2.18"

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
index 5645add..af7ed3e 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
@@ -5,6 +5,9 @@ LIC_FILES_CHKSUM = "file://LGPL-2.1;md5=2d5025d4aa3495befef8f17206a5b0a1"
 DEPENDS = "sysfsutils perl"
 RDEPENDS_${PN} += "python python-io python-lang python-subprocess python-resource"
 
+PV = "2.18"
+PE = "1"
+
 SRCREV = "ea3f6b273f535aab38cefae30030774457bbbfe6"
 SRC_URI = "git://git.code.sf.net/p/libhugetlbfs/code \
     file://skip-checking-LIB32-and-LIB64-if-they-point-to-the-s.patch \
-- 
1.9.3


