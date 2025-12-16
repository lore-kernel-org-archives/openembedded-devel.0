Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15B3FD5C0C0
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 07:16:03 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16742.1765869355291198922
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Dec 2025 23:15:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z6qLOVlt;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7f651586be1so1916310b3a.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 15 Dec 2025 23:15:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765869354; x=1766474154; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WYk/wYGUmQmnuQXzlWo+K1vOqnRoRHtIChlv8BT9w08=;
        b=Z6qLOVltcC/3aS34RmzIh/laamASwIn5/l8g8TQJH8th70jyOJwWmCGmNW+aRW5Lmu
         LstUkcCbPuUMZguJGSRz1EcRGQm3G5MGXik3OY0ZOA8xL3d7O0aLnEwHOLQlgci6Layo
         BRKl1pNrYcaGdFnxMWIZPOykzeuyMRIHYxiPabtT0re06iQVdG/XwQXhAfyffad2DOaE
         f3NiDgvzYd6v8vRANWEuUNm9eeowzTpxqmllr9VKVnyiWhwbpdZF6iP/QyARYmYrQgfY
         StNgBwW5tNHSgynak356IEyt+MqOQIW8cg2qJLPG6kbD7Ozq1WZMf2nUdOcqYSQBpe30
         fTPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765869354; x=1766474154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WYk/wYGUmQmnuQXzlWo+K1vOqnRoRHtIChlv8BT9w08=;
        b=XW8H4SAEFeXoYHQ7gozr4/rFResIqLdz6lLiOuzxRIWPGpXeT3KqB1+d6UoPKBVvpe
         aNm9c0WEqR/ohteYNxeVj+J3DC8NhfZjaqtB7GPYLgvUW4WVGFkOfiDxxVQQJ9CDxQbb
         ALmUJeqjRJNKh3kNKNHlk5d5efs4d7AxMEbWuzipHcEtOXE8aD9QW1QNgMsoPvbvHza6
         c076Te1MQoTtalUAtXUiMLwpH5ycpQdEqRwRXRFeYfq8d0ZuysmFhSrgfhm9OnGPLnEI
         FuWYPhEGQIeNzDxoGaWWwFvKuoholgTQApjoiToRoedcyT/GNH+ipteOTj1Px0YGsX30
         P6qA==
X-Gm-Message-State: AOJu0YwBqXxjoARcTsY9habNKM2uhL/SfK4QSwFoqiyp6TJ3VpbAAhum
	01M/rWVBMh44jWG2h1W3HU985GCkXXpnRcDHb0DzeeAsHN586uNLewZ7KKmZVg==
X-Gm-Gg: AY/fxX4NpqYAB+1e1j+0UofxoeSqQg+hnZq8seovlk7lfDi3lCOm372cVwgmGIKZkn+
	mIv3XoZSHkpGVXd+v6VVFWX67H2+zP8Kb64GV9eSyfSfALEJTpaTpk0cWnSjhpTsqVjsFnHW1td
	wwAvjNWpJbgbhPUeDsyOfsaKRnNLTeZhftbibWDTlh14lcmIOgW5X+QKf2+EGNwp4wWggthtI4V
	GYn1PAfnjxb8DFvZhrVXLZ1+/dl7pJZcI6A3zWRbnG+X0WfXSoommS8E9Sdc1mhriwQ6SzdlGHW
	5xqJahtD6ykEqrkjDZBiwSOWP3MCqpGlVyW4HGzlLR+hcpDJjWquAcRmii1EByhksU4VPj3fvJL
	WZWTzqaBLLHRgl+BzZ5WsbqedCnc9Ki814KVRh0pK1FHk16QBOHOczHsh4Jkju9OTE2SAEehJaf
	9ZRq0L9v0wYHHR9iqVfPzHmJ4Dw8xvmi/YEO0=
X-Google-Smtp-Source: AGHT+IG1lz2Od1obZBeTivH62Gh4AJ0++ijBOJPLBFlsatAD+6qAx4tCtQ44cGOCjFZhl8rIjR2udw==
X-Received: by 2002:a05:6a00:8b07:b0:7e8:3fcb:9b01 with SMTP id d2e1a72fcca58-7f51e0e81e8mr11496925b3a.23.1765869354361;
        Mon, 15 Dec 2025 23:15:54 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([165.225.124.223])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f4c2d48514sm14471448b3a.30.2025.12.15.23.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 23:15:53 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][scarthgap][PATCH 6/6] openvpn: patch CVE-2025-13086
Date: Tue, 16 Dec 2025 12:45:37 +0530
Message-ID: <20251216071537.3174578-6-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251216071537.3174578-1-ankur.tyagi85@gmail.com>
References: <20251216071537.3174578-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Dec 2025 07:16:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122685

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details https://nvd.nist.gov/vuln/detail/CVE-2025-13086

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../openvpn/openvpn/CVE-2025-13086.patch      | 157 ++++++++++++++++++
 .../recipes-support/openvpn/openvpn_2.6.14.bb |   1 +
 2 files changed, 158 insertions(+)
 create mode 100644 meta-networking/recipes-support/openvpn/openvpn/CVE-2025-13086.patch

diff --git a/meta-networking/recipes-support/openvpn/openvpn/CVE-2025-13086.patch b/meta-networking/recipes-support/openvpn/openvpn/CVE-2025-13086.patch
new file mode 100644
index 0000000000..a37ef84a8d
--- /dev/null
+++ b/meta-networking/recipes-support/openvpn/openvpn/CVE-2025-13086.patch
@@ -0,0 +1,157 @@
+From c56eb06a59ce8ccd601f1d58aa71cbd1211ee8d6 Mon Sep 17 00:00:00 2001
+From: Arne Schwabe <arne@rfc2549.org>
+Date: Mon, 27 Oct 2025 10:05:55 +0100
+Subject: [PATCH] Fix memcmp check for the hmac verification in the 3way
+ handshake being inverted
+
+This is a stupid mistake but causes all hmac cookies to be accepted,
+thus breaking source IP address validation.   As a consequence, TLS
+sessions can be openend and state can be consumed in the server from
+IP addresses that did not initiate an initial connection.
+
+While at it, fix check to only allow [t-2;t] timeslots, disallowing
+HMACs coming in from a future timeslot.
+
+Github: OpenVPN/openvpn-private-issues#56
+
+CVE: 2025-13086
+
+Reported-By: Joshua Rogers <contact@joshua.hu>
+Found-by: ZeroPath (https://zeropath.com/)
+Reported-By: stefan@srlabs.de
+
+Change-Id: I9cbe2bf535575b47ddd7f34e985c5c1c6953a6fc
+Signed-off-by: Arne Schwabe <arne@rfc2549.org>
+Acked-by: Max Fillinger <max@max-fillinger.net>
+(cherry picked from commit 68ec931e7fb4af11d5ba0d4283df0350083fd373)
+
+CVE: CVE-2025-13086
+Upstream-Status: Backport [https://github.com/OpenVPN/openvpn/commit/fa6a1824b0f37bff137204156a74ca28cf5b6f83]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/openvpn/ssl_pkt.c               |  7 ++--
+ tests/unit_tests/openvpn/test_pkt.c | 57 ++++++++++++++++++++++++++++-
+ 2 files changed, 60 insertions(+), 4 deletions(-)
+
+diff --git a/src/openvpn/ssl_pkt.c b/src/openvpn/ssl_pkt.c
+index 41299f46..e820dc93 100644
+--- a/src/openvpn/ssl_pkt.c
++++ b/src/openvpn/ssl_pkt.c
+@@ -545,13 +545,14 @@ check_session_id_hmac(struct tls_pre_decrypt_state *state,
+         return false;
+     }
+ 
+-    /* check adjacent timestamps too */
+-    for (int offset = -2; offset <= 1; offset++)
++    /* check adjacent timestamps too, the handwindow is split in 2 for the
++     * offset, so we check the current timeslot and the two before that */
++    for (int offset = -2; offset <= 0; offset++)
+     {
+         struct session_id expected_id =
+             calculate_session_id_hmac(state->peer_session_id, from, hmac, handwindow, offset);
+ 
+-        if (memcmp_constant_time(&expected_id, &state->server_session_id, SID_SIZE))
++        if (memcmp_constant_time(&expected_id, &state->server_session_id, SID_SIZE) == 0)
+         {
+             return true;
+         }
+diff --git a/tests/unit_tests/openvpn/test_pkt.c b/tests/unit_tests/openvpn/test_pkt.c
+index 74d7311f..4e97384d 100644
+--- a/tests/unit_tests/openvpn/test_pkt.c
++++ b/tests/unit_tests/openvpn/test_pkt.c
+@@ -429,6 +429,8 @@ test_verify_hmac_tls_auth(void **ut_state)
+     hmac_ctx_t *hmac = session_id_hmac_init();
+ 
+     struct link_socket_actual from = { 0 };
++    from.dest.addr.sa.sa_family = AF_INET;
++    from.dest.addr.in4.sin_addr.s_addr = ntohl(0x01020304);
+     struct tls_auth_standalone tas = { 0 };
+     struct tls_pre_decrypt_state state = { 0 };
+ 
+@@ -456,10 +458,12 @@ test_verify_hmac_tls_auth(void **ut_state)
+ static void
+ test_verify_hmac_none(void **ut_state)
+ {
++    now = 1000;
+     hmac_ctx_t *hmac = session_id_hmac_init();
+ 
+     struct link_socket_actual from = { 0 };
+     from.dest.addr.sa.sa_family = AF_INET;
++    from.dest.addr.in4.sin_addr.s_addr = ntohl(0x01020304);
+ 
+     struct tls_auth_standalone tas = { 0 };
+     struct tls_pre_decrypt_state state = { 0 };
+@@ -475,8 +479,59 @@ test_verify_hmac_none(void **ut_state)
+     assert_int_equal(verdict, VERDICT_VALID_ACK_V1);
+ 
+     bool valid = check_session_id_hmac(&state, &from.dest, hmac, 30);
++    assert_false(valid);
++
++    struct session_id client_id = { { 0xae, 0xb9, 0xaf, 0xe1, 0xf0, 0x1d, 0x79, 0xc8 } };
++    assert_memory_equal(&client_id, &state.peer_session_id, sizeof(struct session_id));
++
++    struct session_id expected_id = calculate_session_id_hmac(client_id, &from.dest, hmac, 30, 0);
++
++    free_tls_pre_decrypt_state(&state);
++    buf_reset_len(&buf);
++
++    /* Write the packet again into the buffer but this time, replacing the peer packet
++     * id with the expected one */
++    buf_write(&buf, client_ack_none_random_id, sizeof(client_ack_none_random_id) - 8);
++    buf_write(&buf, expected_id.id, 8);
++
++    verdict = tls_pre_decrypt_lite(&tas, &state, &from, &buf);
++    assert_int_equal(verdict, VERDICT_VALID_ACK_V1);
++    valid = check_session_id_hmac(&state, &from.dest, hmac, 30);
++
+     assert_true(valid);
+ 
++    /* Our handwindow is 30 so the slices are half of that, so they are
++     * (975,990), (990, 1005), (1005, 1020), (1020, 1035), (1035, 1050)
++     * So setting time to the two future ones should work
++     */
++    now = 980;
++    assert_false(check_session_id_hmac(&state, &from.dest, hmac, 30));
++    now = 1040;
++    assert_false(check_session_id_hmac(&state, &from.dest, hmac, 30));
++    now = 1002;
++    assert_true(check_session_id_hmac(&state, &from.dest, hmac, 30));
++    now = 1022;
++    assert_true(check_session_id_hmac(&state, &from.dest, hmac, 30));
++    now = 1010;
++    assert_true(check_session_id_hmac(&state, &from.dest, hmac, 30));
++
++    /* Changing the IP address should make this invalid */
++    from.dest.addr.in4.sin_addr.s_addr = ntohl(0x01020305);
++    assert_false(check_session_id_hmac(&state, &from.dest, hmac, 30));
++
++    /* Change to the correct one again */
++    from.dest.addr.in4.sin_addr.s_addr = ntohl(0x01020304);
++    assert_true(check_session_id_hmac(&state, &from.dest, hmac, 30));
++
++    /* Modify the peer id, should now fail hmac verification */
++    buf_inc_len(&buf, -4);
++    buf_write_u32(&buf, 0x12345678);
++
++    free_tls_pre_decrypt_state(&state);
++    verdict = tls_pre_decrypt_lite(&tas, &state, &from, &buf);
++    assert_int_equal(verdict, VERDICT_VALID_ACK_V1);
++    assert_false(check_session_id_hmac(&state, &from.dest, hmac, 30));
++
+     free_tls_pre_decrypt_state(&state);
+     free_buf(&buf);
+     hmac_ctx_cleanup(hmac);
+@@ -663,12 +718,12 @@ int
+ main(void)
+ {
+     const struct CMUnitTest tests[] = {
++        cmocka_unit_test(test_verify_hmac_none),
+         cmocka_unit_test(test_tls_decrypt_lite_none),
+         cmocka_unit_test(test_tls_decrypt_lite_auth),
+         cmocka_unit_test(test_tls_decrypt_lite_crypt),
+         cmocka_unit_test(test_parse_ack),
+         cmocka_unit_test(test_calc_session_id_hmac_static),
+-        cmocka_unit_test(test_verify_hmac_none),
+         cmocka_unit_test(test_verify_hmac_tls_auth),
+         cmocka_unit_test(test_generate_reset_packet_plain),
+         cmocka_unit_test(test_generate_reset_packet_tls_auth),
diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.6.14.bb b/meta-networking/recipes-support/openvpn/openvpn_2.6.14.bb
index 5361709f0c..305a69bec4 100644
--- a/meta-networking/recipes-support/openvpn/openvpn_2.6.14.bb
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.6.14.bb
@@ -10,6 +10,7 @@ inherit autotools systemd update-rc.d pkgconfig
 SRC_URI = "http://swupdate.openvpn.org/community/releases/${BP}.tar.gz \
            file://0001-configure.ac-eliminate-build-path-from-openvpn-versi.patch \
            file://openvpn \
+           file://CVE-2025-13086.patch \
           "
 
 UPSTREAM_CHECK_URI = "https://openvpn.net/community-downloads"

