Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 909B4CCF9FE
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 13:30:41 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20542.1762176637876276943
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Nov 2025 05:30:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=E4NXxode;
 spf=pass (domain: mvista.com, ip: 209.85.210.175, mailfrom: vanusuri@mvista.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7a226a0798cso4201656b3a.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 03 Nov 2025 05:30:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1762176637; x=1762781437; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3yn8F2OPohAFm5qaS4yiwAjgOvWFp50xiBz0LNXpHNw=;
        b=E4NXxodeZzOmlWcFHltDr3gSvwJASKVHrCPTU7pIwcrkG1kCSoqZ2qYxvhmCs07cfU
         MfWyG1BK9uDzVryT2JOfp+YBBo47HAlAEAjQYe40gi1suGKXYLITEmUpEnMJYHGHKQgd
         MvRY0sucvgD+q8yKzCD/Q7U1tmqLf/DrR4VG0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762176637; x=1762781437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3yn8F2OPohAFm5qaS4yiwAjgOvWFp50xiBz0LNXpHNw=;
        b=BEYf+hJg6sbN7s0G4gXRlDu45Q1ggqQy+5IdBGY783xumz+W2Th34FZqddXEJLaAiM
         4VdyCfaca3CE4390Qe+OXsmg1hJOAb2yt0ftZZGfg5OoGW4QmNvttJupGHHc2E/ZXm9H
         5evSdPrc6DCwmFLalX8vQlj0I7gQdLEZem7CKnCFTKVFVRUVK1LTJc0SXuVr+bXINxKw
         RaAtbHuhR0/nVQaCJJxN/hmkc2OiJbJhm/6ogFz1fq4thf3Mjr4gLn+HkOwGOoJ1JuM5
         9HlW0Z5InhClPm5/DeGPVtiYc+gOMHazeTvuVJ9PXd4cY0dULNI7Kd85ustK98GNZ0uW
         XU/A==
X-Gm-Message-State: AOJu0Yzpufu9pFq/CSnLUFAjjYocUVSbBk5X+nsdt9WRmPnK9o5sEd4D
	GTeHPsKI36GxaOZHhyzZ1TOOmJeEcbE+hO45wq++mEFT/hfrnHPz3jCKe64ZyvZ3hPmpQNcMKnz
	5ZECv2Q8=
X-Gm-Gg: ASbGncs1W/DXwgwmW59Pgp+bvx+O4s3qMyFxcxn6m2eJOJGlQ32nhe11YBJ+Tv2c7PU
	g0SFpl9PTyaBcs/X5HPUGM0nrUlGZhIcf97KBIXlSX2LRBKMMS4o6Lz/5ElwR5k9EbaabJHyqaf
	Ylyudgn4Kg1gox3/t4v13cTxrwYzO4yLVRgoE+woHZXnGjo5PHSSmMIRNG5E8+qytXzpGR8K1yv
	uWd2KTSFfjkj9BcFWzPRLVaOiyZ2T3KKHR82AUnPscCGwy8cAm09Rn6BCprAQwSI+WQ718JtZvJ
	ShHhzJkqlDId4qM+EqM9SqfUMtMGQDeirPRMI1mOSE2yF7fNZHlWNY13lwzAEMu4+AFyOvPF49T
	B2l1cHCCeE1ycua8q3Q3S9flnXoxNTpD1fdAGg5/ja1PMyjPkRCi/DFkxDm9Yf5GCOutn6Blqm7
	g3gg==
X-Google-Smtp-Source: AGHT+IEsDZ7wLFtL0X/5Hp60KjJdeBB91XJ5T6GGZhUdPI2ZzGx5Xuelqd7mx59MP/IjbBo0nQ5KhA==
X-Received: by 2002:a05:6a20:728c:b0:32b:721d:37ea with SMTP id adf61e73a8af0-348cac86a84mr16812003637.16.1762176636539;
        Mon, 03 Nov 2025 05:30:36 -0800 (PST)
Received: from MVIN00352.. ([2401:4900:8fcc:e57e:9b81:ad4a:f564:be77])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3407ef4c263sm5363095a91.3.2025.11.03.05.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 05:30:35 -0800 (PST)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [oe][meta-networking][scarthgap][patch 2/2] wireshark: Fix CVE-2025-9817
Date: Mon,  3 Nov 2025 19:00:22 +0530
Message-ID: <20251103133022.487957-2-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251103133022.487957-1-vanusuri@mvista.com>
References: <20251103133022.487957-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Nov 2025 13:30:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121273

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
index 0a6e33e08e..63610642ac 100644
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


