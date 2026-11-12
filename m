Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5136.1794450087915043522
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Nov 2026 18:21:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=ErX+nKQ8;
 spf=pass (domain: gmail.com, ip: 74.125.82.42, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1b3beeaf6f9so1799251c88.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Nov 2026 18:21:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794450087; x=1795054887; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4C7zAW7bL56xRKkC54NIKWnzvw6FkZTErYPWB7dgn/w=;
        b=ErX+nKQ89o29jezgeIcw0v4KG3u5KfQwcCL97oC4miJZsVHQePBO/2ocIJHEej9NZC
         gTTfediL5XfDodaxbGQN1CtPh6GPpothrigugR1w78valxyOMTeqL90td3chhw3Jnnpo
         aUCxEfW2yPH/rd20CdX3uEu8oDYxztxjOTJBF72ZOxoOY4W0ntNxY7Ht3tFzuPR/B43s
         pbox/7qLGHF5Fl2D68XciVzpamAGzHq8NWcrclICvJJCxVsxFegKqLwqfDPDtt3VZfjp
         dWMhbJTl1oqiXYwe2nmblxtHbIflkV2Of9nLnrflt4mvtveczehJrdmR0ZZblcB90kg4
         5QIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794450087; x=1795054887;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4C7zAW7bL56xRKkC54NIKWnzvw6FkZTErYPWB7dgn/w=;
        b=eVycC315gQZMGrctI9vqQrqm3KzT9f5NbFYh3o5zSQScH/QblYvBLQknljLJONyIVZ
         Rstx6UUZxyq+vlXrfFTjv9lJTRlYfg7eGYYpmkq/Gx1MoNAJGPXXXQzfliP6kMRofgtH
         5HodUxth0LSKlDKk3nR1hugegj36mCnDIJ7OUT0hM/dOmtTzUCtkoBhhM5G4c78XcaP1
         awAQSME0gSM+mauPnyb3ZrdifHDHKRRgPAW0BULkp0nwMTQhh3ykKglSO6K7bbHVlFr/
         /J1vC4qF0QixwRcVT9pjIG49XWcTQDRHcNaW3yZwrhlQKGi98Z9Sbx7XuuZQ4b/urb0y
         Va4Q==
X-Gm-Message-State: APuU4Z88ZoeeMSuLTYz9eadQIjKinoqgXvT7p+k5eCXyBRWYEH0c1R1+
	vZYx7mRHjiOy8XsWEeogoVeeTCb8HyWGE0lnrssjrG0/ZznAL1LCjIUiYbB2Ua1kU34=
X-Gm-Gg: AYBFou0KPitrcNg+aqKcgU8T0HkpDsZ88grHV7oAXgoZ+xJ3lux5y5KOXsBxnvZ/N6i
	9htHQc187DwIKahi3/aAqvCtFbqnn9W+iGc7YHSjm1FSzUpqSWC5WcolGOfgERJn18w1z2tqJur
	z1pnZ+GnzJmwGVqCFw/dlAIVNcZDELf6xTM3mJhQVItB7hvHmPVDWiKlCn3oJQlTnDM4WcQxiIB
	zZrfrabLiAzOvncVag2BUpyiwDiWhJ6l2XR2L85ojYTpCmKJ1IIdPndvB+5lVNFJgESA17jV0K7
	xGk9vJ8frehEMkUT9UcWJCiErI7vzpr30tqhGY8ANUu93b9x/+S/cVdQYd4VPxieVdDjVo/tRS2
	D7MlRDrPYfxGAIk3dSy9ijXx5g63Wa+kcMyBcTc7P11+l1uifmEj2qmXUX49bDTKl1ZHfdYfOTj
	7qQPh4jrE1b9PcD1Aax4X0Ph8+CQMR0vfcSFmUoh/oe5ozPK/fqFITTHnxV5HZJ0NS8KgtAqXII
	mgBnhX+jgb69/qTnJ2swh4GPQCMik7oK34PGiuUxIUElLDNPfUNZD64FDrf9EFGnYNcK4cSpGPK
	DjxnZamXmmfCHOaTIoXqTSLnAkbIuTy9zRqM4opIcqhBQ7m6Sa15i/W8fDB4HCcXc3kVE/fowrl
	E+avCMsnsxqtkl39ECrvCjQJv1AeKHdfAFafrXjNkYrhyV+kum+plWp6XfZKVCPV4wBnANkoeqx
	oGjUplz55igSIXcgJ1YlRq0T5gwrycIADlImtw5wGY/d7lRtRaSGe//Y9e9CyuiK1HC7qDjWzYg
	Wu3ISH5d7knWrQewoieHQHEXmg86zfemTnu8v6Hu2NXG54FsbtXsfgBmZOaLAOfbxnrNjG2NvY1
	1YrJ
X-Received: by 2002:a05:7022:5f05:b0:1b3:ac34:bd59 with SMTP id a92af1059eb24-1b3c036b32emr2969678c88.45.1794450086921;
        Wed, 11 Nov 2026 18:21:26 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5890584sm22148612c88.3.2026.11.11.18.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 18:21:26 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 2/2] bpftool-native: Upgrade 6.16 -> 7.3.4
Date: Wed, 11 Nov 2026 18:21:19 -0800
Message-ID: <20261112022121.3643745-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261112022121.3643745-1-khem.raj@oss.qualcomm.com>
References: <20261112022121.3643745-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2026 02:21:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132150
Content-Type: text/plain; charset="utf-8"

Drop patches which are included in this release:
0001-libbpf-Fix-Wdiscarded-qualifiers-under-C23.patch
0002-tools-linux-types.h-Add-128-bit-integer-types-for-ar.patch

Derive the kernel.org v<major>.x directory from PV.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...native_6.16.bb => bpftool-native_7.3.4.bb} |  8 +--
 ...-Fix-Wdiscarded-qualifiers-under-C23.patch | 69 -------------------
 ...s.h-Add-128-bit-integer-types-for-ar.patch | 47 -------------
 3 files changed, 2 insertions(+), 122 deletions(-)
 rename meta-oe/recipes-kernel/bpftool/{bpftool-native_6.16.bb => bpftool-native_7.3.4.bb} (75%)
 delete mode 100644 meta-oe/recipes-kernel/bpftool/bpftool/0001-libbpf-Fix-Wdiscarded-qualifiers-under-C23.patch
 delete mode 100644 meta-oe/recipes-kernel/bpftool/bpftool/0002-tools-linux-types.h-Add-128-bit-integer-types-for-ar.patch

diff --git a/meta-oe/recipes-kernel/bpftool/bpftool-native_6.16.bb b/meta-oe/recipes-kernel/bpftool/bpftool-native_7.3.4.bb
similarity index 75%
rename from meta-oe/recipes-kernel/bpftool/bpftool-native_6.16.bb
rename to meta-oe/recipes-kernel/bpftool/bpftool-native_7.3.4.bb
index f174414200..148afdf3dc 100644
--- a/meta-oe/recipes-kernel/bpftool/bpftool-native_6.16.bb
+++ b/meta-oe/recipes-kernel/bpftool/bpftool-native_7.3.4.bb
@@ -9,12 +9,8 @@ DEPENDS = "binutils-native elfutils-native"

 inherit native bash-completion

-SRC_URI = "\
-    ${KERNELORG_MIRROR}/linux/kernel/v6.x/linux-${PV}.tar.xz \
-    file://0001-libbpf-Fix-Wdiscarded-qualifiers-under-C23.patch \
-    file://0002-tools-linux-types.h-Add-128-bit-integer-types-for-ar.patch \
-"
-SRC_URI[sha256sum] = "1a4be2fe6b5246aa4ac8987a8a4af34c42a8dd7d08b46ab48516bcc1befbcd83"
+SRC_URI = "${KERNELORG_MIRROR}/linux/kernel/v${@d.getVar('PV').split('.')[0]}.x/linux-${PV}.tar.xz"
+SRC_URI[sha256sum] = "b11b6df8295e8e991ff040b71aaa4994a8b55caa23b6b092907f195b5840fd1f"

 S = "${UNPACKDIR}/linux-${PV}"

diff --git a/meta-oe/recipes-kernel/bpftool/bpftool/0001-libbpf-Fix-Wdiscarded-qualifiers-under-C23.patch b/meta-oe/recipes-kernel/bpftool/bpftool/0001-libbpf-Fix-Wdiscarded-qualifiers-under-C23.patch
deleted file mode 100644
index 4726727c3d..0000000000
--- a/meta-oe/recipes-kernel/bpftool/bpftool/0001-libbpf-Fix-Wdiscarded-qualifiers-under-C23.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-From ab21cf885fb2af179c44d8beeabd716133b9385d Mon Sep 17 00:00:00 2001
-From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
-Date: Sat, 6 Dec 2025 14:28:25 +0500
-Subject: [PATCH] libbpf: Fix -Wdiscarded-qualifiers under C23
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-commit d70f79fef65810faf64dbae1f3a1b5623cdb2345 upstream.
-
-glibc ≥ 2.42 (GCC 15) defaults to -std=gnu23, which promotes
--Wdiscarded-qualifiers to an error.
-
-In C23, strstr() and strchr() return "const char *".
-
-Change variable types to const char * where the pointers are never
-modified (res, sym_sfx, next_path).
-
-Suggested-by: Florian Weimer <fweimer@redhat.com>
-Suggested-by: Andrii Nakryiko <andrii@kernel.org>
-Signed-off-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
-Link: https://lore.kernel.org/r/20251206092825.1471385-1-mikhail.v.gavrilov@gmail.com
-Signed-off-by: Alexei Starovoitov <ast@kernel.org>
-[ shung-hsi.yu: needed to fix kernel build failure due to libbpf since glibc
-  2.43+ (which adds 'const' qualifier to strstr) ]
-Signed-off-by: Shung-Hsi Yu <shung-hsi.yu@suse.com>
-Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
-
-Upstream-Status: Backport [https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=linux-6.18.y&id=ab21cf885fb2af179c44d8beeabd716133b9385d]
-Signed-off-by: He Zhe <zhe.he@windriver.com>
----
- tools/lib/bpf/libbpf.c | 7 ++++---
- 1 file changed, 4 insertions(+), 3 deletions(-)
-
-diff --git a/tools/lib/bpf/libbpf.c b/tools/lib/bpf/libbpf.c
-index dd3b2f57082d..9c98c6adb6d0 100644
---- a/tools/lib/bpf/libbpf.c
-+++ b/tools/lib/bpf/libbpf.c
-@@ -8245,7 +8245,7 @@ static int kallsyms_cb(unsigned long long sym_addr, char sym_type,
- 	struct bpf_object *obj = ctx;
- 	const struct btf_type *t;
- 	struct extern_desc *ext;
--	char *res;
-+	const char *res;
-
- 	res = strstr(sym_name, ".llvm.");
- 	if (sym_type == 'd' && res)
-@@ -11574,7 +11574,8 @@ static int avail_kallsyms_cb(unsigned long long sym_addr, char sym_type,
- 		 *
- 		 *   [0] fb6a421fb615 ("kallsyms: Match symbols exactly with CONFIG_LTO_CLANG")
- 		 */
--		char sym_trim[256], *psym_trim = sym_trim, *sym_sfx;
-+		char sym_trim[256], *psym_trim = sym_trim;
-+		const char *sym_sfx;
-
- 		if (!(sym_sfx = strstr(sym_name, ".llvm.")))
- 			return 0;
-@@ -12159,7 +12160,7 @@ static int resolve_full_path(const char *file, char *result, size_t result_sz)
- 		if (!search_paths[i])
- 			continue;
- 		for (s = search_paths[i]; s != NULL; s = strchr(s, ':')) {
--			char *next_path;
-+			const char *next_path;
- 			int seg_len;
-
- 			if (s[0] == ':')
---
-2.34.1
-
diff --git a/meta-oe/recipes-kernel/bpftool/bpftool/0002-tools-linux-types.h-Add-128-bit-integer-types-for-ar.patch b/meta-oe/recipes-kernel/bpftool/bpftool/0002-tools-linux-types.h-Add-128-bit-integer-types-for-ar.patch
deleted file mode 100644
index 2181274430..0000000000
--- a/meta-oe/recipes-kernel/bpftool/bpftool/0002-tools-linux-types.h-Add-128-bit-integer-types-for-ar.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 10a47fb67340bca274276faf855d7d460afd9a7a Mon Sep 17 00:00:00 2001
-From: Will Deacon <will@kernel.org>
-Date: Fri, 26 Jun 2026 15:17:28 +0100
-Subject: [PATCH] tools: linux/types.h: Add 128-bit integer types for arm64 UAPI
- structures
-
-The arm64 UAPI exposes some 128-bit integer types to represent things
-such as fpsimd registers in the sigcontext. In preparation for defining
-these using the '__u128' typedef implemented by uapi/linux/types.h, copy
-that typedef over to the private linux/types.h header used by the tools
-directory.
-
-Cc: Arnd Bergmann <arnd@arndb.de>
-Cc: Arnaldo Carvalho de Melo <acme@redhat.com>
-Cc: David Matlack <dmatlack@google.com>
-Signed-off-by: Will Deacon <will@kernel.org>
-
-Debian 13 now ships linux-libc-dev 7.3, whose arm64 asm/ptrace.h and
-asm/sigcontext.h use __u128. bpftool-native picks up
-tools/include/linux/types.h ahead of the host linux/types.h, so the
-build fails on arm64 hosts with "unknown type name '__u128'".
-
-Upstream-Status: Backport [https://git.kernel.org/torvalds/c/10a47fb67340bca274276faf855d7d460afd9a7a]
-Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
----
- tools/include/linux/types.h | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/tools/include/linux/types.h b/tools/include/linux/types.h
-index d41f8a261bce8..b6c473b7920db 100644
---- a/tools/include/linux/types.h
-+++ b/tools/include/linux/types.h
-@@ -23,6 +23,11 @@ typedef enum {
- 	__GFP_HIGH
- } gfp_t;
-
-+#ifdef __SIZEOF_INT128__
-+typedef __signed__ __int128 __s128 __attribute__((aligned(16)));
-+typedef unsigned __int128 __u128 __attribute__((aligned(16)));
-+#endif
-+
- /*
-  * We define u64 as uint64_t for every architecture
-  * so that we can print it with "%"PRIx64 without getting warnings.
---
-2.53.0
-
