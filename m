Return-Path: <s.stirtzel@googlemail.com>
Received: from mail-ea0-f170.google.com (mail-ea0-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id 5AF3B6D498
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2013 15:46:14 +0000 (UTC)
Received: by mail-ea0-f170.google.com with SMTP id q10so13095eaj.15
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2013 08:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=jaV0S52DyOcdQDAyEJJJKjJuc+YkZrTiMVWga01IJ+8=;
	b=oOmRPI9Z6Ssd4RdP4cZPEY19CDA+qGz2/B4B/ngR1vCM0u5b0wJLD9PemOuVod2vtA
	Si3YGYpTHCDIEBb+NrfCvOnwIXBVcai3mFz6Ky+DhT4+r5HOlmryKhKlqMymR12glt5l
	6cPmeCkSonzbCYmkKXYNKBnpQyLXnvB3NF1zza/Uu5pmMX298VA8H1a4dfQap1/Kvq6L
	FQmeNqvjEhvxGKPnZYUnpExnHSEkHB21zOmUg544a64ocdMXiHUyoPSaepODXjbvbFV0
	eFdTeSxyDRohY+JkfVi9sUX+gsCrNGeJXNQwlSo88rYBY2ioBCXaTCH7h+QT7loBdVn3
	Uthw==
X-Received: by 10.14.218.197 with SMTP id k45mr355917eep.32.1383061575362;
	Tue, 29 Oct 2013 08:46:15 -0700 (PDT)
Received: from s-stirtzel-linux.zera.local
	(ip-178-200-247-59.unitymediagroup.de. [178.200.247.59])
	by mx.google.com with ESMTPSA id
	r48sm71739267eev.14.2013.10.29.08.46.14 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 29 Oct 2013 08:46:14 -0700 (PDT)
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Oct 2013 16:46:03 +0100
Message-Id: <1383061563-7976-1-git-send-email-s.stirtzel@googlemail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-oe][PATCH] utouch-mtview: Add missing dependency to libx11
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
X-List-Received-Date: Tue, 29 Oct 2013 15:46:14 -0000

Also added RDEPENDS to virtual/xserver since this program cannot be used without X

Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>
---
 .../recipes-support/utouch/utouch-mtview_git.bb    |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/utouch/utouch-mtview_git.bb b/meta-oe/recipes-support/utouch/utouch-mtview_git.bb
index 0f72479..973d509 100644
--- a/meta-oe/recipes-support/utouch/utouch-mtview_git.bb
+++ b/meta-oe/recipes-support/utouch/utouch-mtview_git.bb
@@ -10,7 +10,9 @@ inherit autotools
 SRC_URI = "git://bitmath.org/git/mtview.git;protocol=http"
 SRCREV = "ad437c38dc111cf3990a03abf14efe1b5d89604b"
 
-DEPENDS += "mtdev utouch-frame utouch-evemu"
+DEPENDS += "mtdev utouch-frame utouch-evemu libx11"
+
+RDEPENDS += "virtual/xserver"
 
 PV = "1.1.7+git${SRCPV}"
 
-- 
1.7.9.5


