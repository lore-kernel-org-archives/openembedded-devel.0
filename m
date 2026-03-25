Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20C7F106B526
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 12:42:05 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21571.1774442514525939163
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Mar 2026 05:41:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=jvr8bUtD;
 spf=pass (domain: mvista.com, ip: 209.85.214.182, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2a9296b3926so18802555ad.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Mar 2026 05:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1774442513; x=1775047313; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kt9FotPN02EnZf5injad4rFl3vlea0A3kgYCLWIUShM=;
        b=jvr8bUtDc3I8gLb1OxEdWeRleNpptgNC/L7yDFu6hZdfgUv7HIthCqJ8qNNGpsUN9o
         lIm2N2sn0hESr9dTsxYhbWiJSTnEiWX5Ge7s6jR/m/0CxCUm6+EVrDYlNrm4kP+/uZuz
         KGwgxdZmU5jHhCcwHhZ3f36Jhgt1Vf1hDI2aI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774442513; x=1775047313;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kt9FotPN02EnZf5injad4rFl3vlea0A3kgYCLWIUShM=;
        b=fQbYnpmTDEo9ZWdTWlUuW/puFTN69e/PP0fPtoSUV/A6nvaOXEb+KFzWzIafRdygLD
         CF6NG3ztoyv6EL3LmNU79hSrjWteadjZFd3p7JRyf5WCLFCdxKN/HaEUU/+imvJOFVnl
         2bNJO/hqfVnCLbgekkb1BqZx1uZcJZaQSFiYydYWtPvRRmrOll+katZ6vtI6a/UptkTK
         wKTFO1E8NkykkMhQmn1IPVV6MpIDORYDEXgBlatREPijGT3myjSmSJmO2XGHrXjJpD49
         wHYjOC6BNr/+d8TmqJcAec3lkW0OdBBKWr0EOvWmKB9v5j6P1HrGd8GXux6/mACbWgLG
         kvNg==
X-Gm-Message-State: AOJu0Yx9Dt0GMQ+k3VvfGHE04raeZ+UNR7Oh5Bl8AFOHj41UB1EjCh2B
	GN8+w1DBYdaHKlO6ddCrNiEZ0kaT+ok3HvwavYvlva9rGJsUl9AJAY2lp2Gnkubz8AQam7P84Vz
	hsl3SCfg=
X-Gm-Gg: ATEYQzxfoPYoHmpSP4dH3j9G5PagPNaB1wA3S/9E4x3eu7P4X/DGa9mljhP/vXVdmMF
	MO8F9OTKWJ0QL0lRuOq28PuTTBL17X2Gn1XPWvV8FraFIneihmaA/FRQ7+TX8v/T5CmWWoArfvG
	inyKH6Ow2ljW7GzSDEjbKFDqkeESkmDYN/tP3wRUqwoAWZeA5wu4xbUFKDff0LJkmNcnWYHw75u
	8TQ4pxVBEkVmJcxsc9MK3ECXp5qf+8iMoq4serh/c7DnsCB4UE7jfk96rl1BYBb5zYf8i9So9xO
	M8P3kL/4ocfSetGrZaJL5FSJgpoyv3IxdRgn0xhrlaFviVvLlQ9SSctDBK67BcNkNDJsAw/4JAc
	o7t4ZT/VNByxkXUTeDjQfm7SUOVfmZ3FaZ+oEEkotCECYH6tYYfezWqsGXyGcTzsnKr7pu5tIHF
	0tw45JYytDMs0GrQj1N6f7ZgVDP47vtYtJSM+9
X-Received: by 2002:a17:903:37cf:b0:2b0:41bf:ca83 with SMTP id d9443c01a7336-2b0b0a48b14mr35507285ad.23.1774442513470;
        Wed, 25 Mar 2026 05:41:53 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:54:2bec:794a:a8bb:bd94:ee98])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b083516ae1sm170002795ad.13.2026.03.25.05.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 05:41:52 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [oe][meta-oe][kirkstone][PATCH] libssh: Fix CVE-2026-0966
Date: Wed, 25 Mar 2026 18:11:41 +0530
Message-Id: <20260325124141.142149-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Mar 2026 12:42:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125623

From: Vijay Anusuri <vanusuri@mvista.com>

Pick commits according to [1]

[1] https://security-tracker.debian.org/tracker/CVE-2026-0966
[2] https://www.libssh.org/security/advisories/CVE-2026-0966.txt

Skip the test commit as it's not applicable in libssh-0.8.9

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../libssh/libssh/CVE-2026-0966-1.patch       | 38 ++++++++++++
 .../libssh/libssh/CVE-2026-0966-2.patch       | 62 +++++++++++++++++++
 .../recipes-support/libssh/libssh_0.8.9.bb    |  2 +
 3 files changed, 102 insertions(+)
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2026-0966-1.patch
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2026-0966-2.patch

diff --git a/meta-oe/recipes-support/libssh/libssh/CVE-2026-0966-1.patch b/meta-oe/recipes-support/libssh/libssh/CVE-2026-0966-1.patch
new file mode 100644
index 0000000000..a645282afd
--- /dev/null
+++ b/meta-oe/recipes-support/libssh/libssh/CVE-2026-0966-1.patch
@@ -0,0 +1,38 @@
+From 6ba5ff1b7b1547a59f750fbc06b89737b7456117 Mon Sep 17 00:00:00 2001
+From: Jakub Jelen <jjelen@redhat.com>
+Date: Thu, 8 Jan 2026 12:09:50 +0100
+Subject: [PATCH] CVE-2026-0966 misc: Avoid heap buffer underflow in ssh_get_hexa
+
+Signed-off-by: Jakub Jelen <jjelen@redhat.com>
+Reviewed-by: Pavol Žáčik <pzacik@redhat.com>
+(cherry picked from commit 417a095e6749a1f3635e02332061edad3c6a3401)
+
+ssh_get_hexa function not present in misc.c. It was in dh.c file in
+older libssh versions. 
+
+ssh_get_hexa function moved from dh.c from misc.c by the below commit
+https://git.libssh.org/projects/libssh.git/commit/?id=43a4f86b6e14a907b3a298d10d5cd7efb59f6a09
+
+Upstream-Status: Backport [https://git.libssh.org/projects/libssh.git/commit/?id=6ba5ff1b7b1547a59f750fbc06b89737b7456117]
+CVE: CVE-2026-0966
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ src/dh.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/dh.c b/src/dh.c
+index 7116d1dc..321aeba6 100644
+--- a/src/dh.c
++++ b/src/dh.c
+@@ -1486,7 +1486,7 @@ char *ssh_get_hexa(const unsigned char *what, size_t len) {
+   size_t i;
+   size_t hlen = len * 3;
+ 
+-  if (len > (UINT_MAX - 1) / 3) {
++  if (what == NULL || len < 1 || len > (UINT_MAX - 1) / 3) {
+     return NULL;
+   }
+ 
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-support/libssh/libssh/CVE-2026-0966-2.patch b/meta-oe/recipes-support/libssh/libssh/CVE-2026-0966-2.patch
new file mode 100644
index 0000000000..9a035dbc1e
--- /dev/null
+++ b/meta-oe/recipes-support/libssh/libssh/CVE-2026-0966-2.patch
@@ -0,0 +1,62 @@
+From 3e1d276a5a030938a8f144f46ff4f2a2efe31ced Mon Sep 17 00:00:00 2001
+From: Jakub Jelen <jjelen@redhat.com>
+Date: Thu, 8 Jan 2026 12:10:44 +0100
+Subject: [PATCH] CVE-2026-0966 doc: Update guided tour to use SHA256 fingerprints
+
+Signed-off-by: Jakub Jelen <jjelen@redhat.com>
+Reviewed-by: Pavol Žáčik <pzacik@redhat.com>
+(cherry picked from commit 1b2a4f760bec35121c490f2294f915ebb9c992ae)
+
+Upstream-Status: Backport [https://git.libssh.org/projects/libssh.git/commit/?id=3e1d276a5a030938a8f144f46ff4f2a2efe31ced]
+CVE: CVE-2026-0966
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ doc/guided_tour.dox | 10 ++++------
+ 1 file changed, 4 insertions(+), 6 deletions(-)
+
+diff --git a/doc/guided_tour.dox b/doc/guided_tour.dox
+index 008ccb4e..bdd7489c 100644
+--- a/doc/guided_tour.dox
++++ b/doc/guided_tour.dox
+@@ -190,7 +190,6 @@ int verify_knownhost(ssh_session session)
+     ssh_key srv_pubkey = NULL;
+     size_t hlen;
+     char buf[10];
+-    char *hexa = NULL;
+     char *p = NULL;
+     int cmp;
+     int rc;
+@@ -201,7 +200,7 @@ int verify_knownhost(ssh_session session)
+     }
+ 
+     rc = ssh_get_publickey_hash(srv_pubkey,
+-                                SSH_PUBLICKEY_HASH_SHA1,
++                                SSH_PUBLICKEY_HASH_SHA256,
+                                 &hash,
+                                 &hlen);
+     ssh_key_free(srv_pubkey);
+@@ -217,7 +216,7 @@ int verify_knownhost(ssh_session session)
+             break;
+         case SSH_KNOWN_HOSTS_CHANGED:
+             fprintf(stderr, "Host key for server changed: it is now:\n");
+-            ssh_print_hexa("Public key hash", hash, hlen);
++            ssh_print_hexa(SSH_PUBLICKEY_HASH_SHA256, hash, hlen);
+             fprintf(stderr, "For security reasons, connection will be stopped\n");
+             ssh_clean_pubkey_hash(&hash);
+ 
+@@ -238,10 +237,9 @@ int verify_knownhost(ssh_session session)
+             /* FALL THROUGH to SSH_SERVER_NOT_KNOWN behavior */
+ 
+         case SSH_KNOWN_HOSTS_UNKNOWN:
+-            hexa = ssh_get_hexa(hash, hlen);
+             fprintf(stderr,"The server is unknown. Do you trust the host key?\n");
+-            fprintf(stderr, "Public key hash: %s\n", hexa);
+-            ssh_string_free_char(hexa);
++            fprintf(stderr, "Public key hash: ");
++            ssh_print_hash(SSH_PUBLICKEY_HASH_SHA256, hash, hlen);
+             ssh_clean_pubkey_hash(&hash);
+             p = fgets(buf, sizeof(buf), stdin);
+             if (p == NULL) {
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-support/libssh/libssh_0.8.9.bb b/meta-oe/recipes-support/libssh/libssh_0.8.9.bb
index a1fc64446c..8cc0883b2b 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.8.9.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.8.9.bb
@@ -29,6 +29,8 @@ SRC_URI = "git://git.libssh.org/projects/libssh.git;protocol=https;branch=stable
            file://CVE-2025-8277-3.patch \
            file://CVE-2025-8114.patch \
            file://CVE-2026-3731.patch \
+           file://CVE-2026-0966-1.patch \
+           file://CVE-2026-0966-2.patch \
           "
 SRCREV = "04685a74df9ce1db1bc116a83a0da78b4f4fa1f8"
 
-- 
2.25.1


