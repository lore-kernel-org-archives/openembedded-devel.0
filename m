Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 2270E77225
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2015 14:22:59 +0000 (UTC)
Received: by wmww144 with SMTP id w144so202578752wmw.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2015 06:22:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=lM3ZCr17uAp2MQDZY8bffK0Af5wc6vzzEamSUgghp98=;
	b=Da6Y+ww/3E5TwutCPo0/3Cnj2drSyl68Eqo+qLYwy4tuwa5grd5zEAZZuu1/YIqykw
	Kh2tg10P7mRpM7ol95Zji0u0ydiVuX1rk5WwINHHFIG7AhsiIh95Jyzdmw3Bp2fYs/mZ
	M1uIGtcupi0+fvuwGVQapz4l02cItleSwmtu9nIWAhORi1dJjRTLmxBi3NQlQe0TliDg
	nCLc5kMoKQa9KJ/2QmtU4DG5H9L8J47+aEV4UXj34p67j0AvH6oG6TOgrb9BwFenuK9L
	52xbgTPQR0dz8VuDgjIiO/iG+2QRqtJmnK14qaC1trjAX0mbcaCD6eOBgpFb7G+pjYul
	NU6A==
X-Received: by 10.28.170.19 with SMTP id t19mr16449048wme.65.1447338179792;
	Thu, 12 Nov 2015 06:22:59 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	r9sm14707321wjz.35.2015.11.12.06.22.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Nov 2015 06:22:59 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Nov 2015 15:23:03 +0100
Message-Id: <1447338183-9675-9-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1447338183-9675-1-git-send-email-Martin.Jansa@gmail.com>
References: <1447338183-9675-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-oe 9/9] phpmyadmin: exclude bash dependency with SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS
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
X-List-Received-Date: Thu, 12 Nov 2015 14:23:00 -0000

* see:
  http://lists.openembedded.org/pipermail/openembedded-devel/2015-September/103271.html
* fixes:
ERROR: phpmyadmin different signature for task do_package_write_ipk.sigdata between qemux86copy and qemuarm
runtaskdeps changed from ['bashbash_4.3.30.bb.do_packagedata', 'opkg-utilsopkg-utils_git.bb.do_populate_sysroot:virtual:native', 'phpmyadminphpmyadmin_4.4.9.bb.do_package', 'phpmyadminphpmyadmin_4.4.9.bb.do_packagedata', 'pseudopseudo_1.7.4.bb.do_populate_sysroot:virtual:native'] to ['bashbash_4.3.30.bb.do_packagedata', 'opkg-utilsopkg-utils_git.bb.do_populate_sysroot:virtual:native', 'phpmyadminphpmyadmin_4.4.9.bb.do_package', 'phpmyadminphpmyadmin_4.4.9.bb.do_packagedata', 'pseudopseudo_1.7.4.bb.do_populate_sysroot:virtual:native']
openembedded-core/meta/recipes-extended/bash/bash_4.3.30.bb.do_packagedata with hash c08b791d0f860a835a911f5a4c9a32d9
 changed to
openembedded-core/meta/recipes-extended/bash/bash_4.3.30.bb.do_packagedata with hash 91674ffdfc796e4ab503093d2c8379da
Hash for dependent task bashbash_4.3.30.bb.do_packagedata changed from c08b791d0f860a835a911f5a4c9a32d9 to 91674ffdfc796e4ab503093d2c8379da

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-webserver/conf/layer.conf | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-webserver/conf/layer.conf b/meta-webserver/conf/layer.conf
index a4d6a27..bb508a8 100644
--- a/meta-webserver/conf/layer.conf
+++ b/meta-webserver/conf/layer.conf
@@ -18,3 +18,7 @@ LAYERVERSION_webserver = "1"
 LAYERDEPENDS_webserver = "core"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
+
+SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
+  phpmyadmin->bash \
+"
-- 
2.6.3


