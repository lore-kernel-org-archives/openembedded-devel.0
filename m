Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48518.1795411840799583952
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2026 21:30:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=wztKAeP+;
 spf=pass (domain: gmail.com, ip: 74.125.82.178, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-33fb4680717so8133278eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Nov 2026 21:30:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795411840; x=1796016640; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TLldldY9D2UIcODc1QT8M9KPkLQ6z6VXmKoMYDqhx00=;
        b=wztKAeP+1GfyEdPO6F0xaR8+/VZBDnihnIfn0GpiZvrmY4JyEWiDzz2ofOj6UJG2L1
         uZwXYlcN4siJT5J6Uhh2zGehhqUv0fPANlnM3aAMcIfW/GQQ+caNYO3CEP346rSJPZuh
         V8pksATM4MWbcdwsi8rzjHESeajM4MktTHwgtVdh+acOTHa18n55+yo3yl5oo9DOZ1VQ
         yI0i7W7acCv1kTlqhcd4Ig/KwVwoMogPBT73AHfOdcZwFcJTSC0P6yHjlXLI+DWRqAm+
         aAGW6Wb7aJk4d7+MnuizjMyMkAjwex6ZL8mH8NjdFDOmIhKI5V8usJcspX9CaEfheJ02
         WgqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411840; x=1796016640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TLldldY9D2UIcODc1QT8M9KPkLQ6z6VXmKoMYDqhx00=;
        b=Cy2jL49r82jpvQwtwxgNEDluzpYweE6H5w+GlzARcXIaSG/5N/sB16P5gsqz0+NgVf
         4UffzpXxYuVqyXvRUNXLS64TTLuJ3DxKxCfNCVlmFT/3WINMaVav+oZd+anB888FO+GA
         jsbm24JlKYCDMEXAvzZOSrI2hph4nC/QvT9KNWrQV4KPQL7JnpXR7j7lBjZV0nhnTzbr
         IqOPHihDLQX1MvyexVPHisNp3Bd1lnbzjzSEwlRlDcr39DUxyYo6s3dXqSXkr97Ziqda
         RBuzwq5r0VkvSXaUAX9BrafQjOpj09qmHFPIrzkq3NiiUFgnBOZlA9PEFtYkamtXBTEf
         2rbQ==
X-Gm-Message-State: APuU4Z9ivXz5ja7reTsV+svAbkS33m/AGnRhDACi2rtR1YN5r+MdttOZ
	1GiJujjyCcS0C+XSY7uGGQU2RuWQIEPQepSZJA/LUbOW7AXmAPiVuYxxh9bzKYYqraE=
X-Gm-Gg: AZFdTZdUbj+1MPtp8NWE2fp+5BJ2KYMDyjfgqNMEeyd4KTMpB6pFgUTX77mtf4d5i0h
	P5y2Q2DQPtwSGP96Pjs/N88h+zqrwobfu1VCxgJlLFWShjMU2b/f+e/5+vFICOdQvRuVwbpxLGR
	4bsvXf6K543EqrUnjhmBb2PWR1ZiKBpZUwcUqFSWDIEGaTFPP+nW4XUtxQ9TM9Dl8ouP2Rol4cI
	ZqDC+nZgu3e9ex4r+utiBbruLVOm7r3OdED57fcz7EtKusJ6WdzIKx6knlJ/nH3V15VAmmUVJny
	uagl5ltYpX0C0DcVAE7AVaiRM1K0dOeSts728Dl2GK8tg/89ky/SyNbJR7Lul/L9OzPxUczcdGP
	0XQfOmC3++GR7SqPUIiwc3LpBYHGYSrbQRwtJWYDSX5cQIxPsF760D+Zx+nHt+1l+WrGJshBiAu
	zhj0oKCIQEov1XBicHycmdgXc51RfBOeSiWDRwH+p5oc8al3fcS8ryt+7I2jJRF0J44i2KulyRv
	m/wXkB563Cud4KJS8p5Ofd5Rnf7Wevber4s/34sSJL+JlaGLLA87n97nV5yPWEg5h04KkxjQWN9
	1HmcD4THyL8x21D6NFgoysBcXMv7BTdqEhHM8OiJ/NDvsdBNrdxHARR9k3S2YxNqRKNeaTbzPzC
	wSrxrwn1CLdVAzOReLYX3zcJXkzva6l369ZDCD4ymIhjcOYU5V4rGh2LX4GRD0tszMjuhomYE87
	ov2Cw2D2/UI0vxn27DlpR7bfiwWuCaVWLIXzew2kS7cWEbJsmmYiZk4VhqmjrrmjWmgZtAhsAyF
	zMxiAkTF6kKZ8g4ooXzSaYul+GUCyRHJEthXQNhGasjiFSqJ4kX9DNnUhY95jMMum5NU7IN0DyV
	unt7
X-Received: by 2002:a05:7301:4209:b0:369:fc93:eda5 with SMTP id 5a478bee46e88-3857054b988mr11886626eec.39.1795411839917;
        Sun, 22 Nov 2026 21:30:39 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm36573136eec.26.2026.11.22.21.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:30:39 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 07/42] cpprest: upgrade 2.10.20 -> 2.10.21
Date: Sun, 22 Nov 2026 21:28:51 -0800
Message-ID: <20261123052953.3658549-35-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
References: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 05:30:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132822
Content-Type: text/plain; charset="utf-8"

- Fix Base64 encoding/decoding and single-character file reads on
  big-endian systems
- Fix JSON parsing during static initialization with a static cpprest
- Parse relative references with a colon in the query or fragment
- Link Boost::boost from the installed cmake target so
  find_package(cpprestsdk) works with Boost in a non-default path
- Capture this explicitly in lambdas for C++20

Drop the 63, 65 and 68 patches; those pull requests are merged in
2.10.21.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-support/cpprest/cpprest/63.patch  | 180 ------------------
 .../recipes-support/cpprest/cpprest/65.patch  |  94 ---------
 .../recipes-support/cpprest/cpprest/68.patch  | 153 ---------------
 ...-lts.bb => cpprest_2.10.21+cpprest-lts.bb} |   9 +-
 4 files changed, 3 insertions(+), 433 deletions(-)
 delete mode 100644 meta-oe/recipes-support/cpprest/cpprest/63.patch
 delete mode 100644 meta-oe/recipes-support/cpprest/cpprest/65.patch
 delete mode 100644 meta-oe/recipes-support/cpprest/cpprest/68.patch
 rename meta-oe/recipes-support/cpprest/{cpprest_2.10.20+cpprest-lts.bb => cpprest_2.10.21+cpprest-lts.bb} (74%)

diff --git a/meta-oe/recipes-support/cpprest/cpprest/63.patch b/meta-oe/recipes-support/cpprest/cpprest/63.patch
deleted file mode 100644
index 72945b3db3..0000000000
--- a/meta-oe/recipes-support/cpprest/cpprest/63.patch
+++ /dev/null
@@ -1,180 +0,0 @@
-Upstream-Status: Submitted [https://github.com/cpprest-lts/cpprestsdk/pull/63]
-From 80b15041c4001a8f49fe556b835e2781d54a7f69 Mon Sep 17 00:00:00 2001
-From: Gianfranco Costamagna <locutusofborg@debian.org>
-Date: Fri, 13 Nov 2026 13:34:16 +0100
-Subject: [PATCH] Fix Base64 encoding and decoding on big-endian systems
-
-Replace implementation-defined bitfields with explicit byte shifts.
----
- Release/src/utilities/base64.cpp | 87 +++++++-------------------------
- 1 file changed, 17 insertions(+), 70 deletions(-)
-
-diff --git a/Release/src/utilities/base64.cpp b/Release/src/utilities/base64.cpp
-index 1cb235c3b5..9038278d22 100644
---- a/Release/src/utilities/base64.cpp
-+++ b/Release/src/utilities/base64.cpp
-@@ -43,30 +43,6 @@ const std::array<unsigned char, 128> _base64_dectbl = {
-      23,  24,  25,  255, 255, 255, 255, 255, 255, 26,  27,  28,  29,  30,  31,  32,  33,  34,  35,  36,  37,  38,
-      39,  40,  41,  42,  43,  44,  45,  46,  47,  48,  49,  50,  51,  255, 255, 255, 255, 255}};
- 
--struct _triple_byte
--{
--    unsigned char _1_1 : 2;
--    unsigned char _0 : 6;
--    unsigned char _2_1 : 4;
--    unsigned char _1_2 : 4;
--    unsigned char _3 : 6;
--    unsigned char _2_2 : 2;
--};
--
--struct _double_byte
--{
--    unsigned char _1_1 : 2;
--    unsigned char _0 : 6;
--    unsigned char _2_1 : 4;
--    unsigned char _1_2 : 4;
--};
--
--struct _single_byte
--{
--    unsigned char _1_1 : 2;
--    unsigned char _0 : 6;
--};
--
- //
- // A note on the implementation of BASE64 encoding and decoding:
- //
-@@ -75,10 +51,6 @@ struct _single_byte
- // ignoring CRLF, relaxed validation rules, etc. The decoder is currently pretty strict.
- //
- 
--#ifdef __GNUC__
--// gcc is concerned about the bitfield uses in the code, something we simply need to ignore.
--#pragma GCC diagnostic ignored "-Wconversion"
--#endif
- std::vector<unsigned char> _from_base64(const utility::string_t& input)
- {
-     std::vector<unsigned char> result;
-@@ -134,26 +106,14 @@ std::vector<unsigned char> _from_base64(const utility::string_t& input)
-     size_t idx = 0;
-     for (; size > 4; ++idx)
-     {
--        unsigned char target[3];
--        memset(target, 0, sizeof(target));
--        _triple_byte* record = reinterpret_cast<_triple_byte*>(target);
--
-         unsigned char val0 = _base64_dectbl[ptr[0]];
-         unsigned char val1 = _base64_dectbl[ptr[1]];
-         unsigned char val2 = _base64_dectbl[ptr[2]];
-         unsigned char val3 = _base64_dectbl[ptr[3]];
- 
--        record->_0 = val0;
--        record->_1_1 = val1 >> 4;
--        result[idx] = target[0];
--
--        record->_1_2 = val1 & 0xF;
--        record->_2_1 = val2 >> 2;
--        result[++idx] = target[1];
--
--        record->_2_2 = val2 & 0x3;
--        record->_3 = val3 & 0x3F;
--        result[++idx] = target[2];
-+        result[idx] = static_cast<unsigned char>((val0 << 2) | (val1 >> 4));
-+        result[++idx] = static_cast<unsigned char>((val1 << 4) | (val2 >> 2));
-+        result[++idx] = static_cast<unsigned char>((val2 << 6) | val3);
- 
-         ptr += 4;
-         size -= 4;
-@@ -163,45 +123,35 @@ std::vector<unsigned char> _from_base64(const utility::string_t& input)
-     // in all the iterations (a performance issue).
- 
-     {
--        unsigned char target[3];
--        memset(target, 0, sizeof(target));
--        _triple_byte* record = reinterpret_cast<_triple_byte*>(target);
--
-         unsigned char val0 = _base64_dectbl[ptr[0]];
-         unsigned char val1 = _base64_dectbl[ptr[1]];
-         unsigned char val2 = _base64_dectbl[ptr[2]];
-         unsigned char val3 = _base64_dectbl[ptr[3]];
- 
--        record->_0 = val0;
--        record->_1_1 = val1 >> 4;
--        result[idx] = target[0];
-+        result[idx] = static_cast<unsigned char>((val0 << 2) | (val1 >> 4));
- 
--        record->_1_2 = val1 & 0xF;
-         if (val2 != 254)
-         {
--            record->_2_1 = val2 >> 2;
--            result[++idx] = target[1];
-+            result[++idx] = static_cast<unsigned char>((val1 << 4) | (val2 >> 2));
-         }
-         else
-         {
-             // There shouldn't be any information (ones) in the unused bits,
--            if (record->_1_2 != 0)
-+            if ((val1 & 0xF) != 0)
-             {
-                 throw std::runtime_error("Invalid end of base64 string");
-             }
-             return result;
-         }
- 
--        record->_2_2 = val2 & 0x3;
-         if (val3 != 254)
-         {
--            record->_3 = val3 & 0x3F;
--            result[++idx] = target[2];
-+            result[++idx] = static_cast<unsigned char>((val2 << 6) | val3);
-         }
-         else
-         {
-             // There shouldn't be any information (ones) in the unused bits.
--            if (record->_2_2 != 0)
-+            if ((val2 & 0x3) != 0)
-             {
-                 throw std::runtime_error("Invalid end of base64 string");
-             }
-@@ -218,11 +168,10 @@ utility::string_t _to_base64(const unsigned char* ptr, size_t size)
- 
-     for (; size >= 3;)
-     {
--        const _triple_byte* record = reinterpret_cast<const _triple_byte*>(ptr);
--        unsigned char idx0 = record->_0;
--        unsigned char idx1 = (record->_1_1 << 4) | record->_1_2;
--        unsigned char idx2 = (record->_2_1 << 2) | record->_2_2;
--        unsigned char idx3 = record->_3;
-+        unsigned char idx0 = static_cast<unsigned char>(ptr[0] >> 2);
-+        unsigned char idx1 = static_cast<unsigned char>(((ptr[0] & 0x3) << 4) | (ptr[1] >> 4));
-+        unsigned char idx2 = static_cast<unsigned char>(((ptr[1] & 0xF) << 2) | (ptr[2] >> 6));
-+        unsigned char idx3 = static_cast<unsigned char>(ptr[2] & 0x3F);
-         result.push_back(char_t(_base64_enctbl[idx0]));
-         result.push_back(char_t(_base64_enctbl[idx1]));
-         result.push_back(char_t(_base64_enctbl[idx2]));
-@@ -234,9 +183,8 @@ utility::string_t _to_base64(const unsigned char* ptr, size_t size)
-     {
-         case 1:
-         {
--            const _single_byte* record = reinterpret_cast<const _single_byte*>(ptr);
--            unsigned char idx0 = record->_0;
--            unsigned char idx1 = (record->_1_1 << 4);
-+            unsigned char idx0 = static_cast<unsigned char>(ptr[0] >> 2);
-+            unsigned char idx1 = static_cast<unsigned char>((ptr[0] & 0x3) << 4);
-             result.push_back(char_t(_base64_enctbl[idx0]));
-             result.push_back(char_t(_base64_enctbl[idx1]));
-             result.push_back('=');
-@@ -245,10 +193,9 @@ utility::string_t _to_base64(const unsigned char* ptr, size_t size)
-         }
-         case 2:
-         {
--            const _double_byte* record = reinterpret_cast<const _double_byte*>(ptr);
--            unsigned char idx0 = record->_0;
--            unsigned char idx1 = (record->_1_1 << 4) | record->_1_2;
--            unsigned char idx2 = (record->_2_1 << 2);
-+            unsigned char idx0 = static_cast<unsigned char>(ptr[0] >> 2);
-+            unsigned char idx1 = static_cast<unsigned char>(((ptr[0] & 0x3) << 4) | (ptr[1] >> 4));
-+            unsigned char idx2 = static_cast<unsigned char>((ptr[1] & 0xF) << 2);
-             result.push_back(char_t(_base64_enctbl[idx0]));
-             result.push_back(char_t(_base64_enctbl[idx1]));
-             result.push_back(char_t(_base64_enctbl[idx2]));
diff --git a/meta-oe/recipes-support/cpprest/cpprest/65.patch b/meta-oe/recipes-support/cpprest/cpprest/65.patch
deleted file mode 100644
index cd80d6a95d..0000000000
--- a/meta-oe/recipes-support/cpprest/cpprest/65.patch
+++ /dev/null
@@ -1,94 +0,0 @@
-Upstream-Status: Submitted [https://github.com/cpprest-lts/cpprestsdk/pull/65]
-From 95a56289b4f4c38357b77bdeec5f68e3443209a9 Mon Sep 17 00:00:00 2001
-From: Gianfranco Costamagna <locutusofborg@debian.org>
-Date: Fri, 13 Nov 2026 23:05:48 +0100
-Subject: [PATCH] Fix single-character file reads on big-endian systems
-
----
- Release/include/cpprest/filestream.h               | 12 ++++++------
- .../tests/functional/streams/fstreambuf_tests.cpp  | 14 ++++++++++++++
- 2 files changed, 20 insertions(+), 6 deletions(-)
-
-diff --git a/Release/include/cpprest/filestream.h b/Release/include/cpprest/filestream.h
-index da7743d89..2091503b6 100644
---- a/Release/include/cpprest/filestream.h
-+++ b/Release/include/cpprest/filestream.h
-@@ -399,7 +399,7 @@ class basic_file_buffer : public details::streambuf_state_manager<_CharType>
-             {
-                 pplx::extensibility::scoped_recursive_lock_t lck(m_info->m_lock);
-                 m_info->m_rdpos += 1;
--                _CharType ch1 = (_CharType)callback->m_ch;
-+                int_type ch1 = static_cast<int_type>(std::char_traits<_CharType>::to_int_type(callback->m_ch));
-                 delete callback;
-                 return pplx::task_from_result<int_type>(ch1);
-             }
-@@ -453,7 +453,7 @@ class basic_file_buffer : public details::streambuf_state_manager<_CharType>
-         if (ch == sizeof(_CharType))
-         {
-             pplx::extensibility::scoped_recursive_lock_t lck(m_info->m_lock);
--            _CharType ch1 = (_CharType)callback->m_ch;
-+            int_type ch1 = static_cast<int_type>(std::char_traits<_CharType>::to_int_type(callback->m_ch));
-             delete callback;
-             return pplx::task_from_result<int_type>(ch1);
-         }
-@@ -874,7 +874,7 @@ class basic_file_buffer : public details::streambuf_state_manager<_CharType>
-             if (result == sizeof(_CharType))
-             {
-                 m_info->m_rdpos += 1;
--                m_op.set(m_ch);
-+                m_op.set(static_cast<int_type>(std::char_traits<_CharType>::to_int_type(m_ch)));
-             }
-             else
-             {
-@@ -889,7 +889,7 @@ class basic_file_buffer : public details::streambuf_state_manager<_CharType>
-             delete this;
-         }
- 
--        int_type m_ch;
-+        _CharType m_ch;
- 
-     private:
-         _file_info* m_info;
-@@ -908,7 +908,7 @@ class basic_file_buffer : public details::streambuf_state_manager<_CharType>
-         {
-             if (result == sizeof(_CharType))
-             {
--                m_op.set(m_ch);
-+                m_op.set(static_cast<int_type>(std::char_traits<_CharType>::to_int_type(m_ch)));
-             }
-             else
-             {
-@@ -917,7 +917,7 @@ class basic_file_buffer : public details::streambuf_state_manager<_CharType>
-             delete this;
-         }
- 
--        int_type m_ch;
-+        _CharType m_ch;
- 
-         virtual void on_error(const std::exception_ptr& e)
-         {
-diff --git a/Release/tests/functional/streams/fstreambuf_tests.cpp b/Release/tests/functional/streams/fstreambuf_tests.cpp
-index bd6363309..9b38eaa99 100644
---- a/Release/tests/functional/streams/fstreambuf_tests.cpp
-+++ b/Release/tests/functional/streams/fstreambuf_tests.cpp
-@@ -305,6 +305,20 @@ SUITE(file_buffer_tests)
-         VERIFY_IS_FALSE(stream.is_open());
-     }
- 
-+    TEST(ReadSingleChar_full_value)
-+    {
-+        utility::string_t fname = U("ReadSingleChar_full_value.txt");
-+        fill_file(fname);
-+
-+        auto peekStream = OPEN_R<uint8_t>(fname).get();
-+        VERIFY_ARE_EQUAL('a', peekStream.getc().get());
-+        peekStream.close().get();
-+
-+        auto readStream = OPEN_R<uint8_t>(fname).get();
-+        VERIFY_ARE_EQUAL('a', readStream.bumpc().get());
-+        readStream.close().get();
-+    }
-+
-     TEST(SequentialReadWrite)
-     {
-         utility::string_t fname = U("SequentialReadWrite.txt");
diff --git a/meta-oe/recipes-support/cpprest/cpprest/68.patch b/meta-oe/recipes-support/cpprest/cpprest/68.patch
deleted file mode 100644
index a680e14d89..0000000000
--- a/meta-oe/recipes-support/cpprest/cpprest/68.patch
+++ /dev/null
@@ -1,153 +0,0 @@
-Upstream-Status: Submitted [https://github.com/cpprest-lts/cpprestsdk/pull/68]
-From b2409a5dc8e53c60df35a78e2aa703a8f2ed66b8 Mon Sep 17 00:00:00 2001
-From: Gareth Sylvester-Bradley <garethsb@nvidia.com>
-Date: Mon, 16 Nov 2026 23:49:03 +0000
-Subject: [PATCH] Run the tests that need the internet as a separate ctest test
-
-Ten httpclient_test tests send requests to hosts on the internet, so
-they fail in a build environment without network access, such as a
-distribution package build. They now have "Requires", "network", like
-the badssl tests have "Requires", "badssl", so test_runner runs them
-only when it is passed /network.
-
-The new httpclient_test_network ctest test runs them, and has the
-network label. The badssl ctest tests also have the network label, so
-ctest -LE network runs every test that needs only the local machine.
-CI runs ctest -LE badssl, which still includes the network tests.
-
-Signed-off-by: Gareth Sylvester-Bradley <garethsb@nvidia.com>
----
- .../tests/functional/http/client/CMakeLists.txt    |  7 ++++++-
- .../http/client/authentication_tests.cpp           |  4 ++--
- .../http/client/connections_and_errors.cpp         |  2 +-
- .../tests/functional/http/client/outside_tests.cpp | 14 +++++++-------
- Release/tests/functional/websockets/CMakeLists.txt |  2 +-
- 5 files changed, 17 insertions(+), 12 deletions(-)
-
-diff --git a/Release/tests/functional/http/client/CMakeLists.txt b/Release/tests/functional/http/client/CMakeLists.txt
-index e21242a5c..4efeefd02 100644
---- a/Release/tests/functional/http/client/CMakeLists.txt
-+++ b/Release/tests/functional/http/client/CMakeLists.txt
-@@ -32,7 +32,12 @@ if(BUILD_SHARED_LIBS)
-     WORKING_DIRECTORY ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}
-     COMMAND test_runner /badssl /select:@Requires=badssl $<TARGET_FILE_NAME:httpclient_test>
-   )
--  set_tests_properties(httpclient_test_badssl PROPERTIES LABELS badssl)
-+  set_tests_properties(httpclient_test_badssl PROPERTIES LABELS "badssl;network")
-+  add_test(NAME httpclient_test_network
-+    WORKING_DIRECTORY ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}
-+    COMMAND test_runner /network /select:@Requires=network $<TARGET_FILE_NAME:httpclient_test>
-+  )
-+  set_tests_properties(httpclient_test_network PROPERTIES LABELS network)
- endif()
- if(TEST_LIBRARY_TARGET_TYPE STREQUAL "OBJECT")
-   target_include_directories(httpclient_test PRIVATE ../utilities/include)
-diff --git a/Release/tests/functional/http/client/authentication_tests.cpp b/Release/tests/functional/http/client/authentication_tests.cpp
-index c90046be3..6570ea668 100644
---- a/Release/tests/functional/http/client/authentication_tests.cpp
-+++ b/Release/tests/functional/http/client/authentication_tests.cpp
-@@ -676,9 +676,9 @@ SUITE(authentication_tests)
-         VERIFY_ARE_EQUAL(return_code, response.status_code());
-     }
- 
--    TEST(auth_no_data) { auth_test_impl(false); }
-+    TEST(auth_no_data, "Requires", "network") { auth_test_impl(false); }
- 
--    TEST(unsuccessful_auth_with_basic_cred) { auth_test_impl(true); }
-+    TEST(unsuccessful_auth_with_basic_cred, "Requires", "network") { auth_test_impl(true); }
- 
-     TEST_FIXTURE(uri_address, set_user_options_asio_http)
-     {
-diff --git a/Release/tests/functional/http/client/connections_and_errors.cpp b/Release/tests/functional/http/client/connections_and_errors.cpp
-index 26a3b33e3..3b0cb4172 100644
---- a/Release/tests/functional/http/client/connections_and_errors.cpp
-+++ b/Release/tests/functional/http/client/connections_and_errors.cpp
-@@ -409,7 +409,7 @@ SUITE(connections_and_errors)
- #endif
- 
-     // Try to connect to a server on a closed port and cancel the operation.
--    TEST_FIXTURE(uri_address, cancel_bad_port)
-+    TEST_FIXTURE(uri_address, cancel_bad_port, "Requires", "network")
-     {
-         // http_client_asio had a bug where, when canceled, it would cancel only the
-         // current connection but then go and try the next address from the list of
-diff --git a/Release/tests/functional/http/client/outside_tests.cpp b/Release/tests/functional/http/client/outside_tests.cpp
-index b8147b1f8..d1c3205cb 100644
---- a/Release/tests/functional/http/client/outside_tests.cpp
-+++ b/Release/tests/functional/http/client/outside_tests.cpp
-@@ -41,7 +41,7 @@ namespace client
- {
- SUITE(outside_tests)
- {
--    TEST_FIXTURE(uri_address, outside_cnn_dot_com)
-+    TEST_FIXTURE(uri_address, outside_cnn_dot_com, "Requires", "network")
-     {
-         handle_timeout([] {
-             // http://www.cnn.com redirects users from countries outside of the US to the "http://edition.cnn.com/" drop
-@@ -60,7 +60,7 @@ SUITE(outside_tests)
-         });
-     }
- 
--    TEST_FIXTURE(uri_address, outside_wikipedia_compressed_http_response)
-+    TEST_FIXTURE(uri_address, outside_wikipedia_compressed_http_response, "Requires", "network")
-     {
-         if (web::http::compression::builtin::supported() == false)
-         {
-@@ -86,7 +86,7 @@ SUITE(outside_tests)
-         VERIFY_ARE_EQUAL(encoding, U("gzip"));
-     }
- 
--    TEST_FIXTURE(uri_address, outside_google_dot_com)
-+    TEST_FIXTURE(uri_address, outside_google_dot_com, "Requires", "network")
-     {
-         // Use code.google.com instead of www.google.com, which redirects
-         http_client client(U("http://code.google.com"));
-@@ -98,7 +98,7 @@ SUITE(outside_tests)
-         }
-     }
- 
--    TEST_FIXTURE(uri_address, multiple_https_requests)
-+    TEST_FIXTURE(uri_address, multiple_https_requests, "Requires", "network")
-     {
-         handle_timeout([&] {
-             // Use code.google.com instead of www.google.com, which redirects
-@@ -115,7 +115,7 @@ SUITE(outside_tests)
-     }
- 
- #if (defined(_MSC_VER) && (_MSC_VER >= 1900)) && !CPPREST_FORCE_PPLX
--    TEST_FIXTURE(uri_address, multiple_https_requests_sync_scheduler)
-+    TEST_FIXTURE(uri_address, multiple_https_requests_sync_scheduler, "Requires", "network")
-     {
-         struct sync_scheduler : public scheduler_interface
-         {
-@@ -148,7 +148,7 @@ SUITE(outside_tests)
-     }
- #endif
- 
--    TEST_FIXTURE(uri_address, reading_google_stream)
-+    TEST_FIXTURE(uri_address, reading_google_stream, "Requires", "network")
-     {
-         handle_timeout([&] {
-             // Use code.google.com instead of www.google.com, which redirects
-@@ -170,7 +170,7 @@ SUITE(outside_tests)
-         });
-     }
- 
--    TEST_FIXTURE(uri_address, no_transfer_encoding_content_length)
-+    TEST_FIXTURE(uri_address, no_transfer_encoding_content_length, "Requires", "network")
-     {
-         handle_timeout([] {
-             http_client client(U("http://ws.audioscrobbler.com/2.0/") U(
-diff --git a/Release/tests/functional/websockets/CMakeLists.txt b/Release/tests/functional/websockets/CMakeLists.txt
-index 9a33589f5..7571f9305 100644
---- a/Release/tests/functional/websockets/CMakeLists.txt
-+++ b/Release/tests/functional/websockets/CMakeLists.txt
-@@ -33,7 +33,7 @@ if (NOT CPPREST_EXCLUDE_WEBSOCKETS)
-       WORKING_DIRECTORY ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}
-       COMMAND test_runner /badssl /select:@Requires=badssl $<TARGET_FILE_NAME:websocketsclient_test>
-     )
--    set_tests_properties(websocketsclient_test_badssl PROPERTIES LABELS badssl)
-+    set_tests_properties(websocketsclient_test_badssl PROPERTIES LABELS "badssl;network")
-   endif()
-   if(NOT TEST_LIBRARY_TARGET_TYPE STREQUAL "OBJECT")
-     target_link_libraries(websocketsclient_test PRIVATE websockettest_utilities)
diff --git a/meta-oe/recipes-support/cpprest/cpprest_2.10.20+cpprest-lts.bb b/meta-oe/recipes-support/cpprest/cpprest_2.10.21+cpprest-lts.bb
similarity index 74%
rename from meta-oe/recipes-support/cpprest/cpprest_2.10.20+cpprest-lts.bb
rename to meta-oe/recipes-support/cpprest/cpprest_2.10.21+cpprest-lts.bb
index f5f0815023..c8fd4f32e2 100644
--- a/meta-oe/recipes-support/cpprest/cpprest_2.10.20+cpprest-lts.bb
+++ b/meta-oe/recipes-support/cpprest/cpprest_2.10.21+cpprest-lts.bb
@@ -7,12 +7,9 @@ DEPENDS = "openssl websocketpp zlib boost brotli"
 
 EXTRA_OECMAKE = "-DCPPREST_EXPORT_DIR=cmake/cpprestsdk -DCPPREST_EXCLUDE_BROTLI=OFF -DWERROR=OFF"
 
-SRC_URI = "git://github.com/cpprest-lts/cpprestsdk.git;protocol=https;branch=cpprest-lts \
-           file://63.patch \
-           file://65.patch \
-           file://68.patch "
+SRC_URI = "git://github.com/cpprest-lts/cpprestsdk.git;protocol=https;branch=cpprest-lts"
 
-# tag 2.10.20+cpprest-lts
-SRCREV = "feadb5b7d01a09d124d6d6c7bfeee648c15b37d1"
+# tag 2.10.21+cpprest-lts
+SRCREV = "53a4b06ac33b67703ca62305dcb36083f93bbd1c"
 
 inherit cmake pkgconfig
