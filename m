Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 056D7C677F1
	for <webhook@archiver.kernel.org>; Fri, 24 Feb 2023 04:41:17 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.10819.1677213675177470235
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Feb 2023 20:41:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=NJoF2CyP;
 spf=pass (domain: mvista.com, ip: 209.85.214.181, mailfrom: hprajapati@mvista.com)
Received: by mail-pl1-f181.google.com with SMTP id ko13so16136456plb.13
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Feb 2023 20:41:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MgdNiBZwh/VADbpT+zmUpIsu1NkhJ+b/mEEE2jNXnYY=;
        b=NJoF2CyPJkhytLNsTNabq+IXmMZfFMMRPBKEaKobMgoBJVqQA+fXyIZoMTcQ2Twed6
         ptiX1XLrpiP955owKHLNcmdcyxMllh1ehImJ0M8KVPfMivu5GGO9f/jvm4gB+qAKBTHD
         Ki+X1EtkhPAd20WRhQW4wTlbwNIBNuPZJaffU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MgdNiBZwh/VADbpT+zmUpIsu1NkhJ+b/mEEE2jNXnYY=;
        b=c9ROviiDfIvOOPm6ASDVFthKQRclQDSTNzBaA7BqSlJhRPgQjzxTd9LCHL1U2X8kuB
         tMW7EQM4Jnf9xu0Kx8nETIrfD+koSwRVluzAJHA3kUK0brIfgKp10fxqG0kmUncLdNas
         gfupQ37PF9aNry97EqTtCD1dJXFtoE0UkrmeQj9+EF/KQbfd4P4HQ1SfBWJ9/QitFdmG
         v2uh+ziQ3PlW579yP3MjDgbPvrQqYl4E8762cF2qGLYzXgjoxJo/N2ousSp/LXuHJZsN
         inuE6hPZdJDDlu0xtooKyun2fjG1S5YOU2NO5dmdL1zi5KcMaS9eSV47y7NHCG1kM9BT
         FVKw==
X-Gm-Message-State: AO0yUKXXQ9HAXzrICsJqz3JtrQCVFHiDbUKCAxWu303E6rpQA+uSJk/4
	6sgm3XFFwqirdBg8IVYlCF4kDMKBLfYnlb+7
X-Google-Smtp-Source: AK7set++j1oUoP+aeu16jyL00ZbokLZbdDendI5WrJwo74CsbmCzKZnQ6K4BUcn4bRgW+Ub5bJIoUw==
X-Received: by 2002:a17:903:138f:b0:19c:960c:53c7 with SMTP id jx15-20020a170903138f00b0019c960c53c7mr9952936plb.14.1677213673678;
        Thu, 23 Feb 2023 20:41:13 -0800 (PST)
Received: from MVIN00024 ([150.129.170.206])
        by smtp.gmail.com with ESMTPSA id bi12-20020a170902bf0c00b0019625428cefsm4216158plb.281.2023.02.23.20.41.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Feb 2023 20:41:13 -0800 (PST)
Received: by MVIN00024 (sSMTP sendmail emulation); Fri, 24 Feb 2023 10:11:08 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: akuster808@gmail.com,
	Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-security][dunfell][PATCH] sssd: CVE-2022-4254 libsss_certmap fails to sanitise certificate data used in LDAP filters
Date: Fri, 24 Feb 2023 10:11:06 +0530
Message-Id: <20230224044106.6302-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Feb 2023 04:41:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101246

Upstream-Status: Backport from https://github.com/SSSD/sssd/commit/1c40208aa1e0f9a17cc4f336c99bcaa6977592d3 & https://github.com/SSSD/sssd/commit/a2b9a84460429181f2a4fa7e2bb5ab49fd561274

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../sssd/files/CVE-2022-4254-1.patch          | 515 ++++++++++++++
 .../sssd/files/CVE-2022-4254-2.patch          | 655 ++++++++++++++++++
 recipes-security/sssd/sssd_1.16.4.bb          |   2 +
 3 files changed, 1172 insertions(+)
 create mode 100644 recipes-security/sssd/files/CVE-2022-4254-1.patch
 create mode 100644 recipes-security/sssd/files/CVE-2022-4254-2.patch

diff --git a/recipes-security/sssd/files/CVE-2022-4254-1.patch b/recipes-security/sssd/files/CVE-2022-4254-1.patch
new file mode 100644
index 0000000..a52ce1a
--- /dev/null
+++ b/recipes-security/sssd/files/CVE-2022-4254-1.patch
@@ -0,0 +1,515 @@
+From 1c40208aa1e0f9a17cc4f336c99bcaa6977592d3 Mon Sep 17 00:00:00 2001
+From: Sumit Bose <sbose@redhat.com>
+Date: Tue, 27 Nov 2018 16:40:01 +0100
+Subject: [PATCH] certmap: add sss_certmap_display_cert_content()
+
+To make debugging and writing certificate mapping and matching rules
+more easy a new function is added to libsss_certmap to display the
+certificate content as seen by libsss_certmap. Please note that the
+actual output might change in future.
+
+Reviewed-by: Jakub Hrozek <jhrozek@redhat.com>
+
+CVE: CVE-2022-4254
+Upstream-Status: Backport [https://github.com/SSSD/sssd/commit/1c40208aa1e0f9a17cc4f336c99bcaa6977592d3]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ Makefile.am                              |   2 +-
+ src/lib/certmap/sss_certmap.c            | 142 ++++++++++++++++++++++
+ src/lib/certmap/sss_certmap.exports      |   5 +
+ src/lib/certmap/sss_certmap.h            |  18 +++
+ src/lib/certmap/sss_certmap_int.h        |  31 ++++-
+ src/lib/certmap/sss_certmap_krb5_match.c | 145 +++++++++++------------
+ 6 files changed, 261 insertions(+), 82 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 4475b3d..29cd93c 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -1835,7 +1835,7 @@ libsss_certmap_la_LIBADD = \
+     $(NULL)
+ libsss_certmap_la_LDFLAGS = \
+     -Wl,--version-script,$(srcdir)/src/lib/certmap/sss_certmap.exports \
+-    -version-info 0:0:0
++    -version-info 1:0:1
+ 
+ if HAVE_NSS
+ libsss_certmap_la_SOURCES += \
+diff --git a/src/lib/certmap/sss_certmap.c b/src/lib/certmap/sss_certmap.c
+index f6f6f98..c60ac24 100644
+--- a/src/lib/certmap/sss_certmap.c
++++ b/src/lib/certmap/sss_certmap.c
+@@ -914,3 +914,145 @@ void sss_certmap_free_filter_and_domains(char *filter, char **domains)
+     talloc_free(filter);
+     talloc_free(domains);
+ }
++
++static const char *sss_eku_oid2name(const char *oid)
++{
++    size_t c;
++
++    for (c = 0; sss_ext_key_usage[c].name != NULL; c++) {
++        if (strcmp(sss_ext_key_usage[c].oid, oid) == 0) {
++            return sss_ext_key_usage[c].name;
++        }
++    }
++
++    return NULL;
++}
++
++struct parsed_template san_parsed_template[] = {
++    { NULL, NULL, NULL }, /* SAN_OTHER_NAME handled separately */
++    { "subject_rfc822_name", NULL, NULL},
++    { "subject_dns_name", NULL, NULL},
++    { "subject_x400_address", NULL, NULL},
++    { "subject_directory_name", NULL, NULL},
++    { "subject_ediparty_name", NULL, NULL},
++    { "subject_uri", NULL, NULL},
++    { "subject_ip_address", NULL, NULL},
++    { "subject_registered_id", NULL, NULL},
++    { "subject_pkinit_principal", NULL, NULL},
++    { "subject_nt_principal", NULL, NULL},
++    { "subject_principal", NULL, NULL},
++    { NULL, NULL, NULL }, /* SAN_STRING_OTHER_NAME handled separately */
++    { NULL, NULL, NULL }  /* SAN_END */
++};
++
++int sss_cert_dump_content(TALLOC_CTX *mem_ctx, struct sss_cert_content *c,
++                          char **content_str)
++{
++    char *out = NULL;
++    size_t o;
++    struct san_list *s;
++    struct sss_certmap_ctx *ctx = NULL;
++    char *expanded = NULL;
++    int ret;
++    char *b64 = NULL;
++    const char *eku_str = NULL;
++
++    ret = sss_certmap_init(mem_ctx, NULL, NULL, &ctx);
++    if (ret != EOK) {
++        return ret;
++    }
++
++    out = talloc_strdup(mem_ctx, "sss cert content (format might change):\n");
++    if (out == NULL) return ENOMEM;
++
++    out = talloc_asprintf_append(out, "Issuer: %s\n", c->issuer_str != NULL
++                                                         ? c->issuer_str
++                                                         : "- not available -");
++    if (out == NULL) return ENOMEM;
++    out = talloc_asprintf_append(out, "Subject: %s\n", c->subject_str != NULL
++                                                         ? c->subject_str
++                                                         : "- not available -");
++    if (out == NULL) return ENOMEM;
++
++    out = talloc_asprintf_append(out, "Key Usage: %u(0x%04x)", c->key_usage,
++                                                               c->key_usage);
++    if (out == NULL) return ENOMEM;
++
++    if (c->key_usage != 0) {
++        out = talloc_asprintf_append(out, " (");
++        if (out == NULL) return ENOMEM;
++        for (o = 0; sss_key_usage[o].name != NULL; o++) {
++            if ((c->key_usage & sss_key_usage[o].flag) != 0) {
++                out = talloc_asprintf_append(out, "%s%s",
++                                             o == 0 ? "" : ",",
++                                             sss_key_usage[o].name);
++                if (out == NULL) return ENOMEM;
++            }
++        }
++        out = talloc_asprintf_append(out, ")");
++        if (out == NULL) return ENOMEM;
++    }
++    out = talloc_asprintf_append(out, "\n");
++    if (out == NULL) return ENOMEM;
++
++    for (o = 0; c->extended_key_usage_oids[o] != NULL; o++) {
++        eku_str = sss_eku_oid2name(c->extended_key_usage_oids[o]);
++        out = talloc_asprintf_append(out, "Extended Key Usage #%zu: %s%s%s%s\n",
++                                          o, c->extended_key_usage_oids[o],
++                                          eku_str == NULL ? "" : " (",
++                                          eku_str == NULL ? "" : eku_str,
++                                          eku_str == NULL ? "" : ")");
++        if (out == NULL) return ENOMEM;
++    }
++
++    DLIST_FOR_EACH(s, c->san_list) {
++        out = talloc_asprintf_append(out, "SAN type: %s\n",
++                                     s->san_opt < SAN_END
++                                                ? sss_san_names[s->san_opt].name
++                                                : "- unsupported -");
++        if (out == NULL) return ENOMEM;
++
++        if (san_parsed_template[s->san_opt].name != NULL) {
++            ret = expand_san(ctx, &san_parsed_template[s->san_opt], c->san_list,
++                             &expanded);
++            if (ret != EOK) {
++                return ret;
++            }
++            out = talloc_asprintf_append(out, " %s=%s\n\n",
++                                         san_parsed_template[s->san_opt].name,
++                                         expanded);
++            talloc_free(expanded);
++            if (out == NULL) return ENOMEM;
++        } else if (s->san_opt == SAN_STRING_OTHER_NAME) {
++            b64 = sss_base64_encode(mem_ctx, s->bin_val, s->bin_val_len);
++            out = talloc_asprintf_append(out, " %s=%s\n\n", s->other_name_oid,
++                                              b64 != NULL ? b64
++                                                          : "- cannot encode -");
++            talloc_free(b64);
++        }
++    }
++
++    *content_str = out;
++
++    return EOK;
++}
++
++int sss_certmap_display_cert_content(TALLOC_CTX *mem_cxt,
++                                     const uint8_t *der_cert, size_t der_size,
++                                     char **desc)
++{
++    int ret;
++    struct sss_cert_content *content;
++
++    ret = sss_cert_get_content(mem_cxt, der_cert, der_size, &content);
++    if (ret != EOK) {
++        return ret;
++    }
++
++    ret = sss_cert_dump_content(mem_cxt, content, desc);
++    if (ret != EOK) {
++        return ret;
++    }
++
++    return 0;
++}
+diff --git a/src/lib/certmap/sss_certmap.exports b/src/lib/certmap/sss_certmap.exports
+index 8b5d536..a9e48d6 100644
+--- a/src/lib/certmap/sss_certmap.exports
++++ b/src/lib/certmap/sss_certmap.exports
+@@ -11,3 +11,8 @@ SSS_CERTMAP_0.0 {
+     local:
+         *;
+ };
++
++SSS_CERTMAP_0.1 {
++    global:
++        sss_certmap_display_cert_content;
++} SSS_CERTMAP_0.0;
+diff --git a/src/lib/certmap/sss_certmap.h b/src/lib/certmap/sss_certmap.h
+index 646e0f3..7da2d1c 100644
+--- a/src/lib/certmap/sss_certmap.h
++++ b/src/lib/certmap/sss_certmap.h
+@@ -146,6 +146,24 @@ int sss_certmap_get_search_filter(struct sss_certmap_ctx *ctx,
+  */
+ void sss_certmap_free_filter_and_domains(char *filter, char **domains);
+ 
++/**
++ * @brief Get a string with the content of the certificate used by the library
++ *
++ * @param[in]  mem_ctx    Talloc memory context, may be NULL
++ * @param[in]  der_cert   binary blog with the DER encoded certificate
++ * @param[in]  der_size   size of the certificate blob
++ * @param[out] desc       Multiline string showing the certificate content
++ *                        which is used by libsss_certmap
++ *
++ * @return
++ *  - 0:      success
++ *  - EINVAL: certificate cannot be parsed
++ *  - ENOMEM: memory allocation failure
++ */
++int sss_certmap_display_cert_content(TALLOC_CTX *mem_cxt,
++                                     const uint8_t *der_cert, size_t der_size,
++                                     char **desc);
++
+ /**
+  * @}
+  */
+diff --git a/src/lib/certmap/sss_certmap_int.h b/src/lib/certmap/sss_certmap_int.h
+index 479cc16..b1155e2 100644
+--- a/src/lib/certmap/sss_certmap_int.h
++++ b/src/lib/certmap/sss_certmap_int.h
+@@ -101,9 +101,9 @@ enum comp_type {
+ };
+ 
+ struct parsed_template {
+-    char *name;
+-    char *attr_name;
+-    char *conversion;
++    const char *name;
++    const char *attr_name;
++    const char *conversion;
+ };
+ 
+ struct ldap_mapping_rule_comp {
+@@ -166,6 +166,28 @@ struct san_list {
+ #define SSS_KU_ENCIPHER_ONLY        0x0001
+ #define SSS_KU_DECIPHER_ONLY        0x8000
+ 
++struct sss_key_usage {
++    const char *name;
++    uint32_t flag;
++};
++
++extern const struct sss_key_usage sss_key_usage[];
++
++struct sss_ext_key_usage {
++    const char *name;
++    const char *oid;
++};
++
++extern const struct sss_ext_key_usage sss_ext_key_usage[];
++
++struct sss_san_name {
++    const char *name;
++    enum san_opt san_opt;
++    bool is_string;
++};
++
++extern const struct sss_san_name sss_san_names[];
++
+ struct sss_cert_content {
+     char *issuer_str;
+     const char **issuer_rdn_list;
+@@ -183,6 +205,9 @@ int sss_cert_get_content(TALLOC_CTX *mem_ctx,
+                          const uint8_t *der_blob, size_t der_size,
+                          struct sss_cert_content **content);
+ 
++int sss_cert_dump_content(TALLOC_CTX *mem_ctx, struct sss_cert_content *c,
++                          char **content_str);
++
+ char *check_ad_attr_name(TALLOC_CTX *mem_ctx, const char *rdn);
+ 
+ char *openssl_2_nss_attr_name(const char *attr);
+diff --git a/src/lib/certmap/sss_certmap_krb5_match.c b/src/lib/certmap/sss_certmap_krb5_match.c
+index 125e925..398d3d2 100644
+--- a/src/lib/certmap/sss_certmap_krb5_match.c
++++ b/src/lib/certmap/sss_certmap_krb5_match.c
+@@ -29,6 +29,59 @@
+ #include "lib/certmap/sss_certmap.h"
+ #include "lib/certmap/sss_certmap_int.h"
+ 
++const struct sss_key_usage sss_key_usage[] = {
++    {"digitalSignature" , SSS_KU_DIGITAL_SIGNATURE},
++    {"nonRepudiation"   , SSS_KU_NON_REPUDIATION},
++    {"keyEncipherment"  , SSS_KU_KEY_ENCIPHERMENT},
++    {"dataEncipherment" , SSS_KU_DATA_ENCIPHERMENT},
++    {"keyAgreement"     , SSS_KU_KEY_AGREEMENT},
++    {"keyCertSign"      , SSS_KU_KEY_CERT_SIGN},
++    {"cRLSign"          , SSS_KU_CRL_SIGN},
++    {"encipherOnly"     , SSS_KU_ENCIPHER_ONLY},
++    {"decipherOnly"     , SSS_KU_DECIPHER_ONLY},
++    {NULL ,0}
++};
++
++const struct sss_ext_key_usage sss_ext_key_usage[] = {
++    /* RFC 3280 section 4.2.1.13 */
++    {"serverAuth",      "1.3.6.1.5.5.7.3.1"},
++    {"clientAuth",      "1.3.6.1.5.5.7.3.2"},
++    {"codeSigning",     "1.3.6.1.5.5.7.3.3"},
++    {"emailProtection", "1.3.6.1.5.5.7.3.4"},
++    {"timeStamping",    "1.3.6.1.5.5.7.3.8"},
++    {"OCSPSigning",     "1.3.6.1.5.5.7.3.9"},
++
++    /* RFC 4556 section 3.2.2 */
++    {"KPClientAuth",    "1.3.6.1.5.2.3.4"},
++    {"pkinit",          "1.3.6.1.5.2.3.4"},
++
++    /* https://support.microsoft.com/en-us/help/287547/object-ids-associated-with-microsoft-cryptography*/
++    {"msScLogin",       "1.3.6.1.4.1.311.20.2.2"},
++
++    {NULL ,0}
++};
++
++const struct sss_san_name sss_san_names[] = {
++    /* https://www.ietf.org/rfc/rfc3280.txt section 4.2.1.7 */
++    {"otherName", SAN_OTHER_NAME, false},
++    {"rfc822Name", SAN_RFC822_NAME, true},
++    {"dNSName", SAN_DNS_NAME, true},
++    {"x400Address", SAN_X400_ADDRESS, false},
++    {"directoryName", SAN_DIRECTORY_NAME, true},
++    {"ediPartyName", SAN_EDIPART_NAME, false},
++    {"uniformResourceIdentifier", SAN_URI, true},
++    {"iPAddress", SAN_IP_ADDRESS, true},
++    {"registeredID", SAN_REGISTERED_ID, true},
++    /* https://www.ietf.org/rfc/rfc4556.txt section 3.2.2 */
++    {"pkinitSAN", SAN_PKINIT, true},
++    /* https://support.microsoft.com/en-us/help/287547/object-ids-associated-with-microsoft-cryptography */
++    {"ntPrincipalName", SAN_NT, true},
++    /* both previous principal types */
++    {"Principal", SAN_PRINCIPAL, true},
++    {"stringOtherName", SAN_STRING_OTHER_NAME, true},
++    {NULL, SAN_END, false}
++};
++
+ static bool is_dotted_decimal(const char *s, size_t len)
+ {
+     size_t c = 0;
+@@ -145,28 +198,6 @@ static int parse_krb5_get_eku_value(TALLOC_CTX *mem_ctx,
+     size_t e = 0;
+     int eku_list_size;
+ 
+-    struct ext_key_usage {
+-        const char *name;
+-        const char *oid;
+-    } ext_key_usage[] = {
+-        /* RFC 3280 section 4.2.1.13 */
+-        {"serverAuth",      "1.3.6.1.5.5.7.3.1"},
+-        {"clientAuth",      "1.3.6.1.5.5.7.3.2"},
+-        {"codeSigning",     "1.3.6.1.5.5.7.3.3"},
+-        {"emailProtection", "1.3.6.1.5.5.7.3.4"},
+-        {"timeStamping",    "1.3.6.1.5.5.7.3.8"},
+-        {"OCSPSigning",     "1.3.6.1.5.5.7.3.9"},
+-
+-        /* RFC 4556 section 3.2.2 */
+-        {"KPClientAuth",    "1.3.6.1.5.2.3.4"},
+-        {"pkinit",          "1.3.6.1.5.2.3.4"},
+-
+-        /* https://support.microsoft.com/en-us/help/287547/object-ids-associated-with-microsoft-cryptography*/
+-        {"msScLogin",       "1.3.6.1.4.1.311.20.2.2"},
+-
+-        {NULL ,0}
+-    };
+-
+     ret = get_comp_value(mem_ctx, ctx, cur, &comp);
+     if (ret != 0) {
+         CM_DEBUG(ctx, "Failed to parse regexp.");
+@@ -188,11 +219,11 @@ static int parse_krb5_get_eku_value(TALLOC_CTX *mem_ctx,
+     }
+ 
+     for (c = 0; eku_list[c] != NULL; c++) {
+-        for (k = 0; ext_key_usage[k].name != NULL; k++) {
+-CM_DEBUG(ctx, "[%s][%s].", eku_list[c], ext_key_usage[k].name);
+-            if (strcasecmp(eku_list[c], ext_key_usage[k].name) == 0) {
++        for (k = 0; sss_ext_key_usage[k].name != NULL; k++) {
++CM_DEBUG(ctx, "[%s][%s].", eku_list[c], sss_ext_key_usage[k].name);
++            if (strcasecmp(eku_list[c], sss_ext_key_usage[k].name) == 0) {
+                 comp->eku_oid_list[e] = talloc_strdup(comp->eku_oid_list,
+-                                                      ext_key_usage[k].oid);
++                                                      sss_ext_key_usage[k].oid);
+                 if (comp->eku_oid_list[e] == NULL) {
+                     ret = ENOMEM;
+                     goto done;
+@@ -202,7 +233,7 @@ CM_DEBUG(ctx, "[%s][%s].", eku_list[c], ext_key_usage[k].name);
+             }
+         }
+ 
+-        if (ext_key_usage[k].name == NULL) {
++        if (sss_ext_key_usage[k].name == NULL) {
+             /* check for an dotted-decimal OID */
+             if (*(eku_list[c]) != '.') {
+                 o = eku_list[c];
+@@ -252,23 +283,6 @@ static int parse_krb5_get_ku_value(TALLOC_CTX *mem_ctx,
+     size_t c;
+     size_t k;
+ 
+-    struct key_usage {
+-        const char *name;
+-        uint32_t flag;
+-    } key_usage[] = {
+-        {"digitalSignature" , SSS_KU_DIGITAL_SIGNATURE},
+-        {"nonRepudiation"   , SSS_KU_NON_REPUDIATION},
+-        {"keyEncipherment"  , SSS_KU_KEY_ENCIPHERMENT},
+-        {"dataEncipherment" , SSS_KU_DATA_ENCIPHERMENT},
+-        {"keyAgreement"     , SSS_KU_KEY_AGREEMENT},
+-        {"keyCertSign"      , SSS_KU_KEY_CERT_SIGN},
+-        {"cRLSign"          , SSS_KU_CRL_SIGN},
+-        {"encipherOnly"     , SSS_KU_ENCIPHER_ONLY},
+-        {"decipherOnly"     , SSS_KU_DECIPHER_ONLY},
+-        {NULL ,0}
+-    };
+-
+-
+     ret = get_comp_value(mem_ctx, ctx, cur, &comp);
+     if (ret != 0) {
+         CM_DEBUG(ctx, "Failed to get value.");
+@@ -283,14 +297,14 @@ static int parse_krb5_get_ku_value(TALLOC_CTX *mem_ctx,
+     }
+ 
+     for (c = 0; ku_list[c] != NULL; c++) {
+-        for (k = 0; key_usage[k].name != NULL; k++) {
+-            if (strcasecmp(ku_list[c], key_usage[k].name) == 0) {
+-                comp->ku |= key_usage[k].flag;
++        for (k = 0; sss_key_usage[k].name != NULL; k++) {
++            if (strcasecmp(ku_list[c], sss_key_usage[k].name) == 0) {
++                comp->ku |= sss_key_usage[k].flag;
+                 break;
+             }
+         }
+ 
+-        if (key_usage[k].name == NULL) {
++        if (sss_key_usage[k].name == NULL) {
+             /* FIXME: add check for numerical ku */
+             CM_DEBUG(ctx, "No matching key usage found.");
+             ret = EINVAL;
+@@ -342,31 +356,6 @@ done:
+     return ret;
+ }
+ 
+-struct san_name {
+-    const char *name;
+-    enum san_opt san_opt;
+-    bool is_string;
+-} san_names[] = {
+-    /* https://www.ietf.org/rfc/rfc3280.txt section 4.2.1.7 */
+-    {"otherName", SAN_OTHER_NAME, false},
+-    {"rfc822Name", SAN_RFC822_NAME,true},
+-    {"dNSName", SAN_DNS_NAME, true},
+-    {"x400Address", SAN_X400_ADDRESS, false},
+-    {"directoryName", SAN_DIRECTORY_NAME, true},
+-    {"ediPartyName", SAN_EDIPART_NAME, false},
+-    {"uniformResourceIdentifier", SAN_URI, true},
+-    {"iPAddress", SAN_IP_ADDRESS, true},
+-    {"registeredID", SAN_REGISTERED_ID, true},
+-    /* https://www.ietf.org/rfc/rfc4556.txt section 3.2.2 */
+-    {"pkinitSAN", SAN_PKINIT, true},
+-    /* https://support.microsoft.com/en-us/help/287547/object-ids-associated-with-microsoft-cryptography */
+-    {"ntPrincipalName", SAN_NT, true},
+-    /* both previous principal types */
+-    {"Principal", SAN_PRINCIPAL, true},
+-    {"stringOtherName", SAN_STRING_OTHER_NAME, true},
+-    {NULL, SAN_END, false}
+-};
+-
+ static int parse_krb5_get_san_option(TALLOC_CTX *mem_ctx,
+                                      struct sss_certmap_ctx *ctx,
+                                      const char **cur,
+@@ -388,12 +377,12 @@ static int parse_krb5_get_san_option(TALLOC_CTX *mem_ctx,
+     if (len == 0) {
+         c= SAN_PRINCIPAL;
+     } else {
+-        for (c = 0; san_names[c].name != NULL; c++) {
+-            if (strncasecmp(*cur, san_names[c].name, len) == 0) {
++        for (c = 0; sss_san_names[c].name != NULL; c++) {
++            if (strncasecmp(*cur, sss_san_names[c].name, len) == 0) {
+                 break;
+             }
+         }
+-        if (san_names[c].name == NULL) {
++        if (sss_san_names[c].name == NULL) {
+             if (is_dotted_decimal(*cur, len)) {
+                 c = SAN_STRING_OTHER_NAME;
+                 *str_other_name_oid = talloc_strndup(mem_ctx, *cur, len);
+@@ -408,7 +397,7 @@ static int parse_krb5_get_san_option(TALLOC_CTX *mem_ctx,
+         }
+     }
+ 
+-    *option = san_names[c].san_opt;
++    *option = sss_san_names[c].san_opt;
+     *cur = end + 1;
+ 
+     return 0;
+@@ -432,7 +421,7 @@ static int parse_krb5_get_san_value(TALLOC_CTX *mem_ctx,
+         }
+     }
+ 
+-    if (san_names[san_opt].is_string) {
++    if (sss_san_names[san_opt].is_string) {
+         ret = parse_krb5_get_component_value(mem_ctx, ctx, cur, &comp);
+         if (ret != 0) {
+             goto done;
+-- 
+2.25.1
+
diff --git a/recipes-security/sssd/files/CVE-2022-4254-2.patch b/recipes-security/sssd/files/CVE-2022-4254-2.patch
new file mode 100644
index 0000000..018b95c
--- /dev/null
+++ b/recipes-security/sssd/files/CVE-2022-4254-2.patch
@@ -0,0 +1,655 @@
+From a2b9a84460429181f2a4fa7e2bb5ab49fd561274 Mon Sep 17 00:00:00 2001
+From: Sumit Bose <sbose@redhat.com>
+Date: Mon, 9 Dec 2019 11:31:14 +0100
+Subject: [PATCH] certmap: sanitize LDAP search filter
+
+The sss_certmap_get_search_filter() will now sanitize the values read
+from the certificates before adding them to a search filter. To be able
+to get the plain values as well sss_certmap_expand_mapping_rule() is
+added.
+
+Resolves:
+https://github.com/SSSD/sssd/issues/5135
+
+Reviewed-by: Alexey Tikhonov <atikhono@redhat.com>
+
+CVE: CVE-2022-4254
+Upstream-Status: Backport [https://github.com/SSSD/sssd/commit/a2b9a84460429181f2a4fa7e2bb5ab49fd561274]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ Makefile.am                         |  2 +-
+ src/lib/certmap/sss_certmap.c       | 42 ++++++++++--
+ src/lib/certmap/sss_certmap.exports |  5 ++
+ src/lib/certmap/sss_certmap.h       | 35 ++++++++--
+ src/responder/pam/pamsrv_p11.c      |  5 +-
+ src/tests/cmocka/test_certmap.c     | 98 +++++++++++++++++++++++++++-
+ src/util/util.c                     | 94 ---------------------------
+ src/util/util_ext.c                 | 99 +++++++++++++++++++++++++++++
+ 8 files changed, 272 insertions(+), 108 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 29cd93c..dd6add2 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -1835,7 +1835,7 @@ libsss_certmap_la_LIBADD = \
+     $(NULL)
+ libsss_certmap_la_LDFLAGS = \
+     -Wl,--version-script,$(srcdir)/src/lib/certmap/sss_certmap.exports \
+-    -version-info 1:0:1
++    -version-info 2:0:2
+ 
+ if HAVE_NSS
+ libsss_certmap_la_SOURCES += \
+diff --git a/src/lib/certmap/sss_certmap.c b/src/lib/certmap/sss_certmap.c
+index c60ac24..d7bc992 100644
+--- a/src/lib/certmap/sss_certmap.c
++++ b/src/lib/certmap/sss_certmap.c
+@@ -441,10 +441,12 @@ static int expand_san(struct sss_certmap_ctx *ctx,
+ static int expand_template(struct sss_certmap_ctx *ctx,
+                            struct parsed_template *parsed_template,
+                            struct sss_cert_content *cert_content,
++                           bool sanitize,
+                            char **expanded)
+ {
+     int ret;
+     char *exp = NULL;
++    char *exp_sanitized = NULL;
+ 
+     if (strcmp("issuer_dn", parsed_template->name) == 0) {
+         ret = rdn_list_2_dn_str(ctx, parsed_template->conversion,
+@@ -455,6 +457,8 @@ static int expand_template(struct sss_certmap_ctx *ctx,
+     } else if (strncmp("subject_", parsed_template->name, 8) == 0) {
+         ret = expand_san(ctx, parsed_template, cert_content->san_list, &exp);
+     } else if (strcmp("cert", parsed_template->name) == 0) {
++        /* cert blob is already sanitized */
++        sanitize = false;
+         ret = expand_cert(ctx, parsed_template, cert_content, &exp);
+     } else {
+         CM_DEBUG(ctx, "Unsupported template name.");
+@@ -471,6 +475,16 @@ static int expand_template(struct sss_certmap_ctx *ctx,
+         goto done;
+     }
+ 
++    if (sanitize) {
++        ret = sss_filter_sanitize(ctx, exp, &exp_sanitized);
++        if (ret != EOK) {
++            CM_DEBUG(ctx, "Failed to sanitize expanded template.");
++            goto done;
++        }
++        talloc_free(exp);
++        exp = exp_sanitized;
++    }
++
+     ret = 0;
+ 
+ done:
+@@ -485,7 +499,7 @@ done:
+ 
+ static int get_filter(struct sss_certmap_ctx *ctx,
+                       struct ldap_mapping_rule *parsed_mapping_rule,
+-                      struct sss_cert_content *cert_content,
++                      struct sss_cert_content *cert_content, bool sanitize,
+                       char **filter)
+ {
+     struct ldap_mapping_rule_comp *comp;
+@@ -503,7 +517,7 @@ static int get_filter(struct sss_certmap_ctx *ctx,
+             result = talloc_strdup_append(result, comp->val);
+         } else if (comp->type == comp_template) {
+             ret = expand_template(ctx, comp->parsed_template, cert_content,
+-                                  &expanded);
++                                  sanitize, &expanded);
+             if (ret != 0) {
+                 CM_DEBUG(ctx, "Failed to expanded template.");
+                 goto done;
+@@ -791,8 +805,9 @@ done:
+     return ret;
+ }
+ 
+-int sss_certmap_get_search_filter(struct sss_certmap_ctx *ctx,
++static int expand_mapping_rule_ex(struct sss_certmap_ctx *ctx,
+                                   const uint8_t *der_cert, size_t der_size,
++                                  bool sanitize,
+                                   char **_filter, char ***_domains)
+ {
+     int ret;
+@@ -819,7 +834,8 @@ int sss_certmap_get_search_filter(struct sss_certmap_ctx *ctx,
+             return EINVAL;
+         }
+ 
+-        ret = get_filter(ctx, ctx->default_mapping_rule, cert_content, &filter);
++        ret = get_filter(ctx, ctx->default_mapping_rule, cert_content, sanitize,
++                         &filter);
+         goto done;
+     }
+ 
+@@ -829,7 +845,7 @@ int sss_certmap_get_search_filter(struct sss_certmap_ctx *ctx,
+             if (ret == 0) {
+                 /* match */
+                 ret = get_filter(ctx, r->parsed_mapping_rule, cert_content,
+-                                 &filter);
++                                 sanitize, &filter);
+                 if (ret != 0) {
+                     CM_DEBUG(ctx, "Failed to get filter");
+                     goto done;
+@@ -873,6 +889,22 @@ done:
+     return ret;
+ }
+ 
++int sss_certmap_get_search_filter(struct sss_certmap_ctx *ctx,
++                                  const uint8_t *der_cert, size_t der_size,
++                                  char **_filter, char ***_domains)
++{
++    return expand_mapping_rule_ex(ctx, der_cert, der_size, true,
++                                  _filter, _domains);
++}
++
++int sss_certmap_expand_mapping_rule(struct sss_certmap_ctx *ctx,
++                                    const uint8_t *der_cert, size_t der_size,
++                                    char **_expanded, char ***_domains)
++{
++    return expand_mapping_rule_ex(ctx, der_cert, der_size, false,
++                                  _expanded, _domains);
++}
++
+ int sss_certmap_init(TALLOC_CTX *mem_ctx,
+                      sss_certmap_ext_debug *debug, void *debug_priv,
+                      struct sss_certmap_ctx **ctx)
+diff --git a/src/lib/certmap/sss_certmap.exports b/src/lib/certmap/sss_certmap.exports
+index a9e48d6..7d76677 100644
+--- a/src/lib/certmap/sss_certmap.exports
++++ b/src/lib/certmap/sss_certmap.exports
+@@ -16,3 +16,8 @@ SSS_CERTMAP_0.1 {
+     global:
+         sss_certmap_display_cert_content;
+ } SSS_CERTMAP_0.0;
++
++SSS_CERTMAP_0.2 {
++    global:
++        sss_certmap_expand_mapping_rule;
++} SSS_CERTMAP_0.1;
+diff --git a/src/lib/certmap/sss_certmap.h b/src/lib/certmap/sss_certmap.h
+index 7da2d1c..058d4f9 100644
+--- a/src/lib/certmap/sss_certmap.h
++++ b/src/lib/certmap/sss_certmap.h
+@@ -103,7 +103,7 @@ int sss_certmap_add_rule(struct sss_certmap_ctx *ctx,
+  *
+  * @param[in] ctx      certmap context previously initialized with
+  *                     @ref sss_certmap_init
+- * @param[in] der_cert binary blog with the DER encoded certificate
++ * @param[in] der_cert binary blob with the DER encoded certificate
+  * @param[in] der_size size of the certificate blob
+  *
+  * @return
+@@ -119,10 +119,11 @@ int sss_certmap_match_cert(struct sss_certmap_ctx *ctx,
+  *
+  * @param[in] ctx      certmap context previously initialized with
+  *                     @ref sss_certmap_init
+- * @param[in] der_cert binary blog with the DER encoded certificate
++ * @param[in] der_cert binary blob with the DER encoded certificate
+  * @param[in] der_size size of the certificate blob
+- * @param[out] filter  LDAP filter string, caller should free the data by
+- *                     calling sss_certmap_free_filter_and_domains
++ * @param[out] filter  LDAP filter string, expanded templates are sanitized,
++ *                     caller should free the data by calling
++ *                     sss_certmap_free_filter_and_domains
+  * @param[out] domains NULL-terminated array of strings with the domains the
+  *                     rule applies, caller should free the data by calling
+  *                     sss_certmap_free_filter_and_domains
+@@ -136,8 +137,32 @@ int sss_certmap_get_search_filter(struct sss_certmap_ctx *ctx,
+                                   const uint8_t *der_cert, size_t der_size,
+                                   char **filter, char ***domains);
+ 
++/**
++ * @brief Expand the mapping rule by replacing the templates
++ *
++ * @param[in] ctx        certmap context previously initialized with
++ *                       @ref sss_certmap_init
++ * @param[in] der_cert   binary blob with the DER encoded certificate
++ * @param[in] der_size   size of the certificate blob
++ * @param[out] expanded  expanded mapping rule, templates are filled in
++ *                       verbatim in contrast to sss_certmap_get_search_filter,
++ *                       caller should free the data by
++ *                       calling sss_certmap_free_filter_and_domains
++ * @param[out] domains   NULL-terminated array of strings with the domains the
++ *                       rule applies, caller should free the data by calling
++ *                       sss_certmap_free_filter_and_domains
++ *
++ * @return
++ *  - 0:      certificate matches a rule
++ *  - ENOENT: certificate does not match
++ *  - EINVAL: internal error
++ */
++int sss_certmap_expand_mapping_rule(struct sss_certmap_ctx *ctx,
++                                    const uint8_t *der_cert, size_t der_size,
++                                    char **_expanded, char ***_domains);
+ /**
+  * @brief Free data returned by @ref sss_certmap_get_search_filter
++ *        and @ref sss_certmap_expand_mapping_rule
+  *
+  * @param[in] filter  LDAP filter strings returned by
+  *                    sss_certmap_get_search_filter
+@@ -150,7 +175,7 @@ void sss_certmap_free_filter_and_domains(char *filter, char **domains);
+  * @brief Get a string with the content of the certificate used by the library
+  *
+  * @param[in]  mem_ctx    Talloc memory context, may be NULL
+- * @param[in]  der_cert   binary blog with the DER encoded certificate
++ * @param[in]  der_cert   binary blob with the DER encoded certificate
+  * @param[in]  der_size   size of the certificate blob
+  * @param[out] desc       Multiline string showing the certificate content
+  *                        which is used by libsss_certmap
+diff --git a/src/responder/pam/pamsrv_p11.c b/src/responder/pam/pamsrv_p11.c
+index c7e57be..b9f6787 100644
+--- a/src/responder/pam/pamsrv_p11.c
++++ b/src/responder/pam/pamsrv_p11.c
+@@ -1023,9 +1023,10 @@ static char *get_cert_prompt(TALLOC_CTX *mem_ctx,
+         goto done;
+     }
+ 
+-    ret = sss_certmap_get_search_filter(ctx, der, der_size, &filter, &domains);
++    ret = sss_certmap_expand_mapping_rule(ctx, der, der_size,
++                                          &filter, &domains);
+     if (ret != 0) {
+-        DEBUG(SSSDBG_OP_FAILURE, "sss_certmap_get_search_filter failed.\n");
++        DEBUG(SSSDBG_OP_FAILURE, "sss_certmap_expand_mapping_rule failed.\n");
+         goto done;
+     }
+ 
+diff --git a/src/tests/cmocka/test_certmap.c b/src/tests/cmocka/test_certmap.c
+index 3091e1a..abf1dba 100644
+--- a/src/tests/cmocka/test_certmap.c
++++ b/src/tests/cmocka/test_certmap.c
+@@ -1387,6 +1387,15 @@ static void test_sss_certmap_get_search_filter(void **state)
+                                         &filter, &domains);
+     assert_int_equal(ret, 0);
+     assert_non_null(filter);
++    assert_string_equal(filter, "rule100=<I>CN=Certificate\\20Authority,O=IPA.DEVEL"
++                                "<S>CN=ipa-devel.ipa.devel,O=IPA.DEVEL");
++    assert_null(domains);
++
++    ret = sss_certmap_expand_mapping_rule(ctx, discard_const(test_cert_der),
++                                          sizeof(test_cert_der),
++                                          &filter, &domains);
++    assert_int_equal(ret, 0);
++    assert_non_null(filter);
+     assert_string_equal(filter, "rule100=<I>CN=Certificate Authority,O=IPA.DEVEL"
+                                 "<S>CN=ipa-devel.ipa.devel,O=IPA.DEVEL");
+     assert_null(domains);
+@@ -1401,6 +1410,17 @@ static void test_sss_certmap_get_search_filter(void **state)
+                                         &filter, &domains);
+     assert_int_equal(ret, 0);
+     assert_non_null(filter);
++    assert_string_equal(filter, "rule99=<I>CN=Certificate\\20Authority,O=IPA.DEVEL"
++                                "<S>CN=ipa-devel.ipa.devel,O=IPA.DEVEL");
++    assert_non_null(domains);
++    assert_string_equal(domains[0], "test.dom");
++    assert_null(domains[1]);
++
++    ret = sss_certmap_expand_mapping_rule(ctx, discard_const(test_cert_der),
++                                          sizeof(test_cert_der),
++                                          &filter, &domains);
++    assert_int_equal(ret, 0);
++    assert_non_null(filter);
+     assert_string_equal(filter, "rule99=<I>CN=Certificate Authority,O=IPA.DEVEL"
+                                 "<S>CN=ipa-devel.ipa.devel,O=IPA.DEVEL");
+     assert_non_null(domains);
+@@ -1422,6 +1442,16 @@ static void test_sss_certmap_get_search_filter(void **state)
+     assert_string_equal(domains[0], "test.dom");
+     assert_null(domains[1]);
+ 
++    ret = sss_certmap_expand_mapping_rule(ctx, discard_const(test_cert_der),
++                                          sizeof(test_cert_der),
++                                          &filter, &domains);
++    assert_int_equal(ret, 0);
++    assert_non_null(filter);
++    assert_string_equal(filter, "rule98=userCertificate;binary=" TEST_CERT_BIN);
++    assert_non_null(domains);
++    assert_string_equal(domains[0], "test.dom");
++    assert_null(domains[1]);
++
+     ret = sss_certmap_add_rule(ctx, 97,
+                             "KRB5:<ISSUER>CN=Certificate Authority,O=IPA.DEVEL",
+                             "LDAP:rule97=<I>{issuer_dn!nss_x500}<S>{subject_dn}",
+@@ -1432,6 +1462,17 @@ static void test_sss_certmap_get_search_filter(void **state)
+                                         &filter, &domains);
+     assert_int_equal(ret, 0);
+     assert_non_null(filter);
++    assert_string_equal(filter, "rule97=<I>O=IPA.DEVEL,CN=Certificate\\20Authority"
++                                "<S>CN=ipa-devel.ipa.devel,O=IPA.DEVEL");
++    assert_non_null(domains);
++    assert_string_equal(domains[0], "test.dom");
++    assert_null(domains[1]);
++
++    ret = sss_certmap_expand_mapping_rule(ctx, discard_const(test_cert_der),
++                                          sizeof(test_cert_der),
++                                          &filter, &domains);
++    assert_int_equal(ret, 0);
++    assert_non_null(filter);
+     assert_string_equal(filter, "rule97=<I>O=IPA.DEVEL,CN=Certificate Authority"
+                                 "<S>CN=ipa-devel.ipa.devel,O=IPA.DEVEL");
+     assert_non_null(domains);
+@@ -1448,6 +1489,17 @@ static void test_sss_certmap_get_search_filter(void **state)
+                                         &filter, &domains);
+     assert_int_equal(ret, 0);
+     assert_non_null(filter);
++    assert_string_equal(filter, "rule96=<I>O=IPA.DEVEL,CN=Certificate\\20Authority"
++                                "<S>O=IPA.DEVEL,CN=ipa-devel.ipa.devel");
++    assert_non_null(domains);
++    assert_string_equal(domains[0], "test.dom");
++    assert_null(domains[1]);
++
++    ret = sss_certmap_expand_mapping_rule(ctx, discard_const(test_cert_der),
++                                          sizeof(test_cert_der),
++                                          &filter, &domains);
++    assert_int_equal(ret, 0);
++    assert_non_null(filter);
+     assert_string_equal(filter, "rule96=<I>O=IPA.DEVEL,CN=Certificate Authority"
+                                 "<S>O=IPA.DEVEL,CN=ipa-devel.ipa.devel");
+     assert_non_null(domains);
+@@ -1466,6 +1518,14 @@ static void test_sss_certmap_get_search_filter(void **state)
+     assert_string_equal(filter, "(userCertificate;binary=" TEST_CERT_BIN ")");
+     assert_null(domains);
+ 
++    ret = sss_certmap_expand_mapping_rule(ctx, discard_const(test_cert_der),
++                                          sizeof(test_cert_der),
++                                          &filter, &domains);
++    assert_int_equal(ret, 0);
++    assert_non_null(filter);
++    assert_string_equal(filter, "(userCertificate;binary=" TEST_CERT_BIN ")");
++    assert_null(domains);
++
+     ret = sss_certmap_add_rule(ctx, 94,
+                       "KRB5:<ISSUER>CN=Certificate Authority,O=IPA.DEVEL",
+                       "LDAP:rule94=<I>{issuer_dn!ad_x500}<S>{subject_dn!ad_x500}",
+@@ -1476,12 +1536,22 @@ static void test_sss_certmap_get_search_filter(void **state)
+                                         &filter, &domains);
+     assert_int_equal(ret, 0);
+     assert_non_null(filter);
+-    assert_string_equal(filter, "rule94=<I>O=IPA.DEVEL,CN=Certificate Authority"
++    assert_string_equal(filter, "rule94=<I>O=IPA.DEVEL,CN=Certificate\\20Authority"
+                                 "<S>O=IPA.DEVEL,CN=ipa-devel.ipa.devel");
+     assert_non_null(domains);
+     assert_string_equal(domains[0], "test.dom");
+     assert_null(domains[1]);
+ 
++    ret = sss_certmap_expand_mapping_rule(ctx, discard_const(test_cert_der),
++                                          sizeof(test_cert_der),
++                                          &filter, &domains);
++    assert_int_equal(ret, 0);
++    assert_non_null(filter);
++    assert_string_equal(filter, "rule94=<I>O=IPA.DEVEL,CN=Certificate Authority"
++                                "<S>O=IPA.DEVEL,CN=ipa-devel.ipa.devel");
++    assert_non_null(domains);
++    assert_string_equal(domains[0], "test.dom");
++    assert_null(domains[1]);
+ 
+     ret = sss_certmap_add_rule(ctx, 89, NULL,
+                             "(rule89={subject_nt_principal})",
+@@ -1495,6 +1565,14 @@ static void test_sss_certmap_get_search_filter(void **state)
+     assert_string_equal(filter, "(rule89=tu1@ad.devel)");
+     assert_null(domains);
+ 
++    ret = sss_certmap_expand_mapping_rule(ctx, discard_const(test_cert2_der),
++                                          sizeof(test_cert2_der),
++                                          &filter, &domains);
++    assert_int_equal(ret, 0);
++    assert_non_null(filter);
++    assert_string_equal(filter, "(rule89=tu1@ad.devel)");
++    assert_null(domains);
++
+     ret = sss_certmap_add_rule(ctx, 88, NULL,
+                             "(rule88={subject_nt_principal.short_name})",
+                             NULL);
+@@ -1516,6 +1594,15 @@ static void test_sss_certmap_get_search_filter(void **state)
+                                         &filter, &domains);
+     assert_int_equal(ret, 0);
+     assert_non_null(filter);
++    assert_string_equal(filter, "rule87=<I>DC=devel,DC=ad,CN=ad-AD-SERVER-CA"
++                  "<S>DC=devel,DC=ad,CN=Users,CN=t\\20u,E=test.user@email.domain");
++    assert_null(domains);
++
++    ret = sss_certmap_expand_mapping_rule(ctx, discard_const(test_cert2_der),
++                                          sizeof(test_cert2_der),
++                                          &filter, &domains);
++    assert_int_equal(ret, 0);
++    assert_non_null(filter);
+     assert_string_equal(filter, "rule87=<I>DC=devel,DC=ad,CN=ad-AD-SERVER-CA"
+                   "<S>DC=devel,DC=ad,CN=Users,CN=t u,E=test.user@email.domain");
+     assert_null(domains);
+@@ -1529,6 +1616,15 @@ static void test_sss_certmap_get_search_filter(void **state)
+                                         &filter, &domains);
+     assert_int_equal(ret, 0);
+     assert_non_null(filter);
++    assert_string_equal(filter, "rule86=<I>DC=devel,DC=ad,CN=ad-AD-SERVER-CA"
++                  "<S>DC=devel,DC=ad,CN=Users,CN=t\\20u,E=test.user@email.domain");
++    assert_null(domains);
++
++    ret = sss_certmap_expand_mapping_rule(ctx, discard_const(test_cert2_der),
++                                          sizeof(test_cert2_der),
++                                          &filter, &domains);
++    assert_int_equal(ret, 0);
++    assert_non_null(filter);
+     assert_string_equal(filter, "rule86=<I>DC=devel,DC=ad,CN=ad-AD-SERVER-CA"
+                   "<S>DC=devel,DC=ad,CN=Users,CN=t u,E=test.user@email.domain");
+     assert_null(domains);
+diff --git a/src/util/util.c b/src/util/util.c
+index e3efa7f..0653638 100644
+--- a/src/util/util.c
++++ b/src/util/util.c
+@@ -436,100 +436,6 @@ errno_t sss_hash_create(TALLOC_CTX *mem_ctx, unsigned long count,
+     return sss_hash_create_ex(mem_ctx, count, tbl, 0, 0, 0, 0, NULL, NULL);
+ }
+ 
+-errno_t sss_filter_sanitize_ex(TALLOC_CTX *mem_ctx,
+-                               const char *input,
+-                               char **sanitized,
+-                               const char *ignore)
+-{
+-    char *output;
+-    size_t i = 0;
+-    size_t j = 0;
+-    char *allowed;
+-
+-    /* Assume the worst-case. We'll resize it later, once */
+-    output = talloc_array(mem_ctx, char, strlen(input) * 3 + 1);
+-    if (!output) {
+-        return ENOMEM;
+-    }
+-
+-    while (input[i]) {
+-        /* Even though this character might have a special meaning, if it's
+-         * expliticly allowed, just copy it and move on
+-         */
+-        if (ignore == NULL) {
+-            allowed = NULL;
+-        } else {
+-            allowed = strchr(ignore, input[i]);
+-        }
+-        if (allowed) {
+-            output[j++] = input[i++];
+-            continue;
+-        }
+-
+-        switch(input[i]) {
+-        case '\t':
+-            output[j++] = '\\';
+-            output[j++] = '0';
+-            output[j++] = '9';
+-            break;
+-        case ' ':
+-            output[j++] = '\\';
+-            output[j++] = '2';
+-            output[j++] = '0';
+-            break;
+-        case '*':
+-            output[j++] = '\\';
+-            output[j++] = '2';
+-            output[j++] = 'a';
+-            break;
+-        case '(':
+-            output[j++] = '\\';
+-            output[j++] = '2';
+-            output[j++] = '8';
+-            break;
+-        case ')':
+-            output[j++] = '\\';
+-            output[j++] = '2';
+-            output[j++] = '9';
+-            break;
+-        case '\\':
+-            output[j++] = '\\';
+-            output[j++] = '5';
+-            output[j++] = 'c';
+-            break;
+-        case '\r':
+-            output[j++] = '\\';
+-            output[j++] = '0';
+-            output[j++] = 'd';
+-            break;
+-        case '\n':
+-            output[j++] = '\\';
+-            output[j++] = '0';
+-            output[j++] = 'a';
+-            break;
+-        default:
+-            output[j++] = input[i];
+-        }
+-
+-        i++;
+-    }
+-    output[j] = '\0';
+-    *sanitized = talloc_realloc(mem_ctx, output, char, j+1);
+-    if (!*sanitized) {
+-        talloc_free(output);
+-        return ENOMEM;
+-    }
+-
+-    return EOK;
+-}
+-
+-errno_t sss_filter_sanitize(TALLOC_CTX *mem_ctx,
+-                            const char *input,
+-                            char **sanitized)
+-{
+-    return sss_filter_sanitize_ex(mem_ctx, input, sanitized, NULL);
+-}
+-
+ char *
+ sss_escape_ip_address(TALLOC_CTX *mem_ctx, int family, const char *addr)
+ {
+diff --git a/src/util/util_ext.c b/src/util/util_ext.c
+index 04dc02a..a89b60f 100644
+--- a/src/util/util_ext.c
++++ b/src/util/util_ext.c
+@@ -29,6 +29,11 @@
+ 
+ #define EOK 0
+ 
++#ifndef HAVE_ERRNO_T
++#define HAVE_ERRNO_T
++typedef int errno_t;
++#endif
++
+ int split_on_separator(TALLOC_CTX *mem_ctx, const char *str,
+                        const char sep, bool trim, bool skip_empty,
+                        char ***_list, int *size)
+@@ -141,3 +146,97 @@ bool string_in_list(const char *string, char **list, bool case_sensitive)
+ 
+     return false;
+ }
++
++errno_t sss_filter_sanitize_ex(TALLOC_CTX *mem_ctx,
++                               const char *input,
++                               char **sanitized,
++                               const char *ignore)
++{
++    char *output;
++    size_t i = 0;
++    size_t j = 0;
++    char *allowed;
++
++    /* Assume the worst-case. We'll resize it later, once */
++    output = talloc_array(mem_ctx, char, strlen(input) * 3 + 1);
++    if (!output) {
++        return ENOMEM;
++    }
++
++    while (input[i]) {
++        /* Even though this character might have a special meaning, if it's
++         * explicitly allowed, just copy it and move on
++         */
++        if (ignore == NULL) {
++            allowed = NULL;
++        } else {
++            allowed = strchr(ignore, input[i]);
++        }
++        if (allowed) {
++            output[j++] = input[i++];
++            continue;
++        }
++
++        switch(input[i]) {
++        case '\t':
++            output[j++] = '\\';
++            output[j++] = '0';
++            output[j++] = '9';
++            break;
++        case ' ':
++            output[j++] = '\\';
++            output[j++] = '2';
++            output[j++] = '0';
++            break;
++        case '*':
++            output[j++] = '\\';
++            output[j++] = '2';
++            output[j++] = 'a';
++            break;
++        case '(':
++            output[j++] = '\\';
++            output[j++] = '2';
++            output[j++] = '8';
++            break;
++        case ')':
++            output[j++] = '\\';
++            output[j++] = '2';
++            output[j++] = '9';
++            break;
++        case '\\':
++            output[j++] = '\\';
++            output[j++] = '5';
++            output[j++] = 'c';
++            break;
++        case '\r':
++            output[j++] = '\\';
++            output[j++] = '0';
++            output[j++] = 'd';
++            break;
++        case '\n':
++            output[j++] = '\\';
++            output[j++] = '0';
++            output[j++] = 'a';
++            break;
++        default:
++            output[j++] = input[i];
++        }
++
++        i++;
++    }
++    output[j] = '\0';
++    *sanitized = talloc_realloc(mem_ctx, output, char, j+1);
++    if (!*sanitized) {
++        talloc_free(output);
++        return ENOMEM;
++    }
++
++    return EOK;
++}
++
++errno_t sss_filter_sanitize(TALLOC_CTX *mem_ctx,
++                            const char *input,
++                            char **sanitized)
++{
++    return sss_filter_sanitize_ex(mem_ctx, input, sanitized, NULL);
++}
+-- 
+2.25.1
+
diff --git a/recipes-security/sssd/sssd_1.16.4.bb b/recipes-security/sssd/sssd_1.16.4.bb
index 186c9e0..e512dbf 100644
--- a/recipes-security/sssd/sssd_1.16.4.bb
+++ b/recipes-security/sssd/sssd_1.16.4.bb
@@ -18,6 +18,8 @@ SRC_URI = "https://releases.pagure.org/SSSD/${BPN}/${BP}.tar.gz \
            file://volatiles.99_sssd \
            file://fix-ldblibdir.patch \
            file://0001-build-Don-t-use-AC_CHECK_FILE-when-building-manpages.patch \
+           file://CVE-2022-4254-1.patch \
+           file://CVE-2022-4254-2.patch \
            "
 
 SRC_URI[md5sum] = "757bbb6f15409d8d075f4f06cb678d50"
-- 
2.25.1


