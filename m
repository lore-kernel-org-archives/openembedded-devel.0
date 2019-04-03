Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
	[209.85.128.54])
	by mail.openembedded.org (Postfix) with ESMTP id ACCFC7D0F9
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Apr 2019 23:15:44 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id o25so691270wmf.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Apr 2019 16:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=cH9U8OVbXg6KDrwvjAOqX0FGPdCkY6AAlywr6N3t8qg=;
	b=am2k5kgVI+XI0+K0zEgzvhv2JAyFbFkyMkU1PeFEKcFDURQ2G1Qftk/IEHcAsclXJV
	XcxOepWpX98bE8NrMPXJwh8GUVbpxF807raFW8zJSnw6EK6POTI3z/NdHAuQ0TQ7F2L+
	WTjN59Hsm4SakIf6LtJZpB61x4wYC+vG6M4FJtobrQfCAk5uLqbhAVGazE8fzSOY88tP
	Em1lbCS2iYok41OyYp1/a4f6MykFaRgCCQLBIT3JPefsSyqexlJOF8to7v9fNoCxR+2J
	6qyAAI1CgV3DAj+hfX3ggB0GbTNhV6A88mktiLLErgBCnlkb6CDiIudQWj8xXOk1TmFx
	6t4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=cH9U8OVbXg6KDrwvjAOqX0FGPdCkY6AAlywr6N3t8qg=;
	b=YuaYj8GBIa0UoUuGsM4A8hvBjilCZyGBo1/AnSRrDBVRR/n+r/XvbUxd+31Ud1Zswm
	CKPpELMZLXTHFAOj2wEnwfTBaAyuGVBhyKOQp2flkr6hOGbcxxuc+QreTkm8Ldb89Te1
	yytfnK6qguLaJ5mVTYB4QHMSs1umwgFcjTL4WnJCrgTR8GEEkCmMxxqQzk2SjiW6sVKj
	/cGsKZEoc6gYobHOG+nIs7bPdAps7gqhDy+wW5lxejxuGbslsFR72iMAbmXAzHuuTiln
	XerrRueRAp1fC/tATkrwfd7dAsMXBoj7LLyHnpE57o6cHRt0w489sA5Z/PjT/bClSx/N
	wu/Q==
X-Gm-Message-State: APjAAAXAjrfxR0rNHYDZSaK7dugGOHOVE0Pirmj/3RHC9n77mooeFpig
	iYR/6tArO+rdy0wfftWPbKqSulO3
X-Google-Smtp-Source: APXvYqwvrSsOk1/rhNVTOgrUraobfZCJFF0uSMHC2DorT4Q8dX7dzRlrK7sB81A2sZsYi/Hf2MoaYw==
X-Received: by 2002:a7b:cb16:: with SMTP id u22mr1643624wmj.60.1554333345233; 
	Wed, 03 Apr 2019 16:15:45 -0700 (PDT)
Received: from superandy.speedport.ip (p579734E4.dip0.t-ipconnect.de.
	[87.151.52.228]) by smtp.gmail.com with ESMTPSA id
	m6sm25410482wrr.53.2019.04.03.16.15.44
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 03 Apr 2019 16:15:44 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  4 Apr 2019 01:15:33 +0200
Message-Id: <20190403231533.24354-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190403231533.24354-1-schnitzeltony@gmail.com>
References: <20190403231533.24354-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] gvfs: Fix missing executable permission flags for files in libexec
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
X-List-Received-Date: Wed, 03 Apr 2019 23:15:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

At least XFCE sessions turned into unusable state [1]

[1] http://lists.openembedded.org/pipermail/openembedded-devel/2019-April/199010.html

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/recipes-gnome/gvfs/gvfs_1.40.0.bb | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.40.0.bb b/meta-gnome/recipes-gnome/gvfs/gvfs_1.40.0.bb
index 7b9a16e9e..df9fd50ea 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.40.0.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.40.0.bb
@@ -61,8 +61,16 @@ PACKAGECONFIG[fuse] = "-Dfuse=true, -Dfuse=false, fuse"
 # libcdio-paranoia recipe doesn't exist yet
 PACKAGECONFIG[cdda] = "-Dcdda=true, -Dcdda=false, libcdio-paranoia"
 
-# Fix up permissions on polkit rules.d to work with rpm4 constraints
 do_install_append() {
+    # Fix up permissions on polkit rules.d to work with rpm4 constraints
 	chmod 700 ${D}/${datadir}/polkit-1/rules.d
 	chown polkitd:root ${D}/${datadir}/polkit-1/rules.d
+
+    # After rebuilds (not from scracth) it can happen that the executables in
+    # libexec ar missing executable permission flag. Not sure but it came up
+    # during transition to meson. Looked into build files and logs but could
+    # not find suspicious
+    for exe in `find ${D}/${libexec}`; do
+       chmod +x $exe
+    done
 }
-- 
2.20.1


