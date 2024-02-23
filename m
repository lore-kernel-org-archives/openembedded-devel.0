Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19314C47DD9
	for <webhook@archiver.kernel.org>; Fri, 23 Feb 2024 03:00:54 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web10.2887.1708657248154523812
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Feb 2024 19:00:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=E1+KOlDf;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-517ab9a4a13so311837a12.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Feb 2024 19:00:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708657247; x=1709262047; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UzWh027/EzpxD3eOT194YbeeUrKDbajaUTnN69SxXe4=;
        b=E1+KOlDfZ+kiKV2aRAqS0jULsOxo1OyOW18j6mIn+8VdxIlJscdsohWp+S7XJHgdy+
         aUvycbjKawLdpivzfO29ERfiGNKtzc5TSh+98M+wUsPYL2E/1vkI1vwKLXG0n92XltlJ
         LSOlQmv6rMfm0z5DeZ2JKfbFwZkE2w7ppUvqbXgnJTjWxj6QZjba5ys0uzUfrDKjScZZ
         +7ciO+hT8aUprG0H1hykW8juPG79yP+AIUeJBPfKmdj2VcuMZWWdz1RDoKT1SiZV/xck
         Ijs5EwJxCQKxWbkdgiI/wvt0GKyZAlrepF9mjnXzzPz6F4KK9u24QJYv5m3nck199Fqh
         3ywA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708657247; x=1709262047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UzWh027/EzpxD3eOT194YbeeUrKDbajaUTnN69SxXe4=;
        b=GNapj9sh1hebvtf6VC51N100g+6Q1iAeVtH9GD1PCjxIRbN/3f9Z61NXz0dtplSUbB
         j0wnM/tUBapqP556G9RUzv1EgFcAOtkNee6VhL2hjs+diGjYxfFpDhrpzSBfZaeWZYkZ
         /gxpUdZ8WTikqtcBSxsj96d7+3tM6xg1UbcGEykpyM9d4OldEgnlC+xJJxWWrqm63E/q
         GD8HzY+jjA1lUIDwrA0vbx9GzobyevKgsZXETW7Hry6xWKhcORBOuYVfzJSdTrUsY0A9
         8fZmx3B4XMc28lUY1UODsb90agknzB7DP0Q2qTzkXC3KpPLulz2MM8vmoD5FXSKCUzQx
         sTJQ==
X-Gm-Message-State: AOJu0Yy1s6Gs02WzBtAYUd8DQa4QzFPWUYPRkfWHN/wZTK7/b/Nr6inf
	V9kcjmtF2TTJ56TmhsVVHk7VfhcPPxrHq7yQql1NqZ994JtqdxPIuLLaJm4+1n0=
X-Google-Smtp-Source: AGHT+IFOoDHBgnl2rQ/UCJXuVAP9FffdtYRW2M3uzsqFSAjST7QBU+z4s6I1tQGyT593IpzVODMsyg==
X-Received: by 2002:a05:6a20:d905:b0:19c:71bc:ec82 with SMTP id jd5-20020a056a20d90500b0019c71bcec82mr948517pzb.48.1708657247219;
        Thu, 22 Feb 2024 19:00:47 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::a1f8])
        by smtp.gmail.com with ESMTPSA id f7-20020a170902684700b001da186aa72csm10994189pln.17.2024.02.22.19.00.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 19:00:46 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 2/2] meta-networking-image-ptest: Add images to enable BBCLASSEXTEND parallel execution
Date: Thu, 22 Feb 2024 19:00:43 -0800
Message-ID: <20240223030043.762212-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240223030043.762212-1-raj.khem@gmail.com>
References: <20240223030043.762212-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Feb 2024 03:00:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109002

In line with other layers like meta-oe, meta-python add capability to
run recipe ptests

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../ptest-packagelists-meta-networking.inc    | 36 +++++++++++++++++
 .../images/meta-networking-image-ptest-all.bb | 25 ++++++++++++
 .../meta-networking-image-ptest-fast.bb       |  5 +++
 .../images/meta-networking-image-ptest.bb     | 40 +++++++++++++++++++
 4 files changed, 106 insertions(+)
 create mode 100644 meta-networking/conf/include/ptest-packagelists-meta-networking.inc
 create mode 100644 meta-networking/recipes-core/images/meta-networking-image-ptest-all.bb
 create mode 100644 meta-networking/recipes-core/images/meta-networking-image-ptest-fast.bb
 create mode 100644 meta-networking/recipes-core/images/meta-networking-image-ptest.bb

diff --git a/meta-networking/conf/include/ptest-packagelists-meta-networking.inc b/meta-networking/conf/include/ptest-packagelists-meta-networking.inc
new file mode 100644
index 0000000000..6b41bfcf1a
--- /dev/null
+++ b/meta-networking/conf/include/ptest-packagelists-meta-networking.inc
@@ -0,0 +1,36 @@
+#
+# Lists of the ptest in meta-networking, sorted into two sets by the time they take
+# Please keep these sorted in alphabetical order
+#
+# A first pass at getting all meta-networking recipes which inherit ptest
+# meta_networking_ptest_recipes=$(bitbake-layers show-recipes --recipes-only --layer meta-networking --inherits ptest --bare | sed -e '1,/=== Matching recipes: ===/d')
+# ptests which take less than ~30s each
+
+PTESTS_FAST_META_NETWORKING = "\
+    geoip \
+    libcoap \
+    libldb \
+    libnftnl \
+    libtalloc \
+    libtdb \
+    lldpd \
+    mbedtls \
+    tcpdump \
+"
+
+PTESTS_SLOW_META_NETWORKING = "\
+    firewalld \
+    net-snmp \
+"
+
+PTESTS_PROBLEMS_META_NETWORKING = "\
+    freediameter \
+    geoip-perl \
+    libtevent \
+    lksctp-tools \
+    nftables \
+    openhpi \
+    openl2tp \
+    python3-scapy \
+    squid \
+"
diff --git a/meta-networking/recipes-core/images/meta-networking-image-ptest-all.bb b/meta-networking/recipes-core/images/meta-networking-image-ptest-all.bb
new file mode 100644
index 0000000000..6d96d4a876
--- /dev/null
+++ b/meta-networking/recipes-core/images/meta-networking-image-ptest-all.bb
@@ -0,0 +1,25 @@
+DESCRIPTION = "Recipe to trigger execution of all meta-networking ptest images."
+HOMEPAGE = "https://www.openembedded.org/"
+
+LICENSE = "MIT"
+
+inherit features_check nopackages
+REQUIRED_DISTRO_FEATURES = "ptest"
+
+require conf/include/ptest-packagelists-meta-networking.inc
+
+# Include the full set of ptests
+PTESTS_META_NETWORKING = "${PTESTS_FAST_META_NETWORKING} ${PTESTS_SLOW_META_NETWORKING} ${PTESTS_PROBLEMS_META_NETWORKING}"
+
+do_testimage[noexec] = "1"
+do_testimage[depends] = "${@' '.join(['meta-networking-image-ptest-'+x+':do_testimage' for x in d.getVar('PTESTS_META_NETWORKING').split()])}"
+
+do_build[depends] = "${@' '.join(['meta-networking-image-ptest-'+x+':do_build' for x in d.getVar('PTESTS_META_NETWORKING').split()])}"
+
+# normally image.bbclass would do this
+EXCLUDE_FROM_WORLD = "1"
+
+python () {
+    if bb.utils.contains('IMAGE_CLASSES', 'testimage', True, False, d):
+        bb.build.addtask("do_testimage", "", "", d)
+}
diff --git a/meta-networking/recipes-core/images/meta-networking-image-ptest-fast.bb b/meta-networking/recipes-core/images/meta-networking-image-ptest-fast.bb
new file mode 100644
index 0000000000..7790dd71e0
--- /dev/null
+++ b/meta-networking/recipes-core/images/meta-networking-image-ptest-fast.bb
@@ -0,0 +1,5 @@
+require meta-networking-image-ptest-all.bb
+
+DESCRIPTION = "Recipe to trigger execution of all fast meta-networking ptest images."
+
+PTESTS_META_OE = "${PTESTS_FAST_META_NETWORKING}"
diff --git a/meta-networking/recipes-core/images/meta-networking-image-ptest.bb b/meta-networking/recipes-core/images/meta-networking-image-ptest.bb
new file mode 100644
index 0000000000..f458b761f2
--- /dev/null
+++ b/meta-networking/recipes-core/images/meta-networking-image-ptest.bb
@@ -0,0 +1,40 @@
+inherit features_check
+REQUIRED_DISTRO_FEATURES = "ptest"
+
+require recipes-core/images/core-image-minimal.bb
+require conf/include/ptest-packagelists-meta-networking.inc
+
+SUMMARY = "meta-networking ptest test image"
+
+DESCRIPTION += "Also including the ${MCNAME} ptest package."
+HOMEPAGE = "https://www.openembedded.org/"
+
+PTESTS_META_NETWORKING = "${PTESTS_SLOW_META_NETWORKING} ${PTESTS_FAST_META_NETWORKING} ${PTESTS_PROBLEMS_META_NETWORKING}"
+
+IMAGE_INSTALL:append = " ${MCNAME}-ptest openssh"
+
+BBCLASSEXTEND = "${@' '.join(['mcextend:'+x for x in d.getVar('PTESTS_META_NETWORKING').split()])}"
+
+# The image can be sufficiently large (~1.8GB) that we need to be careful that it fits in a live
+# image (which has a 4GB limit), so nullify the overhead factor (1.3x out of the
+# box) and explicitly add up to 1500MB.
+IMAGE_OVERHEAD_FACTOR = "1.0"
+IMAGE_ROOTFS_EXTRA_SPACE = "324288"
+# If a particular ptest needs more space, it can be customized:
+#IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-<pn> = "1024288"
+
+# ptests need more memory than standard to avoid the OOM killer
+QB_MEM = "-m 1024"
+# If a particular ptest needs more memroy, it can be customized:
+#QB_MEM:virtclass-mcextend-<pn> = "-m 4096"
+
+TEST_SUITES = "ping ssh parselogs ptest"
+
+# Sadly at the moment the full set of ptests is not robust enough and sporadically fails in random places
+PTEST_EXPECT_FAILURE = "1"
+
+python () {
+    if not d.getVar("MCNAME"):
+        raise bb.parse.SkipRecipe("No class extension set")
+}
+
-- 
2.43.2


