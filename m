Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by mail.openembedded.org (Postfix) with ESMTP id A773A7D573
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Apr 2019 21:09:20 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id u24so3686017lfg.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Apr 2019 14:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=l4nMkXgW5UBSYtZx+ljqmPFoFCocXzVMdwmkuF4PfVo=;
	b=F/9EhMkdvK/2EWld5mcQu9MaSiEqtNw+M2d6o8Qzfoi4bpQ6eoLBzDGZWmm/ATZAzV
	EqbhGKTkckVF9f0/vXe0opXHKOzwmzUTMPBbptKMy5H+f81GRdrgtD5G7iuxLMUFzQvZ
	AScyugKcQrt1F/cYXWXOLpWgv/zBoo+z/eH2aPRcN/V/4BUk9MTxyKc1WECf51PE0Ao2
	plTsKa/qlwmQ75xmNNT2brXdBwgFOitCZ9PvXlmPQTWwE0/dHFTafNxi3bi4Ut/FhbCU
	BOT3VECukrr1fzikHKW9kBzOWbM5SEpW2Gm6RQbxU5SmQgQjPkJj0+NlReuYIY0347w/
	uchA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=l4nMkXgW5UBSYtZx+ljqmPFoFCocXzVMdwmkuF4PfVo=;
	b=LGKU8+JUYUVgTWpc7DW86xZUyInv4PzLNLOf+OS9wuzyPUpkSg1j/NSoY1SMw2XgSO
	WDlhl3+V2u5ONPUpUALpoSmJCU+OLH7QnUeP9JeMPPgIOXU50nJE2hAm09bYvVTDMfds
	Dnwf4fGIi/k3EOU+6Hy/nsr65xZ7grWnnI7wIslfX3/gCr42AE9jji8Rw2XlXSLF3BBo
	m+CRXDa9D7gTG1DflgesuAsfQtbxH4Y1vLuX0NLW2abximuTAU+7CCX5psRLrHC43tz3
	sdN+4jCdke2agsUBfVm0BwU/4FuSNepfdwqLUUfHL7jVZw3SJnOo0awbZKf3UL8kB+0z
	4z3Q==
X-Gm-Message-State: APjAAAVOrGvByr2FPu1VORRdVfHvRNWXUP/BUZYwucZNWHqYGNfkg3O4
	oUzZHHtuRjTxO/mVg94gLvyT4fSToMI=
X-Google-Smtp-Source: APXvYqxf+QqRHazThB757uHNCL37xt933W6VppqrYvcm0E+ZXnQYdvzzdthgWrhnl1wE+Cy3dqzGtg==
X-Received: by 2002:a05:6512:c1:: with SMTP id
	c1mr12467983lfp.132.1554757760708; 
	Mon, 08 Apr 2019 14:09:20 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id o3sm6174116lfd.53.2019.04.08.14.09.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Apr 2019 14:09:20 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  8 Apr 2019 23:09:12 +0200
Message-Id: <20190408210912.4527-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] analyze-suspend: update to 5.3
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
X-List-Received-Date: Mon, 08 Apr 2019 21:09:20 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{analyze-suspend_git.bb => analyze-suspend_5.3.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-benchmark/analyze-suspend/{analyze-suspend_git.bb => analyze-suspend_5.3.bb} (92%)

diff --git a/meta-oe/recipes-benchmark/analyze-suspend/analyze-suspend_git.bb b/meta-oe/recipes-benchmark/analyze-suspend/analyze-suspend_5.3.bb
similarity index 92%
rename from meta-oe/recipes-benchmark/analyze-suspend/analyze-suspend_git.bb
rename to meta-oe/recipes-benchmark/analyze-suspend/analyze-suspend_5.3.bb
index 8888b2267..451671dda 100644
--- a/meta-oe/recipes-benchmark/analyze-suspend/analyze-suspend_git.bb
+++ b/meta-oe/recipes-benchmark/analyze-suspend/analyze-suspend_5.3.bb
@@ -16,9 +16,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e"
 
 RDEPENDS_${PN} += "python-core python-datetime python-stringold"
 
-PV = "3.2+gitr${SRCPV}"
-SRCREV = "c669e002a2e7504f21e277ad248fa81033926391"
 SRC_URI = "git://github.com/01org/suspendresume.git;protocol=https"
+SRCREV = "5be9a16547234cef5aca8bfaccd920490ea1cfa7"
+
 S = "${WORKDIR}/git"
 
 do_install() {
-- 
2.17.1


