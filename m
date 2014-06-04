Return-Path: <akuster@mvista.com>
Received: from mail-pd0-f173.google.com (mail-pd0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id 6A1B16FA7A
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Jun 2014 01:08:23 +0000 (UTC)
Received: by mail-pd0-f173.google.com with SMTP id v10so5355556pde.32
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Jun 2014 18:08:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Xv9jW914+Jlbr7sgxnQywUKZO8PB5NmP2L7xc75oJGQ=;
	b=ZPvKQ8wqnIHyYhiZkRvLry9xJ5ms/ngC+90wtEDHO5i5FKU/kxxWPJa9LthQ7s2rmN
	/q6eT7WyYXwLinPWb3U1zGwZvSfn5rm0zcHopmixBLzQ7MiATv9J3MmC6HGVlmYDzN5B
	tNKkkjsY+JmCQMllBKc+/klZUKDcirz7td8ZLbMvOrEnA/k/jmvOilWvYma0WYiW4RZI
	9ivderlmktY83SBEDRGMbe5YFwbjFeHQdxyWZx6Op5XhBTE805mJYpC0rQ/VIaMcBcrM
	z1515bp6/vMPc7V3Lb1gzPzcVnkmMnwKMCy+aXee4K9DxItbZ5St0ZpohyzUXQcHaCGb
	7lbA==
X-Gm-Message-State: ALoCoQmIgZVGID0MWScqSBl5Y0XQKWZ6FKD6XyloE9CArlP9FZEigeYe9E1lrgUPgUBMzpFcUkGz
X-Received: by 10.69.26.103 with SMTP id ix7mr55772317pbd.41.1401844103846;
	Tue, 03 Jun 2014 18:08:23 -0700 (PDT)
Received: from Pahoa2.mvista.com (64.2.3.195.ptr.us.xo.net. [64.2.3.195])
	by mx.google.com with ESMTPSA id rc3sm2880305pbc.5.2014.06.03.18.08.22
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 03 Jun 2014 18:08:23 -0700 (PDT)
From: Armin Kuster <akuster@mvista.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  3 Jun 2014 18:08:20 -0700
Message-Id: <1401844100-579-1-git-send-email-akuster@mvista.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH] tipcutils B!=S fix
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
X-List-Received-Date: Wed, 04 Jun 2014 01:08:25 -0000

The do_install_append was trying to install from src location and not the build.

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta-oe/recipes-extended/tipcutils/tipcutils_2.0.6.bb | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-extended/tipcutils/tipcutils_2.0.6.bb b/meta-oe/recipes-extended/tipcutils/tipcutils_2.0.6.bb
index ee56952..fe0e484 100644
--- a/meta-oe/recipes-extended/tipcutils/tipcutils_2.0.6.bb
+++ b/meta-oe/recipes-extended/tipcutils/tipcutils_2.0.6.bb
@@ -20,15 +20,15 @@ do_install_append() {
            multicast_demo stream_demo"
     for i in $demos;do
         install -d ${D}/opt/tipcutils/demos/$i
-        install ${S}/demos/$i/client_tipc ${D}/opt/tipcutils/demos/$i/
-        install ${S}/demos/$i/server_tipc ${D}/opt/tipcutils/demos/$i/
+        install ${B}/demos/$i/client_tipc ${D}/opt/tipcutils/demos/$i/
+        install ${B}/demos/$i/server_tipc ${D}/opt/tipcutils/demos/$i/
     done
     install -d ${D}/opt/tipcutils/demos/inventory_sim
-    install ${S}/demos/inventory_sim/inventory_sim ${D}/opt/tipcutils/demos/inventory_sim/
+    install ${B}/demos/inventory_sim/inventory_sim ${D}/opt/tipcutils/demos/inventory_sim/
 
     install -d ${D}/opt/tipcutils/ptts
-    install ${S}/ptts/tipcTS ${D}/opt/tipcutils/ptts/
-    install ${S}/ptts/tipcTC ${D}/opt/tipcutils/ptts/
+    install ${B}/ptts/tipcTS ${D}/opt/tipcutils/ptts/
+    install ${B}/ptts/tipcTC ${D}/opt/tipcutils/ptts/
 
     install -d ${D}${sysconfdir}
     cp -a ${S}/scripts/etc/* ${D}${sysconfdir}/
-- 
1.9.1


