Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3887.1794729064623760480
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 23:51:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=porPygG+;
 spf=pass (domain: gmail.com, ip: 74.125.82.179, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36f6295304dso1939801eec.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 23:51:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794729064; x=1795333864; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fy3z1XFQrhltIzp3vCAK5wHAGkzbMuJosRSduHPRKd4=;
        b=porPygG+KGRa99g6nAQdhb67TlBFjzXJBBv4XWKl6vz3rndq7nKNm7/etxrBRhdX8d
         sZ0Lpt+r1kmKtnx0Ss28PXQIBZPl1zpRIdRZJlEBecPoVEHxQ1Nd0+JnHn9XxFhLfibX
         wg050vbXy89SHbcv6rC1otoVs02kVVhuSGdRd8UgNqFyG77IdhVnP/e2ODgeZ+4lLQzF
         QpDtkeCRILzHDb9OjpFIP2LaLGlleeMIAoQOSOq/lI0ZetNKSw7Wvl8AoZ3nCD9qF+VS
         wYKTPVaV4EeNyo9EetBUoq6c//vtvvVkkCZlP6W5cQ0W/i2nZI9OEvpIS7sABeGB+ECT
         X46Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794729064; x=1795333864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fy3z1XFQrhltIzp3vCAK5wHAGkzbMuJosRSduHPRKd4=;
        b=IAIvs9ImxswhlYqvyj/fBRCPw+ZQXtkE4RgbTVHCV/Bd7Ssx0UPy8Te3fKv8FBfg1J
         GBOKo6DCS7jVdZGaRWhQ7W3ilLrMk9SlHsdP4xFrbFXKWuw0OLB7amvSyDIBi6xQPzQZ
         FDluYh65+n+4X5FUcZCRmGTQdcDoa7UQeP5HF4ICQvJcejVmSJBmQat4wGSRu0kD6IOl
         dJrlTv9LOX1V5Ww+tPNQIKt9Pe0QziWDZtmYqTmOYvigTsj51Md3g7y2LI+ye9qpFIJ0
         bFlOPCN0BoF0HMN8YnYrkQJoD3pHlkyqYOvxTL8w38wQaeECl0ysxZLq0dr9aF/g310c
         wbNw==
X-Gm-Message-State: APuU4Z8+zXEQ9qFdW/RZxLAmMabxMUuL8HaSjgoiwCC59Bl5VidnXhR+
	Netmpzn0kGUSAU/DbQOBDkApG+oClLaNsnANlJR4NHFF5nIq77Js6CwwnawJR4dr
X-Gm-Gg: AYBFou0Bd5LhnzMgGEwvj1q/uTNahDucK6F4ES2F6z8LW1P90LtIxH2DWLwSeZLqou6
	qgZbExIxUXBnxRLXys4vJrrg5OFh8Lilb769Jlwq0lNcHYAm7rl4V9jMW0qV8BhftbJOCz9pFg5
	2IpzkwRltWQ1nZWiV7VfIacrSGQJpeA20sk4QlYRAHM2womHzOvvwssvFxo7dFya1JdldHCiyv1
	5t9LTGAQ6KRmDX4a0/LVjufZDCYovW8/VkXDcz92gw6lBwjuEo/VFN4bk5J5AXYxGDHfypk1qd5
	EXm+nHDJ3ir9kIgRHKQGGKoA2KMIvV+j2SegcCVj06F9Y0WQeN6voeVuCDu+zgzKRZ4FEwhCTFR
	VYSDWk6+Xv4TMd7vzxOyq9Xsju+WiB2oQkFpzpSFLyLOUB6+8CmNKYqyFep2ZYCTmikqhws2Wp3
	MusY155KBffCEXPQImNyXS7Y03eovFMDMY4FMityiqHAaPf50tiNfg8sntMRqI0MqMlsEe2Y3uo
	/yCcJH9GN4vw9wmEizhQd7tiG6L+LZIf978oRHlawHfKnzCBRY2HrEWPe6nU3dXx7OBCryoHY4F
	nsaFe3BsmJJ+/vc+GCtUresT6O+kQxHS172zZNo71oUnECukKcDFn1F/znb2G3rFdsOR2i9kJp8
	RZiumM0+NeCIo04Y00kr+6DA837YeyfZoSKKd/9jnt8BbPVPLjeNqxOzqfuRXz7jWsZFN2Fu/wy
	uPCf/zY2axfnlGr9JaSPuD6VrrBGmA/3dRvM02vGMTFwpFxQEjmghHx301uxVfUnIqXIVUHNrII
	WRElElMydwkSW94PUh7SBbcG8QagW6bV+4wmTNYooMwDLziLvgUKn82ilPcxE/TkfGo1hYp9Eu4
	Q/hy
X-Received: by 2002:a05:693c:414d:20b0:36c:d1fe:84ce with SMTP id 5a478bee46e88-3796740e475mr8197196eec.33.1794729063831;
        Sat, 14 Nov 2026 23:51:03 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm23112817eec.13.2026.11.14.23.51.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:51:02 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 64/96] librust-cxx: upgrade 1.0.202 -> 1.0.205
Date: Sat, 14 Nov 2026 23:48:42 -0800
Message-ID: <20261115074918.2932593-64-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
References: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 07:51:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132334
Content-Type: text/plain; charset="utf-8"

Regenerate the crates list with bitbake -c update_crates.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../librust-cxx/librust-cxx-crates.inc        | 92 +++++++++----------
 ...-cxx_1.0.202.bb => librust-cxx_1.0.205.bb} |  2 +-
 2 files changed, 47 insertions(+), 47 deletions(-)
 rename meta-oe/recipes-devtools/librust-cxx/{librust-cxx_1.0.202.bb => librust-cxx_1.0.205.bb} (93%)

diff --git a/meta-oe/recipes-devtools/librust-cxx/librust-cxx-crates.inc b/meta-oe/recipes-devtools/librust-cxx/librust-cxx-crates.inc
index d54aada670..34c7dfc963 100644
--- a/meta-oe/recipes-devtools/librust-cxx/librust-cxx-crates.inc
+++ b/meta-oe/recipes-devtools/librust-cxx/librust-cxx-crates.inc
@@ -4,31 +4,31 @@
 SRC_URI += " \
     crate://crates.io/anstyle/1.0.14 \
     crate://crates.io/bitflags/2.13.2 \
-    crate://crates.io/cc/1.4.5 \
-    crate://crates.io/cfg-if/1.0.4 \
-    crate://crates.io/clap/4.6.6 \
-    crate://crates.io/clap_builder/4.6.6 \
-    crate://crates.io/clap_lex/1.1.0 \
+    crate://crates.io/cc/1.7.0 \
+    crate://crates.io/cfg-if/1.0.5 \
+    crate://crates.io/clap/4.6.7 \
+    crate://crates.io/clap_builder/4.6.7 \
+    crate://crates.io/clap_lex/1.1.1 \
     crate://crates.io/codespan-reporting/0.13.1 \
-    crate://crates.io/cxx-build/1.0.202 \
-    crate://crates.io/cxx-gen/0.7.202 \
+    crate://crates.io/cxx-build/1.0.205 \
+    crate://crates.io/cxx-gen/0.7.205 \
     crate://crates.io/cxx-test-suite/0.0.1 \
-    crate://crates.io/cxxbridge-cmd/1.0.202 \
-    crate://crates.io/cxxbridge-flags/1.0.202 \
-    crate://crates.io/cxxbridge-macro/1.0.202 \
+    crate://crates.io/cxxbridge-cmd/1.0.205 \
+    crate://crates.io/cxxbridge-flags/1.0.205 \
+    crate://crates.io/cxxbridge-macro/1.0.205 \
     crate://crates.io/dissimilar/1.0.11 \
     crate://crates.io/equivalent/1.0.2 \
     crate://crates.io/errno/0.3.14 \
     crate://crates.io/fastrand/2.5.0 \
-    crate://crates.io/find-msvc-tools/0.1.12 \
+    crate://crates.io/find-msvc-tools/0.1.14 \
     crate://crates.io/foldhash/0.2.0 \
     crate://crates.io/getrandom/0.4.3 \
     crate://crates.io/glob/0.3.4 \
     crate://crates.io/hashbrown/0.17.1 \
     crate://crates.io/indexmap/2.14.2 \
-    crate://crates.io/indoc/2.0.7 \
+    crate://crates.io/indoc/2.0.8 \
     crate://crates.io/itoa/1.0.18 \
-    crate://crates.io/libc/0.2.189 \
+    crate://crates.io/libc/0.2.190 \
     crate://crates.io/link-cplusplus/1.0.12 \
     crate://crates.io/linux-raw-sys/0.12.1 \
     crate://crates.io/memchr/2.8.3 \
@@ -36,26 +36,26 @@ SRC_URI += " \
     crate://crates.io/proc-macro2/1.0.107 \
     crate://crates.io/quote/1.0.47 \
     crate://crates.io/r-efi/6.0.0 \
-    crate://crates.io/rustix/1.1.4 \
+    crate://crates.io/rustix/1.1.5 \
     crate://crates.io/rustversion/1.0.23 \
     crate://crates.io/scratch/1.0.9 \
     crate://crates.io/serde/1.0.229 \
     crate://crates.io/serde_core/1.0.229 \
     crate://crates.io/serde_derive/1.0.229 \
-    crate://crates.io/serde_json/1.0.151 \
-    crate://crates.io/serde_spanned/1.1.1 \
+    crate://crates.io/serde_json/1.0.152 \
+    crate://crates.io/serde_spanned/1.1.2 \
     crate://crates.io/shlex/2.0.1 \
     crate://crates.io/strsim/0.11.1 \
-    crate://crates.io/syn/3.0.5 \
+    crate://crates.io/syn/3.0.7 \
     crate://crates.io/target-tuple/1.0.2 \
     crate://crates.io/tempfile/3.27.0 \
     crate://crates.io/termcolor/1.4.1 \
-    crate://crates.io/toml/1.1.6+spec-1.1.0 \
-    crate://crates.io/toml_datetime/1.1.1+spec-1.1.0 \
-    crate://crates.io/toml_parser/1.1.3+spec-1.1.0 \
-    crate://crates.io/toml_writer/1.1.2+spec-1.1.0 \
-    crate://crates.io/trybuild/1.0.121 \
-    crate://crates.io/unicode-ident/1.0.24 \
+    crate://crates.io/toml/1.1.8+spec-1.1.0 \
+    crate://crates.io/toml_datetime/1.1.2+spec-1.1.0 \
+    crate://crates.io/toml_parser/1.1.5+spec-1.1.0 \
+    crate://crates.io/toml_writer/1.1.3+spec-1.1.0 \
+    crate://crates.io/trybuild/1.0.122 \
+    crate://crates.io/unicode-ident/1.0.26 \
     crate://crates.io/unicode-width/0.2.2 \
     crate://crates.io/winapi-util/0.1.11 \
     crate://crates.io/windows-link/0.2.1 \
@@ -66,31 +66,31 @@ SRC_URI += " \
 
 SRC_URI[anstyle-1.0.14.sha256sum] = "940b3a0ca603d1eade50a4846a2afffd5ef57a9feac2c0e2ec2e14f9ead76000"
 SRC_URI[bitflags-2.13.2.sha256sum] = "3ded4057c258ba199e2d26386d3af3780957ecaee6c4ef4041c6b4b8b97c0b06"
-SRC_URI[cc-1.4.5.sha256sum] = "005ec2760ca554fae18df7a11195552ec576cd665632a881bc011d5bb2fd4d80"
-SRC_URI[cfg-if-1.0.4.sha256sum] = "9330f8b2ff13f34540b44e946ef35111825727b38d33286ef986142615121801"
-SRC_URI[clap-4.6.6.sha256sum] = "473c7e07f409a8d772161724aa8db6a765a2532a70f9667eeb7b49d3d02fbdca"
-SRC_URI[clap_builder-4.6.6.sha256sum] = "7b48fea5a88e9ae728a2dcbedbfc0e730f7d60da42e1cb049a83c9fb8b789889"
-SRC_URI[clap_lex-1.1.0.sha256sum] = "c8d4a3bb8b1e0c1050499d1815f5ab16d04f0959b233085fb31653fbfc9d98f9"
+SRC_URI[cc-1.7.0.sha256sum] = "50a649af8a827553c29fb0cb4bd4a6f1a0dd695bd3232b9bc98bd9c8a3ffbb8b"
+SRC_URI[cfg-if-1.0.5.sha256sum] = "4e7648175b45a9a48536d676f68d918270699102aa8dab5496df06904c914600"
+SRC_URI[clap-4.6.7.sha256sum] = "aa8876b300ab35ba921adea3dfd70157a46249b33f95c9084ae5709785478946"
+SRC_URI[clap_builder-4.6.7.sha256sum] = "ec0797fb7aeb1406c84efac526901f7ec3ead2124f946b494e72879d4b54704d"
+SRC_URI[clap_lex-1.1.1.sha256sum] = "1c133bc6a41be0d194c306b5506d15e6feeea7b1d6604bd3f8310dfb2ca96486"
 SRC_URI[codespan-reporting-0.13.1.sha256sum] = "af491d569909a7e4dee0ad7db7f5341fef5c614d5b8ec8cf765732aba3cff681"
-SRC_URI[cxx-build-1.0.202.sha256sum] = "4fde53ca86b9704a943fef0f1e1d836239a6aedca5de3c65fa9f97ec0bd46d39"
-SRC_URI[cxx-gen-0.7.202.sha256sum] = "5010d4044b4ac8b18aca2341f3a6227aaf332ec8f5e38fcb93cba53451f2dc92"
+SRC_URI[cxx-build-1.0.205.sha256sum] = "bbc2ac76997619d2d888b58ad79488f1c835de41ca4dd3dd7082acf4ecb0a50f"
+SRC_URI[cxx-gen-0.7.205.sha256sum] = "157db3fc21feec4fc9917861635d04fd7a3c4ae9ee3957bb0dc2a96b678e7b87"
 SRC_URI[cxx-test-suite-0.0.1.sha256sum] = "2a0a413bcefc6b37668d9eae784f5fe11232343e11101f1d1834163a509610e7"
-SRC_URI[cxxbridge-cmd-1.0.202.sha256sum] = "07bae89236c811fd4d08ed3441759ac4ac98d752cbfd3de341315ba16ad20ec3"
-SRC_URI[cxxbridge-flags-1.0.202.sha256sum] = "49045042e5fced01b80742aba5508de82aa4f13677ed3fa2b4cda709c40c5918"
-SRC_URI[cxxbridge-macro-1.0.202.sha256sum] = "b181252e2e3d3b5d183afbdc033a3958b445eb3e1a0ae65fc3d4f5259f5da6fd"
+SRC_URI[cxxbridge-cmd-1.0.205.sha256sum] = "54a486ed16a3f2a053fe7f5b98db4c1a59846a23e8cb9e49f9d1bd48830d51a2"
+SRC_URI[cxxbridge-flags-1.0.205.sha256sum] = "c72569be94e2283764d334cd285980b747dbe221e27e315484eb6bcd93fa808a"
+SRC_URI[cxxbridge-macro-1.0.205.sha256sum] = "423e795284a7f7b3f843c956a5322c4bc497b60c2dd1a6339da10313cb18d575"
 SRC_URI[dissimilar-1.0.11.sha256sum] = "aeda16ab4059c5fd2a83f2b9c9e9c981327b18aa8e3b313f7e6563799d4f093e"
 SRC_URI[equivalent-1.0.2.sha256sum] = "877a4ace8713b0bcf2a4e7eec82529c029f1d0619886d18145fea96c3ffe5c0f"
 SRC_URI[errno-0.3.14.sha256sum] = "39cab71617ae0d63f51a36d69f866391735b51691dbda63cf6f96d042b63efeb"
 SRC_URI[fastrand-2.5.0.sha256sum] = "da7c62ceae207dd37ea5b845da6a0696c799f85e97da1ab5b7910be3c1c80223"
-SRC_URI[find-msvc-tools-0.1.12.sha256sum] = "3e0f1c7c3a72c66fd80abe965175f7523475c0489a87d3ff9d6e8c87d87a9d2d"
+SRC_URI[find-msvc-tools-0.1.14.sha256sum] = "aedcfb3409746eddb02b9e19ebda1c3394f759a152e48ee875a0844d1b955484"
 SRC_URI[foldhash-0.2.0.sha256sum] = "77ce24cb58228fbb8aa041425bb1050850ac19177686ea6e0f41a70416f56fdb"
 SRC_URI[getrandom-0.4.3.sha256sum] = "300e883d756b2e4ec94e02791f39b04b522276138852cfc41d9fb7e904106099"
 SRC_URI[glob-0.3.4.sha256sum] = "e4eba85ea1d0a966a983acd07deee566e67395d2d96b6fb39e62b5a833f1eb0b"
 SRC_URI[hashbrown-0.17.1.sha256sum] = "ed5909b6e89a2db4456e54cd5f673791d7eca6732202bbf2a9cc504fe2f9b84a"
 SRC_URI[indexmap-2.14.2.sha256sum] = "cc4e190f5d26ca7051642629da2c52fc03bde85a03197c99408dcd291734c855"
-SRC_URI[indoc-2.0.7.sha256sum] = "79cf5c93f93228cf8efb3ba362535fb11199ac548a09ce117c9b1adc3030d706"
+SRC_URI[indoc-2.0.8.sha256sum] = "a37b2691796cffeb8a8cd305ac66e65841559f147f4e63231d0eafa4db5384d1"
 SRC_URI[itoa-1.0.18.sha256sum] = "8f42a60cbdf9a97f5d2305f08a87dc4e09308d1276d28c869c684d7777685682"
-SRC_URI[libc-0.2.189.sha256sum] = "3eaf3ede3fee6db1a4c2ee091bf8a8b4dccdc6d17f656fb07896ee72867612f2"
+SRC_URI[libc-0.2.190.sha256sum] = "ce5d3ddc6d3fa000eb1536d85e147bfe31aacaba692ed6a876f95cb7c855be78"
 SRC_URI[link-cplusplus-1.0.12.sha256sum] = "7f78c730aaa7d0b9336a299029ea49f9ee53b0ed06e9202e8cb7db9bae7b8c82"
 SRC_URI[linux-raw-sys-0.12.1.sha256sum] = "32a66949e030da00e8c7d4434b251670a91556f4144941d37452769c25d58a53"
 SRC_URI[memchr-2.8.3.sha256sum] = "cf8baf1c55e62ffcace7a9f06f4bd9cd3f0c4beb022d3b367256b91b87513d98"
@@ -98,26 +98,26 @@ SRC_URI[once_cell-1.21.4.sha256sum] = "9f7c3e4beb33f85d45ae3e3a1792185706c8e16d0
 SRC_URI[proc-macro2-1.0.107.sha256sum] = "985e7ec9bb745e6ce6535b544d84d6cd6f7ad8bd711c398938ae983b91a766d9"
 SRC_URI[quote-1.0.47.sha256sum] = "1fbf4db142a473a8d80c26bbf18454ed458bf8d26c8219c331daecfdbd079001"
 SRC_URI[r-efi-6.0.0.sha256sum] = "f8dcc9c7d52a811697d2151c701e0d08956f92b0e24136cf4cf27b57a6a0d9bf"
-SRC_URI[rustix-1.1.4.sha256sum] = "b6fe4565b9518b83ef4f91bb47ce29620ca828bd32cb7e408f0062e9930ba190"
+SRC_URI[rustix-1.1.5.sha256sum] = "891efababe418670775f199f0d233d84843c227a0949a883ce15b37c78d6629d"
 SRC_URI[rustversion-1.0.23.sha256sum] = "cf54715a573b99ac80df0bc206da022bcd442c974952c7b9720069370852e21f"
 SRC_URI[scratch-1.0.9.sha256sum] = "d68f2ec51b097e4c1a75b681a8bec621909b5e91f15bb7b840c4f2f7b01148b2"
 SRC_URI[serde-1.0.229.sha256sum] = "4148590afebada386688f18773da617792bf2ef03ffc1e4cbd2b1d45b023e0ba"
 SRC_URI[serde_core-1.0.229.sha256sum] = "67dca2c9c51e58a4791a4b1ed58308b39c64224d349a935ab5039aa360942a48"
 SRC_URI[serde_derive-1.0.229.sha256sum] = "e7a5d71263a5a7d47b41f6b3f06ba276f10cc18b0931f1799f710578e2309348"
-SRC_URI[serde_json-1.0.151.sha256sum] = "c841b55ecdae098c80dcae9cf767f6f8a0c2cdb3416bbef72181df4d0fe73f14"
-SRC_URI[serde_spanned-1.1.1.sha256sum] = "6662b5879511e06e8999a8a235d848113e942c9124f211511b16466ee2995f26"
+SRC_URI[serde_json-1.0.152.sha256sum] = "1741ab7a6cc54a03a89b5d563ed60075c277d9e3cfa73ad0c1f23f23974703c6"
+SRC_URI[serde_spanned-1.1.2.sha256sum] = "4e7523beb55eece201a2356bee0bbca0d1ab466c14c07703b2e0ee6d42cb0c2c"
 SRC_URI[shlex-2.0.1.sha256sum] = "f8fadd59c855ef2080decdef8ff161eb6661b86933c9d82e5ba29dc602a55aba"
 SRC_URI[strsim-0.11.1.sha256sum] = "7da8b5736845d9f2fcb837ea5d9e2628564b3b043a70948a3f0b778838c5fb4f"
-SRC_URI[syn-3.0.5.sha256sum] = "12df2e0110f65b775f769bb17ef989067a1d931b2eb822bd4346631eeada89f9"
+SRC_URI[syn-3.0.7.sha256sum] = "d62a2e0561533f2ca2561d0cf27fd9fedb640a1bf2616ff5d5c80d99017faadc"
 SRC_URI[target-tuple-1.0.2.sha256sum] = "876fef147edbcbddc8ac5cbbba92c7b86519e314e86638596c09673b2ed01e7f"
 SRC_URI[tempfile-3.27.0.sha256sum] = "32497e9a4c7b38532efcdebeef879707aa9f794296a4f0244f6f69e9bc8574bd"
 SRC_URI[termcolor-1.4.1.sha256sum] = "06794f8f6c5c898b3275aebefa6b8a1cb24cd2c6c79397ab15774837a0bc5755"
-SRC_URI[toml-1.1.6+spec-1.1.0.sha256sum] = "920602543f0911ab71da12c50d59701da54c196d1a2bf5cb4b75667f137a406a"
-SRC_URI[toml_datetime-1.1.1+spec-1.1.0.sha256sum] = "3165f65f62e28e0115a00b2ebdd37eb6f3b641855f9d636d3cd4103767159ad7"
-SRC_URI[toml_parser-1.1.3+spec-1.1.0.sha256sum] = "1d38ac1cf9b95face32296c0a3ede1fdc270627c9d9c02a7274dd6d960dc4d56"
-SRC_URI[toml_writer-1.1.2+spec-1.1.0.sha256sum] = "7d56353a2a665ad0f41a421187180aab746c8c325620617ad883a99a1cbe66d2"
-SRC_URI[trybuild-1.0.121.sha256sum] = "c0cabaa10be1917331a313866bd94526343e03c77bcf69144b62b072ad35d47c"
-SRC_URI[unicode-ident-1.0.24.sha256sum] = "e6e4313cd5fcd3dad5cafa179702e2b244f760991f45397d14d4ebf38247da75"
+SRC_URI[toml-1.1.8+spec-1.1.0.sha256sum] = "20489e00e4d8741d6be680764cc12e270655e375a20d1011e844a9c3379e678d"
+SRC_URI[toml_datetime-1.1.2+spec-1.1.0.sha256sum] = "2b86d767906c6c42421dcba507eb9d203e779497710a47782a224bb871653053"
+SRC_URI[toml_parser-1.1.5+spec-1.1.0.sha256sum] = "baa693a8032d7e1cada7d0041e96126df243179ff061456783ac7f12bda4744c"
+SRC_URI[toml_writer-1.1.3+spec-1.1.0.sha256sum] = "06bdbd8cfc056b8d2e2e85f29b56a3bdbecb527cef81eb39e3e7b98af4652770"
+SRC_URI[trybuild-1.0.122.sha256sum] = "62db9c92d704393fbf2132041720cc80b689f2d3f28521015c2ac866223c11b8"
+SRC_URI[unicode-ident-1.0.26.sha256sum] = "d245f478577f809a851594d02313b640fb437e0bb33866753cff937863096954"
 SRC_URI[unicode-width-0.2.2.sha256sum] = "b4ac048d71ede7ee76d585517add45da530660ef4390e49b098733c6e897f254"
 SRC_URI[winapi-util-0.1.11.sha256sum] = "c2a7b1c03c876122aa43f3020e6c3c3ee5c05081c9a00739faf7503aeba10d22"
 SRC_URI[windows-link-0.2.1.sha256sum] = "f0805222e57f7521d6a62e36fa9163bc891acd422f971defe97d64e70d0a4fe5"
diff --git a/meta-oe/recipes-devtools/librust-cxx/librust-cxx_1.0.202.bb b/meta-oe/recipes-devtools/librust-cxx/librust-cxx_1.0.205.bb
similarity index 93%
rename from meta-oe/recipes-devtools/librust-cxx/librust-cxx_1.0.202.bb
rename to meta-oe/recipes-devtools/librust-cxx/librust-cxx_1.0.205.bb
index 4b8a7a71ea..695f9b4043 100644
--- a/meta-oe/recipes-devtools/librust-cxx/librust-cxx_1.0.202.bb
+++ b/meta-oe/recipes-devtools/librust-cxx/librust-cxx_1.0.205.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = " \
 "
 
 SRC_URI = "crate://crates.io/cxx/${PV};name=cxx"
-SRC_URI[cxx.sha256sum] = "13f6de320895f42e6e081abb5c7983bedcf0b6d0ff9323de0d33f620c8ac1199"
+SRC_URI[cxx.sha256sum] = "c8a02bfeba9074b2bbb39492c9b0908ec854f455a3cccdcde7a1de55e2315e40"
 
 S = "${CARGO_VENDORING_DIRECTORY}/cxx-${PV}"
 
