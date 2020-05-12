Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web12.6215.1589291729384752926
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2020 06:55:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=qm5RfVAz;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=h6oi=62=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49LzpR4MFMz4y
	for <openembedded-devel@lists.openembedded.org>; Tue, 12 May 2020 15:55:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1589291727;
	bh=7dXEm4J5++YGKTw0oqsWLIRGwPyTnUlL0g7wQ6OSeAY=;
	h=From:To:Subject:Date:From;
	b=qm5RfVAzpae7ZZFlGHqwiA8u+oOguUWRKC87A8lYhq3D3d++a1T7bhTyIPbfz3gPP
	 VCQJEUyuRFtaqVTuhIOk4uI4uxL+q6Qd+ng7YrALU8byFLJQowIUO4RN+620z6Bmk9
	 OIL4ivHaKtMzptt4pYUTAyT9VcuTbWNV6Vrv491tUkudXNxfNTzCNnBWppjym234K6
	 nim6PWE0Ggsh/322/HIRe7Duw/K1btZm7aRJL7OZNURt0pNORPIZDFbv5+WiI+ICEB
	 DHPV0Oprlkz2ooRJJifVnxtzNcUXeEoa7VAdxAaGyKn24OGx/xcailP9e8TCfVdcJ3
	 Gjca6rKhPIKM8+zPl3HAV/sCGPMNp+qkIZZdfCuh7J60ngPtD8S1dhvZEIO2tTG3wg
	 yn50HHuJ5c7Q6OXc6FYLIcSoxH3ArhmPFiriYRsfcvHgJhP3DaRmSa2PgfIQgInl/T
	 wyZ4Q2tCQQkfEhpm8t82AaO4pIdWIWNu+uJ2xhP5ILk2d13XGdn1skbrfm/wravvJJ
	 vb0Kc2ckZ1W7vhxvhrMQj6rXQGcL8fpkQnvt+INEu87+uVpbdlvAkGMwDmBgH9/32D
	 fAwRCgrGpBU4VUUw5OgfG6RfhVvYzSkCGe5Oe9ckFp0WofhwFlvWZICPiGArHmFCxj
	 14Lz+mo2Z8E7VUH/fC5hJ3WA=
From: "Adrian Bunk" <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Subject: [OE-core][PATCH] llvm: Remove -fcommon
Date: Tue, 12 May 2020 16:55:23 +0300
Message-Id: <20200512135523.19970-8-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1

I cannot reproduce the problem.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-devtools/llvm/llvm_git.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index a8607f5008..d24ed761bf 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -92,8 +92,6 @@ EXTRA_OECMAKE_append_class-nativesdk = "\
                   -DLLVM_CONFIG_PATH=${STAGING_BINDIR_NATIVE}/llvm-config${PV} \
                  "
 
-CFLAGS += "-fcommon"
-
 do_configure_prepend() {
 # Fix paths in llvm-config
 	sed -i "s|sys::path::parent_path(CurrentPath))\.str()|sys::path::parent_path(sys::path::parent_path(CurrentPath))).str()|g" ${S}/tools/llvm-config/llvm-config.cpp
-- 
2.17.1

