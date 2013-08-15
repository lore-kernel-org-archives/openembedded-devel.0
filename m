Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f173.google.com (mail-ea0-f173.google.com
	[209.85.215.173])
	by mail.openembedded.org (Postfix) with ESMTP id 056FD6B7F8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 07:19:26 +0000 (UTC)
Received: by mail-ea0-f173.google.com with SMTP id g10so182820eak.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 00:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=7s4F6o0gLfA6o373VlQZp+f6cp3miUpV5w9yT2a9zMs=;
	b=QdwhUux/NzjZVbSAJKOGY02SimEwXXQyVpQZXMYxBEUkl/hYnYgBpSU+UxF5O9derS
	V296wGVOa80XQ0i16dvQ7VmGlPXjWz7vOcVGmmrSxEH8IFg00m6XPpW8ycpuiqFVzUTl
	Evl71k8BFzW9QzPm1TFwEsb9cS9eZrqEFVjykwnF58KPqIRV8IA/e914GQFvPE+MFCPX
	BHq+iDyac9o336tEDjwXlZHkj3QxGCe/yvKi2n6RfD9Y9BtGepzEv5jkG5bTlZTUoyYW
	tmo0nyKALq8xYZu2yYVaurGmEkLwHMGR3Y7ecQeBY/7ChWFWtpSvZdFZeNJtDLdWU3iB
	/mkg==
X-Received: by 10.14.199.3 with SMTP id w3mr20779950een.33.1376551167455;
	Thu, 15 Aug 2013 00:19:27 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	m54sm81931720eex.2.2013.08.15.00.19.26
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 00:19:27 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Aug 2013 09:19:06 +0200
Message-Id: <3095a031edbd82c73900ab5ea242872dd3a703ab.1376551135.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][dylan][PATCH 26/60] glog: add dependency on libunwind
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
X-List-Received-Date: Thu, 15 Aug 2013 07:19:27 -0000

* it's autodetected from sysroot and configure doesn't have parameter to explicitly
  disable it so PACKAGECONFIG won't work OOTB

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/glog/glog.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/glog/glog.inc b/meta-oe/recipes-support/glog/glog.inc
index 97f3728..8a1fb42 100644
--- a/meta-oe/recipes-support/glog/glog.inc
+++ b/meta-oe/recipes-support/glog/glog.inc
@@ -6,4 +6,6 @@ HOMEPAGE = "https://code.google.com/p/google-glog/"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=dc9db360e0bbd4e46672f3fd91dd6c4b"
 
+DEPENDS = "libunwind"
+
 inherit autotools pkgconfig
-- 
1.8.3.2


