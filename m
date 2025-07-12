Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE0F9C83F10
	for <webhook@archiver.kernel.org>; Sat, 12 Jul 2025 09:45:44 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web11.33131.1752313536890531071
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Jul 2025 02:45:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=giI7bhXA;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-202507120945331e5ecd00013d9bd575-9iyqnv@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 202507120945331e5ecd00013d9bd575
        for <openembedded-devel@lists.openembedded.org>;
        Sat, 12 Jul 2025 11:45:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=BTYTKjPAPVY479VuuwbSTufWLF1y8kMUYVLSt7KWFgk=;
 b=giI7bhXAgyr9c0V2RBddwRGKsbEMbP9ygR4WE7/HUvjfANp0NbbIIM2NRpMyCJ5lPgJ2C7
 2U9iOP6W6K/09Bol+QBcM5MmatYHFf7AnFc1tqwNmV9mWWU/1ruMwzPYheXDg9wuhHBVVJ/j
 iBllZy/AueOVCcAZnzmhbE2gqb53wkfJtja29CGwtRP/wXexObhdOQV6b924TlWdb+EWPozW
 Fp2dwj4JBbixkz3IkSZbzHK563w1EH6uxb4nSwGZNi/09qi5CApzw6LK7Uo+35YPgIafOZyH
 WydhqAYIneYtK1lwMvPSBRZy9jlyIQKclQiQpy+yhab7OKaT+uYjjsow==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-networking][walnascar][PATCH] libcoap: patch CVE-2024-31031
Date: Sat, 12 Jul 2025 11:44:45 +0200
Message-Id: <20250712094445.1899793-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 12 Jul 2025 09:45:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118470

From: Peter Marko <peter.marko@siemens.com>

Pick commit [1] from [2] which fixes [3] as listed in [4].

[1] https://github.com/obgm/libcoap/commit/214665ac4b44b1b6a7e38d4d6907ee835a174928
[2] https://github.com/obgm/libcoap/pull/1352
[3] https://github.com/obgm/libcoap/issues/1351
[4] https://nvd.nist.gov/vuln/detail/CVE-2024-31031

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../libcoap/libcoap/CVE-2024-31031.patch      | 82 +++++++++++++++++++
 .../recipes-devtools/libcoap/libcoap_4.3.4.bb |  1 +
 2 files changed, 83 insertions(+)
 create mode 100644 meta-networking/recipes-devtools/libcoap/libcoap/CVE-2024-31031.patch

diff --git a/meta-networking/recipes-devtools/libcoap/libcoap/CVE-2024-31031.patch b/meta-networking/recipes-devtools/libcoap/libcoap/CVE-2024-31031.patch
new file mode 100644
index 0000000000..bd1a88c87a
--- /dev/null
+++ b/meta-networking/recipes-devtools/libcoap/libcoap/CVE-2024-31031.patch
@@ -0,0 +1,82 @@
+From 214665ac4b44b1b6a7e38d4d6907ee835a174928 Mon Sep 17 00:00:00 2001
+From: Jon Shallow <supjps-libcoap@jpshallow.com>
+Date: Mon, 25 Mar 2024 20:44:48 +0000
+Subject: [PATCH] coap_pdu.c: Fix UndefinedBehaviorSanitizer:
+ undefined-behavior
+
+This fixes a reported error in coap_update_token() where a size_t
+calculation is overflowed (but all ends up with the correct value).
+
+Instead of adding an overflowed size_t, now subtract the reversed
+size_t calculation as appropriate.
+
+coap_update_option() and coap_insert_option() similarily updated.
+
+CVE: CVE-2024-31031
+Upstream-Status: Backport [https://github.com/obgm/libcoap/commit/214665ac4b44b1b6a7e38d4d6907ee835a174928]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/coap_pdu.c | 33 ++++++++++++++++++++++++---------
+ 1 file changed, 24 insertions(+), 9 deletions(-)
+
+diff --git a/src/coap_pdu.c b/src/coap_pdu.c
+index afe445c8..e3be3f02 100644
+--- a/src/coap_pdu.c
++++ b/src/coap_pdu.c
+@@ -389,12 +389,15 @@ coap_update_token(coap_pdu_t *pdu, size_t len, const uint8_t *data) {
+     memmove(&pdu->token[(len + bias) - pdu->e_token_length],
+             pdu->token, pdu->used_size);
+     pdu->used_size += len + bias - pdu->e_token_length;
++    if (pdu->data) {
++      pdu->data += (len + bias) - pdu->e_token_length;
++    }
+   } else {
+     pdu->used_size -= pdu->e_token_length - (len + bias);
+     memmove(pdu->token, &pdu->token[pdu->e_token_length - (len + bias)], pdu->used_size);
+-  }
+-  if (pdu->data) {
+-    pdu->data += (len + bias) - pdu->e_token_length;
++    if (pdu->data) {
++      pdu->data -= pdu->e_token_length - (len + bias);
++    }
+   }
+ 
+   pdu->actual_token.length = len;
+@@ -641,9 +644,15 @@ coap_insert_option(coap_pdu_t *pdu, coap_option_num_t number, size_t len,
+                        number - prev_number, data, len))
+     return 0;
+ 
+-  pdu->used_size += shift - shrink;
+-  if (pdu->data)
+-    pdu->data += shift - shrink;
++  if (shift >= shrink) {
++    pdu->used_size += shift - shrink;
++    if (pdu->data)
++      pdu->data += shift - shrink;
++  } else {
++    pdu->used_size -= shrink - shift;
++    if (pdu->data)
++      pdu->data -= shrink - shift;
++  }
+   return shift;
+ }
+ 
+@@ -681,9 +690,15 @@ coap_update_option(coap_pdu_t *pdu, coap_option_num_t number, size_t len,
+                        decode.delta, data, len))
+     return 0;
+ 
+-  pdu->used_size += new_length - old_length;
+-  if (pdu->data)
+-    pdu->data += new_length - old_length;
++  if (new_length >= old_length) {
++    pdu->used_size += new_length - old_length;
++    if (pdu->data)
++      pdu->data += new_length - old_length;
++  } else {
++    pdu->used_size -= old_length - new_length;
++    if (pdu->data)
++      pdu->data -= old_length - new_length;
++  }
+   return 1;
+ }
+ 
diff --git a/meta-networking/recipes-devtools/libcoap/libcoap_4.3.4.bb b/meta-networking/recipes-devtools/libcoap/libcoap_4.3.4.bb
index 604fec8072..79683c9632 100644
--- a/meta-networking/recipes-devtools/libcoap/libcoap_4.3.4.bb
+++ b/meta-networking/recipes-devtools/libcoap/libcoap_4.3.4.bb
@@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=1978dbc41673ab1c20e64b287c8317bc"
 SRC_URI = "git://github.com/obgm/libcoap.git;branch=main;protocol=https \
            file://run-ptest \
            file://CVE-2024-0962.patch \
+           file://CVE-2024-31031.patch \
            "
 SRCREV = "5fd2f89ef068214130e5d60b7087ef48711fa615"
 

