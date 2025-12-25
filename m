Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF815E7AD62
	for <webhook@archiver.kernel.org>; Thu, 25 Dec 2025 15:57:11 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.139902.1766678230747200822
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Dec 2025 07:57:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KuEHorXF;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47d493a9b96so176425e9.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 Dec 2025 07:57:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766678229; x=1767283029; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=jgLYwjC1+lk25iGbkH+qSFmhn2qZF1KgEBXBPPLdwEE=;
        b=KuEHorXFBYH1jsPAYv58Kw7GBWf7THebP15BCWMrvLQDZjHfhT5htPbMThvOKmGxRV
         ez0mHn3PF7nmbc9QGlBCvPFxuzETNyfqAJ2CAnbucOJmZgIbgtHCu1608G17344t7dra
         r3Wvx31CJ7HIMIDRgXgcNxy5glVqkdoBCVAItOnAPQj/lp+5KJ3x2Pz5gEh2Ef7vUZZ2
         BVxm2JpwtHIfqvkkLSsbtdvsHDrBEK9V4pL3xvm/wz/UsBXY4M1hmCV9pOjS2P3WQ9Cx
         avpcBExBxywYUtVAqqbJbLh3VScAAGebuRsVy6sTLPHOhG8MLFe+Zz1wCOkNfSV4KkZr
         ARrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766678229; x=1767283029;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jgLYwjC1+lk25iGbkH+qSFmhn2qZF1KgEBXBPPLdwEE=;
        b=AuO/weZHOl5a9/VSpqJH9X+RjSR4yxA7njBwgUIlG0ajdF11Jdo4hrjgr2nSxtztMI
         CH2K77mOilzZp9lT8Tr0NLn07eIa/hmxr0Fu/PXtZvRqWzz4ctk6Rya0fdqhloE31Oi7
         szEnAfn6d+GtGccpNRJTmOHdbJL5lQAPbZrkEPjblWUmjvrZ2GKkzxtvZ8BNrzJJI7Y5
         9MdyT0qwLQbGVlQFnuNV7OwlDTK2mYfFY3ROg4LUwWXdiPv+HvsWVKXpzhHy22LL0Lde
         HYiR+XIiwmddP5Pt1yplAhOM6rIunlNPY3ESDPUZ8lq3p3NpXvm+RX6flVVK7PH5GI5L
         o1EQ==
X-Gm-Message-State: AOJu0YwcVK4f2iIrhVYe/HZDG0ZFoSA7KuMLjNDqY0QNCpuZe/D0KSXw
	STV9n2XGQ60Fu/g22y1NSSbf8uc8sfKb8Xic2Ziwqv9k2ibhIGvMl9xEZApcnA==
X-Gm-Gg: AY/fxX4AeDiahfARG7Hc6jdcGAZPO7t2q9g9ATgNxL5fG4/5bMKItKl2ZkKM7TUbiC4
	/0vLcSp+dzs3+n9jSXPDqvNM8wiBnw+8MUH9h4BpBf1RIttHBOidSbPp4x97vmhXPyVHFOFDXKr
	CU3A6FO2brnhA32gaksm5Jcnd5xhV78ytJMxjl7O8VP4vrBrxw+/+ONZpWjagoCaRQrvZxI3Cny
	t3Feh4Lga11qLvzQs46H4AjXKn8Ih49M7st73rq7MX0CORMZ7H0gHXiVK0RMU9SdWnLr16bi/IJ
	zg8BK3JaOMG5TnLJI7utByXUUuL51O2VhzP4FokfngOQWiBszRCKULb0aSOeVBNVFsYNXMwLzMj
	6bHhGRJ4gFkKh+4e1X9AnOcse4xzu9gnrxwyIxwcsTCV7lXBGMLYc5/z0A73PHB5VyU9G/4Qc9f
	2wDJPK9HTe
X-Google-Smtp-Source: AGHT+IEW1GzDEpAZO8RbU5Us5u+PUBFuRfXmaO0L08kxJLfdrh0erIc3v71QRrBRVCkb3AKJlyiGoA==
X-Received: by 2002:a05:600c:818f:b0:477:7b16:5f77 with SMTP id 5b1f17b1804b1-47d19538725mr221276365e9.3.1766678228977;
        Thu, 25 Dec 2025 07:57:08 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be279d6d8sm401251745e9.10.2025.12.25.07.57.08
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Dec 2025 07:57:08 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH] hunspell: patch CVE-2019-16707
Date: Thu, 25 Dec 2025 16:57:07 +0100
Message-ID: <20251225155707.3027357-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Dec 2025 15:57:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122926

Details: https://nvd.nist.gov/vuln/detail/CVE-2019-16707

Pick the patch that resolves the Github issue[1] that tracked
this vulnerability.

[1]: https://github.com/hunspell/hunspell/issues/624

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../hunspell/hunspell/CVE-2019-16707.patch    | 25 +++++++++++++++++++
 .../hunspell/hunspell_1.7.0.bb                |  4 ++-
 2 files changed, 28 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/hunspell/hunspell/CVE-2019-16707.patch

diff --git a/meta-oe/recipes-support/hunspell/hunspell/CVE-2019-16707.patch b/meta-oe/recipes-support/hunspell/hunspell/CVE-2019-16707.patch
new file mode 100644
index 0000000000..d3a95dadf2
--- /dev/null
+++ b/meta-oe/recipes-support/hunspell/hunspell/CVE-2019-16707.patch
@@ -0,0 +1,25 @@
+From ded6e233588c1082db9d84dc57a9d200cd306b26 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Caol=C3=A1n=20McNamara?= <caolanm@redhat.com>
+Date: Tue, 12 Nov 2019 20:03:15 +0000
+Subject: [PATCH] invalid read memory access #624
+
+CVE: CVE-2019-16707
+Upstream-Status: Backport [https://github.com/hunspell/hunspell/commit/ac938e2ecb48ab4dd21298126c7921689d60571b]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/hunspell/suggestmgr.cxx | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/hunspell/suggestmgr.cxx b/src/hunspell/suggestmgr.cxx
+index dba084e..c23f165 100644
+--- a/src/hunspell/suggestmgr.cxx
++++ b/src/hunspell/suggestmgr.cxx
+@@ -2040,7 +2040,7 @@ int SuggestMgr::leftcommonsubstring(
+   int l2 = su2.size();
+   // decapitalize dictionary word
+   if (complexprefixes) {
+-    if (su1[l1 - 1] == su2[l2 - 1])
++    if (l1 && l2 && su1[l1 - 1] == su2[l2 - 1])
+       return 1;
+   } else {
+     unsigned short idx = su2.empty() ? 0 : (su2[0].h << 8) + su2[0].l;
diff --git a/meta-oe/recipes-support/hunspell/hunspell_1.7.0.bb b/meta-oe/recipes-support/hunspell/hunspell_1.7.0.bb
index 8d4dd5254e..c1a1585d99 100644
--- a/meta-oe/recipes-support/hunspell/hunspell_1.7.0.bb
+++ b/meta-oe/recipes-support/hunspell/hunspell_1.7.0.bb
@@ -7,7 +7,9 @@ LIC_FILES_CHKSUM = " \
 "
 
 SRCREV = "4ddd8ed5ca6484b930b111aec50c2750a6119a0f"
-SRC_URI = "git://github.com/${BPN}/${BPN}.git;branch=master;protocol=https"
+SRC_URI = "git://github.com/${BPN}/${BPN}.git;branch=master;protocol=https \
+           file://CVE-2019-16707.patch \
+           "
 
 S = "${WORKDIR}/git"
 

