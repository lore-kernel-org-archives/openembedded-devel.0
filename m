Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lb0-f175.google.com (mail-lb0-f175.google.com
	[209.85.217.175])
	by mail.openembedded.org (Postfix) with ESMTP id 3C5BA70179
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Mar 2016 12:13:41 +0000 (UTC)
Received: by mail-lb0-f175.google.com with SMTP id bc4so235692640lbc.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Mar 2016 05:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=xQC19gdp0aR1YERBrM7zwaJ2q4PkDKjV4Pt7AWr9UrQ=;
	b=KRgqp9l5D+823U1L6+rQQamBQjyzIJr3uW3wgvPLwsAUc9NJHm7VdeiMY9W578gJIh
	m4kXQS2hz+I+nfspf4VYbReQCwucy//JjybydmtHmupHo1r4gzA1FVeJ1bFA1R3eC+Sk
	pVp6p9c+LBflgx7UZ8UJpsiNPvCX/IskW1oosqu+bojZ2bL7k5qqU1ABwwN5lEDRErqH
	ChRUiA3FRpvCi59UW569t4FIPK9JMTx1vVVGVSV+QSrqj+4caAwD6UEAZp2mddgrxOUJ
	Ld9D+UGqyj+LJ6UQ1ullCN0HVns+wUBYi01wF8pqaYbJ9NNM8KgJAJhQOGAi69jKDdoy
	nkSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=xQC19gdp0aR1YERBrM7zwaJ2q4PkDKjV4Pt7AWr9UrQ=;
	b=Hf5EtIlTxBA6h9YD9nvoptaLU1gW05lyQSf/mhEU2xPd7FhaWVa4Pofl1ABmgPnLvr
	NKAfbHnVZDCEs9GpQTNeshlgzFmUZVkFg3FWKqlpAZ7hEONaknAAkTHMkrYVVucGPZZV
	vNKWYIgqFfE+1Gcfb6j8mR2/fQ3iMFmZI6s1meIb+AXr+nIZp+Wx9ITkf0xNSHEDSJHl
	WCge6quFcLXPzJa20i2G3OjFepovwUxSrGp9FkvA9m4Ob+h6W8QcDuTnbw6Kf1yEO+28
	rYxgl8gT6nnK1KGFeCfFXnNlMFh2YrcP8XBwReaFUzfuPRUbEcmSaaeZdKN67ToDiqld
	HYgg==
X-Gm-Message-State: AD7BkJKR2a/y0wM/2WLSHXQKSiar2F0+Q+064pgQFoazIOemEipmIIdTlHyaDeK+DGIjnw==
X-Received: by 10.25.213.196 with SMTP id m187mr7842133lfg.67.1457957620975;
	Mon, 14 Mar 2016 05:13:40 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id
	un6sm3516634lbb.18.2016.03.14.05.13.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 14 Mar 2016 05:13:39 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: Martin Jansa <Martin.Jansa@gmail.com>, Andre McCurdy <armccurdy@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>,
	openembedded-devel@lists.openembedded.org
Date: Mon, 14 Mar 2016 13:13:35 +0100
Message-Id: <1457957618-32168-1-git-send-email-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.7.0
Subject: [meta-oe][PATCH v2 1/4] opencv_3: Fix use before set error on meta package
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
X-List-Received-Date: Mon, 14 Mar 2016 12:13:42 -0000

This bug was introducing a loop dependency of opencv->opencv that was
confusing dpkg.

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 meta-oe/recipes-support/opencv/opencv_3.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/opencv/opencv_3.0.bb b/meta-oe/recipes-support/opencv/opencv_3.0.bb
index 99ca8b35727d..f6c4ca8fac16 100644
--- a/meta-oe/recipes-support/opencv/opencv_3.0.bb
+++ b/meta-oe/recipes-support/opencv/opencv_3.0.bb
@@ -86,8 +86,8 @@ python populate_packages_prepend () {
             metapkg_rdepends.append(pkg)
     d.setVar('RRECOMMENDS_' + metapkg, ' '.join(metapkg_rdepends))
 
-    blacklist = [ metapkg ]
     metapkg =  pn
+    blacklist = [ metapkg ]
     metapkg_rdepends = [ ]
     for pkg in packages[1:]:
         if not pkg in blacklist and not pkg in metapkg_rdepends and not pkg.endswith('-dev') and not pkg.endswith('-dbg') and not pkg.endswith('-doc') :
-- 
2.7.0


