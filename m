Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A2F9CDB470
	for <webhook@archiver.kernel.org>; Wed, 11 Oct 2023 17:31:23 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.22847.1697045473104606215
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Oct 2023 10:31:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FzeiifKf;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1c8a1541232so614015ad.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Oct 2023 10:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697045472; x=1697650272; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=She2eHOLl9DKu6fyejsopzYb4WbtURwAJwP3zHvotbc=;
        b=FzeiifKf6/SRvqTdrTGAy1S0qxH9gg1SucEYNs+Mgmny+LJnP+vyA5nMd2FHcztoB3
         +nLW47kRs2+d6cAtGky3O+9+SbfTirrddY5TAIDUIF/vZYcWEWo5btuiIWPnDPdcOQnx
         rX0GBSywu6yF3o0yNcGiXtTYu8PCNdTQNdG+2ggW0cSjRxDuMPz70aB695sHD4IljKW3
         mP85SF0DwHTRNJVsq02JvF0bIprE1bvnKZd134S5n1NzfoGzspu74u080reFNu7EO8Cx
         Xh4mX0l3k3yNAlMbmn1B3erz5W/WqUfG97gqtFhBDh8czAJGSdRleNub6QqTCVxFzExj
         tANw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697045472; x=1697650272;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=She2eHOLl9DKu6fyejsopzYb4WbtURwAJwP3zHvotbc=;
        b=Y6QqHbFl3hl3g1rIpAKVJGe29dg3os2zduMF6MCgN/VYpcnEpEHZlnb3ZAyOkAdeMs
         D6BVLL+7c6aPn2/ECRE9moPL0p6qcQhhCPUlMOYKhlHOvxxscXcXqWggf+kPlk95ttII
         3I5TR4TonvamES0As2Au92h45XeH34KG4pIZ4s8yxZ514Lwe+GoZ72MVf3inJwqbxepK
         GVxlE9uJGKPGiBtziaoLN1i5n2o4YZ+nqnhimiuX8i8WrRlDJLws1ItFil5zwNvNINbB
         M8H+pfg0O61lQ4jjq0zP63xEct23PgAB4o2va6Y+VA12fa01f5TfuJLgucW82bbE14l6
         fJ3g==
X-Gm-Message-State: AOJu0YwLETAPbyDtE89joO5rZodmr+fXAy6taD5JaU+vClPZ0kveI5cc
	NQtczoogpW/K6TFLfS365Zcv4u/+SrfdAA==
X-Google-Smtp-Source: AGHT+IEYN7oejhSyTRh0Dxd2Cu3T35ahhbgS9rCwUSnSrJVd0UfVn5D5yrQw5y2U54u+QasIFFbWRQ==
X-Received: by 2002:a17:902:9a44:b0:1c5:f4c7:b4d5 with SMTP id x4-20020a1709029a4400b001c5f4c7b4d5mr20567339plv.34.1697045472232;
        Wed, 11 Oct 2023 10:31:12 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::7f07])
        by smtp.gmail.com with ESMTPSA id g15-20020a1709029f8f00b001c9c879ee4asm106531plq.17.2023.10.11.10.31.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 10:31:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-perl][PATCH] libnet-idn-encode: Fix build with perl 2.38 and gcc13
Date: Wed, 11 Oct 2023 10:31:09 -0700
Message-ID: <20231011173109.1842230-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Oct 2023 17:31:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105431

Add missing rdep on perl-module-encode-encoding
fixes

Can't locate Encode/Encoding.pm in @INC (you may need to install the Encode::Encoding module)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...flags_instead_of_uvuni_to_utf8_flags.patch | 36 +++++++++++++++++++
 .../libnet/libnet-idn-encode_2.500.bb         |  6 ++--
 2 files changed, 40 insertions(+), 2 deletions(-)
 create mode 100644 meta-perl/recipes-perl/libnet/libnet-idn-encode/Net-IDN-Encode-2.500-use_uvchr_to_utf8_flags_instead_of_uvuni_to_utf8_flags.patch

diff --git a/meta-perl/recipes-perl/libnet/libnet-idn-encode/Net-IDN-Encode-2.500-use_uvchr_to_utf8_flags_instead_of_uvuni_to_utf8_flags.patch b/meta-perl/recipes-perl/libnet/libnet-idn-encode/Net-IDN-Encode-2.500-use_uvchr_to_utf8_flags_instead_of_uvuni_to_utf8_flags.patch
new file mode 100644
index 0000000000..f0e9010bf4
--- /dev/null
+++ b/meta-perl/recipes-perl/libnet/libnet-idn-encode/Net-IDN-Encode-2.500-use_uvchr_to_utf8_flags_instead_of_uvuni_to_utf8_flags.patch
@@ -0,0 +1,36 @@
+Subject: [PATCH] use uvchr_to_utf8_flags instead of uvuni_to_utf8_flags (which is removed in perl 5.38.0)
+
+https://perldoc.perl.org/5.36.0/perlintern#uvuni_to_utf8_flags
+Signed-off-by: Shin Kojima <shin@kojima.org>
+Upstream-Status: Submitted [https://github.com/cfaerber/Net-IDN-Encode/pull/11]
+---
+ lib/Net/IDN/Punycode.xs | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/lib/Net/IDN/Punycode.xs b/lib/Net/IDN/Punycode.xs
+index 211ef9c..36530dd 100644
+--- a/lib/Net/IDN/Punycode.xs
++++ b/lib/Net/IDN/Punycode.xs
+@@ -24,6 +24,10 @@
+ #define utf8_to_uvchr_buf(in_p,in_e,u8) utf8_to_uvchr(in_p,u8);
+ #endif
+ 
++#ifndef uvchr_to_utf8_flags
++#define uvchr_to_utf8_flags(d, uv, flags) uvuni_to_utf8_flags(d, uv, flags);
++#endif
++
+ static char enc_digit[BASE] = {
+   'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
+   'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
+@@ -253,7 +257,7 @@ decode_punycode(input)
+ 		  if(skip_p < re_p)				/* move succeeding chars */
+ 		    Move(skip_p, skip_p + u8, re_p - skip_p, char);
+ 		  re_p += u8;
+-		  uvuni_to_utf8_flags((U8*)skip_p, n, UNICODE_ALLOW_ANY);
++		  uvchr_to_utf8_flags((U8*)skip_p, n, UNICODE_ALLOW_ANY);
+ 		}
+ 
+ 		if(!first) SvUTF8_on(RETVAL);			/* UTF-8 chars have been inserted */
+-- 
+2.41.0
+
diff --git a/meta-perl/recipes-perl/libnet/libnet-idn-encode_2.500.bb b/meta-perl/recipes-perl/libnet/libnet-idn-encode_2.500.bb
index ce3b75b774..7f33fd2b1f 100644
--- a/meta-perl/recipes-perl/libnet/libnet-idn-encode_2.500.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-idn-encode_2.500.bb
@@ -7,7 +7,9 @@ SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8ea5704cf65ca4ec6e9e167fb94f14dd"
 
-SRC_URI = "${CPAN_MIRROR}/authors/id/C/CF/CFAERBER/Net-IDN-Encode-${PV}.tar.gz"
+SRC_URI = "${CPAN_MIRROR}/authors/id/C/CF/CFAERBER/Net-IDN-Encode-${PV}.tar.gz \
+           file://Net-IDN-Encode-2.500-use_uvchr_to_utf8_flags_instead_of_uvuni_to_utf8_flags.patch \
+"
 SRC_URI[sha256sum] = "55453633e3ff24ce325b34bc2c8157b9859962a31ab5cf28bf7ccc1c9b3a3eaa"
 
 S = "${WORKDIR}/Net-IDN-Encode-${PV}"
@@ -20,4 +22,4 @@ do_configure:prepend() {
 
 BBCLASSEXTEND = "native"
 
-RDEPENDS:${PN} += "perl-module-unicode-normalize"
+RDEPENDS:${PN} += "perl-module-unicode-normalize perl-module-encode-encoding"
-- 
2.42.0


