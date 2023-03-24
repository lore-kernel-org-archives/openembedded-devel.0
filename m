Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EB35C6FD1C
	for <webhook@archiver.kernel.org>; Fri, 24 Mar 2023 12:04:16 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web11.99078.1679659452913341848
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Mar 2023 05:04:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=amtfQfkC;
 spf=pass (domain: mvista.com, ip: 209.85.216.51, mailfrom: hprajapati@mvista.com)
Received: by mail-pj1-f51.google.com with SMTP id f6-20020a17090ac28600b0023b9bf9eb63so1354162pjt.5
        for <openembedded-devel@lists.openembedded.org>; Fri, 24 Mar 2023 05:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1679659452;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZEOa/AOyuxImhqx8vrR+O2zgPzdU6DMiHZ/NjEW6SUk=;
        b=amtfQfkChIaaZFUOQBAHrY8tiyGBPr11S83d59N6faaO5M6XcZ9Vocss5rDCBEUNki
         zzxiAP8l5c+u+emUzWPznqnvBZkH3E8DdM/Q9G0mivGom93pzsSYPY8AKlF6xDjp9Nmp
         xiUN766+y6tOgiTNrtkjs1r21OpADNTYenMbU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679659452;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZEOa/AOyuxImhqx8vrR+O2zgPzdU6DMiHZ/NjEW6SUk=;
        b=5TxwrmkMvqukmRlttfZGocF7ORmevnqCf75FzLZy5/w15D3VCBgJwFI7P85Ed34/PP
         ALpPxrliThkOED+cksFGE1GgCG6trT49FOPbtnbfPozfcVXkyHiWnXGCwSVDvC96EB5L
         V9WTjn3gqhBd0UFpew3FRTzDiW0/GJ1JPtb/usdZuK85L4Xt1zeTuQYPZRdQ/hqDKViy
         IjRKMWjJFW830fty3HKgn7m7Hzom7D/e6f1YXBb8NQ9+DgICiEHnKK+5LjtiARhbNJmK
         Gp8QtgUPrWmStPXD10VZpwKetQM9xoORkSMetAhQ1kn4ZFrIiaonJWWtBSkz6JsVXu+7
         bpbg==
X-Gm-Message-State: AAQBX9c1AFNHphJUYK/KNnrgYRVbAFrBSkW0pq2whxSQmewOPLPeD8/2
	0EUzgERF4/FHrKgi23u8JsAAaBqovNy7JaEj/Wg=
X-Google-Smtp-Source: AKy350ZYwJwvFidhzeGMWqhecEuwC/hPBE7uWCbHirBEtYm/POvC4KpxeqvOFG0lS/77jIErXzEjQg==
X-Received: by 2002:a17:903:28c3:b0:1a1:c6a7:44ed with SMTP id kv3-20020a17090328c300b001a1c6a744edmr2007365plb.46.1679659452042;
        Fri, 24 Mar 2023 05:04:12 -0700 (PDT)
Received: from MVIN00024 ([27.121.101.92])
        by smtp.gmail.com with ESMTPSA id n9-20020a1709026a8900b001a1f67ee4d3sm4441782plk.100.2023.03.24.05.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Mar 2023 05:04:11 -0700 (PDT)
Received: by MVIN00024 (sSMTP sendmail emulation); Fri, 24 Mar 2023 17:34:06 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-oe][dunfell][PATCH] postgresql: CVE-2022-41862 Client memory disclosure when connecting with Kerberos to modified server
Date: Fri, 24 Mar 2023 17:34:04 +0530
Message-Id: <20230324120404.43733-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Mar 2023 12:04:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101705

Upstream-Status: Backport from https://git.postgresql.org/gitweb/?p=postgresql.git;a=commit;h=3f7342671341a7a137f2d8b06ab3461cdb0e1d88

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../postgresql/files/CVE-2022-41862.patch     | 48 +++++++++++++++++++
 .../recipes-dbs/postgresql/postgresql_12.9.bb |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta-oe/recipes-dbs/postgresql/files/CVE-2022-41862.patch

diff --git a/meta-oe/recipes-dbs/postgresql/files/CVE-2022-41862.patch b/meta-oe/recipes-dbs/postgresql/files/CVE-2022-41862.patch
new file mode 100644
index 0000000000..f4093f4ba7
--- /dev/null
+++ b/meta-oe/recipes-dbs/postgresql/files/CVE-2022-41862.patch
@@ -0,0 +1,48 @@
+From 3f7342671341a7a137f2d8b06ab3461cdb0e1d88 Mon Sep 17 00:00:00 2001
+From: Michael Paquier <michael@paquier.xyz>
+Date: Mon, 6 Feb 2023 11:20:31 +0900
+Subject: [PATCH] Properly NULL-terminate GSS receive buffer on error packet
+ reception
+
+pqsecure_open_gss() includes a code path handling error messages with
+v2-style protocol messages coming from the server.  The client-side
+buffer holding the error message does not force a NULL-termination, with
+the data of the server getting copied to the errorMessage of the
+connection.  Hence, it would be possible for a server to send an
+unterminated string and copy arbitrary bytes in the buffer receiving the
+error message in the client, opening the door to a crash or even data
+exposure.
+
+As at this stage of the authentication process the exchange has not been
+completed yet, this could be abused by an attacker without Kerberos
+credentials.  Clients that have a valid kerberos cache are vulnerable as
+libpq opportunistically requests for it except if gssencmode is
+disabled.
+
+Author: Jacob Champion
+Backpatch-through: 12
+Security: CVE-2022-41862
+
+CVE: CVE-2022-41862
+Upstream-Status: Backport [https://git.postgresql.org/gitweb/?p=postgresql.git;a=commit;h=3f7342671341a7a137f2d8b06ab3461cdb0e1d88]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/interfaces/libpq/fe-secure-gssapi.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/interfaces/libpq/fe-secure-gssapi.c b/src/interfaces/libpq/fe-secure-gssapi.c
+index 7b5e383..aef201b 100644
+--- a/src/interfaces/libpq/fe-secure-gssapi.c
++++ b/src/interfaces/libpq/fe-secure-gssapi.c
+@@ -578,6 +578,8 @@ pqsecure_open_gss(PGconn *conn)
+ 
+ 			PqGSSRecvLength += ret;
+ 
++			Assert(PqGSSRecvLength < PQ_GSS_RECV_BUFFER_SIZE);
++			PqGSSRecvBuffer[PqGSSRecvLength] = '\0';
+ 			printfPQExpBuffer(&conn->errorMessage, "%s\n", PqGSSRecvBuffer + 1);
+ 
+ 			return PGRES_POLLING_FAILED;
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_12.9.bb b/meta-oe/recipes-dbs/postgresql/postgresql_12.9.bb
index 860e821b20..808c5d6e77 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql_12.9.bb
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_12.9.bb
@@ -9,6 +9,7 @@ SRC_URI += "\
    file://remove_duplicate.patch \
    file://CVE-2022-1552.patch \
    file://CVE-2022-2625.patch \
+   file://CVE-2022-41862.patch \
 "
 
 SRC_URI[sha256sum] = "89fda2de33ed04a98548e43f3ee5f15b882be17505d631fe0dd1a540a2b56dce"
-- 
2.25.1


