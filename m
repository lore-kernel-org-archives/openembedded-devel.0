Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19434.1793108994314901518
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 06:49:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=UC2Cwtvc;
 spf=pass (domain: konsulko.com, ip: 209.85.128.47, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a215e64962so33684255e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 06:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793108992; x=1793713792; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CICKa/XNB8zQVTrhx6329pxTZ9ff7UGufDo5LZmfQoY=;
        b=UC2CwtvctaxwBES9/srWJUXMLUAwiP3VLWNmCVrnQXoOgcPKM0XhrmFGnrMRMLSVyP
         dGYXwmfsU7x+xexs7MiYBmMTYPRSOfxtXt+JqGbM2ckhvePQH/IgXQHYBUKZR0VXix+p
         qShByG2FLaAqtH5Pxc0hOco1swjX7iLqIhTA4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793108992; x=1793713792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CICKa/XNB8zQVTrhx6329pxTZ9ff7UGufDo5LZmfQoY=;
        b=v6CVOlT5/hbz3S3jFWAQdNNZb6rYbltz9bYV6k2oOa7m8dm3mj4W/aDLsPSMr8xSaM
         kHqW5KxaMBGIlj1FGkpyUEjcGhjTykGpGHPeoZk6bGDO2Bdt1v6xjU9GRRIFdzWufkKS
         MDdSmLgdHhbFvzi0d5ad3KW+fbZrk8TcjQta7TldiRvScjxClFKOY/x8+RKOquapWknR
         7i6sz5irLPOSIUyi72B225CAnd+TtR8AIGqg09Ga5xFrnUxrPMut/+2swR/XOsh17BiI
         cVeHr31xHxKQX/tWMMDWmmZX1VzTyfET758oEgp2UMfspAj3XzKKjT2jJjG+VT7/cHPU
         QWuQ==
X-Gm-Message-State: AFq9FYLvzmbfdFB483c8pUAiKg4QaBchDPJMYWwfCIB4H/1OGRPCsB6r
	XYYmktYkSRQTO5UsBmo8VAFTiBScEJ/53bGRG4juSTp9PxWb+CxnvJGjqpj1A49GgcLn+9xjjfZ
	QF1Dc
X-Gm-Gg: AYBFou1Q3N44E/8UtzJo+rUTgGrKzIaZVBX1h5EErJ7hmK/vCe63pJ4BHvpadwh14m4
	j7jTPGKgKWAWmntAv6I56krCcN6cg9poS6Q+rMRXF2RcyHJicqif6L84UHZtGMYCDpc9UFRxcXD
	vZ5DF1b1t/HKFGGu1DKH1XGLdTdUeplpfs4Yfc1SshbRqJx10sfDXh2IgMr09B8lgTwUI4VHMrY
	IoUhuwn5C4eeUdZ5l4+01HYUJ0n3A4rAErubqC1jfwH3hMoVedRWNvw/sLSpaEhVDu/85g+hyGM
	UlJDsSPTOa3qzGqDc7mpNrvnw7yUuLkTS19iIyqRe1sEWCGohlGS8NdMjXeueCvH7TEBPE5jo94
	+6+5q7+oLvh3xtYwdMNmdCE1g3ah/QGy9c5q/bXWqu3MXW4sOoQpBYW5om0l2WgkViENP+KUIT0
	2+btxw86Kw5ApN6ykq1u52/NHUFHarbyj9s72KmVVIXWMzGKsOd0iFVP/ciupbJzC59Tryxad9s
	WdjKZxfxB9MMPHYAk6EVPGbnm6tWLl/RQn6CSlSoKUlcHVXAoArkq6jllDopgeKrctwUo1in0KR
	69B3TdkYJ4SK+jhJ14r+N05fYshkNRVU8uBdK+4nL7/3fkipbUXt/bLGZb9dwurCUESPejEcgKz
	vMA3u
X-Received: by 2002:a05:600c:3d8f:b0:49f:e8bf:8f9b with SMTP id 5b1f17b1804b1-4a35ac48640mr168909345e9.4.1793108992464;
        Tue, 27 Oct 2026 06:49:52 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a0bae01sm330941335e9.7.2026.10.27.06.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 06:49:52 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-networking][PATCH 7/7] weechat: Upgrade 4.10.0 -> 4.10.1
Date: Tue, 27 Oct 2026 15:49:43 +0200
Message-ID: <20261027134943.1011404-7-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027134943.1011404-1-leon.anavi@konsulko.com>
References: <20261027134943.1011404-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 13:49:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131536
Content-Type: text/plain; charset="utf-8"

Upgrade to release 4.10.1:

Bugfixes:

- irc: fix memory leak in SASL authentication with mechanism
  "ecdsa-nist256p-challenge"
- irc: reject an empty SASL challenge received with mechanism
  "ecdsa-nist256p-challenge"

Security:

- relay: limit size of data queued for sending to a client to
  prevent memory exhaustion
- relay: reject fragmented, compressed or oversized websocket
  control frames received from a client
- relay: limit size of partial message received from a client to
  prevent memory exhaustion
- script: reject script names containing path separators in the
  scripts repository file to prevent writing files outside the
  scripts directory
- xfer: fix comparison of status in search of transfers, preventing
  a remote peer from starting a file transfer that was not accepted
  by the user
- xfer: limit size of partial message received in DCC chat to
  prevent memory exhaustion
- xfer: remove path from filename received in DCC file transfer to
  prevent writing the file outside the download directory

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../weechat/{weechat_4.10.0.bb => weechat_4.10.1.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-irc/weechat/{weechat_4.10.0.bb => weechat_4.10.1.bb} (95%)

diff --git a/meta-networking/recipes-irc/weechat/weechat_4.10.0.bb b/meta-networking/recipes-irc/weechat/weechat_4.10.1.bb
similarity index 95%
rename from meta-networking/recipes-irc/weechat/weechat_4.10.0.bb
rename to meta-networking/recipes-irc/weechat/weechat_4.10.1.bb
index 286d474c83..00030452dc 100644
--- a/meta-networking/recipes-irc/weechat/weechat_4.10.0.bb
+++ b/meta-networking/recipes-irc/weechat/weechat_4.10.1.bb
@@ -8,7 +8,7 @@ DEPENDS = "zlib libgcrypt gnutls curl aspell zstd cjson gettext-native"
 
 SRC_URI = "https://weechat.org/files/src/weechat-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "c3a7e7c6a5401dde9a46d0264fa44aa3032ca98aa86410c454d3de5c69505c54"
+SRC_URI[sha256sum] = "b8744c6f5dc5543062791f563e0516dbc96a36161e1a03c468b3b7dcc8be5aff"
 
 inherit cmake pkgconfig python3targetconfig
 
-- 
2.47.3

