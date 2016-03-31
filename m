Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lb0-f174.google.com (mail-lb0-f174.google.com
	[209.85.217.174])
	by mail.openembedded.org (Postfix) with ESMTP id 89C71606BF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Mar 2016 11:26:36 +0000 (UTC)
Received: by mail-lb0-f174.google.com with SMTP id qe11so50392162lbc.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Mar 2016 04:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=56TB26JwlGxE28UfjIXm3ndV/TAo8w/xslRSKQJ5Qm4=;
	b=tFSS6qDClLi75U33PNYWgmqQrtnY8iH2uxPSuv95cVqSy+LUy/0MCdoYW/KN2Nkfrb
	S5JZYHeVaIwdVvZUBGEufc3vAoh8KonUcPLXtK96PrIfrD0V8kH8Vf78QdzbN4Zku6mi
	Op8Q42BuEHBvZLqBT1yoRyrgr8CM88mPOuW4vySUWR0Z2lk4hCQKpdoKsWAOgE2S4p8K
	x7wrs8DjR9mjJB4MoWGT4rOT8OZu1vJRxomzIpdvcipxf9aXwKknIQjuXaZCUXOFoLTw
	t0D/137J7t/Fsf2x/9J0OLcHBGVYQMKPGZB96diL3fFzYnN2rxnY9++1z3+Xj852pa5/
	9r0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=56TB26JwlGxE28UfjIXm3ndV/TAo8w/xslRSKQJ5Qm4=;
	b=MzE9yTnz5yzdg5PyqeKF2KRspBUSb15Iq2uu0/WSE0iI/u2tXxBFhT5UyhjQfL+/Tp
	87FGcYrDTPGut/wOfRaIgOoNnWlbycxLJwV/ZjNNFyt6rzb2y9uPsI/C/6YdzOBZfGN4
	efO/rZw9YgWm4i7k+/5WFTjluZeA0+Qa2lDFNi1NEFS5VsGXsewdQx03wEuCrJ9eVEEv
	POlvRLU8/2yHT7gofL3za2dYYegq6Vm7p8WWWwzdUaeb6RKIpwj9NNMVXhdHOmNI6K+T
	E/akTJN1tDr98R0wSHYUh02QJWxLllG6G2g8r6iUPjNpKyclh9g9zmbNOuWdThcQr6wh
	NlQg==
X-Gm-Message-State: AD7BkJLz+gxgkJ33/yrzhQL3lEgA7EvVXtYrVo97GavkfVkOuF/+QkuCt7rZ3UUFliibHQ==
X-Received: by 10.112.163.135 with SMTP id yi7mr6178962lbb.122.1459423596881; 
	Thu, 31 Mar 2016 04:26:36 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id
	t17sm1328655lfd.17.2016.03.31.04.26.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 31 Mar 2016 04:26:35 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: Martin Jansa <Martin.Jansa@gmail.com>, Andre McCurdy <armccurdy@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>,
	openembedded-devel@lists.openembedded.org
Date: Thu, 31 Mar 2016 13:26:27 +0200
Message-Id: <1459423593-4123-2-git-send-email-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.8.0.rc3
In-Reply-To: <1459423593-4123-1-git-send-email-ricardo.ribalda@gmail.com>
References: <1459423593-4123-1-git-send-email-ricardo.ribalda@gmail.com>
Subject: [meta-oe][PATCH v4 1/7] opencv: Fix use before set error on meta package
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
X-List-Received-Date: Thu, 31 Mar 2016 11:26:39 -0000

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
2.8.0.rc3


