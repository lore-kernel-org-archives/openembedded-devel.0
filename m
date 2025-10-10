Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D948ACAC5BB
	for <webhook@archiver.kernel.org>; Fri, 10 Oct 2025 04:26:53 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.1243.1760070406662623931
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Oct 2025 21:26:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=gngahgll;
 spf=pass (domain: mvista.com, ip: 209.85.210.171, mailfrom: vanusuri@mvista.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-77f5d497692so2134559b3a.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Oct 2025 21:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1760070405; x=1760675205; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=od/lURtTLjshECf6ilgsKuS/Drt5zrc7LdyuidBQcRs=;
        b=gngahgllT37Q/a/jRxMpwsp9XYY9NwkJpQ0a2eZXS0KU9Mpm/xD6XABwoyKDnxLrgF
         2bRkDybrKQSvpIbrllemqq4szuEKtxQANpO8s+Q/YqSjA0HwI5O4HGiaZsZ+TSG13bPf
         neiqluHspS3HuUELSb7/gnx3I5xsJJewNYqy4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760070405; x=1760675205;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=od/lURtTLjshECf6ilgsKuS/Drt5zrc7LdyuidBQcRs=;
        b=skdXYqg4+HVcrXbWGjyFFlUVol3D5cLl2Lg8xWXBYbnfNkiXV4cU7hMT+/328b7hSV
         XbYFwHPMSFpi6/5+7grfiS40gm3nLwdS7K3I2+CzNJzmkVIGZ8MlGvDC6zL4jdJX2hru
         vsihfGtmbU3jM+B8NzQ9MeKUgbrycrjPe6MUyIwVNocf02AtSebdg4DyjpWRg9yFEj4f
         m1qBUU/ErSxoxf/edymuAATC5UuFOAmOKcvEMR281yKyoWScY2B6AoxYyLDKvNCXbu0J
         52/+J/GywNzk4kTJoOxtPC/yV+yMeS30aWuioSlXr4WWsw9Owwt8iuoNsrovZ7ByDONg
         FNPQ==
X-Gm-Message-State: AOJu0YychcTssQhYywkormLLlLb6UhpfHMJnh/nnp1VSjcwA4G301ZC+
	WmOh1nHtL5DTQ7iVl5xmccXOJJKS+W9MAV5JTEONgMDmOvQb9GLYH/Ay4yvyFDCXWuRE4ySYrxd
	B72i2wCI=
X-Gm-Gg: ASbGncsxhhO5b2VoFZWXgxwiKcpwqd3kKd8uor7Y0n57zsykaMAPp/wvNRdfU3dwB2r
	neEmDHV3VmTkpn4jPaxm4MBPjPT7KJz9I9nMNfI27zwp3jH5Hlm31nePFnd9uRS3ij9XM6eEarx
	NMQPr6ltDBSb/tVU33fna9iMbcYw6TddXqJ1+xVtLo5EUB0U2+0ZZ2cjgrSubXk7p5asSlCyXPk
	wvNkQD040gegmjCLToCx4F3PYrWz2fPxrSJIBuQZSDz1qs1XY6XP/S8DwL0E4s2VqH4KZfovmcK
	FQ4mETRMoPJxsCYfPDR6SFhETo3YvkGirSFOIcb7IWXX9bd1PaJzQLOT1NOmPECjcTHgXQfzzwy
	T3oz7Wqt+8rptcWNZTDxEfswYNf5WFVXu1lMoKwyWtoNpAL8x8GAaqB2P
X-Google-Smtp-Source: AGHT+IGXi1UdEnPCR6o/sOVM3HRnNj/dI4t0/NX6BpyoQR/gD+HKld+ucRKWKwIMPuJN4KVcTNUtBQ==
X-Received: by 2002:a05:6a00:c8c:b0:781:19e1:c4c8 with SMTP id d2e1a72fcca58-793858fb48amr10479627b3a.9.1760070405336;
        Thu, 09 Oct 2025 21:26:45 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:8fce:7e18:2b21:4b99:f746:367b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992b63d90asm1393471b3a.24.2025.10.09.21.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 21:26:44 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [oe][meta-oe][scarthgap][PATCH] poppler: Fix CVE-2025-43718
Date: Fri, 10 Oct 2025 09:56:36 +0530
Message-Id: <20251010042636.104137-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Oct 2025 04:26:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120470

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream patch: https://gitlab.freedesktop.org/poppler/poppler/-/commit/f54b815672117c250420787c8c006de98e8c7408

Reference: https://ubuntu.com/security/CVE-2025-43718

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../poppler/poppler/CVE-2025-43718.patch      | 31 +++++++++++++++++++
 .../poppler/poppler_23.04.0.bb                |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta-oe/recipes-support/poppler/poppler/CVE-2025-43718.patch

diff --git a/meta-oe/recipes-support/poppler/poppler/CVE-2025-43718.patch b/meta-oe/recipes-support/poppler/poppler/CVE-2025-43718.patch
new file mode 100644
index 0000000000..dd3b9c8306
--- /dev/null
+++ b/meta-oe/recipes-support/poppler/poppler/CVE-2025-43718.patch
@@ -0,0 +1,31 @@
+From f54b815672117c250420787c8c006de98e8c7408 Mon Sep 17 00:00:00 2001
+From: Albert Astals Cid <aacid@kde.org>
+Date: Wed, 26 Mar 2025 11:26:32 +0100
+Subject: [PATCH] Make sure regex doesn't stack overflow by limiting it
+
+Happens with very long pdfsubver strings when compiled with
+-fno-omit-frame-pointer -mno-omit-leaf-frame-pointer -flto=auto
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/poppler/poppler/-/commit/f54b815672117c250420787c8c006de98e8c7408]
+CVE: CVE-2025-43718
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ poppler/PDFDoc.cc | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/poppler/PDFDoc.cc b/poppler/PDFDoc.cc
+index a7c2e24..a779def 100644
+--- a/poppler/PDFDoc.cc
++++ b/poppler/PDFDoc.cc
+@@ -482,7 +482,7 @@ static PDFSubtypePart pdfPartFromString(PDFSubtype subtype, const std::string &p
+ 
+ static PDFSubtypeConformance pdfConformanceFromString(const std::string &pdfsubver)
+ {
+-    const std::regex regex("PDF/(?:A|X|VT|E|UA)-[[:digit:]]([[:alpha:]]+)");
++    const std::regex regex("PDF/(?:A|X|VT|E|UA)-[[:digit:]]([[:alpha:]]{1,3})");
+     std::smatch match;
+     PDFSubtypeConformance pdfConf = subtypeConfNone;
+ 
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-support/poppler/poppler_23.04.0.bb b/meta-oe/recipes-support/poppler/poppler_23.04.0.bb
index 7a6666936e..c7287f42c5 100644
--- a/meta-oe/recipes-support/poppler/poppler_23.04.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_23.04.0.bb
@@ -19,6 +19,7 @@ SRC_URI = "http://poppler.freedesktop.org/${BP}.tar.xz \
            file://CVE-2025-52886-0001.patch \
            file://CVE-2025-52886-0002.patch \
            file://CVE-2025-50420.patch \
+           file://CVE-2025-43718.patch \
            "
 SRC_URI[sha256sum] = "b6d893dc7dcd4138b9e9df59a13c59695e50e80dc5c2cacee0674670693951a1"
 
-- 
2.25.1


