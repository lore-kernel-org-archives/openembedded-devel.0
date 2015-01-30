Return-Path: <ashcharles@gmail.com>
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com
	[209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id 2D7F16076E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jan 2015 17:16:34 +0000 (UTC)
Received: by mail-pa0-f53.google.com with SMTP id kx10so54559275pab.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jan 2015 09:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=dWb+9yz15evB19nkpzwPOvYvoADaX9Qb1iH3yioWnD4=;
	b=Bb+OEwUjqa2YR0zBXV9POL++31eYfcEUaoc/8MA/oCetUQ8YZyUYko+O+ssb+sCDPK
	DvOJ8l/Ibb4tlZnVgHEiXTDONNjcAmVmt1mMG7zzI2pZ0OpREfiPysx0H/LoGsPHdz9K
	S7vnEXbtNXPi7OYl9n85za59Z3rdjwWhZjpxX58NtF/5XuuPXZZsspYxjxMm+9B5lc4i
	fRRuRWsBz3SqO1TZpIw3nhRTNP60jK6s0M4pd0p/6dynRY0tNaGFTnEa0oKvC4YCHI+o
	pqtwPp5Ynb29yiIhmmSFQ3OctJfd8hSl5sE6a6Be8Q5weZJkaIYeGxIcBG/OilNZ8Nqf
	STEw==
X-Received: by 10.70.88.231 with SMTP id bj7mr10123848pdb.168.1422638195603;
	Fri, 30 Jan 2015 09:16:35 -0800 (PST)
Received: from gumstux.bchsia.telus.net (s206-116-3-18.bc.hsia.telus.net.
	[206.116.3.18]) by mx.google.com with ESMTPSA id
	uc2sm11316859pbc.56.2015.01.30.09.16.34
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 30 Jan 2015 09:16:34 -0800 (PST)
From: Ash Charles <ashcharles@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Jan 2015 09:16:33 -0800
Message-Id: <1422638194-21335-1-git-send-email-ashcharles@gmail.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH 1/2] xfce4-xkb-plugin: Specify GPLv2 license
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
X-List-Received-Date: Fri, 30 Jan 2015 17:16:43 -0000

Like several other xfce plugins, this software contains an older or
slightly modified BSD license in its COPYING file and assigns copyright
to the specific authors.  The code itself (see the xfce_xkb_about
function) however makes it clear that a GPL license is intended:

    xfce_get_license_text (XFCE_LICENSE_TEXT_GPL));

Use GPLv2, not the author's name, as the LICENSE matching other plugins
with the same license text.

Signed-off-by: Ash Charles <ashcharles@gmail.com>
---
 meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.7.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.7.0.bb b/meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.7.0.bb
index 1109f31..22ead2a 100644
--- a/meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.7.0.bb
+++ b/meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.7.0.bb
@@ -1,7 +1,7 @@
 SUMMARY = "XKB layout switching panel plug-in for the Xfce desktop environment"
 HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-xkb-plugin"
 SECTION = "x11/application"
-LICENSE = "Alexander_Iliev"
+LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=496f09f084b0f7e6f02f769a84490c6b"
 
 inherit xfce-panel-plugin
-- 
2.1.0


