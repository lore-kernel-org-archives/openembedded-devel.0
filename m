Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95AD9CAC5A7
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 12:04:09 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web11.9944.1758801840563834328
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Sep 2025 05:04:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=j5VEEs0A;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b2bddecc51aso137740266b.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 Sep 2025 05:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758801839; x=1759406639; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U4QxW/RA/+3MwgkQahMLEa2v1jzaOg1DeQAxX4oRsu4=;
        b=j5VEEs0ADNuevGDGUbwp3xfm+xLgDC/SD4+0/yfzundgUub51UNHk6rp7XZb3SkrGD
         6yY+dVlPpxBLV3RkfsVNRu9I/juwzgQtlWxwW5KYlX3zwuqAKyXN65Sli2P6e11Q8h3v
         UkZ8/mxlX9XC202jL1MH7D/fD+RBPZe22gGoFRq0lQpf35PYwoJkMYoP7MGLzk99yQKj
         ubL7OEXtb7Y8Ezt/AyPHNQqr7lXW/LkhO1rpSCd1g+PMWot0Ax6ylnadpbD3RGN9M7Ey
         ZyCeiCfd7xfL7iKrfhJEegulym9MK5qoyw2Ghwma7t6MKksyQFGU8grGoElwqpLEIMQh
         ovJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758801839; x=1759406639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U4QxW/RA/+3MwgkQahMLEa2v1jzaOg1DeQAxX4oRsu4=;
        b=fRrjqSUQ8iKcS162L5JwDFcqtqWH45AM4U59R7KBbcbV4MqISaw3ystdfZ8Z46c2+Y
         fA6rWJ3Wiu3oFTeRNYlPxVJvYDyOg4xjjubqVd4Vvn+BuN/O5WFDAipI7oDV1wv/YQMM
         IIvSs/+uRGvxtibU4wZGGDB0ZgWzYpJJXA4VeIV0OdlWizyAm99ivYR68krTXYMC8LJz
         PqUv6plLY0R6n4hPsQc1z2Arcj3WGKmKNj+bfh0OHJ6yOW6mKvMtN8lK3dXNpyaj/7zR
         t2ErjVWeIdxCqCho6fX0NL7suv1OOMl3laF6QqIlwGKJlQkQaQqUW+F23adFUbrPxooK
         ZKRw==
X-Gm-Message-State: AOJu0YyBTS6z+UjdnSGQB2boRoyDWgZ7eOvpTZAn9+/Zk7R1zTlqGCUi
	VzKUb2iln5G5qG9GkBDNuqoDA31wEMW/Wl8kNlw3Z7w/DIrS77vKX3LPf7s+Dz5C
X-Gm-Gg: ASbGncukcncvcZs+/v/S1UIPbSnE86Zyd3uQgzyz8wbvZxk/ZO3MVQlGFwVzGN3f6YN
	DUggvZ2IWqlFFn1vbzxEb7nC3ShQFcrIpP+NgU1XU5yl7aS4O9fhAOgxAviMDw83rmIQGu0mIYa
	ZVvTmTb18puS2LolZyGaDN2gRrlm1kqIpDCq+9Y8fTs7xiu/ss72xpbz7wUrr5e0rEm8LgvfqwD
	AfghPS7krTmn4bx3OPmCtSl/FF8mSWNoZeh1vSJWBsS07tLnuAUuf2oe8xblQmDC1ZXzhByM1Rb
	isTAKLRino8HRjOk67SvO8/A1+VGQ4TjsJ1zbDlZJwUHtAJHnEKQ2murqilgXaJOU4p4djP7S1P
	Dr+kgXRietKSF7v+DdTkD
X-Google-Smtp-Source: AGHT+IHOdA+27nohthOEUBw5WmCAdrDGRmRUQDqmGgzG9q9u2UqF3O9N9cCh1wWUgoeDd8aK2+FjDw==
X-Received: by 2002:a17:907:2d24:b0:b04:2452:e267 with SMTP id a640c23a62f3a-b34bc399695mr383428566b.56.1758801838631;
        Thu, 25 Sep 2025 05:03:58 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3545a98e54sm153761266b.97.2025.09.25.05.03.57
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 05:03:58 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH 19/21] dhcp-relay: upgrade 4.4.3 -> 4.4.3-P1
Date: Thu, 25 Sep 2025 14:03:31 +0200
Message-ID: <20250925120334.1670367-20-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250925120334.1670367-1-skandigraun@gmail.com>
References: <20250925120334.1670367-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Sep 2025 12:04:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119879

From: Yi Zhao <yi.zhao@windriver.com>

Changes since 4.4.3 (Bug Fixes)

Corrected a reference count leak that occurs when the server builds
responses to leasequery packets. Thanks to VictorV of Cyber Kunlun
Lab for reporting the issue.
[Gitlab #253]
CVE: CVE-2022-2928

Corrected a memory leak that occurs when unpacking a packet that has an
FQDN option (81) that contains a label with length greater than 63
bytes.
Thanks to VictorV of Cyber Kunlun Lab for reporting the issue.
[Gitlab #254]
CVE: CVE-2022-2929

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 354608cb88042a7255aaf5c792b7638cb37a3979)

Adapted to Kirkstone. Dropped two CVE patches, because they are included in
this patch release.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...p-relay_4.4.3.bb => dhcp-relay_4.4.3p1.bb} |   8 +-
 .../dhcp/files/CVE-2022-2928.patch            | 120 ------------------
 .../dhcp/files/CVE-2022-2929.patch            |  40 ------
 3 files changed, 3 insertions(+), 165 deletions(-)
 rename meta-networking/recipes-connectivity/dhcp/{dhcp-relay_4.4.3.bb => dhcp-relay_4.4.3p1.bb} (87%)
 delete mode 100644 meta-networking/recipes-connectivity/dhcp/files/CVE-2022-2928.patch
 delete mode 100644 meta-networking/recipes-connectivity/dhcp/files/CVE-2022-2929.patch

diff --git a/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.3.bb b/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.3p1.bb
similarity index 87%
rename from meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.3.bb
rename to meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.3p1.bb
index 499b035040..2fd86bc28a 100644
--- a/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.3.bb
+++ b/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.3p1.bb
@@ -10,23 +10,21 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c463f4afde26d9eb60f14f50aeb85f8f"
 
 DEPENDS = "openssl libcap zlib"
 
-SRC_URI = "https://downloads.isc.org/isc/dhcp/${PV}/dhcp-${PV}.tar.gz \
+SRC_URI = "https://downloads.isc.org/isc/dhcp/4.4.3-P1/dhcp-4.4.3-P1.tar.gz \
            file://default-relay \
            file://init-relay \
            file://dhcrelay.service \
            file://0001-Makefile.am-only-build-dhcrelay.patch \
            file://0002-bind-Makefile.in-disable-backtrace.patch \
            file://0003-bind-Makefile.in-regenerate-configure.patch \
-           file://CVE-2022-2928.patch \
-           file://CVE-2022-2929.patch \
            "
 
-SRC_URI[sha256sum] = "0e3ec6b4c2a05ec0148874bcd999a66d05518378d77421f607fb0bc9d0135818"
+SRC_URI[sha256sum] = "0ac416bb55997ca8632174fd10737fd61cdb8dba2752160a335775bc21dc73c7"
 
 UPSTREAM_CHECK_URI = "http://ftp.isc.org/isc/dhcp/"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+\.\d+\.(\d+?))/"
 
-S = "${WORKDIR}/dhcp-${PV}"
+S = "${WORKDIR}/dhcp-4.4.3-P1"
 
 inherit autotools-brokensep systemd pkgconfig
 
diff --git a/meta-networking/recipes-connectivity/dhcp/files/CVE-2022-2928.patch b/meta-networking/recipes-connectivity/dhcp/files/CVE-2022-2928.patch
deleted file mode 100644
index 247e8dec68..0000000000
--- a/meta-networking/recipes-connectivity/dhcp/files/CVE-2022-2928.patch
+++ /dev/null
@@ -1,120 +0,0 @@
-From 2e08d138ff852820a6e87a09088d2dc2cdd15e56 Mon Sep 17 00:00:00 2001
-From: Hitendra Prajapati <hprajapati@mvista.com>
-Date: Mon, 10 Oct 2022 09:57:15 +0530
-Subject: [PATCH 1/2] CVE-2022-2928
-
-Upstream-Status: Backport [https://downloads.isc.org/isc/dhcp/4.4.3-P1/patches/]
-CVE: CVE-2022-2928
-Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
----
- common/options.c               |  7 +++++
- common/tests/option_unittest.c | 54 ++++++++++++++++++++++++++++++++++
- 2 files changed, 61 insertions(+)
-
-diff --git a/common/options.c b/common/options.c
-index 92c8fee..f0959cb 100644
---- a/common/options.c
-+++ b/common/options.c
-@@ -4452,6 +4452,8 @@ add_option(struct option_state *options,
- 	if (!option_cache_allocate(&oc, MDL)) {
- 		log_error("No memory for option cache adding %s (option %d).",
- 			  option->name, option_num);
-+		/* Get rid of reference created during hash lookup. */
-+		option_dereference(&option, MDL);
- 		return 0;
- 	}
- 
-@@ -4463,6 +4465,8 @@ add_option(struct option_state *options,
- 			     MDL)) {
- 		log_error("No memory for constant data adding %s (option %d).",
- 			  option->name, option_num);
-+		/* Get rid of reference created during hash lookup. */
-+		option_dereference(&option, MDL);
- 		option_cache_dereference(&oc, MDL);
- 		return 0;
- 	}
-@@ -4471,6 +4475,9 @@ add_option(struct option_state *options,
- 	save_option(&dhcp_universe, options, oc);
- 	option_cache_dereference(&oc, MDL);
- 
-+	/* Get rid of reference created during hash lookup. */
-+	option_dereference(&option, MDL);
-+
- 	return 1;
- }
- 
-diff --git a/common/tests/option_unittest.c b/common/tests/option_unittest.c
-index 600ebe6..963b566 100644
---- a/common/tests/option_unittest.c
-+++ b/common/tests/option_unittest.c
-@@ -213,6 +213,59 @@ ATF_TC_BODY(parse_X, tc)
-     }
- }
- 
-+ATF_TC(add_option_ref_cnt);
-+
-+ATF_TC_HEAD(add_option_ref_cnt, tc)
-+{
-+    atf_tc_set_md_var(tc, "descr",
-+        "Verify add_option() does not leak option ref counts.");
-+}
-+
-+ATF_TC_BODY(add_option_ref_cnt, tc)
-+{
-+    struct option_state *options = NULL;
-+    struct option *option = NULL;
-+    unsigned int cid_code = DHO_DHCP_CLIENT_IDENTIFIER;
-+    char *cid_str = "1234";
-+    int refcnt_before = 0;
-+
-+    // Look up the option we're going to add.
-+    initialize_common_option_spaces();
-+    if (!option_code_hash_lookup(&option, dhcp_universe.code_hash,
-+                                 &cid_code, 0, MDL)) {
-+        atf_tc_fail("cannot find option definition?");
-+    }
-+
-+    // Get the option's reference count before we call add_options.
-+    refcnt_before = option->refcnt;
-+
-+    // Allocate a option_state to which to add an option.
-+    if (!option_state_allocate(&options, MDL)) {
-+	    atf_tc_fail("cannot allocat options state");
-+    }
-+
-+    // Call add_option() to add the option to the option state.
-+    if (!add_option(options, cid_code, cid_str, strlen(cid_str))) {
-+	    atf_tc_fail("add_option returned 0");
-+    }
-+
-+    // Verify that calling add_option() only adds 1 to the option ref count.
-+    if (option->refcnt != (refcnt_before + 1)) {
-+        atf_tc_fail("after add_option(), count is wrong, before %d, after: %d",
-+                    refcnt_before, option->refcnt);
-+    }
-+
-+    // Derefrence the option_state, this should reduce the ref count to
-+    // it's starting value.
-+    option_state_dereference(&options, MDL);
-+
-+    // Verify that dereferencing option_state restores option ref count.
-+    if (option->refcnt != refcnt_before) {
-+        atf_tc_fail("after state deref, count is wrong, before %d, after: %d",
-+                    refcnt_before, option->refcnt);
-+    }
-+}
-+
- /* This macro defines main() method that will call specified
-    test cases. tp and simple_test_case names can be whatever you want
-    as long as it is a valid variable identifier. */
-@@ -221,6 +274,7 @@ ATF_TP_ADD_TCS(tp)
-     ATF_TP_ADD_TC(tp, option_refcnt);
-     ATF_TP_ADD_TC(tp, pretty_print_option);
-     ATF_TP_ADD_TC(tp, parse_X);
-+    ATF_TP_ADD_TC(tp, add_option_ref_cnt);
- 
-     return (atf_no_error());
- }
--- 
-2.25.1
-
diff --git a/meta-networking/recipes-connectivity/dhcp/files/CVE-2022-2929.patch b/meta-networking/recipes-connectivity/dhcp/files/CVE-2022-2929.patch
deleted file mode 100644
index faaac4868c..0000000000
--- a/meta-networking/recipes-connectivity/dhcp/files/CVE-2022-2929.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 5436cafe1d7df409a44ff5f610248db57f0677ee Mon Sep 17 00:00:00 2001
-From: Hitendra Prajapati <hprajapati@mvista.com>
-Date: Mon, 10 Oct 2022 09:58:04 +0530
-Subject: [PATCH 2/2] CVE-2022-2929
-
-Upstream-Status: Backport [https://downloads.isc.org/isc/dhcp/4.4.3-P1/patches/]
-CVE: CVE-2022-2929
-Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
----
- common/options.c | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/common/options.c b/common/options.c
-index f0959cb..25450e1 100644
---- a/common/options.c
-+++ b/common/options.c
-@@ -454,16 +454,16 @@ int fqdn_universe_decode (struct option_state *options,
- 		while (s < &bp -> data[0] + length + 2) {
- 			len = *s;
- 			if (len > 63) {
--				log_info ("fancy bits in fqdn option");
--				return 0;
-+				log_info ("label length exceeds 63 in fqdn option");
-+				goto bad;
- 			}
- 			if (len == 0) {
- 				terminated = 1;
- 				break;
- 			}
- 			if (s + len > &bp -> data [0] + length + 3) {
--				log_info ("fqdn tag longer than buffer");
--				return 0;
-+				log_info ("fqdn label longer than buffer");
-+				goto bad;
- 			}
- 
- 			if (first_len == 0) {
--- 
-2.25.1
-

