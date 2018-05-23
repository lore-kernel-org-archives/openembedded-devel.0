Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 625826093D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 May 2018 22:39:36 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id q22-v6so11190608pff.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 May 2018 15:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=E0lGm2ArrPCWXmWkQ0HmXxa54HvIP35U/eQQof0zlKg=;
	b=dF66qZltQqvoBvQOrfPC7H+r8zD8xboQASdTvjqx98ZmIzihus7f9CfvATB6/NpKma
	Dq0DL3dMfyjrdqmkqFwhjLdekA5+rCtK0QZCBF/6v2RhRS9dPFGvFYD+whl9hMn4v4NM
	aJjR8NxdkHfjcZC15b3BbpzdDrnzMNtUu9XbL6iDBCKF9omgGKdwP/keZMGVj4x2qAki
	acxAf8mlPFXOjli+ap7R/r86kFuyIz2C8ipi/W4TlPSc9RYNVakVd8OkpQhJc0KUgeHz
	SH8ooY5zL9btGQPhGA0h/9Y5TsrL5577ijuJkYDlaKsfJGU9cPt37wYVfHJ06z3Io+qy
	Bo0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=E0lGm2ArrPCWXmWkQ0HmXxa54HvIP35U/eQQof0zlKg=;
	b=SD6FRIfkU0qJkFWk9oIEJaPKWyZblqihz80yDfB+r2XfTWDtEdA/yEYV58FRM0yYp8
	w6UekLX56GA5Y+drhS6mlnZp5rkoOAnSSx+2WOXVOYtk0xC7Bed/FbxI+yz9+viKVbo1
	0h/xQ415OX9dN8bwO9Dylzxr2oVRxWBUNMWFPpWMcTYZz4q93wafr5ZCGljysbxASNhG
	sMxfBH7rbrD396bLXbmzWnx6twZ9SbkdIS3fIvgcpWNzypSZ27cO+lRXQJz0B6onzDiv
	e2FEBk10rmuqJ3AsJhoXQ8WTSEgrv5cfQJoQrh5k488Vbc1x0wVx2dYjWYJi4MpSfwsl
	vh9A==
X-Gm-Message-State: ALKqPwck8wsFgxNznT3b2fOaoi5wk4RHCObARCGVSUaVzHlG4pDz9wQT
	LDbq3mjf5RMO69NUziJAyC8fbA==
X-Google-Smtp-Source: AB8JxZrEbmwUBSBRImGfB/BxlbjLHt94udWwx6Wpon3uETB6vDurclWPPfh014SlhtayrOuVAg6fZA==
X-Received: by 2002:a65:56cb:: with SMTP id
	w11-v6mr3647121pgs.175.1527115177514; 
	Wed, 23 May 2018 15:39:37 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	g15-v6sm25900272pgv.58.2018.05.23.15.39.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 May 2018 15:39:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 May 2018 15:39:26 -0700
Message-Id: <20180523223928.21302-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
Subject: [meta-oe][PATCH 1/3] procmail: Use build ldflags when invoking native compile/link
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
X-List-Received-Date: Wed, 23 May 2018 22:39:37 -0000

Some older compilers do not support security flags like -fstack-protector=strong
and if we do not set this then it will use the target flags to pass here
which will fail with gcc < 5.x, especially a problem building distros with
security flags on host with 4.x gcc e.g. ubuntu 14.04

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/procmail/procmail_3.22.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/procmail/procmail_3.22.bb b/meta-oe/recipes-support/procmail/procmail_3.22.bb
index aa474ceb14..6160733b3d 100644
--- a/meta-oe/recipes-support/procmail/procmail_3.22.bb
+++ b/meta-oe/recipes-support/procmail/procmail_3.22.bb
@@ -29,7 +29,7 @@ do_configure() {
     export CFLAGS="${BUILD_CFLAGS}"
     export AR="${BUILD_AR}"
     export AS="${BUILD_AS}"
-    make TARGET_CFLAGS="$TARGET_CFLAGS -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64" LDFLAGS0="${LDFLAGS}" autoconf.h
+    make TARGET_CFLAGS="$TARGET_CFLAGS -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64" LDFLAGS0="${BUILD_LDFLAGS}" autoconf.h
 }
 
 do_compile() {
-- 
2.17.0


