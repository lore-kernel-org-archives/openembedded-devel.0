Return-Path: <anders.roxell@linaro.org>
Received: from mail-lb0-f169.google.com (mail-lb0-f169.google.com
	[209.85.217.169])
	by mail.openembedded.org (Postfix) with ESMTP id 515D9762AD
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Mar 2016 08:53:05 +0000 (UTC)
Received: by mail-lb0-f169.google.com with SMTP id x1so15045841lbj.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Mar 2016 00:53:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=+gCKD3F7KKPxfZjKbeLk2dCY4fwjTZz7G3zJbvJxpDo=;
	b=jPbWKuPbjoNaa8WTy2cSj7DD7DPwbBITLV1waL5IYV/avIm8m18PIA0ox7C2iGUY47
	+YoXkM7AnwJgP6SwhBWJuUKkuH5rPbweboV9up4ykxjdXncQXE4jqvAvSHnwk7bWdLr6
	YW7VF7l32rpNp/f3TvAmGY89VWxvx077rWiGo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=+gCKD3F7KKPxfZjKbeLk2dCY4fwjTZz7G3zJbvJxpDo=;
	b=hYLDJ1Tqhe8vv9ro9CSptll6DulPRbTEqM77QVWopaIYR2iWJveddRR8rOX5SeEtT4
	b3UIgmdPJ03XyGKPujdqpBJX1jMRGaPxd6cuHGGH6NIbNbPupDFWpTe5CEWieEnC6KF2
	WpvNgM8pPHaI/CL8XvUrtMYa7kOKIMz6PhXAWcq7SvTuz3B8I6hhqs66JkIyLU7ABzqG
	RpDEUKTaWwq8J7p3nAth7RAXa5cCx+fDS+K3atR5rRlnaxCpVK5SFDbImfj7TLzXynAq
	E8e3bL0C1/vP33gbxvFaylFrpyErdS3cocWpEoNawBe8+Y9BA/V/filOSAYEy0/Fy+0e
	lOzg==
X-Gm-Message-State: AD7BkJKuZe4hZiwo5we96Yg20YtcgFfkzdkzPJcPHMJbxw+c64dWPyw+qI0oTKnDSbSFgmTA
X-Received: by 10.112.62.165 with SMTP id z5mr445582lbr.89.1456995184875;
	Thu, 03 Mar 2016 00:53:04 -0800 (PST)
Received: from localhost (c-932171d5.07-21-73746f28.cust.bredbandsbolaget.se.
	[213.113.33.147]) by smtp.gmail.com with ESMTPSA id
	zr6sm6042546lbb.19.2016.03.03.00.53.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 Mar 2016 00:53:03 -0800 (PST)
From: Anders Roxell <anders.roxell@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  3 Mar 2016 09:46:27 +0100
Message-Id: <1456994787-29216-1-git-send-email-anders.roxell@linaro.org>
X-Mailer: git-send-email 2.1.4
Cc: koen.kooi@linaro.org
Subject: [PATCH] meta-oe: cunit: delete *.la files
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
X-List-Received-Date: Thu, 03 Mar 2016 08:53:06 -0000

Remove from blacklist and fix populate_sysroot issue:
ERROR: cunit-2.1-3-r0 do_populate_sysroot: QA Issue: libcunit.la failed
sanity test  (workdir) in path
.../cunit/2.1-3-r0/sysroot-destdir/usr/lib [la]
ERROR: cunit-2.1-3-r0 do_populate_sysroot: QA staging was broken by the
package built above
ERROR: cunit-2.1-3-r0 do_populate_sysroot: Function failed: do_qa_staging

Suggested-by: Koen Kooi <koen.kooi@linaro.org>
Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
---
 meta-oe/recipes-devtools/cunit/cunit_2.1-3.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/cunit/cunit_2.1-3.bb b/meta-oe/recipes-devtools/cunit/cunit_2.1-3.bb
index ab8cf76..ad62e52 100644
--- a/meta-oe/recipes-devtools/cunit/cunit_2.1-3.bb
+++ b/meta-oe/recipes-devtools/cunit/cunit_2.1-3.bb
@@ -18,5 +18,6 @@ EXTRA_OECONF = "--enable-memtrace --enable-automated --enable-basic --enable-con
 FILES_${PN}-dev += "${datadir}/CUnit"
 FILES_${PN}-doc += "${docdir}"
 
-# http://errors.yoctoproject.org/Errors/Details/35136/
-PNBLACKLIST[cunit] ?= "BROKEN: QA Issue: libcunit.la failed sanity test (workdir)"
+do_install_append() {
+    find ${D} -name "*.la" -delete
+}
-- 
2.1.4


