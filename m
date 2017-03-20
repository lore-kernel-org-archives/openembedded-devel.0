Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 561C471D7F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Mar 2017 05:32:09 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id o126so15583004pfb.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Mar 2017 22:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=8ljOlcgeLeYVIM9Ay4wGUjlHGROXFkhfOC2j9bZBRlk=;
	b=nUnS2aJq4xfGyC/TcrpsWR39K2Fl7HQ9RYS9msHkFfGivUUcYBJgK2wxcZJm/V5jZg
	V4VyBVDKzbW9qNicT2Ffcn9c0bqL3F5FhB3djnU93+yG+tl5kNqcM+14hMii1r/qlfMH
	V1X2Xa4bXtbJKEJC8WyiEADsXO5RuA0TH9tFdlM6LulFV+fBi5yHMdJ03bMXIqmxvINn
	BYjRP1Epi3LOh+zaRfxeommWYKJgWDoVMWIZ/21XKYVpR3JKL12vcLX/tLcxnYyLDO9L
	y/5ImFHZDu9u8r4jvGsNZns7N83anowPMhd1GtmfG+Vt+WfNzSjNLUJLwvpss9l5XXj2
	6Qvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=8ljOlcgeLeYVIM9Ay4wGUjlHGROXFkhfOC2j9bZBRlk=;
	b=jFGC0ebNMtLtSk1zB2ZjpSgSVrJip0dMRnZK4bwn1vHLSEbPiLoEJbmmYquj3QA0Gx
	gn2ZRdHea3vu4V569Aj+3qZmQgj+vWPu7d1YXtGl72cJaobVQp+1cOCt6WPjSkDTozXU
	JYRr/HXQZ1JV+kLnzNccB+9kcKmXkntjX0OLDTgpO7k6NrCe04Y71uFh3SpFJ/ioH1VM
	48TuztN5WsHebibBZ2DLiiopUqVAcUGhtkNBn8JPtRx/NNyaoHeNP0vwhz7KX6C72LmL
	EJGNZNicug9n1RNaqTvJCxQ0y6xL75snuxAeWEB1tkJrNKMNHnW7LkR/1I4WipyExJga
	jJmg==
X-Gm-Message-State: AFeK/H1ftFas/RM6EWp8rw5ivGlgdL8W4PY+lMocv3YGJWLq9fUeoZpegoe22uWu0GyfNA==
X-Received: by 10.98.194.157 with SMTP id w29mr30616314pfk.192.1489987930430; 
	Sun, 19 Mar 2017 22:32:10 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	o189sm30203934pga.12.2017.03.19.22.32.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 19 Mar 2017 22:32:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 19 Mar 2017 22:31:40 -0700
Message-Id: <20170320053152.29352-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <20170320053152.29352-1-raj.khem@gmail.com>
References: <20170320053152.29352-1-raj.khem@gmail.com>
Subject: [meta-xfce][PATCH V2 04/16] core-image-minimal-xfce: Drop ROOTFS_PKGMANAGE_BOOTSTRAP
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
X-List-Received-Date: Mon, 20 Mar 2017 05:32:09 -0000

OE-Core has now dropped this var

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-xfce/recipes-core/images/core-image-minimal-xfce.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-xfce/recipes-core/images/core-image-minimal-xfce.bb b/meta-xfce/recipes-core/images/core-image-minimal-xfce.bb
index a683c2dd4..f5c5c26ae 100644
--- a/meta-xfce/recipes-core/images/core-image-minimal-xfce.bb
+++ b/meta-xfce/recipes-core/images/core-image-minimal-xfce.bb
@@ -1,7 +1,6 @@
 DESCRIPTION = "A XFCE minimal demo image."
 
 IMAGE_INSTALL = "packagegroup-core-boot \
-    ${ROOTFS_PKGMANAGE_BOOTSTRAP} \
     packagegroup-core-x11 \
     packagegroup-xfce-base \
     kernel-modules \
-- 
2.12.0


