Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48040.1795411869988424452
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2026 21:31:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=dQF4bl58;
 spf=pass (domain: gmail.com, ip: 74.125.82.172, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3282db206d3so8807017eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Nov 2026 21:31:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795411869; x=1796016669; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BvpQzgDKXMaJYXVlt0rJUfTm52yl2FlINHPr4qhYjaM=;
        b=dQF4bl58ms0GxR89UdyScL2VHUTFgRkMukh19AJeX/0jiITayJYKvhht3taz2YmcfG
         SdvC7KUNLe91SapjQar2O1N0qGxdOTiw6VzX4KX7MyDjj1BoKni8TY1JwBi9jhaCRpjZ
         ynNg0wkXKsh/UP8WuN4wuT3eYlxkc5vup/w6UKBKu5rtHbV3t1KbvLZPmWVg1AfkiA+O
         8FlIQiy8UGqRX9xuVlzqnOtvtlxmG0t5mibxpDNOcGv82hJB9IF2GJSrdhI17l0tvijD
         XCKUWQPnN4cPmOkJUVJsPl1J78pPev6yauT0MoWa9wUoOGnjaIFPlcnrv9FCuO+KgMak
         dFtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411869; x=1796016669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BvpQzgDKXMaJYXVlt0rJUfTm52yl2FlINHPr4qhYjaM=;
        b=O7yUIEIMGM8HBz+UzqRigQvvuEmO//mXSrChiYN+vxqNAXuNrYpa7A6d1FfFPMp2Mw
         hIXViZDw+T9Zv+JMCLHf59dRHOQtCumSxtEXzQ7Bxkk8conqdSI6Q4VcL8C0MpZJxElf
         uZ7MP9NFJbeD06Us89qmBOhMCNEfcW+uPU2WKGTlWYh4KgyKogM7t4qoQ5sQwC0voJOl
         lnl9pIk9qsC71qBAhjAqcwZkW8YTwCGubRnkQ0tfFtso7xL9jfIQFZlNEosuAcHbBUIV
         y5obqU3McF5gGdagAjZnBA2xlDu/zjU4AMKFwD2Z3LU71j5vyNOZ5Vpj1Wl/KV4k7qwt
         k/cg==
X-Gm-Message-State: APuU4Z8A+bMstllm2n05zW2CrClT1zHiHO2fH4bK9FINGxjFPxWRu8/A
	MWdu2taSigVXCFCfO7XiQ9ERc4qJrLQqBPaHs+oMmD9eUTfW+2k+RW5MvVebHX3ZlNU=
X-Gm-Gg: AZFdTZffKCj47A1B//EXEsWr9v2TmEwHZDXB2WINOv43nKvwQgq9lKNwQCKzdO6uhb2
	6QKK9R3MTnZ5tNlLZPuIqdPbuHXzBSsbpCQ3+KyotrG1fVDx7/mwgauWMcXdGnMO3B2D5VRlHaP
	BBaE/vyP39IIyOizasWNIZhiayuChbI2Dnb2akVHI3egpagSJl+78n/PGsZ9hbSkihQYrSFdcdS
	rqBZ7iszqRLw85n7WjLDXnh67zPf4za7N/Wzg4n/BzawWCvRdfgyWRrS4O24frVWAB4Fk/Ayl8d
	M4qb8VUK+Gdb8AFCAYtBE3SqoWyjp36BFRvyM33+U98oFT/+gorGRyE5Qwd2xL92j93oB2QXzeV
	09VzYa7mcDumrFssyfvxjLi+b5k0q7MjDmoSKICf6IWDVYnHCheNNiPOaoDQS73Hl62g42PvlXi
	9AevNozIa6YPBqX95HFlc2Sx4cZjhIigYEC6nFxwphYVw4alZRD8VflIUnVR/fqGSLkCVzhGSjK
	p5GqIc2OXxUMnu/3ibymtNey7L4eqAE73vyNd9Mss//T5W2Otd56MmwTXoB3vmS0DSxgclVDep7
	m/1CVCd0HVBT/mImKEXbbTM/OMnK3euTLaSmDM19fxkOzUO/TWlKr6lIn8f3EbFw77X+xxcch0m
	UMKe7/fHOTGQzOxzQVH9CoXjd2AtXXznHJjNwJ0zLxeAYwa3LQ02YfwpRPBuM5S37q1gmU8FXr0
	Hhkc/wDSeEgQ56whm4cBm0KcTR/TA5laZ/TNe5oRctpizRm3WsIAd7Bo7cRDQzwXQPBeG32Jhvk
	jcfzwxDZbh4Nm2hIGn+KsJylat8/SLxiYn/meVPTglpuAQI/hwvm+avZw5SJOh0Nf5epLuNOfaL
	jXO1
X-Received: by 2002:a05:7301:150b:b0:36d:a466:9d0b with SMTP id 5a478bee46e88-3856ef47c9dmr10885548eec.19.1795411869309;
        Sun, 22 Nov 2026 21:31:09 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm36573136eec.26.2026.11.22.21.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:31:08 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 32/42] rsyslog: upgrade 8.2606.0 -> 8.2610.0
Date: Sun, 22 Nov 2026 21:29:16 -0800
Message-ID: <20261123052953.3658549-60-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
References: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 05:31:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132847
Content-Type: text/plain; charset="utf-8"

Includes releases 8.2608.0 and 8.2610.0:
- New outputs omkinesis (Kinesis Data Streams) and omawslogshlc
  (CloudWatch Logs HLC); new imkubernetes input
- omfile: dynaFile paths are now confined below their base by default
  and a followSymlinks setting was added
- Queues: segmented disk-assisted storage, experimental producer-local
  queue scope, and fixes for lost disk-assisted worker restarts
- Optional strict input startup policy and generic output rate limits
- OpenSSL 4 support and many bounds-checking and TLS fixes

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../rsyslog/rsyslog/disable-omfile-outchannel.patch        | 7 ++++---
 .../rsyslog/{rsyslog_8.2606.0.bb => rsyslog_8.2610.0.bb}   | 2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-extended/rsyslog/{rsyslog_8.2606.0.bb => rsyslog_8.2610.0.bb} (99%)

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/disable-omfile-outchannel.patch b/meta-oe/recipes-extended/rsyslog/rsyslog/disable-omfile-outchannel.patch
index a8bbe2b51e..a58fa4cadf 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog/disable-omfile-outchannel.patch
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog/disable-omfile-outchannel.patch
@@ -9,10 +9,11 @@ Patch is also applied in void linux
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
---- a/tests/omfile-outchannel.sh	2021-03-09 05:51:07.000000000 -0600
-+++ b/tests/omfile-outchannel.sh	2022-05-26 15:55:23.358520256 -0500
-@@ -1,5 +1,9 @@
+--- a/tests/omfile-outchannel.sh
++++ b/tests/omfile-outchannel.sh
+@@ -1,6 +1,10 @@
  #!/bin/bash
+ # SPDX-License-Identifier: Apache-2.0
  # addd 2018-08-02 by RGerhards, released under ASL 2.0
 +
 +# This test fails for x86_64-musl, under GitHub's CI/CD. Disable for now.
diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2606.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2610.0.bb
similarity index 99%
rename from meta-oe/recipes-extended/rsyslog/rsyslog_8.2606.0.bb
rename to meta-oe/recipes-extended/rsyslog/rsyslog_8.2610.0.bb
index 12036e32a8..caee233b2d 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2606.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2610.0.bb
@@ -30,7 +30,7 @@ SRC_URI = "https://www.rsyslog.com/files/download/rsyslog/${BPN}-${PV}.tar.gz \
 SRC_URI:append:libc-musl = " \
     file://disable-omfile-outchannel.patch \
 "
-SRC_URI[sha256sum] = "2574b3f3068e6955eb94ef5643e2b6a5b8585cc8eaa77209ff5cbc1e2e5f71e5"
+SRC_URI[sha256sum] = "7bdf95e81ea6c0ee5d586342d57d2a6e395b089fb3c67318a0dc555816de404b"
 
 UPSTREAM_CHECK_URI = "https://github.com/rsyslog/rsyslog/tags"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
