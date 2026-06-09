Return-Path: <nitin.wankhade333@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19D8ACD8CAC
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 08:32:43 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.74586.1780993961786216550
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jun 2026 01:32:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=US0VQTgX;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: nitin.wankhade333@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-36bb6d54a56so619336a91.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 01:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780993961; x=1781598761; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YpTzRwOH1EQhfAkEgDqEkq7TbNCOKccd5uRm/JYnFOs=;
        b=US0VQTgX7kkD6w0N57tBYz1d55yQ0kGJ/6zmlp25MIFN3zsJ1+CrRPLkiq83Xh49Pi
         3MXiHYMPyGMeB1pafDQGND5t9PeajsyZdl0v4K2maZ85KnYv0Cq7VDQXFdgVU5IPE1r3
         IYShTqM43SyaI5GAgo1DzakdRPTAhg2A2wSGTNs0bqxKMqZA3aQdm88C4ormluibUSq5
         8DRXia113L8mh+iktSAumcq71FD7ninRQbO5nUIOzGkpVNYZ40HA4j+AYwQVm9lhwQ6a
         LgTHPbK+RPd34p0+sk78cnVEWj/KbQiEGk+SMWTc95F3sd/mKGGtRRveq5LoEU9p+WUW
         kpTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780993961; x=1781598761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YpTzRwOH1EQhfAkEgDqEkq7TbNCOKccd5uRm/JYnFOs=;
        b=SPxKs8rL95ar8Hp67m0NjIzWcdtYPTZq9BJmIOGJDSAEjCdT2rK0ELgeqz3yx0D9gA
         sk+4CsNhA0sJb0N9CfIiXiT5EqfAiPbHtjpDwjgdrLJVk8ySEGwB6o3yWDg4SYRQwz6G
         PWqhk9urGpkpaMBt+gsh9ycRa4tl5iRWy/ZYGjvspVwjl58SGu8n2KqAezH+ua65vnEt
         +hRe/96dV/liFdb/qJsP7dyiNNMKj10kOjxQNzCQqQRdQDu9vX8vAgrCVnOnD6zFTCkt
         ozSm6jXI8j2gW7qPia4GjUJiDivuvomCybCC8mnrlfz6jQEe9tGDKDcouzWARBO2c/QM
         VueA==
X-Gm-Message-State: AOJu0Yzck3yFMyceziO0hLWfYPssgqa+/jIjcsR8MngXQKEqfzmQskc5
	FwVQvRj7CHbTc9mTMFL58OEfOLOT+3qSZ25opngUEZ6Bs+xMDo+n4OLJCUl9onvogl6Pcw==
X-Gm-Gg: Acq92OEBpygO35BOq5W/TaQ3cIuDqbGojBRzXqfMozuUeh/LE4yluDT9dzliXtIt8gy
	U0HH9q9+8HtAODbyc2XvDh5x0YN4hBR2CGI2jhhg/dcFe3FPM014tH0Qy0SRu3tmg05r/ogHmxi
	G0BQDDJ1H366MfPKlHYIsEws7rONcMkezREsgh+vqcvlBeVKTOQq9G8kGEVYh6WUMOQ3Kt6qCWm
	BG5JcPBEPuScApFsix1gWze6o+yGPYD7BOkMKKSJP2FuuBjCBIAOyDddFofUL9DpgtftCHENpW2
	CyRgwPeRIRUdd27n94GhL5y3Q7duK4V7mcp59X/l8i0EZoymwotQAr9zc0gKYGrx/Y1FCjpDJ6+
	GwYxYiIH4nDzyjp2k/gVB7S2Vx1dfSXS00KBYaVz2FJ8Ztc0U+9K3ymHyR5aEtwNCWotKJXU5av
	QJ6UozGNFUHyCiWZBpaHvjDxdvg+CvFUlBx91yXm5XgzUEuA8/N2T4HmnP99+URw==
X-Received: by 2002:a17:90b:3512:b0:365:d912:a4ad with SMTP id 98e67ed59e1d1-370ec0f4371mr9402150a91.0.1780993961142;
        Tue, 09 Jun 2026 01:32:41 -0700 (PDT)
Received: from L-15597L.www.tendawifi.com ([36.255.86.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f6bf903fasm18196212a91.2.2026.06.09.01.32.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 01:32:40 -0700 (PDT)
From: Nitin Wankhade <nitin.wankhade333@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Nitin.Wankhade@kpit.com
Subject: [OE-core][scarthgap][PATCH 5/6] strongswan: Fix CVE-2026-35332
Date: Tue,  9 Jun 2026 14:01:03 +0530
Message-Id: <20260609083104.869512-5-nitin.wankhade333@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260609083104.869512-1-nitin.wankhade333@gmail.com>
References: <20260609083104.869512-1-nitin.wankhade333@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 08:32:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127442

Upstream-Status: Backport [https://snapshot.debian.org/archive/debian-security-debug/20260422T125423Z/pool/updates/main/s/strongswan/strongswan_6.0.1-6%2Bdeb13u5.debian.tar.xz]

Signed-off-by: Nitin Wankhade <nitin.wankhade333@gmail.com>
---
 ...accept-non-empty-ECDH-public-keys-wi.patch | 51 +++++++++++++++++++
 .../strongswan/strongswan_5.9.14.bb           |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta-networking/recipes-support/strongswan/strongswan/tls-server-Only-accept-non-empty-ECDH-public-keys-wi.patch

diff --git a/meta-networking/recipes-support/strongswan/strongswan/tls-server-Only-accept-non-empty-ECDH-public-keys-wi.patch b/meta-networking/recipes-support/strongswan/strongswan/tls-server-Only-accept-non-empty-ECDH-public-keys-wi.patch
new file mode 100644
index 0000000000..054d34933f
--- /dev/null
+++ b/meta-networking/recipes-support/strongswan/strongswan/tls-server-Only-accept-non-empty-ECDH-public-keys-wi.patch
@@ -0,0 +1,51 @@
+From: Tobias Brunner <tobias@strongswan.org>
+Date: Fri, 20 Mar 2026 17:38:07 +0100
+Subject: tls-server: Only accept non-empty ECDH public keys with TLS < 1.3
+
+This prevents a crash due to a null-pointer dereference when processing
+an empty ECDH public key.
+
+The previous length check only applied in the `!ec` case, so in the `ec`
+case, the access to `pub.ptr[0]` was unguarded.  If a crafted TLS
+record ends with an empty ClientKeyExchange, then `read_data8` sets
+`pub` to `chunk_empty`, causing a null-pointer dereference.
+
+Note that if some data follows the empty ClientKeyExchange, this just
+causes a 1-byte out-of-bounds read that has no further effect as the
+TLS session is aborted immediately.  Either because the read value
+doesn't equal TLS_ANSI_UNCOMPRESSED or because the empty public key
+is rejected by `set_public_key()`.
+
+The referenced commit that introduced the pointer access, added the
+check for `pub.len` specifically to the `!ec` case, while the pointer
+access was initially unconditional (probably because the code was just
+copied from `tls_peer.c` which processes ECDH public keys in a separate
+function, so there was no `ec` flag).  The latter was fixed a couple of
+days later with 7b3c01845f63 ("Read the compression type byte for EC
+groups, only").  However, that commit didn't change the length check.
+Anyway, it's possible that the original intention was to add the check
+to the `ec` case on the previous line, or that there was some confusion
+with the parenthesis and something like the current code was intended to
+begin with.
+
+Fixes: e6cce7ff0d1b ("Prepend point format to ECDH public key")
+Fixes: CVE-2026-35332
+
+CVE: CVE-2026-35332
+Upstream-Status: Backport [https://snapshot.debian.org/archive/debian-security-debug/20260422T125423Z/pool/updates/main/s/strongswan/strongswan_6.0.1-6%2Bdeb13u5.debian.tar.xz]
+Patch is refreshed as per the source code version 5.9.14
+Signed-off-by: Nitin Wankhade <nitin.wankhade333@gmail.com>
+===
+diff --git a/src/libtls/tls_server.c b/src/libtls/tls_server.c
+index 7b2238e..bffc01c 100644
+--- a/src/libtls/tls_server.c
++++ b/src/libtls/tls_server.c
+@@ -857,7 +857,7 @@ static status_t process_key_exchange_dhe(private_tls_server_t *this,
+ 	group = this->dh->get_method(this->dh);
+ 	ec = key_exchange_is_ecdh(group);
+ 	if ((ec && !reader->read_data8(reader, &pub)) ||
+-		(!ec && (!reader->read_data16(reader, &pub) || pub.len == 0)))
++		(!ec && !reader->read_data16(reader, &pub)) || pub.len == 0)
+ 	{
+ 		DBG1(DBG_TLS, "received invalid Client Key Exchange");
+ 		this->alert->add(this->alert, TLS_FATAL, TLS_DECODE_ERROR);
diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.9.14.bb b/meta-networking/recipes-support/strongswan/strongswan_5.9.14.bb
index 41a4de845f..f65a94dd73 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_5.9.14.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_5.9.14.bb
@@ -16,6 +16,7 @@ SRC_URI = "https://download.strongswan.org/strongswan-${PV}.tar.bz2 \
            file://pkcs5-pkcs7-Avoid-NULL-pointer-dereference-when-veri.patch \
            file://libsimaka-Reject-zero-length-EAP-SIM-AKA-attributes.patch \
            file://constraints-Case-insensitive-matching-and-reject-exc.patch \
+           file://tls-server-Only-accept-non-empty-ECDH-public-keys-wi.patch \
            "
 
 SRC_URI[sha256sum] = "728027ddda4cb34c67c4cec97d3ddb8c274edfbabdaeecf7e74693b54fc33678"
-- 
2.34.1


