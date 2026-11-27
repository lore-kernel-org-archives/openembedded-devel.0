Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10333.1795753001276369532
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 20:16:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=sapSylCO;
 spf=pass (domain: gmail.com, ip: 74.125.82.41, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1b546061d58so17750595c88.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 20:16:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795753001; x=1796357801; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xbVJOv041jQktbqPd5PqooVKAxubsDVtDBDXto6uTnE=;
        b=sapSylCOC6ntUyu5/H4anQ1tWGvao5k14zyR1LAoVC4KSVxqcD/tH6xKVAFjDfjGwI
         wYQwWI7UvhIumtF/H+wR19JbUSKTsr47Y23WqMUyJUSSNbo/l+BnKFJE9AYo9b97I1II
         P2nb+164CgMt8dSwSEcqWxvKTL4t2HXCoxSNfRNYQH31WuoMENmzEZPqMBiqtqVKlodu
         X+xqT4wyBQRmmhhSPke8T75J8+g1gZHMBtVUtSit7Zbx1yk60tIlQi9lekzixdENdwAR
         enc8k0GE0KXUn1WEwQ4y6C849zxYC2UHb0ppEYR9CVFI8lbCFW8GmH+/x4e90gUynyd2
         6Oag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795753001; x=1796357801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xbVJOv041jQktbqPd5PqooVKAxubsDVtDBDXto6uTnE=;
        b=TYb80pO6kABV2Kmz1Ut/tnkYBitOVPuvKq5FrLEz602Qh68ZTsFh6Ax2+rN3Bj8MMw
         KNyan5dJ7h1vkh74Bwf0NiBbn/GjAm9yFzcu37kIHpHcUgFaaaUN0tO8NGkmBdOkggqk
         +in+4WREfX2LjYpwrk1E/5blj0PoUzcqN+ZFoF/I3KYZ6B0UKJJgtHh5DPvyVBYBS/MZ
         cxNXY0MaLZR01w3OXm3Quwvw8/Q1ZCHtW+95jHfoCKw2BP7861krUqYzXRuyKvCFVA29
         kLgcS+RvQw9EVPkXlnJg19uvZVda+FM9P+ACL0M7KBpJz8bgT4NKFTe5lBVXJuO2aCnR
         vPfA==
X-Gm-Message-State: APuU4Z969lNV2AtRN7iiEvAxkRR3kjozkAYp3x14gcdpv8HyePLaQX1o
	JVtOuI7jI3muxQ66ssofBhUbxtoe2ODGEm2/FMeB9epBDnnUjLqmk7RypjQyCPOd
X-Gm-Gg: AZFdTZfe8pwaROS8Oo5K2ZuH+SWsPHyJLEACD4J1YBW6Jj7nVnAbgGO/iNQik2QeaT8
	ujqYQvpRb1Za22UJfBzXMWGoeXRz09vQRCw7mFyb4QQrrBPvnjJ6/zQFZYDFqwMS7IKJUugIqXp
	9W2HLqzsMbPPbvgbbIqkg4zFbdnF+UjTZUbnmx+TALGgH4CwPIg05AppG9U3uXDu3ppNHffwjZY
	QucNx7vl258oW+4ShccVP8BuD1aUJZi+zN8c2TzL5d81uGcRlyVeKIHVsP4t83qn0FFisIUHLW6
	zMTaqfobXiLVsTGmg0hK2odoVovgQzL4+miDkezWW4c67zBxKklaTQHXSxaspaVRbydjntcL+rs
	Wusuf2PdijPX+vEQqfxmsaTKUo3jUMfw6hsSvoIXiH2M+mozCf06UIsm/RpBTu8xeF3q8ZQMBAX
	wKq0f0tZreHFJwbe5luRBTNAHVnhLEdhkzuLan336Hxo60Q+TgtXFE+fzy3Ng1JUchfd18NmSad
	VO4tYqsEoCdcUurgm3A+ipfsVwGCE3ocszBT374E9X/0rLKK3SJYqU9tncsfuHNxak5+ps41RzS
	zEqrVvK8pgasa4lzB++UWdNigWEP2SsX17WNo3B9ktUzExfx7H5Fxyx5mRK9MGX89zbkjuxFFbh
	/kh/ihVGi5wVgimorwTkBT5M5pXZErINeBg6e3mp/YMCI0k169bmRJJuvGj/XEGRmazkT94lW4o
	/Cy8VMkcigobHrS6ZvpgfXSBa+wKfQCXlsPhrkJ2XhFjA3UO28eW7H5mh7qxZGi1bDNLYJwMdxx
	uJZ4a+yb9Q709ZBOjdhJOc869sI4jmnUC15M99AJoDmuCBhUzqnBfPytZA3Mc1IXj2A1mXfWOZU
	T8JEEg==
X-Received: by 2002:a05:7022:ea8d:b0:1b2:6cba:7f48 with SMTP id a92af1059eb24-1b5568f6f77mr23990723c88.31.1795753000536;
        Thu, 26 Nov 2026 20:16:40 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c1142sm52062757c88.2.2026.11.26.20.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:16:40 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 21/32] python3-types-python-dateutil: upgrade 2.9.0.20261116 -> 2.9.0.20261122
Date: Thu, 26 Nov 2026 20:16:03 -0800
Message-ID: <20261127041614.1775064-22-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127041614.1775064-1-khem.raj@oss.qualcomm.com>
References: <20261127041614.1775064-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 04:16:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133240
Content-Type: text/plain; charset="utf-8"

Updated typeshed stubs for python-dateutil (typeshed commit 567e5e3e);
only packaging metadata and tool versions changed in the sdist.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...61116.bb => python3-types-python-dateutil_2.9.0.20261122.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-types-python-dateutil_2.9.0.20261116.bb => python3-types-python-dateutil_2.9.0.20261122.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-types-python-dateutil_2.9.0.20261116.bb b/meta-python/recipes-devtools/python/python3-types-python-dateutil_2.9.0.20261122.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-types-python-dateutil_2.9.0.20261116.bb
rename to meta-python/recipes-devtools/python/python3-types-python-dateutil_2.9.0.20261122.bb
index 17695de116..4fceb0cbc2 100644
--- a/meta-python/recipes-devtools/python/python3-types-python-dateutil_2.9.0.20261116.bb
+++ b/meta-python/recipes-devtools/python/python3-types-python-dateutil_2.9.0.20261122.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/python/typeshed"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=320eb2c24b8d2e890b6800000ce9352c"
 
-SRC_URI[sha256sum] = "4213748a3f699431a83edf71969de9caa79d0846a5e8785c8a49072ff1968613"
+SRC_URI[sha256sum] = "1db0012e9e63028891e36fd8a9f685dc4e8cf89353fbefcf6b1eb55538e9f7ed"
 
 inherit pypi python_setuptools_build_meta
 
