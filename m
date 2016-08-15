Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 78A527328A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Aug 2016 14:09:45 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id o1so4323788qkd.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Aug 2016 07:09:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=KfZfHJYA3Ai7iWkRAMfbYwt7265UrWIdF9in7iuBXwQ=;
	b=GFKIGlHho4/dwjXjtDXXWN551uReXDc4LZv8n5eAOtztZ5Q49RRazNAa2ejN3pTuJ0
	noDXxbsDoGx8aCmu2TaJGdDK3ELWmpGB2cJcX8luqVGA2kVfSWb9CBY9SNaYy8l7hM5u
	BYPYdrvWI4LGjd7R5mFDgD7Jo9Kzg1VjN7KEgkfAYGftT+fgknTkKQLyF+SP0SQkMcef
	RwX8zHwgRJgN/EZmIJx8nL1RczjRT9nlgbP0wIl5gd/zuK2vaKWEZ0gkbi9OhtIUOa5P
	uEsxpdI1W94/MMWRowm8JaGF1jiFFPNxI9huNCTVlblKiIqD+h+yMRoEa8VXeVyZ+tkW
	I5VQ==
X-Gm-Message-State: AEkoousb8n48+fLzy8+9Uza6rNO8sdxCWSxCtnHoClGfk77nmJpo3QeQHQvg+1bB04cQww==
X-Received: by 10.55.22.199 with SMTP id 68mr31256150qkw.259.1471270185927;
	Mon, 15 Aug 2016 07:09:45 -0700 (PDT)
Received: from localhost.localdomain ([96.91.222.230])
	by smtp.gmail.com with ESMTPSA id
	i65sm12424856qtb.18.2016.08.15.07.09.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 15 Aug 2016 07:09:45 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Aug 2016 10:09:25 -0400
Message-Id: <1471270165-3098-2-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1471270165-3098-1-git-send-email-derek@asterius.io>
References: <1471270165-3098-1-git-send-email-derek@asterius.io>
Subject: [meta-oe][PATCHv2 2/2] utouch-mtview: remove blacklist
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
X-List-Received-Date: Mon, 15 Aug 2016 14:09:46 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-oe/recipes-support/utouch/utouch-mtview_git.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-oe/recipes-support/utouch/utouch-mtview_git.bb b/meta-oe/recipes-support/utouch/utouch-mtview_git.bb
index 2f387d0..8cb180d 100644
--- a/meta-oe/recipes-support/utouch/utouch-mtview_git.bb
+++ b/meta-oe/recipes-support/utouch/utouch-mtview_git.bb
@@ -17,5 +17,3 @@ DEPENDS += "mtdev utouch-frame utouch-evemu libx11"
 PV = "1.1.7+git${SRCPV}"
 
 S = "${WORKDIR}/git/"
-
-PNBLACKLIST[utouch-mtview] ?= "Depends on broken utouch-frame"
-- 
2.7.4


