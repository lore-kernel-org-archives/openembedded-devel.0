Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id BECB97453C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Apr 2018 07:25:42 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id y66so11748425pfi.7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Apr 2018 00:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=0onQ+wFVZuwoTUoagNY97kfyauSx+5l4WZ235C4sOVo=;
	b=HnxAcX2QbJrfl+pEge3zSuVJq/C/6xHtYZJL5Mi2voH+n3Ci4cZ7VDhTd/+up2d28c
	hX/R01yVLzwwaXYO5L2GhvvY7QW3pIdClXXNRIH6Gv68iDL9l2jD3cxa3DOMF2QGnfMv
	2G9mD74aTV7wgltNXMJqdkAXwPD8fiKVszKoRkl5TzGYYbm/yreCny8Wl66twzm3U4l9
	U4GTUkR0ix8HyPWpSkaVx+0SztNfe6BpeUd+yAeXGY3LqFPhF5nfVmEg9FpkMbcvswHP
	dZXWWKLCQfGUmFzfshmpbFmR0Hvijh4svmiKaPd4UVdMOVRiY1MccitHOaYTleYYitJr
	uvWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=0onQ+wFVZuwoTUoagNY97kfyauSx+5l4WZ235C4sOVo=;
	b=Mvr5CYOVpufdbeqOrPpo8crkPl2D6Eq6KMx0VzWlbFYmTrWQA9Fi6LBgHP/6W8Sht9
	9ozNgi52GdEna+IVV8HxAZbq01YnORtDKJ4RU9CjB1Wx6tQyMDoJ/EeOj2esN3aLPS7P
	lnnsFkrhyhKIQupFdUCX4tI5+UYoKIIBqEWvflGIzAVioU4KYO2FKr41g18OANYOUKk2
	w2nPzibFEk8vol4HJImzRD5rUORlH/k+IOXWt/RqB8bKvDW3Jh+JJbucrAf0jWutfMKB
	bGdKtcEiTeKKExx4xFHJI8xzXpZsG5jmwaLSS86qondWP1GK9p+c0pNSIo9gztsUzx9g
	XViQ==
X-Gm-Message-State: ALQs6tD2EbyT1lC8ZL/3b85R2ffwhXHKalMM3ryQxr5rCJb+JtzUU2k6
	CTC2L6dTXNEyM5aOAWwCIMQ/Og==
X-Google-Smtp-Source: AIpwx4+fakVI1fM0bK9WR+XPwJRr/k4r2db+wcD0qXLBsL+b3uXjLiMv6jOdt1yTv7/S5xrZ515WNQ==
X-Received: by 10.101.88.11 with SMTP id g11mr869460pgr.201.1523949943637;
	Tue, 17 Apr 2018 00:25:43 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c::487b])
	by smtp.gmail.com with ESMTPSA id
	t25sm22832313pfh.184.2018.04.17.00.25.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Apr 2018 00:25:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Apr 2018 00:25:34 -0700
Message-Id: <20180417072535.18114-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
Subject: [meta-networking][PATCH 1/2] memcached: Upgrade to 1.5.7
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
X-List-Received-Date: Tue, 17 Apr 2018 07:25:42 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../memcached/{memcached_1.5.0.bb => memcached_1.5.7.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/memcached/{memcached_1.5.0.bb => memcached_1.5.7.bb} (92%)

diff --git a/meta-networking/recipes-support/memcached/memcached_1.5.0.bb b/meta-networking/recipes-support/memcached/memcached_1.5.7.bb
similarity index 92%
rename from meta-networking/recipes-support/memcached/memcached_1.5.0.bb
rename to meta-networking/recipes-support/memcached/memcached_1.5.7.bb
index fd3d171f0..0703e7c59 100644
--- a/meta-networking/recipes-support/memcached/memcached_1.5.0.bb
+++ b/meta-networking/recipes-support/memcached/memcached_1.5.7.bb
@@ -22,8 +22,8 @@ RDEPENDS_${PN} += "perl perl-module-posix perl-module-autoloader \
 SRC_URI = "http://www.memcached.org/files/${BP}.tar.gz \
            file://memcached-add-hugetlbfs-check.patch \
            "
-SRC_URI[md5sum] = "81326513f60d7ba482f8131975cd55ae"
-SRC_URI[sha256sum] = "c001f812024bb461b5e4d7d0506daab63dff9614eea26f46536c3b7e1e601c32"
+SRC_URI[md5sum] = "07feaa900181c66753f9b060f40f24aa"
+SRC_URI[sha256sum] = "5bb706a8fc7ae7461a6788eaddd85e4a4e84e952d3a80c21926342c2838f4e46"
 
 # set the same COMPATIBLE_HOST as libhugetlbfs
 COMPATIBLE_HOST = '(i.86|x86_64|powerpc|powerpc64|arm).*-linux'
-- 
2.17.0


