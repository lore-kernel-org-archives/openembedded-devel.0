Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58C79C79FB7
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 06:17:33 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7663.1789021051575880559
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Sep 2026 23:17:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=gP5Y8VoY;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3a1f75277f3so47907861fa.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Sep 2026 23:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789021049; x=1789625849; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TTrB4mPG+jm/KTY881auSRl9JPNMrNHEBWFeLajLm5Y=;
        b=gP5Y8VoYrkbvQZHtTCIF2YJXKq6OdDNR41iQ5SBgeDyimANFCxYX24LKBdZ2eccHiy
         cQkTaqQjI5feZeevVQRYELkEKdBKeIpJ70RmGKSjkffagL3U3gIyEgxhnG/gbiavP/yb
         GD/UWIA8oYO4V/37zTC9BXPosFRYZMb0M9W/eMa/+IQ6Lg213bizpOqWmcxZ6NsxtCCI
         EzDUFr3EVwt1pqvDs267NQE7uXq+iIYIRdSiOVCXltQDmRZKkg54xuShKqiO7RpbrkHd
         DS4bq2pRY0HUYkeJdNjrHw+cs7EskrnQ+ukMdc3u35eeVmukwG5hvJe4H/v0vnGFXyb3
         UXsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789021049; x=1789625849;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TTrB4mPG+jm/KTY881auSRl9JPNMrNHEBWFeLajLm5Y=;
        b=lp/97QUeJckJPHaYbStO7SICEty59/FPQ09Kz85nhWNeqwXQwQ9FjoVQb9kdPb63GK
         0r1jAUSnEHVwpJD7K1Tov2dT8Rdy8rvOud/LYVfI6iDMNOFS2MEz2KUJFl3SfX+121b/
         Ye9X786fM14vrXEDUERDB0y2usRL+dqx6v0TuJk+wTZk4HaIVXVOIn3wBGWspLlE6frD
         Q+q1VdmjSoR2HK2CKtx4CoYn1QQo4U8r2ouNsMSAb46tTWFUKJUOBbQUlZGvssY/ufNU
         +zD2NFDZHiFsATc4zFH45+pY4MrncwGrJdUeTTk+khQdJ7rq1Dtw13SnipgzEXC2uyzb
         TxPQ==
X-Gm-Message-State: AFuF++l8t5d0UJVNjwq+cpf0y6amr2JamdQUZE1YJea5Ye8k+gcgsyQN
	q+XJWvySco9oxG1+F2oac67e/lB/tnKC4b37DXxRPSWo3lfdwmSACN7+dd9rJg==
X-Gm-Gg: AYBFou2tHsdfStt7MH34ioAEgKiNsObeutsxJAKnJDnBeFxeyAQA+BEws9Whj0wWo0X
	6lOkc4q1GJiE9X4JqtgSuzrQqpnnKfqwSsAzOhF1eYo+N92rfDFLPkdbxdKtjbqEFwXex3KP3fi
	TZfgM/UrQtcm+xtyoeM/EwNFgDmoAHGhOU/mjckvaFLJV5jma1vU9gxtZuohaGkQQGdkxpvITDO
	Tzop37FMS0FYg4KMmq85nQEv+uI6oBq4UHCOtlD0iLaGq5tlgopmRChHYenT59hDQClh+5Y3jQk
	+PYZryNDLUizKZCWtkh+TuCjGDu6LyAhbcztY3QLnUWayQUeUwag1X3HtATuHpGlEi5qrlClTo3
	+/TZnDCglNQz7pH6+H81d15W/hvD1fGM0QtBYb6lPq6lCinCei+VIHSIYg31b67Rpi3Xc32jpFA
	fwif4NMoYm/v43Uurm8XaqHYoI1IQyIS5lNonl53yl/sNgzHQNX6p51qa8yQ+opmSNo2WMf8nXH
	py/7DnmQEF468kLN3zEii8YsIHxjZ8n8uLmSwZ7FAqcQN86qzVxqoJ3R6Ppo0lXEhuHGoN2pZHG
X-Received: by 2002:a2e:a983:0:b0:3a2:522:c75 with SMTP id 38308e7fff4ca-3a371aa84a7mr43966971fa.4.1789021049056;
        Wed, 09 Sep 2026 23:17:29 -0700 (PDT)
Received: from localhost.localdomain ([176.88.90.107])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a370585686sm50522011fa.15.2026.09.09.23.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 23:17:28 -0700 (PDT)
From: Alper Ak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alper Ak <alperyasinak1@gmail.com>
Subject: [meta-networking][PATCH] unbound: fix build with OpenSSL 4.0
Date: Thu, 10 Sep 2026 09:17:23 +0300
Message-ID: <20260910061723.199239-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Sep 2026 06:17:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129907

do_compile fails with:

  keyraw.c:158:16: error: implicit declaration of function
  'EVP_PKEY_asn1_find_str'

The GOST code needs the OpenSSL ENGINE API, which 4.0 removed. configure
cannot run its GOST test when cross compiling and answers "maybe", which
enables GOST anyway. Make it check that the API is there first.

Nothing is lost by this and no layer ships a GOST engine, so the lookup
already returned 0 at runtime. gost-engine has not been ported to
providers yet [1].

[1] https://github.com/gost-engine/engine/issues/496

Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
---
 ...assume-GOST-works-when-cross-compili.patch | 31 +++++++++++++++++++
 .../recipes-support/unbound/unbound_1.26.0.bb |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta-networking/recipes-support/unbound/unbound/0001-configure-do-not-assume-GOST-works-when-cross-compili.patch

diff --git a/meta-networking/recipes-support/unbound/unbound/0001-configure-do-not-assume-GOST-works-when-cross-compili.patch b/meta-networking/recipes-support/unbound/unbound/0001-configure-do-not-assume-GOST-works-when-cross-compili.patch
new file mode 100644
index 0000000000..f074f74386
--- /dev/null
+++ b/meta-networking/recipes-support/unbound/unbound/0001-configure-do-not-assume-GOST-works-when-cross-compili.patch
@@ -0,0 +1,31 @@
+From: Alper Ak <alperyasinak1@gmail.com>
+Date: Thu, 10 Sep 2026 00:10:00 +0300
+Subject: [PATCH] configure: do not assume GOST works when cross compiling
+
+The GOST check is a run test, so when cross compiling configure cannot
+execute it and falls back to "maybe", which enables GOST. The GOST code
+needs the OpenSSL ENGINE API, and OpenSSL 4.0 removed it, so the build
+then fails on implicit declarations of EVP_PKEY_asn1_find_str.
+
+We still cannot run the test, but we can check that the API the GOST
+code calls is present at all.
+
+Upstream-Status: Pending
+Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
+---
+ configure.ac | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+--- a/configure.ac
++++ b/configure.ac
+@@ -1295,7 +1295,9 @@
+ [eval "ac_cv_c_gost_works=maybe"])
+ CFLAGS="$BAKCFLAGS"
+ else
+-eval "ac_cv_c_gost_works=maybe"
++AC_CHECK_FUNC([EVP_PKEY_asn1_find_str],
++	[eval "ac_cv_c_gost_works=maybe"],
++	[eval "ac_cv_c_gost_works=no"])
+ fi
+ AC_MSG_RESULT($ac_cv_c_gost_works)
+ ])dnl
diff --git a/meta-networking/recipes-support/unbound/unbound_1.26.0.bb b/meta-networking/recipes-support/unbound/unbound_1.26.0.bb
index 9134bb64e5..711c93ef6f 100644
--- a/meta-networking/recipes-support/unbound/unbound_1.26.0.bb
+++ b/meta-networking/recipes-support/unbound/unbound_1.26.0.bb
@@ -10,6 +10,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5308494bc0590c0cb036afd781d78f06"
 
 SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=https;branch=master;tag=release-${PV} \
+           file://0001-configure-do-not-assume-GOST-works-when-cross-compili.patch \
            file://run-ptest \
            "
 
-- 
2.43.0


