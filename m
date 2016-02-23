Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id D3FAF77377
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Feb 2016 16:17:23 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id a4so216540609wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Feb 2016 08:17:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Xq/b3SsH4f7tSN2wL03LRqrKifFmqb9MiXSoUoRJLL0=;
	b=jgG52O3Xt980SEhUco7Js3LAdIseNpur1XP8y30lAK4XbrtiohH3neE/wdpSfzPwvX
	R8Ju764yoqYcQgSk16/ijE9PLleR5AG61SxeXb+2clAXOLfcHelbarhotdH7L/OcWqem
	0TvNwX+iGtBYlwOTiKiKO7BxF23l/jqqdhywin7zxiv4tDKC/3+nBethrMlONxnZ5P60
	QOUnnZE+WJP+xL2Jt/QA7LnaCIKt7mZE1Kt646jVNBaKAYT5KBLsmtMknC6oNz5ZUpHz
	6N7WVeDMJHZzZgrSO50Tk/qiKJ9PlGNOP4Ez/yQTAcBesKrtatavznFgXVcxuDPrlBoN
	7Xog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Xq/b3SsH4f7tSN2wL03LRqrKifFmqb9MiXSoUoRJLL0=;
	b=AEKggdib8mkafqLWNU2j6l2Zr1dKLIpeRhtfVyT64KQXBly12aIP+4I/WdCYYvSd5E
	s9HhvsJjb2wE5Cz5aLzw/mXR0wtvWGsZzVjeHTVrIzoeKMmqCpDltxG35AuuaEcWagg8
	iREmylrpQUGuhg4vcDzdpU7q9Q0OnsobjUK1n0QkQimYaVlvNX5580G6YQO6d2ySOA2F
	EGJUJmyHBH6scfaz81C5GFNdug/6Q0+BsOw/6PH4CLuDwpSSivKS/Xh8U7XjaEXW3k1J
	tyhqNvNBA6Ci0UrW82QQMMuLHZgNLzvYzIoOI6LDPrwsXr+ZY24t5TZyZVniermZo4b/
	rmDA==
X-Gm-Message-State: AG10YOSrBduR70RAGQ7d7/k/BR3egSeTHFdBGgy92oqgmFAWpMOKqgIe3MKcy5GHor6D6A==
X-Received: by 10.194.92.68 with SMTP id ck4mr33978512wjb.144.1456244243925;
	Tue, 23 Feb 2016 08:17:23 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	t3sm30553512wjz.11.2016.02.23.08.17.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Feb 2016 08:17:22 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 23 Feb 2016 17:18:21 +0100
Message-Id: <1456244301-18755-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.1
Subject: [PATCH][meta-oe] msr-tools: Explicitly set EXTRA_OEMAKE as required
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
X-List-Received-Date: Tue, 23 Feb 2016 16:17:24 -0000

This recipe currently relies on EXTRA_OEMAKE having been to set to
"-e MAKEFLAGS=" in bitbake.conf to operate. It is necessary to make
this explicit so that the default in bitbake.conf can be changed.

Without this it fails with:
  msr-tools-1.3-r0 do_package_qa: QA Issue: Architecture did not match (3 to 62)
because it will build for host architecture
---
 meta-oe/recipes-devtools/msr-tools/msr-tools_1.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/msr-tools/msr-tools_1.3.bb b/meta-oe/recipes-devtools/msr-tools/msr-tools_1.3.bb
index caebcb9..e4701af 100644
--- a/meta-oe/recipes-devtools/msr-tools/msr-tools_1.3.bb
+++ b/meta-oe/recipes-devtools/msr-tools/msr-tools_1.3.bb
@@ -12,6 +12,8 @@ S = "${WORKDIR}/msr-tools-master"
 
 COMPATIBLE_HOST = '(i.86|x86_64).*-linux'
 
+EXTRA_OEMAKE = "-e MAKEFLAGS="
+
 do_install() {
     install -d ${D}${sbindir}
     install -m 0755 rdmsr ${D}${sbindir}
-- 
2.7.1


