Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id A48F26B4F7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2014 11:37:18 +0000 (UTC)
Received: by mail-wi0-f182.google.com with SMTP id ex4so2052602wid.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2014 03:37:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=MkuAuP9XKmdDxcrurtcKRbEbzoRtT8AuhkNObJIWDic=;
	b=m3C/oyRU4lXE06di1B/NZC8wbHj+qn6YnNGotJ6KmOfEhT8VT8Zw8q7F/tKdWj1rul
	BedseoLKExhqoGnYAP1y/angpJ+rwIUOo10TvXQEosCU1WrDlQRR3wau+papD22yieOq
	xBqwRvaFnmGq+BK9EE+mW+RjnzwBGUCDeT1JIwcO1LctsNitDaZYrJts+4iAEamCO+OV
	v+5FMK2ENJMmlF3YU6twtPHMaPmT4T3WSyhwiMnzSEM9MOaQ8VxhPSVtvzv4Zt7Kf6RK
	S6Or34/Ii4dLoCK54dTj+p71E92uySlgMZg12cWwiA+tnJ4g/2MkSPMdqf+FAllRp//X
	dudw==
X-Gm-Message-State: ALoCoQnhZcof1GfxMbpIXXrEerKIQaqJlSV5RZUUR57gZ764Y/XSFHHCFGH7VZygXUMH44wmFoYA
X-Received: by 10.180.77.129 with SMTP id s1mr1763566wiw.56.1389785837553;
	Wed, 15 Jan 2014 03:37:17 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id ea4sm9087026wib.7.2014.01.15.03.37.16
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 15 Jan 2014 03:37:16 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Jan 2014 11:37:08 +0000
Message-Id: <1389785832-3120-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [meta-oe][PATCH 1/5] wmxml2: don't do out-of-tree builds manually
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
X-List-Received-Date: Wed, 15 Jan 2014 11:37:19 -0000

cmake.bbclass as of oe-core 783fb88 defaults to out-of-tree builds.  Use that
functionality instead of passing arguments to EXTRA_OECMAKE and _prepends.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-oe/recipes-support/opensync/wbxml2_0.10.8.bb |   10 ----------
 1 file changed, 10 deletions(-)

diff --git a/meta-oe/recipes-support/opensync/wbxml2_0.10.8.bb b/meta-oe/recipes-support/opensync/wbxml2_0.10.8.bb
index bca305f..c66e6dc 100644
--- a/meta-oe/recipes-support/opensync/wbxml2_0.10.8.bb
+++ b/meta-oe/recipes-support/opensync/wbxml2_0.10.8.bb
@@ -15,17 +15,7 @@ S = "${WORKDIR}/libwbxml-${PV}"
 
 inherit cmake pkgconfig
 
-EXTRA_OECMAKE += " . -B${WORKDIR}/build "
-
 PACKAGES += "${PN}-tools"
 
 FILES_${PN}-tools = "${bindir}"
 FILES_${PN} = "${libdir}/*.so.*"
-
-do_build_prepend() {
-    cd ${WORKDIR}/build
-}
-
-do_install_prepend() {
-    cd ${WORKDIR}/build
-}
-- 
1.7.10.4


