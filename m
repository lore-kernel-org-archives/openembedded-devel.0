Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f171.google.com (mail-pd0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id 27A8072658
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Dec 2014 17:22:56 +0000 (UTC)
Received: by mail-pd0-f171.google.com with SMTP id y13so14579417pdi.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Dec 2014 09:22:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=/Gdmu4/FFMC/Mwzvz0g8AXilT9N869QmZOpv2D9ihBo=;
	b=Y9zg0Yp0QaIs5Tc4yKZmWROuhrBx/a8y7VnWb4mW0I18npuz7pcrvO4+84PBAm9v8S
	25aiPJFxjFoXDwa6em+1IGgwRsENW/UX6S2o7AxA9fUHmKsuRpuj6lqSAV3VbFGjf1AK
	rnWT7BYfaX4MPQyCe2m6eMPuRwsNBFkSVjGJTsGCA0Tq8c+MFTWiE3h47RQzsLvPRu44
	g2eoEpke6n4R+pKKC7loAC/tXJetYQphXyQvio2YkSuerFcYYCkzaDTa52qekviBQpHn
	+ym5x08Am3q4Q7m7/IOHLYY6zVMSHsrBaoGjG92osxQLAW4LNvVdDEIzjYjZE200WlN4
	rvcg==
X-Received: by 10.68.139.201 with SMTP id ra9mr75396261pbb.41.1419700977692;
	Sat, 27 Dec 2014 09:22:57 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id
	fu1sm31202444pbb.91.2014.12.27.09.22.55
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 27 Dec 2014 09:22:56 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	otavio@ossystems.com.br
Date: Sat, 27 Dec 2014 09:22:10 -0800
Message-Id: <80c4c5c4ae30716dd2b4e05651ab5536e528f2c8.1419700394.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1419700394.git.akuster808@gmail.com>
References: <cover.1419700394.git.akuster808@gmail.com>
In-Reply-To: <cover.1419700394.git.akuster808@gmail.com>
References: <cover.1419700394.git.akuster808@gmail.com>
Subject: [PATCH 23/27] rfkill: fix the SRC_URI
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
X-List-Received-Date: Sat, 27 Dec 2014 17:22:57 -0000

From: Jackie Huang <jackie.huang@windriver.com>

It has been changed to:
http://www.kernel.org/pub/software/network/rfkill/

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-connectivity/rfkill/rfkill_0.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/rfkill/rfkill_0.4.bb b/meta-oe/recipes-connectivity/rfkill/rfkill_0.4.bb
index a9f523c..3b2943c 100644
--- a/meta-oe/recipes-connectivity/rfkill/rfkill_0.4.bb
+++ b/meta-oe/recipes-connectivity/rfkill/rfkill_0.4.bb
@@ -5,7 +5,7 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c6036d0eb7edbfced28c4160e5d3fa94"
 PR = "r1"
 
-SRC_URI = "http://wireless.kernel.org/download/${BPN}/${BP}.tar.bz2 \
+SRC_URI = "http://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.bz2 \
            file://0001-rfkill-makefile-don-t-use-t-the-OE-install-wrapper-d.patch \
            file://dont.call.git.rev-parse.on.parent.dir.patch"
 
-- 
1.9.1


