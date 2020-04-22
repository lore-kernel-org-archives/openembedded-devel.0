Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web10.1161.1587586016982299631
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Apr 2020 13:06:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@izotope.com header.s=google header.b=LkNbZQru;
 spf=permerror, err=parse error for token &{10 18 _spf.google.com}: limit exceeded (domain: izotope.com, ip: 209.85.222.169, mailfrom: mcampbell@izotope.com)
Received: by mail-qk1-f169.google.com with SMTP id t3so3905006qkg.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Apr 2020 13:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=izotope.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1gpeSS+NVtYRWuj49mqul1+PurEr/gA3XMe6oYQwGBc=;
        b=LkNbZQru/p/w/rIfJ/sPb1/GQ7PcyFxeOMWXUmdSHiWYYToWTxNcKlFA6WlyFUdlfm
         CYsFJBss5BksUJQriG1ib0aE2GPMBM8Esfsk6ZEfjUJHCBFLCJVE6PQ9WbiayW3BzhFn
         E60USuujbOHqbW3WSRm6TmUGifjo8AKsuvsqw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1gpeSS+NVtYRWuj49mqul1+PurEr/gA3XMe6oYQwGBc=;
        b=PjU68uYL22qfJR+PYdERY9QnNnBbbA4HntzXqCkSkZKCeqP3A9LokOJ0dGOQ5yTUHJ
         UvljJSQVTekv5o1S+ONbL54/jQIMnJ5tkvhLEbqIVNQZSn1EzHMPDomQKadU2Zo4tpcw
         AeKGZg2BY57mHKjmwi+ImL2E4Cr+RS/kxL8P+W8yEKhl6LIaduBjG3ymQ02TOBJdTBTM
         Wm3GHEZPXw0reTxzsrzUXX1DlRsY9u2+Ft8+k2PJbpRK0hz9bsw7R1SwJJiAW5WgeZcJ
         VE3rI8vWLISQClYbmChS0HlanSMYeBtO/UjCmatpOJxywzQUuUBh8CSVvpyf0oGi08tM
         QB3A==
X-Gm-Message-State: AGi0PuZsJP2zVO/k5Z/KXzB8fcv38XdL3uAqyEXOmgHsYiuzHwfxqaqC
	gbNMq1rVic4Qy1fSpnHRARSzc1YgdaZyKw==
X-Google-Smtp-Source: APiQypIizenB01yHkVVDTzwyKtPZvSZmXK+gpCwezggtwtEWXC97wcbzG12EY4UTXXKeMN9Tcmpgig==
X-Received: by 2002:a37:5907:: with SMTP id n7mr28985828qkb.227.1587586015601;
        Wed, 22 Apr 2020 13:06:55 -0700 (PDT)
Return-Path: <mcampbell@izotope.com>
Received: from ubuntu.localdomain (146-115-73-63.s5181.c3-0.arl-cbr1.sbo-arl.ma.cable.rcncustomer.com. [146.115.73.63])
        by smtp.gmail.com with ESMTPSA id q6sm192069qtd.61.2020.04.22.13.06.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2020 13:06:54 -0700 (PDT)
From: "Matt Campbell" <Mcampbell@izotope.com>
To: openembedded-devel@lists.openembedded.org
Cc: Matthew Campbell <mcampbell@izotope.com>
Subject: [meta-oe][PATCH v2] sdbus-c++-tools: add nativesdk
Date: Wed, 22 Apr 2020 16:06:31 -0400
Message-Id: <20200422200630.79513-1-mcampbell@izotope.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes from v1:
Fix formatting of patch

Signed-off-by: Matthew Campbell <mcampbell@izotope.com>
---
 ...bus-c++-tools-native_0.8.1.bb => sdbus-c++-tools_0.8.1.bb} | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta-oe/recipes-core/sdbus-c++/{sdbus-c++-tools-native_0.8.1.bb => sdbus-c++-tools_0.8.1.bb} (89%)

diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools-native_0.8.1.bb b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools_0.8.1.bb
similarity index 89%
rename from meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools-native_0.8.1.bb
rename to meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools_0.8.1.bb
index e18b9903d..9eaec0f2a 100644
--- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools-native_0.8.1.bb
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools_0.8.1.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "Native interface code generator for development with sdbus-c++"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://${S}/COPYING;md5=1803fa9c2c3ce8cb06b4861d75310742"
 
-inherit cmake native
+inherit cmake
 
 DEPENDS += "expat"
 
@@ -12,3 +12,5 @@ SRCREV = "3a4f343fb924650e7639660efa5f143961162044"
 SRC_URI = "git://github.com/Kistler-Group/sdbus-cpp.git;protocol=https;branch=master;subpath=tools"
 
 S = "${WORKDIR}/tools"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.20.1

