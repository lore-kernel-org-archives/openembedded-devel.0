Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D9C9C28B24
	for <webhook@archiver.kernel.org>; Thu,  6 Mar 2025 18:36:53 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web11.1510.1741286203030688757
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Mar 2025 10:36:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=RzMFhKIp;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-202503061836402ee4a60cd95175fb52-xf2lse@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 202503061836402ee4a60cd95175fb52
        for <openembedded-devel@lists.openembedded.org>;
        Thu, 06 Mar 2025 19:36:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=ZXxTJ89nNcXDH8+tuNaYovyCJT3V7czUI8qPiEe6csA=;
 b=RzMFhKIpsYBBMhDAXAa93aPXr5QMu1Od95oa3/eRgpWSuqiq0PREPmbwW+i15QWJ5srxCP
 VCpUD1IrhIL89MDlhvREbkeHSA+1GJof8OOSs4eZT6E4Wj7XJODxzWG79MkrhCCzHdy6RtpK
 Ydh5pXG6bTbhIVtYTjr/jqxV13YsSNG7CPpkMBwMMbfOUj3HRLyzaX7JmyEISgPOYGlUAQ44
 DIBXmCyhyq/pvAR9kqSq/gyxhTOb3ikPqL0BAxotvx3wRpLrK98L/EC889oAVVXF7StdTRTO
 i6KnoxGynBXcOVPRuZROXpeQ4ka9og2q1bSr7UacilzZ9D2ArFy8OGOw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][scarthgap][PATCH] libmodbus: patch CVE-2024-10918
Date: Thu,  6 Mar 2025 19:35:51 +0100
Message-Id: <20250306183551.2569776-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Mar 2025 18:36:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115774

From: Peter Marko <peter.marko@siemens.com>

Pick commit mentioning the bug and two follow-up commits mentioning the
first commit as well as commit to adapt tests for these.

Tested by running the test-suite.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../libmodbus/CVE-2024-10918-01.patch         | 177 +++++++++++++
 .../libmodbus/CVE-2024-10918-02.patch         | 121 +++++++++
 .../libmodbus/CVE-2024-10918-03.patch         |  84 ++++++
 .../libmodbus/CVE-2024-10918-04.patch         | 239 ++++++++++++++++++
 .../libmodbus/libmodbus_3.1.10.bb             |   8 +-
 5 files changed, 628 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/libmodbus/libmodbus/CVE-2024-10918-01.patch
 create mode 100644 meta-oe/recipes-extended/libmodbus/libmodbus/CVE-2024-10918-02.patch
 create mode 100644 meta-oe/recipes-extended/libmodbus/libmodbus/CVE-2024-10918-03.patch
 create mode 100644 meta-oe/recipes-extended/libmodbus/libmodbus/CVE-2024-10918-04.patch

diff --git a/meta-oe/recipes-extended/libmodbus/libmodbus/CVE-2024-10918-01.patch b/meta-oe/recipes-extended/libmodbus/libmodbus/CVE-2024-10918-01.patch
new file mode 100644
index 0000000000..f50bee68e8
--- /dev/null
+++ b/meta-oe/recipes-extended/libmodbus/libmodbus/CVE-2024-10918-01.patch
@@ -0,0 +1,177 @@
+From df79a02feb253c0a9a009bcdbb21e47581315111 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?St=C3=A9phane=20Raimbault?= <stephane.raimbault@gmail.com>
+Date: Fri, 18 Oct 2024 10:47:14 +0200
+Subject: [PATCH] Check length passed to modbus_reply (write_bit)
+
+The modbus_reply function is designed to receive arguments
+from modbus_receive. This patch avoid a wrong use of memcpy if
+the user chooses to inject a bad length argument.
+
+Thank you Nozomi Networks Labs Advisory for the report.
+
+CVE: CVE-2024-10918
+Upstream-Status: Backport [https://github.com/stephane/libmodbus/commit/df79a02feb253c0a9a009bcdbb21e47581315111]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/modbus.c             | 54 +++++++++++++++++++++++++---------------
+ tests/unit-test-client.c |  9 +++++--
+ tests/unit-test-server.c | 16 +++++++++---
+ tests/unit-test.h.in     |  1 +
+ 4 files changed, 55 insertions(+), 25 deletions(-)
+
+diff --git a/src/modbus.c b/src/modbus.c
+index 5a9b867..33086ec 100644
+--- a/src/modbus.c
++++ b/src/modbus.c
+@@ -897,24 +897,37 @@ int modbus_reply(modbus_t *ctx,
+                                             FALSE,
+                                             "Illegal data address 0x%0X in write_bit\n",
+                                             address);
++            break;
++        }
++
++        /* This check is only done here to ensure using memcpy is safe. */
++        rsp_length = compute_response_length_from_request(ctx, (uint8_t *) req);
++        if (rsp_length != req_length) {
++            /* Bad use of modbus_reply */
++            rsp_length = response_exception(ctx,
++                                            &sft,
++                                            MODBUS_EXCEPTION_ILLEGAL_DATA_VALUE,
++                                            rsp,
++                                            FALSE,
++                                            "Invalid request length (%d)\n",
++                                            req_length);
++            break;
++        }
++
++        int data = (req[offset + 3] << 8) + req[offset + 4];
++        if (data == 0xFF00 || data == 0x0) {
++            mb_mapping->tab_bits[mapping_address] = data ? ON : OFF;
++            memcpy(rsp, req, rsp_length);
+         } else {
+-            int data = (req[offset + 3] << 8) + req[offset + 4];
+-
+-            if (data == 0xFF00 || data == 0x0) {
+-                mb_mapping->tab_bits[mapping_address] = data ? ON : OFF;
+-                memcpy(rsp, req, req_length);
+-                rsp_length = req_length;
+-            } else {
+-                rsp_length = response_exception(
+-                    ctx,
+-                    &sft,
+-                    MODBUS_EXCEPTION_ILLEGAL_DATA_VALUE,
+-                    rsp,
+-                    FALSE,
+-                    "Illegal data value 0x%0X in write_bit request at address %0X\n",
+-                    data,
+-                    address);
+-            }
++            rsp_length = response_exception(
++                ctx,
++                &sft,
++                MODBUS_EXCEPTION_ILLEGAL_DATA_VALUE,
++                rsp,
++                FALSE,
++                "Illegal data value 0x%0X in write_bit request at address %0X\n",
++                data,
++                address);
+         }
+     } break;
+     case MODBUS_FC_WRITE_SINGLE_REGISTER: {
+@@ -1127,8 +1140,8 @@ int modbus_reply(modbus_t *ctx,
+         break;
+     }
+ 
+-    /* Suppress any responses in RTU when the request was a broadcast, excepted when quirk
+-     * is enabled. */
++    /* Suppress any responses in RTU when the request was a broadcast, excepted when
++     * quirk is enabled. */
+     if (ctx->backend->backend_type == _MODBUS_BACKEND_TYPE_RTU &&
+         slave == MODBUS_BROADCAST_ADDRESS &&
+         !(ctx->quirks & MODBUS_QUIRK_REPLY_TO_BROADCAST)) {
+@@ -1821,7 +1834,8 @@ int modbus_set_byte_timeout(modbus_t *ctx, uint32_t to_sec, uint32_t to_usec)
+     return 0;
+ }
+ 
+-/* Get the timeout interval used by the server to wait for an indication from a client */
++/* Get the timeout interval used by the server to wait for an indication from a client
++ */
+ int modbus_get_indication_timeout(modbus_t *ctx, uint32_t *to_sec, uint32_t *to_usec)
+ {
+     if (ctx == NULL) {
+diff --git a/tests/unit-test-client.c b/tests/unit-test-client.c
+index a441766..50859f8 100644
+--- a/tests/unit-test-client.c
++++ b/tests/unit-test-client.c
+@@ -400,11 +400,11 @@ int main(int argc, char *argv[])
+     ASSERT_TRUE(rc == -1 && errno == EMBXILADD, "");
+ 
+     rc = modbus_write_bits(ctx, 0, 1, tab_rp_bits);
+-    printf("* modbus_write_coils (0): ");
++    printf("* modbus_write_bits (0): ");
+     ASSERT_TRUE(rc == -1 && errno == EMBXILADD, "");
+ 
+     rc = modbus_write_bits(ctx, UT_BITS_ADDRESS + UT_BITS_NB, UT_BITS_NB, tab_rp_bits);
+-    printf("* modbus_write_coils (max): ");
++    printf("* modbus_write_bits (max): ");
+     ASSERT_TRUE(rc == -1 && errno == EMBXILADD, "");
+ 
+     rc = modbus_write_register(ctx, 0, tab_rp_registers[0]);
+@@ -500,6 +500,11 @@ int main(int argc, char *argv[])
+     rc = modbus_set_slave(ctx, old_slave);
+     ASSERT_TRUE(rc == 0, "Uanble to restore slave value")
+ 
++    /** BAD USE OF REPLY FUNCTION **/
++    rc = modbus_write_bit(ctx, UT_BITS_ADDRESS_INVALID_REQUEST_LENGTH, ON);
++    printf("* modbus_write_bit (triggers invalid reply): ");
++    ASSERT_TRUE(rc == -1 && errno == EMBXILVAL, "");
++
+     /** SLAVE REPLY **/
+ 
+     printf("\nTEST SLAVE REPLY:\n");
+diff --git a/tests/unit-test-server.c b/tests/unit-test-server.c
+index 561d64d..8e28124 100644
+--- a/tests/unit-test-server.c
++++ b/tests/unit-test-server.c
+@@ -150,9 +150,8 @@ int main(int argc, char *argv[])
+             break;
+         }
+ 
+-        /* Special server behavior to test client */
+-        if (query[header_length] == 0x03) {
+-            /* Read holding registers */
++        /** Special server behavior to test client **/
++        if (query[header_length] == MODBUS_FC_READ_HOLDING_REGISTERS) {
+ 
+             if (MODBUS_GET_INT16_FROM_INT8(query, header_length + 3) ==
+                 UT_REGISTERS_NB_SPECIAL) {
+@@ -204,6 +203,17 @@ int main(int argc, char *argv[])
+                 }
+                 continue;
+             }
++
++        } else if (query[header_length] == MODBUS_FC_WRITE_SINGLE_COIL) {
++            if (MODBUS_GET_INT16_FROM_INT8(query, header_length + 1) ==
++                UT_BITS_ADDRESS_INVALID_REQUEST_LENGTH) {
++                // The valid length is lengths of header + checkum + FC + address + value
++                // (max 12)
++                rc = 34;
++                printf("Special modbus_write_bit detected. Inject a wrong rc value (%d) "
++                       "in modbus_reply\n",
++                       rc);
++            }
+         }
+ 
+         rc = modbus_reply(ctx, query, rc, mb_mapping);
+diff --git a/tests/unit-test.h.in b/tests/unit-test.h.in
+index 5e379bb..21d09e3 100644
+--- a/tests/unit-test.h.in
++++ b/tests/unit-test.h.in
+@@ -30,6 +30,7 @@
+ const uint16_t UT_BITS_ADDRESS = 0x130;
+ const uint16_t UT_BITS_NB = 0x25;
+ const uint8_t UT_BITS_TAB[] = { 0xCD, 0x6B, 0xB2, 0x0E, 0x1B };
++const uint16_t UT_BITS_ADDRESS_INVALID_REQUEST_LENGTH = UT_BITS_ADDRESS + 2;
+ 
+ const uint16_t UT_INPUT_BITS_ADDRESS = 0x1C4;
+ const uint16_t UT_INPUT_BITS_NB = 0x16;
diff --git a/meta-oe/recipes-extended/libmodbus/libmodbus/CVE-2024-10918-02.patch b/meta-oe/recipes-extended/libmodbus/libmodbus/CVE-2024-10918-02.patch
new file mode 100644
index 0000000000..16b9ba72c5
--- /dev/null
+++ b/meta-oe/recipes-extended/libmodbus/libmodbus/CVE-2024-10918-02.patch
@@ -0,0 +1,121 @@
+From d8a971e04d52be16bf405b51d934a30b8aa3f2c3 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?St=C3=A9phane=20Raimbault?= <stephane.raimbault@gmail.com>
+Date: Sun, 20 Oct 2024 18:02:22 +0200
+Subject: [PATCH] Check length passed to modbus_reply (write_register)
+
+Related to df79a02feb253c.
+
+CVE: CVE-2024-10918
+Upstream-Status: Backport [https://github.com/stephane/libmodbus/commit/d8a971e04d52be16bf405b51d934a30b8aa3f2c3]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/modbus.c             | 38 ++++++++++++++++++++++++++------------
+ tests/unit-test-client.c |  6 +++++-
+ tests/unit-test-server.c | 13 +++++++++++--
+ 3 files changed, 42 insertions(+), 15 deletions(-)
+
+diff --git a/src/modbus.c b/src/modbus.c
+index 33086ec..fe192a7 100644
+--- a/src/modbus.c
++++ b/src/modbus.c
+@@ -904,13 +904,14 @@ int modbus_reply(modbus_t *ctx,
+         rsp_length = compute_response_length_from_request(ctx, (uint8_t *) req);
+         if (rsp_length != req_length) {
+             /* Bad use of modbus_reply */
+-            rsp_length = response_exception(ctx,
+-                                            &sft,
+-                                            MODBUS_EXCEPTION_ILLEGAL_DATA_VALUE,
+-                                            rsp,
+-                                            FALSE,
+-                                            "Invalid request length (%d)\n",
+-                                            req_length);
++            rsp_length =
++                response_exception(ctx,
++                                   &sft,
++                                   MODBUS_EXCEPTION_ILLEGAL_DATA_VALUE,
++                                   rsp,
++                                   FALSE,
++                                   "Invalid request length used in modbus_reply (%d)\n",
++                                   req_length);
+             break;
+         }
+ 
+@@ -942,13 +943,26 @@ int modbus_reply(modbus_t *ctx,
+                                    FALSE,
+                                    "Illegal data address 0x%0X in write_register\n",
+                                    address);
+-        } else {
+-            int data = (req[offset + 3] << 8) + req[offset + 4];
++            break;
++        }
+ 
+-            mb_mapping->tab_registers[mapping_address] = data;
+-            memcpy(rsp, req, req_length);
+-            rsp_length = req_length;
++        rsp_length = compute_response_length_from_request(ctx, (uint8_t *) req);
++        if (rsp_length != req_length) {
++            /* Bad use of modbus_reply */
++            rsp_length =
++                response_exception(ctx,
++                                   &sft,
++                                   MODBUS_EXCEPTION_ILLEGAL_DATA_VALUE,
++                                   rsp,
++                                   FALSE,
++                                   "Invalid request length used in modbus_reply (%d)\n",
++                                   req_length);
++            break;
+         }
++        int data = (req[offset + 3] << 8) + req[offset + 4];
++
++        mb_mapping->tab_registers[mapping_address] = data;
++        memcpy(rsp, req, rsp_length);
+     } break;
+     case MODBUS_FC_WRITE_MULTIPLE_COILS: {
+         int nb = (req[offset + 3] << 8) + req[offset + 4];
+diff --git a/tests/unit-test-client.c b/tests/unit-test-client.c
+index 50859f8..84d5840 100644
+--- a/tests/unit-test-client.c
++++ b/tests/unit-test-client.c
+@@ -498,13 +498,17 @@ int main(int argc, char *argv[])
+ 
+     modbus_disable_quirks(ctx, MODBUS_QUIRK_MAX_SLAVE);
+     rc = modbus_set_slave(ctx, old_slave);
+-    ASSERT_TRUE(rc == 0, "Uanble to restore slave value")
++    ASSERT_TRUE(rc == 0, "Unable to restore slave value")
+ 
+     /** BAD USE OF REPLY FUNCTION **/
+     rc = modbus_write_bit(ctx, UT_BITS_ADDRESS_INVALID_REQUEST_LENGTH, ON);
+     printf("* modbus_write_bit (triggers invalid reply): ");
+     ASSERT_TRUE(rc == -1 && errno == EMBXILVAL, "");
+ 
++    rc = modbus_write_register(ctx, UT_REGISTERS_ADDRESS_SPECIAL, 0x42);
++    printf("* modbus_write_register (triggers invalid reply): ");
++    ASSERT_TRUE(rc == -1 && errno == EMBXILVAL, "");
++
+     /** SLAVE REPLY **/
+ 
+     printf("\nTEST SLAVE REPLY:\n");
+diff --git a/tests/unit-test-server.c b/tests/unit-test-server.c
+index 8e28124..fc7ceb3 100644
+--- a/tests/unit-test-server.c
++++ b/tests/unit-test-server.c
+@@ -210,8 +210,17 @@ int main(int argc, char *argv[])
+                 // The valid length is lengths of header + checkum + FC + address + value
+                 // (max 12)
+                 rc = 34;
+-                printf("Special modbus_write_bit detected. Inject a wrong rc value (%d) "
+-                       "in modbus_reply\n",
++                printf(
++                    "Special modbus_write_bit detected. Inject a wrong length value (%d) "
++                    "in modbus_reply\n",
++                    rc);
++            }
++        } else if (query[header_length] == MODBUS_FC_WRITE_SINGLE_REGISTER) {
++            if (MODBUS_GET_INT16_FROM_INT8(query, header_length + 1) ==
++                UT_REGISTERS_ADDRESS_SPECIAL) {
++                rc = 45;
++                printf("Special modbus_write_register detected. Inject a wrong length "
++                       "value (%d) in modbus_reply\n",
+                        rc);
+             }
+         }
diff --git a/meta-oe/recipes-extended/libmodbus/libmodbus/CVE-2024-10918-03.patch b/meta-oe/recipes-extended/libmodbus/libmodbus/CVE-2024-10918-03.patch
new file mode 100644
index 0000000000..6ae9305b33
--- /dev/null
+++ b/meta-oe/recipes-extended/libmodbus/libmodbus/CVE-2024-10918-03.patch
@@ -0,0 +1,84 @@
+From 7ea85f1b41f7066849f4bde7c0a3549b1e087bbf Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?St=C3=A9phane=20Raimbault?= <stephane.raimbault@gmail.com>
+Date: Sun, 20 Oct 2024 18:23:26 +0200
+Subject: [PATCH] Small cleanups of unit test server
+
+CVE: CVE-2024-10918
+Upstream-Status: Backport [https://github.com/stephane/libmodbus/commit/7ea85f1b41f7066849f4bde7c0a3549b1e087bbf]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ tests/unit-test-server.c | 29 ++++++++++++-----------------
+ 1 file changed, 12 insertions(+), 17 deletions(-)
+
+diff --git a/tests/unit-test-server.c b/tests/unit-test-server.c
+index fc7ceb3..bb25ba4 100644
+--- a/tests/unit-test-server.c
++++ b/tests/unit-test-server.c
+@@ -150,21 +150,21 @@ int main(int argc, char *argv[])
+             break;
+         }
+ 
++        uint8_t function = query[header_length];
++        uint16_t address = MODBUS_GET_INT16_FROM_INT8(query, header_length + 1);
++
+         /** Special server behavior to test client **/
+-        if (query[header_length] == MODBUS_FC_READ_HOLDING_REGISTERS) {
+-
++        if (function == MODBUS_FC_READ_HOLDING_REGISTERS) {
+             if (MODBUS_GET_INT16_FROM_INT8(query, header_length + 3) ==
+                 UT_REGISTERS_NB_SPECIAL) {
+                 printf("Set an incorrect number of values\n");
+                 MODBUS_SET_INT16_TO_INT8(
+                     query, header_length + 3, UT_REGISTERS_NB_SPECIAL - 1);
+-            } else if (MODBUS_GET_INT16_FROM_INT8(query, header_length + 1) ==
+-                       UT_REGISTERS_ADDRESS_SPECIAL) {
++            } else if (address == UT_REGISTERS_ADDRESS_SPECIAL) {
+                 printf("Reply to this special register address by an exception\n");
+                 modbus_reply_exception(ctx, query, MODBUS_EXCEPTION_SLAVE_OR_SERVER_BUSY);
+                 continue;
+-            } else if (MODBUS_GET_INT16_FROM_INT8(query, header_length + 1) ==
+-                       UT_REGISTERS_ADDRESS_INVALID_TID_OR_SLAVE) {
++            } else if (address == UT_REGISTERS_ADDRESS_INVALID_TID_OR_SLAVE) {
+                 const int RAW_REQ_LENGTH = 5;
+                 uint8_t raw_req[] = {(use_backend == RTU) ? INVALID_SERVER_ID : 0xFF,
+                                      0x03,
+@@ -175,12 +175,10 @@ int main(int argc, char *argv[])
+                 printf("Reply with an invalid TID or slave\n");
+                 modbus_send_raw_request(ctx, raw_req, RAW_REQ_LENGTH * sizeof(uint8_t));
+                 continue;
+-            } else if (MODBUS_GET_INT16_FROM_INT8(query, header_length + 1) ==
+-                       UT_REGISTERS_ADDRESS_SLEEP_500_MS) {
++            } else if (address == UT_REGISTERS_ADDRESS_SLEEP_500_MS) {
+                 printf("Sleep 0.5 s before replying\n");
+                 usleep(500000);
+-            } else if (MODBUS_GET_INT16_FROM_INT8(query, header_length + 1) ==
+-                       UT_REGISTERS_ADDRESS_BYTE_SLEEP_5_MS) {
++            } else if (address == UT_REGISTERS_ADDRESS_BYTE_SLEEP_5_MS) {
+                 /* Test low level only available in TCP mode */
+                 /* Catch the reply and send reply byte a byte */
+                 uint8_t req[] = "\x00\x1C\x00\x00\x00\x05\xFF\x03\x02\x00\x00";
+@@ -203,10 +201,8 @@ int main(int argc, char *argv[])
+                 }
+                 continue;
+             }
+-
+-        } else if (query[header_length] == MODBUS_FC_WRITE_SINGLE_COIL) {
+-            if (MODBUS_GET_INT16_FROM_INT8(query, header_length + 1) ==
+-                UT_BITS_ADDRESS_INVALID_REQUEST_LENGTH) {
++        } else if (function == MODBUS_FC_WRITE_SINGLE_COIL) {
++            if (address == UT_BITS_ADDRESS_INVALID_REQUEST_LENGTH) {
+                 // The valid length is lengths of header + checkum + FC + address + value
+                 // (max 12)
+                 rc = 34;
+@@ -215,9 +211,8 @@ int main(int argc, char *argv[])
+                     "in modbus_reply\n",
+                     rc);
+             }
+-        } else if (query[header_length] == MODBUS_FC_WRITE_SINGLE_REGISTER) {
+-            if (MODBUS_GET_INT16_FROM_INT8(query, header_length + 1) ==
+-                UT_REGISTERS_ADDRESS_SPECIAL) {
++        } else if (function == MODBUS_FC_WRITE_SINGLE_REGISTER) {
++            if (address == UT_REGISTERS_ADDRESS_SPECIAL) {
+                 rc = 45;
+                 printf("Special modbus_write_register detected. Inject a wrong length "
+                        "value (%d) in modbus_reply\n",
diff --git a/meta-oe/recipes-extended/libmodbus/libmodbus/CVE-2024-10918-04.patch b/meta-oe/recipes-extended/libmodbus/libmodbus/CVE-2024-10918-04.patch
new file mode 100644
index 0000000000..4538054193
--- /dev/null
+++ b/meta-oe/recipes-extended/libmodbus/libmodbus/CVE-2024-10918-04.patch
@@ -0,0 +1,239 @@
+From 81bf713cf029bfa5b5da87b945c1e8817b4398f9 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?St=C3=A9phane=20Raimbault?= <stephane.raimbault@gmail.com>
+Date: Mon, 21 Oct 2024 17:32:39 +0200
+Subject: [PATCH] Fix request length check in modbus_reply in RTU
+
+- rename internal *_prepare_response_tid to *_get_response_tid
+- change signature, don't need req length anymore
+- remove misleading modification of req_length
+- check of req length before use in memcpy for mask write register
+
+Related to df79a02feb253c0a9a009bcdbb21e47581315111
+
+CVE: CVE-2024-10918
+Upstream-Status: Backport [https://github.com/stephane/libmodbus/commit/81bf713cf029bfa5b5da87b945c1e8817b4398f9]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/modbus-private.h |  2 +-
+ src/modbus-rtu.c     |  5 ++--
+ src/modbus-tcp.c     |  6 ++--
+ src/modbus.c         | 71 ++++++++++++++++++++++++++++----------------
+ 4 files changed, 52 insertions(+), 32 deletions(-)
+
+diff --git a/src/modbus-private.h b/src/modbus-private.h
+index 6cd3424..ea83187 100644
+--- a/src/modbus-private.h
++++ b/src/modbus-private.h
+@@ -75,7 +75,7 @@ typedef struct _modbus_backend {
+     int (*build_request_basis)(
+         modbus_t *ctx, int function, int addr, int nb, uint8_t *req);
+     int (*build_response_basis)(sft_t *sft, uint8_t *rsp);
+-    int (*prepare_response_tid)(const uint8_t *req, int *req_length);
++    int (*get_response_tid)(const uint8_t *req);
+     int (*send_msg_pre)(uint8_t *req, int req_length);
+     ssize_t (*send)(modbus_t *ctx, const uint8_t *req, int req_length);
+     int (*receive)(modbus_t *ctx, uint8_t *req);
+diff --git a/src/modbus-rtu.c b/src/modbus-rtu.c
+index b774923..8b5ee08 100644
+--- a/src/modbus-rtu.c
++++ b/src/modbus-rtu.c
+@@ -129,9 +129,8 @@ static uint16_t crc16(uint8_t *buffer, uint16_t buffer_length)
+     return (crc_hi << 8 | crc_lo);
+ }
+ 
+-static int _modbus_rtu_prepare_response_tid(const uint8_t *req, int *req_length)
++static int _modbus_rtu_get_response_tid(const uint8_t *req)
+ {
+-    (*req_length) -= _MODBUS_RTU_CHECKSUM_LENGTH;
+     /* No TID */
+     return 0;
+ }
+@@ -1187,7 +1186,7 @@ const modbus_backend_t _modbus_rtu_backend = {
+     _modbus_set_slave,
+     _modbus_rtu_build_request_basis,
+     _modbus_rtu_build_response_basis,
+-    _modbus_rtu_prepare_response_tid,
++    _modbus_rtu_get_response_tid,
+     _modbus_rtu_send_msg_pre,
+     _modbus_rtu_send,
+     _modbus_rtu_receive,
+diff --git a/src/modbus-tcp.c b/src/modbus-tcp.c
+index 733a4a9..60ac6b4 100644
+--- a/src/modbus-tcp.c
++++ b/src/modbus-tcp.c
+@@ -151,7 +151,7 @@ static int _modbus_tcp_build_response_basis(sft_t *sft, uint8_t *rsp)
+     return _MODBUS_TCP_PRESET_RSP_LENGTH;
+ }
+ 
+-static int _modbus_tcp_prepare_response_tid(const uint8_t *req, int *req_length)
++static int _modbus_tcp_get_response_tid(const uint8_t *req)
+ {
+     return (req[0] << 8) + req[1];
+ }
+@@ -812,7 +812,7 @@ const modbus_backend_t _modbus_tcp_backend = {
+     _modbus_set_slave,
+     _modbus_tcp_build_request_basis,
+     _modbus_tcp_build_response_basis,
+-    _modbus_tcp_prepare_response_tid,
++    _modbus_tcp_get_response_tid,
+     _modbus_tcp_send_msg_pre,
+     _modbus_tcp_send,
+     _modbus_tcp_receive,
+@@ -835,7 +835,7 @@ const modbus_backend_t _modbus_tcp_pi_backend = {
+     _modbus_set_slave,
+     _modbus_tcp_build_request_basis,
+     _modbus_tcp_build_response_basis,
+-    _modbus_tcp_prepare_response_tid,
++    _modbus_tcp_get_response_tid,
+     _modbus_tcp_send_msg_pre,
+     _modbus_tcp_send,
+     _modbus_tcp_receive,
+diff --git a/src/modbus.c b/src/modbus.c
+index fe192a7..e3737bb 100644
+--- a/src/modbus.c
++++ b/src/modbus.c
+@@ -125,7 +125,7 @@ int modbus_flush(modbus_t *ctx)
+     return rc;
+ }
+ 
+-/* Computes the length of the expected response */
++/* Computes the length of the expected response including checksum */
+ static unsigned int compute_response_length_from_request(modbus_t *ctx, uint8_t *req)
+ {
+     int length;
+@@ -386,8 +386,7 @@ int _modbus_receive_msg(modbus_t *ctx, uint8_t *msg, msg_type_t msg_type)
+     length_to_read = ctx->backend->header_length + 1;
+ 
+     if (msg_type == MSG_INDICATION) {
+-        /* Wait for a message, we don't know when the message will be
+-         * received */
++        /* Wait for a message, we don't know when the message will be received */
+         if (ctx->indication_timeout.tv_sec == 0 && ctx->indication_timeout.tv_usec == 0) {
+             /* By default, the indication timeout isn't set */
+             p_tv = NULL;
+@@ -799,7 +798,7 @@ int modbus_reply(modbus_t *ctx,
+ 
+     sft.slave = slave;
+     sft.function = function;
+-    sft.t_id = ctx->backend->prepare_response_tid(req, &req_length);
++    sft.t_id = ctx->backend->get_response_tid(req);
+ 
+     /* Data are flushed on illegal number of values errors. */
+     switch (function) {
+@@ -895,7 +894,7 @@ int modbus_reply(modbus_t *ctx,
+                                             MODBUS_EXCEPTION_ILLEGAL_DATA_ADDRESS,
+                                             rsp,
+                                             FALSE,
+-                                            "Illegal data address 0x%0X in write_bit\n",
++                                            "Illegal data address 0x%0X in write bit\n",
+                                             address);
+             break;
+         }
+@@ -904,20 +903,26 @@ int modbus_reply(modbus_t *ctx,
+         rsp_length = compute_response_length_from_request(ctx, (uint8_t *) req);
+         if (rsp_length != req_length) {
+             /* Bad use of modbus_reply */
+-            rsp_length =
+-                response_exception(ctx,
+-                                   &sft,
+-                                   MODBUS_EXCEPTION_ILLEGAL_DATA_VALUE,
+-                                   rsp,
+-                                   FALSE,
+-                                   "Invalid request length used in modbus_reply (%d)\n",
+-                                   req_length);
++            rsp_length = response_exception(
++                ctx,
++                &sft,
++                MODBUS_EXCEPTION_ILLEGAL_DATA_VALUE,
++                rsp,
++                FALSE,
++                "Invalid request length in modbus_reply to write bit (%d)\n",
++                req_length);
+             break;
+         }
+ 
++        /* Don't copy the CRC, if any, it will be computed later (even if identical to the
++         * request) */
++        rsp_length -= ctx->backend->checksum_length;
++
+         int data = (req[offset + 3] << 8) + req[offset + 4];
+         if (data == 0xFF00 || data == 0x0) {
++            /* Apply the change to mapping */
+             mb_mapping->tab_bits[mapping_address] = data ? ON : OFF;
++            /* Prepare response */
+             memcpy(rsp, req, rsp_length);
+         } else {
+             rsp_length = response_exception(
+@@ -949,19 +954,21 @@ int modbus_reply(modbus_t *ctx,
+         rsp_length = compute_response_length_from_request(ctx, (uint8_t *) req);
+         if (rsp_length != req_length) {
+             /* Bad use of modbus_reply */
+-            rsp_length =
+-                response_exception(ctx,
+-                                   &sft,
+-                                   MODBUS_EXCEPTION_ILLEGAL_DATA_VALUE,
+-                                   rsp,
+-                                   FALSE,
+-                                   "Invalid request length used in modbus_reply (%d)\n",
+-                                   req_length);
++            rsp_length = response_exception(
++                ctx,
++                &sft,
++                MODBUS_EXCEPTION_ILLEGAL_DATA_VALUE,
++                rsp,
++                FALSE,
++                "Invalid request length in modbus_reply to write register (%d)\n",
++                req_length);
+             break;
+         }
+         int data = (req[offset + 3] << 8) + req[offset + 4];
+ 
+         mb_mapping->tab_registers[mapping_address] = data;
++
++        rsp_length -= ctx->backend->checksum_length;
+         memcpy(rsp, req, rsp_length);
+     } break;
+     case MODBUS_FC_WRITE_MULTIPLE_COILS: {
+@@ -1082,8 +1089,23 @@ int modbus_reply(modbus_t *ctx,
+ 
+             data = (data & and) | (or &(~and));
+             mb_mapping->tab_registers[mapping_address] = data;
+-            memcpy(rsp, req, req_length);
+-            rsp_length = req_length;
++
++            rsp_length = compute_response_length_from_request(ctx, (uint8_t *) req);
++            if (rsp_length != req_length) {
++                /* Bad use of modbus_reply */
++                rsp_length = response_exception(ctx,
++                                                &sft,
++                                                MODBUS_EXCEPTION_ILLEGAL_DATA_VALUE,
++                                                rsp,
++                                                FALSE,
++                                                "Invalid request length in modbus_reply "
++                                                "to mask write register (%d)\n",
++                                                req_length);
++                break;
++            }
++
++            rsp_length -= ctx->backend->checksum_length;
++            memcpy(rsp, req, rsp_length);
+         }
+     } break;
+     case MODBUS_FC_WRITE_AND_READ_REGISTERS: {
+@@ -1171,7 +1193,6 @@ int modbus_reply_exception(modbus_t *ctx, const uint8_t *req, unsigned int excep
+     int function;
+     uint8_t rsp[MAX_MESSAGE_LENGTH];
+     int rsp_length;
+-    int dummy_length = 99;
+     sft_t sft;
+ 
+     if (ctx == NULL) {
+@@ -1185,7 +1206,7 @@ int modbus_reply_exception(modbus_t *ctx, const uint8_t *req, unsigned int excep
+ 
+     sft.slave = slave;
+     sft.function = function + 0x80;
+-    sft.t_id = ctx->backend->prepare_response_tid(req, &dummy_length);
++    sft.t_id = ctx->backend->get_response_tid(req);
+     rsp_length = ctx->backend->build_response_basis(&sft, rsp);
+ 
+     /* Positive exception code */
diff --git a/meta-oe/recipes-extended/libmodbus/libmodbus_3.1.10.bb b/meta-oe/recipes-extended/libmodbus/libmodbus_3.1.10.bb
index 9e17f91669..c8e1c3a3e2 100644
--- a/meta-oe/recipes-extended/libmodbus/libmodbus_3.1.10.bb
+++ b/meta-oe/recipes-extended/libmodbus/libmodbus_3.1.10.bb
@@ -6,7 +6,13 @@ SECTION = "libs"
 LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI = "git://github.com/stephane/libmodbus;branch=master;protocol=https"
+SRC_URI = " \
+    git://github.com/stephane/libmodbus;branch=master;protocol=https \
+    file://CVE-2024-10918-01.patch \
+    file://CVE-2024-10918-02.patch \
+    file://CVE-2024-10918-03.patch \
+    file://CVE-2024-10918-04.patch \
+"
 SRCREV = "2cbafa3113e276c3697d297f68e88d112b53174d"
 
 S = "${WORKDIR}/git"

