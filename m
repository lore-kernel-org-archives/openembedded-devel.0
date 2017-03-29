Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 19C0177BD1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Mar 2017 09:16:56 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id t189so19282758wmt.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Mar 2017 02:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=GHH8uf/uszK39/jlQfG+3OyWC3NJ64OSgsu6amdZsaU=;
	b=CORHfE3HcwMUDRDOPdpuuUvX8Q4y0htg0bGc5lO4halQlXqwLFbHHyNgWcldmgoW3O
	uKsQcbR1SqUQGx9ub2tNoflxl9mwuCykhhd1wPu41ThRusvMsDvWwRe87KjskppB4VR8
	OKSMJDeHVOdQIx1xDcJx8nAsJxJHLkfNJylismJVDfKdp6ws/1QSGWjIuE0qPfo2XT0U
	pF49rkUyTah+B1NGVlnqBTjILp3jx+Fj3ihbQB1NiNO2nHXrJZjW0Db9NTK1Ptd+SCzz
	JnwtqkxbKVfLK3gJfhF3DS7Fvd6bqsBTEAZKOTKZLRU8fW7hbHUgZoUD60ClQcW1YJDB
	W+FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=GHH8uf/uszK39/jlQfG+3OyWC3NJ64OSgsu6amdZsaU=;
	b=Yax3AFcT4MYaBnHHzvvIiFwOU8Tvf3n65fE6RPvDQZhgiDZ4u0BOzkOFA9ABv2MyXi
	/+a8ir9MprACFaVxMylyKrpk9qQyCqG14toHIuvxwDOHC3FWjYDRqgwuHo3W4RNhKzHD
	DIa+aCsIOZCITfhx84IhkH9GmHlSdeLHrL1IPiXt4cewtJBV+gSqbsyvnnETB/dFtUHC
	uC3Fdf2H+kzftV6uiMTfqey/PSCDw1NgXpjeVwE2rhZb/mptdpuypg4bbNqmPTkFVDRn
	By3g1UVnp3j3Iv5H8FeL/bCTd+C5Pzwh8+HsrHkBbu552ZsjykyVsTAkzLnkSFr4um2g
	rtWA==
X-Gm-Message-State: AFeK/H31H8GAv4pac4GE0QeY2l3ClgXve5mUNbfVEvMT5l7N5bktbzTHCgkS0zAsiGZlkw==
X-Received: by 10.28.30.197 with SMTP id e188mr278234wme.99.1490779017547;
	Wed, 29 Mar 2017 02:16:57 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	l141sm7286674wma.32.2017.03.29.02.16.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 29 Mar 2017 02:16:56 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Mar 2017 11:16:43 +0200
Message-Id: <20170329091643.32180-9-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170329091643.32180-1-Martin.Jansa@gmail.com>
References: <20170329091643.32180-1-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-oe 9/9] zile: fix do_install
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
X-List-Received-Date: Wed, 29 Mar 2017 09:16:57 -0000

* --ignore-fail-on-non-empty works when the directory isn't empty, but still reports
  failure when the directory doesn't exist at all, like in:
  http://errors.yoctoproject.org/Errors/Details/138248/

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/zile/zile_2.4.11.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/zile/zile_2.4.11.bb b/meta-oe/recipes-support/zile/zile_2.4.11.bb
index 05a6afbe9..d663f44b9 100644
--- a/meta-oe/recipes-support/zile/zile_2.4.11.bb
+++ b/meta-oe/recipes-support/zile/zile_2.4.11.bb
@@ -15,8 +15,8 @@ SRC_URI[sha256sum] = "1fd27bbddc61491b1fbb29a345d0d344734aa9e80cfa07b02892eedf83
 inherit autotools pkgconfig
 
 do_install_append() {
-        rm -rf ${D}${libdir}/charset.alias
-        rmdir --ignore-fail-on-non-empty ${D}${libdir}
+    rm -rf ${D}${libdir}/charset.alias
+    rmdir --ignore-fail-on-non-empty ${D}${libdir} || true
 }
 
 PACKAGECONFIG ??= ""
-- 
2.12.2


