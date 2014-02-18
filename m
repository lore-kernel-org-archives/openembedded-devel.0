Return-Path: <diego.sueiro@gmail.com>
Received: from mail-yh0-f41.google.com (mail-yh0-f41.google.com
	[209.85.213.41])
	by mail.openembedded.org (Postfix) with ESMTP id 516396E8E1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Feb 2014 13:54:56 +0000 (UTC)
Received: by mail-yh0-f41.google.com with SMTP id f73so15402759yha.14
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Feb 2014 05:54:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=CDsK1fdDlllYfcy5Bzb1i+D+TNZgTD27fW8p9Bs+1Ow=;
	b=hbpl0gr2sppad0RQ96tEVukNd+3IeouNKj1Je+QgLpSiSNxWhKve9OlIBHapLePcER
	QUFeXEfmRps+dBj2i3rD6fhGsOB4XJAvlgfOo5fPJrv/Rl4192nxMX3bGF91jiY98Oil
	/Z8dvw1TYoYehcZmQEOSjxXPn6sIKJLkOAWSivNUiiV/MZ9Rzg+4ZEh3VmVRqy5Dtwfo
	O6Vjsc0MdiTnJBQ+dXspOaS5IH8PHWQ2/M5GnpyfwLyam4t3sC9qQf3qI9/Hi0g1ies7
	KoSbXis9E42Wb2dk3aaL8LEidAIlxnC1LFc4Ri2FOZb+v7pysI9s6FLHC4sNvG3Bpokr
	U2jw==
X-Received: by 10.236.74.162 with SMTP id x22mr3821196yhd.131.1392731697170;
	Tue, 18 Feb 2014 05:54:57 -0800 (PST)
Received: from localhost.localdomain ([201.82.73.213])
	by mx.google.com with ESMTPSA id q9sm59219244yhk.16.2014.02.18.05.54.55
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 18 Feb 2014 05:54:56 -0800 (PST)
From: Diego Sueiro <diego.sueiro@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Feb 2014 10:54:41 -0300
Message-Id: <1392731681-6149-1-git-send-email-diego.sueiro@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [meta-openembedded][PATCH] libao: Add PACKAGECONFIG for esound support
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
X-List-Received-Date: Tue, 18 Feb 2014 13:54:56 -0000

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


