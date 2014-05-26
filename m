Return-Path: <ashcharles@gmail.com>
Received: from mail-pa0-f46.google.com (unknown [209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id 00D3D6FA2C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 May 2014 20:42:36 +0000 (UTC)
Received: by mail-pa0-f46.google.com with SMTP id kq14so8003083pab.19
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 May 2014 13:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=fXAaB22NFt5AIURXHP9BGR2ZmDhjAH5EY88Db/Fuebw=;
	b=xlVHq+1iFfYLkPtgrOnUswcY6s5nqyHIt61ku6bgftqyO8TbLh88l98hTreMwnKZAr
	Is/E4/XJQc+pewXRkf1CBfBFkZAcJfeXCkpehZ9rUqnCTpj5TC+cU+SrLTWdbuIu69OJ
	aQu4uwLDdyEPpC+ed0Sf6pBujpylH0QkECkOhuBnmHwgXa3s5ocpxkcXjSkmbElyD2Wl
	srDWaR6WEwgrhXeXaYAMW61pcJk5b5zDMB0sVao2Hsgx9uxmAvFd2NlC/ZB18GTZ5wqw
	9Zq/wnmlx5Af21FlYyKKs3n1l3E+TAVLl7Xg3wUyDXBHW+VQdx361Hv8cWoy2aM4Y2CS
	0cAQ==
X-Received: by 10.68.134.69 with SMTP id pi5mr24368454pbb.126.1401136957879;
	Mon, 26 May 2014 13:42:37 -0700 (PDT)
Received: from gumstux.bchsia.telus.net (s206-116-3-18.bc.hsia.telus.net.
	[206.116.3.18]) by mx.google.com with ESMTPSA id
	ox3sm19672114pbb.88.2014.05.26.13.42.36 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 26 May 2014 13:42:37 -0700 (PDT)
From: Ash Charles <ashcharles@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 May 2014 13:42:25 -0700
Message-Id: <1401136945-6784-1-git-send-email-ashcharles@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [meta-oe][PATCH] lxdm: Use lxdm.conf from build directory
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
X-List-Received-Date: Mon, 26 May 2014 20:42:41 -0000

The lxdm.conf is populated to the build/data directory, not
the source directory.

Upstream-Status: Inappropriate (configuration)

Signed-off-by: Ash Charles <ashcharles@gmail.com>
---
 meta-oe/recipes-graphics/lxdm/lxdm_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/lxdm/lxdm_git.bb b/meta-oe/recipes-graphics/lxdm/lxdm_git.bb
index c602ad3..dc40fb2 100644
--- a/meta-oe/recipes-graphics/lxdm/lxdm_git.bb
+++ b/meta-oe/recipes-graphics/lxdm/lxdm_git.bb
@@ -42,7 +42,7 @@ do_compile_append() {
         -e 's,# arg=.*,arg=${bindir}/X -s 0,g' \
         ${S}/data/lxdm.conf.in
     # add default configuration
-    oe_runmake -C ${S}/data lxdm.conf
+    oe_runmake -C ${B}/data lxdm.conf
 }
 
 do_install_append() {
-- 
1.8.3.2


