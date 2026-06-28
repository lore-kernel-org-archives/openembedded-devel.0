Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BF75C44508
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 16:22:51 +0000 (UTC)
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.75160.1782663770882931920
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 09:22:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=rbCya1pn;
 spf=pass (domain: gmail.com, ip: 74.125.82.177, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-30eac9abd79so1144468eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 09:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782663770; x=1783268570; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DnVV2RY7tYH/x6VcqaBAIsQEY77GLfJHTcWE0HIA+oU=;
        b=rbCya1pn7v+Dh0ygKcy0I+h//t07UVFPZE9p6k9h9qWFCJDZq5DxMTDurWwXbH6qtj
         bzb2/kenDFJ8btT2qt99QfUqFMIleDIC/69ieclyp/4IEIYowRUoNiE75ktE+i60qKEc
         9nw4CGC6y5nd+GUYk6eCLyGOSrMmRDoRgToXI4hTv3Z/6VtPfpizbViNWaMlgAzVoSwT
         OdFxBWhar6c5ri5d+eLecMo6B5ESuHvqoPWCO0A75rD9oQbW57N2qhT8t+jqVXLqOGQi
         /co+WinRZQUO28uZw7g53+Gy25CUuHCDBsCWC6QRyy8IkP4R0Jp6/6eQyVmIoawUNbi9
         vahA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782663770; x=1783268570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DnVV2RY7tYH/x6VcqaBAIsQEY77GLfJHTcWE0HIA+oU=;
        b=cDpM8x2hIFzZL+8nMpzdw9luyKjly31tvb0RoexQpORKzVe58LGxBGvvzkBDqRebBe
         RxXC/HxUTfwz6+G6G6Q3Lrr4Rs5MzSocTfwU7J9OWoq6lQ0g/8SShwMCVSoUWi2L87na
         8Sv1Yjz/PFTVungMD4qkEIUc2RBbtl3R7AYL2rF5e+KKm3VNfPHAvhDDRaghBZc2diL+
         +FiAhyqOfO6bwLVZbdO6DiaUxUWsoxAQ4aacw2bhbzrTl/mr4Ls5pf+ZWnqQIRFq3ydx
         bvVGloLYMYTNHHa8REhLno/IVeCSC4IQ5y6lgV05WVMoDP0kbf7dW8DOqqy4/H5zxE0k
         xM1A==
X-Gm-Message-State: AOJu0Yyoy24jwYofZjxsl6Z8Ewd5MmgLu/NDb7f09syvetdN7+9OyVqX
	Ah3/mir1qUmjOtI6DV7AMnjrHUnuT8OJgGM5EPsybx7p032qkumJUdohN97UQL4kKdt9fA==
X-Gm-Gg: AfdE7cl/Wm1QKA63xBO6GunQbedHklap/nD0xegrALEUtnc+krACQY4Bu6kFRPSoeW1
	R6qDb0EAYswA5Vn0mHpRqG71pNZpVDcgNnOj26uA2cOmIXgoET8sLkdegZTdV+zktIX11VgtIno
	2xZgUa0vSOJr2DIkUGjdzjb5gmXB10DtO7st9xcGMJYEir9fbO2uWcoQHbu98+ty0f9KC5OwqPS
	bigY4/wjtvF7mJZNHX007qhtU18oSVXEmPHHnKK7q9fI9vJPtUpmXNtMggaKiBOypcv682zOT2I
	Lo6UsMFmFOMLlfKPxS8ueKVG1roffjxSqRbKdaiyJceo8DOO1dlXbXyLYeItF6tjqSH002Ta7pq
	mUyEVwa91CnM0xco7f+zL1/jJCfffYixMB6DZptITF+dbRwHadQpsXpYMZWXYySfS1a+ISPyd6M
	3awX9pyNqxxD+J4hkw7kvorWc0hOCRyOfRzM0FB1T19xWrUcIWtGBqJTmCNR76/HrSloQdzKfvE
	MZZQwuWHNatcFqoLtjSf2QSXyufuyWiKbENUUaDfi69O6bVMJlukTGCEWvcXAJsShvpFzhVrSxF
	Erap+GaL/0CWvIK5NxVxQ5kotprB3A==
X-Received: by 2002:a05:693c:2281:b0:30c:689b:c59d with SMTP id 5a478bee46e88-30caae2f3a6mr8251470eec.5.1782663770187;
        Sun, 28 Jun 2026 09:22:50 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c52c591sm49849445eec.7.2026.06.28.09.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 09:22:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 125/128] usbguard: fix bundled PEGTL demangle static_assert with GCC 16
Date: Sun, 28 Jun 2026 09:22:19 -0700
Message-ID: <20260628162222.4081517-25-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628162222.4081517-1-khem.raj@oss.qualcomm.com>
References: <20260628162222.4081517-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 16:22:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127935

The bundled PEGTL parses __PRETTY_FUNCTION__ at compile time and trips a
static_assert under GCC 16:

  src/ThirdParty/PEGTL/include/tao/pegtl/demangle.hpp:118:23:
  error: static assertion failed

usbguard demangles PEGTL rules built from ascii::one<'\000', '\012'>,
i.e. types with a char non-type template parameter whose value is '\0'.
GCC 16 renders such a parameter as a literal NUL byte and truncates
__PRETTY_FUNCTION__ there:

  constexpr std::string_view demangle() [with T = seq<one<'

so the trailing "; std::string_view = ...]" and even the closing ']' are
gone, and rfind(';')/rfind(']') both return npos.

Patch demangle() to fall back to the remainder of the string when no
';'/']' terminator survives, instead of failing the build; the demangled
name is only used for tracing diagnostics. Type names without a '\0' char
parameter are unaffected.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...x-demangle-static_assert-with-GCC-16.patch | 59 +++++++++++++++++++
 .../usbguard/usbguard_1.1.4.bb                |  1 +
 2 files changed, 60 insertions(+)
 create mode 100644 meta-oe/recipes-security/usbguard/usbguard/0001-PEGTL-fix-demangle-static_assert-with-GCC-16.patch

diff --git a/meta-oe/recipes-security/usbguard/usbguard/0001-PEGTL-fix-demangle-static_assert-with-GCC-16.patch b/meta-oe/recipes-security/usbguard/usbguard/0001-PEGTL-fix-demangle-static_assert-with-GCC-16.patch
new file mode 100644
index 0000000000..9538af1b40
--- /dev/null
+++ b/meta-oe/recipes-security/usbguard/usbguard/0001-PEGTL-fix-demangle-static_assert-with-GCC-16.patch
@@ -0,0 +1,59 @@
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 25 Jun 2026 00:00:00 +0000
+Subject: [PATCH] PEGTL: fix demangle() static_assert with GCC 16
+
+The bundled PEGTL demangles type names at compile time by parsing
+__PRETTY_FUNCTION__, which looks like
+
+  ...[with T = X; std::string_view = std::basic_string_view<char>]
+
+and locating the end of the type name via rfind(';').
+
+usbguard instantiates demangle() for PEGTL rules built from
+ascii::one<'\000', '\012'> (and friends), i.e. types that carry a char
+non-type template parameter whose value is '\0'. GCC 16 renders such a
+parameter as a literal NUL byte in __PRETTY_FUNCTION__ and truncates the
+generated string at that byte:
+
+  constexpr std::string_view demangle() [with T = seq<one<'
+
+so the trailing "; std::string_view = ...]" alias and even the closing
+']' are gone. rfind(';') and rfind(']') both return npos and the
+demangler trips:
+
+  src/ThirdParty/PEGTL/include/tao/pegtl/demangle.hpp:118:23:
+  error: static assertion failed
+
+The demangled name is only used for human-readable tracing diagnostics,
+so rather than fail the build, fall back to the remainder of the string
+when no ';' or ']' terminator survives. Type names without a '\0' char
+parameter are unaffected.
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/ThirdParty/PEGTL/include/tao/pegtl/demangle.hpp | 13 +++++++++++--
+ 1 file changed, 11 insertions(+), 2 deletions(-)
+
+--- a/src/ThirdParty/PEGTL/include/tao/pegtl/demangle.hpp
++++ b/src/ThirdParty/PEGTL/include/tao/pegtl/demangle.hpp
+@@ -114,8 +114,17 @@
+    constexpr auto begin = sv.find( '=' );
+    static_assert( begin != std::string_view::npos );
+    constexpr auto tmp = sv.substr( begin + 2 );
+-   constexpr auto end = tmp.rfind( ';' );
+-   static_assert( end != std::string_view::npos );
++   // GCC 16 renders a char non-type template parameter whose value is '\0'
++   // (e.g. PEGTL's ascii::one<'\000', ...>) as a literal NUL byte inside
++   // __PRETTY_FUNCTION__ and truncates the generated string there, dropping
++   // the trailing "; std::string_view = ...]" alias and even the closing
++   // ']'. Fall back to the remainder of the string instead of failing a
++   // static_assert (the demangled name is only used for tracing output).
++   constexpr auto semi = tmp.rfind( ';' );
++   constexpr auto brak = tmp.rfind( ']' );
++   constexpr auto end = ( semi != std::string_view::npos ) ? semi
++                      : ( brak != std::string_view::npos ) ? brak
++                      : tmp.size();
+    return tmp.substr( 0, end );
+ }
diff --git a/meta-oe/recipes-security/usbguard/usbguard_1.1.4.bb b/meta-oe/recipes-security/usbguard/usbguard_1.1.4.bb
index 3d181173a5..bed6618fb8 100644
--- a/meta-oe/recipes-security/usbguard/usbguard_1.1.4.bb
+++ b/meta-oe/recipes-security/usbguard/usbguard_1.1.4.bb
@@ -13,6 +13,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "https://github.com/USBGuard/usbguard/releases/download/${BPN}-${PV}/${BPN}-${PV}.tar.gz \
            file://0001-Add-and-use-pkgconfig-instead-of-libgcrypt-config.patch \
+           file://0001-PEGTL-fix-demangle-static_assert-with-GCC-16.patch \
            "
 
 SRC_URI[sha256sum] = "7d76b75e779e3c9e6c2fc10e7389dfa34056864c9f0c6eaca722687b7e75893c"

