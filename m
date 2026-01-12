Return-Path: <peter@berginkonsult.se>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBEE2CF45CD
	for <webhook@archiver.kernel.org>; Mon, 12 Jan 2026 20:01:06 +0000 (UTC)
Received: from mailrelay-egress8.pub.mailoutpod2-cph3.one.com (mailrelay-egress8.pub.mailoutpod2-cph3.one.com [46.30.211.183])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42544.1768248063931280090
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Jan 2026 12:01:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@berginkonsult.se header.s=rsa2 header.b=NBtigL00;
 dkim=pass header.i=@berginkonsult.se header.s=ed2 header.b=/eaWOdNd;
 spf=none, err=SPF record not found (domain: berginkonsult.se, ip: 46.30.211.183, mailfrom: peter@berginkonsult.se)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1768248061; x=1768852861;
	d=berginkonsult.se; s=rsa2;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=1Z6E/bKj7NrFWHAxc9+OQSQXnXfeSRWtu8wtpejiXCE=;
	b=NBtigL00y8pOherg2QexXNinv8EIiN2y09aEwnQ2uwgiL8ZQbF2eBW28RXQCEYnbj389PEDk1PtpZ
	 rEbZD/wmDE/kRzSkj6E4WlC+ERgA8P+Oyle8CVipemRVtw6KUVc7x606zALUFAPRGazQ7c3v5MFvPp
	 RnDJ6+xKqG9gif6BIyNgrQ/h9zyVPGvjOm19CxVzuPuU9z/dlbGMmtEg9ELiAGBEbZrI/mZKKpbKTh
	 W8LTTW7VsIVrD6p+0fTBZ1Cnd1R/QWZHPWIvZpcCFF6sxNOQUXY6eMpmnEKZXVfuM15HEeRzFXFcR6
	 o0UGIdpAiBj2faCUco7739mziVdAccQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1768248061; x=1768852861;
	d=berginkonsult.se; s=ed2;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=1Z6E/bKj7NrFWHAxc9+OQSQXnXfeSRWtu8wtpejiXCE=;
	b=/eaWOdNdtZcFCxYQUKq1dpF2mTeqkWIic82k/AWEOie0aYywxyvkwXVCgy00BTM3yQWtqnUOqdSMv
	 ww1vTSqAw==
X-HalOne-ID: 6780155e-eff1-11f0-9e03-f78b1f841584
Received: from pbkserver2.. (c83-191-168-223.bredband.tele2.se [83.191.168.223])
	by mailrelay1.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPSA
	id 6780155e-eff1-11f0-9e03-f78b1f841584;
	Mon, 12 Jan 2026 20:01:00 +0000 (UTC)
From: Peter Bergin <peter@berginkonsult.se>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Bergin <peter@berginkonsult.se>
Subject: [meta-gnome][PATCH] gtksourceview*: fix build issue related to S
Date: Mon, 12 Jan 2026 21:00:51 +0100
Message-ID: <20260112200051.3240567-1-peter@berginkonsult.se>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Jan 2026 20:01:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123391

Source code for gtksourceview will be unpacked to a directory called
'gtksourceview-${PV}'. But as the recipes have added part of PV to the
name of the recipe the default setting of variable S will be wrong.
This is fixed by explicitly setting it.

Fixing issues like:

  WARNING: gtksourceview3-3.24.11-r0 do_unpack: gtksourceview3: the directory ${UNPACKDIR}/${BP} (<snip>/gtksourceview3/3.24.11/sources/gtksourceview3-3.24.11) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
  WARNING: gtksourceview3-3.24.11-r0 do_populate_lic: Could not copy license file <snip>/gtksourceview3/3.24.11/sources/gtksourceview3-3.24.11/COPYING to <snip>/gtksourceview3/3.24.11/license-destdir/corei7-64/gtksourceview3/COPYING: [Errno 2] No such file or directory: '<snip>/gtksourceview3/3.24.11/sources/gtksourceview3-3.24.11/COPYING'
  ERROR: gtksourceview3-3.24.11-r0 do_populate_lic: QA Issue: gtksourceview3: LIC_FILES_CHKSUM points to an invalid file: <snip>/gtksourceview3/3.24.11/sources/gtksourceview3-3.24.11/COPYING [license-checksum]
  ERROR: gtksourceview3-3.24.11-r0 do_populate_lic: Fatal QA errors were found, failing task.

  WARNING: gtksourceview4-4.8.4-r0 do_unpack: gtksourceview4: the directory ${UNPACKDIR}/${BP} (<snip>/gtksourceview4/sources/gtksourceview4-4.8.4) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
  ERROR: gtksourceview4-4.8.4-r0 do_patch: Applying patch '0001-remove-pointless-check.patch' on target directory '<snip>/gtksourceview4/4.8.4/sources/gtksourceview4-4.8.4'

  WARNING: gtksourceview5-5.18.0-r0 do_unpack: gtksourceview5: the directory ${UNPACKDIR}/${BP} (<snip>/gtksourceview5/5.18.0/sources/gtksourceview5-5.18.0) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
  WARNING: gtksourceview5-5.18.0-r0 do_populate_lic: Could not copy license file <snip>/gtksourceview5/5.18.0/sources/gtksourceview5-5.18.0/COPYING to <snip>/gtksourceview5/5.18.0/license-destdir/corei7-64/gtksourceview5/COPYING: [Errno 2] No such file or directory: '<snip>/gtksourceview5/5.18.0/sources/gtksourceview5-5.18.0/COPYING'
  ERROR: gtksourceview5-5.18.0-r0 do_populate_lic: QA Issue: gtksourceview5: LIC_FILES_CHKSUM points to an invalid file: <snip>/gtksourceview5/5.18.0/sources/gtksourceview5-5.18.0/COPYING [license-checksum]
  ERROR: gtksourceview5-5.18.0-r0 do_populate_lic: Fatal QA errors were found, failing task.

Signed-off-by: Peter Bergin <peter@berginkonsult.se>
---
 meta-gnome/recipes-gnome/gtksourceview/gtksourceview3_3.24.11.bb | 1 +
 meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.8.4.bb   | 1 +
 meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.18.0.bb  | 1 +
 3 files changed, 3 insertions(+)

diff --git a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview3_3.24.11.bb b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview3_3.24.11.bb
index 48c54a7483..878949f9b7 100644
--- a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview3_3.24.11.bb
+++ b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview3_3.24.11.bb
@@ -11,6 +11,7 @@ inherit gnomebase lib_package gettext features_check gtk-doc gobject-introspecti
 
 GNOMEBN = "gtksourceview"
 SRC_URI[archive.sha256sum] = "691b074a37b2a307f7f48edc5b8c7afa7301709be56378ccf9cc9735909077fd"
+S = "${UNPACKDIR}/gtksourceview-${PV}"
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
diff --git a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.8.4.bb b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.8.4.bb
index 439332bcea..a045fbd1a7 100644
--- a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.8.4.bb
+++ b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.8.4.bb
@@ -15,6 +15,7 @@ ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 SRC_URI += "file://0001-remove-pointless-check.patch"
 
 SRC_URI[archive.sha256sum] = "7ec9d18fb283d1f84a3a3eff3b7a72b09a10c9c006597b3fbabbb5958420a87d"
+S = "${UNPACKDIR}/gtksourceview-${PV}"
 
 GIR_MESON_OPTION = 'gir'
 GTKDOC_MESON_OPTION = "gtk_doc"
diff --git a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.18.0.bb b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.18.0.bb
index fa6d559543..75010a67b8 100644
--- a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.18.0.bb
+++ b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.18.0.bb
@@ -21,6 +21,7 @@ REQUIRED_DISTRO_FEATURES = "opengl"
 GNOMEBN = "gtksourceview"
 
 SRC_URI[archive.sha256sum] = "051a78fe38f793328047e5bcd6d855c6425c0b480c20d9432179e356742c6ac0"
+S = "${UNPACKDIR}/gtksourceview-${PV}"
 
 GIR_MESON_ENABLE_FLAG = 'enabled'
 GIR_MESON_DISABLE_FLAG = 'disabled'

