Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f47.google.com (mail-pb0-f47.google.com
	[209.85.160.47])
	by mail.openembedded.org (Postfix) with ESMTP id AFCB565D31
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Apr 2014 20:32:46 +0000 (UTC)
Received: by mail-pb0-f47.google.com with SMTP id up15so4398086pbc.34
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Apr 2014 13:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ksGCp953mqjhYref6y+3tfhk8rQRjS3pgxN/DRYykYk=;
	b=mLS9OtEb2tonGU86AFv8Bo1+jSkdm5o7k5+9hTW2LSeZ5zWuM/pTBxpZLDfm6qcBWV
	+zzV+ZxikimMHqPR3om9153+sXjt7wPSUSdkTNzp/NgariV7PVgMm3q8FmY7VIGPKbiO
	x3KBkK5I3V0fSMw9WgRxlQmzhAY8FfOL14ecj49r0GTJf/aMx8CTX1yEU0sU3W3KDAVM
	Ox3vUET8xtikSaJyCHrNpJEIZ2+H8CGMvxOzv4JdRgRJLVjUfnl3/acmXDDlFiLa7RrD
	4qbJT5ivGWSf5dAA6GquhiQa/gYkZq7crSgvCkxBmoxY1ToEetoeSHQjnFS6rSqDM1a0
	/HOg==
X-Received: by 10.66.150.69 with SMTP id ug5mr16078830pab.55.1398544367688;
	Sat, 26 Apr 2014 13:32:47 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-140-30.lightspeed.sntcca.sbcglobal.net. [99.57.140.30])
	by mx.google.com with ESMTPSA id
	ci4sm24455471pbb.50.2014.04.26.13.32.46 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 26 Apr 2014 13:32:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 26 Apr 2014 13:34:32 -0700
Message-Id: <1398544484-27299-9-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1398544484-27299-1-git-send-email-raj.khem@gmail.com>
References: <1398544484-27299-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 09/21] gedit: Fix build when S != B
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
 meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb b/meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb
index 16b2a97..36bae08 100644
--- a/meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb
+++ b/meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb
@@ -16,8 +16,10 @@ EXTRA_OECONF = "--disable-scrollkeeper \
                 --enable-gvfs-metadata"
 
 do_configure_prepend() {
+    cd ${S}
     gnome-doc-common --copy || true
     gnome-doc-prepare --force --copy || true
+    cd ${B}
 }
 
 FILES_${PN} += "${libdir}/gedit-2/plugin* ${datadir}/gedit-2"
-- 
1.7.10.4


