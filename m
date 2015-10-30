Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 94DEB75894
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Oct 2015 12:14:17 +0000 (UTC)
Received: by wmff134 with SMTP id f134so10340659wmf.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Oct 2015 05:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=RmWG9BamULNBaudeDZEk/DhRKrMqqkHnAcDzXfDQ6ds=;
	b=qoIfYMQHyzAM7zPP3ttW3ZT9WK225WmdkeWIUWZuW7yXuXUHDDC5UW9Gbfi9eEr6fc
	pqbwmryvhAB6GZJB4CbHCQ1S4E+DjwQMDp4Vy1PjLVjTgYMzJcICWTuSVHEKs0Dq5ZAI
	pTLNKuwiOepHejX7NI2kP4zA6DIkNRIiGT3hel0SR1569ZKUA3jMzfyKWJDynHqixoUQ
	SNzm4Y07/jT+/8bPNEL4AXv+AIAKnZd8riATBc9i5ny4V/khmAiMPtMsiB7wctIxCRfM
	Su6e3OkmZQPEeO04mN9yHgn27KCqo9yfL5t4lMNvrrddyFjztAqOuMLmirqrwEvMy0Xj
	WLug==
X-Received: by 10.28.6.70 with SMTP id 67mr3272401wmg.54.1446207257145;
	Fri, 30 Oct 2015 05:14:17 -0700 (PDT)
Received: from localhost.localdomain
	(ip-95-222-156-185.hsi15.unitymediagroup.de. [95.222.156.185])
	by smtp.googlemail.com with ESMTPSA id
	184sm2636122wmk.10.2015.10.30.05.14.16
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 30 Oct 2015 05:14:16 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Oct 2015 13:13:33 +0100
Message-Id: <1446207225-15386-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1446207225-15386-1-git-send-email-schnitzeltony@googlemail.com>
References: <1446207225-15386-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 01/13] xfce4-vala: unbreak by telling configure vala API version
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
X-List-Received-Date: Fri, 30 Oct 2015 12:14:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb b/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb
index 7bcffe5..c1900e9 100644
--- a/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb
+++ b/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb
@@ -5,12 +5,12 @@ DEPENDS = "libxfce4util garcon xfconf libxfce4ui xfce4-panel exo vala xfce4-dev-
 
 inherit xfce
 
-PNBLACKLIST[xfce4-vala] ?= "Fails to build since vala upgrade to 0.26.1"
-
 SRC_URI = "http://archive.xfce.org/src/bindings/${BPN}/${@xfce_verdir("${PV}")}/${BPN}-${PV}.tar.bz2"
 SRC_URI[md5sum] = "0bbb1d6e473e0fe9b335b7b1b49d8a71"
 SRC_URI[sha256sum] = "07a8f2b7c09fcdd3d86e0c52adea3c58ca011d0142a93997a01b4af77260ae7b"
 
+EXTRA_OECONF = "-with-vala-api=0.28"
+
 FILES_${PN} += "${datadir}/vala-*/vapi"
 
 RDEPENDS_${PN} = "vala"
-- 
2.1.0


