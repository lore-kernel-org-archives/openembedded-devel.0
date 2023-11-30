Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F20CC07CA9
	for <webhook@archiver.kernel.org>; Thu, 30 Nov 2023 14:25:13 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web11.73407.1701354306413931913
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Nov 2023 06:25:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FD4TAOIa;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2c9caf896b7so8687101fa.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Nov 2023 06:25:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701354304; x=1701959104; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xzPlUtZPNq9ydvZs9aLs9qwNLdLUQ/X1ZC6F5X2YTL0=;
        b=FD4TAOIahdB5BtXsp81rzp/G0FqAasmqnjGufuPE9Bpz+rW7cE9jaY6zjP4caIqni9
         kXWiewAUtWIFwkPjw13vYH0kPQrrxcfO0ITPYZsU6EDDqaIslSLM0x0wLsH2y16cJ58Z
         78LbjBXweW//OCVmBAy9W5NtjXhfmldn9HbXjAb5Rdobet4hf8Kvg2QMcrtAZCIaw90p
         8V9q8cDChTXq4yxRykwBvvmZTOGgGXO3h4BLWJSRBrcfx/OTBhC1N+CLe00rLgpdw5G5
         CooeogMX91FfUyIuKIyczxrEPpwSgJRI6FpTh29mrNoJZ/N8JFyjtTpOKkZzzjXsW5G5
         yrdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701354304; x=1701959104;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xzPlUtZPNq9ydvZs9aLs9qwNLdLUQ/X1ZC6F5X2YTL0=;
        b=HihR++PRgHdWSdW826Y7WB0hvcEf4OTl53fsCWcgiDffL45Fn0zkEUQaBl2I4by9Jt
         YK4C4npQ+xHGKRSaIK9CHQYQeFMj15HB9KkKVjselu0zMgwAeLrtIIiLVlhm4urTEzUV
         BHXDERqCmx5PpzqSvegJ2je47/35bQCj8M21YOSgXT1EycZ1NhbwP5LM7ZKqYbOxq1sH
         rwKxtNb3qaPtNw2nhRht0PkHQhfuzksSdTtmkpm54TPvHiLDNIqleFokz54LePmn887L
         Ju8eHVQnosePbe80YrVOj7QEzahl0W+lB/E1tjm5jf3qpO0olqyOYLxlQUanL9vVJZsR
         AO8w==
X-Gm-Message-State: AOJu0YxnxHypH9yJZTexcS/YzCjnc0ohnbYIc0dTV7RyvD83jzR/PntX
	mxKLo4YBOZCC9w5OxOMftY2CHBXGwqlD/g==
X-Google-Smtp-Source: AGHT+IEK/NcVqWaTzPEvodbRorvqf6gWyhfJQbxSU6+NmpDpDw99am8+Of5TY6ivH0+fb3sbyK88AQ==
X-Received: by 2002:a2e:9783:0:b0:2c9:c60b:ac8b with SMTP id y3-20020a2e9783000000b002c9c60bac8bmr2383585lji.51.1701354303663;
        Thu, 30 Nov 2023 06:25:03 -0800 (PST)
Received: from localhost.localdomain ([176.33.70.43])
        by smtp.gmail.com with ESMTPSA id d19-20020adfa353000000b00332f2288e2esm1680962wrb.102.2023.11.30.06.25.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 06:25:03 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH] libmodbus: upgrade 3.1.7 -> 3.1.10
Date: Thu, 30 Nov 2023 17:24:50 +0300
Message-Id: <20231130142450.633052-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Nov 2023 14:25:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107177

* Fix-float-endianness-issue-on-big-endian-arch.patch removed because fixed in the new version.

Changelog:

* Fix baud rate handling with RTU under Linux
* Fix modbus_disable_quirks signature
* Remove Travis CI
* Move content about migration to libmodbus.org
* Avoid negative value in FD_SET call
* Test socket against positive value instead of -1
* Improvements to autotools by @ndim
* Fix doc links by @jordanjohnson56 (#653)
* Test the protocol id for 0 by @metapsychologe (#509)
* Fix double negative in tests
* New quirks handler (closes #38 #533)
* Fix bitwise OR in documentation
* Improve doc about slave ID in RTU
* Add .clang-format and format code (closes #394)
* Remove constraints on baud rate values
* Accept IP or device in arg of unit test progs
* Avoid compilation issue with VS2022 with strdup
* Display created files in configure.js
* Use strcpy_s under Windows
* Replace inet_addr by inet_pton calls
* Replace inet_ntoa by inet_ptop
* Update configure.ac/config.h.win32 for new inet functions
* Instructions to build libmodbus in a VS project
* Fix connection check for Windows RTU (closes #660, #662)
* Add CIFuzz Github action by @DavidKorczynski (#669)
* Convert a few int to unsigned int (#402)
* Major rewrite of documentation with Material for mkdocs
* Reduce memory use of TCP PI backend (closes #621)
* Fixed MODBUS_ERROR_RECOVERY_LINK not working on Windows (@embeddedmz)
* Replace Travis CI by GitHub CI
* Fix linker error for Windows (VCLinkerTool)
* Address check in single register / coil responses added (#463)
* Swap CRC bytes in request data but not at CRC computing (#397)
* Fix float endianness issue on big endian architecture
* Fix comment about EMBUNKEXC (closes #566)
* Fix network library detection on Haiku
* Fix typos (closes #620)

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../recipes-extended/libmodbus/libmodbus.inc  |  16 -
 ...-endianness-issue-on-big-endian-arch.patch | 316 ------------------
 .../libmodbus/libmodbus_3.0.6.bb              |   4 -
 .../libmodbus/libmodbus_3.1.10.bb             |  17 +
 .../libmodbus/libmodbus_3.1.7.bb              |   9 -
 5 files changed, 17 insertions(+), 345 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/libmodbus/libmodbus.inc
 delete mode 100644 meta-oe/recipes-extended/libmodbus/libmodbus/Fix-float-endianness-issue-on-big-endian-arch.patch
 delete mode 100644 meta-oe/recipes-extended/libmodbus/libmodbus_3.0.6.bb
 create mode 100644 meta-oe/recipes-extended/libmodbus/libmodbus_3.1.10.bb
 delete mode 100644 meta-oe/recipes-extended/libmodbus/libmodbus_3.1.7.bb

diff --git a/meta-oe/recipes-extended/libmodbus/libmodbus.inc b/meta-oe/recipes-extended/libmodbus/libmodbus.inc
deleted file mode 100644
index 0857cc455..000000000
--- a/meta-oe/recipes-extended/libmodbus/libmodbus.inc
+++ /dev/null
@@ -1,16 +0,0 @@
-SUMMARY = "A Modbus library"
-DESCRIPTION = "libmodbus is a C library designed to provide a fast and robust \
-implementation of the Modbus protocol. It runs on Linux, Mac OS X, FreeBSD, \
-QNX and Windows."
-HOMEPAGE = "http://www.libmodbus.org/"
-SECTION = "libs"
-
-LICENSE = "LGPL-2.1-or-later"
-LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=4fbd65380cdd255951079008b364516c"
-
-SRC_URI = "http://libmodbus.org/releases/${BP}.tar.gz"
-
-PACKAGECONFIG ??= ""
-PACKAGECONFIG[documentation] = "--with-documentation,--without-documentation,asciidoc-native xmlto-native"
-
-inherit autotools pkgconfig
diff --git a/meta-oe/recipes-extended/libmodbus/libmodbus/Fix-float-endianness-issue-on-big-endian-arch.patch b/meta-oe/recipes-extended/libmodbus/libmodbus/Fix-float-endianness-issue-on-big-endian-arch.patch
deleted file mode 100644
index e7fbb0389..000000000
--- a/meta-oe/recipes-extended/libmodbus/libmodbus/Fix-float-endianness-issue-on-big-endian-arch.patch
+++ /dev/null
@@ -1,316 +0,0 @@
-From: =?utf-8?b?IlNaIExpbiAo5p6X5LiK5pm6KSI=?= <szlin@debian.org>
-Date: Wed, 19 Dec 2018 10:24:47 +0800
-Subject: Fix float endianness issue on big endian arch
-
-It converts float values depending on what order they come in.
-
-This patch was modified from rm5248 [1]
-
-[1] https://github.com/synexxus/libmodbus/commit/a511768e7fe7ec52d7bae1d9ae04e33f87a59627
-
----
-Upstream-Status: Pending
-
- src/modbus-data.c        | 110 ++++++++++++++++++++++++++++++++++++++---------
- tests/unit-test-client.c |  22 ++++++----
- tests/unit-test.h.in     |  41 ++++++++++++++++--
- 3 files changed, 141 insertions(+), 32 deletions(-)
-
-diff --git a/src/modbus-data.c b/src/modbus-data.c
-index 902b8c6..7a744fa 100644
---- a/src/modbus-data.c
-+++ b/src/modbus-data.c
-@@ -119,9 +119,18 @@ float modbus_get_float_abcd(const uint16_t *src)
- {
-     float f;
-     uint32_t i;
-+    uint8_t a, b, c, d;
- 
--    i = ntohl(((uint32_t)src[0] << 16) + src[1]);
--    memcpy(&f, &i, sizeof(float));
-+    a = (src[0] >> 8) & 0xFF;
-+    b = (src[0] >> 0) & 0xFF;
-+    c = (src[1] >> 8) & 0xFF;
-+    d = (src[1] >> 0) & 0xFF;
-+
-+    i = (a << 24) |
-+        (b << 16) |
-+        (c << 8) |
-+        (d << 0);
-+    memcpy(&f, &i, 4);
- 
-     return f;
- }
-@@ -131,9 +140,18 @@ float modbus_get_float_dcba(const uint16_t *src)
- {
-     float f;
-     uint32_t i;
-+    uint8_t a, b, c, d;
- 
--    i = ntohl(bswap_32((((uint32_t)src[0]) << 16) + src[1]));
--    memcpy(&f, &i, sizeof(float));
-+    a = (src[0] >> 8) & 0xFF;
-+    b = (src[0] >> 0) & 0xFF;
-+    c = (src[1] >> 8) & 0xFF;
-+    d = (src[1] >> 0) & 0xFF;
-+
-+    i = (d << 24) |
-+        (c << 16) |
-+        (b << 8) |
-+        (a << 0);
-+    memcpy(&f, &i, 4);
- 
-     return f;
- }
-@@ -143,9 +161,18 @@ float modbus_get_float_badc(const uint16_t *src)
- {
-     float f;
-     uint32_t i;
-+    uint8_t a, b, c, d;
- 
--    i = ntohl((uint32_t)(bswap_16(src[0]) << 16) + bswap_16(src[1]));
--    memcpy(&f, &i, sizeof(float));
-+    a = (src[0] >> 8) & 0xFF;
-+    b = (src[0] >> 0) & 0xFF;
-+    c = (src[1] >> 8) & 0xFF;
-+    d = (src[1] >> 0) & 0xFF;
-+
-+    i = (b << 24) |
-+        (a << 16) |
-+        (d << 8) |
-+        (c << 0);
-+    memcpy(&f, &i, 4);
- 
-     return f;
- }
-@@ -155,9 +182,18 @@ float modbus_get_float_cdab(const uint16_t *src)
- {
-     float f;
-     uint32_t i;
-+    uint8_t a, b, c, d;
- 
--    i = ntohl((((uint32_t)src[1]) << 16) + src[0]);
--    memcpy(&f, &i, sizeof(float));
-+    a = (src[0] >> 8) & 0xFF;
-+    b = (src[0] >> 0) & 0xFF;
-+    c = (src[1] >> 8) & 0xFF;
-+    d = (src[1] >> 0) & 0xFF;
-+
-+    i = (c << 24) |
-+        (d << 16) |
-+        (a << 8) |
-+        (b << 0);
-+    memcpy(&f, &i, 4);
- 
-     return f;
- }
-@@ -172,50 +208,84 @@ float modbus_get_float(const uint16_t *src)
-     memcpy(&f, &i, sizeof(float));
- 
-     return f;
-+
- }
- 
- /* Set a float to 4 bytes for Modbus w/o any conversion (ABCD) */
- void modbus_set_float_abcd(float f, uint16_t *dest)
- {
-     uint32_t i;
-+    uint8_t *out = (uint8_t*) dest;
-+    uint8_t a, b, c, d;
- 
-     memcpy(&i, &f, sizeof(uint32_t));
--    i = htonl(i);
--    dest[0] = (uint16_t)(i >> 16);
--    dest[1] = (uint16_t)i;
-+    a = (i >> 24) & 0xFF;
-+    b = (i >> 16) & 0xFF;
-+    c = (i >> 8) & 0xFF;
-+    d = (i >> 0) & 0xFF;
-+
-+    out[0] = a;
-+    out[1] = b;
-+    out[2] = c;
-+    out[3] = d;
- }
- 
- /* Set a float to 4 bytes for Modbus with byte and word swap conversion (DCBA) */
- void modbus_set_float_dcba(float f, uint16_t *dest)
- {
-     uint32_t i;
-+    uint8_t *out = (uint8_t*) dest;
-+    uint8_t a, b, c, d;
- 
-     memcpy(&i, &f, sizeof(uint32_t));
--    i = bswap_32(htonl(i));
--    dest[0] = (uint16_t)(i >> 16);
--    dest[1] = (uint16_t)i;
-+    a = (i >> 24) & 0xFF;
-+    b = (i >> 16) & 0xFF;
-+    c = (i >> 8) & 0xFF;
-+    d = (i >> 0) & 0xFF;
-+
-+    out[0] = d;
-+    out[1] = c;
-+    out[2] = b;
-+    out[3] = a;
-+
- }
- 
- /* Set a float to 4 bytes for Modbus with byte swap conversion (BADC) */
- void modbus_set_float_badc(float f, uint16_t *dest)
- {
-     uint32_t i;
-+    uint8_t *out = (uint8_t*) dest;
-+    uint8_t a, b, c, d;
- 
-     memcpy(&i, &f, sizeof(uint32_t));
--    i = htonl(i);
--    dest[0] = (uint16_t)bswap_16(i >> 16);
--    dest[1] = (uint16_t)bswap_16(i & 0xFFFF);
-+    a = (i >> 24) & 0xFF;
-+    b = (i >> 16) & 0xFF;
-+    c = (i >> 8) & 0xFF;
-+    d = (i >> 0) & 0xFF;
-+
-+    out[0] = b;
-+    out[1] = a;
-+    out[2] = d;
-+    out[3] = c;
- }
- 
- /* Set a float to 4 bytes for Modbus with word swap conversion (CDAB) */
- void modbus_set_float_cdab(float f, uint16_t *dest)
- {
-     uint32_t i;
-+    uint8_t *out = (uint8_t*) dest;
-+    uint8_t a, b, c, d;
- 
-     memcpy(&i, &f, sizeof(uint32_t));
--    i = htonl(i);
--    dest[0] = (uint16_t)i;
--    dest[1] = (uint16_t)(i >> 16);
-+    a = (i >> 24) & 0xFF;
-+    b = (i >> 16) & 0xFF;
-+    c = (i >> 8) & 0xFF;
-+    d = (i >> 0) & 0xFF;
-+
-+    out[0] = c;
-+    out[1] = d;
-+    out[2] = a;
-+    out[3] = b;
- }
- 
- /* DEPRECATED - Set a float to 4 bytes in a sort of Modbus format! */
-diff --git a/tests/unit-test-client.c b/tests/unit-test-client.c
-index 3e315f4..3fccf3e 100644
---- a/tests/unit-test-client.c
-+++ b/tests/unit-test-client.c
-@@ -27,6 +27,7 @@ int send_crafted_request(modbus_t *ctx, int function,
-                          uint16_t max_value, uint16_t bytes,
-                          int backend_length, int backend_offset);
- int equal_dword(uint16_t *tab_reg, const uint32_t value);
-+int is_memory_equal(const void *s1, const void *s2, size_t size);
- 
- #define BUG_REPORT(_cond, _format, _args ...) \
-     printf("\nLine %d: assertion error for '%s': " _format "\n", __LINE__, # _cond, ## _args)
-@@ -40,6 +41,11 @@ int equal_dword(uint16_t *tab_reg, const uint32_t value);
-     }                                             \
- };
- 
-+int is_memory_equal(const void *s1, const void *s2, size_t size)
-+{
-+    return (memcmp(s1, s2, size) == 0);
-+}
-+
- int equal_dword(uint16_t *tab_reg, const uint32_t value) {
-     return ((tab_reg[0] == (value >> 16)) && (tab_reg[1] == (value & 0xFFFF)));
- }
-@@ -286,26 +292,26 @@ int main(int argc, char *argv[])
-     /** FLOAT **/
-     printf("1/4 Set/get float ABCD: ");
-     modbus_set_float_abcd(UT_REAL, tab_rp_registers);
--    ASSERT_TRUE(equal_dword(tab_rp_registers, UT_IREAL_ABCD), "FAILED Set float ABCD");
--    real = modbus_get_float_abcd(tab_rp_registers);
-+    ASSERT_TRUE(is_memory_equal(tab_rp_registers, UT_IREAL_ABCD_SET, 4), "FAILED Set float ABCD");
-+    real = modbus_get_float_abcd(UT_IREAL_ABCD_GET);
-     ASSERT_TRUE(real == UT_REAL, "FAILED (%f != %f)\n", real, UT_REAL);
- 
-     printf("2/4 Set/get float DCBA: ");
-     modbus_set_float_dcba(UT_REAL, tab_rp_registers);
--    ASSERT_TRUE(equal_dword(tab_rp_registers, UT_IREAL_DCBA), "FAILED Set float DCBA");
--    real = modbus_get_float_dcba(tab_rp_registers);
-+    ASSERT_TRUE(is_memory_equal(tab_rp_registers, UT_IREAL_DCBA_SET, 4), "FAILED Set float DCBA");
-+    real = modbus_get_float_dcba(UT_IREAL_DCBA_GET);
-     ASSERT_TRUE(real == UT_REAL, "FAILED (%f != %f)\n", real, UT_REAL);
- 
-     printf("3/4 Set/get float BADC: ");
-     modbus_set_float_badc(UT_REAL, tab_rp_registers);
--    ASSERT_TRUE(equal_dword(tab_rp_registers, UT_IREAL_BADC), "FAILED Set float BADC");
--    real = modbus_get_float_badc(tab_rp_registers);
-+    ASSERT_TRUE(is_memory_equal(tab_rp_registers, UT_IREAL_BADC_SET, 4), "FAILED Set float BADC");
-+    real = modbus_get_float_badc(UT_IREAL_BADC_GET);
-     ASSERT_TRUE(real == UT_REAL, "FAILED (%f != %f)\n", real, UT_REAL);
- 
-     printf("4/4 Set/get float CDAB: ");
-     modbus_set_float_cdab(UT_REAL, tab_rp_registers);
--    ASSERT_TRUE(equal_dword(tab_rp_registers, UT_IREAL_CDAB), "FAILED Set float CDAB");
--    real = modbus_get_float_cdab(tab_rp_registers);
-+    ASSERT_TRUE(is_memory_equal(tab_rp_registers, UT_IREAL_CDAB_SET, 4), "FAILED Set float CDAB");
-+    real = modbus_get_float_cdab(UT_IREAL_CDAB_GET);
-     ASSERT_TRUE(real == UT_REAL, "FAILED (%f != %f)\n", real, UT_REAL);
- 
-     printf("\nAt this point, error messages doesn't mean the test has failed\n");
-diff --git a/tests/unit-test.h.in b/tests/unit-test.h.in
-index dca826f..4ffa254 100644
---- a/tests/unit-test.h.in
-+++ b/tests/unit-test.h.in
-@@ -56,12 +56,45 @@ const uint16_t UT_INPUT_REGISTERS_ADDRESS = 0x108;
- const uint16_t UT_INPUT_REGISTERS_NB = 0x1;
- const uint16_t UT_INPUT_REGISTERS_TAB[] = { 0x000A };
- 
-+/*
-+ * This float value is 0x47F12000 (in big-endian format).
-+ * In Little-endian(intel) format, it will be stored in memory as follows:
-+ * 0x00 0x20 0xF1 0x47
-+ *
-+ * You can check this with the following code:
-+
-+   float fl = UT_REAL;
-+   uint8_t *inmem = (uint8_t*)&fl;
-+   int x;
-+   for(x = 0; x < 4; x++){
-+       printf("0x%02X ", inmem[ x ]);
-+   }
-+   printf("\n");
-+ */
- const float UT_REAL = 123456.00;
- 
--const uint32_t UT_IREAL_ABCD = 0x0020F147;
--const uint32_t UT_IREAL_DCBA = 0x47F12000;
--const uint32_t UT_IREAL_BADC = 0x200047F1;
--const uint32_t UT_IREAL_CDAB = 0xF1470020;
-+/*
-+ * The following arrays assume that 'A' is the MSB,
-+ * and 'D' is the LSB.
-+ * Thus, the following is the case:
-+ * A = 0x47
-+ * B = 0xF1
-+ * C = 0x20
-+ * D = 0x00
-+ *
-+ * There are two sets of arrays: one to test that the setting is correct,
-+ * the other to test that the getting is correct.
-+ * Note that the 'get' values must be constants in processor-endianness,
-+ * as libmodbus will convert all words to processor-endianness as they come in.
-+ */
-+const uint8_t UT_IREAL_ABCD_SET[] = {0x47, 0xF1, 0x20, 0x00};
-+const uint16_t UT_IREAL_ABCD_GET[] = {0x47F1, 0x2000};
-+const uint8_t UT_IREAL_DCBA_SET[] = {0x00, 0x20, 0xF1, 0x47};
-+const uint16_t UT_IREAL_DCBA_GET[] = {0x0020, 0xF147};
-+const uint8_t UT_IREAL_BADC_SET[] = {0xF1, 0x47, 0x00, 0x20};
-+const uint16_t UT_IREAL_BADC_GET[] = {0xF147, 0x0020};
-+const uint8_t UT_IREAL_CDAB_SET[] = {0x20, 0x00, 0x47, 0xF1};
-+const uint16_t UT_IREAL_CDAB_GET[] = {0x2000, 0x47F1};
- 
- /* const uint32_t UT_IREAL_ABCD = 0x47F12000);
- const uint32_t UT_IREAL_DCBA = 0x0020F147;
diff --git a/meta-oe/recipes-extended/libmodbus/libmodbus_3.0.6.bb b/meta-oe/recipes-extended/libmodbus/libmodbus_3.0.6.bb
deleted file mode 100644
index b4d32fb2c..000000000
--- a/meta-oe/recipes-extended/libmodbus/libmodbus_3.0.6.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require libmodbus.inc
-
-SRC_URI[md5sum] = "c80f88b6ca19cabc4ceffc195ca07771"
-SRC_URI[sha256sum] = "046d63f10f755e2160dc56ef681e5f5ad3862a57c1955fd82e0ce036b69471b6"
diff --git a/meta-oe/recipes-extended/libmodbus/libmodbus_3.1.10.bb b/meta-oe/recipes-extended/libmodbus/libmodbus_3.1.10.bb
new file mode 100644
index 000000000..9e17f9166
--- /dev/null
+++ b/meta-oe/recipes-extended/libmodbus/libmodbus_3.1.10.bb
@@ -0,0 +1,17 @@
+SUMMARY = "A Modbus library for Linux, Mac OS, FreeBSD and Windows"
+DESCRIPTION = "libmodbus is a free software library to send/receive data with a device which respects the Modbus protocol. This library can use a serial port or an Ethernet connection."
+HOMEPAGE = "http://www.libmodbus.org/"
+SECTION = "libs"
+
+LICENSE = "LGPL-2.1-or-later"
+LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=4fbd65380cdd255951079008b364516c"
+
+SRC_URI = "git://github.com/stephane/libmodbus;branch=master;protocol=https"
+SRCREV = "2cbafa3113e276c3697d297f68e88d112b53174d"
+
+S = "${WORKDIR}/git"
+
+inherit autotools pkgconfig
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[test] = "--enable-tests,--disable-tests,,"
diff --git a/meta-oe/recipes-extended/libmodbus/libmodbus_3.1.7.bb b/meta-oe/recipes-extended/libmodbus/libmodbus_3.1.7.bb
deleted file mode 100644
index 6c0e315d7..000000000
--- a/meta-oe/recipes-extended/libmodbus/libmodbus_3.1.7.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require libmodbus.inc
-
-SRC_URI += "file://Fix-float-endianness-issue-on-big-endian-arch.patch"
-SRC_URI[sha256sum] = "7dfe958431d0570b271e1a5b329b76a658e89c614cf119eb5aadb725c87f8fbd"
-
-# this file has been created one minute after the configure file, so it doesn't get recreated during configure step
-do_configure:prepend() {
-	rm -rf ${S}/tests/unit-test.h
-}
-- 
2.25.1


