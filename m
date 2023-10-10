Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16C0FE95A8C
	for <webhook@archiver.kernel.org>; Tue, 10 Oct 2023 09:39:57 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.87076.1696930792192775942
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Oct 2023 02:39:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=iJnmA5IB;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-40572aeb73cso50218855e9.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Oct 2023 02:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1696930790; x=1697535590; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PE69ZD3BfmPvK7KkiUxS8sA7c4PR4nrXNYvh8HlGDQg=;
        b=iJnmA5IBV8j2sk97Jb2/FRSWyyC9/SYXbryyVs5zjzRjdqEBbRaT4GNBBZlAEU1Jna
         KtUfCeqKumvaHOrbW6mFenZ0t0u21/j7mTtpJfWyblXTSQatm0j1MPe/i6KFyzSYw42B
         KMN4ecPtJ9pqABDdSKzI7P40UBi1PSMXm0gN67UkQ5xDLMWGGt6gWm+Zjje1wS0esNBJ
         X2313VMuyqgj3voaDNF7+ZQtHwDA17amla1yOyMHzR3kX7axlnuYkfyWffQS4VndRbAd
         hlmz8Xb+0LtuyvdafKlW4kY0173kkFxtNuOa9QJaJIh7dMkdzSr7iEAkPdmmLnWBYmDs
         yrOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696930790; x=1697535590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PE69ZD3BfmPvK7KkiUxS8sA7c4PR4nrXNYvh8HlGDQg=;
        b=kYaUsdLQY9BHLvdgt3wcDbR7id9sdl0soTrhsUaqRLBz9UTuolrcmS7mcppxSyWhK6
         UTeVDGrM25wFuU4tuYWgueDFEXHUsaU67MNsGwpeKaofdV3aC+hauQTYzIjJ0nsCwU98
         2lceCXjEUjSXMbMB0Ygn0cBLHHQO+ISws+gHt2JV9DD6prd28qX4ajWhvchsrYrupczx
         p9AjZuxPBMvJdAYxBbWHDcg3Nj6vvXZJd9cxuXtnBVYu3tONiiP6nB2vGZW9Usc5W4nW
         bNFOHMskwDf7oMx5iVujHICY9dWYd9XqTlcW2QrfQtqXfGwgMwfysA7KsNTs0YpB5VNn
         olkg==
X-Gm-Message-State: AOJu0Yx4xEf+jEvNsh27v/YRG9UEg08PgFYyrA/Tu1dRq2c/nzLMWTm7
	e7qtSR5n+y9Ro2eqq6SkLnuCe4jSZ8obqiDaOU0=
X-Google-Smtp-Source: AGHT+IEW+GHQ/UUqx6FXgLraYilLW7fjeyfQz2yCiEJ8b9obr/IxdPFt2Q+AgbvOJGWP/+kTMp2lSg==
X-Received: by 2002:a5d:574f:0:b0:324:884a:5cd0 with SMTP id q15-20020a5d574f000000b00324884a5cd0mr14386786wrw.47.1696930790432;
        Tue, 10 Oct 2023 02:39:50 -0700 (PDT)
Received: from p-nan-fatho.home (2a01cb0584747e00ad7461ecf2f04d44.ipv6.abo.wanadoo.fr. [2a01:cb05:8474:7e00:ad74:61ec:f2f0:4d44])
        by smtp.gmail.com with ESMTPSA id p4-20020a5d68c4000000b003232f167df5sm12150639wrw.108.2023.10.10.02.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 02:39:50 -0700 (PDT)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Fabien Thomas <fabien.thomas@smile.fr>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-networking][PATCH 4/7] Add static-passwd and static-group files
Date: Tue, 10 Oct 2023 11:39:37 +0200
Message-Id: <20231010093940.75037-4-fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231010093940.75037-1-fabien.thomas@smile.fr>
References: <20231010093940.75037-1-fabien.thomas@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Oct 2023 09:39:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105400

In order to pass reproducible tests, recipes that use the
useradd class must have static ids configured.

Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../files/static-group-meta-networking        | 14 ++++++++++++++
 .../files/static-passwd-meta-networking       | 19 +++++++++++++++++++
 2 files changed, 33 insertions(+)
 create mode 100644 meta-networking/files/static-group-meta-networking
 create mode 100644 meta-networking/files/static-passwd-meta-networking

diff --git a/meta-networking/files/static-group-meta-networking b/meta-networking/files/static-group-meta-networking
new file mode 100644
index 000000000..0aada6c5f
--- /dev/null
+++ b/meta-networking/files/static-group-meta-networking
@@ -0,0 +1,14 @@
+ftp:x:630:
+dovecot:x:631:
+dovenull:x:632:
+postfix:x:633:
+postdrop:x:634:
+vmail:x:635:
+rasvd:x:636:
+frr:x:637:
+frrvty:x:638:
+nogroup:x:639:
+ftp:x:640:
+rwhod:x:641:
+lldpd:x:642:
+opensaf:x:643:
\ No newline at end of file
diff --git a/meta-networking/files/static-passwd-meta-networking b/meta-networking/files/static-passwd-meta-networking
new file mode 100644
index 000000000..77c2b36f9
--- /dev/null
+++ b/meta-networking/files/static-passwd-meta-networking
@@ -0,0 +1,19 @@
+ftp:x:630:630::/:/bin/nologin
+dovecot:x:631:631::/:/bin/nologin
+dovenull:x:632:632::/:/bin/nologin
+postfix:x:633:633::/:/bin/nologin
+vmail:x:635:635::/:/bin/nologin
+radvd:x:636:636::/:/bin/nologin
+frr:x:637:637::/:/bin/nologin
+ftp:x:640:640::/:/bin/nologin
+rwhod:x:641:641::/:/bin/nologin
+lldpd:x:642:642::/:/bin/nologin
+opensaf:x:643:643::/:/bin/nologin
+tinyproxy:x:650:nogroup::/:/bin/nologin
+radiusd:x:651:nogroup::/:/bin/nologin
+nm-openconnect:x:652:nogroup::/:/bin/nologin
+ntp:x:653:nogroup::/:/bin/nologin
+nm-fortisslvpn:x:654:nogroup::/:/bin/nologin
+nm-openvpn:x:655:nogroup::/:/bin/nologin
+squid:x:656:nogroup::/:/bin/nologin
+mosquitto:x:657:nogroup::/:/bin/nologin
\ No newline at end of file
-- 
2.34.1


