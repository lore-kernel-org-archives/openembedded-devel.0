Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0569C79FAC
	for <webhook@archiver.kernel.org>; Tue,  8 Sep 2026 02:08:07 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.525.1788833281616836291
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Sep 2026 19:08:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=RnNz4piN;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38ea87caafeso3280009a91.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Sep 2026 19:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788833281; x=1789438081; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UdUAch8b6daIrNIEI68Eee+H3eZtjb7LAOqRHLnqwbs=;
        b=RnNz4piN8gimQH4rQBBDHbo1xpoLg2mGRIVJW0vD7k7KEHG/S5R1v6wKs0o8s9to6T
         2w1QbaTgxNnAdnHBqfVKiZswC7Rcc/549R2TRxucP0aSad7a0KaDAyCHtwNJ+HqcQui9
         5EVy1OD6bDso1NclC0F5f0QJawjRY5CJkwIdY65zUfUEoAnI9Dz1RpLPZFC1HvCKVHrN
         sCM4TuCJUMCwV+wXr+MWs3kzZ20AsiBpVL9y5TC7UgVZEEHMrtO7gNt+fmFVSJEuTty7
         b0k57Z9UPhC6hBiocJ4vZqV8V1n11Qlo9zkrLYaFLIx/vLNsz/N4XNwq+5V5zQGldGRj
         211A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788833281; x=1789438081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UdUAch8b6daIrNIEI68Eee+H3eZtjb7LAOqRHLnqwbs=;
        b=s5deDiVrpCUiApc8PT4KGBmHziV7zowhBlDVs/tPddtdlc4sfqlf40L5GlI2pCqsc9
         Jau0pKzz8SnMrW8+LgUwZ6n1QUZRGuFiJx9QSmojCATD6HedizZ4c5H8t4XxX0aJEt4d
         1XlnK/FIcyQADRA08YGBYCSqJwZvu0wBeAE5vFTPQApa48SqxFMyTQQPOanLpqSWjbBH
         /GtiDeUupWtG/WB0L9Q12y5x5eGXOAdg23Tzl1z2SLeFVQltPDk1O/ozgO91XLocYNb+
         GpknSxctlC9g2bf4//jIr3dGU0qwLG54PeFY0R2ZwieSe3vd2IonvVDQuYittB9/REEw
         ABMw==
X-Gm-Message-State: AFuF++kziMpDt67ehHEQI8Z982nctqoLq1RHMlsB7ymbIjnkkdXtNZuD
	G+V2pUQf+HHdgM3cvo0LbaxVAK1QbzMIlQyY0CQzae1cHbvwgFOqkjCs9xs5rQ==
X-Gm-Gg: AYBFou1t8yZKdm3ElGzjAGL/2scotsejlX2QqAPYyvxjp61DIy1pIDQ/6HCwbQc2S38
	AuXq8qFXQEtVklTcEhbmygDyUUbvE90LxPCHtsYdvb469Yucv12mIgqCon8CQ7EL8l5YIzrqB+c
	W8EA3nxTnK7J3cAr6qYncOXZmaPsXRt9+5U3xTHR/JiuLW31G7+hl5ZJQIchZ0qqC2Wj/25LUKD
	r+Im/4u+xvXWxsaRNuJHsdMTqbKyvaM5aD/laRSpTp1ZkOx4jL4VzhAOFib5sEmRENry9k6aVkl
	idaEWD/IxeDyFK5Ig+24xVSBFMZSsZGRcAO/ILw1J10hTuEc2adfM1Rap3W2D//z3DbxLBFvAGn
	iiP3VGRQ2SkYORvihBkjQWUQCkkoo9BZNhcDSSQiv8GkLUctsFcUVLUI7YrZSfkmFv1OI2SsjYR
	j3jd8qv9lCrep8/Pz7TfwXkbgYD11bxv4uFfgedquG1UzMol3uhxJOwqVnhP6Lu4hL2o0bkQtAY
	54mJx/CZahQnIPIo6yFRqJg1LKW6K0SCj7lM4l5S95/scygfjwPhikoBezGtCd2Zi8CMOHadCCZ
	Ik8q5kluIPHCMrtRV/RevLpg1km5HS1yDEPh9PrueEK+WyURpx7Oy76oyUYGjM1xNStkpBbuCyu
	2rvrEcSuhI0H4QYuoaeZi0w5d4Hr7ijqnE+QreY5QvvBQbAY=
X-Received: by 2002:a17:90b:2f87:b0:38e:250b:122f with SMTP id 98e67ed59e1d1-39b261e75femr39268134a91.16.1788833280827;
        Mon, 07 Sep 2026 19:08:00 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33688cfc714sm14044803eec.20.2026.09.07.19.07.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 19:07:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-multimedia][PATCH 4/6] libcamera: Fix build with clang 23
Date: Mon,  7 Sep 2026 19:07:50 -0700
Message-ID: <20260908020752.2748681-4-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260908020752.2748681-1-khem.raj@oss.qualcomm.com>
References: <20260908020752.2748681-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Sep 2026 02:08:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129852

clang 23 enables -Wunused-template as part of -Wall (via -Wmost ->
-Wunused), where previously neither -Wall nor -Wextra turned it on.
libcamera builds with -Werror, so this now breaks the build:

  In file included from include/libcamera/ipa/core_ipa_serializer.h:18:
  include/libcamera/internal/ipa_data_serializer.h:57:3: error: unused
      function template 'readPOD' [-Werror,-Wunused-template]
     57 | T readPOD(std::vector<uint8_t> &vec, size_t pos)
        |   ^~~~~~~

The POD helpers sit in an anonymous namespace, so they have internal
linkage and clang diagnoses them per translation unit. appendPOD() and
the iterator overload of readPOD() are referenced by the
IPADataSerializer specialisations in the header itself, so they count as
used everywhere. The std::vector overload of readPOD() is not: nothing
in libcamera calls it, its only callers are the IPA proxies and proxy
workers generated at build time from the mojom templates. So it is
genuinely unused in every translation unit that is not generated proxy
code, which is what [[maybe_unused]] exists for.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...er-Mark-vector-readPOD-overload-as-m.patch | 65 +++++++++++++++++++
 .../libcamera/libcamera_0.7.2.bb              |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-ipa_data_serializer-Mark-vector-readPOD-overload-as-m.patch

diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-ipa_data_serializer-Mark-vector-readPOD-overload-as-m.patch b/meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-ipa_data_serializer-Mark-vector-readPOD-overload-as-m.patch
new file mode 100644
index 0000000000..4cb8c47050
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-ipa_data_serializer-Mark-vector-readPOD-overload-as-m.patch
@@ -0,0 +1,65 @@
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Sun, 6 Sep 2026 22:40:00 -0700
+Subject: [PATCH] ipa_data_serializer: Mark vector readPOD() overload as
+ maybe_unused
+
+clang 23 enables -Wunused-template as part of -Wall (via -Wmost ->
+-Wunused; it was not enabled by -Wall or -Wextra before). Combined with
+libcamera's -Werror this breaks the build:
+
+  In file included from include/libcamera/ipa/core_ipa_serializer.h:18:
+  include/libcamera/internal/ipa_data_serializer.h:57:3: error: unused
+      function template 'readPOD' [-Werror,-Wunused-template]
+     57 | T readPOD(std::vector<uint8_t> &vec, size_t pos)
+        |   ^~~~~~~
+
+The POD helpers live in an anonymous namespace, so they have internal
+linkage and clang diagnoses them per translation unit. appendPOD() and
+the iterator overload of readPOD() are referenced by the IPADataSerializer
+specialisations in this header, so they are seen as used everywhere.
+
+The std::vector overload of readPOD() is different: nothing in libcamera
+itself calls it. Its only callers are the IPA proxies and proxy workers
+generated at build time from the mojom templates, for example
+
+  [[maybe_unused]] const size_t ipaControlsBufSize =
+          readPOD<uint32_t>(_ipcOutputBuf.data(), 4);
+
+in src/libcamera/proxy/soft_ipa_proxy.cpp. It is therefore genuinely
+unused in every translation unit that includes this header without being
+generated proxy code, which is exactly what [[maybe_unused]] is for.
+
+Note the overload cannot simply be dropped: doing so breaks the generated
+proxies with "no matching function for call to 'readPOD'".
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ include/libcamera/internal/ipa_data_serializer.h | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/include/libcamera/internal/ipa_data_serializer.h b/include/libcamera/internal/ipa_data_serializer.h
+index 0dda76d..528527d 100644
+--- a/include/libcamera/internal/ipa_data_serializer.h
++++ b/include/libcamera/internal/ipa_data_serializer.h
+@@ -52,9 +52,15 @@ T readPOD(std::vector<uint8_t>::const_iterator it, size_t pos,
+ 	return ret;
+ }
+
++/*
++ * This overload is only used by the generated IPA proxies and proxy workers,
++ * and thus is unused in translation units that include this header without
++ * being generated proxy code. Mark it as such to avoid -Wunused-template
++ * warnings, which clang enables as part of -Wall since version 23.
++ */
+ template<typename T,
+ 	 std::enable_if_t<std::is_arithmetic_v<T>> * = nullptr>
+-T readPOD(std::vector<uint8_t> &vec, size_t pos)
++[[maybe_unused]] T readPOD(std::vector<uint8_t> &vec, size_t pos)
+ {
+ 	return readPOD<T>(vec.cbegin(), pos, vec.end());
+ }
+--
+2.51.0
+
diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.7.2.bb b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.7.2.bb
index 3199ad8a4f..955cf041ba 100644
--- a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.7.2.bb
+++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.7.2.bb
@@ -11,6 +11,7 @@ LIC_FILES_CHKSUM = "\

 SRC_URI = " \
         git://git.libcamera.org/libcamera/libcamera.git;protocol=https;branch=master;tag=v${PV} \
+        file://0001-ipa_data_serializer-Mark-vector-readPOD-overload-as-m.patch \
 "

 SRCREV = "191e202178f02430b5942397c70d215cdd2056fa"

