Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E982CCD1BF
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 20:19:37 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.2999.1761337174670322228
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Oct 2025 13:19:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ieJqmNBI;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-427084a641aso1718079f8f.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 24 Oct 2025 13:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761337173; x=1761941973; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=oF6wRN8NX5Taq9lcCi/1XJ0RGe/w8u6riXbkvkEPh8Q=;
        b=ieJqmNBIH9T88d5NlVjbvBYjOnC+VqESi5a1bJ1G9RoOZ37VD1P2HSl3jSGcbKqNK1
         PTVYBM47uWaqJRj1dQIC1Fqd8RU8EvBRWOlapR/GQFzSTZ4B60dOvHT+OdMfN6sqeWuT
         ZSuVinLMYeYUk0T3uDZRJ5CbAFzVdEK7Mamnp+BVga82JAeMpybIBbYXRon+bWMCucB6
         mznQWC9oTv/hicN+XmfPaHC8aYrieeh9Du0vfpr4OSWBmv17zWzgceHULdcZ+buT+TZI
         JneXBhNFrSaliXf+4qXbOcpoGk7DHnShBtJMtUk1CcIr9INmxWQA9X/t5ssYlPo/wrMl
         HlJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761337173; x=1761941973;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oF6wRN8NX5Taq9lcCi/1XJ0RGe/w8u6riXbkvkEPh8Q=;
        b=i/gZiNFlvDjHL2IPl5nDmJPopG8vww5R/kvCzqWBTPJ9yO+Udmx+flJENUUY294ikO
         2adAPX5lN0IQ9dnd/XUUsCBTlaihh8nlTrOtK7ehElo1qxhZlUJQk1UzHT8wzYauJdZw
         eJJo4guMCp2VyxH+4SFweVTQAz9yVFYWW2qT+XTJyScnmqsLxZu/dfIVLcLuqpgVMHQv
         JFYkFEmOMXbigNJhWdDZCcwl+TgUNeE/i+n/enAlOuuw4IJwzi5htgK88g0CHhirOLvm
         /IGb3ozPl1afIA16vMz9beipCbZ1Vt9NR+alORSdewRWGDsjHYT65E86g4nWTUYC6lDO
         PXCA==
X-Gm-Message-State: AOJu0Yx2FjlY5PzNZ+A7eP4uwaXxYJ/4dQ4kTor31+TBq07+oKuP4Is+
	KoCu0qFkU0pBssavvzSdQ9+Yr3r5bpZAKWUU36Td1QZ982000R96ArOPp5Zhzw==
X-Gm-Gg: ASbGncvP6VbHydLTKwlsBfu6ALF16J18WID/CyplVsff0tY/TCB2JgjpFgoEyvBIGlo
	PUas09h+0DBTshDzOtFu3tHjqhJ0/lR8akb95nUPD0iMBDVwqhf+vpT9qn8eOfhCkt9dIb841mc
	XwwgfBUiAvW34Vn+F5FXh1wcpmjuiL57uLdccbhEldxQkulKcHPYvzrxoDAF55cXAUQ3m0QTemT
	OCPkyTDvEt2NObfjVaL803/jX/pJ43zjROExoEiLCDlDfE+5y6mxp9UtgmTdewmsCo3mkLDyHdA
	GRI9ppHDsSscdYKcT+2EqRUGKC5/lAyRrCqQoCCjtwhr//sRLc6w7X5hzo8eHGksv5mZCdQx+BL
	8Ppo8TXneIG0O1T12Ongv7mu2n++P6BpnoZ+6aKiGkde2RE8fNTqxoyxe1afcDv10frQ59LFrxL
	m+DuIwajUK
X-Google-Smtp-Source: AGHT+IHR3HecD+BPnDf4eR5IwghWuhMX6tHvtNbMIeutY062ogkx/taMX5BF/aK29M6dMT9M7eW7tg==
X-Received: by 2002:a05:6000:2c04:b0:428:4004:8241 with SMTP id ffacd0b85a97d-4284004abcdmr15319442f8f.40.1761337172923;
        Fri, 24 Oct 2025 13:19:32 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952cbb20sm164864f8f.18.2025.10.24.13.19.31
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 13:19:32 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-perl][PATCH v2] libmime-base32-perl: add recipe
Date: Fri, 24 Oct 2025 22:19:31 +0200
Message-ID: <20251024201931.765946-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Oct 2025 20:19:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120974

It's a runtime dependency for liburi-perl-ptest.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---

v2: remove run-ptest from SRC_URI, since ptest-perl class provides it already.

 .../include/ptest-packagelists-meta-perl.inc     |  1 +
 .../libmime/libmime-base32-perl_1.303.bb         | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libmime/libmime-base32-perl_1.303.bb

diff --git a/meta-perl/conf/include/ptest-packagelists-meta-perl.inc b/meta-perl/conf/include/ptest-packagelists-meta-perl.inc
index 24968d8ca7..09a1e4c5ba 100644
--- a/meta-perl/conf/include/ptest-packagelists-meta-perl.inc
+++ b/meta-perl/conf/include/ptest-packagelists-meta-perl.inc
@@ -22,6 +22,7 @@ PTESTS_FAST_META_PERL = "\
     libextutils-installpaths-perl \
     libfile-slurper-perl \
     libhtml-tagset-perl \
+    libmime-base32-perl \
     libmime-types-perl \
     libmozilla-ca-perl \
     libnet-ldap-perl \
diff --git a/meta-perl/recipes-perl/libmime/libmime-base32-perl_1.303.bb b/meta-perl/recipes-perl/libmime/libmime-base32-perl_1.303.bb
new file mode 100644
index 0000000000..840bced030
--- /dev/null
+++ b/meta-perl/recipes-perl/libmime/libmime-base32-perl_1.303.bb
@@ -0,0 +1,16 @@
+SUMMARY = "MIME::Base32 - Base32 encoder and decoder"
+DESCRIPTION = "This module is for encoding/decoding data much the way that MIME::Base64 does."
+HOMEPAGE = "https://metacpan.org/release/REHSACK/MIME-Base32-1.303"
+SECTION = "libraries"
+
+LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
+LIC_FILES_CHKSUM = "file://META.yml;beginline=11;endline=11;md5=963ce28228347875ace682de56eef8e8"
+
+SRC_URI = "${CPAN_MIRROR}/authors/id/R/RE/REHSACK/MIME-Base32-${PV}.tar.gz"
+SRC_URI[sha256sum] = "ab21fa99130e33a0aff6cdb596f647e5e565d207d634ba2ef06bdbef50424e99"
+
+S = "${UNPACKDIR}/MIME-Base32-${PV}"
+
+inherit cpan ptest-perl
+
+RDEPENDS:${PN}-ptest += "perl-module-test-more"

