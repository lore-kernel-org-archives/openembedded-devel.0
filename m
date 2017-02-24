Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id AD47D77560
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Feb 2017 21:54:30 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id x35so4187753qtc.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Feb 2017 13:54:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=4YWPVXbq8fKAU8/S0VyOlSxBtTwq5vXKfQMdOjQGHY8=;
	b=YbimXqlXJEUZWMXflHbZ0Gls/AmV9vTlCPPy/BLlCHb1Tu/I/WBHv1C9n/Z0xeEFHc
	xfgR5u8BVp3m8MDLS9SlTy7S4bspucYGQ0RRvXvNmObl/bSIhP7Ak8Ne+IL3Ve3CFWCe
	mCjVJETGkXM5JZujLbSWVfbe81CsW8uh+7Gr1v5iR/aI+M+7y2+mw/BNljQtPv5gTCyJ
	P6XVdBV1TMRfTbPPOx4u4GBYpiaiuD1k/TgokvUliOgJCEHSnsFBVLjvfcRtne1ds6P0
	Xj340NWeHJh7w1yENrfycsMMsdNaiA+oMvl/MDWrYy3c3FShfIPQyPbpCXAjvn/KVYSY
	xgPg==
X-Gm-Message-State: AMke39ktwgyxnfBV6SHd8ZffqpfglVuPfCUyvuKGbZ7hki1SuMC2Mn/jm+PNktqUOMH+mw==
X-Received: by 10.237.41.229 with SMTP id o92mr4792693qtd.223.1487973271494;
	Fri, 24 Feb 2017 13:54:31 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	j140sm5622137qke.6.2017.02.24.13.54.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 24 Feb 2017 13:54:31 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 Feb 2017 16:54:24 -0500
Message-Id: <1487973264-29272-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH] syslog-ng: update inherit to work correctly with RSS
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
X-List-Received-Date: Fri, 24 Feb 2017 21:54:31 -0000

Resolves build issue exposed by RSS
http://errors.yoctoproject.org/Errors/Details/130631/

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-oe/recipes-support/syslog-ng/syslog-ng.inc      | 2 +-
 meta-oe/recipes-support/syslog-ng/syslog-ng_3.6.4.bb | 2 --
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
index 21d1748..0dbcc6e 100644
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
@@ -22,7 +22,7 @@ SRC_URI = "http://www.balabit.com/downloads/files/syslog-ng/sources/${PV}/source
            file://configure.ac-add-option-enable-thread-tls-to-manage-.patch \
 "
 
-inherit autotools systemd pkgconfig update-rc.d
+inherit autotools gettext systemd pkgconfig update-rc.d
 
 EXTRA_OECONF = " \
     --enable-dynamic-linking \
diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.6.4.bb b/meta-oe/recipes-support/syslog-ng/syslog-ng_3.6.4.bb
index bee1e19..73609af 100644
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.6.4.bb
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng_3.6.4.bb
@@ -13,5 +13,3 @@ SRC_URI += " \
 
 SRC_URI[md5sum] = "e9f401615e92e5eb27396c995c1446ba"
 SRC_URI[sha256sum] = "7be11df31ac7d716f1f952e22b5ae8e2049edd633a41b223776a853d9106f4e7"
-
-PNBLACKLIST[syslog-ng] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130631/"
-- 
2.7.4


