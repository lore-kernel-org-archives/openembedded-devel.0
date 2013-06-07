Return-Path: <kergoth@gmail.com>
Received: from mail-gh0-f182.google.com (mail-gh0-f182.google.com
	[209.85.160.182])
	by mail.openembedded.org (Postfix) with ESMTP id 504F86A5AF
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Jun 2013 23:29:49 +0000 (UTC)
Received: by mail-gh0-f182.google.com with SMTP id z15so159811ghb.27
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Jun 2013 16:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=hBWkRWuxwCnDrc6vkmTNtExrHzH+fg6+pn1JLrVOqXo=;
	b=ILHBPgAyQoF9WlcpdlrkpxzGZRiHADuRlUFNKs1UVen0RF3U+n/Iika8cWsK/LHNfU
	u+Dop7k+FluNiRDI0xFf/fCm5HFZvvkslwqDp56L8K0bfIPftlpZz3zMJXitJrVNbzbk
	QkUTG092PPUxA19sak6auDfuy6O71tsL4s+D6ecZEplG8BCqzEW7f3/bICgk5pCfcGfB
	4I3Mk/fv6U5WlzFyK0kb86uldaZKcYeobDgb1NnaUvYVpjfJPFtIcicFlsBc7SD6cqkW
	Qj7G1I56nZDX/qg4FIIigEPpuTEc8fXdxnWFF4/ITt/Nti2sPqhwy7/s8VQ3ku1KafKz
	UZUQ==
X-Received: by 10.236.28.226 with SMTP id g62mr476531yha.10.1370647789960;
	Fri, 07 Jun 2013 16:29:49 -0700 (PDT)
Received: from precise64.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id a24sm1454547yho.24.2013.06.07.16.29.48
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 07 Jun 2013 16:29:49 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  7 Jun 2013 16:29:43 -0700
Message-Id: <1370647783-7693-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.8.3
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [meta-gnome][PATCH] gnome-disk-utility: use PACKAGECONFIG for nautilus extension
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
X-List-Received-Date: Fri, 07 Jun 2013 23:29:49 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 .../recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb    | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb
index a0fd9bd..1bdae34 100644
--- a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "GNOME disk utility"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e9115d11797a5e6b746b4e9b90194564"
 
-DEPENDS = "glib-2.0 gtk+ libnotify libunique udisks avahi-ui virtual/libx11 libatasmart nautilus"
+DEPENDS = "glib-2.0 gtk+ libnotify libunique udisks avahi-ui virtual/libx11 libatasmart"
 
 PR = "r3"
 
@@ -19,6 +19,9 @@ SRC_URI += "\
 
 EXTRA_OECONF += "--disable-scrollkeeper"
 
+PACKAGECONFIG ??= "nautilus"
+PACKAGECONFIG[nautilus] = "--enable-nautilus-extension,--disable-nautilus-extension,nautilus"
+
 do_configure_prepend() {
     sed -i -e "s: help : :g" ${S}/Makefile.am
 }
-- 
1.8.3


