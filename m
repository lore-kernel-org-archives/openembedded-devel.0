Return-Path: <sven.ebenfeld@gmail.com>
Received: from mail-we0-f175.google.com (mail-we0-f175.google.com
	[74.125.82.175])
	by mail.openembedded.org (Postfix) with ESMTP id 6E793606E8
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Feb 2015 09:52:55 +0000 (UTC)
Received: by wesq59 with SMTP id q59so9709393wes.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Feb 2015 01:52:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Ymu88C7saXh9vWgrJZwjPHBIW9wMQI4uuHGUxQTL2FU=;
	b=ntiKBIS0/L0+xQAWQZ9t4xROxjWfuyizEUlQlagiN2fEjx4AAKSK5BjLHbTf6dPULk
	VL0JaJtt/UJ8CBDQ11DVMUITQMMbe/90RnWebz9Oxw5kkpExjZp+5zZL9XgLsshnpCn1
	soCFEfOFofM1m1GiXHkvqvm1S/2URGLHZt+vtLnGU0DLtyH8gRT+hnJ+EBhgE10YjBHc
	/S5CLfBcTJ3Aofdoik0N3UM3XC6aJ6yXuW++Mfx2v4d5hWY9rBk1QSN0XFf7Byrt7KqD
	EGlEdhP7N+C/kJd/dCIAvOIGp0psE9MnOfBFHONsyfVHuVZAZy0ZHfxY9czcP+cSOhCT
	pdNA==
X-Received: by 10.194.200.1 with SMTP id jo1mr3359291wjc.64.1424512377008;
	Sat, 21 Feb 2015 01:52:57 -0800 (PST)
Received: from localhost.localdomain (ip-84-119-96-251.unity-media.net.
	[84.119.96.251])
	by mx.google.com with ESMTPSA id dm6sm6232120wib.22.2015.02.21.01.52.55
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 21 Feb 2015 01:52:56 -0800 (PST)
From: Sven Ebenfeld <sven.ebenfeld@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 21 Feb 2015 10:52:14 +0100
Message-Id: <1424512336-47007-7-git-send-email-sven.ebenfeld@gmail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1424512336-47007-1-git-send-email-sven.ebenfeld@gmail.com>
References: <1424512336-47007-1-git-send-email-sven.ebenfeld@gmail.com>
Subject: [meta-oe][PATCH 6/7] claws-mail: Fix SRC_URI
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
X-List-Received-Date: Sat, 21 Feb 2015 09:52:57 -0000

Signed-off-by: Sven Ebenfeld <sven.ebenfeld@gmail.com>
---
 meta-oe/recipes-sato/claws-mail/claws-mail_3.9.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-sato/claws-mail/claws-mail_3.9.0.bb b/meta-oe/recipes-sato/claws-mail/claws-mail_3.9.0.bb
index a8bee71..1f61c39 100644
--- a/meta-oe/recipes-sato/claws-mail/claws-mail_3.9.0.bb
+++ b/meta-oe/recipes-sato/claws-mail/claws-mail_3.9.0.bb
@@ -9,7 +9,7 @@ inherit autotools pkgconfig gettext
 
 # translation patch: http://www.thewildbeast.co.uk/claws-mail/bugzilla/show_bug.cgi?id=1774
 SRC_URI = "\
-        ${SOURCEFORGE_MIRROR}/sylpheed-claws/claws-mail-${PV}.tar.bz2;name=archive "
+        ${SOURCEFORGE_MIRROR}/project/claws-mail/Claws%20Mail/${PV}/claws-mail-${PV}.tar.bz2;name=archive "
 SRC_URI[archive.md5sum] = "4c5ac7b21f0ed17d0f6404124c2229a4"
 SRC_URI[archive.sha256sum] = "ed70975a5056b3ffc4fe6e977f0d9606febc1499763c090241b029a73ff24e65"
 
-- 
1.9.3


