Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f178.google.com (mail-pd0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id D76966CEBD
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Oct 2013 08:44:12 +0000 (UTC)
Received: by mail-pd0-f178.google.com with SMTP id w10so6173834pde.9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Oct 2013 01:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=k2KXWGImqVfn5X0Wewm2bzkS47VAhZigXnafiYzzOAA=;
	b=L1h7EHODNCAppGiEjRYbSd5m5ti9JLV6kwZoC/niwJNqNFk13aOscfiO4i8GLQ/SCV
	uQvlDv27EH/geAGT3+LuF/vqO8x7T2O/DPT6JF3Wnw/SJu1D3zIp5WDdYxae1oDYXOsK
	OVF7Uvtv589r8YcIyC4TgE656jsQHp7GC4OIzdc69KqiKNu2iLr2+FKrdgOKinzSe9GF
	6dltQPscCdZxB4/VuSCai7Huivv3sTEvDhiRhOcdIVIih5WzkybHTaZKGVHgpV5QvGx+
	Dk/5u6fRua6oD20lMhaMGXDQmEQo+NlQgoH07YSsiRjhZ/e77yxVVui6kNkYxtE4OJGw
	W4/w==
X-Received: by 10.66.25.232 with SMTP id f8mr31775134pag.25.1381653855029;
	Sun, 13 Oct 2013 01:44:15 -0700 (PDT)
Received: from haswell.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id l8sm70753592pbl.22.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 13 Oct 2013 01:44:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 13 Oct 2013 01:43:55 -0700
Message-Id: <1381653835-32079-6-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1381653835-32079-1-git-send-email-raj.khem@gmail.com>
References: <1381653835-32079-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 6/6] libgnomeui: Depend on libgnome-keyring not gnome-keyring
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
X-List-Received-Date: Sun, 13 Oct 2013 08:44:13 -0000

libgnomeui needs gnome-keyring-1 which comes from libgnome-keyring

Fixes errors like below

| configure: error: Package requirements (  libxml-2.0 >= 2.4.20
libgnome-2.0 >= 2.13.7   libgnomecanvas-2.0 >= 2.0.0   libbonoboui-2.0
>= 2.13.1   gconf-2.0 >= 1.1.11   pango >= 1.1.2   glib-2.0 >= 2.16.0
|   gio-2.0 >= 2.16.0
|   gnome-vfs-2.0 >= 2.7.3   gnome-keyring-1 >= 0.4) were not met:
|
| No package 'gnome-keyring-1' found

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-gnome/recipes-gnome/libgnome/libgnomeui.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/libgnome/libgnomeui.inc b/meta-gnome/recipes-gnome/libgnome/libgnomeui.inc
index 8f55909..b000d72 100644
--- a/meta-gnome/recipes-gnome/libgnome/libgnomeui.inc
+++ b/meta-gnome/recipes-gnome/libgnome/libgnomeui.inc
@@ -3,7 +3,7 @@ LICENSE = "LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=55ca817ccb7d5b5b66355690e9abc605"
 
 SECTION = "x11/gnome/libs"
-DEPENDS = "libgnome libgnomecanvas libbonoboui gnome-keyring"
+DEPENDS = "libgnome libgnomecanvas libbonoboui libgnome-keyring"
 
 inherit gnome 
 
-- 
1.8.3.2


