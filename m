Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
	[209.85.128.41])
	by mail.openembedded.org (Postfix) with ESMTP id 6A38E6C4D8
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Nov 2019 06:54:45 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id 8so2043810wmo.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Nov 2019 22:54:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=v8jo085xS2oQS4PTtMFhcE1RojGqe4w4lmpLVjPFwJY=;
	b=avq7FB29XrV/aTDaJxF7D0qkVHM0aRW/B3rQizDsJSvvfSbTcABXNZLFoFxr5m/tLc
	PyLz5IuYLtJ62Qa+ssXjTgs/kEifxgrViZfJqzuuAE9roHmOaTcrBqteH8ea3IwVp3Js
	K33eEf//tPvfzFWNHL5CwfbOEipnivkQpFMlTpJPKXoT9q7hOIEMackdW/cpRm0BfsRj
	szFqUZR6EkTgw+AZJwsAlcznl7OF+PcIvXyIV7I1AND5FupuSwcAuyXTZuCHB1mttUra
	3ifhYU0lrtIaK90Ggyr6EikXuYuNNPY2uH1P7nW7QyuyaZOb2/l1PjcN6FyqgbCO2nx2
	n6cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=v8jo085xS2oQS4PTtMFhcE1RojGqe4w4lmpLVjPFwJY=;
	b=TMHFyP1yp23zeEgWkJEXiwM7HR7ZIijD6/2JS5eu601eo4w50chpAn3WKUcyr/CweA
	7jnm5sdTQgT4075j+TmsOQWm051sC+RgdHJxsIIXk3W99EF2B5LMamTOcN6hTGvX3ohy
	LrCJ7mStNwCS+vwGZ3rMqz6kWzN9Hv9Hk2yGH6AFDmZvhZgCK6s2128MZRrWYEhlxgCD
	K6oxtDMo1dQGMVh3REbGNeqh71kzEoWsNPjPTxoaotFZLHd9e+CAQttPmJLy1dZEZzps
	wH/eh7TKkJCKLxibc4kYgOo4MPDPn9O915ctNKhkfhNp1I/VbU5+gwAdmiocPYTh0EfB
	jUcw==
X-Gm-Message-State: APjAAAXatK3iQGvBLnAsrGNoOJrmSAJBg7ozFuO3rE493OLO9BtSxOrK
	rBn0P+dQlVmPt3oSRVZW37o/qQW7
X-Google-Smtp-Source: APXvYqwHPjGjGa0fz3hB+ijkIsxcb1sfuqlR8ViD1O3h45cdTpvLmG+ZHRDmVnkxQlJCE2Xc/uHUGA==
X-Received: by 2002:a7b:cd86:: with SMTP id y6mr915952wmj.163.1573023285631;
	Tue, 05 Nov 2019 22:54:45 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F438C581B49BA34826387FE.dip0.t-ipconnect.de.
	[2003:f0:7f43:8c58:1b49:ba34:8263:87fe])
	by smtp.gmail.com with ESMTPSA id
	j14sm17996079wrp.16.2019.11.05.22.54.44
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 05 Nov 2019 22:54:44 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	Kai.Kang@windriver.com
Date: Wed,  6 Nov 2019 07:54:31 +0100
Message-Id: <20191106065433.3609-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [meta-xfce][PATCH 1/3] xfce4-screenshooter: upgrade 1.9.6 -> 1.9.7
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
X-List-Received-Date: Wed, 06 Nov 2019 06:54:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes for 1.9.7
=======================
- Add warning notice to imgur upload option (Bug #15347)
- Fix cursor capture when near screen edge (Bug #9262)
- Improve wording (Bug #15429)
- Allow compilation with panel 4.15
- Restore libxfce4ui 4.12 compatibility
- Translation Updates: Basque, Bulgarian, Catalan, Chinese (China),
  Chinese (Taiwan), Danish, Dutch, English (United Kingdom), French,
  German, Greek, Hungarian, Korean, Lithuanian, Malay, Norwegian Bokmål,
  Polish, Portuguese, Portuguese (Brazil), Russian, Serbian, Spanish,
  Turkish

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...e4-screenshooter_1.9.6.bb => xfce4-screenshooter_1.9.7.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-apps/xfce4-screenshooter/{xfce4-screenshooter_1.9.6.bb => xfce4-screenshooter_1.9.7.bb} (80%)

diff --git a/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.9.6.bb b/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.9.7.bb
similarity index 80%
rename from meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.9.6.bb
rename to meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.9.7.bb
index 7f6756fc9..a0de63004 100644
--- a/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.9.6.bb
+++ b/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.9.7.bb
@@ -7,8 +7,8 @@ DEPENDS = "xfce4-panel libxfce4util libxfce4ui gdk-pixbuf gtk+ glib-2.0 libsoup-
 
 inherit xfce-app
 
-SRC_URI[md5sum] = "9e4026d9ae7850b290992c9d2aea80dd"
-SRC_URI[sha256sum] = "88c174ce687d1f7ba5470d6ab5784d33dc215f8f220211e892e268189dbea658"
+SRC_URI[md5sum] = "9b63c0fa7cbde8ec4e6cacb75fc44b65"
+SRC_URI[sha256sum] = "0f7161053a23a6413376f4d17db6b774d4849384a9b1ffe01fdb2b0035a070d1"
 
 do_compile_prepend() {
     mkdir -p lib
-- 
2.21.0


