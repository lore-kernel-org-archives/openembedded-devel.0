Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by mail.openembedded.org (Postfix) with ESMTP id 342F36EB42
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  1 Feb 2014 07:34:38 +0000 (UTC)
Received: by mail-ee0-f48.google.com with SMTP id t10so2636983eei.21
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jan 2014 23:34:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=zobu5p+dTegcyBROpKC0FkaZEerZAJqZsVvh2qKK3eo=;
	b=sFwsYKUmMP5n1CElgtrB+pKZkr9qEHQLaHzWzKVYbt9v11O6uhVH/vb5eL9vKIOfvI
	fB0L/x8Vx9Qar95VmEkxnT992cl3bXzjcOWvjuD/R6uA7U0aN/M8ns0VG6F1wZBNXQ3W
	HJZJqJ4WBv2EUSLs7j8mluCjcwBHFumUzEAx44YCQCZKeUyG5qNMj6Qx0crsxh458Mte
	wvt1D2iwQvoik5pRTAkcO2QSFKzm5BgbYI6En0IAXhEN8RGpaz3xnOuXtlniFCzQuIJ5
	9y0Nky24PM/fDAJANkhzxifBPytaVA+yijCSDRayqW3D4HfPMKGzP7e8c2H1qY7AK1ev
	m+tw==
X-Received: by 10.15.21.2 with SMTP id c2mr249970eeu.77.1391240078738;
	Fri, 31 Jan 2014 23:34:38 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id g1sm46218893eet.6.2014.01.31.23.34.37
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Jan 2014 23:34:38 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  1 Feb 2014 08:34:11 +0100
Message-Id: <ac081b1fe8aa5521eeaf9ff7feb27bfb5fd3e232.1391239970.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <cover.1391239970.git.Martin.Jansa@gmail.com>
References: <cover.1391239970.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1391239970.git.Martin.Jansa@gmail.com>
References: <cover.1391239970.git.Martin.Jansa@gmail.com>
Subject: [PATCH 15/20] webkit-efl: Try to disable llint/jit to fix armv[45] build
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
X-List-Received-Date: Sat, 01 Feb 2014 07:34:38 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/webkit/webkit-efl_2.3.2+svnr159807.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-efl/recipes-efl/webkit/webkit-efl_2.3.2+svnr159807.bb b/meta-efl/recipes-efl/webkit/webkit-efl_2.3.2+svnr159807.bb
index 879ff1f..59a05a0 100644
--- a/meta-efl/recipes-efl/webkit/webkit-efl_2.3.2+svnr159807.bb
+++ b/meta-efl/recipes-efl/webkit/webkit-efl_2.3.2+svnr159807.bb
@@ -37,6 +37,9 @@ EXTRA_OECMAKE = " \
     -DENABLE_ACCESSIBILITY=Off \
     -DENABLE_BATTERY_STATUS=Off \
 "
+# generated ASM code isn't compatible with armv[45]
+EXTRA_OECMAKE_append_armv4 = " -DENABLE_LLINT=Off -DENABLE_JIT=Off -DENABLE_DFG_JIT=Off -DENABLE_FTL_JIT=Off"
+EXTRA_OECMAKE_append_armv5 = " -DENABLE_LLINT=Off -DENABLE_JIT=Off -DENABLE_DFG_JIT=Off -DENABLE_FTL_JIT=Off"
 
 LEAD_SONAME = "libewebkit.so"
 PACKAGES =+ "${PN}launcher-dbg ${PN}launcher ${PN}-inspector"
-- 
1.8.5.3


