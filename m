Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5C88B745AC
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Oct 2018 07:42:29 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id e187-v6so806590wmf.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Oct 2018 00:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=nGz7kO+iJPSlWthdNIU0jQAdIXHgMb2zSDoCHOXsw0Y=;
	b=YoGpCNxijUG1x0AkSVHumeySMSBCmCVVWB5dygOiGFSslMdEA8QP1IL/nHIa/Aqwi0
	Vt6GScQ3LRofs+HG/2NKZ8iQEm3nSyCtgWrJvZSQplLRQdz09WChXdmvUiLteYxEZ3ad
	hzNfGNDg3mSAFPqDxHKh/4nvyHqPQxk4KmK9sFqJM4DeoduOipmjZ9Am4nKCbHcs8aOz
	39TF8vfgqsJoHh/v1zQHZF0F+xGItF9hn+aw+Q5vwoY/JigjFdk8QeVaIfLO+wg9OAIB
	90uEoNNFHbnJZotGas632eRFtW3HWCdqybVA92tNdNQLrZRYcZvBUGWwBmdrLHAdNtm8
	9r2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=nGz7kO+iJPSlWthdNIU0jQAdIXHgMb2zSDoCHOXsw0Y=;
	b=fY7hE+lBhaBrCOL4YuE5ZAd3u8LePpm22yTuQZC28hJQTAQf3+Mw2yJwWZDVQKNEw4
	ZTcDs0GULSGh9ZaQ2M7ZIu68Fdr+jedQep/NXX5UQwJdkTx0RTI0ZMMjk7/zn2Jm7BKL
	ZDrSRWeFvCdMtPQ0mo8ldKqKF5mptnytu0XIYNfdTsFjBEXki5fhFkM2ylHQ4EaN/X7o
	XMYTW9byjPwCYmhfonlX2wcY8bqqdEocp70lFwGOQvV3D6TL7au67f8lLRAAitcxc84T
	2QaDyQ4ZXv/SIem2A9WNZOpGgc4Dx+A7kEC1z6h4LJUNJLg5tx9nMXjg7YavUx606QNB
	cmyA==
X-Gm-Message-State: ABuFfoizUFddMKlH4/JG8g/xOEfngnMTUnbtdMZdgRAOXHZH/jdtiOgj
	/fCbzg28+XNuMfH9dFfX3vPBKa3IYqA=
X-Google-Smtp-Source: ACcGV635RAArtnTayBk/BZGstB/rhsonLLneX3b5fxJHQDoml2R9gpS3NdZQ4VY3rOFu6k9+9dpGpA==
X-Received: by 2002:a1c:6543:: with SMTP id z64-v6mr979262wmb.57.1539070949665;
	Tue, 09 Oct 2018 00:42:29 -0700 (PDT)
Received: from localhost.localdomain ([176.12.107.132])
	by smtp.gmail.com with ESMTPSA id
	l125-v6sm19070280wmb.1.2018.10.09.00.42.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 09 Oct 2018 00:42:28 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  9 Oct 2018 07:42:20 +0000
Message-Id: <1539070940-28150-1-git-send-email-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] crda: Fix usrmerge install path
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
X-List-Received-Date: Tue, 09 Oct 2018 07:42:29 -0000

Set UDEV_RULE_DIR so we follow usrmerge paths, fixing:

  ERROR: QA Issue: crda package is not obeying usrmerge distro feature. /lib should be relocated to /usr. [usrmerge]

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta-networking/recipes-connectivity/crda/crda_3.18.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/crda/crda_3.18.bb b/meta-networking/recipes-connectivity/crda/crda_3.18.bb
index 853a52346db1..d5d2ab68c6c3 100644
--- a/meta-networking/recipes-connectivity/crda/crda_3.18.bb
+++ b/meta-networking/recipes-connectivity/crda/crda_3.18.bb
@@ -27,7 +27,8 @@ inherit python-dir pythonnative siteinfo
 DEFAULT_CRYPT ??= "gcrypt"
 
 # Recursive make problem
-EXTRA_OEMAKE = "MAKEFLAGS= DESTDIR=${D} LIBDIR=${libdir}/crda LDLIBREG='-Wl,-rpath,${libdir}/crda -lreg'"
+EXTRA_OEMAKE = "MAKEFLAGS= DESTDIR=${D} LIBDIR=${libdir}/crda LDLIBREG='-Wl,-rpath,${libdir}/crda -lreg' \
+                UDEV_RULE_DIR=${nonarch_libdir}/udev/rules.d/"
 EXTRA_OEMAKE_append = " ${@oe.utils.conditional("DEFAULT_CRYPT", "openssl", "USE_OPENSSL=1", "", d)}"
 TARGET_BITS = "${SITEINFO_BITS}"
 export TARGET_BITS
-- 
2.7.4


