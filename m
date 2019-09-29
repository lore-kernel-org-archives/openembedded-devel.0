Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
	[209.85.210.178])
	by mail.openembedded.org (Postfix) with ESMTP id 44A287F278
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Sep 2019 23:55:19 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id v4so4501050pff.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Sep 2019 16:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=cwkp7P9ceazueeYE7dmCpyyC6U1VOLCTu+r3Ewp9YE4=;
	b=XzrtjEeZXFjuluaab3lsc3fg2oPJYQGAEBsipAzxoDJ5weYXzBlgEZQcWeO4GeV9eF
	FASjPZVarySFNimWJ3k8u5Lg3vCWHuvNoonkWkB6PDqzi+kO23ZV3FM29psRfMm6ABns
	86eXUCiRrm/oX7qvuQ470Yz5FTfbwl9lBPNAjROxC3SmmU2mIF2YNkZw9PXV/aQw+kmE
	qUPKlURg7Qc9lK2jfLOeJ7y/nsC2dduB9CKmmuHyWltuXj+7xROdEcEErVZyJMGRPp9k
	t73mLtITtb/Oxk2V3nDNIDSemgN026gBreEWZ5Q9YupYBKkIf//XzQQTuYIWdhPNoygN
	TrYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=cwkp7P9ceazueeYE7dmCpyyC6U1VOLCTu+r3Ewp9YE4=;
	b=apC9u6PXwpy44g348TBvO1OCiLiZ2ERtsQt5ZDuB7VGlHIOSwuaqnliX2Ed/RgInvL
	kS07cvhLRZh88Bzc1EXtBdTp+tX6RVtzTgVMfYejf/1hmKlr15tymu2zI/lb0Dp/ZyNA
	s1bVcEgsExc9EAoSQe7FqpKCN3KP3fpdAKzsAA7t9AvEJZRMG6oXwfaJPWHTBHv6oQq3
	0kb6uIpostwecPk5XTip/iA9lYoMqoOXSBWHLtca0iB2LPQlatp7eXIJmwFlll82YGq6
	OYMbpbP6VkjtxluNaO3qDvcA0pWqhscTKdvc3gEPWrlke3GKEhwLiIU0D6FMtMlmlprJ
	oARA==
X-Gm-Message-State: APjAAAVnWCV6B6+gVrbe2eGauXGgZXtXWf25zC2T0uuh1AFxaMGQe5Ic
	ajFu3da8sKAh1ePcLNJvqPDbptatw9o=
X-Google-Smtp-Source: APXvYqz8DH6ZKnV8s8X0lnW3wEu0gWSGYWk+ANh5G/jYx4957lSVApc5AiGukmILv8F9D0dKmUImbw==
X-Received: by 2002:a63:ea52:: with SMTP id l18mr21756902pgk.145.1569801320274;
	Sun, 29 Sep 2019 16:55:20 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:edf9:811d:ad92:85c2])
	by smtp.gmail.com with ESMTPSA id
	p190sm14474778pfb.160.2019.09.29.16.55.19
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 29 Sep 2019 16:55:19 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 29 Sep 2019 16:55:01 -0700
Message-Id: <aee04896d0d91d478b054080ef7a59e2d9e7696d.1569801183.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569801183.git.akuster808@gmail.com>
References: <cover.1569801183.git.akuster808@gmail.com>
Subject: [warrior-next 03/10] apache2: fix multilib file conflicts
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
X-List-Received-Date: Sun, 29 Sep 2019 23:55:19 -0000

From: Kai Kang <kai.kang@windriver.com>

There are errors of apache2 about files conflicts when multilib enabled:

| Error: Transaction check error:
|   file /etc/apache2/extra/httpd-ssl.conf conflicts between attempted installs of lib32-apache2-2.4.41-r0.core2_32 and apache2-2.4.41-r0.core2_64
|   file /etc/apache2/httpd.conf conflicts between attempted installs of lib32-apache2-2.4.41-r0.core2_32 and apache2-2.4.41-r0.core2_64
|   file /usr/sbin/envvars conflicts between attempted installs of lib32-apache2-2.4.41-r0.core2_32 and apache2-2.4.41-r0.core2_64
|   file /usr/sbin/envvars-std conflicts between attempted installs of lib32-apache2-2.4.41-r0.core2_32 and apache2-2.4.41-r0.core2_64

It makes libexecdir point to ${libdir}. Reset to ${libexecdir} which could
eliminate file conflicts of the conf files. And remove /usr/sbin/envvars and
/usr/sbin/envvars-std which only used by apachectl. They only add standard
library path ${libdir} to LD_LIBRARY_PATH, so remove them to avoid multilib
file conflicts.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 8d4d608b4e937bb3b8e3b260bd75338c3ff7e8fd)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-webserver/recipes-httpd/apache2/apache2_2.4.41.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.41.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.41.bb
index be9c864..04fff64 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.41.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.41.bb
@@ -53,7 +53,7 @@ EXTRA_OECONF_class-target = "\
     --sysconfdir=${sysconfdir}/${BPN} \
     --datadir=${datadir}/${BPN} \
     --libdir=${libdir} \
-    --libexecdir=${libdir}/${BPN}/modules \
+    --libexecdir=${libexecdir}/${BPN}/modules \
     --localstatedir=${localstatedir} \
     --enable-ssl \
     --with-dbm=sdbm \
@@ -78,7 +78,7 @@ EXTRA_OECONF_class-native = "\
     "
 
 do_configure_prepend() {
-    sed -i -e 's:$''{prefix}/usr/lib/cgi-bin:$''{libdir}/cgi-bin:g' ${S}/config.layout
+    sed -i -e 's:$''{prefix}/usr/lib/cgi-bin:$''{libexecdir}/cgi-bin:g' ${S}/config.layout
 }
 
 do_install_append_class-target() {
@@ -139,7 +139,7 @@ do_install_append_class-target() {
         install -m 0644 ${WORKDIR}/volatiles.04_apache2 ${D}${sysconfdir}/default/volatiles/04_apache2
     fi
 
-    rm -rf ${D}${localstatedir}
+    rm -rf ${D}${localstatedir} ${D}${sbindir}/envvars*
     chown -R root:root ${D}
 }
 
-- 
2.7.4


