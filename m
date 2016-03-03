Return-Path: <anders.roxell@linaro.org>
Received: from mail-lb0-f177.google.com (mail-lb0-f177.google.com
	[209.85.217.177])
	by mail.openembedded.org (Postfix) with ESMTP id EA1A1731EC
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Mar 2016 11:03:11 +0000 (UTC)
Received: by mail-lb0-f177.google.com with SMTP id bc4so18845716lbc.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Mar 2016 03:03:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=6ibrJcElQnimoNTokNy5C2Z2uCUDNAHnG4Lm357X6xE=;
	b=EU9Rf3Ernl14E4h0C2EXo6eRlAjhcngvTK//oeOKZjFVe9sY/tac3KO4+9rqc14ek2
	/uL18OBOfqbwAXbdg1EFF8suHh+AYPo3Q9rVShmqZEpPKwc5pFCWs/l2BoQmdO4yY/C/
	IGTKUurj6Pbig8D7Sq4i0q3xQnyNy98TEoMtk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=6ibrJcElQnimoNTokNy5C2Z2uCUDNAHnG4Lm357X6xE=;
	b=M8WAyELHuz5QZZjW+jTZQCBJhH/txD4KvOjOZAisZMDIlSSqlC97+4GFTnoRHEgg9L
	RCksRZzy3iy6QxnVoFW2T1bewbgUfyBDdj+K9j4S3V48U6LG+H05XHz74G71uAY38zkQ
	cyCz3Nf2yI0a0VHPbGkB5myE/Xpu8hBEJcMfxSRwXMxzx6iKcyJk31abMjxRPl2kG3Km
	YhFWyyJ0+Trn1z4qJbCPnokGf3KKFnnJfxtlx6gkyBLWEIiavvrjuxlowHHawmhw93lw
	gx9Jx73q8N2tFoW40ehZw7TYPFEqc290pDjfkNSCmetxWlLB5eL9FJ8BeO6Ni0ojDUib
	yOxQ==
X-Gm-Message-State: AD7BkJKUXmqAdP3EcWQV1JWFJ25RrqKWXtq+kmVMyXEhggT1oJPay1J7Wo67B+kS5r52EvHr
X-Received: by 10.112.134.70 with SMTP id pi6mr611253lbb.59.1457002991105;
	Thu, 03 Mar 2016 03:03:11 -0800 (PST)
Received: from localhost (c-932171d5.07-21-73746f28.cust.bredbandsbolaget.se.
	[213.113.33.147]) by smtp.gmail.com with ESMTPSA id
	rh2sm6242239lbb.36.2016.03.03.03.03.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 Mar 2016 03:03:10 -0800 (PST)
From: Anders Roxell <anders.roxell@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  3 Mar 2016 11:56:34 +0100
Message-Id: <1457002594-12327-1-git-send-email-anders.roxell@linaro.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1456994787-29216-1-git-send-email-anders.roxell@linaro.org>
References: <1456994787-29216-1-git-send-email-anders.roxell@linaro.org>
Cc: koen.kooi@linaro.org
Subject: [PATCHv2] cunit: delete *.la files
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
X-List-Received-Date: Thu, 03 Mar 2016 11:03:12 -0000

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
 meta-oe/recipes-devtools/cunit/cunit_2.1-3.bb | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta-oe/recipes-devtools/cunit/cunit_2.1-3.bb b/meta-oe/recipes-devtools/cunit/cunit_2.1-3.bb
index ab8cf76..c9d87e3 100644
--- a/meta-oe/recipes-devtools/cunit/cunit_2.1-3.bb
+++ b/meta-oe/recipes-devtools/cunit/cunit_2.1-3.bb
@@ -11,12 +11,9 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/project/cunit/CUnit/${PV}/CUnit-${PV}.tar.bz2 \
 SRC_URI[md5sum] = "b5f1a9f6093869c070c6e4a9450cc10c"
 SRC_URI[sha256sum] = "f5b29137f845bb08b77ec60584fdb728b4e58f1023e6f249a464efa49a40f214"
 
-inherit autotools-brokensep
+inherit autotools-brokensep remove-libtool
 
 EXTRA_OECONF = "--enable-memtrace --enable-automated --enable-basic --enable-console"
 
 FILES_${PN}-dev += "${datadir}/CUnit"
 FILES_${PN}-doc += "${docdir}"
-
-# http://errors.yoctoproject.org/Errors/Details/35136/
-PNBLACKLIST[cunit] ?= "BROKEN: QA Issue: libcunit.la failed sanity test (workdir)"
-- 
2.1.4


