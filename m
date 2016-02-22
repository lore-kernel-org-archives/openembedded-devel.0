Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 2BC39771A8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 13:09:14 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id a4so161841471wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 05:09:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=g3YWBp7Wq3KJD/ACylzScQn6kyW1Ic5GA5LYyRY3kiM=;
	b=Jhqw9TSMaPSW+EZ2pRQEUZa8tAU8WrL8Qhi7ZpEMOHU8JrZdlgiwLZ8T4hqYegIIsh
	GTWGr+RIrlxwpEP06LeIjkwPWD4i2lNiFAwzxFnh+d4HetYtCvozQa3Ub0XUOA8QKOd7
	4Z7W2XCMK+Y8TRXvFt1si/RtO3W6+hDpslh65OuSY1W+rzuKAKLcMOP02ANiscQ5HPAt
	kj0hNzAE5axChmpBH7zrsl7X/8znOJig8Vcwxd7Vv7iEtlN5V2BwKV5cJrcYWa5vB4aw
	k76X0lYMhcRgsM1y/gX7BH89//ut1sxjF7SpRxSUN5gt0Hh927AO6CHYj40rhpi1hSsp
	b9uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=g3YWBp7Wq3KJD/ACylzScQn6kyW1Ic5GA5LYyRY3kiM=;
	b=XYSNebNXFxlGmpI2ww49vvcSZ07u9esqGZC1/ZglPxZ7YqVKG6fSUA4czlXz8kL/cv
	91sFqSMECLjnq9gT3FO/N63kLz2vWc2VQEiWFn82z1esZEEBinzAiHGrdPjbn5FmSPML
	RwlIl5obSpnfaXv4FTNKR0QFR3NNlZAOyPvajBvPuB893ZC0w7al2oLPlXQow4VQdKAc
	0PYy9isCYOYsjEzLsAGLQoU/oMIuZMvrc/yfKSyv84kKD9zCiuKDK97NWpHSAn9+yCUN
	qJK5tWOmXBaS7JTq9t3H/yGGCZM9QbPAYwRjcTRIEtqAatAjzmm2XYSOEUYDzHvn08lJ
	qaqg==
X-Gm-Message-State: AG10YOSIFlkAD/8yREZIAmzUdxpizA8EOlIZzxYVPBOqA4w2nB4TIrb5y98mcF8uLL9/Lw==
X-Received: by 10.194.57.244 with SMTP id l20mr9111804wjq.45.1456146555605;
	Mon, 22 Feb 2016 05:09:15 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	i10sm21053693wmf.14.2016.02.22.05.09.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Feb 2016 05:09:14 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Feb 2016 14:09:54 +0100
Message-Id: <1456146596-6976-8-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1456146596-6976-1-git-send-email-Martin.Jansa@gmail.com>
References: <1456146596-6976-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-oe 08/10] zeromq, cppzmq, python-pyzmq: Blacklist, zeromq is broken
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
X-List-Received-Date: Mon, 22 Feb 2016 13:09:15 -0000

* http://errors.yoctoproject.org/Errors/Details/35121/

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb          | 2 ++
 meta-oe/recipes-connectivity/zeromq/zeromq_4.1.3.bb        | 3 +++
 meta-python/recipes-devtools/python/python-pyzmq_14.7.0.bb | 2 ++
 3 files changed, 7 insertions(+)

diff --git a/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb b/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
index 1a59716..3c1eb26 100644
--- a/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
+++ b/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
@@ -17,3 +17,5 @@ do_install () {
 PACKAGES = "${PN}-dev"
 
 RDEPENDS_${PN}-dev = "zeromq-dev"
+
+PNBLACKLIST[cppzmq] ?= "Depends on broken zeromq"
diff --git a/meta-oe/recipes-connectivity/zeromq/zeromq_4.1.3.bb b/meta-oe/recipes-connectivity/zeromq/zeromq_4.1.3.bb
index 5d0e2d5..bd6c1ef 100644
--- a/meta-oe/recipes-connectivity/zeromq/zeromq_4.1.3.bb
+++ b/meta-oe/recipes-connectivity/zeromq/zeromq_4.1.3.bb
@@ -28,3 +28,6 @@ do_install_ptest () {
         install -d ${D}${PTEST_PATH}/tests
         install -m 0755 ${B}/.libs/test_* ${D}${PTEST_PATH}/tests
 }
+
+# http://errors.yoctoproject.org/Errors/Details/35121/
+PNBLACKLIST[zeromq] ?= "BROKEN: zeromq-4.1.3/src/curve_client.cpp:61:18: error: ignoring return value of 'int sodium_init()', declared with attribute warn_unused_result [-Werror=unused-result]"
diff --git a/meta-python/recipes-devtools/python/python-pyzmq_14.7.0.bb b/meta-python/recipes-devtools/python/python-pyzmq_14.7.0.bb
index b5baf82..8aeb1b6 100644
--- a/meta-python/recipes-devtools/python/python-pyzmq_14.7.0.bb
+++ b/meta-python/recipes-devtools/python/python-pyzmq_14.7.0.bb
@@ -22,3 +22,5 @@ do_compile_prepend() {
     echo libzmq_extension = False >> ${S}/setup.cfg
     echo no_libzmq_extension = True >> ${S}/setup.cfg
 }
+
+PNBLACKLIST[python-pyzmq] ?= "Depends on broken zeromq"
-- 
2.7.1


