Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Rd0Ms-00044O-US
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Dec 2011 15:08:35 +0100
Received: by mail-ee0-f47.google.com with SMTP id t10so2604639eei.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Dec 2011 06:01:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=QxJocBZ9ncfPW5axfo0lMAawWf9mHOPhhRYD/k0Y+sY=;
	b=nZ+UAjfg58Jgau+HYXCsY8xWFGgpaB463EAaRnT3fST3rRNsgtMoXYQwWbmqS0/QAa
	PZz5a7vikcHArPwoiPUg7Av43baBNvLOp02UjgSbomcNtNdCWybJ189gSZmu+HPwkZtF
	HM+Zt8K9RWlaBEg5CErCkkriaWIc0s3c87+4U=
Received: by 10.213.20.216 with SMTP id g24mr3567229ebb.60.1324389692999;
	Tue, 20 Dec 2011 06:01:32 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id j20sm7125369eej.8.2011.12.20.06.01.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 20 Dec 2011 06:01:32 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 20 Dec 2011 15:01:11 +0100
Message-Id: <105290205ec2f0823131a0def5d173f77594b2c4.1324389403.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8
In-Reply-To: <458f724d9bdb716b6907ea797a92fe0f67f1f72b.1324389403.git.Martin.Jansa@gmail.com>
References: <458f724d9bdb716b6907ea797a92fe0f67f1f72b.1324389403.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1324389403.git.Martin.Jansa@gmail.com>
References: <cover.1324389403.git.Martin.Jansa@gmail.com>
Subject: [PATCH][meta-oe][meta-efl 2/7] edje: fix unpackaged multisense modules
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 20 Dec 2011 14:08:35 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/edje.inc |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/meta-efl/recipes-efl/efl/edje.inc b/meta-efl/recipes-efl/efl/edje.inc
index 7c415d2..9a62156 100644
--- a/meta-efl/recipes-efl/efl/edje.inc
+++ b/meta-efl/recipes-efl/efl/edje.inc
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c18cc221a14a84b033db27794dc36df8"
 inherit efl
 
 BBCLASSEXTEND = "native nativesdk"
-INC_PR = "r1"
+INC_PR = "r2"
 
 do_configure_prepend_virtclass-native() {
 	sed -i 's:EMBRYO_PREFIX"/bin:"${STAGING_BINDIR}:' ${S}/src/bin/edje_cc_out.c
@@ -56,3 +56,7 @@ FILES_${PN}-utils = "\
   ${libdir}/edje/utils/epp \
   ${datadir}/edje/include/edje.inc \
 "
+
+FILES_${PN} += "${libdir}/${PN}/modules/*/*/module.${SOLIBS}"
+FILES_${PN}-dev += "${libdir}/${PN}/modules/*/*/module.la"
+FILES_${PN}-dbg += "${libdir}/${PN}/modules/*/*/.debug"
-- 
1.7.8



