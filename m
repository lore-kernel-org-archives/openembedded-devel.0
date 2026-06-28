Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2131C44509
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 08:11:44 +0000 (UTC)
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14712.1782634295085448656
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 01:11:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=K779ej18;
 spf=pass (domain: gmail.com, ip: 74.125.82.181, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-30ec1ddd510so322342eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 01:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634294; x=1783239094; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xyiwop/pfUdWFewiwybMRR6KyzhL9CSfBUcKQXXQ4zU=;
        b=K779ej183ZCC0BAYvCjNHbf4PfHnpZ4Sj0528FXTX+k2O0CD5MruYijJwqZ171GtwJ
         FvOE9fqr4EVPus5MpF50+kx1gqiPK2vfzu2QjMr7I1TUwJlLxZL05kQLS4KALOggBuUu
         WLcUrptyAvG9SqubU8mh3e3sUXOe3L8jOnAU26Ro2YoedOna+Fs+kd9t6xjBZlCScWRS
         rHc3iBq9rzUQzb9gc0WKSW05OkKpLj+DzllSL7166V217Oqkoq9trcO/kkKuXzrmbMKa
         QwrjP5p/bPkFTtJS1pAmDqs57yDB83dpllHQ012e4u8eYdXjMUpnpdVKL9LOYZrgOjQO
         HRWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634294; x=1783239094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xyiwop/pfUdWFewiwybMRR6KyzhL9CSfBUcKQXXQ4zU=;
        b=o2a36+hvNRDKHWYRavtjclxsSDpErI4NnCfUz/0pmfEJPYHPmlft9P3Goe3NgQ4lHC
         QmcSiuRj5xGt0tj3Yz1zOdSK/ERNcy10EmACaOsk8THFKsEMnrqaZAweXMKAdyKGC1Hb
         2La5V2y/HV3KAaZ1RdRL3ki1JEhtvlBOrIOC0a+S2BXr2MZ5AcLEBEH26iYJkvXjnzGy
         IQjR8H2BLQkqq3cIXr+0+eMQRX1zE8oCnjpw3tXkPMG66vTN6ydWWHxn4nCaMc2Em8Je
         T8qcdUn7d/H+b3+7x6Y7ku4EnGXehyVRudlHwzD3iuk4SymnvZjOughIEL9ml6Dm4MO5
         9Rag==
X-Gm-Message-State: AOJu0YxuDf2+/rGMlbNekhFhzBoaF9qTyrjNs1eJtgJ7VZg/Af1dW06T
	P97+qzxoKVgXCedOiT9H9uwClNvw6Ps+IEkWKgL0RZjIlIukgffJEHAj3tj61OKMyeoJJw==
X-Gm-Gg: AfdE7ckMwi4isb1NFYE2MyUa3a3+D25uA5RjKV0ArYfkBPrBg9hfSEaDkBD7Xwz1Q+v
	Wqj6qjoOAoQwgP2tSOU0M5BbUfvVjoPzzlk4cSlMztvgKiCRzrk9rJvX1xCN67epcX8dN0yXGHX
	jcgz9Ulo0JK2DWRy4fDN0Q5qfno9dkexLNefeLDmzog28K4kq/VeQ/M7G3jozD4t0PuyslYjRZU
	/004BP0Lpo9WUpb0UI532RcIVZRY7GFIEC+jvJE5ZMNYXnV5wnMlGCWhqjruMQHCjYgRLLymjyA
	h9lqEkVWnDrk+JkWa0GKoEgZVeIj05cUqAWI1A1Ygcfg4Uf+CkaxexziJQ2L63c6XhAbpvOT2mN
	M7SaUd583Y0P9pAXkugyGDc2OANOWGXsfD6sTCNh1cQEIeJgIKiHnaYyRT2ssC1Z1t1E0bTPoTG
	IqU2/XVqg4Ci2wBGWR2Dnx/ThHaELONqnkYrdoaaYcBAE5pFyqeLTls3QHYVuuV/VBuM8zDo4Hq
	55Vi81oYvQtHFVAaHC+piRCv3eZr+V0ZGknZQdBwXLAl4E+ZbPK4GW1QkTrgmufAdyfbNemj8zY
	ZxIbycGWHBfFdDTRzU6cSUVvqw6vMQ==
X-Received: by 2002:a05:7300:7b89:b0:30b:d748:e7f9 with SMTP id 5a478bee46e88-30c84bb521fmr12618640eec.10.1782634294329;
        Sun, 28 Jun 2026 01:11:34 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ea81b39easm6306040eec.31.2026.06.28.01.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:11:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 010/128] openvpn: upgrade 2.7.0 -> 2.7.4
Date: Sun, 28 Jun 2026 01:09:21 -0700
Message-ID: <20260628081122.178348-10-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
References: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 08:11:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127820

drop upstreamed cross-compile test patch

This release already guards the auth-pam unit test TESTS assignment with
"if !CROSS_COMPILING" in tests/unit_tests/plugins/auth-pam/Makefile.am

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...-test-execution-when-cross-compiling.patch | 34 -------------------
 .../{openvpn_2.7.0.bb => openvpn_2.7.4.bb}    |  3 +-
 2 files changed, 1 insertion(+), 36 deletions(-)
 delete mode 100644 meta-networking/recipes-support/openvpn/openvpn/0001-tests-skip-test-execution-when-cross-compiling.patch
 rename meta-networking/recipes-support/openvpn/{openvpn_2.7.0.bb => openvpn_2.7.4.bb} (96%)

diff --git a/meta-networking/recipes-support/openvpn/openvpn/0001-tests-skip-test-execution-when-cross-compiling.patch b/meta-networking/recipes-support/openvpn/openvpn/0001-tests-skip-test-execution-when-cross-compiling.patch
deleted file mode 100644
index f8f2d2907f..0000000000
--- a/meta-networking/recipes-support/openvpn/openvpn/0001-tests-skip-test-execution-when-cross-compiling.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 93f7f6ca0c916427d28610d3e263fa556587532d Mon Sep 17 00:00:00 2001
-From: Haixiao Yan <haixiao.yan.cn@windriver.com>
-Date: Thu, 26 Mar 2026 13:43:50 +0800
-Subject: [PATCH] tests: skip test execution when cross-compiling
-
-The auth-pam unit test Makefile.am unconditionally assigns the TESTS variable,
-causing test execution to fail during cross-compilation because the target
-binaries are not executable on the build host.
-
-Upstream-Status: Pending
-
-Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
----
- tests/unit_tests/plugins/auth-pam/Makefile.am | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/tests/unit_tests/plugins/auth-pam/Makefile.am b/tests/unit_tests/plugins/auth-pam/Makefile.am
-index ba32013ac920..7da299ccde92 100644
---- a/tests/unit_tests/plugins/auth-pam/Makefile.am
-+++ b/tests/unit_tests/plugins/auth-pam/Makefile.am
-@@ -4,8 +4,10 @@ AM_TESTSUITE_SUMMARY_HEADER = ' for $(PACKAGE_STRING) auth_pam Plugin Unit-Tests
- 
- if ENABLE_PLUGIN_AUTH_PAM
- check_PROGRAMS = auth_pam_testdriver
-+if !CROSS_COMPILING
- TESTS = $(check_PROGRAMS)
- endif
-+endif
- 
- auth_pam_testdriver_SOURCES = test_search_and_replace.c  $(top_srcdir)/src/plugins/auth-pam/utils.h $(top_srcdir)/src/plugins/auth-pam/utils.c
- auth_pam_testdriver_CFLAGS  = @TEST_CFLAGS@ -I$(top_srcdir)/src/plugins/auth-pam
--- 
-2.43.0
-
diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.7.0.bb b/meta-networking/recipes-support/openvpn/openvpn_2.7.4.bb
similarity index 96%
rename from meta-networking/recipes-support/openvpn/openvpn_2.7.0.bb
rename to meta-networking/recipes-support/openvpn/openvpn_2.7.4.bb
index 6ddebde4d1..6349b62638 100644
--- a/meta-networking/recipes-support/openvpn/openvpn_2.7.0.bb
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.7.4.bb
@@ -9,14 +9,13 @@ inherit autotools systemd update-rc.d pkgconfig ptest
 
 SRC_URI = "http://swupdate.openvpn.org/community/releases/${BP}.tar.gz \
            file://0001-configure.ac-eliminate-build-path-from-openvpn-versi.patch \
-           file://0001-tests-skip-test-execution-when-cross-compiling.patch \
            file://openvpn \
            file://run-ptest \
           "
 
 UPSTREAM_CHECK_URI = "https://openvpn.net/community-downloads"
 
-SRC_URI[sha256sum] = "2f0e10eb272be61e8fb25fe1cfa20875ff30ac857ef1418000c02290bd6dfa45"
+SRC_URI[sha256sum] = "18db05f3d5eee3663db1914590044e5f96ff5cd47b6e7846c6a350806c23dbce"
 
 CVE_STATUS[CVE-2020-27569] = "not-applicable-config: Applies only Aviatrix OpenVPN client, not openvpn"
 

