Return-Path: <otavio.salvador@gmail.com>
Received: from mail-vn0-f47.google.com (mail-vn0-f47.google.com
	[209.85.216.47])
	by mail.openembedded.org (Postfix) with ESMTP id 8FDE96AC12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 May 2015 12:45:03 +0000 (UTC)
Received: by vnbg129 with SMTP id g129so7022645vnb.11
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 May 2015 05:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:organization;
	bh=0XrA+daQOruesCFxy2DEMkWT6WzmXmfXezwguPn6jrg=;
	b=qPgUuliuL2rskmiXsFpE1M4+ycJ/qC7Wl3IVJacZFqgKdog0otaZgmF0jjIhjrszeJ
	EEVA216eiSERJgdwsIUU6xo6hN9dNxseWkZ8F7YGooA9dOBWbJmd8xF546XiD8o+QZ3q
	//rLiP+nk2Bo8leQjrzcPIoTFNXCMHtzi5MFpzX74mthy8pYljYtEG/rDCdegWMVV4aa
	A6G3JpjUoVhn9wDAUdTwYJN2PFhrtnlRuX9Mpq56f3cQb6+xo8ExhCVGYfDFxPUsE3it
	cy2SrRTDRvRsfEgc/OnIF6gmVoDrAPQnFVlj/r33/iSQmFnrHeGHPYZq/AGEmCHhlmkZ
	vNbw==
X-Received: by 10.52.181.196 with SMTP id dy4mr30853139vdc.67.1432644304747;
	Tue, 26 May 2015 05:45:04 -0700 (PDT)
Received: from centrium.lab.ossystems.com.br ([177.100.224.72])
	by mx.google.com with ESMTPSA id eo7sm2215300vdc.18.2015.05.26.05.45.01
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 26 May 2015 05:45:03 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 26 May 2015 09:46:46 -0300
Message-Id: <1432644406-4468-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-clang][PATCH] clang: Remove nativesdk-binutils dependency
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
X-List-Received-Date: Tue, 26 May 2015 12:45:05 -0000

The dependency is not necessary for building of the nativesdk package.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 recipes-devtools/clang/clang_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-devtools/clang/clang_git.bb b/recipes-devtools/clang/clang_git.bb
index d197908..52352f2 100644
--- a/recipes-devtools/clang/clang_git.bb
+++ b/recipes-devtools/clang/clang_git.bb
@@ -74,6 +74,7 @@ EXTRA_OECMAKE_append_class-target = "\
 EXTRA_OEMAKE += "REQUIRES_RTTI=1 VERBOSE=1"
 
 DEPENDS = "zlib libffi libxml2 binutils"
+DEPENDS_remove_class-nativesdk = "nativesdk-binutils"
 
 do_configure_prepend() {
         # Remove RPATHs
-- 
2.1.4


