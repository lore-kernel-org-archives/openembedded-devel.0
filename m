Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13CCCCCF9E0
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 20:11:57 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.2880.1761336712756805890
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Oct 2025 13:11:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ob44QAat;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-428564f8d16so1358411f8f.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 24 Oct 2025 13:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761336711; x=1761941511; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=d3MUalNylTMPFdvt+0DOo3xjyx4OH9+jNNgAGCqUT1A=;
        b=Ob44QAatoChqEGIR9O/HUlzjPe4dBl+mj2N+65Fqycd36hGfaeGfHO95tYUYDRIo5P
         JK4tP6C41TrAHnindaKcAG47CpcEGft/J8AE+/RkLUs1xMDuBPK1aXvDMb2JA4A1ymyZ
         kRFiCN0YKMdcwupJPPOjqzNVhX7wATcq4xrssKjY5bpZFfyyqlAUBeIKJprYV03IYU9G
         HHpg5/6NnfL+klSjnhHVwXONdvKVLMg7dJqDc3gtMMlz7NKwhLS7rA3lkWQ4QOQQlfTV
         avfqGby0EVvbvgp/8mE1feOSsBplz1SgxldpXzXgmoCWxDcyUoZB25HkdA9wrkXhyxIv
         fWEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761336711; x=1761941511;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d3MUalNylTMPFdvt+0DOo3xjyx4OH9+jNNgAGCqUT1A=;
        b=U8o7NG+C7LvY3jqdad3T86n2aIqi/MqRm3S2iWCWhoqcBHxYR98i/1IEgBSKFisGyL
         6sgHwx11e7lkw/L/95Qa3o/ReoFft4MU+S1/3GCkO0JppfRXPo61VuyQIPG+sVbW4giZ
         +iqMvJUKwvUC3tsMVljbPe8zUYKDd4km5sTIOLcCeI2GAEYks61joGxmvZFiGvMtgenW
         c9Cs2F94mKQIWr1s5w6u65+8Yn7t7MNSztojQ++hkLSv4caeZlyuUPsyoH+ibFob/L1q
         bzLy8WTCWBze+k+VgshAvikGzKx8D/S1F6l6gsghMjXV6ZjF4eU1W7AwBDp3g7xPGKZC
         B9Nw==
X-Gm-Message-State: AOJu0Ywr6usRTSL8O1CvabjhwdfKDh+d7jyqH3hAzM0NaHxjnqVcA7wG
	uX/3vmDSHEu4oU6B6NnUIjRII8JkhWu6s4EeAyOzTeg79bHlHYh4ld9NQVvM9A==
X-Gm-Gg: ASbGncvpE5tnOsqvUOeSaFqTnWKG0c+IKcxWOHM2/cWh5aI5i50MtW5wncPWlsDrB+X
	4K3gM885FOn8tn5wN1xIVC2GX05zXtUyO5vCmJItAUNElIcqdMflrDz/X303wC8zY66SESeQmH3
	5t+x9VH4AQov6qjSJPVv/hF8Qb+jrURLM0VMssjPw29oZcatUOlrLU0FJMpACMrB8SI5Lwkc2xr
	gq1ZSehlVYQNJ0aywz1OXg0rUhvnifVZyJ1F6ANZrnd34yO9SvtPvyELZh5C4vc2/fcaWhfeRJd
	e08fbIY9CixngzE+j2C7Tan0Cy95GeZ7F1L5QNpae5CzcBc6j3tpOQqb3belEa8dwx3H0uqzyFj
	g9EAxinvXyLhCRx+FUVwLaDavqBp2wCEk6OIETy/0GEG4U/0gEHNcPD8pQtULsRO2DWf9cf5TNk
	1jsZx+Fcw6
X-Google-Smtp-Source: AGHT+IEWXQhTcTjy8CIRRraVMl49Xg+Xce/yiF5FZHPzDEmzMhnMIkGOOvghtFLj3z8odfvU1WzEZw==
X-Received: by 2002:a05:6000:2905:b0:426:ff91:2f25 with SMTP id ffacd0b85a97d-4298f5934d4mr3312373f8f.21.1761336710883;
        Fri, 24 Oct 2025 13:11:50 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952db839sm135918f8f.34.2025.10.24.13.11.48
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 13:11:49 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-perl][PATCH 1/2] libmime-base32-perl: add recipe
Date: Fri, 24 Oct 2025 22:11:47 +0200
Message-ID: <20251024201148.756716-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Oct 2025 20:11:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120972

It's a runtime dependency for liburi-perl-ptest.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../include/ptest-packagelists-meta-perl.inc   |  1 +
 .../libmime/libmime-base32-perl_1.303.bb       | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+)
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
index 0000000000..38df81b6b4
--- /dev/null
+++ b/meta-perl/recipes-perl/libmime/libmime-base32-perl_1.303.bb
@@ -0,0 +1,18 @@
+SUMMARY = "MIME::Base32 - Base32 encoder and decoder"
+DESCRIPTION = "This module is for encoding/decoding data much the way that MIME::Base64 does."
+HOMEPAGE = "https://metacpan.org/release/REHSACK/MIME-Base32-1.303"
+SECTION = "libraries"
+
+LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
+LIC_FILES_CHKSUM = "file://META.yml;beginline=11;endline=11;md5=963ce28228347875ace682de56eef8e8"
+
+SRC_URI = "${CPAN_MIRROR}/authors/id/R/RE/REHSACK/MIME-Base32-${PV}.tar.gz \
+           file://run-ptest \
+          "
+SRC_URI[sha256sum] = "ab21fa99130e33a0aff6cdb596f647e5e565d207d634ba2ef06bdbef50424e99"
+
+S = "${UNPACKDIR}/MIME-Base32-${PV}"
+
+inherit cpan ptest-perl
+
+RDEPENDS:${PN}-ptest += "perl-module-test-more"

