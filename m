Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0DFFC44520
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 13:04:49 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13067.1784293481635296534
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Jul 2026 06:04:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=IkQfisO3;
 spf=pass (domain: konsulko.com, ip: 209.85.221.46, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-471eeac43bfso7336924f8f.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Jul 2026 06:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1784293480; x=1784898280; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HxINFHz4ymKRXxLVQGmdB4eqHiQVieHFud1vlDmW49w=;
        b=IkQfisO3iu+cfR4S/eUoYyokf3xnnZCRxgkfQHi4pLNFR+usEjaiAIsNt/wtN4WqCf
         B52qcR0Uunz3/AqiKStXli80XSp2rHXVmy6zBcdG6rSLVSyPvMxVL1z+mQuBhLmMEQrp
         DGfLDgwt8vugGId3LmxV+fld9iiUoNQhil/Hk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784293480; x=1784898280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HxINFHz4ymKRXxLVQGmdB4eqHiQVieHFud1vlDmW49w=;
        b=Grn3w3ciFRwo9rZPrXybnBsaWgLGXcZ96oBHS1XkmWsEbwzKvr8KygaGEwxdmEKNPh
         MJYvRlRCT9N96IKqUyO+7IGRoKNNARnqkQecXaYD6Gnhe2Ri8OVwF2xINtFXJnWxLmnL
         sWIFqJfrKdieyCxMAOjiarnIK8KpSgUTvHabArdk2mSIv/Vek0HfYAVzNzbiN/c+ya+m
         Amsg3kmxCALjdIrwvgDwUGrjOKVHp78quEyaRPqcZj+2gJUIZGoNC2m5kcEp7CZxPJLT
         9DXCW4e7PB00GpEX+3qSj2g+vwSgWNp2bjCX27O9pd0vYD7A8vPrxJIK1hnOrEtrmup4
         qhug==
X-Gm-Message-State: AOJu0YyeQw2PoVNQAVaKqa6DbiwUYGfJRKuwJ07vt9zqDHrnyZ88DaXK
	mE+7kg0ObzHgnKpY1kOmm2of13WQk+Q5oXSxiTYUuOijArkZ2DJnF90vjKjoiMgLNnxXlzywkPU
	2SO56
X-Gm-Gg: AfdE7ckc3L/IheqmPWt4S+fDerF9MQnco0W8AHH0Mq63gI7WTV+cq0MuKStI6+Aib9o
	mQyKyLK0D53maKBeOmp//eFDwr7MGsisVKZiXCV2kpmSKTuNYuIoSaNp3Hpjn29nV2zrlhgpTMD
	SPRvy5jH7l2Vnbo/LbZftEqrYHh2xHyz/a27uEp237qXeZg1MK9U99bC9/hIjootTTjHaib7DSk
	PoaFOZbToQmWatPXM0PI6Tqdg6hEzTXoSLkvkBVXljmaxai29s4IOePDy0UhySUxVD96fKZxQpC
	d3J2Zw63LRa41c/8mmpaZN3sCtsKCrELzVTgm5I8aW5z8kNgOQ3R5QZG3fwz3A4SKNGT6p5L0t/
	rowP3o8QtlRNXlKC31nQlXl/3eMuq4XCfS0rjSdVg37Kuc08ETlklF3WJxIcz4EKw7jWYJSU3ab
	Pce5ylalFky8TasyPtnBCdt30HQbWRM8zey/M7z28QThx1L1tkd0rK2sRaPYjfA3SIWtgn2DJDG
	XqNpPSH/E+NzKGmD1OnNtHjrjf+klw=
X-Received: by 2002:adf:e010:0:10b0:474:cd60:1154 with SMTP id ffacd0b85a97d-47f6232c9c2mr2460395f8f.41.1784293479683;
        Fri, 17 Jul 2026 06:04:39 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63e49500sm3592112f8f.2.2026.07.17.06.04.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 06:04:39 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/2] python3-lief: Upgrade 0.17.3 -> 1.0.0
Date: Fri, 17 Jul 2026 16:04:35 +0300
Message-ID: <20260717130435.849145-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260717130435.849145-1-leon.anavi@konsulko.com>
References: <20260717130435.849145-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Jul 2026 13:04:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128250

Upgrade to release 1.0.0:

- Add Android JNI Analyzer
- The DWARF import plugin now supports comments
- Add support for generating DWARF from firmware or binaries
  without a precise format or architecture
- Add support for accessing the bit size of bit-field declarations
- Add support for accessing Enum entries:
  lief.dwarf.types.Enum.entries()
- Add support for reading from or assigning a register to a function
  parameter
- Add support for reading from or assigning a description
  (DW_AT_description) to a lief.dwarf.Function, lief.dwarf.Variable,
  or lief.dwarf.LexicalBlock:
  lief.dwarf.Function.description()
  lief.dwarf.Variable.description()
  lief.dwarf.LexicalBlock.description()
- Enable the creation of nested lief.dwarf.editor.Function.LexicalBlock
- Add support for generating a C/C++ definition for a whole
  lief.dwarf.CompilationUnit ( lief.dwarf.CompilationUnit.to_decl()).
  The output of the following to_decl() functions can now be
  configured through the new lief.DeclOpt structure:
  lief.dwarf.Function.to_decl()
  lief.dwarf.Variable.to_decl()
  lief.dwarf.Type.to_decl()
  lief.dwarf.CompilationUnit.to_decl()
- Improve support and the API for LF_ENUM: lief.pdb.types.Enum
- Improve support and the API for LF_PROCEDURE: lief.pdb.types.Function
- Improve support and the API for LF_ARRAY: lief.pdb.types.Array
- Improve support and the API for simple types: lief.pdb.types.Simple
- Improve support and the API for LF_ONEMETHOD: lief.pdb.types.Method
- Add support for generating a C/C++ definition for a lief.pdb.Function
  ( lief.pdb.Function.to_decl()) and a lief.pdb.CompilationUnit
  ( lief.pdb.CompilationUnit.to_decl()), configurable with the new
  lief.DeclOpt structure.
- Add support for DT_AUXILIARY tag: lief.ELF.DynamicEntryAuxiliary
- Add support for DT_FILTER tag: lief.ELF.DynamicEntryFilter
- Add lief.ELF.parse_from_dump() to parse an ELF binary from a
  memory dump
- Add lief.COFF.Section.coff_string for accessing the full section
  name when this name does not fit in 8 bytes.
- Add support for writing big-endian Mach-O binaries
- Introduce an API for selecting a specific Mach-O binary by
  architecture from a FAT binary
- Add lief.MachO.FatBinary.create() to create a FAT binary from a
  list of lief.MachO.Binary objects targeting different architectures
- Add support for lief.MachO.ThreadLocalVariables
- Fix an extra byte being written after the thread state of an
  LC_UNIXTHREAD/LC_THREAD command, which shifted the following load
  commands by one byte
- Add support for editing the runtime tables of the
  LC_FUNCTION_VARIANTS command and committing the changes on write:
  lief.MachO.FunctionVariants
- Add a structured parser, editing API and writer for the
  LC_FUNCTION_VARIANT_FIXUPS command:
  lief.MachO.FunctionVariantFixups
- Add support for the LC_LAZY_LOAD_DYLIB_INFO command:
  lief.MachO.LazyLoadDylibInfo
- Add lief.MachO.parse_from_dump() to parse a Mach-O binary from a
  memory dump
- Add setters for lief.PE.ImportEntry.iat_value and
  lief.PE.ImportEntry.ilt_value
- Add lief.PE.Binary.offset_to_rva() to convert a raw offset into a RVA
- Add lief.PE.parse_from_dump() to parse a PE binary from a memory dump
- Update lief.Binary.offset_to_virtual_address() for PE binaries
  to return an absolute virtual address instead of a RVA
- Add support for adding an lief.PE.Import at a specific position:
  lief.PE.Binary.add_import()
- Improve support for EFI binaries, such as bzImage
- Add support for Objective-C categories: lief.ObjC.Category,
  accessible through lief.ObjC.Metadata.categories
- Add support for iterating over the operands of MIPS, PowerPC,
  eBPF and RISC-V instructions (Register, Immediate, Memory and
  PCRelative):
  lief.assembly.mips.Instruction.operands()
  lief.assembly.powerpc.Instruction.operands()
  lief.assembly.ebpf.Instruction.operands()
  lief.assembly.riscv.Instruction.operands()
- The Rust FFI no longer relies on autocxx and bindgen. It is now
  built on top of plain cxx, which simplifies the bindings and
  reduces the iteration time
- The Rust bindings directory has been renamed from api/rust/cargo/
  to api/rust/crates/
- Add support for the aarch64-linux-android and x86_64-linux-android
  targets
- Add LIEF_LIFETIMEBOUND annotations wrapping [[clang::lifetimebound]]
  to leverage Clang's lifetime analysis. This helps detect dangling
  references at compile time for methods that return references or
  iterators tied to an object's lifetime

This work was sponsored by GOVCERT.LU.

License-Update: Update years

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...equirements.txt-Allow-newer-versions.patch | 28 +++++++++----------
 ...3-lief_0.17.3.bb => python3-lief_1.0.0.bb} |  6 ++--
 2 files changed, 17 insertions(+), 17 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-lief_0.17.3.bb => python3-lief_1.0.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-lief/0001-build-requirements.txt-Allow-newer-versions.patch b/meta-python/recipes-devtools/python/python3-lief/0001-build-requirements.txt-Allow-newer-versions.patch
index 9c61f0bdee..114034a6a9 100644
--- a/meta-python/recipes-devtools/python/python3-lief/0001-build-requirements.txt-Allow-newer-versions.patch
+++ b/meta-python/recipes-devtools/python/python3-lief/0001-build-requirements.txt-Allow-newer-versions.patch
@@ -15,20 +15,20 @@ Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
 --- a/api/python/build-requirements.txt
 +++ b/api/python/build-requirements.txt
 @@ -1,10 +1,10 @@
--tomli==2.2.1
--scikit-build-core==0.11.1
-+tomli>=2.2.1
-+scikit-build-core>=0.11.1
+-tomli==2.4.1
+-scikit-build-core==1.0.3
++tomli>=2.4.1
++scikit-build-core>=1.0.3
  # For Ninja: msvc.msvc14_get_vc_env
--setuptools==70.2.0
-+setuptools>=70.2.0
+-setuptools==83.0.0
++setuptools>=83.0.0
  # For the "env" feature
--pydantic==2.11.3
-+pydantic>=2.11.3
+-pydantic==2.13.4
++pydantic>=2.13.4
  # Implicit from scikit-build-core
--pathspec==0.12.1
--build==1.2.1
--wheel==0.45.1
-+pathspec>=0.12.1
-+build>=1.2.1
-+wheel>=0.45.1
+-pathspec==1.1.1
+-build==1.5.1
+-wheel==0.47.0
++pathspec>=1.1.1
++build>=1.5.1
++wheel>=0.47.0
diff --git a/meta-python/recipes-devtools/python/python3-lief_0.17.3.bb b/meta-python/recipes-devtools/python/python3-lief_1.0.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-lief_0.17.3.bb
rename to meta-python/recipes-devtools/python/python3-lief_1.0.0.bb
index fe954e1b32..e6f155d5f3 100644
--- a/meta-python/recipes-devtools/python/python3-lief_0.17.3.bb
+++ b/meta-python/recipes-devtools/python/python3-lief_1.0.0.bb
@@ -2,12 +2,12 @@ SUMMARY = "Library to instrument executable formats"
 DESCRIPTION = "LIEF: Library to Instrument Executable Formats"
 HOMEPAGE = "https://github.com/lief-project/LIEF"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=9ab5db472ff936b441055522f5000547"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c43f89548372352eb04f30367ec7a0f3"
 SECTION = "libs"
 
-SRCREV = "03aca30b53db2f336b36f90843061bb3f840ff5a"
+SRCREV = "d05b3499b6934137e917c009a4df0a9dc8cb11c5"
 SRC_URI = " \
-    git://github.com/lief-project/LIEF.git;protocol=https;branch=release/0.17.x;tag=${PV} \
+    git://github.com/lief-project/LIEF.git;protocol=https;branch=main;tag=${PV} \
     file://0001-build-requirements.txt-Allow-newer-versions.patch \
     file://0002-api-python-config-default.toml-Debug.patch \
 "
-- 
2.47.3


