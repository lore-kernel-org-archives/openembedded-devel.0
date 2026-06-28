Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A011C44503
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 16:22:40 +0000 (UTC)
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20721.1782663751149981532
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 09:22:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=PsrWgo+G;
 spf=pass (domain: gmail.com, ip: 74.125.82.173, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-30c09f29b64so1793403eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 09:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782663750; x=1783268550; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1SFFEdyvwLPV+hyE8N1UZPtkI9Dlm5Kd7HglUf7fWhw=;
        b=PsrWgo+GWDi0CrGefjgU8crolOWvqFEnjC8nQLJqIFTAaWr1ZFVqLG0SPCPqxRgdkG
         6uN/EAgRuwlJJC5rzyOoi534z+88x5foeY5W4mgjAyXdw1C7jHqtVsYOXfCeiEZZf1p4
         bHoIkdZGwdP+MWASy+Qy49ymm5eVF5LB+wOUsvX+TEGES3nK7bnUdCh178HFrpKHeGFW
         7U++8SIlWBAaY2L5HPyWk/pRGvBZOx6beTXWsqerOVnOjmif18D6CmVyzFcianx1fc7s
         9XxMvShG5Q0E3RrCAsWBOaz64YiDqRvYYvc2bVW6YQbanyRawucWzBkxWjQ33lVooC5G
         9flA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782663750; x=1783268550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1SFFEdyvwLPV+hyE8N1UZPtkI9Dlm5Kd7HglUf7fWhw=;
        b=POgVWbnLmN/bO147wUB0bEmPsccau57m9NphhSwdKzlaNki/8+3SSoj4SD93C8XP1D
         YOQTMbMOsxk37R8YNfDXr/fhg+K6/na5hqH4W6UPkPEtfujYX4nVq7x3EJnxSbmHd2L7
         vSUHcXtN1mg7i7MFD6Rzyc6jClO90N9IeSpaaK12zV5x+cnNA7YEHlkiR6+IJ6NKae18
         G9MdiHbS60UFoXajvLEMf3LCU2PmgTIcMgrOUF/Ps/gR2Q/g1IT3ETLJEgwZTdyw2vse
         THGIpY4YMywPBXi7GrGkthJ4NiUOlpwhdK7YVnyxz6orJYBGz/BxaMFvzxX8reNrSnxi
         BL0Q==
X-Gm-Message-State: AOJu0Yw7PDYlaAKGNzDt17WuTz4ZYkn1LGuzQbWIgfp7gr5PdQDIp/yt
	/qcyoU6c1a5lvPbaishk7ND+PqxxbdVn3DTyg6HC7GJMUUvcskDm0YEKf/eDI/IKP9BPdw==
X-Gm-Gg: AfdE7cmdKuiA7ss1xvgbtwLCEuFphDI99Wg7YWOdc4muCSWy73fFm14aCTyjWvF9Mck
	uF5C2eYxgCQsupEjw9egkbySbC97k0THXwj2cfd/dKyrNV3BOrwtp+Z/IWqCoxcw6a06rfatsRn
	GRfVbKnXXZ9dxx+ANcHNuoNV2gqDYcAJ3X5/ey2keJ8J09QqG2Z/WBwoGZ5+2q+ykHINZFpq/Ml
	mC0uU39tTbU9tGZ/m0tpEtslfNkVPnzhkoMR4KO9b57fBADcR4NNzLNkAdx+XxC5E7bMKdZIi2h
	2SWskojNcJ26I4OUV8VMPR1UKgKFhQ3e2vfNSQ2fyF1eHO1pHFsZ2CwU0sq9Qh/ylWbq0JvbRgB
	wFYBcVgUdlI1caC/Q5JpT1V+kUOz7zXKVNMgunp++oiJNH00fWhuFbHwf3BAZlIWbWweh19lw2Z
	zyTRrCZ7IOGB60Caz43oFxBKqqixey1+3KPVVk6aN74xLzbRQmPOk8fBxMlgfB5l+HVd1FBaI0v
	VBrCc7YcdclNjD16nl28ojtglqVLLSgmbVprv0W9r8n9YAUA1emZPBjY1i5bm49jgf1iQOGgOXE
	M94jIJwaV6o6wnyvnw9JWczCROd4pA==
X-Received: by 2002:a05:7301:4291:b0:30e:96d3:439c with SMTP id 5a478bee46e88-30e96d344f4mr2420874eec.5.1782663750390;
        Sun, 28 Jun 2026 09:22:30 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c52c591sm49849445eec.7.2026.06.28.09.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 09:22:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 104/128] breakpad: fix build with GCC 16
Date: Sun, 28 Jun 2026 09:21:58 -0700
Message-ID: <20260628162222.4081517-4-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628162222.4081517-1-khem.raj@oss.qualcomm.com>
References: <20260628162222.4081517-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 16:22:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127914

Move ModuleFactory::CreateModule out of line.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...ove-CreateModule-out-of-line-to-fix-.patch | 95 +++++++++++++++++++
 .../breakpad/breakpad_2023.06.01.bb           |  1 +
 2 files changed, 96 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/breakpad/breakpad/0001-module_factory-move-CreateModule-out-of-line-to-fix-.patch

diff --git a/meta-oe/recipes-devtools/breakpad/breakpad/0001-module_factory-move-CreateModule-out-of-line-to-fix-.patch b/meta-oe/recipes-devtools/breakpad/breakpad/0001-module_factory-move-CreateModule-out-of-line-to-fix-.patch
new file mode 100644
index 0000000000..baa5ca2a58
--- /dev/null
+++ b/meta-oe/recipes-devtools/breakpad/breakpad/0001-module_factory-move-CreateModule-out-of-line-to-fix-.patch
@@ -0,0 +1,95 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 23 Jun 2026 00:00:00 +0000
+Subject: [PATCH] module_factory: move CreateModule out of line to fix vtable
+ link error
+
+module_factory.h defines BasicModuleFactory::CreateModule and
+FastModuleFactory::CreateModule inline. These inline functions
+construct a {Basic,Fast}SourceLineResolver::Module, whose only
+out-of-line virtual ("key") function lives in
+{basic,fast}_source_line_resolver.cc. Consequently every translation
+unit that includes module_factory.h (notably
+source_line_resolver_base.cc) emits an undefined reference to the
+Module vtable.
+
+With newer linkers (and --as-needed) the binaries that link
+source_line_resolver_base.o but not fast_source_line_resolver.o, such
+as microdump_stackwalk, fail to link with:
+
+  undefined reference to `vtable for
+  google_breakpad::FastSourceLineResolver::Module'
+
+Move the CreateModule definitions out of the header into the
+respective .cc files, which already include module_factory.h and which
+are also where the Module vtables are emitted. This way
+source_line_resolver_base.o no longer references the Fast/Basic Module
+vtables.
+
+Upstream-Status: Submitted [https://github.com/google/breakpad]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/processor/basic_source_line_resolver.cc | 5 +++++
+ src/processor/fast_source_line_resolver.cc  | 5 +++++
+ src/processor/module_factory.h              | 8 ++------
+ 3 files changed, 12 insertions(+), 6 deletions(-)
+
+diff --git a/src/processor/basic_source_line_resolver.cc b/src/processor/basic_source_line_resolver.cc
+index 1111111..2222222 100644
+--- a/src/processor/basic_source_line_resolver.cc
++++ b/src/processor/basic_source_line_resolver.cc
+@@ -108,6 +108,11 @@ static const char* kWhitespace = " \r\n";
+ static const int kMaxErrorsPrinted = 5;
+ static const int kMaxErrorsBeforeBailing = 100;
+
++BasicSourceLineResolver::Module* BasicModuleFactory::CreateModule(
++    const string& name) const {
++  return new BasicSourceLineResolver::Module(name);
++}
++
+ BasicSourceLineResolver::BasicSourceLineResolver() :
+     SourceLineResolverBase(new BasicModuleFactory) { }
+
+diff --git a/src/processor/fast_source_line_resolver.cc b/src/processor/fast_source_line_resolver.cc
+index 1111111..2222222 100644
+--- a/src/processor/fast_source_line_resolver.cc
++++ b/src/processor/fast_source_line_resolver.cc
+@@ -60,6 +60,11 @@ using std::unique_ptr;
+
+ namespace google_breakpad {
+
++FastSourceLineResolver::Module* FastModuleFactory::CreateModule(
++    const string& name) const {
++  return new FastSourceLineResolver::Module(name);
++}
++
+ FastSourceLineResolver::FastSourceLineResolver()
+   : SourceLineResolverBase(new FastModuleFactory) { }
+
+diff --git a/src/processor/module_factory.h b/src/processor/module_factory.h
+index 1111111..2222222 100644
+--- a/src/processor/module_factory.h
++++ b/src/processor/module_factory.h
+@@ -52,18 +52,14 @@ class BasicModuleFactory : public ModuleFactory {
+  public:
+   virtual ~BasicModuleFactory() { }
+   virtual BasicSourceLineResolver::Module* CreateModule(
+-      const string& name) const {
+-    return new BasicSourceLineResolver::Module(name);
+-  }
++      const string& name) const;
+ };
+
+ class FastModuleFactory : public ModuleFactory {
+  public:
+   virtual ~FastModuleFactory() { }
+   virtual FastSourceLineResolver::Module* CreateModule(
+-      const string& name) const {
+-    return new FastSourceLineResolver::Module(name);
+-  }
++      const string& name) const;
+ };
+
+ }  // namespace google_breakpad
+--
+2.49.0
diff --git a/meta-oe/recipes-devtools/breakpad/breakpad_2023.06.01.bb b/meta-oe/recipes-devtools/breakpad/breakpad_2023.06.01.bb
index e7cb29289d..26f6ab9195 100644
--- a/meta-oe/recipes-devtools/breakpad/breakpad_2023.06.01.bb
+++ b/meta-oe/recipes-devtools/breakpad/breakpad_2023.06.01.bb
@@ -38,6 +38,7 @@ SRC_URI = "git://github.com/google/breakpad;name=breakpad;branch=main;protocol=h
            file://mcontext.patch \
            file://0001-Remove-HAVE_GETCONTEXT-check-to-add-local-implementa.patch \
            file://0001-Fixed-missing-include-for-std-find_if.patch \
+           file://0001-module_factory-move-CreateModule-out-of-line-to-fix-.patch \
            file://0001-lss-Match-syscalls-to-match-musl.patch;patchdir=src/third_party/lss \
            file://mips_asm_sgidefs.patch;patchdir=src/third_party/lss \
 "

