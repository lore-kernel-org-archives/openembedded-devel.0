Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53AF8D148B5
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 07:08:09 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1331.1767856087011114687
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Jan 2026 23:08:07 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd88.aul.t-online.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout11.t-online.de (Postfix) with SMTP id 811921CA6B
	for <openembedded-devel@lists.openembedded.org>; Thu,  8 Jan 2026 08:08:00 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([79.219.236.196]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1vdk7k-4QKl7J0; Thu, 8 Jan 2026 08:08:00 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] fex: uodate 2511 -> 2601
Date: Thu,  8 Jan 2026 08:07:54 +0100
Message-ID: <20260108070754.3675921-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1767856080-B9E32BB2-F8B19DF8/0/0 CLEAN NORMAL
X-TOI-MSGID: 49d5d482-ae59-42f8-bdb1-205e14418228
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Jan 2026 07:08:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123246

FEX Release FEX-2601

ARM64Emitter

Force NOP padding to be enabled (9e8915e)
Arm64Emitter

Initial work for LoadConstant padding audit (d582356)
BranchOps

Use RIP relocs for direct branch targets (c57df73)
CMake

Move CMakeModules to Data/CMake (651ef64)
Fix mingw if host has libxxhash-dev installed (900c179)
Support overriding version/hash via CMake args (19d3450)
CodeCache

Fix misparenthesized expression in SaveData() (9101e70)
Rebase block entrypoint info (5747d1c)
Make LoadData Thread argument an optional pointer (bc069f2)
Implement automatic cache generation (eb425fe)
Implement runtime cache validation (93f6a8c)
Trigger delayed cache loading for the main executables and its interprete=
r (71c8436)
Implement cache loading (ec67670)
Common

Use LOCALAPPDATA for GetCacheDirectory on WOW64/ARM64EC (499970d)
Config

Remove stdout from OutputLog (e1c6a91)
Dispatcher

Silence warning on ARM64EC (9a12868)
FEXCore

Cleanup pointers structure (b29a78c)
Fixes circular dependency with thunk callback (5627ddf)
Switch constant emission to default to NoPad (2b4492c)
Revert literal optimization from #4884 (da46d51)
FEXOfflineCompiler

Implement SyscallHandler::LookupExecutableFileSection (5ca549e)
FEXServer

Add protocol interface to request code cache population (805a4c1)
Frontend

Only decode REX if it is at the correct location (c8d72ea)
Also fetch relocations and section bounds when validating (0a18ea8)
ImageTracker

Load AOT images (a3779be)
Load PE relocations when generating code caches (b87bb1d)
Support codemap file generation (c54dfd9)
Track loaded PE images for LookupExecutableFileSection (212a3f4)
Interpreter

Moves around the thread and ELF initialization code (ed1d495)
JIT

Fixes typo (c4258be)
LinuxSyscalls

x32
Fixes fcntl assert (6c06f47)
LookupCache

Fix mistake in nested CacheBlockMapping call (a957f1f)
OpcodeDispatcher

Explicitly calculate flags after _TelemetrySetValue (281981e)
Relocations

Disable 6-byte size optimization in InsertGuestRIPMove (c7eb4c8)
Switch to robin_map to improve lookup perf (4889596)
SHMStats

Avoid ISB usage when stats are disabled (6a49b8c)
Scripts

Have InstallFEX check kernel version (b407688)
Steam

Don't let the FEXServer inherit FEXServerManager's original stdout (53925=
dc)
Syscalls

Fix DEBUG_STRACE printing (e859109)
Thunks

Vulkan
Update for v1.4.337 (668e027)
Tools

pidof
Fixes FEXpidof after #5097 (7e4e017)
VDSO

Forgot to remove a if check (144c4bf)
WOW64

Lock the JIT context and block suspend during context operations (a25d90d=
)
WinAPI

Implement Sleep (37b0e9e)
Windows

Improve handling of RWX memory (d592e2a)
Invalidate code in freed memory after the free syscall (cb7de45)
Fix RtlWaitOnAddress signature (f098b41)
Implement _[w]sopen file APIs (f819999)
Introduce ImageTracker for tracking per-loaded-image data (dc764db)
Switch GetSection/ExecutableFilePath to returning full paths (956f97e)
Split out CRT/WinAPI reimplementation (ebdbf58)
WritePriorityMutex

Add some more documentation (9fa8148)
Fix rare case of dropped read waiter wakes (ce9824a)
Misc

[cmake] explicit platform and bit-width checks (dbd802c)
[cmake] more parenthesis cleanups, linker gc module, more same-line stuff=
 (1f6b3d5)
[cmake] refactor: compiler and architecture handling (51f6722)
[cmake] better option descriptions + more consistent language (9c0c969)
Constant audit (fd2ee4e)
_Constant audit (851fbae)
First round of LoadConstant auditing (5bbbe4d)
[cmake] Use a Find module for xxhash (5a47565)
[cmake] do not use uppercase command names (f24f88e)
[cmake] reduce usage of trivial variables (0edf961)
[cmake] prefer end parenthesis on same line, no space after some calls (b=
41b967)
[cmake] FEXCore: further reduce library redundancy (f153d86)
[cmake] propagate -ISource to all Tools (bd8f6f1)
[cmake] use MINGW builtin rather than custom detection (7cdef04)
Some minor NFC (974ba78)
Guest relocation support (fef1993)
Various trivial fixes for #5106 (296988b)
code-format-helper: Update urllib3 dependency (2e2563a)
github

steamrt4
Additional comments (bf9ab7f)
unittests

ASM

Adds test for flags clobber in TelemetrySetValue (eb27576)
Test 32-bit displacement encoding (d197300)
FEXLinuxTests

Fix gcc build (fedebf4)
Force clang building for tests (62383a1)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-devtools/fex/{fex_2511.bb =3D> fex_2601.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/fex/{fex_2511.bb =3D> fex_2601.bb} (95%)

diff --git a/meta-oe/recipes-devtools/fex/fex_2511.bb b/meta-oe/recipes-d=
evtools/fex/fex_2601.bb
similarity index 95%
rename from meta-oe/recipes-devtools/fex/fex_2511.bb
rename to meta-oe/recipes-devtools/fex/fex_2601.bb
index 88dd48f953..7d7824d08a 100644
--- a/meta-oe/recipes-devtools/fex/fex_2511.bb
+++ b/meta-oe/recipes-devtools/fex/fex_2601.bb
@@ -20,11 +20,11 @@ SRC_URI =3D " \
 "
=20
 SRCREV_FORMAT =3D "fex"
-SRCREV_fex =3D "663fd5a98befbf7a0ac585627de15c662715a731"
+SRCREV_fex =3D "1188c90c10569ca800d7a99c11e59cfeab5e2cc9"
 SRCREV_cpp-optparse =3D "9f94388a339fcbb0bc95c17768eb786c85988f6e"
 SRCREV_fex-drm =3D "3e49836995c1dcb3df709440ad2f270b569c6a5f"
 SRCREV_xxhash =3D "e626a72bc2321cd320e953a0ccf1584cad60f363"
-SRCREV_jemalloc =3D "ce24593018ca5d5af7e5661ceda9744e02b59f8f"
+SRCREV_jemalloc =3D "97d986993dc735a2022856e7e9fdfa1180e8527a"
 SRCREV_jemalloc-glibc =3D "8436195ad5e1bc347d9b39743af3d29abee59f06"
 SRCREV_robin-map =3D "d5683d9f1891e5b04e3e3b2192b5349dc8d814ea"
 SRCREV_range-v3 =3D "ca1388fb9da8e69314dda222dc7b139ca84e092f"
--=20
2.52.0


