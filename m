Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f177.google.com (mail-pd0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id 08ACD65DC8
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Apr 2014 20:32:45 +0000 (UTC)
Received: by mail-pd0-f177.google.com with SMTP id v10so26199pde.36
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Apr 2014 13:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=OSqdl/rk6sabvesWVBe00RLHPkedekrA8hL0+hv+6HY=;
	b=r4CsMluXKmPA4A9woyPGLKio3g7ZWEgkbF117OHkemyKTCyelTR08nN9e1muhrzor4
	iS8AMfI1Cp57TYNb7BiMWIUF6tuRVHGSxDEMZkYjqQ/uFM2JVohmCedOlhbDu9GCjDJt
	NpdVx0d8JUP4dP64BmJZ9fqDZtCTfcxYevrYCsuIM0qxKrOVzkUPkDEyM2KqTgJGeOhQ
	ZNI57khHN5dHniQ8WtOScZ6G42u9rjtXzY8fHSO/Arl3yPOkkQaIIJcdkFALoWihjm4A
	+SjTlvFwYm7LrSZv+ql4JRObt7+yhrvaXZaqCzSywYHkULqlVMspgKEXArEprR8cN+st
	qBsg==
X-Received: by 10.68.239.137 with SMTP id vs9mr19638766pbc.84.1398544366703;
	Sat, 26 Apr 2014 13:32:46 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-140-30.lightspeed.sntcca.sbcglobal.net. [99.57.140.30])
	by mx.google.com with ESMTPSA id
	ci4sm24455471pbb.50.2014.04.26.13.32.45 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 26 Apr 2014 13:32:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 26 Apr 2014 13:34:31 -0700
Message-Id: <1398544484-27299-8-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1398544484-27299-1-git-send-email-raj.khem@gmail.com>
References: <1398544484-27299-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 08/21] epiphany: Fix build when S != B
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
X-List-Received-Date: Sat, 26 Apr 2014 20:32:46 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-gnome/recipes-gnome/epiphany/epiphany_2.30.6.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/epiphany/epiphany_2.30.6.bb b/meta-gnome/recipes-gnome/epiphany/epiphany_2.30.6.bb
index df22e36..3d7fc18 100644
--- a/meta-gnome/recipes-gnome/epiphany/epiphany_2.30.6.bb
+++ b/meta-gnome/recipes-gnome/epiphany/epiphany_2.30.6.bb
@@ -12,7 +12,7 @@ EXTRA_OECONF += " --disable-nss --with-distributor-name=${DISTRO} --without-ca-f
 
 do_configure_prepend() {
     touch ${S}/gnome-doc-utils.make
-    sed -i -e s:help::g Makefile.am
+    sed -i -e s:help::g ${S}/Makefile.am
 }
 
 FILES_${PN} += "${datadir}/icons ${datadir}/dbus-1"
-- 
1.7.10.4


