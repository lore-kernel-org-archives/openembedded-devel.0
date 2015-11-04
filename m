Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 8218C75E2D
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Nov 2015 23:44:20 +0000 (UTC)
Received: by wicfv8 with SMTP id fv8so42199691wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Nov 2015 15:44:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=xMiTAqp72SBD2d3QS3rWZ1E6E1j8780neS2BbAfNQSc=;
	b=SgOWFEUgd/WAny4SMxgDMdlkl89ASv31rs5118idq3422I11HEBqp+pW7rh+OheMXI
	OQPeB6jbWv1VGXyvFfkhIaFufhwL/qqwUAM15agUlubRAiMdVEyrBIm3NvUGhP4jN4vF
	J9g3C5NN1nkZFbNlnJ6HQ+1bRY23V+NXa4f98sWP/vjBtwTvZW/uwHHtTRS4laSkqw/1
	JY4R5+jz7OC2QuJbKdJgeemVZuvA5M9+j5gze93QZfF7mU35W2De+9Lybadz/6/s3zkZ
	5EoYIvD8PdIiUAcOvArEEzmfquz9S5Q1Uafwspr0hHZoimRy01/fAY7FVJuvN4NY362I
	bGww==
X-Received: by 10.194.184.81 with SMTP id es17mr4699704wjc.10.1446680659910;
	Wed, 04 Nov 2015 15:44:19 -0800 (PST)
Received: from localhost.localdomain (p5B0A127D.dip0.t-ipconnect.de.
	[91.10.18.125]) by smtp.googlemail.com with ESMTPSA id
	184sm5390014wmk.10.2015.11.04.15.44.19
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Nov 2015 15:44:19 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Nov 2015 00:43:44 +0100
Message-Id: <1446680640-31722-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1446680640-31722-1-git-send-email-schnitzeltony@googlemail.com>
References: <1446680640-31722-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH][v2 02/18] xfce-polkit: initial add 0.2
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
X-List-Received-Date: Wed, 04 Nov 2015 23:44:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-apps/xfce-polkit/xfce-polkit_0.2.bb | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta-xfce/recipes-apps/xfce-polkit/xfce-polkit_0.2.bb

diff --git a/meta-xfce/recipes-apps/xfce-polkit/xfce-polkit_0.2.bb b/meta-xfce/recipes-apps/xfce-polkit/xfce-polkit_0.2.bb
new file mode 100644
index 0000000..ab720f8
--- /dev/null
+++ b/meta-xfce/recipes-apps/xfce-polkit/xfce-polkit_0.2.bb
@@ -0,0 +1,11 @@
+SUMMARY = "A simple PolicyKit authentication agent for XFCE"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=758b03f872a88c99fc36d50c5932091c"
+
+DEPENDS = "libxfce4ui polkit"
+
+inherit xfce-app
+
+SRC_URI = "git://github.com/ncopa/${BPN}.git"
+SRCREV = "6ad1ee833c9e22e4dd72a8f7d54562d046965283"
+S = "${WORKDIR}/git"
-- 
2.1.0


