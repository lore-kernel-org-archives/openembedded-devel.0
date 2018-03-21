Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 5067178997
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Mar 2018 21:00:35 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id o1so6573700wro.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Mar 2018 14:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=CWkFamm5QCOdcaw3aeaP2jAIPyhqsqu8En2tEXQfn08=;
	b=Ty/mHfLz+aM8OxadkBeWRfARej9diNvfhRPT5z8e8GCNth2Hy6gb5CXnoG5ybQVs1v
	G0Xb1ovZhmrGWvnWwlRBOgdISEtiVzRZ6GW2G7cImKbICki/YJSDdzH2awf0y1N/qN+Q
	/g1rAUPgQknipowxEiDHkmz42zr3Jg7d4w+Mk3QW/zMnvnB0Ib8Y5oZiy5b9XZxmW6GH
	Z3Kr+fiF7myU3QodZSayC8GhXcSRtcZhtb7k/RH1/sTxmjCWUKK98SqQUCfx2JZDZxwp
	IbF8eOmo1HTnOsNQ9YHcs5//3MKkTgOM2wNa3SP0jZ3mZ+Dd24Rs/BM7qSEGTylocWQO
	MxXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=CWkFamm5QCOdcaw3aeaP2jAIPyhqsqu8En2tEXQfn08=;
	b=YfOKU0OwIPkU9eaIZybtpvbGk0QyZCciI65beuSfKLDqzWHJ0Ktba9UNGnmfeFXvAF
	L5locqk0D/D4kp5f3bXqWt4lZe7BkIsJXJ2zyzyGJiZ/sQ5EDuzWI04QPaQyi8n9Lxm+
	1rJ27T0nqSr9aBCFvi75exqpc+n3Gh7nDcZJn2Yvxp88mOVRGkMUphtjcFtgkdw9n/T1
	eFCjjDYCli+wYWODA/ldh1YL5N2xO27rcpgu7TSj6cNNCMEUrbSOckVCuxzj9eQqY/Vz
	00a6BCu0k+5tq0jjipPKu4lKsCRks4RuqC3eBazO3Col2rm+HzsrHBwuQRgr53AHQRhp
	c85w==
X-Gm-Message-State: AElRT7FvC3UTKkp6Zq5v0jQPrr5f+6KzjsYojg8LtOdTGDFa7ez/cAO9
	nG03vALqF10kqAvWTyiV+gtn4Q==
X-Google-Smtp-Source: AG47ELv1ObHcBfaj7uUii13EPYK/MsIALkwi5Xq5nx4skQIRDbd8ijvALn2k8ea/MVrwxY8CCmxOXA==
X-Received: by 10.223.184.219 with SMTP id c27mr18994895wrg.30.1521666036064; 
	Wed, 21 Mar 2018 14:00:36 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC111801E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc1:1180:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	q21sm5916339wmd.12.2018.03.21.14.00.35
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 21 Mar 2018 14:00:35 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Mar 2018 22:00:21 +0100
Message-Id: <20180321210022.4682-4-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180321210022.4682-1-schnitzeltony@gmail.com>
References: <20180321210022.4682-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 4/5] glmark2: refresh Fix-configure-for-sqrt-check.patch
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
X-List-Received-Date: Wed, 21 Mar 2018 21:00:35 -0000
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


