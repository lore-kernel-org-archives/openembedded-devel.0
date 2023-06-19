Return-Path: <sanakazisk19@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 132F1EB64D9
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 08:06:32 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.3056.1687161981858613839
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jun 2023 01:06:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=dXOLzXVZ;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: sanakazisk19@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-25bf4b269e0so2868805a91.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 01:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687161981; x=1689753981;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dXfI9QEI9fa7l+hjt8YNXj59mNT2dZ0mKZK3aaZqggc=;
        b=dXOLzXVZJysiFNp3R6KUkNPPmu2S0ySRdJWCRNC2PJnIS6JeDiGbc/qmzAihOb21XB
         7MSEg28jVUMM/jO0rNzkiwmeoGsjCVUktLVAVsXbMADgTjPrFwKKSIJbA8TKO2r8JxsN
         GWns26FiNaPjNjQ1L+qmMLFCJfLDhU0TW8FEH7xTlHwHoI0r4+91lkZhr5aQ1gZeJvO7
         8lhaw+Zz5KcX4t269d7FqrF8Uendbhie4Ej8J/ptjKlZI+YRBmjoly2UuwPgH7T53lb9
         mbxU5bC0nS1OAJf47PXnkZF0I/IUIuCFWjDWm1Mn2CGnOfDaTPg3mMMCgblZIQEUd5b6
         FoIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687161981; x=1689753981;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dXfI9QEI9fa7l+hjt8YNXj59mNT2dZ0mKZK3aaZqggc=;
        b=XrniszbwqYBCGlemcEMW4qQFUhEy01RPCFEmIXliLOi1R74vSyGPhU6ILmJ0EafGdL
         jU0cGqeh4Kg3jV/6bhpI76noI4TOQsPVgmizzSkbUG6F8645ImZpgWu9hhSlM9gAp0G1
         p+aH5uDd6r7sFhBFKi/ztjdghV5Sh23xDYng3/jEZ9OwJqLVOKXDB3iIxlW7H6C3rxe4
         qYUkfUFjvqqS+FTjEdUXYraiCtySnRq/CKzHMj580wVrdWbNmfB+K/hAJsYdp+/XyxxI
         oG+zFDPAvVIHrAuzLkxa/T4MtE/q2nTQaBE7UFp+eFrz8xfK19N4K2MmHDup2+AwU9Dl
         mUpg==
X-Gm-Message-State: AC+VfDyV6VFp4qG2fAcqSV32Avo9u1rnJ91H/7oGXDxMVe5iRwf7RWOH
	8IVZdz1jYiZQ9t6qBtHZ8nArk3aYBds=
X-Google-Smtp-Source: ACHHUZ7O2XKB4NoDCFp8uUX91bNHW2q3jmEa3lHUzm76djsA6YkFM5qcVsKci8Qo3FwdDcLQkRpgLw==
X-Received: by 2002:a17:90a:190f:b0:253:3eb5:3ade with SMTP id 15-20020a17090a190f00b002533eb53ademr11885749pjg.8.1687161980860;
        Mon, 19 Jun 2023 01:06:20 -0700 (PDT)
Received: from localhost.localdomain ([171.50.215.208])
        by smtp.gmail.com with ESMTPSA id f17-20020a63f751000000b005501b24b1c9sm6430680pgk.62.2023.06.19.01.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 01:06:20 -0700 (PDT)
From: Sana Kazi <sanakazisk19@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: sanakazisk19@gmail.com,
	ranjitsinh.rathod@kpit.com
Subject: [meta-oe][kirkstone][PATCH] Googletest: Adapt googletest 1.11.0 with gcc11
Date: Mon, 19 Jun 2023 13:35:53 +0530
Message-Id: <20230619080553.1100632-1-sanakazisk19@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 08:06:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103381

Backport a commit to fix the build error when using gcc11.
[commit]
https://github.com/google/googletest/pull/3993/commits/096014a45dc38dff993f5b7bb28a258d8323344b
[error]
/usr/include/gtest/gtest-printers.h:291:36: error: no matching function for call to
‘testing::internal::internal_stream_operator_without_lexical_name_lookup::StreamPrinter::PrintValue(const A::B::C::D::E::F::G&, std::nullptr_t)’
291 |     T, decltype(Printer::PrintValue(std::declval<const T&>(), nullptr)),
    |                 ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/usr/include/gtest/gtest-printers.h:214:15: note: candidate: ‘template<class T, class, class> static void testing::internal::internal_stream_operator_without_lexical_name_lookup::StreamPrinter::PrintValue(const T&, std::ostream*)’
  214 |   static void PrintValue(const T& value, ::std::ostream* os) {
      |               ^~~~~~~~~~

Signed-off-by: Peng Cui <peng.ca.cui@bmw.com>
Signed-off-by: Sana Kazi <sana.kazi@kpit.com>
Signed-off-by: Sana Kazi <sanakazisk19@gmail.com>
---
 .../0001-work-around-GCC-6-11-ADL-bug.patch   | 42 +++++++++++++++++++
 .../recipes-test/googletest/googletest_git.bb |  3 +-
 2 files changed, 44 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-test/googletest/files/0001-work-around-GCC-6-11-ADL-bug.patch

diff --git a/meta-oe/recipes-test/googletest/files/0001-work-around-GCC-6-11-ADL-bug.patch b/meta-oe/recipes-test/googletest/files/0001-work-around-GCC-6-11-ADL-bug.patch
new file mode 100644
index 000000000..c2828e6a9
--- /dev/null
+++ b/meta-oe/recipes-test/googletest/files/0001-work-around-GCC-6-11-ADL-bug.patch
@@ -0,0 +1,42 @@
+From 8c70e2680bec526012d96578160901e4c24e1c48 Mon Sep 17 00:00:00 2001
+From: Paul Groke <paul.groke@dynatrace.com>
+Date: Thu, 15 Sep 2022 13:36:49 +0200
+Subject: [PATCH] work around GCC 6~11 ADL bug
+
+see https://gcc.gnu.org/bugzilla/show_bug.cgi?id=51577
+ADL seems to work properly when we do the SFINAE check via the return type, but not when using a dummy template parameter
+
+fix #3992
+Upstream-Status: Backport [https://github.com/google/googletest/pull/3993/commits/096014a45dc38dff993f5b7bb28a258d8323344b]
+Signed-off-by: Paul Groke <paul.groke@dynatrace.com>
+Signed-off-by: Sana Kazi <sana.kazi@kpit.com>
+---
+ googletest/include/gtest/gtest-printers.h | 13 +++++++------
+ 1 file changed, 7 insertions(+), 6 deletions(-)
+
+diff --git a/googletest/include/gtest/gtest-printers.h b/googletest/include/gtest/gtest-printers.h
+index 8e4d295344..19c3e0b69b 100644
+--- a/googletest/include/gtest/gtest-printers.h
++++ b/googletest/include/gtest/gtest-printers.h
+@@ -205,12 +205,13 @@ struct StreamPrinter {
+             // Don't accept member pointers here. We'd print them via implicit
+             // conversion to bool, which isn't useful.
+             typename = typename std::enable_if<
+-                !std::is_member_pointer<T>::value>::type,
+-            // Only accept types for which we can find a streaming operator via
+-            // ADL (possibly involving implicit conversions).
+-            typename = decltype(std::declval<std::ostream&>()
+-                                << std::declval<const T&>())>
+-  static void PrintValue(const T& value, ::std::ostream* os) {
++                !std::is_member_pointer<T>::value>::type>
++  // Only accept types for which we can find a streaming operator via
++  // ADL (possibly involving implicit conversions).
++  // (Use SFINAE via return type, because it seems GCC < 12 doesn't handle name
++  // lookup properly when we do it in the template parameter list.)
++  static auto PrintValue(const T& value, ::std::ostream* os) 
++  -> decltype((void)(*os << value)) {
+     // Call streaming operator found by ADL, possibly with implicit conversions
+     // of the arguments.
+     *os << value;
+-- 
+2.25.1
diff --git a/meta-oe/recipes-test/googletest/googletest_git.bb b/meta-oe/recipes-test/googletest/googletest_git.bb
index 869c2c86b..917a68e95 100644
--- a/meta-oe/recipes-test/googletest/googletest_git.bb
+++ b/meta-oe/recipes-test/googletest/googletest_git.bb
@@ -10,7 +10,8 @@ PROVIDES += "gmock gtest"
 
 S = "${WORKDIR}/git"
 SRCREV = "9e712372214d75bb30ec2847a44bf124d48096f3"
-SRC_URI = "git://github.com/google/googletest.git;branch=main;protocol=https"
+SRC_URI = "git://github.com/google/googletest.git;branch=main;protocol=https \
+           file://0001-work-around-GCC-6-11-ADL-bug.patch "
 
 inherit cmake
 
-- 
2.25.1


