Return-Path: <danismostlikely@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 2CFDC606A8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jul 2016 14:52:42 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id g202so3633928pfb.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jul 2016 07:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=o4UOK5uoyeHIoNGDtacHy4KyyR21fdGIUq4ieW7ZGDI=;
	b=o88luUx+seaunkgca+JEHOolGy1oBcZqM185/dWKpFXlgbwrC9X54G0USlrCwtdQiq
	UTtc+aZqDgfLcFJha8G6xel6irVz7DGTY90nGgxexCUF+cXd8voFybYhI7ql4o7TN6Ib
	BLr/PkVMwOZXvJimkFm+N0x9Vmlfz9aKv42gkCnOlFTfhiB1WzBwEczW2Hj7JChAVj0r
	/42v9MGTe4PHAPXuTEfIAoXRe3PYXTebQsSg0PiL6XM5JRYdGG4ZQe+xtWb+yWB0tzyA
	gYOyXe3xpU+n+Dorc6vsGKe3njvVjT8jZT+dNaHt/xAEaMjkpQHsUHtvEC8LkBTvC8pc
	UAWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=o4UOK5uoyeHIoNGDtacHy4KyyR21fdGIUq4ieW7ZGDI=;
	b=UXfuwiCUo/g0qgMtxz+8JuMARNOFZvzvhD6ebHpd1EtOI3CRxGV3YplISmH+9T4/1J
	AIm4F3n/ScYVDPUtrBHJAjUKL0ltLZyPeijZhpiS4dH7tF9FyReaFcrvNaB2FFCXnzGg
	LqViW0ljS2TrTUOqQVWWzJ41sMKZGPLd5738fyX5jymGrkULCXwRuMe6wAJKk9cT2TeC
	H+mlD33e7encMhLXkbcegjl3OhyI5f9kWE5yg5VGRWewI1/W28jO1Px6c4IpyzGM7vVC
	y1noXXF4CE/KaBpswYNGnYrc4HePUKxXK4Eb/eXB10i9oQROCiBMnoJOe1w482vxmAvM
	t/Iw==
X-Gm-Message-State: ALyK8tLpLBrTfrJjqqgjI6FxxrCWKceSB9w5PkmCXnJUDJadtRcty5fMBaSE7EUTJGVlKw==
X-Received: by 10.98.152.129 with SMTP id d1mr65978154pfk.126.1469026363431;
	Wed, 20 Jul 2016 07:52:43 -0700 (PDT)
Received: from mediabox.local (71-17-245-40.sktn.hsdb.sasknet.sk.ca.
	[71.17.245.40])
	by smtp.gmail.com with ESMTPSA id xl1sm5384736pab.8.2016.07.20.07.52.42
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Jul 2016 07:52:42 -0700 (PDT)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Jul 2016 08:52:40 -0600
Message-Id: <20160720145240.10287-1-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.9.1
Subject: [meta-java][PATCH] openjdk-8-common: fix inline python
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
X-List-Received-Date: Wed, 20 Jul 2016 14:52:44 -0000

From: Daniel McGregor <daniel.mcgregor@vecima.com>

Ensure that the inline python doensn't try to expand a non-existant
variable.

Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
---
 recipes-core/openjdk/openjdk-8-common.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/recipes-core/openjdk/openjdk-8-common.inc b/recipes-core/openjdk/openjdk-8-common.inc
index 089f907..4a2af6f 100644
--- a/recipes-core/openjdk/openjdk-8-common.inc
+++ b/recipes-core/openjdk/openjdk-8-common.inc
@@ -274,7 +274,9 @@ def version_specific_cflags(d):
     if int(version) >= 4:
         extraflags = d.getVar('FLAGS_GCC%d' % int(version), True)
 
-    return ''.join(extraflags)
+    if extraflags:
+        return ''.join(extraflags)
+    return ''
 
 CFLAGS_append = " ${@version_specific_cflags(d)}"
 CXXFLAGS_append = " ${@version_specific_cflags(d)}"
-- 
2.9.1


