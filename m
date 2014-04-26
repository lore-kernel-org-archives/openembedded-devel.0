Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f176.google.com (mail-pd0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id CF72265DE2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Apr 2014 20:32:57 +0000 (UTC)
Received: by mail-pd0-f176.google.com with SMTP id r10so4307109pdi.21
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Apr 2014 13:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=EPHAk55h3eY/mOURG0vUnuUS9eHPS9Hi/5MXoAn7hHc=;
	b=g26pxpkgcRexfUagh8aUNVaDO+LV6DmMkd2VlKRQAWtJtB3FIDxrx3vNNq2EB8EGMV
	WsWNjf5damL4cRZ+og9DrcpNh6iyk1E2Giy7vsYkktgQCxbLSnLml/Ef7NksyZNPUMeI
	JZNvnon/HzaJrlIZiH/s+qwBRoBR7PjY/0mxFYpVjXyNDWx+vbnFDjhmpH1hceMFip1G
	SjLhUCWH/jKkC64lYVBXRBNZKPv1Ly3iHg4DB2mOnE9ih1X2jxXFDuChvNnUTCklywKH
	FO3xTN3KShR7lVsDX0brI+WB5Vowx2GuYJVrtC+eR9omGkHgHTKptyhp7HXyDSCqcbWI
	OEDA==
X-Received: by 10.66.144.166 with SMTP id sn6mr11391177pab.100.1398544379224; 
	Sat, 26 Apr 2014 13:32:59 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-140-30.lightspeed.sntcca.sbcglobal.net. [99.57.140.30])
	by mx.google.com with ESMTPSA id
	ci4sm24455471pbb.50.2014.04.26.13.32.58 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 26 Apr 2014 13:32:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 26 Apr 2014 13:34:43 -0700
Message-Id: <1398544484-27299-20-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1398544484-27299-1-git-send-email-raj.khem@gmail.com>
References: <1398544484-27299-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 20/21] libgdata: Upgrade to 0.14.1 and fix when S != B
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
X-List-Received-Date: Sat, 26 Apr 2014 20:32:58 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libgdata/{libgdata_0.7.1.bb => libgdata_0.14.1.bb}     |   12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)
 rename meta-gnome/recipes-gnome/libgdata/{libgdata_0.7.1.bb => libgdata_0.14.1.bb} (58%)

diff --git a/meta-gnome/recipes-gnome/libgdata/libgdata_0.7.1.bb b/meta-gnome/recipes-gnome/libgdata/libgdata_0.14.1.bb
similarity index 58%
rename from meta-gnome/recipes-gnome/libgdata/libgdata_0.7.1.bb
rename to meta-gnome/recipes-gnome/libgdata/libgdata_0.14.1.bb
index 8f6675d..9edffd6 100644
--- a/meta-gnome/recipes-gnome/libgdata/libgdata_0.7.1.bb
+++ b/meta-gnome/recipes-gnome/libgdata/libgdata_0.14.1.bb
@@ -7,9 +7,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24 \
                     file://gdata/gdata.h;endline=20;md5=079a554efcf65d46f96a515806e7e99a \
                     file://gdata/gdata-types.h;endline=20;md5=7399b111aac8718da13888fc634be6ef"
 
-DEPENDS = "libxml2 glib-2.0 libsoup-2.4"
+DEPENDS = "libxml2 glib-2.0 libsoup-2.4 liboauth gnome-keyring"
 
-inherit gnomebase pkgconfig autotools gettext
+GNOME_COMPRESS_TYPE = "xz"
 
-SRC_URI[archive.md5sum] = "ec5262cbcb07b63b58d45aa3ac636096"
-SRC_URI[archive.sha256sum] = "fb244138276a5ce98510b0e2408bbf6f9ce0fd8cdcf86f07cd4be38afbb7c2bc"
+inherit gnome pkgconfig autotools-brokensep gettext
+
+SRC_URI[archive.md5sum] = "27022e2250393ae0dbd3818889a1ac62"
+SRC_URI[archive.sha256sum] = "68bbb2cb70028d79edfaec17184389275044fd58bf881e36df2663e7e191ff1a"
+
+EXTRA_OECONF += "--disable-goa"
-- 
1.7.10.4


