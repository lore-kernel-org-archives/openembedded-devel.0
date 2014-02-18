Return-Path: <diego.sueiro@gmail.com>
Received: from mail-yh0-f53.google.com (mail-yh0-f53.google.com
	[209.85.213.53])
	by mail.openembedded.org (Postfix) with ESMTP id 84FF76C9B4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Feb 2014 13:52:32 +0000 (UTC)
Received: by mail-yh0-f53.google.com with SMTP id v1so15138117yhn.26
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Feb 2014 05:52:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=CDsK1fdDlllYfcy5Bzb1i+D+TNZgTD27fW8p9Bs+1Ow=;
	b=mFscKskMlcUFPquQU2BDUj9HwdEwBQGksUsvafRls9awrTCTZ+A0RWJPcMpBM1LvkU
	APkk7aneYIdxLSZDTaPxe3XGADMHwkxGS2obrqB71LCZrmH951o8TCd2dPMpIlNo9q48
	hOLpxTcOA4XWrO0OGX9c/KB8y0redVr+Dj+k/zzL8JnRuUWGS7jXhI6kyA7/uqVR0Ydc
	QCELZtiLNo0Xg/6Imm9sJqmjMb9tsUS3lA/z3WhxTgTqOZ9ALInrV0mwx6bKOPr/wrDZ
	KKPa2azMWc0eauQZyG342zvEBvqpdjFNECg0DGlPLozBP3Ul9husKf/z6AyhIl4J9We4
	a8KA==
X-Received: by 10.236.147.107 with SMTP id s71mr29753478yhj.45.1392731553125; 
	Tue, 18 Feb 2014 05:52:33 -0800 (PST)
Received: from localhost.localdomain ([201.82.73.213])
	by mx.google.com with ESMTPSA id
	q69sm21359766yhd.22.2014.02.18.05.52.30 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 18 Feb 2014 05:52:32 -0800 (PST)
From: Diego Sueiro <diego.sueiro@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Feb 2014 10:52:04 -0300
Message-Id: <1392731525-6096-1-git-send-email-diego.sueiro@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [dora][meta-openembedded][PATCH] libao: Add PACKAGECONFIG for esound support
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
X-List-Received-Date: Tue, 18 Feb 2014 13:52:33 -0000

libao compiling is failing because of a dependency on esound.
Adding PACKAGECONFIG to fix the issue.

Signed-off-by: Diego Sueiro <diego.sueiro@gmail.com>
---
 meta-multimedia/recipes-multimedia/libao/libao_1.1.0.bb |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/libao/libao_1.1.0.bb b/meta-multimedia/recipes-multimedia/libao/libao_1.1.0.bb
index efd5ec3..1ca140a 100644
--- a/meta-multimedia/recipes-multimedia/libao/libao_1.1.0.bb
+++ b/meta-multimedia/recipes-multimedia/libao/libao_1.1.0.bb
@@ -23,3 +23,6 @@ python populate_packages_prepend () {
     do_split_packages(d, rootdir, '^(.*)\.so$', output_pattern='${BPN}-plugin-%s', description='AO %s plugin')
     do_split_packages(d, rootdir_dbg, '^(.*)\.so$', output_pattern='${BPN}-plugin-%s-dbg', description='AO %s plugin debug data')
 }
+
+PACKAGECONFIG ?= ""
+PACKAGECONFIG[esound] = "--enable-esd,--disable-esd,esound"
-- 
1.7.10.4


