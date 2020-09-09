Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web12.9356.1599641163529826947
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Sep 2020 01:46:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@blade-group.com header.s=google header.b=hzCPgMwS;
 spf=pass (domain: blade-group.com, ip: 209.85.221.54, mailfrom: yann.dirson@blade-group.com)
Received: by mail-wr1-f54.google.com with SMTP id z4so2022155wrr.4
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Sep 2020 01:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blade-group.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bbd94GrZR4VCSF2OzfTvaC3pivCnP2J8dF7XEnK39MM=;
        b=hzCPgMwS0Cuavsl/IcxpTFyWzXMaEPJkvUo0s4iCQNyT9rx+lDQnPkNE2Kicc2gDmW
         5/IlC3+qhoLYmoYSOVJLDznXpzakK1jO21iIePAdSEuNW/MwBlXUTLToDbbYOG8P5SNh
         DYQ4d/5JS6Prjw4dOCIeEA8S+0lbn1XkEtMX5YHC3Il0E8HbxLa8hckWo/nfcTkLf+LR
         BWo7OxlAeY820ALsPgMnaWbcXsIFV7HeN5wphgupNMeS4qezMaaUM9fyirwhvHRfp9wV
         GbFIAGB+UbmagX03eMS58cgIkNrqlrCR1Q0+zJwwEkUF+wrhUhwQj5z7fULI2+PaOUu6
         Bg3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bbd94GrZR4VCSF2OzfTvaC3pivCnP2J8dF7XEnK39MM=;
        b=ZNm9lxS5EZthWVPnZHnAQJk1DYn0JZp3G1ghjmElUDs+ot5bvS+/Pvn3BpXCFcPAiB
         XkunuVwGK1iPy+60gu+c7tmYHbGkmv6lX2Rxk6ftya1Do4G1b9KzPuamQxbPie6AdjFw
         SC7GKzwdxucAcooEgew41kwA46VP/8J70+LRtlyPQEn35zsBGQKqROe2Imyvo2EOqLAT
         PNLNBJt1m1iiHWBYx3p7IKXpYyFsCJnYxv6+FWCvBjvTdG1aMUwvYr7EDQwNZUWlSk8y
         tfQrAMyolm9YcQMkkG2Jkar0WCOpMlQAQiflGaQAW8HOrVu+OjDRTUTBEU1pye2nGMB9
         wi7A==
X-Gm-Message-State: AOAM532xcuOycUABrT074BhjfEAnSqG5z0KufHQiXkj6VLrFJDK1D+U5
	73+ctJy904Uay8UkwB3QmTHbF+aiCvOw0/UE
X-Google-Smtp-Source: ABdhPJzx5DPDkGPtJDRmeCIL3o+P8v5C69RjbWNoxo9ZDbX0QmxP/b+82sN7Y4c9G3qjc3xfjyhvQw==
X-Received: by 2002:a5d:43cf:: with SMTP id v15mr2934691wrr.149.1599641161734;
        Wed, 09 Sep 2020 01:46:01 -0700 (PDT)
Return-Path: <yann.dirson@blade-group.com>
Received: from blanquette.lan ([88.120.44.86])
        by smtp.gmail.com with ESMTPSA id y1sm2816452wmi.36.2020.09.09.01.46.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2020 01:46:01 -0700 (PDT)
From: "Yann Dirson" <yann.dirson@blade-group.com>
X-Google-Original-From: yann@blade-group.com
To: openembedded-devel@lists.openembedded.org
Cc: Yann Dirson <yann@blade-group.com>
Subject: [meta-oe][patch 4/4] libcec: split the python example into a separate package
Date: Wed,  9 Sep 2020 10:45:40 +0200
Message-Id: <20200909084540.178949-4-yann@blade-group.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200909084540.178949-1-yann@blade-group.com>
References: <20200909084540.178949-1-yann@blade-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yann Dirson <yann@blade-group.com>

It does not provide more functionality than the C-based examples, so
is of little value on a target except for checking the python module
is working.

Signed-off-by: Yann Dirson <yann@blade-group.com>
---
 meta-oe/recipes-extended/libcec/libcec_6.0.2.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-extended/libcec/libcec_6.0.2.bb b/meta-oe/recipes-extended/libcec/libcec_6.0.2.bb
index f55801c39..48be1fdac 100644
--- a/meta-oe/recipes-extended/libcec/libcec_6.0.2.bb
+++ b/meta-oe/recipes-extended/libcec/libcec_6.0.2.bb
@@ -24,10 +24,11 @@ inherit cmake pkgconfig
 PLATFORM_CMAKE_FLAGS ?= "-DHAVE_LINUX_API=1 -DHAVE_RPI_API=0"
 EXTRA_OECMAKE += "${PLATFORM_CMAKE_FLAGS}"
 
-# Put client examples into a separate package
-PACKAGE_BEFORE_PN += "${PN}-examples"
+# Put client examples into separate packages
+PACKAGE_BEFORE_PN += "${PN}-examples-python ${PN}-examples"
+FILES_${PN}-examples-python = "${bindir}/py*"
 FILES_${PN}-examples = "${bindir}"
-RDEPENDS_${PN}-examples = "python3-${BPN} python3-core"
+RDEPENDS_${PN}-examples-python = "python3-${BPN} python3-core"
 
 # Create the wrapper for python3
 PACKAGES += "python3-${BPN}"
-- 
2.28.0

