Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 6BBA26FD1F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 09:09:36 +0000 (UTC)
Received: by mail-wi0-f169.google.com with SMTP id hi2so9753373wib.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 02:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Vs+DPWeupQ3dGCCenMjS8qDsZ5c6X3S7xVbd7y+BVHc=;
	b=N4u8+pTB8pUdCbAN0Ipp74GSXr4t9sD/XAZdBL/zTHx6d3GR5d/4eYdqSJItB3wtmQ
	CmnDuR0LvBnNA2XAWLqiE8b592z6hTXgkvLzD9FOs/8SToN10wZ8Ecxv6GGZFdfXQiI7
	htBetvelInslBq/Bgqb6zmknXX9OrXyeFbCwd1T6XV/FkUdEsI/bmvOeBlEAP96udTs9
	q/YDk74P/lo9yjYD+97q69Y9BlZe5SKqI5ZWa6G8sxVi0I6i9zo2sie6hlHPwOb782YA
	l5/P2ThieiAAWzVj+dW33ruNpmT+S3zEyOboM+HaeCKFdP1ZdWzoyjJ0oc26cm9x25lN
	OhbQ==
X-Received: by 10.180.186.97 with SMTP id fj1mr4785494wic.18.1403168977083;
	Thu, 19 Jun 2014 02:09:37 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	o2sm6345302wia.16.2014.06.19.02.09.36 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 Jun 2014 02:09:36 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Jun 2014 11:09:32 +0200
Message-Id: <1403168972-24905-4-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <1403168972-24905-1-git-send-email-Martin.Jansa@gmail.com>
References: <1403168972-24905-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][WIP][PATCH 4/4] glmark2: Add virtual/libx11 dependency
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
X-List-Received-Date: Thu, 19 Jun 2014 09:09:39 -0000

* without it, do_configure fails:
  | Checking for 'x11'                       : not found
  | The configuration failed
  so it doesn't look as optional dependency, but someone please
  double-check

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-benchmark/glmark2/glmark2_2014.03.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-benchmark/glmark2/glmark2_2014.03.bb b/meta-oe/recipes-benchmark/glmark2/glmark2_2014.03.bb
index 3ff0449..565423a 100644
--- a/meta-oe/recipes-benchmark/glmark2/glmark2_2014.03.bb
+++ b/meta-oe/recipes-benchmark/glmark2/glmark2_2014.03.bb
@@ -8,7 +8,7 @@ LICENSE = "GPLv3+ & SGIv1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                     file://COPYING.SGI;beginline=5;md5=269cdab4af6748677acce51d9aa13552"
 
-DEPENDS = "libpng12 jpeg"
+DEPENDS = "libpng12 jpeg virtual/libx11"
 
 SRC_URI = "https://launchpad.net/${BPN}/trunk/${PV}/+download/${BP}.tar.gz"
 
-- 
2.0.0


