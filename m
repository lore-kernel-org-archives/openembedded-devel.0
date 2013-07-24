Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f49.google.com (mail-ee0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id BCC806B398
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jul 2013 12:41:24 +0000 (UTC)
Received: by mail-ee0-f49.google.com with SMTP id b57so212638eek.22
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jul 2013 05:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=c3xVWqcGU+hXgtuf7m6yFTgnxsOvpFat0M/1fa1VEe0=;
	b=EojzUk6fBolhiNfjMDY2dxMSOl1N5jKU6/8xx0NvbQqW7QyiAs5bB+sfAVL5bGTCHm
	2m+W4Aif55SLVkRUsHUp9aqAsoY6fcu8Mz8QQVD26MfH8dh78nvJskbIt0GwcpA5N7qX
	StYwaVuqfuT7qKYMUY4bYMgsw58aqD5rN/PfgE64cN8WT/nPRaQ/nRwY/6QOzkAvy2tX
	B46kcEqUPbrtgo+2PQayVHgRjJzMud49TGKmJUcq1J3HYTPEWkmlmVb2IWyzVdIxGsny
	DzlGbnyJghJlkzI6Tc9xREN+WUkFYQe9mA4oXB2HFrvord7wTWH9NFqxSV4I6Cx3FM0G
	ArgQ==
X-Received: by 10.15.21.78 with SMTP id c54mr37195353eeu.14.1374669685067;
	Wed, 24 Jul 2013 05:41:25 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	n5sm65862089eed.9.2013.07.24.05.41.24 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 24 Jul 2013 05:41:24 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 24 Jul 2013 14:41:06 +0200
Message-Id: <cdec1bd2ec53fd872a5cbeb7bd3d21c48dfffc0f.1374669516.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <bddf85b42118361920fbde7c54baffd0e085d5a7.1374669516.git.Martin.Jansa@gmail.com>
References: <bddf85b42118361920fbde7c54baffd0e085d5a7.1374669516.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1374669516.git.Martin.Jansa@gmail.com>
References: <cover.1374669516.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 22/29] libftdi: add PACKAGECONFIG for cpp-wrapper
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
X-List-Received-Date: Wed, 24 Jul 2013 12:41:25 -0000

* also fixes
  WARNING: QA Issue: libftdi: The compile log indicates that host include and/or library paths were used.
           Please check the log '/OE/oe-core/tmp-eglibc/work/x86_64-oe-linux/libftdi/0.19-r1/temp/log.do_compile' for more information.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/libftdi/libftdi_0.19.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-support/libftdi/libftdi_0.19.bb b/meta-oe/recipes-support/libftdi/libftdi_0.19.bb
index 2b8068b..a62236f 100644
--- a/meta-oe/recipes-support/libftdi/libftdi_0.19.bb
+++ b/meta-oe/recipes-support/libftdi/libftdi_0.19.bb
@@ -20,6 +20,9 @@ SRC_URI = "http://www.intra2net.com/en/developer/libftdi/download/libftdi-${PV}.
 SRC_URI[md5sum] = "e6e25f33b4327b1b7aa1156947da45f3"
 SRC_URI[sha256sum] = "567c9d2c42d92fc401c5aba2deed45ffb2433990984e816bcdf31e441aef06be"
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[cpp-wrapper] = "--enable-libftdipp,--disable-libftdipp,boost"
+
 inherit autotools binconfig pkgconfig
 
 BBCLASSEXTEND = "native"
-- 
1.8.3.2


