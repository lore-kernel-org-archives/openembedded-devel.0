Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1B9BC79F9E
	for <webhook@archiver.kernel.org>; Tue,  8 Sep 2026 17:14:08 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.486.1788887639512762436
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Sep 2026 10:13:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=sLl0to3q;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38dfe7eb825so3956744a91.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Sep 2026 10:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788887639; x=1789492439; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TO9LQGS56DQcjeZGFTc0jObO6sMz2y1n02U5i4AwqqA=;
        b=sLl0to3qj9C2fh5kHAGq7scO48wOsTbPYDIgXUIMtuitjRoCNMRmw4V4Yr90rer0nF
         diiALUndj69Mj1oYnJt+UNstjTtVDApn1CabhLdMUCUfjtITyUtXcJN3t9zHHuVP06BD
         xSgPj2M8MarkwRv8Sk75pKY7yu0Tz2CTNHDABbr1crrts8RUsLph3Iai5QtkMZ56YLTT
         7B7PPVUdAs8120fEwLP4JGSxz4+VJ1Jj+c0/CT2hkCZFQF8mJU0UXMhjYRzVIsk1+kyU
         sAeQf9+TJluPGziIB+KAvZiMkaGmXEevDDUQXUvgkOEC3KZG3b4W15jQkUEwxD9Up+Zc
         +Nzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788887639; x=1789492439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TO9LQGS56DQcjeZGFTc0jObO6sMz2y1n02U5i4AwqqA=;
        b=W7MzPW80S4/+2V6a9glfVE0asQDuPNcgnMu/nTtL2OkJEtiI+k5PrNOpu3Fqt77jNA
         8BT0iAyLkDva2yyWVjzrc1J+XxPsqvpvPEkoY5NDGK2BPnFYoVBc98kUuW8EO9MqETRn
         kWhMdxLGwDAABjMqC1Fp1iIbqkpzBlVMV2rJulxtCaN/IQfDaC2d36ah42OYn8XgCQ5O
         eH68uv1nfU/RH8EbKchDPgSqghKHZUzcCCEogT9mmpJb8fl7pmjrKkFmfFa27r4NT0cy
         Ofz5XLgVGqALkRF2EHTfmzcPmZCE+CeN4lYpwRDHUBNf5wgtZAVnCm8Rx63IckyU5QR7
         hOOw==
X-Gm-Message-State: AFuF++lhAK61EJvm1LeC0Ba5jJYdmJLxgjE0JMwK3f10VXgS9++t63TR
	NLXqw6eTWl276lmp1uhDKib2Ohn7lHJrwt6tvz8q6JD/BZahz9cvUMKvrC7tWQ==
X-Gm-Gg: AYBFou12PdbgKeKEAxM5FYOBe9hZ2e5J3sb5SEWHSl8ZacxiGKD8LHLxGSEQ31kYvfu
	GOtosCtp457QY/lwhZPLkoQJ+DQvIxHTsB4wNpB8NVsRrKU5InTd0oNHZvNzhWodjxXHCnE0JAf
	XLVk/qfNhxrq2LVKFS2UwOqR8SN95T5lCZLWdex6jsenu7e2Wrs7w75J6zqfLTJmGNm0SaA49DV
	KnlejEfXNEXcmgu+pOWW8CCpJ/jyGwAJLyAMKIajTU7/lFlkuqf2FqCqUXLK1RejLF0hhckHBLp
	/gTKondK0fWP2olev2YFY9GG7YBId5vIwL2PpT88IJF+o5ubHdlIdREsPeyNmze6HW9LNNxMft9
	nlWOlhYZGncL1KdH9NoIEcm7fN72rDRsaUtORzWWw+CaAME3mAD12ma4r38rKa9Q8E6AFhNtE4+
	LrK9e4XwKOZ3FmQJJecJaWEbGQV3JT8LoJXRjLdlgzXa5g+R+ttzQWnhUCtrrt3cCSBPS2AiXAo
	BvZdKSRLfwio08OX6hCRe6Yl/T9J6m8BGWib3ZJ1x+IWtTp5WUYne2I/CzQmaxqun5C8H1vRjlQ
	X5iOCMiSojSlxxau3BB/IySXlY1xIswBFHD+T8h04Qneh0EB4EtmV2iB7Vu1nl+JmioQCUpKnSz
	AJim8ilaxwTiq9RaWKpMLALd/0aVhltWv6+x7smtDGug4ug==
X-Received: by 2002:a17:90b:4fca:b0:38e:5b59:c2ff with SMTP id 98e67ed59e1d1-39b260dd278mr44799376a91.3.1788887638589;
        Tue, 08 Sep 2026 10:13:58 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1433171a97esm39566297c88.12.2026.09.08.10.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 10:13:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 2/6] pcapplusplus: Fix build with clang-23
Date: Tue,  8 Sep 2026 10:13:49 -0700
Message-ID: <20260908171353.701307-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260908171353.701307-1-khem.raj@oss.qualcomm.com>
References: <20260908171353.701307-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Sep 2026 17:14:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129867

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...lign-template-inline-instead-of-stat.patch | 34 +++++++++++++++++++
 .../pcapplusplus/pcapplusplus_26.07.bb        |  3 +-
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus/0001-Common-declare-align-template-inline-instead-of-stat.patch

diff --git a/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus/0001-Common-declare-align-template-inline-instead-of-stat.patch b/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus/0001-Common-declare-align-template-inline-instead-of-stat.patch
new file mode 100644
index 0000000000..e796b6e35d
--- /dev/null
+++ b/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus/0001-Common-declare-align-template-inline-instead-of-stat.patch
@@ -0,0 +1,34 @@
+From fe044dbd8459924558c0965833b8f1e78c8921ea Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 8 Sep 2026 02:16:00 +0000
+Subject: [PATCH] Common++: declare align() template inline instead of static
+
+Newer clang (23+) enables -Wunused-template for namespace-scope static
+function templates defined in headers, which fails the -Werror build for
+every translation unit that includes GeneralUtils.h without using
+align():
+
+  Common++/header/GeneralUtils.h:50:38: error: unused function template 'align' [-Werror,-Wunused-template]
+
+Declare it inline instead; that is the correct linkage for a template
+defined in a header and does not trigger the warning.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ Common++/header/GeneralUtils.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Common++/header/GeneralUtils.h b/Common++/header/GeneralUtils.h
+index 060acb4c..ba5428d6 100644
+--- a/Common++/header/GeneralUtils.h
++++ b/Common++/header/GeneralUtils.h
+@@ -47,7 +47,7 @@ namespace pcpp
+ 	/// Calculates alignment.
+ 	/// @param[in] number Given number
+ 	/// @return The aligned number
+-	template <int alignment> static int align(int number)
++	template <int alignment> inline int align(int number)
+ 	{
+ 		// Only works for alignment with power of 2
+ 		constexpr bool isPowerOfTwo = alignment && ((alignment & (alignment - 1)) == 0);
diff --git a/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus_26.07.bb b/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus_26.07.bb
index 948a694a8c..eff0b75072 100644
--- a/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus_26.07.bb
+++ b/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus_26.07.bb
@@ -7,7 +7,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=911690f51af322440237a253d695d19f"
 
 DEPENDS = "libpcap"
 
-SRC_URI = "git://github.com/seladb/PcapPlusPlus.git;protocol=https;branch=master;tag=v${PV}"
+SRC_URI = "git://github.com/seladb/PcapPlusPlus.git;protocol=https;branch=master;tag=v${PV} \
+           file://0001-Common-declare-align-template-inline-instead-of-stat.patch"
 SRCREV = "0dbbb9c75eb232135f13fdb794318c4da3270ebc"
 
 

