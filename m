Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2173.1794589405759363958
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Nov 2026 09:03:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=z+Ua61uu;
 spf=pass (domain: gmail.com, ip: 74.125.82.179, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-37198ed3727so2584784eec.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 13 Nov 2026 09:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794589405; x=1795194205; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y4TxymbYhBrw3BbTEHCZ4xdvAvEDF+a1y/hw+qyYfz4=;
        b=z+Ua61uufVLB2w/mygdpxfwqfkwdIALVPGcBMDHZJSr6c58JMuOPi2YYdAaBDEcQ/J
         EiTmJ9InovZTm7gQC5zKz98CtJuJ0/Rfnk1xw/XN06cvtNfI6uTj5G8HGP7n26wN5CFE
         LUn2zkYytdwhqNY5YCssEDzFiM/SQwrEBCrFeKNq0w8cfi9MF+g/fF7YmEJavEhHDN6J
         gbuAhSyD2uIX09+/+T+vuDe6UIDx8kc5q3pFYXtax9UBBP6vPQy0tz7JhJqLQkYwzZH3
         jpW/B1mYsMuaDip5sZvQjE6rxIL+YAml/Y6BD5P1lVCac4i3AQ7KZuJi8ImlzrHgZbti
         RXnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794589405; x=1795194205;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y4TxymbYhBrw3BbTEHCZ4xdvAvEDF+a1y/hw+qyYfz4=;
        b=GHXTxMZm/TXDiNqirPvD+sqVk0/uPavXzu05kE9PI8eJNbC9j54SPPH4gpc39a28RX
         0k7rjntEOrybE/m2IQe+2t5JaS6LjlorrcygEDwMJJp7RMoGk+fJycqJeU9JOx8+Hkqs
         oGPoigABS/ISa8cscjOFyUoHyboLL5au1YdjGg7qObeakzokzOTdJpAcMd+yzdm88Pc5
         NExlt0J2zq0Opln23GIg3gC0ZmfBFbgFYOrpBBocGdGds6w0R+E3hUqjWpTcmpWmT/rp
         UHNTrk2HAnfZM4+0o2zm3sngRuyfZ/IbmIfXeWIuHOFJ4wSX10vuys3NCDYvPd7SrDB3
         fmKg==
X-Gm-Message-State: APuU4Z8x5LjLQlHKabBKu5svhKnlhiaM3hf1RC00+XPD8tIUfcOMtvfU
	pz7qMW8eGX/BPPiDZrWfdHvnSYqbiOX3eoM7MbQOY7QPHxzjJk6+wvZQkkCAvroEMNLPb2KX
X-Gm-Gg: AYBFou2zU2OXfqkIak4jF5xljeynsp8/UXrWVPZaP5D+sqrxwamcndq/g/8JkaC8Cyn
	2y6UI5fEeJYDqH2UsTmUSnICRC6mIIqlUq18udHyejqnlhOvLeJlXl7rT7Wmp1nJtIBRfZj51J/
	9USA1WNpTQLHFv3qWa/XCgAFI4Bv1vgU/DikZ5sSGM6xA5UCCMn+PXyYiAY1uzMFVIHu7Ly9Yzy
	Av0GjWbmUvV/ciW5W6Arw9XuLlvBa6VzsLU2IeyCLVXAfHPTyqPhpXu0q+mF9ymhj0GWM2tZ5KT
	lUYmXTXZF+XPNISgAVNlAvAASEGJ5VhoNKPZ42EcTspbpDWOpcW6plDHsBymQvse5Qw50jNxLdJ
	dm2kHNriHmOBlFpZZPNjOnMw/k/hsCRzvArMUVFLUYhMj/6f88Z0e7AvEz2rIrZnyEmwV/0yR4g
	AC2qcct1JhWVfwHF/ZBs/2sX85e3AsYDU/5CgzKw299V1buuTjDT98Rd6RzyHH5ffuLH6J18rLb
	XI5tmNndK2hBQgSjvlNcWPhGIKuVqSgYo63wn7g3oS8A8Cme6Qc5vlSksJ4wvvtYpB0v/Tgbi/j
	OEAr5PFPV7Gqe4w4W4Ylvr0boCChMm/DhhihPG/BonlxWX5Expa2tecnhz36mHNtUX/PVmHiEGm
	LyvIUZ7rAE2kVkBDD6MsWr9kV/T7jRm9MEA/hpcNaTIhFgajkcEImx9+MLus995qLSUMOc62oid
	GhGjIzcv0K93a5J6F0hnF0bRhLHfaTiO3qP9Niw/DAT3FRWXQE807+5Jvy/sJ5jl+saF6GHzKeT
	r8yUYD2VM/wLNjqvJ0QeN5tWmX7Wfy/JDAjPxjrj06zvvIw2IzF2lMcbMr/uXfITSdcb5GBaWB7
	Zio9
X-Received: by 2002:a05:7300:148c:b0:361:a195:c46e with SMTP id 5a478bee46e88-377de5f761amr8278563eec.1.1794589404829;
        Fri, 13 Nov 2026 09:03:24 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795533170csm9068615eec.7.2026.11.13.09.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 09:03:24 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 1/2] python3-scapy: Point SRCREV at the v2.7.0 commit
Date: Fri, 13 Nov 2026 09:03:21 -0800
Message-ID: <20261113170322.1425186-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 13 Nov 2026 17:03:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132250
Content-Type: text/plain; charset="utf-8"

SRCREV was set to the v2.7.0 annotated tag object instead of the commit
it points to, so it did not match what tag=v${PV} resolves to.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-networking/recipes-devtools/python/python3-scapy_2.7.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-devtools/python/python3-scapy_2.7.0.bb b/meta-networking/recipes-devtools/python/python3-scapy_2.7.0.bb
index 4995f8e2cd..4e4eedde81 100644
--- a/meta-networking/recipes-devtools/python/python3-scapy_2.7.0.bb
+++ b/meta-networking/recipes-devtools/python/python3-scapy_2.7.0.bb
@@ -16,7 +16,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 # If you want ptest support, use the git repo
 # UTscapy does not exist in the pypi pkg
 #
-SRCREV = "1de09fe85fe5c9d60ea5c6de130374e170b5bc28"
+SRCREV = "40fc5ecf9e69e9bd76664d63ae133d4973fcf81b"
 SRC_URI = "git://github.com/secdev/scapy.git;branch=master;protocol=https;tag=v${PV} \
            file://0001-python3-scapy-skip-ICMP-regression-tests-in-ptest.patch \
            file://0002-main-initialize-banner-for-the-default-Python-shell.patch \
