Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 757D6C982FA
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 10:41:25 +0000 (UTC)
Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4165.1790160084743051211
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2026 03:41:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=XCgbmv2h;
 spf=pass (domain: gmail.com, ip: 74.125.228.41, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-86efece610cso402067b3a.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 03:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790160084; x=1790764884; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3A6axOm4CHcUGmPnwRchf67ER29TLSp6J6xw15vbdVc=;
        b=XCgbmv2hnlau2Xi1ec2hANuIUEL+ktI+ep5hik+wTYRcX42Dr7HrJQEoXDk6T8pzzQ
         UKyVRTwQu/6b1o5cXqTB3XKPlQ3z8BgLC8GFaWQwq2aIiS4ssrXnPDykxENvcz8/aIil
         M8oSPNEoPyo9VFvm9ZXyTkJH2lFi3jG1xHpXhvJduM580HZqPn5riFdUTQAHbiBvHEi5
         SAajOzfkRyi/gHt5QTAq6sFyyeVKodemG3G9jDf7UKeHFls58IBGOEfb0BJ5BvL4N2Ja
         6Hen+aDotBu3Hpm9V35hJtT0wBufmmtInG45gjas6iZt3FxBWna4z95HTif/UZ0W20g7
         aZeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790160084; x=1790764884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3A6axOm4CHcUGmPnwRchf67ER29TLSp6J6xw15vbdVc=;
        b=MaA063lEZ+h1fHlxjT2jCbMUD38XnidPM812bFsMK8yIwP9AEqA/kO0/Sn/SVK7ee2
         SjmwJpKOwhyzLW3lM8mXIDbRknELJkGbiJTmqyamodjesMAhai3iYKDDGS3f55o+dfmn
         BfX1k08pwH8nCqUmxz8S62w5ijBbSfKNkY87EmKMRbDH111IDWhioJhCtclZs3oxyLuf
         48GehtHBzxyrmwAiOhDTlxGPW8qbX/IMV4VTPWA+/16AfF2ICpP/ihOnAWs+p1SBYJhB
         zHVIWlWRm4NqKvyyJzOGmegox6WM31of9CQZKybNh3xJnkUlKVbpPZpHVMxZDrecw6lh
         mWDw==
X-Gm-Message-State: AFuF++kl+5YQm5z+pcUUJPMMMtjkwtG1623fy+PtE60q/beCVWRAuH34
	98RLNSDxvFktcMCKKAv+sChg/JyaqRLluv9znIWv5M4MUTaxJD4fdEq9CKJbSw==
X-Gm-Gg: AYBFou1W+9ChklSJ4HXH7A9YMf2SwqQfsOiCzO/zoJ+6fRuob0TjkqWIrVNLs/R+PUW
	e267xfeBGk7XSfFhiJpTHiaYXzBlRL/vpl7drRINHEqSjWw+ly4Eahy3XYK97oDg0SCCOnh2Vpf
	StK5eYsoeNhT78AxabxyjFAiH7zRls/qUjY4tkWwTtILzAbsdq7bSmZK4fDfKbIeeX6g3cjnTnN
	9y3uveTSpZem8AoK5MTwwVLd0VeRuYu8YR/CBmXuPeMES1dGkIcqQHhoWA3EHePblyJBxa/IDlo
	W3tj8uv21Wip/LzNL2gt8J/EC4kNvlreqRxI87m3vpcqyS6oMKFXEWTWORiqeSs9sf9cy1zsd51
	Zu59SlRvnQV0dQ/62aGciAFDq+rHpQwQ7zzRv2IQYoQUqFs/kUzJXiuZAN8unYZeLhCIHILYJAt
	czAJQAtkEVk+grRTgUUbKN+L/jv+l5A3kWWKvMbf2WQmpCpeeuEjvaixoljqwHgBbjQoERRXzfO
	q0ZThzo48aqqPWZfLbB20vm3KNIUNmQcA==
X-Received: by 2002:a05:6a00:1707:b0:874:708d:b633 with SMTP id d2e1a72fcca58-87d1bfad49emr1940866b3a.31.1790160084064;
        Wed, 23 Sep 2026 03:41:24 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1d5c1646sm1035870b3a.30.2026.09.23.03.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:41:23 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 12/42] freeipmi: patch CVE-2026-85505
Date: Wed, 23 Sep 2026 22:40:26 +1200
Message-ID: <20260923104056.457360-12-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923104056.457360-1-ankur.tyagi85@gmail.com>
References: <20260923104056.457360-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 10:41:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130199

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Backport commit from v1.6.19 matching NVD description.

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-85505

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../freeipmi/freeipmi/CVE-2026-85505.patch    | 49 +++++++++++++++++++
 .../freeipmi/freeipmi_1.6.17.bb               |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta-oe/recipes-support/freeipmi/freeipmi/CVE-2026-85505.patch

diff --git a/meta-oe/recipes-support/freeipmi/freeipmi/CVE-2026-85505.patch b/meta-oe/recipes-support/freeipmi/freeipmi/CVE-2026-85505.patch
new file mode 100644
index 0000000000..e27b8a976d
--- /dev/null
+++ b/meta-oe/recipes-support/freeipmi/freeipmi/CVE-2026-85505.patch
@@ -0,0 +1,49 @@
+From e479401fcd9588f1ffb7444e09b97afc29f21f82 Mon Sep 17 00:00:00 2001
+From: Albert L Chu <chu11@llnl.gov>
+Date: Mon, 17 Aug 2026 16:55:00 -0700
+Subject: [PATCH] ipmi-oem: clamp Fujitsu SEL long-text truncate copy to actual
+ data
+
+ipmi_oem_fujitsu_get_sel_entry_long_text, in the "truncate if there is
+overflow" branch, copied a fixed
+IPMI_OEM_FUJITSU_SEL_ENTRY_LONG_TEXT_MAX_DATA_LENGTH - offset bytes from
+&bytes_rs[16] into data_buf regardless of how many bytes the BMC
+actually returned.  bytes_rs is filled only to rs_len and is not
+memset, so a short response left the memcpy reading uninitialized stack
+past the real data.  The read stayed within the 256-byte bytes_rs and
+the data_buf destination, so it was an uninitialized read, not an
+out-of-bounds access.
+
+The truncate branch is entered only when offset + component_length
+exceeds data_length, so data_length - offset is both the number of bytes
+needed to fill data_buf to data_length and strictly less than
+component_length (= strlen of the NUL-terminated response data), hence
+always within the received bytes.  Copy that amount instead of the fixed
+maximum.
+
+Assisted-by: Claude (Opus 4.8) <noreply@anthropic.com>
+(cherry picked from commit 8e0e908c5f11f3ccbf128e09af58568767e6367c)
+
+CVE: CVE-2026-85505
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/freeipmi.git/commit/?h=freeipmi-1-6-19&id=8e0e908c5f11f3ccbf128e09af58568767e6367c]
+
+Dropped changes to the ChangeLog file.
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ ipmi-oem/ipmi-oem-fujitsu.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/ipmi-oem/ipmi-oem-fujitsu.c b/ipmi-oem/ipmi-oem-fujitsu.c
+index 10220c9fc..57d04a0bf 100644
+--- a/ipmi-oem/ipmi-oem-fujitsu.c
++++ b/ipmi-oem/ipmi-oem-fujitsu.c
+@@ -1400,7 +1400,7 @@ ipmi_oem_fujitsu_get_sel_entry_long_text (ipmi_oem_state_data_t *state_data)
+         {
+           memcpy (data_buf + offset,
+                   &bytes_rs[16],
+-                  IPMI_OEM_FUJITSU_SEL_ENTRY_LONG_TEXT_MAX_DATA_LENGTH - offset);
++                  data_length - offset);
+           offset = data_length;
+         }
+       else
diff --git a/meta-oe/recipes-support/freeipmi/freeipmi_1.6.17.bb b/meta-oe/recipes-support/freeipmi/freeipmi_1.6.17.bb
index 8438a517ec..a3a5fb5af0 100644
--- a/meta-oe/recipes-support/freeipmi/freeipmi_1.6.17.bb
+++ b/meta-oe/recipes-support/freeipmi/freeipmi_1.6.17.bb
@@ -20,6 +20,7 @@ SRC_URI = "${GNU_MIRROR}/freeipmi/freeipmi-${PV}.tar.gz \
            file://CVE-2026-85508.patch \
            file://CVE-2026-85507.patch \
            file://CVE-2026-85506.patch \
+           file://CVE-2026-85505.patch \
 "
 SRC_URI[sha256sum] = "16783d10faa28847a795cce0bf86deeaa72b8fbe71d1f0dc1101d13a6b501ec1"
 

