Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 993EFC77B73
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 11:14:00 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web11.6270.1686050039242363052
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Jun 2023 04:13:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@mvista.com header.s=google header.b=bH/0Hvt8;
 spf=pass (domain: mvista.com, ip: 209.85.215.171, mailfrom: hprajapati@mvista.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-53f9a376f3eso5330453a12.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Jun 2023 04:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1686050038; x=1688642038;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X/vmIs1nOnSF6hhmR8yULbCnK1cAvnifgsEsCBH1pnY=;
        b=bH/0Hvt8aV8qf65ojyhzR44mW7lu0rCLpgM/ArARmeSK8sFo/YvosNfhCQXcna9xJy
         /PlslrmfQERGIA8i4j0cH7aALthqbNqgbyTep6Tpo6jdoDqxR+5OKwaef+Ax+ARIHrYL
         ImzmiLtBZo+KWzEit65ln3NiFvnFxtKaD8wQ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686050038; x=1688642038;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X/vmIs1nOnSF6hhmR8yULbCnK1cAvnifgsEsCBH1pnY=;
        b=b0edVXeLh4iTdmEmEq7RkOf8dgb1PaFSOA6gYCRewe1TnzkBgGEd5Z5ueNMMhoF2i1
         Ulllniuo38AVERYJ4YxM8FsjqeJCGFovhnhFU4aEd9QAHpX7ObhWjTED/N49wsRtVHkU
         Tfq0WNp5ADtrtBRBz8DQxw+uScT7gdY89NOFCCIikdRxlOjGPeFEsSaRnsTiyiVDa78g
         82K0FUxXLaZWXK7TAGCR6lS+E9xu3zmjNZOd48857BheYYXZb2FAGVdW7yvqdn1AE3Oc
         CWn68wRe3d/RQBndgVBRfF4qVH7shhRhxG657/QHZ+Lhw1DDLlClShUCJ8cgXsRohKzh
         50Ug==
X-Gm-Message-State: AC+VfDyu4H9cZqrDh5yCGSu+CZ/1rWjBAFtQJ9Z2xPPWD3StSeBV5fFa
	huG/6e3+9IUVdLLfw0omkFrM4ThtRPRHdxwHWZ8=
X-Google-Smtp-Source: ACHHUZ6Nchw2AuuoWoI8o1sCsqcosWuqxFaU5M8E+D1aDYqlbRNDd8fOsU/9rib4xfTu3Bl2lIpmcA==
X-Received: by 2002:a17:902:d506:b0:1b1:9233:bbf5 with SMTP id b6-20020a170902d50600b001b19233bbf5mr2393647plg.57.1686050038325;
        Tue, 06 Jun 2023 04:13:58 -0700 (PDT)
Received: from MVIN00024 ([103.250.136.216])
        by smtp.gmail.com with ESMTPSA id ij15-20020a170902ab4f00b001ac40488620sm8399981plb.92.2023.06.06.04.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 04:13:58 -0700 (PDT)
Received: by MVIN00024 (sSMTP sendmail emulation); Tue, 06 Jun 2023 16:43:52 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-networking][kirkstone][PATCH] wireshark: CVE-2023-2856 VMS TCPIPtrace file parser crash
Date: Tue,  6 Jun 2023 16:43:51 +0530
Message-Id: <20230606111351.149204-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Jun 2023 11:14:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103139

Upstream-Status: Backport from https://gitlab.com/wireshark/wireshark/-/commit/db5135826de3a5fdb3618225c2ff02f4207012ca

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../wireshark/files/CVE-2023-2856.patch       | 69 +++++++++++++++++++
 .../wireshark/wireshark_3.4.12.bb             |  1 +
 2 files changed, 70 insertions(+)
 create mode 100644 meta-networking/recipes-support/wireshark/files/CVE-2023-2856.patch

diff --git a/meta-networking/recipes-support/wireshark/files/CVE-2023-2856.patch b/meta-networking/recipes-support/wireshark/files/CVE-2023-2856.patch
new file mode 100644
index 000000000..863421f98
--- /dev/null
+++ b/meta-networking/recipes-support/wireshark/files/CVE-2023-2856.patch
@@ -0,0 +1,69 @@
+From db5135826de3a5fdb3618225c2ff02f4207012ca Mon Sep 17 00:00:00 2001
+From: Guy Harris <gharris@sonic.net>
+Date: Thu, 18 May 2023 15:03:23 -0700
+Subject: [PATCH] vms: fix the search for the packet length field.
+
+The packet length field is of the form
+
+    Total Length = DDD = ^xXXX
+
+where "DDD" is the length in decimal and "XXX" is the length in
+hexadecimal.
+
+Search for "length ". not just "Length", as we skip past "Length ", not
+just "Length", so if we assume we found "Length " but only found
+"Length", we'd skip past the end of the string.
+
+While we're at it, fail if we don't find a length field, rather than
+just blithely acting as if the packet length were zero.
+
+Fixes #19083.
+
+Upstream-Status: Backport [https://gitlab.com/wireshark/wireshark/-/commit/db5135826de3a5fdb3618225c2ff02f4207012ca]
+CVE: CVE-2023-2856
+
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ wiretap/vms.c | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/wiretap/vms.c b/wiretap/vms.c
+index 0aa83ea..5f5fdbb 100644
+--- a/wiretap/vms.c
++++ b/wiretap/vms.c
+@@ -318,6 +318,7 @@ parse_vms_packet(FILE_T fh, wtap_rec *rec, Buffer *buf, int *err, gchar **err_in
+ {
+     char    line[VMS_LINE_LENGTH + 1];
+     int     num_items_scanned;
++    gboolean have_pkt_len = FALSE;
+     guint32 pkt_len = 0;
+     int     pktnum;
+     int     csec = 101;
+@@ -374,7 +375,7 @@ parse_vms_packet(FILE_T fh, wtap_rec *rec, Buffer *buf, int *err, gchar **err_in
+                 return FALSE;
+             }
+         }
+-        if ( (! pkt_len) && (p = strstr(line, "Length"))) {
++        if ( (! have_pkt_len) && (p = strstr(line, "Length "))) {
+             p += sizeof("Length ");
+             while (*p && ! g_ascii_isdigit(*p))
+                 p++;
+@@ -390,9 +391,15 @@ parse_vms_packet(FILE_T fh, wtap_rec *rec, Buffer *buf, int *err, gchar **err_in
+                 *err_info = g_strdup_printf("vms: Length field '%s' not valid", p);
+                 return FALSE;
+             }
++            have_pkt_len = TRUE;
+             break;
+         }
+     } while (! isdumpline(line));
++    if (! have_pkt_len) {
++        *err = WTAP_ERR_BAD_FILE;
++        *err_info = g_strdup_printf("vms: Length field not found");
++        return FALSE;
++    }
+     if (pkt_len > WTAP_MAX_PACKET_SIZE_STANDARD) {
+         /*
+          * Probably a corrupt capture file; return an error,
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb b/meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb
index b1f484803..f99669a62 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb
@@ -17,6 +17,7 @@ SRC_URI += " \
     file://0004-lemon-Remove-line-directives.patch \
     file://CVE-2022-3190.patch \
     file://CVE-2023-2855.patch \
+    file://CVE-2023-2856.patch \
 "
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
-- 
2.25.1


