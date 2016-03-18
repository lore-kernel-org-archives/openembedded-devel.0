Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lb0-f173.google.com (mail-lb0-f173.google.com
	[209.85.217.173])
	by mail.openembedded.org (Postfix) with ESMTP id B0A2960017
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Mar 2016 11:20:18 +0000 (UTC)
Received: by mail-lb0-f173.google.com with SMTP id qe11so31905811lbc.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Mar 2016 04:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=xQC19gdp0aR1YERBrM7zwaJ2q4PkDKjV4Pt7AWr9UrQ=;
	b=iZNpNVNDw/LAmrmkaepvbOjHEdHlKUk+4cWPgwtrYLpoIZgLnKJ9JBMl5sVwRBFS8s
	s/O91hUcMyHhztgHy3XKGc/Or0azP30Hy3/8N5EvjnCNM8yqmVDsmNaLNdPydFXvqmRA
	Baygnjmpfe/FCHPIL/8qWESE50VGTYF4f3esJHY0uwY0OsLurFVlwSh+BM9aAnZNU3GU
	JWv4BqMwdn78gZhjVcCM+8GwJgQAoEOKniu76OkBIxEpb0+JOCGmAEeiye3bniY3U0ba
	NUUAGOX2A5jMFZ3FR5don/68gANAPN6KHZTLrx4lfWQJU7NoIY+HBT56je3mSmEsmVvF
	jwiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=xQC19gdp0aR1YERBrM7zwaJ2q4PkDKjV4Pt7AWr9UrQ=;
	b=Ml8eW/z+ztMb/96Bop1eTVvSKHMjyZKGqZNZeEImyiDiQqHLqSp9t+MOBmJcJOre35
	Gd5uhnmtFxbBK2S6PTKmHplCy3KiiLT6Y1LmBwzMDWbKWzpgxfp1z8q1QIGROqsSWg+Y
	X76NE4UW1NBYJv4+bbSLPqHpsgTZlSKbZmWQelt7s3ClqwhWTsjJ58foK10mPQIQ2A/U
	kNuPHorCDxebm1zRT6Bvpkv/l2sUsOanCK4hDU51TnsKFqFwGACmo03ept7MsTcgpFqn
	zYSuKrdXbnumbMLceHu3izb8U780z3SoXg8+Xvya0flqMDXJe6SF2Md8ToBrhcyvBJN3
	RGDg==
X-Gm-Message-State: AD7BkJItrWN+Mm5SNc7IA+du80iLnUIUgO2ouGZNct6tYPR3+JfHKKa05I/+jgp8H9j9EA==
X-Received: by 10.112.166.100 with SMTP id zf4mr5509296lbb.58.1458300018172;
	Fri, 18 Mar 2016 04:20:18 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id
	pi5sm2107256lbb.41.2016.03.18.04.20.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 18 Mar 2016 04:20:17 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: Martin Jansa <Martin.Jansa@gmail.com>, Andre McCurdy <armccurdy@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>,
	openembedded-devel@lists.openembedded.org
Date: Fri, 18 Mar 2016 12:20:12 +0100
Message-Id: <1458300015-9666-1-git-send-email-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.7.0
Subject: [meta-oe][PATCH v3 1/4] opencv: Fix use before set error on meta package
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
X-List-Received-Date: Fri, 18 Mar 2016 11:20:21 -0000

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


