Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A20BC88E45
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 23:10:47 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27851.1789081837413270256
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Sep 2026 16:10:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=W8V2y7Me;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-398c1101c1bso301795a91.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Sep 2026 16:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789081837; x=1789686637; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U7WmbOCKVdldAZRrCiN+PLYSzHH00mVBVIMwOcyQH1w=;
        b=W8V2y7MeBhFEX56MbTuYP2pG03f+o1JWSrNHnTLYPaXZl+dEsiiRq94DqvAjNXzIv0
         R1dZBESEWrOwGNuGOocRsNU/V60sXh51w6FIgV9j/XoCB8RzFUuu4QOKwPIS23WvQOYx
         sY5rTI+AKaBwitw0W7aSPMDkkAnaaX3TBKbZYwjWufksj8nZLkljc9bgqG+8YGfEmZGv
         XD6dL03ul6y7uwaLbOmXxkJrCpklHmkApYybjRJguMzEt/U9LbzEWnd2TZKqDCYRiyXz
         qKhM15f/cf9cA9j+aHaAfbXOwQYgMiYzbUs6Kd/33Hhze2S35e/Q/Yfr0/J8ZO9x8EwG
         OynA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789081837; x=1789686637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=U7WmbOCKVdldAZRrCiN+PLYSzHH00mVBVIMwOcyQH1w=;
        b=eejSdCM7Mylg/ImHTtyHKTIkgkasfGL+DUgpOAsoSxQrvxt449pLJWotVAyVN31oz/
         9pWYX4KMD3B9vT6cSaeNyea1Za2sC+JLhb0YwyfLqVJZgDyfR3tpA+mTsd0E/4zGeGi6
         CC927cuoTkg6VcBaCdhSyRp4LIP8BjPHsV091vPkcz99c3gAGWGukHbQKP3oE3gnsi1J
         EwehY7OIEo60aaNzGifJnD/gVnHCkThqYEk5HPyanNbQsoPAy/fcuKgtd+Y4hqW16AMi
         8nQX36uxFvsrgWgOCOj0WhPVyw4Z3s+okqmspLf7fPGbirS68uSe4EnyIV3OpOmitLtx
         jEyg==
X-Gm-Message-State: AFuF++lEDWlQnHFnjGNMrBgqfWVH5Y+vbaOQGLxc85iFTje+YeR+2sAf
	J66FAvFa0CbR1vg+MIpdZVqq13nY9EEMkFKwUWK76XWF4lOTFWMCNLNe16ZxPA==
X-Gm-Gg: AYBFou2MmcQzywi0vyMTnQNHfjk5aP9wG/WegtJlqnIzaUTAgXo1ixIfFmTGqfbZqgw
	46Dz2CpfCHIziPdw1BQs3rApkvhxsZMAME4M+ngTfhbklIJZYI17FSQkQyC+eXgWJMH5Xw8ug39
	M44gLCYLv6DV7PVKjfoAiQ8psp2FseCInfnJjVUuHl9DDulJxUEgXvW6UxMSIOLwZDjiKDKu1SG
	UN9+uMYkO5cLuV9wwtyCpZIhKlZsAH0CR7RwLU9W8X3ZpL3vrV0+W+98VTrCK9RGFNOLRpXUbT8
	YYmqFn+NwyPBA625K6HTm7fCa5t46S8VgjYZ3PQtXGW5JjAykGkOfNpxBfRl9MnSTiVUwXjsRGb
	lvnY3TPr9Ef2Pw9CLZiRdRIqp0fxQG/Ja6gFZC9L0cTuzmeBO4cRfl2IG+BM/1Ggf0Ze7nRGxVw
	laYW/0GIAemSCxqURXEn5rv8DPPGDOevA8+ADAT1QEaeerJe4M5i90xU4in8Jbk8WL8EqKPQ0k9
	HxnSit4u5OuQOkWOFFgbaBwyw==
X-Received: by 2002:a17:90b:4a8c:b0:398:9c0c:7c72 with SMTP id 98e67ed59e1d1-39d9c3891d8mr1670997a91.25.1789081836701;
        Thu, 10 Sep 2026 16:10:36 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d98e602d8sm1265496a91.3.2026.09.10.16.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 16:10:36 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][wrynose][PATCH 19/32] unbound: patch CVE-2026-50046
Date: Fri, 11 Sep 2026 11:09:18 +1200
Message-ID: <20260910230932.173913-19-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910230932.173913-1-ankur.tyagi85@gmail.com>
References: <20260910230932.173913-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Sep 2026 23:10:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129937

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-50046

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../unbound/unbound/CVE-2026-50046.patch      | 61 +++++++++++++++++++
 .../recipes-support/unbound/unbound_1.24.2.bb |  1 +
 2 files changed, 62 insertions(+)
 create mode 100644 meta-networking/recipes-support/unbound/unbound/CVE-2026-50046.patch

diff --git a/meta-networking/recipes-support/unbound/unbound/CVE-2026-50046.patch b/meta-networking/recipes-support/unbound/unbound/CVE-2026-50046.patch
new file mode 100644
index 0000000000..018a61cf54
--- /dev/null
+++ b/meta-networking/recipes-support/unbound/unbound/CVE-2026-50046.patch
@@ -0,0 +1,61 @@
+From 513f5e4be89d3b139605dfc31c3fb3728f25be2a Mon Sep 17 00:00:00 2001
+From: "W.C.A. Wijngaards" <wouter@nlnetlabs.nl>
+Date: Wed, 22 Jul 2026 10:13:36 +0200
+Subject: [PATCH] - Fix CVE-2026-50046, Possible heap use-after-free in an
+ error path   when a DoT forwarded query is jostled out. Thanks to Qifan
+ Zhang,   Palo Alto Networks, for the report.
+
+(cherry picked from commit 1ad8d4c39594dcb28d636fb4922737a3640c9a65)
+
+CVE: CVE-2026-50046
+Upstream-Status: Backport [https://github.com/NLnetLabs/unbound/commit/1ad8d4c39594dcb28d636fb4922737a3640c9a65]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ services/outside_network.c | 12 +++++++++++-
+ services/outside_network.h |  2 +-
+ 2 files changed, 12 insertions(+), 2 deletions(-)
+
+diff --git a/services/outside_network.c b/services/outside_network.c
+index 2b7f7d0a2..bc65d36f7 100644
+--- a/services/outside_network.c
++++ b/services/outside_network.c
+@@ -195,6 +195,7 @@ static void
+ waiting_tcp_delete(struct waiting_tcp* w)
+ {
+ 	if(!w) return;
++	free(w->tls_auth_name);
+ 	if(w->timer)
+ 		comm_timer_delete(w->timer);
+ 	free(w);
+@@ -2489,7 +2490,16 @@ pending_tcp_query(struct serviced_query* sq, sldns_buffer* packet,
+ 	w->cb = callback;
+ 	w->cb_arg = callback_arg;
+ 	w->ssl_upstream = sq->ssl_upstream;
+-	w->tls_auth_name = sq->tls_auth_name;
++	if(sq->tls_auth_name) {
++		w->tls_auth_name = strdup(sq->tls_auth_name);
++		if(!w->tls_auth_name) {
++			comm_timer_delete(w->timer);
++			free(w);
++			return NULL;
++		}
++	} else {
++		w->tls_auth_name = NULL;
++	}
+ 	w->timeout = timeout;
+ 	w->id_node.key = NULL;
+ 	w->write_wait_prev = NULL;
+diff --git a/services/outside_network.h b/services/outside_network.h
+index 0a77e3388..81ebfe3e2 100644
+--- a/services/outside_network.h
++++ b/services/outside_network.h
+@@ -412,7 +412,7 @@ struct waiting_tcp {
+ 	void* cb_arg;
+ 	/** if it uses ssl upstream */
+ 	int ssl_upstream;
+-	/** ref to the tls_auth_name from the serviced_query */
++	/** owned copy of the tls_auth_name (malloced) */
+ 	char* tls_auth_name;
+ 	/** the packet was involved in an error, to stop looping errors */
+ 	int error_count;
diff --git a/meta-networking/recipes-support/unbound/unbound_1.24.2.bb b/meta-networking/recipes-support/unbound/unbound_1.24.2.bb
index 28214dea19..cc380f6ae0 100644
--- a/meta-networking/recipes-support/unbound/unbound_1.24.2.bb
+++ b/meta-networking/recipes-support/unbound/unbound_1.24.2.bb
@@ -29,6 +29,7 @@ SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=https;branch=master;t
            file://CVE-2026-44621.patch \
            file://CVE-2026-44687.patch \
            file://CVE-2026-50045.patch \
+           file://CVE-2026-50046.patch \
            "
 
 SRCREV = "f6269baa605d31859f28770e01a24e3677e5f82c"

