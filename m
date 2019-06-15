Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
	[209.85.215.171])
	by mail.openembedded.org (Postfix) with ESMTP id 3384C7E8B0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Jun 2019 17:57:47 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id v11so3414328pgl.5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Jun 2019 10:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=daJzNy9NfGcJt4HxNFwV1OKPm/vJas8FumMSs4fNlpY=;
	b=q4EHjxr3lQARPp3ESmND/FTz9Y2j3KyqabjT4lrKpesKyJsU1Nzl0kwLRkf0RZLgn2
	7RSwXyCG2mRv+vV7GomXYEOenFyVJC3qlkreBXGhPq7acLSvIdpyg8AZTL1pvG/4u6WN
	0uF2JFQz/YOde+5T09wYtviboAUBdJZK3dh5MzJswd6S0vTiHuZqYJXlhSocKy3D2A/U
	v3H84XHci3DDlqeEZrP1Zr0XjDtml1qH2PTKiAmCnKSgA4rgsBxg9/gk1Q5ZSIxIlOnS
	EAbZ94ZXDIwDHvySWMJwO6gtdwdeVxv4UZbmMiK7Vh6KiTaDLtvsSXj/4qvz7wZqlzXb
	DArg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=daJzNy9NfGcJt4HxNFwV1OKPm/vJas8FumMSs4fNlpY=;
	b=mXJoXEfAPunODdGwAXX2g8KkcveSuGQDXYwwT8ReIrijkvNaQzwbBLn154Af6s0n3l
	WluuSEl00F1jebOla0Q1YxYezJXGw/NCpzEV8vpqHO5b31MJpAD6ZVPXLC7AVHl6rOfz
	kj/u4XT93JJ8DnAMwPQnj8EIN+rrZQAazfR96CcrCtLPvOJQJEDKmOdeczVzHLya750H
	dF/zNn+DDzrSCA3dUP/XzlEFwcVDEm0+qIBb/d5KW74MjILuy9SM5V6PfyWjrM6YbJpJ
	UTHu8ePmQtQprnvx53BR/82e5JF0Ad/2pZKQBKP4opw1FrLQGUzkozWowm+Gv3VJ/O79
	yegA==
X-Gm-Message-State: APjAAAUhpVcSfqnY7O4GqSbkfe45vdiMBSvxoyvMRDxg+bNKd68Rmiw/
	2yVmOmvQRrfD2oUVoIPUBxw2ExeQ
X-Google-Smtp-Source: APXvYqz8+k0LxKF2qOMwQP6aK60Lo8lHuumoACsIrtLU8h432V7TJ/Z+EyqoEKF8uBZnky7BQdO8CA==
X-Received: by 2002:a63:d748:: with SMTP id w8mr14007594pgi.157.1560621468182; 
	Sat, 15 Jun 2019 10:57:48 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:5942:80bf:dc9c:15ab])
	by smtp.gmail.com with ESMTPSA id
	f14sm8561221pfn.53.2019.06.15.10.57.47
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 15 Jun 2019 10:57:47 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 15 Jun 2019 10:57:22 -0700
Message-Id: <e0238bc3c6361b827b77934b0f4195a77e10dc15.1560620937.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1560620937.git.akuster808@gmail.com>
References: <cover.1560620937.git.akuster808@gmail.com>
Subject: [Warror][ 18/23] libmikmod: fix SRC_URI
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
X-List-Received-Date: Sat, 15 Jun 2019 17:57:47 -0000

From: Martin Jansa <martin.jansa@gmail.com>

* it was moved to outdated_versions directory

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.6.bb b/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.6.bb
index d53dff6..bbf58f9 100644
--- a/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.6.bb
+++ b/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.6.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=4fbd65380cdd255951079008b364516c"
 DEPENDS = "alsa-lib texinfo"
 
 SRC_URI = "\
-    ${SOURCEFORGE_MIRROR}/project/mikmod/${BPN}/${PV}/${BPN}-${PV}.tar.gz \
+    ${SOURCEFORGE_MIRROR}/project/mikmod/outdated_versions/${BPN}/${PV}/${BPN}-${PV}.tar.gz \
 "
 SRC_URI[md5sum] = "9dd9bed30c6f7607a55480234606071b"
 SRC_URI[sha256sum] = "3f363e03f7b1db75b9b6602841bbd440ed275a548e53545f980df8155de4d330"
-- 
2.7.4


