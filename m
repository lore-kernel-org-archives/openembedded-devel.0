Return-Path: <koen.kooi@linaro.org>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 64F9A76312
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Jun 2016 08:39:03 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id n184so125895462wmn.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Jun 2016 01:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=AQXOp+zWBDsJgZafWG9VozDKDusvR3HO2RoKpZV3Cdg=;
	b=YEW3TEAVdDKtmGG05KreQOvNS96VF4q9Cyobfz6t7WDWmSH6ExfdBCBT47zWPnKM/1
	o49YW0Q+MczvKSFhsXR0Vdd9TZ3BvW79Vi/au89u4nG7Dke1eqQYSho+kBME8LzqzTzA
	UqH0/0z8Mbt0p7VbLD6ZGM7C2XlGzdh33I0fI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=AQXOp+zWBDsJgZafWG9VozDKDusvR3HO2RoKpZV3Cdg=;
	b=ULtIMyGJMhOeX4I+sAzBrz8RD5J1wBwUv9T0Hcivs1dLa1ZrQUUwSHbS8iwZdJtXjf
	3J3M7Vf08sQgoPM4L+j2+kseP2AFEmrEwWY0lTsNDd/oYdASzbmosnQkH43XyRfL58zt
	SkN/PDnphM+4zHBONeBvMN1fkr0cpPiY0WjoCNS8Ubu87CBbV3+xrmdrmCoY06biSTDI
	k7VRyW/brJkW2T7PqT3vGxxrDIWvyB/qblKaGZiqHzNNUUJ4D/m24jmra6Hv1CM8/TmG
	9MwKM4PShOAHVE/jj/4nXhImoDks+kM4db2o8Myo2p11KN+xxU8r2Ts4U4gTRZkq4Dt7
	AvFA==
X-Gm-Message-State: ALyK8tKu/5hTWVHhFVxLcG+ytagnvj38nYOmYKFyOdkvDNI1XTvIQK4aUZyHI36gcR3C189X
X-Received: by 10.28.136.200 with SMTP id k191mr1362605wmd.57.1465288744409;
	Tue, 07 Jun 2016 01:39:04 -0700 (PDT)
Received: from thinkpad.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by smtp.gmail.com with ESMTPSA id t1sm24301018wjy.3.2016.06.07.01.39.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 07 Jun 2016 01:39:03 -0700 (PDT)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 Jun 2016 10:38:52 +0200
Message-Id: <1465288732-2288-2-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 2.4.3
In-Reply-To: <1465288732-2288-1-git-send-email-koen.kooi@linaro.org>
References: <1465288732-2288-1-git-send-email-koen.kooi@linaro.org>
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [meta-gnome][PATCH 2/2] abiword 3.0.1: fix python code to work with python3
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
X-List-Received-Date: Tue, 07 Jun 2016 08:39:05 -0000

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 meta-gnome/recipes-gnome/abiword/abiword_3.0.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/abiword/abiword_3.0.1.bb b/meta-gnome/recipes-gnome/abiword/abiword_3.0.1.bb
index 962a56c..0d0ba11 100644
--- a/meta-gnome/recipes-gnome/abiword/abiword_3.0.1.bb
+++ b/meta-gnome/recipes-gnome/abiword/abiword_3.0.1.bb
@@ -102,7 +102,7 @@ FILES_${PN}-templates      += "${datadir}/${PN}-${SHRT_VER}/templates"
 PACKAGES_DYNAMIC += "^${PN}-meta.* ^${PN}-plugin-.*"
 
 python populate_packages_prepend () {
-    abiword_libdir    = d.expand('${libdir}/${PN}-${SHRT_VER}/plugins')
+    abiword_libdir = d.expand('${libdir}/${PN}-${SHRT_VER}/plugins')
     do_split_packages(d, abiword_libdir, '(.*)\.so$', 'abiword-plugin-%s', 'Abiword plugin for %s', extra_depends='')
 
     metapkg = "abiword-meta"
@@ -113,7 +113,7 @@ python populate_packages_prepend () {
     packages = d.getVar('PACKAGES', 1).split()
     for pkg in packages[1:]:
         if not pkg in blacklist and not pkg in metapkg_rdepends and not pkg.count("-dev") and not pkg.count("-dbg") and not pkg.count("static") and not pkg.count("locale") and not pkg.count("abiword-doc"):
-            print "Modifying ", pkg
+            print ("Modifying %s" % pkg)
             metapkg_rdepends.append(pkg)
     d.setVar('RDEPENDS_' + metapkg, ' '.join(metapkg_rdepends))
     d.setVar('DESCRIPTION_' + metapkg, 'abiword-plugin meta package')
-- 
2.4.3


