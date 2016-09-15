Return-Path: <joe@deserted.net>
Received: from mail-it0-f68.google.com (mail-it0-f68.google.com
	[209.85.214.68])
	by mail.openembedded.org (Postfix) with ESMTP id ECBF077175
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Sep 2016 13:38:45 +0000 (UTC)
Received: by mail-it0-f68.google.com with SMTP id e20so4482259itc.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Sep 2016 06:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=deserted-net.20150623.gappssmtp.com; s=20150623;
	h=sender:from:to:subject:date:message-id;
	bh=QmCyi6ZP/90ECMI1jINTC2oKKWf7d9vHP85iD7sY/fE=;
	b=DnnMp2QhAXPsVe3Ya8IIfMeXjCA6g8N5jSVWkqaTqjH94F3O8fa8KfIjScA4rJcP3J
	5KuTdEMGEwW/bE26pOxQhnvTWv2R7HnxqdOdTsY0XBc7Pl6RyxwA3kKXTPN9QyCazhzi
	63VIFPIMLCtkOn3cK//mXGFux5S7hDxuADjlmMWx/SvriybNxnGsYXV7tTzSkM9Yh58w
	ctWLked2hPACCNFRP7FCgVIXAKTB3k+DgrZzAYwWg+gmL04Aya5lVHmkA3sHNovSh09m
	g4Y/DfERmeKbRGS4jZHZhLJ6UHylCABxQWota/bueBbTy2PJlsQya/jKmi/qlf7/wnL4
	Ld7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:subject:date:message-id;
	bh=QmCyi6ZP/90ECMI1jINTC2oKKWf7d9vHP85iD7sY/fE=;
	b=RXYubIzpynU5kAMJLFxo5QpETkUg10TyTIFapSyqby8ZzCLrrv8gnzE2vcicWoU6iX
	ntZSwR06C/y6f/TFaFO0MYmA+UI9dDy7mt9Ul1VhLUvbOEkwvMQfm2AkyGiY/RCZ03FC
	D/s2B6UB+hRE27MibZDY9DrZVc/VGcSq4lQPHacSSiJCVtS+t6zOveuEUlcqTqojVwjZ
	xqvZ2LJB0GBvZWMwfBLP5wB1JpHQHKefREY7TSjUlhbLPBgzfa8dzyb7aTrdqUIhrDHH
	HUrQpdL8r6gUCBIRvB9PKLoTwO9UkM5iKcDoxAjUK27cXUG5xNUqujKkj+BfFVqZCXdH
	0f5g==
X-Gm-Message-State: AE9vXwN1kSyASkNg1zni2uVi8Y8ZLdegQxBNa/KtefMFIZpiTyIoTaQoP1T0dMpceWx7VA==
X-Received: by 10.107.158.213 with SMTP id h204mr17029092ioe.75.1473946726011; 
	Thu, 15 Sep 2016 06:38:46 -0700 (PDT)
Received: from mir.deserted.net ([23.233.31.74])
	by smtp.gmail.com with ESMTPSA id r94sm1693216ioi.2.2016.09.15.06.38.44
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 15 Sep 2016 06:38:45 -0700 (PDT)
Sender: Joe MacDonald <joe@deserted.net>
From: Joe MacDonald <joe_macdonald@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Sep 2016 09:38:52 -0400
Message-Id: <1473946732-6665-1-git-send-email-joe_macdonald@mentor.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-networking][PATCH] samba: un-blacklist
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
X-List-Received-Date: Thu, 15 Sep 2016 13:38:46 -0000

Commit b60c60806e57f69233db582ef88d113867c2ecd1 resolves the linking
issue, later commits (mainly 12a118989296d13e036d0daa9f9a3d45eee03ded)
resolve the packaging issue, so re-enable samba for everyone.

Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
---
 meta-networking/recipes-connectivity/samba/samba_4.4.5.bb | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
index 7d7fa02..3686faa 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
@@ -317,8 +317,3 @@ FILES_${PN}-python-dbg = "${libdir}/python${PYTHON_BASEVERSION}/site-packages/.d
 
 RDEPENDS_${PN}-pidl_append = " perl"
 FILES_${PN}-pidl = "${bindir}/pidl ${datadir}/perl5/Parse"
-
-# http://errors.yoctoproject.org/Errors/Details/81004/
-# before this issue it was also failing in do_package and
-# autodetecting libpam dependency
-PNBLACKLIST[samba] ?= "BROKEN: fails to build with new binutils-2.27"
-- 
1.9.1


