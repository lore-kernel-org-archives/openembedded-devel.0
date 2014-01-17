Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f175.google.com (mail-pd0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id 8C0FB60D98
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jan 2014 07:50:41 +0000 (UTC)
Received: by mail-pd0-f175.google.com with SMTP id r10so3683678pdi.20
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jan 2014 23:50:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=UcXg+u6SueFX4wcsVdRfWTKUdCQD2CagM7mFQZChnGg=;
	b=eIugBgwsPhMRH7L5PjdKd2ZYzXtWnO0rnSdPps1ZcgAlka+DunTd6pwXXql33KICfn
	hY5e53XY/AaNnGrcqlG9NmZNkiG0oN6+ArYYdlwwlYZ319SybVvkgt6C8+B5ZTKBEoGD
	GWRpHb4bRcY0ybMaNwXe08Jh8CH73gn3eLM20YkLG6d5Tv52y5mUfTRRliiQFtSUfcvY
	cttVBNpzet+h5qDAgkB/22/+KRDOrbT4/sMnl+5F/rJImQD+P9GJ7avxM6r4jVeTdsFc
	8+MdXkFRlaB/d+tBF0JEvKZKAQ80IDimOLBCYZQCZLh9BAk1Ko2xtG2sT9AHd2kaXysG
	BjGA==
X-Received: by 10.66.13.138 with SMTP id h10mr535660pac.148.1389945042239;
	Thu, 16 Jan 2014 23:50:42 -0800 (PST)
Received: from localhost.localdomain
	(99-57-140-30.lightspeed.sntcca.sbcglobal.net. [99.57.140.30])
	by mx.google.com with ESMTPSA id
	vn10sm20490054pbc.21.2014.01.16.23.50.40 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 16 Jan 2014 23:50:41 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Jan 2014 23:50:51 -0800
Message-Id: <1389945051-29080-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.5.2
Subject: [meta-oe][master/dora][PATCH] Fix QA errors when building with multilib
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
X-List-Received-Date: Fri, 17 Jan 2014 07:50:42 -0000

We do not take care of default libdir which accidently
works out to be ok for non-multilib case since its /usr/lib

Fixes error like

ERROR: QA Issue: mozjs: Files/directories were installed but not shipped
  /usr/lib
  /usr/lib/libmozjs-17.0.a
  /usr/lib/libmozjs-17.0.so
  /usr/lib/pkgconfig
  /usr/lib/.debug
  /usr/lib/pkgconfig/mozjs-17.0.pc
  /usr/lib/.debug/libmozjs-17.0.so

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb b/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
index 311372f..891ae9d 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
+++ b/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
@@ -23,6 +23,7 @@ EXTRA_OECONF = " \
     --prefix=${prefix} \
     --with-nspr-libs='-lplds4 -lplc4 -lnspr4' \
     --enable-threadsafe \
+    --libdir=${libdir} \
 "
 
 # mozjs requires autoreconf 2.13
-- 
1.7.9.5


