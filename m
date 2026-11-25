Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37947.1795594098223590539
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Nov 2026 00:08:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=W2NQ1awe;
 spf=pass (domain: gmail.com, ip: 74.125.82.170, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3869f03af6aso4706574eec.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 00:08:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795594098; x=1796198898; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8wyvXj4szAOE0tQfRZ5Z1ATHoeU5TGPLc76X2Wi+2Tk=;
        b=W2NQ1aweKnlpKF/gOSo6Y4ucv6vgN71hJDSXFMpzp5W+/XMzkIzgN5Kk6eBvBRzZ6I
         pNa0UJJWYRh5bHDwLbMla3bjGshUSz4WOcOWm9Zp3Myjiwt5/oW9Saanp4CxRKvtfVai
         6Gan113e9it1k9LB0maYnJ9fIoA91XvhNPQZBigjPwLFYxkDnBdhgMWTm4yjMMzzPgeJ
         488LB9NVjHNOTnDgZEdkDjJESoryeojlez0oKPu+j7nuOGVTl0TO7PE0SiiA6VrOlEA/
         oLss5c/5g0crAKiGFapAbof8Mb5Gkt5JNRfp/cH2RqAcC7QGzRyH+HafMY0Ztt+34C8x
         AgJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594098; x=1796198898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8wyvXj4szAOE0tQfRZ5Z1ATHoeU5TGPLc76X2Wi+2Tk=;
        b=z5qv3nlIn4JCBc+DDmxslKphU8xB5uKjVVUBrTrDeBb5W3GIg47ob888SHUTNi+6YD
         RD0oTTUWyQb3OQlGlV6TGUvLOy8kqfhCzuRpZcDEy5c9+5W9eligux81NywBoz7K/LAB
         iV/W9Alph8CkWo4ys+xFlSIkLvp01SRAb8Npif41uGTUJo8s29fusTJw5wt34p5w5R7k
         W9XI0Y1ZDEytilGdvLQs1Hlp35EqsVX4DP1+XK1DYQrvIHxpurHLuhyXM0m583G1OT6M
         o/fZ8glTJc0zwk2LL+IooVEXWyeVMn8C7PmRbLt51YSuwZX7yzgMXz8tkHs2iTqUFYHg
         d/1w==
X-Gm-Message-State: APuU4Z9MMX29jNSaKXsxfd0mq5gvHwLtj5u7qul5EuruMBH0klUG3fuK
	oaSRbR1Dr2zZ8yQVKbD1tasObQNLeBlJVBqgZfmyz4aupMfJnzvYDKATGG3E2t5U
X-Gm-Gg: AZFdTZeyS4tuUEJS7ht5LbpyjxLW+r1IvlWiVBC5PXW2Ys6BFJyeq146WmW8iGDR6+x
	tcB/0bVng0yeb+6A+OvdyIUQormdy5PSrkOd96LpWCPGF3CBVcfwZ/SBcArPf1PJXgv3ESxiq6b
	MZsy1beK7BEivoYbDWAqnluDicBuEZOhcsT6H1NO0c4K/b8a+ehmzj2Ib1JrRTaWSstmsbYmsgq
	MUJ3uTMG+EeYVl8Y/dYu/m4JaB5hgVj58Jpz2pMFYdE/9fc0iIrZ4u46q82ibktypvZy7S10O3/
	KV3dx+jQP5BZyVv1DN21XwUuzU4S7ydtYjAVv5zjgk7VJXdfNMB5ETJ0zUSOO0N7MTbItMxIIY6
	+XiSj38Yo4RlEfritWltoaZta5IZHzU4k+ycBypJnricYO4LIStg4ut8TXhykMb5wvrCMy6BoKu
	MBd0hOBR7V9EWAig5jl/Dm41cPACfkMaQVOV2/KWupXUYVqVTPpyYeGOHchYu8o84dRlvza+At2
	19bhVdgvXrOKmiShQJmRCEdVZ/w/Ur7FIylzisAa037JaBV4kTJrI2PJiNVfSiPaaTy8of0ieqT
	crXQuF9fzgwU/jVVj/THYnG7aAPOdYs1VCZiIx3Lzn3Hif85GGhlwj665eR8UKqwz7pPJsDrmDc
	x86qdd1PKRjrT1Nd8UWgqwBuSMbwT0vcZPKHPFOhb4gLmG2MCMZhPfWE0yKtJvdfneDEQSETU+D
	eghOFqVPM+/VSGGowUMpxuNAzIXW6H4m/LOYPXMk21Lgnr/HGVqkd0UaPQEHZRY2/vImkMsyr7z
	oVuWHWkDW3Mk+oiLfNKE0BD+9Rd9CRsdd5eMdYJQR+DXeV6zM1S6UloGJZ0f3IHrXpWZoN9ZFsN
	Dk9+
X-Received: by 2002:a05:7301:5098:b0:381:5fe2:a079 with SMTP id 5a478bee46e88-3856c6b010amr17596965eec.1.1795594097596;
        Wed, 25 Nov 2026 00:08:17 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm90997971eec.3.2026.11.25.00.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:08:17 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 28/55] protobuf: upgrade 6.33.6 -> 7.36.2
Date: Wed, 25 Nov 2026 00:06:44 -0800
Message-ID: <20261125080732.2419614-34-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
References: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 08:08:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133031
Content-Type: text/plain; charset="utf-8"

The C++ library major version moves from 6 to 7 at protoc v34; this
recipe now builds protoc tag v36.2 (36.x branch).
- C++ API break in v34: FieldDescriptor::label(), is_optional() and
  has_optional_keyword() removed, generator headers made private,
  [[nodiscard]] added to many accessors, arena-enabled constructors of
  RepeatedField/RepeatedPtrField/Map made private
- Recursion limits added for JSON Any/WKT parsing and nested messages;
  integer overflow check in RepeatedPtrField::MergeFrom
- New protobuf_BUILD_LIBPROTOBUF option; tests are no longer built by
  default
- C++ and Python (python3-protobuf 7.36.2) are back on the same release

Both local patches still apply without fuzz. PV stays in the
<cpp-major>.<protoc> form so PROTOC_VERSION/PROTOC_BRANCH derive v36.2
and 36.x. protobuf-c needs the label() fix from the previous commit.

Anchor UPSTREAM_CHECK_GITTAGREGEX to release tags only.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../protobuf/{protobuf_6.33.6.bb => protobuf_7.36.2.bb}   | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-devtools/protobuf/{protobuf_6.33.6.bb => protobuf_7.36.2.bb} (95%)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_6.33.6.bb b/meta-oe/recipes-devtools/protobuf/protobuf_7.36.2.bb
similarity index 95%
rename from meta-oe/recipes-devtools/protobuf/protobuf_6.33.6.bb
rename to meta-oe/recipes-devtools/protobuf/protobuf_7.36.2.bb
index 36642d3947..b83597965b 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_6.33.6.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_7.36.2.bb
@@ -16,7 +16,7 @@ PROTOC_BRANCH = "${@d.getVar('PV').split('.', 2)[1]}.x"
 DEPENDS = "zlib abseil-cpp jsoncpp"
 DEPENDS:append:class-target = " protobuf-native"
 
-SRCREV = "6e1998413a5bca7c058b85999667893f167434bc"
+SRCREV = "2c74169b34066ceb8ddb6b882fcb3fb32d737a55"
 
 SRC_URI = "git://github.com/protocolbuffers/protobuf.git;branch=${PROTOC_BRANCH};protocol=https;tag=${PROTOC_VERSION} \
            file://run-ptest \
@@ -25,11 +25,11 @@ SRC_URI = "git://github.com/protocolbuffers/protobuf.git;branch=${PROTOC_BRANCH}
            "
 
 # Upstream dropped the language-major prefix after v6.31.1: releases are now
-# tagged vNN.N (v33.6 == this recipe's 6.33.6, cf. PROTOC_VERSION above). Match
+# tagged vNN.N (v36.2 == this recipe's 7.36.2, cf. PROTOC_VERSION above). Match
 # those two-component tags so the real latest release is reported; the leading
-# "6." in PV means the comparison stays off-by-a-major, so this reads as UPDATE
+# C++ major in PV means the comparison stays off-by-a-major, so this reads as UPDATE
 # rather than MATCH even when current.
-UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+\.\d+)$"
+UPSTREAM_CHECK_GITTAGREGEX = "^v(?P<pver>\d+\.\d+)$"
 
 CVE_PRODUCT = "google:protobuf protobuf:protobuf google-protobuf protobuf-cpp"
 
