Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 3A7D2771A8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 13:09:13 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id c200so170337774wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 05:09:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=M3IsydOIP4n7cqp4gRXtLqmhbzMa2QnsU2QAaT/szMU=;
	b=ktMobvBtpMeq++9QZ13vNxy0WnviUbAFNHGin3omxhJs+ULGIb4i9BCBxiH59Ip/xe
	UxuPlimXnbcSSCwxlk9RhTEfFr2R+D39Gc0ySIrtb7OJ8xHeBO76PTB04ZGrKCeVkVRj
	7IxVNoNtIKJywo7uSFbqL/761q4DF3mXkT69Q8YuvciVCN8yIbm8TdtmIA4GquKTX1P4
	0YS9413tJmA0RKH7Vnl4m2PzYHXVi/lYKmNTTe4s+/da+8K03fUG7GmAcIswrouS/PyP
	KxcB48JaLpBe3VVpjDNDQOnjJZBg6tFvqM37/4rUfE4g0U+084rbViAhPn2R93Fpv8O/
	LJxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=M3IsydOIP4n7cqp4gRXtLqmhbzMa2QnsU2QAaT/szMU=;
	b=XJwZz+9bdIR08UOzSmk3Qpug1X3PyQI/TFZTVmNcc3JHYBbNsii8HZUNRN596YyKCB
	SByylFbhBorv/ElmM3XA5uVpmulg3RtzT5ME50yzNNTykGmWqvqOOX7e+mObWxmE/tUs
	1bsEDktfcQpUTHfrjVpJH6HJIWTtzF8qLwgi/O/oYXsY85YxRHoR69e+93nbiYUM3W05
	HzPgEq6bKZeUINR45OoEfBMIx3NFJDIQvFsNBl9Z1QSauxWmicQG/XF1g3NZogRFkQGw
	COcV9Vzg3JmCb96M7Oq0BwbIjEea4nXSSp3L7ZXyiKYD3t9IZprHqPT6fvTZ0sCnYdFL
	mlqA==
X-Gm-Message-State: AG10YOTT+qvwoJsPZMxnGddRDYzb402Ne75yaXyyNove618eCdgT13CnWK4TQMpVWppVDQ==
X-Received: by 10.194.121.136 with SMTP id lk8mr31190219wjb.92.1456146554445; 
	Mon, 22 Feb 2016 05:09:14 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	i12sm21026358wmf.10.2016.02.22.05.09.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Feb 2016 05:09:13 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Feb 2016 14:09:53 +0100
Message-Id: <1456146596-6976-7-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1456146596-6976-1-git-send-email-Martin.Jansa@gmail.com>
References: <1456146596-6976-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-oe 07/10] wayland-fits: Blacklist
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
X-List-Received-Date: Mon, 22 Feb 2016 13:09:14 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-graphics/wayland/wayland-fits_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-graphics/wayland/wayland-fits_git.bb b/meta-oe/recipes-graphics/wayland/wayland-fits_git.bb
index b74c44a..374a850 100755
--- a/meta-oe/recipes-graphics/wayland/wayland-fits_git.bb
+++ b/meta-oe/recipes-graphics/wayland/wayland-fits_git.bb
@@ -31,3 +31,6 @@ do_install_append() {
 
 FILES_${PN} += "${bindir}/wfits ${libdir}/weston/*.so"
 FILES_${PN}-dbg += "${bindir}/.debug ${libdir}/weston/.debug ${prefix}/src"
+
+# http://errors.yoctoproject.org/Errors/Details/35141/
+PNBLACKLIST[wayland-fits] ?= "BROKEN: fails since wayland upgrade: weston-wfits.cpp:86:39: error: expected primary-expression before 'struct'"
-- 
2.7.1


