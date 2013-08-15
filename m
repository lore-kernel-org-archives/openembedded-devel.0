Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f44.google.com (mail-ee0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id 816BF6B7AE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 07:19:29 +0000 (UTC)
Received: by mail-ee0-f44.google.com with SMTP id b47so182023eek.31
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 00:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=5duepo6vaN6nILyiBOJl0AlWAnr/oFuogOPQTW7P2AA=;
	b=cNLHTGXev12XrM5A/QwmWXtsxDCgd/qHpL9FIdo3o26vFZxQoFll0z3HRG4FUs9loY
	hLfyVrhgF3S9NGNltpRCTkMxMIfSRD+Kxt82HycM339f893ddO7llp6GMHVDvOwF7cKP
	/HabmOl6zW8WH4ETSkPuQ+GvuuHKkfXxi76EJaJgnjHS79g+SvtKYO6H6HWK8MM1dLuF
	kcl0oynvsJNOqZKhOs7qj8QbrmyyVyXnQhpPucRuErGSZS/9NB4veBjhuMokh6rmOXYc
	Y/38RQ+KFsb7l0SoSbBb2ojd4ZGWEvw8xV8PdTeaIi0cW/Zpm/r5QrxuX4DWdcY6cvvr
	vVIQ==
X-Received: by 10.14.122.132 with SMTP id t4mr20898964eeh.20.1376551169972;
	Thu, 15 Aug 2013 00:19:29 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	d8sm68744691eeh.8.2013.08.15.00.19.29
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 00:19:29 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Aug 2013 09:19:08 +0200
Message-Id: <c551d43bcbbef92ae8fbbb809fe32e48addd4264.1376551135.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][dylan][PATCH 28/60] libunwind: add PACKAGECONFIG for lzma
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
X-List-Received-Date: Thu, 15 Aug 2013 07:19:30 -0000

* it's autodetected from sysroot

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/libunwind/libunwind.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-support/libunwind/libunwind.inc b/meta-oe/recipes-support/libunwind/libunwind.inc
index f028766..637e570 100644
--- a/meta-oe/recipes-support/libunwind/libunwind.inc
+++ b/meta-oe/recipes-support/libunwind/libunwind.inc
@@ -7,6 +7,9 @@ SRC_URI = "http://download.savannah.nongnu.org/releases/${BPN}/${BPN}-${PV}.tar.
 
 inherit autotools
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[lzma] = "--enable-minidebuginfo,--disable-minidebuginfo,lzma"
+
 EXTRA_OECONF_arm = "--enable-debug-frame"
 
 BBCLASSEXTEND = "native"
-- 
1.8.3.2


