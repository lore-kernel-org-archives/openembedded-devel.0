Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id E5EA360112
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jan 2016 15:14:30 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id n5so68835870wmn.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jan 2016 07:14:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=4DNV3C/5KDk7vyst/BiSfE39ZtGyp20RHmVqbkOk4Js=;
	b=HnXCM9eEtvjCpRuJ+wnF2C+pmlbpOdQ5uOLGVI+tu3XHh7/MlNlNFyMZ/ms+/Cz2sm
	znAIar19SN1E/beW7TrqGee/iRKW4jaKfuymEczYyiuaBpmznvksTIrNEzXmHNOJ3x55
	lFX5c+Fnbaj70TZyrX5ficmTWq6RVwv0ggXzaFY2BR7FX/ilQYQS34uf0LZRY5JMjVRt
	oWMzm0KAjg08oPsJTllUqnsb1m6biS2yuj+ped4kr5YtrGwjCzQB+jim3waMiMfJ0Gup
	d6w4YIyBE1GWSLIOv/t9DEebhkhm2dcMSRYlRLJh0w5oiEhsicg5rMSiM3K7z3Eqn2ud
	1QuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=4DNV3C/5KDk7vyst/BiSfE39ZtGyp20RHmVqbkOk4Js=;
	b=fVlp1lTHYtl0nQ41hmKdXg61B+wmgv/wH0UUVqp9qeerkqPWkVlwQ9I1whX6IC0pZx
	9UW0pFTI1ssSIk/RDu+gaV8kCLGjJGUQD26x+ojQ3Th9NEUp33fQf/3NYIWFzGcYvxv6
	789qB5y2fQYLPjRtoA/UIPEqFW9ZFeR1FfSD79PqdBnSBRZmjvsYX5ajIJMhnWnkd8iq
	sGg/bI1gwRyQx3FSbBXHGUIXdMHLDV16UD0q2uZ1FklnIM4SA5PhNB1YQsmfA32w2DwE
	YBz2arw3GsXyVowWXK+YJ6pQfqJx3H+y/g6fetG9nFtxW9RJkRk8wk/XDRBOPBnz+Eyt
	TIZw==
X-Gm-Message-State: ALoCoQmMXu2244NIxmio2TcFZR0UuGmiR0AMK4nbltyV72SIBSr+BT/G8mKmNfOmiU4tm8uSl69IOHNCsy5pvOUGMKdnceJy4w==
X-Received: by 10.194.103.164 with SMTP id fx4mr25050068wjb.56.1453130071324; 
	Mon, 18 Jan 2016 07:14:31 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	c15sm16184392wmd.19.2016.01.18.07.14.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Jan 2016 07:14:30 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Jan 2016 16:15:42 +0100
Message-Id: <1453130142-15803-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH][meta-oe] phoronix-test-suite: exclude bash, php, python dependency with SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS
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
X-List-Received-Date: Mon, 18 Jan 2016 15:14:34 -0000

* otherwise the recipe cannot inherit allarch. as detected with
  openembedded-core/scripts/sstate-diff-machines.sh:

 === Comparing signatures for task do_package_write_ipk.sigdata between qemux86copy and qemuarm ===
ERROR: phoronix-test-suite different signature for task do_package_write_ipk.sigdata between qemux86copy and qemuarm
runtaskdeps changed from ['bashbash_4.3.30.bb.do_packagedata', 'opkg-utilsopkg-utils_git.bb.do_populate_sysroot:virtual:native', 'phoronix-test-suitephoronix-test-suite_6.0.1.bb.do_package', 'phoronix-test-suitephoronix-test-suite_6.0.1.bb.do_packagedata', 'phpphp_5.6.16.bb.do_packagedata', 'pseudopseudo_1.7.4.bb.do_populate_sysroot:virtual:native', 'pythonpython_2.7.9.bb.do_packagedata'] to ['bashbash_4.3.30.bb.do_packagedata', 'opkg-utilsopkg-utils_git.bb.do_populate_sysroot:virtual:native', 'phoronix-test-suitephoronix-test-suite_6.0.1.bb.do_package', 'phoronix-test-suitephoronix-test-suite_6.0.1.bb.do_packagedata', 'phpphp_5.6.16.bb.do_packagedata', 'pseudopseudo_1.7.4.bb.do_populate_sysroot:virtual:native', 'pythonpython_2.7.9.bb.do_packagedata']
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-extended/bash/bash_4.3.30.bb.do_packagedata with hash 6750d401e680e6e5dac8e8585c43b386
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-extended/bash/bash_4.3.30.bb.do_packagedata with hash bc992ff361286bc2f048935132a20348
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-devtools/php/php_5.6.16.bb.do_packagedata with hash 17a21823eea3e0d1cce1d516f77b23ad
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-devtools/php/php_5.6.16.bb.do_packagedata with hash 6058efb32e6f622aa866f982c3688f08
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-devtools/python/python_2.7.9.bb.do_packagedata with hash 4e3278467af71cb9d0219f674415a2fa
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-devtools/python/python_2.7.9.bb.do_packagedata with hash 4186010efd8bd3464948437ae114ec2a
Hash for dependent task phpphp_5.6.16.bb.do_packagedata changed from 17a21823eea3e0d1cce1d516f77b23ad to 6058efb32e6f622aa866f982c3688f08
Hash for dependent task bashbash_4.3.30.bb.do_packagedata changed from 6750d401e680e6e5dac8e8585c43b386 to bc992ff361286bc2f048935132a20348
Hash for dependent task pythonpython_2.7.9.bb.do_packagedata changed from 4e3278467af71cb9d0219f674415a2fa to 4186010efd8bd3464948437ae114ec2a

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/conf/layer.conf | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index aee6234..d37eba0 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -43,6 +43,9 @@ SIGGEN_EXCLUDERECIPES_ABISAFE += " \
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   usb-modeswitch-data->usb-modeswitch \
   lmsensors->lmsensors-config \
+  phoronix-test-suite->bash \
+  phoronix-test-suite->python \
+  phoronix-test-suite->php \
 "
 
 # ttf.inc inherits fontcache which adds fontconfig-utils to RDEPENDS
-- 
2.7.0


