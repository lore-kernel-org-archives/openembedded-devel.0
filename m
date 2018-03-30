Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id A4E5F74705
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Mar 2018 13:32:15 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id x82so16785793wmg.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Mar 2018 06:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=CWkFamm5QCOdcaw3aeaP2jAIPyhqsqu8En2tEXQfn08=;
	b=TtIhbVDZgh/A+hvAEjgAcXF/XdYCe5kAo6KQeXR8l7FlwcycxWcojyhepMmk/X2pMs
	2lcva1CLmuHq6kyVlcJRDf6z0/kKeWSoCoBnoFUYzx4ho8me23EDK4sm2mJ03GYS7AVu
	ox3RQkLoj8nfNpMCkSBUhvvSVzUK5CDtbMwnLItjp6iINexo2Kc09oC5zB0DzYg02w91
	m3S1AsvsrCBDXWgyZfzjtWhsw11o3vqrgOSk+htRsFjOk4s5AsESzaOqLyouLLLYD6ry
	lBZfXVUiZK49qQz1/inSjqv9ZjB0G54X++smPldObrmMX47ezFaoaN7eIvi1HmY3vwlD
	HqFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=CWkFamm5QCOdcaw3aeaP2jAIPyhqsqu8En2tEXQfn08=;
	b=O9YcsbyqDMl828MTsU84R7CPfVIVX9rvtGPt+2I0nZMDXmhE4QwnISMXY2BdmlTtaW
	y7iIVWP8GMdOz0bGTIeIyAdT15b1KZ4rEEaDu7J1MPfYq9WjvBbq20EJq2irygbAeWug
	9GSiQ97Jum2fdHw1w092KENGsoTF4DxRMmeB9svXP5oq82d6CrSRwdjznT+vF3LsLIAx
	o/3W/kEgvxX3nod7mSbO7Seclft210o8yzyYVWtE5v8oUoB5YmBJTy6n1hBYO4HAwcGr
	iwtbzwd01Oqo8jUeXzilZUU90rb78d69vsBm1U1d6WRt9Eq9csXG5Rf8V6DeSjnazeZA
	iAWw==
X-Gm-Message-State: AElRT7HIdouyD6FJUDZifIUgAudkE3W4Bec2Js75Ip1xZ6+V6z7EadmE
	25tUO8rwSFp4KJpfB728B2JYNQ==
X-Google-Smtp-Source: AIpwx49RLQCCzbFRcXEPJMqc1pmvNLe42KhgEKEQjlTacYWyMse4+0pFFssULOWl/e5ItKK6K0yUlg==
X-Received: by 10.28.116.13 with SMTP id p13mr2452334wmc.60.1522416736051;
	Fri, 30 Mar 2018 06:32:16 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC180221E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc1:8022:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	93sm10468396wrh.46.2018.03.30.06.32.15
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 30 Mar 2018 06:32:15 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Mar 2018 15:31:23 +0200
Message-Id: <20180330133151.25882-12-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180330133151.25882-1-schnitzeltony@gmail.com>
References: <20180330133151.25882-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 11/39] glmark2: refresh Fix-configure-for-sqrt-check.patch
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
X-List-Received-Date: Fri, 30 Mar 2018 13:32:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../files/Fix-configure-for-sqrt-check.patch       | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/meta-oe/recipes-benchmark/glmark2/files/Fix-configure-for-sqrt-check.patch b/meta-oe/recipes-benchmark/glmark2/files/Fix-configure-for-sqrt-check.patch
index fde82381d..7de05ee58 100644
--- a/meta-oe/recipes-benchmark/glmark2/files/Fix-configure-for-sqrt-check.patch
+++ b/meta-oe/recipes-benchmark/glmark2/files/Fix-configure-for-sqrt-check.patch
@@ -1,13 +1,21 @@
-Index: git/wscript
-===================================================================
---- git.orig/wscript	2016-07-29 13:15:44.954249796 -0500
-+++ git/wscript	2016-07-29 15:52:06.196768865 -0500
-@@ -90,7 +90,7 @@
-         ctx.check_cxx(lib = lib, uselib_store = uselib)
+From 9fb298c398f88a63d71432be1410d52fae089063 Mon Sep 17 00:00:00 2001
+From: Tom Hochstein <tom.hochstein@nxp.com>
+Date: Mon, 8 Aug 2016 11:39:54 -0500
+
+---
+ wscript | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/wscript b/wscript
+index ca843f4..eb4a26a 100644
+--- a/wscript
++++ b/wscript
+@@ -84,7 +84,7 @@ def configure(ctx):
+         ctx.check_cc(lib = lib, uselib_store = uselib)
  
      # Check required functions
 -    req_funcs = [('memset', 'string.h', []) ,('sqrt', 'math.h', ['m'])]
 +    req_funcs = [('memset', 'string.h', [])]
      for func, header, uselib in req_funcs:
-         ctx.check_cxx(function_name = func, header_name = header,
+         ctx.check_cc(function_name = func, header_name = header,
                        uselib = uselib, mandatory = True)
-- 
2.14.3


