Return-Path: <koen.kooi@linaro.org>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 83B92703D7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Jul 2014 08:41:43 +0000 (UTC)
Received: by mail-wi0-f173.google.com with SMTP id f8so1187217wiw.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Jul 2014 01:41:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=1TedYd7IdHAmQ8SkhDXN8DquIKjUFpl0hYOGektFkqs=;
	b=NIs5nM6DVfFzohdVlNkdUBC3y1ts+tEnuAzhk2zAK797EDaklQzHFZX08lJCKpONdH
	H4hD0RR2ylcl/pvvEEkOSNU/KPBNELD+dj+lSWZCOEFaXR9wthJo1bJsXmO32oP6MeKl
	bWbQvYVJ6V4Dp8+mpU2VyThdmTeJFM2WEStD+hgKLPBieYQxB0zie/T4Fbr8O6/zBwzo
	GYVOzQPNp5uijAp1Lyq4kzhMMNKb1hB/5HZdA61Z8MEJPWIpuFo7FcSVk6dlAtYv/N/h
	Odl8EIT2KwCYvJ/6doxdFCsP44tqCaO7UNVBUHmDK/TR8bxYy/g2i+T3RV4FnfuxiXSe
	EuGw==
X-Gm-Message-State: ALoCoQnrM8SWdcRAni9W90FYCwtGHtN1Bmfo7/N5usfiEQAyWxbA48GHTaFVzWZ74JvpJqCJhzRl
X-Received: by 10.180.86.225 with SMTP id s1mr22597907wiz.36.1405327300220;
	Mon, 14 Jul 2014 01:41:40 -0700 (PDT)
Received: from localhost ([2001:610:612:0:2ad2:44ff:fe4b:bc17])
	by mx.google.com with ESMTPSA id
	fs17sm24039576wjc.6.2014.07.14.01.41.39 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Jul 2014 01:41:39 -0700 (PDT)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 Jul 2014 10:41:33 +0200
Message-Id: <1405327294-4030-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 1.9.3
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [meta-oe][PATCH 1/2] libhugetlbfs: fix versioning
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
X-List-Received-Date: Mon, 14 Jul 2014 08:41:48 -0000

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


