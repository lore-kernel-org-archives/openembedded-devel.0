Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id 80E9560557
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 May 2015 15:11:33 +0000 (UTC)
Received: by pacyx8 with SMTP id yx8so195935880pac.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 May 2015 08:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=ZCL64979LNXBgPQMyYmw/X6zWu2TAEMb2xhoN5/H7tQ=;
	b=SZBOrRYnI/1rDed9o5zWO8u96Oic2+YAOCxCEh3R7OcSRZMBGLCeEQn8Fil4LKEVbA
	3E1M07suwKWz1+amUpLWeXQ8T1N4txM/l0qLnRjF8OiYokJbSnnnEmiC2kmFu2APzFMD
	ioBOpOY3f4BZJZnXaEB71n2F2xX0QBfZFmBgLDhCDOaf9V74uyICjFdviyrhMNJLgeqN
	PNd/sKWmMYXJxUAO6v8LCNhniX8z6prdqPpYsdmxa51I1Rs13VK3Tk5pOmqg1YxKl8sc
	bJcumuqwKRFp0KLP8rJ10A64nVMJtmTha6s48KaH7LSibJRweGwwAUWAALONYKlzoBu1
	VAbA==
X-Received: by 10.66.224.109 with SMTP id rb13mr32926966pac.133.1430838678942; 
	Tue, 05 May 2015 08:11:18 -0700 (PDT)
Received: from Pahoa2.hsd1.ca.comcast.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by mx.google.com with ESMTPSA id af5sm6955772pbc.90.2015.05.05.08.11.16
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 05 May 2015 08:11:17 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	hongxu.jia@windriver.com
Date: Tue,  5 May 2015 08:11:11 -0700
Message-Id: <1430838671-21289-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [meta-perl][PATCH] libnet-ssleay-perl: fix QA warning
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
X-List-Received-Date: Tue, 05 May 2015 15:11:35 -0000

WARNING: QA Issue: /usr/lib/libnet-ssleay-perl/ptest/t/local/38@underscore@priv-key.t_libnet-ssleay-perl-ptest contained in package libnet-ssleay-perl-ptest requires /usr/bin/perl, but no providers found in its RDEPENDS [file-rdeps]

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.65.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.65.bb b/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.65.bb
index f6c4b8b..b289151 100644
--- a/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.65.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.65.bb
@@ -45,3 +45,5 @@ do_install_ptest() {
 BBCLASSEXTEND = "native"
 
 FILES_${PN}-dbg =+ "${libdir}/perl/vendor_perl/*/auto/Net/SSLeay/.debug/"
+
+RDEPENDS_${PN}-ptest = " perl"
-- 
2.3.5


