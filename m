Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10292.1795752841059073829
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 20:14:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=R/RcT7jV;
 spf=pass (domain: gmail.com, ip: 74.125.82.175, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-386b8f2f671so4410562eec.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 20:14:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795752840; x=1796357640; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LDCRd5xAsKzXd+oU/Alf9VUceupwvxySK39iz5KJ9r8=;
        b=R/RcT7jVG8c44247QxeuykSLyWii+tzo16DLRdReb35e2gja8pStxLPAY4b9WVcy4p
         05qHaiW7Ymlg/CdFQabhboScdBaZye+IAyRNZr4LENyrKn7bwEZBtJAwT3So45g69AeD
         F1FEBjngnK/65S9lpdPr3elk4eOReIJLdxP2Txhx5Gud6JFYteYoyoKMF4rmZM8VBxKe
         4momgVlWg7ic4Acddq3IZ2w8EAc1loDfjoOzvy0HlDPj8sh7TEKF9QuWoXIYLVd5f4gP
         iypeeWBToRkYlq/8/qKBkmEd83csXyXzL4bc0Wiknro7AHoa2sVuWsVSRvfPP0Hr5fLc
         2P5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795752840; x=1796357640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LDCRd5xAsKzXd+oU/Alf9VUceupwvxySK39iz5KJ9r8=;
        b=c/xEw+89P2FhCCmUAsOzmG9/Wy6xP2eOqj9WIX2H2CpYt9EMh/Y7IItXw/seDe2DB+
         f1biz4N41TGluY8hx7Cm40yXVbFeJNXOl2P3a1WbBpOmwuwAfLA1wEMhPyK5/MiU+ngr
         IIlhZNz4A7F9jSu6b3sRVxlPjR3wn68D41RFMd6NY+BAv9IAFDNdxJkZvDRO4pSlGYUB
         58k3lMmTemfieX4t6s4rEQjie6N/hjbw5Y50ae591mkcPkaMsxUlgwCZOl58gHkYS/Nk
         jhJztCl6lyiFmmiwAP50K+kwJiFYGCNgHvswdyARKryQuJ7zdMzE/yQpqUDklrA3S1oD
         FK7g==
X-Gm-Message-State: APuU4Z899EaMu7DT6HybMqzwK3bYaZZTYOuqcFAbWCstIraEFMgu3tOo
	sFoQqksrAmus9Bwpo5W6kyVs2xsltoq0qBVwDjEck6MtqHkGSIqHv1vtMG8J4I3k
X-Gm-Gg: AZFdTZe7/ETOR2C9dO5TKnUqZNtJ8ULxQC3Yrng4povhtUoTCcLYQUIgz+WmzPQSWo1
	rdNJcbu7SvpC2CHAkziBVUQQDCGayW8uqdqKZmTGsJQfVXpVaQiBAZ9INJ1R/VU+vyZ0C0c+/r7
	kGpXeqRxWC40aA33zxlaL8O3cUFlWcslusX4vZNiZi/euVMDQ1nlPdR358pRK0Ct1N7xY5HaBSO
	1OjnaWbC4yJBlUD4PnVhTkp86G32PlY7CS/MQ3/G6IjEhKbrbi6E7rnT4hAaPICqEtclxL0IsQo
	W5kCZ2TKNR5eKuT85HVyDolMRYECQA3ZqPYRWnj+63c4SlfHC5jHWFwRkweR+4w8Hs0KmtDvxKu
	ZYNxbkSIRhC800eJ0BAjZ1NhdhZdWVigqqSGWnFZleT24VHyBaVLROSYD4xPN+tLNE6PB1OUqmE
	dHQ5zF0O3IbqjKl9LKyE/2yhj6iKRUrl5VJG8ihSdrG9BoW5RXO9SA1dzW3DTK4pWW+qSZdwyc9
	NhPbS78xo9JlA7FShbQS6QfeIvUrTf1yns3JarX+OFW+hbNpfGqd5WnpWiinTgy7R1EH7OAasRo
	ITPUOL3WsC0yHkgEWjln/xaGZeskjZmOXyR98T2z72mMlK6LMzi/Q35wdkW1wGFh2ZBRcsVZnql
	hsqsxgNmrb6AsTv3unfEXCdKhaQ3FOnoSNjpYB3xozcE3KSfoYoRXWuEORB7kuTEZRdOKxNAczB
	6DkwKfbmyNx9XIr8PPOtKrbSrc985qzTlGRtECRJxSkTTsWMOVOaGPyTlYmTQsSs5AnBnXiHHd3
	n9YFaSUdr4gH8puTQnH/JV4lCJVYHrmsV6G710l36E6nXrMFFUVYiamrHijzn55p4PkJ3CBRxte
	sMTreItckhqCorNY6LbqwSKI0w==
X-Received: by 2002:a05:7300:f68e:b0:386:240c:19d6 with SMTP id 5a478bee46e88-386241b6d72mr20232034eec.6.1795752840316;
        Thu, 26 Nov 2026 20:14:00 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7f59sm70674179eec.6.2026.11.26.20.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:13:59 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 38/39] kernel-selftest: Depend on clang-native for the net BPF objects
Date: Thu, 26 Nov 2026 20:13:42 -0800
Message-ID: <20261127041343.1772294-10-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127041343.1772294-1-khem.raj@oss.qualcomm.com>
References: <20261127041343.1772294-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 04:14:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133208
Content-Type: text/plain; charset="utf-8"

net and net/lib build nat6to4.bpf.o, xdp_dummy.bpf.o and friends with
plain "clang", whatever the toolchain. clang-native used to reach the
sysroot indirectly; without it the BPF rules fail with
"clang: command not found" (Error 127). The selftests top-level make
does not propagate that, so the net install stopped after lib and
mptcp, and every net test reported "file ... is missing!" in ptest.

Add clang-native to DEPENDS. The net directory now installs all its
tests.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
index 96b837fb20..2a0368d873 100644
--- a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
+++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
@@ -8,6 +8,8 @@ DEPENDS = "rsync-native llvm-native libcap"
 # net: libbpf (elfutils, zlib), YNL code generation (python3-pyyaml-native,
 # python3-jsonschema-native), reuseport_bpf_numa (numactl) and tcp_mmap (openssl)
 DEPENDS += "elfutils numactl openssl python3-jsonschema-native python3-pyyaml-native zlib"
+# net and net/lib build their BPF objects with clang, whatever the toolchain
+DEPENDS += "clang-native"
 
 S = "${UNPACKDIR}"
 
