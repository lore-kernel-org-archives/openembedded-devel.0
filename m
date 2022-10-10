Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49213C433F5
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 04:59:02 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web12.2934.1665377934161095400
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Oct 2022 21:58:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=AhgkaBkj;
 spf=pass (domain: mvista.com, ip: 209.85.216.41,
 mailfrom: hprajapati@mvista.com)
Received: by mail-pj1-f41.google.com with SMTP id
 o9-20020a17090a0a0900b0020ad4e758b3so9372400pjo.4
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Oct 2022 21:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jXVpvbemPQ31rH6kV34nFG16HGgUPJg8UrhBmGFLuIs=;
        b=AhgkaBkj/KNFzDGqpE6MXr5mw+OPZ+ipntOkXPTwiM7kGOB9+01xVMkaOMBjgNW/EB
         S3rdeNbBSMbbnnRRgUJ9Dr2zguuJXWCygDo76ka6P1kghsvZHWPmaH8SDT5viH/rOD8G
         S4aC9HcZgZe68gmkLGmbVBLLsy7ROJsqYtu0Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jXVpvbemPQ31rH6kV34nFG16HGgUPJg8UrhBmGFLuIs=;
        b=0kam/05Y54A7UuoNL/9SIfRbrKIwjb3/qGbBw0gZ2G4FtVVgWkEH6xhco+/URg74fe
         jyicYLaiYP/1pIDHhyIDj9aZBGtBosMd8tl0Bxzywtn4Z2OWDB4GVc/TOPbSavth1cHB
         G0/NI6ZNCE3NDvmDBxc0szfnG+WcQb/5qO9PRefRIFYSSIunwbYzGDP723ERM0K9JP8p
         LG4PfNzJAqOr+2SbAPaqC0fqU00VShBhBn7Laj7puzAWH2/jK8r5L72VvFp8tm9CDiOH
         PbZFsEiBWvVuteV+kA+6Qqw6vxFMlQUAYFtKmasypPp6QWZDZFEOi+3F0aQerFtdIzSi
         maug==
X-Gm-Message-State: ACrzQf2Ai6Y5h4Rn1lrbC0AJutQhkwlJPDki/dOhLmtGj8N1Mbjsefoy
	/G6dNj4KOE9C+4xUREeKHSthQY/WNrn6iA==
X-Google-Smtp-Source: 
 AMsMyM4UjTgGseUsGu5lHcPB1p08jGLB/LB0jsW7uddpezArqD6y36odWN2zErviSyEgdqvv7T7vaA==
X-Received: by 2002:a17:90b:4f4a:b0:20c:64e2:2bee with SMTP id
 pj10-20020a17090b4f4a00b0020c64e22beemr13110607pjb.32.1665377933169;
        Sun, 09 Oct 2022 21:58:53 -0700 (PDT)
Received: from MVIN00024 ([43.249.234.235])
        by smtp.gmail.com with ESMTPSA id
 u13-20020a170902e80d00b0017f7e0f4a4esm5587705plg.35.2022.10.09.21.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Oct 2022 21:58:52 -0700 (PDT)
Received: by MVIN00024 (sSMTP sendmail emulation);
 Mon, 10 Oct 2022 10:28:46 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-networking][kirkstone][PATCH] dhcp: Fix CVE-2022-2928 &
 CVE-2022-2929
Date: Mon, 10 Oct 2022 10:28:26 +0530
Message-Id: <20221010045826.87924-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Oct 2022 04:59:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99114

Source: https://downloads.isc.org/isc/dhcp
MR: 122791, 122806
Type: Security Fix
Disposition: Backport from https://downloads.isc.org/isc/dhcp/4.4.3-P1/patches/
ChangeID: e90f768e445b7d41b86f04c634cc125546998f0f
Description:

Fixed CVEs:
	1. CVE-2022-2928
	2. CVE-2022-2929

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../dhcp/dhcp-relay_4.4.3.bb                  |   2 +
 .../dhcp/files/CVE-2022-2928.patch            | 120 ++++++++++++++++++
 .../dhcp/files/CVE-2022-2929.patch            |  40 ++++++
 3 files changed, 162 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/dhcp/files/CVE-2022-2928.patch
 create mode 100644 meta-networking/recipes-connectivity/dhcp/files/CVE-2022-2929.patch

diff --git a/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.3.bb b/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.3.bb
index 92c648708e..499b035040 100644
--- a/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.3.bb
+++ b/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.3.bb
@@ -17,6 +17,8 @@ SRC_URI = "https://downloads.isc.org/isc/dhcp/${PV}/dhcp-${PV}.tar.gz \
            file://0001-Makefile.am-only-build-dhcrelay.patch \
            file://0002-bind-Makefile.in-disable-backtrace.patch \
            file://0003-bind-Makefile.in-regenerate-configure.patch \
+           file://CVE-2022-2928.patch \
+           file://CVE-2022-2929.patch \
            "
 
 SRC_URI[sha256sum] = "0e3ec6b4c2a05ec0148874bcd999a66d05518378d77421f607fb0bc9d0135818"
diff --git a/meta-networking/recipes-connectivity/dhcp/files/CVE-2022-2928.patch b/meta-networking/recipes-connectivity/dhcp/files/CVE-2022-2928.patch
new file mode 100644
index 0000000000..247e8dec68
--- /dev/null
+++ b/meta-networking/recipes-connectivity/dhcp/files/CVE-2022-2928.patch
@@ -0,0 +1,120 @@
+From 2e08d138ff852820a6e87a09088d2dc2cdd15e56 Mon Sep 17 00:00:00 2001
+From: Hitendra Prajapati <hprajapati@mvista.com>
+Date: Mon, 10 Oct 2022 09:57:15 +0530
+Subject: [PATCH 1/2] CVE-2022-2928
+
+Upstream-Status: Backport [https://downloads.isc.org/isc/dhcp/4.4.3-P1/patches/]
+CVE: CVE-2022-2928
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ common/options.c               |  7 +++++
+ common/tests/option_unittest.c | 54 ++++++++++++++++++++++++++++++++++
+ 2 files changed, 61 insertions(+)
+
+diff --git a/common/options.c b/common/options.c
+index 92c8fee..f0959cb 100644
+--- a/common/options.c
++++ b/common/options.c
+@@ -4452,6 +4452,8 @@ add_option(struct option_state *options,
+ 	if (!option_cache_allocate(&oc, MDL)) {
+ 		log_error("No memory for option cache adding %s (option %d).",
+ 			  option->name, option_num);
++		/* Get rid of reference created during hash lookup. */
++		option_dereference(&option, MDL);
+ 		return 0;
+ 	}
+ 
+@@ -4463,6 +4465,8 @@ add_option(struct option_state *options,
+ 			     MDL)) {
+ 		log_error("No memory for constant data adding %s (option %d).",
+ 			  option->name, option_num);
++		/* Get rid of reference created during hash lookup. */
++		option_dereference(&option, MDL);
+ 		option_cache_dereference(&oc, MDL);
+ 		return 0;
+ 	}
+@@ -4471,6 +4475,9 @@ add_option(struct option_state *options,
+ 	save_option(&dhcp_universe, options, oc);
+ 	option_cache_dereference(&oc, MDL);
+ 
++	/* Get rid of reference created during hash lookup. */
++	option_dereference(&option, MDL);
++
+ 	return 1;
+ }
+ 
+diff --git a/common/tests/option_unittest.c b/common/tests/option_unittest.c
+index 600ebe6..963b566 100644
+--- a/common/tests/option_unittest.c
++++ b/common/tests/option_unittest.c
+@@ -213,6 +213,59 @@ ATF_TC_BODY(parse_X, tc)
+     }
+ }
+ 
++ATF_TC(add_option_ref_cnt);
++
++ATF_TC_HEAD(add_option_ref_cnt, tc)
++{
++    atf_tc_set_md_var(tc, "descr",
++        "Verify add_option() does not leak option ref counts.");
++}
++
++ATF_TC_BODY(add_option_ref_cnt, tc)
++{
++    struct option_state *options = NULL;
++    struct option *option = NULL;
++    unsigned int cid_code = DHO_DHCP_CLIENT_IDENTIFIER;
++    char *cid_str = "1234";
++    int refcnt_before = 0;
++
++    // Look up the option we're going to add.
++    initialize_common_option_spaces();
++    if (!option_code_hash_lookup(&option, dhcp_universe.code_hash,
++                                 &cid_code, 0, MDL)) {
++        atf_tc_fail("cannot find option definition?");
++    }
++
++    // Get the option's reference count before we call add_options.
++    refcnt_before = option->refcnt;
++
++    // Allocate a option_state to which to add an option.
++    if (!option_state_allocate(&options, MDL)) {
++	    atf_tc_fail("cannot allocat options state");
++    }
++
++    // Call add_option() to add the option to the option state.
++    if (!add_option(options, cid_code, cid_str, strlen(cid_str))) {
++	    atf_tc_fail("add_option returned 0");
++    }
++
++    // Verify that calling add_option() only adds 1 to the option ref count.
++    if (option->refcnt != (refcnt_before + 1)) {
++        atf_tc_fail("after add_option(), count is wrong, before %d, after: %d",
++                    refcnt_before, option->refcnt);
++    }
++
++    // Derefrence the option_state, this should reduce the ref count to
++    // it's starting value.
++    option_state_dereference(&options, MDL);
++
++    // Verify that dereferencing option_state restores option ref count.
++    if (option->refcnt != refcnt_before) {
++        atf_tc_fail("after state deref, count is wrong, before %d, after: %d",
++                    refcnt_before, option->refcnt);
++    }
++}
++
+ /* This macro defines main() method that will call specified
+    test cases. tp and simple_test_case names can be whatever you want
+    as long as it is a valid variable identifier. */
+@@ -221,6 +274,7 @@ ATF_TP_ADD_TCS(tp)
+     ATF_TP_ADD_TC(tp, option_refcnt);
+     ATF_TP_ADD_TC(tp, pretty_print_option);
+     ATF_TP_ADD_TC(tp, parse_X);
++    ATF_TP_ADD_TC(tp, add_option_ref_cnt);
+ 
+     return (atf_no_error());
+ }
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-connectivity/dhcp/files/CVE-2022-2929.patch b/meta-networking/recipes-connectivity/dhcp/files/CVE-2022-2929.patch
new file mode 100644
index 0000000000..faaac4868c
--- /dev/null
+++ b/meta-networking/recipes-connectivity/dhcp/files/CVE-2022-2929.patch
@@ -0,0 +1,40 @@
+From 5436cafe1d7df409a44ff5f610248db57f0677ee Mon Sep 17 00:00:00 2001
+From: Hitendra Prajapati <hprajapati@mvista.com>
+Date: Mon, 10 Oct 2022 09:58:04 +0530
+Subject: [PATCH 2/2] CVE-2022-2929
+
+Upstream-Status: Backport [https://downloads.isc.org/isc/dhcp/4.4.3-P1/patches/]
+CVE: CVE-2022-2929
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ common/options.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/common/options.c b/common/options.c
+index f0959cb..25450e1 100644
+--- a/common/options.c
++++ b/common/options.c
+@@ -454,16 +454,16 @@ int fqdn_universe_decode (struct option_state *options,
+ 		while (s < &bp -> data[0] + length + 2) {
+ 			len = *s;
+ 			if (len > 63) {
+-				log_info ("fancy bits in fqdn option");
+-				return 0;
++				log_info ("label length exceeds 63 in fqdn option");
++				goto bad;
+ 			}
+ 			if (len == 0) {
+ 				terminated = 1;
+ 				break;
+ 			}
+ 			if (s + len > &bp -> data [0] + length + 3) {
+-				log_info ("fqdn tag longer than buffer");
+-				return 0;
++				log_info ("fqdn label longer than buffer");
++				goto bad;
+ 			}
+ 
+ 			if (first_len == 0) {
+-- 
+2.25.1
+
-- 
2.25.1


