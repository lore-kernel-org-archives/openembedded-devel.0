Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id 6EDF872D23
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jan 2015 22:54:08 +0000 (UTC)
Received: by mail-pa0-f46.google.com with SMTP id lj1so47108pab.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jan 2015 14:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=8u9kPzfk0AcqUo8wYgNo/VlWhKQ46V2zHsGgvU/sydw=;
	b=jlRrVDfU6fuRcInDw0og82IkXGl/X54aHZeV7nerhsdT1buXYzyF/ixOtMfFHhQ5GO
	yQTYvdMKqoXrduHMEP9zl4CgSuDa6Im5gLhOmW2Vnowvj3hftWOt26wONY4pc5R2XQX8
	6TtkJ5zVuqUC8h6s8oUDF/tRCMQX5NhL6xiB7azMRDcREbwgHdyMuD8WmaTMTpQ7pm6I
	ITKaJE/PqjEplaZjci/rH0QWESaxrNk3eykwCd8skImGnCLwSJkcpFB44QIJEUpWnjHz
	bToudIAP0jdbetRqjyM+FRjjigCxF25xWaMUO7LciamGJdjudGlGAekyLdTXHA5VYRnK
	CULA==
X-Received: by 10.68.232.33 with SMTP id tl1mr15028894pbc.65.1422053649267;
	Fri, 23 Jan 2015 14:54:09 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id gz6sm2932760pbc.38.2015.01.23.14.54.07
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 23 Jan 2015 14:54:08 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	otavio@ossystems.com.br
Date: Fri, 23 Jan 2015 14:53:43 -0800
Message-Id: <6ed20e55a4aba46e0fae3eb741f7c3e79bc5cde4.1422053452.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1422053452.git.akuster808@gmail.com>
References: <cover.1422053452.git.akuster808@gmail.com>
In-Reply-To: <cover.1422053452.git.akuster808@gmail.com>
References: <cover.1422053452.git.akuster808@gmail.com>
Subject: [PATCH 03/11] meta-perl: Add LAYERVERSION and LAYERDEPENDS
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
X-List-Received-Date: Fri, 23 Jan 2015 22:54:10 -0000

From: Jackie Huang <jackie.huang@windriver.com>

According to README, it depends on oe-core layer

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-perl/conf/layer.conf | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-perl/conf/layer.conf b/meta-perl/conf/layer.conf
index 09ed0e5..0485ac8 100644
--- a/meta-perl/conf/layer.conf
+++ b/meta-perl/conf/layer.conf
@@ -8,3 +8,9 @@ BBFILES += "${LAYERDIR}/recipes-*/*/*.bb \
 BBFILE_COLLECTIONS += "perl-layer"
 BBFILE_PATTERN_perl-layer := "^${LAYERDIR}/"
 BBFILE_PRIORITY_perl-layer = "6"
+
+# This should only be incremented on significant changes that will
+# cause compatibility issues with other layers
+LAYERVERSION_perl-layer = "1"
+
+LAYERDEPENDS_perl-layer = "core"
-- 
1.9.1


