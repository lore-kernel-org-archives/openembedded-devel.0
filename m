Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 9335960722
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Mar 2016 10:18:17 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id i204so20519452wmd.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Mar 2016 03:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=5Bt1N7cNBgugvIqlwST6yXH+ECgY8vvemKVftjUvbbc=;
	b=d1GQzJKn/PFi06kD8p3IgWG/2ljvafM2tOG3g+uBDp0Un/jGVcgILX14iRcqT8nuUT
	IISDl1EdtG/ub2dmLootUlOjZYp4BSsZ2D7PkwtzjFT/dDcbBarwi4/NOeD189kyl5IW
	Nb/VZrXkzpPi0VWtln7/v3NDN5kcS9SyTPamS3x2VEYEEtMZLkdI2C2GwbcswfTy8YZq
	uZelypAuEuv2YNUt3vpMBdm0L07wRAfSL2hn7IISdKI7iq/rWsfslfn9nrYM7bswDMgN
	gKVfr08GDKdTAjh3MhdOBpKPvcJWvrAXfoSoE519/5s+m51xVHRteKvDOMeMZEPy5adP
	krow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=5Bt1N7cNBgugvIqlwST6yXH+ECgY8vvemKVftjUvbbc=;
	b=M2UPMfnyeAlQhGbT9DtqRNw1S1FXmLOQ07ZXZW2MFRvZ/yHkacYGB6Vp4IC0LyPNe/
	FicqtFiEZ1uJOqkD3UbI+NV1r9zu+6NSj235qko7dbra+J8ywOmHC6Kluudr7irwOX9i
	sx6CD1uTK3zXFxxh3r2mc0fvgjz7Zv/8M+i7g6s1kQYveufNdtk+EgU8RxrlCKJx9HX2
	SFR3QnMuwiF6Q+a2HVZXsDtOimgxk2J9fDGhJb+vpQ49fb1QrG2QLbA+2StKoVbTReRb
	onRMw8E4lyrdAzQm4AK58qLPwq5ZcLfO2QukQ8tBvDlU7r0ELOXcvFLw+j7qdT7KgMcy
	5Ggg==
X-Gm-Message-State: AD7BkJJGQzN2BXffymfezxhnS3BAsOxs1OVIcUnFld/b67gMAR81eY42qpK3h/7YN/chYQ==
X-Received: by 10.194.121.194 with SMTP id lm2mr2471279wjb.71.1459419497575;
	Thu, 31 Mar 2016 03:18:17 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id u4sm8297757wjz.4.2016.03.31.03.18.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 31 Mar 2016 03:18:16 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 31 Mar 2016 12:18:22 +0200
Message-Id: <1459419502-26623-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.3
Subject: [PATCH][meta-gnome] contacts: inherit gconf
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
X-List-Received-Date: Thu, 31 Mar 2016 10:18:19 -0000

* it's checking for native gconftool-2 and do_configure may fail with:
  | checking for GCONF... yes
  | checking for gconftool-2... no
  | configure: error: gconftool-2 executable not found in your path - should be installed with GConf
  | NOTE: The following config.log files may provide further information.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/pimlico/contacts.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/pimlico/contacts.inc b/meta-gnome/recipes-gnome/pimlico/contacts.inc
index 6535bbf..fedd223 100644
--- a/meta-gnome/recipes-gnome/pimlico/contacts.inc
+++ b/meta-gnome/recipes-gnome/pimlico/contacts.inc
@@ -7,7 +7,7 @@ SECTION = "x11"
 DEPENDS = "glib-2.0 gtk+ evolution-data-server intltool-native"
 RDEPENDS_${PN} = "libedata-book"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig gconf
 
 EXTRA_OECONF += "--disable-gnome-vfs"
 EXTRA_OEMAKE += "GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1"
-- 
2.7.3


