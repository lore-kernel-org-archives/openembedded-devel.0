Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 582C5CCFA05
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 12:45:31 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19514.1762173927004820161
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Nov 2025 04:45:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=DzqY7N1J;
 spf=pass (domain: mvista.com, ip: 209.85.210.176, mailfrom: vanusuri@mvista.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7aa9be9f03aso869907b3a.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 03 Nov 2025 04:45:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1762173926; x=1762778726; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GANAdEpAXNQBQr3pY0oqwv1hcEN4zSQCKHz9fYDs+S8=;
        b=DzqY7N1Jvog5A65eafKuOKOwvPtVWBG9S++BoHY5+uPygLzC2s9XiG5xAFydoC0oD/
         gSh3alPholELJCNVeHbmY+ZdIkjPQaUWGgVHBMmtMJvOOfpydEse3Uz1gZze+KMYv5cb
         urHWBwtQjSQq0K1qxzjpHKazYc6LOh+rX5o+o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762173926; x=1762778726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GANAdEpAXNQBQr3pY0oqwv1hcEN4zSQCKHz9fYDs+S8=;
        b=X5PbeU7h+H5Iy1HxUTwlYV+KZQVclSqeVAjUyWdT/zqz59/ehNo6CjRYDYRisULqHE
         9a63B4J1Nz7rAXWTqLfB99gQUDbUVefwzlDMQLeryoX8QxLTgcVRI218Tl5WN3utnci4
         moKYI55gdWy5yX0MvtcM+vQGnHgUNuzdtYR7TKaga8yCKy2ndEvDBmT1p+L8w3X+eq2D
         WxjmNfE0pL/YlAp0+CNXk0nKGLdLtTHBrJByjryXgMPg602Yntm7Fp+kzSkuaVX3L8ZF
         ztDpg/8HQlpyzZFSyAEocSTvaHT+1RzD/Kp39taEwEI/Co/4PoVa6PiUuNmOjE5+z17g
         KMvg==
X-Gm-Message-State: AOJu0Yyw7i/OGdRdDEepnJzKoBqhik1x3H3Lz2Z7tCvle/qS9T3TxIN3
	icTXqbhb/zEc2wPexe0WHAsUn/Jyu1la6nUU9Qqgh6Wrm/GdGJefYIc/Eg6iF9sCNOmuPQWdTFS
	TD5jnvQ8=
X-Gm-Gg: ASbGncthpT5YcDE43SVemFYzrzjOkhPKVgfG3C9XmPReeYmlT6FAqmaNxxAi6AP24r4
	f0dzDGJVipDmEErn7jsB3Yy4yDWPDkIomKfqEZvQk9ZMTwdcqDg3MeNrwu4N96Tq46+aIwnGOTW
	jsSvW02DVFkZey4o9ZdPnpiQOT+eq9aeU+de1MUUenjkQkm/VOxouEMaAPKi3shB18vYgtRmF7M
	aQKwA5pPz5tip+YGtPCjs/JtBJSJfO7RNFdHCiRbAIbFudob2NpM26nijOwJa17LfyD85J9NM9E
	Z27ijekRC1DUeUD44vzD8zKc5xlIMH55qVUVeAXWXUwMckccRiMXlyQpama6VuBzd+DR0Cbc0XZ
	SDlwXzKMzouZy3q3kWkWjipdq0ro4jW7bYXPYKcE66JHtlzNUON/KE1Vp+NCvx/0pIw2+87UgbY
	2zPQ==
X-Google-Smtp-Source: AGHT+IFXZyn2rIHv6UkArp4Y54o8xAzJPi3Q9VTWOyk0rgoxUXjujlIyRpgTpcr53v1NHbV9/rr52g==
X-Received: by 2002:a05:6a00:3d06:b0:7a2:6fce:19ba with SMTP id d2e1a72fcca58-7a7792c8644mr13126653b3a.22.1762173925836;
        Mon, 03 Nov 2025 04:45:25 -0800 (PST)
Received: from MVIN00352.. ([2401:4900:8fcc:e57e:9b81:ad4a:f564:be77])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7aa2819641esm5454076b3a.26.2025.11.03.04.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 04:45:25 -0800 (PST)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [oe][meta-networking][patch 2/2] wireshark: Fix CVE-2025-9817
Date: Mon,  3 Nov 2025 18:15:10 +0530
Message-ID: <20251103124510.40771-2-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251103124510.40771-1-vanusuri@mvista.com>
References: <20251103124510.40771-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Nov 2025 12:45:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121271

Upstream-Status: Backport from https://gitlab.com/wireshark/wireshark/-/commit/39daba5e247ea495f88b0be82f0b7ebbdbf50fba

Link: https://gitlab.com/wireshark/wireshark/-/issues/20642
      https://bugzilla.suse.com/show_bug.cgi?id=CVE-2025-9817
      https://ftp.lysator.liu.se/pub/opensuse/update/leap/15.6/sle/src/wireshark-4.2.13-150600.18.26.1.src.rpm

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../wireshark/files/CVE-2025-9817.patch       | 32 +++++++++++++++++++
 .../wireshark/wireshark_4.2.14.bb             |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta-networking/recipes-support/wireshark/files/CVE-2025-9817.patch

diff --git a/meta-networking/recipes-support/wireshark/files/CVE-2025-9817.patch b/meta-networking/recipes-support/wireshark/files/CVE-2025-9817.patch
new file mode 100644
index 0000000000..034c51778e
--- /dev/null
+++ b/meta-networking/recipes-support/wireshark/files/CVE-2025-9817.patch
@@ -0,0 +1,32 @@
+From 39daba5e247ea495f88b0be82f0b7ebbdbf50fba Mon Sep 17 00:00:00 2001
+From: John Thacker <johnthacker@gmail.com>
+Date: Sat, 26 Jul 2025 07:10:28 -0400
+Subject: [PATCH] ssh: Add a null check
+
+Fix #20642
+
+Upstream-Status: Backport [https://gitlab.com/wireshark/wireshark/-/commit/39daba5e247ea495f88b0be82f0b7ebbdbf50fba]
+CVE: CVE-2025-9817
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ epan/dissectors/packet-ssh.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/epan/dissectors/packet-ssh.c b/epan/dissectors/packet-ssh.c
+index 4f2b0ff..9b3b904 100644
+--- a/epan/dissectors/packet-ssh.c
++++ b/epan/dissectors/packet-ssh.c
+@@ -2359,6 +2359,10 @@ ssh_kex_shared_secret(gint kex_type, ssh_bignum *pub, ssh_bignum *priv, ssh_bign
+     }
+ 
+     if(kex_type==SSH_KEX_DH_GEX){
++	if (modulo == NULL) {
++	    ws_debug("Missing group modulo");
++	    return NULL;
++	}
+         gcry_mpi_t b = NULL;
+         gcry_mpi_scan(&b, GCRYMPI_FMT_USG, pub->data, pub->length, NULL);
+         gcry_mpi_t d = NULL, e = NULL, m = NULL;
+-- 
+2.43.0
+
diff --git a/meta-networking/recipes-support/wireshark/wireshark_4.2.14.bb b/meta-networking/recipes-support/wireshark/wireshark_4.2.14.bb
index 6246a1d9fa..bd014055a9 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_4.2.14.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_4.2.14.bb
@@ -13,6 +13,7 @@ SRC_URI = "https://1.eu.dl.wireshark.org/src/all-versions/wireshark-${PV}.tar.xz
            file://0002-flex-Remove-line-directives.patch \
            file://0004-lemon-Remove-line-directives.patch \
            file://0001-UseLemon.cmake-do-not-use-lemon-data-from-the-host.patch \
+           file://CVE-2025-9817.patch \
            "
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src/all-versions"
-- 
2.43.0


