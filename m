Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f180.google.com (mail-ea0-f180.google.com
	[209.85.215.180])
	by mail.openembedded.org (Postfix) with ESMTP id 204956EB06
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  1 Feb 2014 07:34:21 +0000 (UTC)
Received: by mail-ea0-f180.google.com with SMTP id o10so2702877eaj.25
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jan 2014 23:34:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=TRoODnQErSKuLoQkYf5isnYjgVn0QNbXpbOiLx6Mx/w=;
	b=I53oaayUeJD6Z6PlorIbU0YJuX2caFf5GJe0BPqbsNp+0bEY4YzvwdphC07HYKgGyZ
	XB3bn8kZAmZlRufxs1tmglhGm3WevQ9rIompoFFix+1c1rBpCf2qfS7MXzAf8RZjvARC
	KieqoMVEEWZ/PfV0+dsk6lMb/3wMcy+mM+E2HQe1sXVz5QMcbxghrWuKwndBqjVu5FaG
	RE8QTl3KXvdTCzoAIBHybFgr4SnKpBNDTGdQ1TPhQl0hFi47W0ucp4q6QmcteMgXt6lg
	2iLqYiHiUhPHthXAch2MFSuC5X2oqk593W+z/F3DFlH+7+g/gV7DFAAVr4svL7+qH9e+
	i6GQ==
X-Received: by 10.15.26.8 with SMTP id m8mr30133957eeu.25.1391240062868;
	Fri, 31 Jan 2014 23:34:22 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id m9sm32952641eeh.3.2014.01.31.23.34.21
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Jan 2014 23:34:22 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  1 Feb 2014 08:34:02 +0100
Message-Id: <c4001a2c9b03d177f81d632c79c3525a9ee54c0a.1391239970.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <cover.1391239970.git.Martin.Jansa@gmail.com>
References: <cover.1391239970.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1391239970.git.Martin.Jansa@gmail.com>
References: <cover.1391239970.git.Martin.Jansa@gmail.com>
Subject: [PATCH 06/20] elementary: Add PACKAGECONFIG for ewebkit and disable it by default
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
X-List-Received-Date: Sat, 01 Feb 2014 07:34:22 -0000

* with floating dependency some packages can fail to detect elementary:
  Package 'ewebkit', required by 'elementary', not found
* webkit-efl isn't in very good shape, so I don't want to force using
  it on everybody -> disable ewebkit by default

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/elementary.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-efl/recipes-efl/efl/elementary.inc b/meta-efl/recipes-efl/efl/elementary.inc
index 5c5c463..8d95967 100644
--- a/meta-efl/recipes-efl/efl/elementary.inc
+++ b/meta-efl/recipes-efl/efl/elementary.inc
@@ -19,6 +19,7 @@ EXTRA_OECONF_append_class-target = "\
 BBCLASSEXTEND = "native"
 
 PACKAGECONFIG[eweather] = "--enable-eweather,--disable-eweather,libeweather"
+PACKAGECONFIG[ewebkit] = "--with-elementary-web-backend=ewebkit,--with-elementary-web-backend=none,webkit-efl"
 
 do_compile_append_class-target() {
     sed -i -e s:${STAGING_DIR_TARGET}::g \
-- 
1.8.5.3


