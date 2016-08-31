Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5E62473216
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Aug 2016 19:41:26 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id c133so291330wmd.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Aug 2016 12:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=VcO1GYV+5qWoMQKiB+TBfwRqwtdAEm8EgOYMJqfm2cM=;
	b=DnNqLNX9ArfosPOHYt8tPl8USl2kpRmUrlzRFNy159TO0t9xNRNeYfDdfop176Kwmv
	YdN7MnSFv5peujdejW89zth2PpPtEtTEmucAt0QGExDinQCnEAeaqhn7rm+vpJXedjxn
	lr6cmAaQwhUhyXHX18eefz0F4DsMVd1rDy5VpSK2kQeeSD9cvh6KeJnUbrZHVMX6JDKp
	XHdIzZq28cW0Cs5N9bFaEVjIiLmYValRZBsVnhd2CRIoNHTgOe6SKhIPndbYg9BMEL6u
	SYBDOQizTSwGokiaIwL6qJL2FWKIa3qoMkyKAS45sDdkN+P+g5K915R0GCraTYbWyVgJ
	8n/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=VcO1GYV+5qWoMQKiB+TBfwRqwtdAEm8EgOYMJqfm2cM=;
	b=QOev2+D5RZgFKMJLhVQqXQkteJ5yA2kt691fUl2rBp+3GfeqkV9XW+0mMpalgNeklJ
	N9QgNOYNYuBspOye3sbeWi8uKbNorTHj4kNyzp4r6zNmabI+Cfoy1i8Iqc2SAwpdWWFs
	4Yx033X1pQWqF2raIhw7Bo7GmA5EPSjfhfb6ciRLhWZk9VksIyUQfnRImaYQ0zJKCBTL
	+ISA+fQNvE3V5q6pEUu8DVyOI+ZgmBBg618d0deBdsaPCz6VByKHXFTxTjQ2EsFHWMpu
	eIWgfCAD+ePHc7qgMWEJipiBhkKmcf1gzjlUGr3vWZPlwzwTl301MteFjAXZKcMRRCry
	Uatg==
X-Gm-Message-State: AE9vXwNOU68Zr7dr+JxRDD63La+MgfbU1IrTMIEku6+vuIYo259fmBo5w+nieaOzdFc22g==
X-Received: by 10.28.100.215 with SMTP id y206mr10819800wmb.115.1472672486675; 
	Wed, 31 Aug 2016 12:41:26 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	190sm10435463wmk.13.2016.08.31.12.41.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 31 Aug 2016 12:41:25 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 31 Aug 2016 21:41:03 +0200
Message-Id: <20160831194106.14065-8-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.9.2
In-Reply-To: <20160831194106.14065-1-Martin.Jansa@gmail.com>
References: <20160831194106.14065-1-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 08/11] glmark2: blacklist, fails to build with gcc-6
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
X-List-Received-Date: Wed, 31 Aug 2016 19:41:26 -0000

* needs extra space after " in:
  ../src/native-state-x11.cpp:63:33: error: invalid suffix on literal; C++11 requires a space between literal and string macro [-Werror=literal-suffix]
       static const char *win_name("glmark2 "GLMARK_VERSION);
                                   ^
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-benchmark/glmark2/glmark2_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
index 3a1c2e2..c6a4584 100644
--- a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
+++ b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
@@ -53,3 +53,5 @@ python __anonymous() {
         d.appendVar("EXTRA_OECONF", " --with-flavors=%s" % ",".join(flavors))
 }
 
+# http://errors.yoctoproject.org/Errors/Details/81005/
+PNBLACKLIST[glmark2] ?= "BROKEN: fails to build with gcc-6"
-- 
2.9.2


