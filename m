Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f50.google.com (mail-ee0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id 632D76B6BC
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Jan 2014 12:57:32 +0000 (UTC)
Received: by mail-ee0-f50.google.com with SMTP id c41so5816616eek.37
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Jan 2014 04:57:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=05QfgwLWhzxA3BFTggukcTsGxU7s3IisMDxr7E/XZ0Y=;
	b=gS67rPbOrA/MUQNd6uK3jAzkcoPWZa/gRvarPM476ltskxzhBz2qgyOEXJAS/PUhHc
	x5mPWt94v/sms8IdHHEV9bAIBtqBm2DDvN2yUGgYPBJbGdEWPoiTdmOTwbGoija630N4
	/V4jXKgU+lr0an+eGoemMfLTV+gJL+kW5Zv953VdoXz6hQmOSUmjf0TaMjZ38VLvz9/M
	5wXt2+kRpXF1C0680Dxy1R4vlvSeTOFF+I2ebF/lkXHrZjG33Qs2Res9UKG+RaHqv8MU
	q2xYJZxvTqNEqrDzFqe0a72CBqvQwDaSlm7ae26A9hYtRmI1PwvhVP6Bl+PFPqiaoWD2
	EZhA==
X-Received: by 10.14.110.134 with SMTP id u6mr10902587eeg.87.1388581053193;
	Wed, 01 Jan 2014 04:57:33 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id v1sm126883199eef.9.2014.01.01.04.57.32
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 Jan 2014 04:57:32 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Jan 2014 13:57:25 +0100
Message-Id: <1388581046-8713-7-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.4.3
In-Reply-To: <1388581046-8713-1-git-send-email-Martin.Jansa@gmail.com>
References: <1388581046-8713-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][WIP][PATCH 7/8] ajenti: Bump SRCREV a bit got get revision included in some branch
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
X-List-Received-Date: Wed, 01 Jan 2014 12:57:32 -0000

* old c08fb4da65923aebd09116750a1f43f13b98a51a exists only in 0.6.2 tag and latest
  bitbake refuses to fetch it

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-webserver/recipes-webadmin/ajenti/ajenti_git.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-webserver/recipes-webadmin/ajenti/ajenti_git.bb b/meta-webserver/recipes-webadmin/ajenti/ajenti_git.bb
index 83e92f6..f499339 100644
--- a/meta-webserver/recipes-webadmin/ajenti/ajenti_git.bb
+++ b/meta-webserver/recipes-webadmin/ajenti/ajenti_git.bb
@@ -9,7 +9,7 @@ DEPENDS += "python-pyopenssl python-lxml python-gevent python-greenlet \
 
 PV = "0.6.2+git${SRCPV}"
 
-SRC_URI = "git://github.com/Eugeny/ajenti.git \
+SRC_URI = "git://github.com/Eugeny/ajenti.git;branch=ajenti-0.6.x \
            file://0001-setup.py-remove-extra-data-files.patch \
            file://0002-plugins-hddstat-fix-disk-usage-check-to-work-with-bu.patch \
            file://0003-plugins-sysload-fix-to-work-with-busybox.patch \
@@ -22,8 +22,7 @@ SRC_URI = "git://github.com/Eugeny/ajenti.git \
 DISTRO_FILES = "file://distro-detection-openembedded.patch \
                 file://distributor-logo-openembedded.png"
 
-# Corresponds to the 0.6.2 tag
-SRCREV = "c08fb4da65923aebd09116750a1f43f13b98a51a"
+SRCREV = "411acfd0b96ad7a9bd79b3bdc1f9eef394f62198"
 
 S = "${WORKDIR}/git"
 
-- 
1.8.4.3


