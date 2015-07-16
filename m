Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id 7CBB876124
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jul 2015 19:12:25 +0000 (UTC)
Received: by widic2 with SMTP id ic2so23024353wid.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jul 2015 12:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=bqG7K0+nLyOVWE5wkMmUinNvzswsT8jo2/HAdTopVf4=;
	b=qcCC+dYMQ2PG1A+BxlMGCHihAZvw4QuE+AmPPhj44z1zsSgne/3HQf6KrRm50ZFImc
	LuzJx/RyUWs6u6XwECGFwgskKslH+FVAldFMGnMjhtcQ/dAz4CQspEGGeEdJ516BpGQM
	8FlwBakNCp0DfH959lEswW+HrhM7ExTTR4otbVxaIn4jhD33kchTkWmhJXOsUW+Z89xj
	pK1Ir1ADGaYIt5nquFZ8qiRtNsGdK08x/PhQ8RoCKRGqp+eySTv6et0mX0VM3KWH2xz+
	82X9ZgCPXuj7GYiFyXeTn92debfHF1Fqzp/CbTQk/0jG0KiDNnStkMmLpnV31yjyuLhJ
	ag7Q==
X-Received: by 10.194.121.34 with SMTP id lh2mr22055275wjb.101.1437073944713; 
	Thu, 16 Jul 2015 12:12:24 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id j6sm4705237wix.5.2015.07.16.12.12.23
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 16 Jul 2015 12:12:23 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Jul 2015 21:12:50 +0200
Message-Id: <1437073970-24644-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.4.4
Subject: [meta-filesystems][PATCH] xorriso: inherit distro_features_check
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
X-List-Received-Date: Thu, 16 Jul 2015 19:12:28 -0000

* it correctly sets REQUIRED_DISTRO_FEATURES = x11, but without the inherit it doesn't do
  anything useful

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-filesystems/recipes-utils/xorriso/xorriso_1.4.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-filesystems/recipes-utils/xorriso/xorriso_1.4.0.bb b/meta-filesystems/recipes-utils/xorriso/xorriso_1.4.0.bb
index 8b181ca..b26709e 100644
--- a/meta-filesystems/recipes-utils/xorriso/xorriso_1.4.0.bb
+++ b/meta-filesystems/recipes-utils/xorriso/xorriso_1.4.0.bb
@@ -17,7 +17,7 @@ PACKAGECONFIG[zlib] = "--enable-zlib,--disable-zlib,zlib,"
 PACKAGECONFIG[bzip2] = "--enable-libbz2,--disable-libbz2,bzip2,"
 PACKAGECONFIG[readline] = "--enable-libreadline,--disable-libreadline,readline,"
 
-inherit autotools-brokensep pkgconfig
+inherit autotools-brokensep pkgconfig distro_features_check
 
 do_configure_prepend () {
     touch NEWS
-- 
2.4.4


