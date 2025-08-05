Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 983D7C87FD1
	for <webhook@archiver.kernel.org>; Tue,  5 Aug 2025 05:19:33 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.14848.1754371169615704687
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Aug 2025 22:19:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=QVVN2H/X;
 spf=pass (domain: mvista.com, ip: 209.85.210.178, mailfrom: hprajapati@mvista.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-76bf3dafaa5so2009413b3a.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 04 Aug 2025 22:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1754371169; x=1754975969; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G6Fr5mb1tNLn/glAyyVzL5awN8O4zLULWRXVYiFESlA=;
        b=QVVN2H/XS6Dkqfd8YYrxkGVFdjUw5ecFqYljVWGBhgWBncebd6j1Wp5FRHkLe0AJpa
         hYMxHLYaTRA2mbnJ1/A0QyC1NQJr04UKUPEwlExzW9GxVMCNINS/SRBJf232ThZXkLB3
         9dXh3yk1xOuL3331ADuy7hINpUBlAJmi87caI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754371169; x=1754975969;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G6Fr5mb1tNLn/glAyyVzL5awN8O4zLULWRXVYiFESlA=;
        b=VZbZ5Cbm3x96UVlFMwa8Qr6Sd1UceWMWTFnlUVau5yvmw67XJUDHaAIykA5aHY2eUY
         +NXI4SkQB7HN9l9GVzYbjMCnZIKxWp5AMbQ8f3samnVchuVHOGsbR3r8h7p+xjO7O/L7
         V8yX/5il7uPiOQFA9N0ZEDDI869+UfOXRjvulHf/sjGew105oyAP1oXki9diha32lmmA
         xfehjUhZ4Bggr+kYlySpD5mrsilp9j/TeHGFdS9CKrGvvBX4cSdN5emFBeU8dU0c6fL8
         OoP9zIDlmMZ+05KwPj0+WZBSVShypRjdSuZjLHE8SAvQm5bRNiK19Di4TYCpUZQQ4Utb
         J95Q==
X-Gm-Message-State: AOJu0YypSgoBbw69hfzCaceYnIJ8Tmy54lML6ofazMRkd5PWeX5DisCX
	3f+wJHDE2c8PsNZh7pAigKlxLmgdKxrw/0g+ykomKHtpzf2UI9YH2aLz85oK2nc1n0ygzFY0GEq
	ucdre
X-Gm-Gg: ASbGncvH5RPVm+U1O8WCh1qOeA5ckViU8uS5TtqiO74DFDb9EUUeC3SjXKr1/SJHgr6
	nLYf47KJF+q6DWG1JOhq86j4qYWavawB2RFo6gRV35sn+KXtmVaNBFIbbotERNiIgIRxdbN5x3B
	FMnrNhD5OTeMW0RlKRRy7XKnTuPJpZ5mneXKI6+GM88r6b6HgeOtFesXOz4LTQD+ivRgNgQl1H5
	z3YrqZ+7HQgHirONK3tWdSG/V45TYaSCL2rOZPjBVWle9EWyQAqr2r4my/RpiLBnlRLNInybK8K
	wSpemnQz1xnNbweIJzOJrgjh0y1iJ0Q/afJ5QGkQN6S1noITsq2yOYtZ3rcdR8m3nEUbTnjTkhd
	MC8XWUkWR/pHg6CduPp3Ns17p1kIuyDNZrl6VJ8RXHez+TkMnue3pY0wmRA==
X-Google-Smtp-Source: AGHT+IEdj5UHQp7JOxVTjDnAT4/B9yoLoWfOGdDRnrTuOtnJ+sKDBPXo88IdNoIXNFDHxGLMo7cQ3Q==
X-Received: by 2002:a05:6a20:7347:b0:225:ba92:447d with SMTP id adf61e73a8af0-2401ea18e5dmr3167391637.9.1754371168451;
        Mon, 04 Aug 2025 22:19:28 -0700 (PDT)
Received: from MVIN00016.mvista.com ([103.250.136.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bccfbd02csm11694865b3a.62.2025.08.04.22.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 22:19:28 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-oe][kirkstone][PATCH] krb5: fix CVE-2025-3576
Date: Tue,  5 Aug 2025 10:49:01 +0530
Message-ID: <20250805051901.68269-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Aug 2025 05:19:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118874

Upstream-Status: Backport from https://github.com/krb5/krb5/commit/39fecf78796bbdde1e3d4828b86f64f05d9e4c77 && https://github.com/krb5/krb5/commit/1b57a4d134bbd0e7c52d5885a92eccc815726463 && https://github.com/krb5/krb5/commit/484a6e7712f9b66e782b2520f07b0883889e116f

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../krb5/krb5/CVE-2025-3576-01.patch          | 257 ++++++++++++++++++
 .../krb5/krb5/CVE-2025-3576-02.patch          | 188 +++++++++++++
 .../krb5/krb5/CVE-2025-3576-pre.patch         |  58 ++++
 .../recipes-connectivity/krb5/krb5_1.17.2.bb  |   3 +
 4 files changed, 506 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/krb5/krb5/CVE-2025-3576-01.patch
 create mode 100644 meta-oe/recipes-connectivity/krb5/krb5/CVE-2025-3576-02.patch
 create mode 100644 meta-oe/recipes-connectivity/krb5/krb5/CVE-2025-3576-pre.patch

diff --git a/meta-oe/recipes-connectivity/krb5/krb5/CVE-2025-3576-01.patch b/meta-oe/recipes-connectivity/krb5/krb5/CVE-2025-3576-01.patch
new file mode 100644
index 0000000000..b8186cfa04
--- /dev/null
+++ b/meta-oe/recipes-connectivity/krb5/krb5/CVE-2025-3576-01.patch
@@ -0,0 +1,257 @@
+From: Greg Hudson <ghudson@mit.edu>
+Date: Fri, 16 Dec 2022 18:31:07 -0500
+Subject: [PATCH] Don't issue session keys with deprecated enctypes
+
+A paper by Tom Tervoort noted that rc4-hmac pre-hashes the input for
+its checksum and GSS operations before applying HMAC, and is therefore
+potentially vulnerable to hash collision attacks if a protocol
+contains a restricted signing oracle.
+
+In light of these potential attacks, begin the functional deprecation
+of DES3 and RC4 by disallowing their use as session key enctypes by
+default.  Add the variables allow_des3 and allow_rc4 in case
+negotiability of these enctypes for session keys needs to be turned
+back on, with the expectation that in future releases the enctypes
+will be more comprehensively deprecated.
+
+ticket: 9081
+
+CVE: CVE-2025-3576
+Upstream-Status: Backport [https://github.com/krb5/krb5/commit/1b57a4d134bbd0e7c52d5885a92eccc815726463]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/include/k5-int.h               |  4 ++++
+ src/kdc/kdc_util.c                 | 10 +++++++++
+ src/lib/krb5/krb/get_in_tkt.c      | 33 ++++++++++++++++++++----------
+ src/lib/krb5/krb/init_ctx.c        | 10 +++++++++
+ src/tests/gssapi/t_enctypes.py     |  2 +-
+ src/tests/t_etype_info.py          |  2 +-
+ src/tests/t_sesskeynego.py         | 28 +++++++++++++++++++++++--
+ src/util/k5test.py                 |  4 ++--
+ 8 files changed, 74 insertions(+), 19 deletions(-)
+
+diff --git a/src/include/k5-int.h b/src/include/k5-int.h
+index 6522422..fffc6f8 100644
+--- a/src/include/k5-int.h
++++ b/src/include/k5-int.h
+@@ -180,6 +180,8 @@ typedef unsigned char   u_char;
+  * matches the variable name.  Keep these alphabetized. */
+ #define KRB5_CONF_ACL_FILE                     "acl_file"
+ #define KRB5_CONF_ADMIN_SERVER                 "admin_server"
++#define KRB5_CONF_ALLOW_DES3                   "allow_des3"
++#define KRB5_CONF_ALLOW_RC4                    "allow_rc4"
+ #define KRB5_CONF_ALLOW_WEAK_CRYPTO            "allow_weak_crypto"
+ #define KRB5_CONF_AP_REQ_CHECKSUM_TYPE         "ap_req_checksum_type"
+ #define KRB5_CONF_AUTH_TO_LOCAL                "auth_to_local"
+@@ -1220,6 +1222,8 @@ struct _krb5_context {
+     struct _kdb_log_context *kdblog_context;
+ 
+     krb5_boolean allow_weak_crypto;
++    krb5_boolean allow_des3;
++    krb5_boolean allow_rc4;
+     krb5_boolean ignore_acceptor_hostname;
+     krb5_boolean dns_canonicalize_hostname;
+ 
+diff --git a/src/kdc/kdc_util.c b/src/kdc/kdc_util.c
+index 0155c28..d62aca6 100644
+--- a/src/kdc/kdc_util.c
++++ b/src/kdc/kdc_util.c
+@@ -1012,6 +1012,16 @@ select_session_keytype(kdc_realm_t *kdc_active_realm, krb5_db_entry *server,
+         if (!krb5_is_permitted_enctype(kdc_context, ktype[i]))
+             continue;
+ 
++        /*
++         * Prevent these deprecated enctypes from being used as session keys
++         * unless they are explicitly allowed.  In the future they will be more
++         * comprehensively disabled and eventually removed.
++         */
++        if (ktype[i] == ENCTYPE_DES3_CBC_SHA1 && !kdc_context->allow_des3)
++            continue;
++        if (ktype[i] == ENCTYPE_ARCFOUR_HMAC && !kdc_context->allow_rc4)
++            continue;
++
+         if (dbentry_supports_enctype(kdc_active_realm, server, ktype[i]))
+             return ktype[i];
+     }
+diff --git a/src/lib/krb5/krb/get_in_tkt.c b/src/lib/krb5/krb/get_in_tkt.c
+index 51580c9..80f4d93 100644
+--- a/src/lib/krb5/krb/get_in_tkt.c
++++ b/src/lib/krb5/krb/get_in_tkt.c
+@@ -1509,22 +1509,32 @@ accept_method_data(krb5_context context, krb5_init_creds_context ctx)
+                                      ctx->method_padata);
+ }
+ 
+-/* Display a warning via the prompter if des3-cbc-sha1 was used for either the
+- * reply key or the session key. */
++
++/* Display a warning via the prompter if a deprecated enctype was used for
++ * either the reply key or the session key. */
+ static void
+-warn_des3(krb5_context context, krb5_init_creds_context ctx,
+-          krb5_enctype as_key_enctype)
++warn_deprecated(krb5_context context, krb5_init_creds_context ctx,
++                krb5_enctype as_key_enctype)
+ {
+-    const char *banner;
++    krb5_enctype etype;
++    char encbuf[128], banner[256];
+ 
+-    if (as_key_enctype != ENCTYPE_DES3_CBC_SHA1 &&
+-        ctx->cred.keyblock.enctype != ENCTYPE_DES3_CBC_SHA1)
+-        return;
+     if (ctx->prompter == NULL)
+         return;
+ 
+-    banner = _("Warning: encryption type des3-cbc-sha1 used for "
+-               "authentication is weak and will be disabled");
++    if (krb5int_c_deprecated_enctype(as_key_enctype))
++        etype = as_key_enctype;
++    else if (krb5int_c_deprecated_enctype(ctx->cred.keyblock.enctype))
++        etype = ctx->cred.keyblock.enctype;
++    else
++        return;
++
++    if (krb5_enctype_to_name(etype, FALSE, encbuf, sizeof(encbuf)) != 0)
++        return;
++    snprintf(banner, sizeof(banner),
++             _("Warning: encryption type %s used for authentication is "
++               "deprecated and will be disabled"), encbuf);
++
+     /* PROMPTER_INVOCATION */
+     (*ctx->prompter)(context, ctx->prompter_data, NULL, banner, 0, NULL);
+ }
+@@ -1728,7 +1738,8 @@ init_creds_step_reply(krb5_context context,
+ 
+     /* success */
+     ctx->complete = TRUE;
+-    warn_des3(context, ctx, encrypting_key.enctype);
++
++    warn_deprecated(context, ctx, encrypting_key.enctype);
+ 
+ cleanup:
+     krb5_free_pa_data(context, kdc_padata);
+diff --git a/src/lib/krb5/krb/init_ctx.c b/src/lib/krb5/krb/init_ctx.c
+index 947e504..077c428 100644
+--- a/src/lib/krb5/krb/init_ctx.c
++++ b/src/lib/krb5/krb/init_ctx.c
+@@ -208,6 +208,16 @@ krb5_init_context_profile(profile_t profile, krb5_flags flags,
+         goto cleanup;
+     ctx->allow_weak_crypto = tmp;
+ 
++    retval = get_boolean(ctx, KRB5_CONF_ALLOW_DES3, 0, &tmp);
++    if (retval)
++        goto cleanup;
++    ctx->allow_des3 = tmp;
++
++    retval = get_boolean(ctx, KRB5_CONF_ALLOW_RC4, 0, &tmp);
++    if (retval)
++        goto cleanup;
++    ctx->allow_rc4 = tmp;
++
+     retval = get_boolean(ctx, KRB5_CONF_IGNORE_ACCEPTOR_HOSTNAME, 0, &tmp);
+     if (retval)
+         goto cleanup;
+diff --git a/src/tests/gssapi/t_enctypes.py b/src/tests/gssapi/t_enctypes.py
+index ee43ff0..92abb1b 100755
+--- a/src/tests/gssapi/t_enctypes.py
++++ b/src/tests/gssapi/t_enctypes.py
+@@ -14,7 +14,7 @@ rc4 = 'arcfour-hmac'
+ 
+ # These tests make assumptions about the default enctype lists, so set
+ # them explicitly rather than relying on the library defaults.
+-enctypes='aes des3 rc4'
++enctypes='aes des3 rc4 allow_des3 allow_rc4'
+ supp='aes256-cts:normal aes128-cts:normal des3-cbc-sha1:normal rc4-hmac:normal'
+ conf = {'libdefaults': {
+         'default_tgs_enctypes': enctypes,
+diff --git a/src/tests/t_etype_info.py b/src/tests/t_etype_info.py
+index 2026e78..f6e7804 100644
+--- a/src/tests/t_etype_info.py
++++ b/src/tests/t_etype_info.py
+@@ -1,7 +1,7 @@
+ from k5test import *
+ 
+ supported_enctypes = 'aes128-cts des3-cbc-sha1 rc4-hmac des-cbc-crc:afs3'
+-conf = {'libdefaults': {'allow_weak_crypto': 'true'},
++conf = {'libdefaults': {'allow_des3': 'true', 'allow_rc4': 'true'},
+         'realms': {'$realm': {'supported_enctypes': supported_enctypes}}}
+ realm = K5Realm(create_host=False, get_creds=False, krb5_conf=conf)
+ 
+diff --git a/src/tests/t_sesskeynego.py b/src/tests/t_sesskeynego.py
+index 4480923..5143b0b 100755
+--- a/src/tests/t_sesskeynego.py
++++ b/src/tests/t_sesskeynego.py
+@@ -30,6 +30,8 @@ conf4 = {'libdefaults': {
+         'default_tgs_enctypes': 'des-cbc-crc,rc4-hmac,aes256-cts'},
+          'realms': {'$realm': {'des_crc_session_supported': 'false'}}}
+ 
++conf5 = {'libdefaults': {'allow_rc4': 'true'}}
++conf6 = {'libdefaults': {'allow_des3': 'true'}}
+ # Test with client request and session_enctypes preferring aes128, but
+ # aes256 long-term key.
+ realm = K5Realm(krb5_conf=conf1, create_host=False, get_creds=False)
+@@ -59,10 +61,12 @@ realm.run([kadminl, 'setstr', 'server', 'session_enctypes',
+            'aes128-cts,aes256-cts'])
+ test_kvno(realm, 'aes128-cts-hmac-sha1-96', 'aes256-cts-hmac-sha1-96')
+ 
+-# 3b: Negotiate rc4-hmac session key when principal only has aes256 long-term.
++# 3b: Skip RC4 (as the KDC does not allow it for session keys by
++# default) and negotiate aes128-cts session key, with only an aes256
++# long-term service key.
+ realm.run([kadminl, 'setstr', 'server', 'session_enctypes',
+            'rc4-hmac,aes128-cts,aes256-cts'])
+-test_kvno(realm, 'arcfour-hmac', 'aes256-cts-hmac-sha1-96')
++test_kvno(realm, 'aes128-cts-hmac-sha1-96', 'aes256-cts-hmac-sha1-96')
+ 
+ # 3c: Test des-cbc-crc default assumption.
+ realm.run([kadminl, 'delstr', 'server', 'session_enctypes'])
+@@ -75,4 +79,24 @@ realm.run([kadminl, 'addprinc', '-randkey', '-e', 'aes256-cts', 'server'])
+ test_kvno(realm, 'aes256-cts-hmac-sha1-96', 'aes256-cts-hmac-sha1-96')
+ realm.stop()
+ 
++# 5: allow_rc4 permits negotiation of rc4-hmac session key.
++realm = K5Realm(krb5_conf=conf5, create_host=False, get_creds=False)
++realm.run([kadminl, 'addprinc', '-randkey', '-e', 'aes256-cts', 'server'])
++realm.run([kadminl, 'setstr', 'server', 'session_enctypes', 'rc4-hmac'])
++test_kvno(realm, 'aes128-cts-hmac-sha1-96', 'aes256-cts-hmac-sha1-96')
++realm.stop()
++
++# 6: allow_des3 permits negotiation of des3-cbc-sha1 session key.
++realm = K5Realm(krb5_conf=conf6, create_host=False, get_creds=False)
++realm.run([kadminl, 'addprinc', '-randkey', '-e', 'aes256-cts', 'server'])
++realm.run([kadminl, 'setstr', 'server', 'session_enctypes', 'des3-cbc-sha1'])
++test_kvno(realm, 'DEPRECATED:des3-cbc-sha1', 'aes256-cts-hmac-sha1-96')
++realm.stop()
++
++# 7: default config negotiates aes256-sha1 session key for RC4-only service.
++realm = K5Realm(create_host=False, get_creds=False)
++realm.run([kadminl, 'addprinc', '-randkey', '-e', 'rc4-hmac', 'server'])
++test_kvno(realm, 'aes256-cts-hmac-sha1-96', 'DEPRECATED:arcfour-hmac')
++realm.stop()
++
+ success('sesskeynego')
+diff --git a/src/util/k5test.py b/src/util/k5test.py
+index 3aec1ef..ad47228 100644
+--- a/src/util/k5test.py
++++ b/src/util/k5test.py
+@@ -1262,7 +1262,7 @@ _passes = [
+      {'libdefaults': {
+                 'default_tgs_enctypes': 'des3',
+                 'default_tkt_enctypes': 'des3',
+-                'permitted_enctypes': 'des3'}},
++                'permitted_enctypes': 'des3 aes256-sha1'}},
+      {'realms': {'$realm': {
+                     'supported_enctypes': 'des3-cbc-sha1:normal',
+                     'master_key_type': 'des3-cbc-sha1'}}}),
+@@ -1272,7 +1272,7 @@ _passes = [
+      {'libdefaults': {
+                 'default_tgs_enctypes': 'rc4',
+                 'default_tkt_enctypes': 'rc4',
+-                'permitted_enctypes': 'rc4'}},
++                'permitted_enctypes': 'rc4 aes256-sha1'}},
+      {'realms': {'$realm': {
+                     'supported_enctypes': 'arcfour-hmac:normal',
+                     'master_key_type': 'arcfour-hmac'}}}),
+-- 
+2.50.1
+
diff --git a/meta-oe/recipes-connectivity/krb5/krb5/CVE-2025-3576-02.patch b/meta-oe/recipes-connectivity/krb5/krb5/CVE-2025-3576-02.patch
new file mode 100644
index 0000000000..b0860b18c4
--- /dev/null
+++ b/meta-oe/recipes-connectivity/krb5/krb5/CVE-2025-3576-02.patch
@@ -0,0 +1,188 @@
+From 484a6e7712f9b66e782b2520f07b0883889e116f Mon Sep 17 00:00:00 2001
+From: Robbie Harwood <rharwood@redhat.com>
+Date: Tue, 15 Jan 2019 16:16:57 -0500
+Subject: [PATCH] Add function and enctype flag for deprecations
+
+krb5int_c_deprecated_enctype() checks for the ETYPE_DEPRECATED flag on
+enctypes.  All ENCTYPE_WEAK enctypes are currently deprecated; not all
+deprecated enctypes are considered weak.  Deprecations follow RFC 6649
+and RFC 8429.
+
+CVE: CVE-2025-3576
+Upstream-Status: Backport [https://github.com/krb5/krb5/commit/484a6e7712f9b66e782b2520f07b0883889e116f]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/include/k5-int.h               |  1 +
+ src/lib/crypto/krb/crypto_int.h    |  9 ++++++++-
+ src/lib/crypto/krb/enctype_util.c  |  7 +++++++
+ src/lib/crypto/krb/etypes.c        | 19 ++++++++++---------
+ src/lib/crypto/libk5crypto.exports |  1 +
+ src/lib/krb5_32.def                |  3 +++
+ 6 files changed, 30 insertions(+), 10 deletions(-)
+
+diff --git a/src/include/k5-int.h b/src/include/k5-int.h
+index fffc6f8..5928c82 100644
+--- a/src/include/k5-int.h
++++ b/src/include/k5-int.h
+@@ -2080,6 +2080,7 @@ krb5_get_tgs_ktypes(krb5_context, krb5_const_principal, krb5_enctype **);
+ krb5_boolean krb5_is_permitted_enctype(krb5_context, krb5_enctype);
+ 
+ krb5_boolean KRB5_CALLCONV krb5int_c_weak_enctype(krb5_enctype);
++krb5_boolean KRB5_CALLCONV krb5int_c_deprecated_enctype(krb5_enctype);
+ krb5_error_code k5_enctype_to_ssf(krb5_enctype enctype, unsigned int *ssf_out);
+ 
+ krb5_error_code krb5_kdc_rep_decrypt_proc(krb5_context, const krb5_keyblock *,
+diff --git a/src/lib/crypto/krb/crypto_int.h b/src/lib/crypto/krb/crypto_int.h
+index e509929..6c1c77c 100644
+--- a/src/lib/crypto/krb/crypto_int.h
++++ b/src/lib/crypto/krb/crypto_int.h
+@@ -114,7 +114,14 @@ struct krb5_keytypes {
+     unsigned int ssf;
+ };
+ 
+-#define ETYPE_WEAK 1
++/*
++ * "Weak" means the enctype is believed to be vulnerable to practical attacks,
++ * and will be disabled unless allow_weak_crypto is set to true.  "Deprecated"
++ * means the enctype has been deprecated by the IETF, and affects display and
++ * logging.
++ */
++#define ETYPE_WEAK (1 << 0)
++#define ETYPE_DEPRECATED (1 << 1)
+ 
+ extern const struct krb5_keytypes krb5int_enctypes_list[];
+ extern const int krb5int_enctypes_length;
+diff --git a/src/lib/crypto/krb/enctype_util.c b/src/lib/crypto/krb/enctype_util.c
+index b1b40e7..e394f4e 100644
+--- a/src/lib/crypto/krb/enctype_util.c
++++ b/src/lib/crypto/krb/enctype_util.c
+@@ -51,6 +51,13 @@ krb5int_c_weak_enctype(krb5_enctype etype)
+     return (ktp != NULL && (ktp->flags & ETYPE_WEAK) != 0);
+ }
+ 
++krb5_boolean KRB5_CALLCONV
++krb5int_c_deprecated_enctype(krb5_enctype etype)
++{
++    const struct krb5_keytypes *ktp = find_enctype(etype);
++    return ktp != NULL && (ktp->flags & ETYPE_DEPRECATED) != 0;
++}
++
+ krb5_error_code KRB5_CALLCONV
+ krb5_c_enctype_compare(krb5_context context, krb5_enctype e1, krb5_enctype e2,
+                        krb5_boolean *similar)
+diff --git a/src/lib/crypto/krb/etypes.c b/src/lib/crypto/krb/etypes.c
+index 53d4a5c..8f44c37 100644
+--- a/src/lib/crypto/krb/etypes.c
++++ b/src/lib/crypto/krb/etypes.c
+@@ -33,6 +33,7 @@
+    that the keytypes are all near each other.  I'd rather not make
+    that assumption. */
+ 
++/* Deprecations come from RFC 6649 and RFC 8249. */
+ const struct krb5_keytypes krb5int_enctypes_list[] = {
+     { ENCTYPE_DES_CBC_CRC,
+       "des-cbc-crc", { 0 }, "DES cbc mode with CRC-32",
+@@ -42,7 +43,7 @@ const struct krb5_keytypes krb5int_enctypes_list[] = {
+       krb5int_des_string_to_key, k5_rand2key_des,
+       krb5int_des_prf,
+       CKSUMTYPE_RSA_MD5_DES,
+-      ETYPE_WEAK, 56 },
++      ETYPE_WEAK | ETYPE_DEPRECATED, 56 },
+     { ENCTYPE_DES_CBC_MD4,
+       "des-cbc-md4", { 0 }, "DES cbc mode with RSA-MD4",
+       &krb5int_enc_des, &krb5int_hash_md4,
+@@ -51,7 +52,7 @@ const struct krb5_keytypes krb5int_enctypes_list[] = {
+       krb5int_des_string_to_key, k5_rand2key_des,
+       krb5int_des_prf,
+       CKSUMTYPE_RSA_MD4_DES,
+-      ETYPE_WEAK, 56 },
++      ETYPE_WEAK | ETYPE_DEPRECATED, 56 },
+     { ENCTYPE_DES_CBC_MD5,
+       "des-cbc-md5", { "des" }, "DES cbc mode with RSA-MD5",
+       &krb5int_enc_des, &krb5int_hash_md5,
+@@ -60,7 +61,7 @@ const struct krb5_keytypes krb5int_enctypes_list[] = {
+       krb5int_des_string_to_key, k5_rand2key_des,
+       krb5int_des_prf,
+       CKSUMTYPE_RSA_MD5_DES,
+-      ETYPE_WEAK, 56 },
++      ETYPE_WEAK | ETYPE_DEPRECATED, 56 },
+     { ENCTYPE_DES_CBC_RAW,
+       "des-cbc-raw", { 0 }, "DES cbc mode raw",
+       &krb5int_enc_des, NULL,
+@@ -69,7 +70,7 @@ const struct krb5_keytypes krb5int_enctypes_list[] = {
+       krb5int_des_string_to_key, k5_rand2key_des,
+       krb5int_des_prf,
+       0,
+-      ETYPE_WEAK, 56 },
++      ETYPE_WEAK | ETYPE_DEPRECATED, 56 },
+     { ENCTYPE_DES3_CBC_RAW,
+       "des3-cbc-raw", { 0 }, "Triple DES cbc mode raw",
+       &krb5int_enc_des3, NULL,
+@@ -78,7 +79,7 @@ const struct krb5_keytypes krb5int_enctypes_list[] = {
+       krb5int_dk_string_to_key, k5_rand2key_des3,
+       NULL, /*PRF*/
+       0,
+-      ETYPE_WEAK, 112 },
++      ETYPE_WEAK | ETYPE_DEPRECATED, 112 },
+ 
+     { ENCTYPE_DES3_CBC_SHA1,
+       "des3-cbc-sha1", { "des3-hmac-sha1", "des3-cbc-sha1-kd" },
+@@ -89,7 +90,7 @@ const struct krb5_keytypes krb5int_enctypes_list[] = {
+       krb5int_dk_string_to_key, k5_rand2key_des3,
+       krb5int_dk_prf,
+       CKSUMTYPE_HMAC_SHA1_DES3,
+-      0 /*flags*/, 112 },
++      ETYPE_DEPRECATED, 112 },
+ 
+     { ENCTYPE_DES_HMAC_SHA1,
+       "des-hmac-sha1", { 0 }, "DES with HMAC/sha1",
+@@ -99,7 +100,7 @@ const struct krb5_keytypes krb5int_enctypes_list[] = {
+       krb5int_dk_string_to_key, k5_rand2key_des,
+       NULL, /*PRF*/
+       0,
+-      ETYPE_WEAK, 56 },
++      ETYPE_WEAK | ETYPE_DEPRECATED, 56 },
+ 
+     /* rc4-hmac uses a 128-bit key, but due to weaknesses in the RC4 cipher, we
+      * consider its strength degraded and assign it an SSF value of 64. */
+@@ -113,7 +114,7 @@ const struct krb5_keytypes krb5int_enctypes_list[] = {
+       krb5int_arcfour_decrypt, krb5int_arcfour_string_to_key,
+       k5_rand2key_direct, krb5int_arcfour_prf,
+       CKSUMTYPE_HMAC_MD5_ARCFOUR,
+-      0 /*flags*/, 64 },
++      ETYPE_DEPRECATED, 64 },
+     { ENCTYPE_ARCFOUR_HMAC_EXP,
+       "arcfour-hmac-exp", { "rc4-hmac-exp", "arcfour-hmac-md5-exp" },
+       "Exportable ArcFour with HMAC/md5",
+@@ -124,7 +125,7 @@ const struct krb5_keytypes krb5int_enctypes_list[] = {
+       krb5int_arcfour_decrypt, krb5int_arcfour_string_to_key,
+       k5_rand2key_direct, krb5int_arcfour_prf,
+       CKSUMTYPE_HMAC_MD5_ARCFOUR,
+-      ETYPE_WEAK, 40
++      ETYPE_WEAK | ETYPE_DEPRECATED, 40
+     },
+ 
+     { ENCTYPE_AES128_CTS_HMAC_SHA1_96,
+diff --git a/src/lib/crypto/libk5crypto.exports b/src/lib/crypto/libk5crypto.exports
+index 82eb5f3..90afdf5 100644
+--- a/src/lib/crypto/libk5crypto.exports
++++ b/src/lib/crypto/libk5crypto.exports
+@@ -109,3 +109,4 @@ k5_allow_weak_pbkdf2iter
+ krb5_c_prfplus
+ krb5_c_derive_prfplus
+ k5_enctype_to_ssf
++krb5int_c_deprecated_enctype
+diff --git a/src/lib/krb5_32.def b/src/lib/krb5_32.def
+index c350229..e6a4875 100644
+--- a/src/lib/krb5_32.def
++++ b/src/lib/krb5_32.def
+@@ -487,3 +487,6 @@ EXPORTS
+ 	encode_krb5_pa_spake				@444 ; PRIVATE
+ 	decode_krb5_pa_spake				@445 ; PRIVATE
+ 	k5_free_pa_spake				@446 ; PRIVATE
++
++; new in 1.18
++	krb5int_c_deprecated_enctype			@450 ; PRIVATE
+-- 
+2.50.1
+
diff --git a/meta-oe/recipes-connectivity/krb5/krb5/CVE-2025-3576-pre.patch b/meta-oe/recipes-connectivity/krb5/krb5/CVE-2025-3576-pre.patch
new file mode 100644
index 0000000000..13298d677f
--- /dev/null
+++ b/meta-oe/recipes-connectivity/krb5/krb5/CVE-2025-3576-pre.patch
@@ -0,0 +1,58 @@
+From: Greg Hudson <ghudson@mit.edu>
+Date: Mon, 14 Sep 2020 20:40:29 -0400
+Subject: [PATCH] Warn when des3-cbc-sha1 is used for initial auth
+
+During initial authentication, if des3-cbc-sha1 is used for either the
+reply key or session key, display a warning that it will be disabled.
+
+ticket: 8947
+
+CVE: CVE-2025-3576
+Upstream-Status: Backport [https://github.com/krb5/krb5/commit/39fecf78796bbdde1e3d4828b86f64f05d9e4c77]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/lib/krb5/krb/get_in_tkt.c | 21 +++++++++++++++++++++
+ 1 file changed, 21 insertions(+)
+
+diff --git a/src/lib/krb5/krb/get_in_tkt.c b/src/lib/krb5/krb/get_in_tkt.c
+index 79dede2..51580c9 100644
+--- a/src/lib/krb5/krb/get_in_tkt.c
++++ b/src/lib/krb5/krb/get_in_tkt.c
+@@ -1509,6 +1509,26 @@ accept_method_data(krb5_context context, krb5_init_creds_context ctx)
+                                      ctx->method_padata);
+ }
+ 
++/* Display a warning via the prompter if des3-cbc-sha1 was used for either the
++ * reply key or the session key. */
++static void
++warn_des3(krb5_context context, krb5_init_creds_context ctx,
++          krb5_enctype as_key_enctype)
++{
++    const char *banner;
++
++    if (as_key_enctype != ENCTYPE_DES3_CBC_SHA1 &&
++        ctx->cred.keyblock.enctype != ENCTYPE_DES3_CBC_SHA1)
++        return;
++    if (ctx->prompter == NULL)
++        return;
++
++    banner = _("Warning: encryption type des3-cbc-sha1 used for "
++               "authentication is weak and will be disabled");
++    /* PROMPTER_INVOCATION */
++    (*ctx->prompter)(context, ctx->prompter_data, NULL, banner, 0, NULL);
++}
++
+ static krb5_error_code
+ init_creds_step_reply(krb5_context context,
+                       krb5_init_creds_context ctx,
+@@ -1708,6 +1728,7 @@ init_creds_step_reply(krb5_context context,
+ 
+     /* success */
+     ctx->complete = TRUE;
++    warn_des3(context, ctx, encrypting_key.enctype);
+ 
+ cleanup:
+     krb5_free_pa_data(context, kdc_padata);
+-- 
+2.50.1
+
diff --git a/meta-oe/recipes-connectivity/krb5/krb5_1.17.2.bb b/meta-oe/recipes-connectivity/krb5/krb5_1.17.2.bb
index 4c86bd94f5..1810649f64 100644
--- a/meta-oe/recipes-connectivity/krb5/krb5_1.17.2.bb
+++ b/meta-oe/recipes-connectivity/krb5/krb5_1.17.2.bb
@@ -37,6 +37,9 @@ SRC_URI = "http://web.mit.edu/kerberos/dist/${BPN}/${SHRT_VER}/${BP}.tar.gz \
            file://CVE-2024-37370_37371-pre1.patch;striplevel=2 \
            file://CVE-2024-37370_37371.patch;striplevel=2 \
            file://CVE-2024-26458_CVE-2024-26461.patch;striplevel=2 \
+           file://CVE-2025-3576-pre.patch;striplevel=2 \
+           file://CVE-2025-3576-01.patch;striplevel=2 \
+           file://CVE-2025-3576-02.patch;striplevel=2 \
 "
 SRC_URI[md5sum] = "aa4337fffa3b61f22dbd0167f708818f"
 SRC_URI[sha256sum] = "1a4bba94df92f6d39a197a10687653e8bfbc9a2076e129f6eb92766974f86134"
-- 
2.50.1


