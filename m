Return-Path: <straka.derek@gmail.com>
Received: from mail-qg0-f45.google.com (mail-qg0-f45.google.com
	[209.85.192.45])
	by mail.openembedded.org (Postfix) with ESMTP id 3123965CBB
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Apr 2016 17:00:09 +0000 (UTC)
Received: by mail-qg0-f45.google.com with SMTP id f74so55885581qge.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Apr 2016 10:00:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=b7TN153SgNU9lAdxdcYTX8Ms6PJ0iVr5CHXA5N0ChZ0=;
	b=IlHU51K2zsInN2LVWNlcaBX7YN7vxLXE3r6D1w9+KdVvq0JW/QJlHLGADSCU4gCsCk
	IaUmJy80+YDH1WjtRT5vgC058pkq6YPoRVW7IKtWc2Xqxl+rPHp7zhz1eKmY3oBpSJGx
	eMII3LHYF3qLQD1v+zsW37bB/vMfaPySSEg3CsPBxPFBo14UDjVMHvJCveBnnbKOeN0E
	4ryaVnwCyqvMur1OldCj9ySfmpkcSUg26Q5UMMLVAtHYkM9XBalZN02+rLpqsqldg55W
	csY6aSlRflzEKY981Jx+zyJgz9w9hcazaNsBqLe/Y91f6ndsul3PVQ9ok+pZXh5ozsKH
	fenA==
X-Gm-Message-State: AOPr4FVAKBcN8UA+NNJFG8aANoGK/SN7BMpz21P6nEkgGVK9tOYYwLUqqKpvHAl9XP3nxw==
X-Received: by 10.140.97.202 with SMTP id m68mr22175951qge.102.1461344410020; 
	Fri, 22 Apr 2016 10:00:10 -0700 (PDT)
Received: from lnx-desktop.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	r136sm2618874qke.46.2016.04.22.10.00.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 22 Apr 2016 10:00:09 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Apr 2016 12:59:42 -0400
Message-Id: <1461344382-7379-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python-parted: update to version 3.10.7
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
X-List-Received-Date: Fri, 22 Apr 2016 17:00:10 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../{python-pyparted_3.10.5.bb => python-pyparted_3.10.7.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-extended/python-pyparted/{python-pyparted_3.10.5.bb => python-pyparted_3.10.7.bb} (91%)

diff --git a/meta-python/recipes-extended/python-pyparted/python-pyparted_3.10.5.bb b/meta-python/recipes-extended/python-pyparted/python-pyparted_3.10.7.bb
similarity index 91%
rename from meta-python/recipes-extended/python-pyparted/python-pyparted_3.10.5.bb
rename to meta-python/recipes-extended/python-pyparted/python-pyparted_3.10.7.bb
index d5b8f9a..712c4b9 100644
--- a/meta-python/recipes-extended/python-pyparted/python-pyparted_3.10.5.bb
+++ b/meta-python/recipes-extended/python-pyparted/python-pyparted_3.10.7.bb
@@ -10,10 +10,10 @@ LIC_FILES_CHKSUM = "\
 "
 DEPENDS += "parted python-re"
 
-PV = "3.10.5+git${SRCPV}"
+PV = "3.10.7+git${SRCPV}"
 
 # upstream only publishes releases in github archives which are discouraged
-SRCREV = "75bba5a5c8b65b21979d69421f661f7708304191"
+SRCREV = "69c4a478e43d3eff6ae3a0116fa38da06776d5f5"
 SRC_URI = "git://github.com/rhinstaller/pyparted.git;protocol=https \
            file://0001-fix-version-float-check.patch \
 "
-- 
1.9.1


