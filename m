Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.698.1793419082318184138
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Oct 2026 20:58:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Sae5jCdZ;
 spf=pass (domain: gmail.com, ip: 74.125.82.175, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-35c76e9614aso1982696eec.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 30 Oct 2026 20:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793419082; x=1794023882; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2KcAEJ/d//yNkNn25R3m5JPPTPab3qI1ELoNHffGJTw=;
        b=Sae5jCdZZgA00LJJTwWVHUb7KfO9XOMqN4SDciS0lU9hSUvIvh3wfct5EWIUt/32Px
         RB76ri6lohzlVlrHl5FszhFjsD9vm6n+avaYAcN94TQ9d04EnQt6PQENaY3p6aBGrTly
         oQQvs3oQynNxOv6eVCa6SK50bNX9Pbm0FSdDxB2mnFSw04qKJdhmx8JKjSVVox7VzVf+
         dbRTr6t4EdybVnjM0+1LGY4wNFbRKjIBE4e71k09fQDqD6ngMiB7a03NK3N7UvpJLQ4R
         XV51AnpUNnwzYK9SenU7WeY09srpMsLQ9Otpwbxh0/Rhc+SMwg/ZUsXow1PQeWTPrB2W
         l/CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793419082; x=1794023882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2KcAEJ/d//yNkNn25R3m5JPPTPab3qI1ELoNHffGJTw=;
        b=Do5F6KKGi5ubTDrwNRWj/9KCN7mcfWkKlkdf/uZ8oZlWjVUKhzB1X6ebmc0gyTE1aE
         bQOVtrbU6R0l9158gfVsqkPRqbkzPoRwIIOJBp9aR6QWKAJpaxYF1l9t9Ktg9bx2jTJr
         8Wvua/mEKBJlCxC9mdYm+ojMQuiy9IaN9GFa7HxMHlEQx0HGMnxqlKLgx179EzVKJdQT
         nIYHvA0wphuNejfCAV2MnTRQsMAhGrK6GV5fT1xtV6HSAXpaV+MZ6+RqPNUeWm+AWm1G
         UOsqz/Gk9iquS5vJ0T2+lbGDWCZXenE5WrZGQX7mtlKX4xZr+Bza4N8uFVIbTPMEWVkZ
         5Luw==
X-Gm-Message-State: AFq9FYKJrcwAmM207d4+Z0w1S6fkhMA4vHJeX9NphbpQs+zYir1vyph1
	cLMXN3iqJ5LRvIZkkfFLJX16FhaDdFfYm4wnsnsHMjQTEYL7N1A5nNNndOzLUs7CZMU=
X-Gm-Gg: AYBFou3qKMLvhOVNzRiBcL4CgSRMYsJp5GITvSu3OxTlwrshzqb9mt5akgucvJzQ6Oc
	sbbX/wsTsAWub/SvyAm7dJminNH6qzGxopUbMcb1Rz6SmvcXSj+MpbrfAPfyIzc4yiQe/CIjPiT
	zWp1zrAViSwb4B6l76RHfBRbKi3aKNxO+szxPYzo7bmArrdlmDU6avZApjqm6J8B1Df1mGi5r92
	XEU4e5tsamXb9LDzzMrlmlGF+3BoZT74zDu2PbjlDzyf5pJIgPum/8FZHxGcdYqBC2Mpyh5SbHi
	4LQ7ELYpBg3kYvDW6YbHBfdYi5ct2DEU9Z3pgnJf1j42HBn8d42FFNwVmkhj31Si/tMtDL8DQFi
	Xhw+jLCidC7f6hrXoqIKI+t20GhYPeh/sQMX/YTSPGpwcSALI5TWwMKB17tmnUC2ubDXKYOrx1i
	p6gZNtPTEMoI3tFR/bhLlYOiNcrPWRw7eCh4ArPjxIDxQxq75XTGYAb7g1bIbFxB5MWRBn44ZDi
	zBOJXoJuS598CAjxIVMzzWdWBHCXypZPPrvhZQ/hTkzfuWSLLpJ9bgrZiJcqw44PcDs00R+CMPd
	qu3m5i0dRRSUG3Wva51e1ggGAiJgsLqqJ339AjwfXYp7mcGT4Igcm8M+m6yudCn1bSTJ9gc8uft
	8TUg5WwjSy7Mj45HzQ2iyuvhGQm9K8O3O598KKs/tXoE/4fCx5GuduQx71sE8SUn+WQjAFi1EoK
	E38lnSI6818MRw1HslJKbvWGAHkiLwHwpotK23TgD17fc8NyEjv9LBowWOMSABxraRZ1aVnYEQd
	tjOBi15uWxAi9+IwUNuwpscJ52/vehgKktk2Jd3x4ZQz/0bgCUTrfhniQTqMrD/Y6wbb9BifWIY
	Y49oJ3/mW8jQdeJCpUx/QkI4RQ==
X-Received: by 2002:a05:693c:8803:20b0:361:6884:78b1 with SMTP id 5a478bee46e88-36a423bf728mr6346215eec.28.1793419081561;
        Fri, 30 Oct 2026 20:58:01 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a5fb97sm13687837eec.23.2026.10.30.20.58.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 20:58:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 08/10] kernel-selftest: Add the modules and tools the tests need
Date: Fri, 30 Oct 2026 20:57:45 -0700
Message-ID: <20261031035748.2130261-8-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261031035748.2130261-1-khem.raj@oss.qualcomm.com>
References: <20261031035748.2130261-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sat, 31 Oct 2026 03:58:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131718
Content-Type: text/plain; charset="utf-8"

Many selftests modprobe what they need (gpio-mockup, netdevsim, vrf,
the tc qdiscs, classifiers and actions, ...), but the image only had a
couple of kernel modules, so recommend all of them.

The net tests also need real iproute2, iputils ping and ping6, ethtool,
iperf3, socat, jq, bc and taskset; busybox ip and ping lack most of the
options they use, and busybox's ping6 has no -M, which pmtu.sh picks up
over ping when it exists.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
index 4254eccfd6..b1266fe553 100644
--- a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
+++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
@@ -241,6 +241,14 @@ FILES:${PN} += "/usr/kernel-selftest"
 RDEPENDS:${PN} += "python3 perl perl-module-io-handle bash libcap libgcc coreutils e2fsprogs-mke2fs"
 # The net python tests load netlink specs with the YNL library.
 RDEPENDS:${PN} += "python3-pyyaml"
+# Tools the net selftests use; busybox ip and ping lack most of the options
+# they need.
+RDEPENDS:${PN}-ptest += "bc ethtool iperf3 iproute2 iproute2-bridge iproute2-nstat \
+                         iproute2-ss iproute2-tc iptables iputils-arping iputils-ping iputils-ping6 jq socat \
+                         util-linux-taskset"
+# Many selftests modprobe the modules they need (gpio-mockup, netdevsim, vrf,
+# the tc qdiscs, classifiers and actions, ...) and fail without them.
+RRECOMMENDS:${PN} += "kernel-modules"

 INSANE_SKIP:${PN} += "libdir"

