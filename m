Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4803.1794866449126632827
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 14:00:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=mIjaNP/r;
 spf=pass (domain: gmail.com, ip: 74.125.82.52, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso4996409c88.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 14:00:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794866448; x=1795471248; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y1TcmG9qu1LQyH8HVm2Y6HsES7mXdyLuG+KoqrRoALs=;
        b=mIjaNP/rVnI8VULW1ffjdv+6Am7Kcf2AN5/Xa6vOl1TBtqXDZ0o0XGRNqqrHQ+Ntzz
         MeqXJQV4ehYYs3mLbt239v2w1iQ6Kt9KJFjzy5QZ5RlwRM8URp/w9aAK/AjwvbAwv06z
         +wK2x7LgHuWWCagavYD8FAijmEWLaZCcT3HNPY0NiRvw/U1EZjQoQFRERSbjezESApkN
         d4AbvFdWKZmg/nrvzgTxUqd7qerGmld59FjPP4RN/e20VrDTajqlg60JAkAULL/D16ol
         BQ/FjM/I0/IVBUnLgYQsVRCIu7oB23efANXwJTb8+7Ua4NXZ++YICEDvFH6hKQOHPCPe
         mTmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794866448; x=1795471248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=y1TcmG9qu1LQyH8HVm2Y6HsES7mXdyLuG+KoqrRoALs=;
        b=SWxfAvcnUYwqDhSgqKa3wjjTmtRWkj4uRbAq8yvY21JqjGRbeLjgkxc3Y22fKFe4T9
         T3FENbQkGd0R7bQsLmcMqhnVp+zTyKFFQEOOT9CRWH5XXmbq7WjGQdG+YA1xYDHVKzzq
         oH3oTWMpd3tL+Lxd2O3xzoMdsBRjJwVFVV2GI0CaUsFgoM8Ii6FtNr71RmSVo+fjml/6
         /YZ62CGWK2z0Mw5/VKC/SzKXIi90lBAKspzRw/aPyfQ63vaffHQ0Tt3F8EVXdywylElF
         Bo6S3aOmaj5m6OASlldJNxQpb/pNWYU5h2IQguPeylrvu1tlUcbHYYigZTrNm1DF+MHd
         h4Mw==
X-Gm-Message-State: APuU4Z9ZTALIsvKDDJm4D2BXn411ELJ2vjyIoyXa0vcuTgW8QTiPsoDD
	9DaQs7lCYBdP8mWF5Vryt0VDHAl8wnoaTtwTD2GLR4knmlnnK+GP65zFb5QJsujY
X-Gm-Gg: AZFdTZeUx7DZzdXEh77kUv/jMXC5ziRQgNq3m6caR8+rrQ62/+3zfWDV8xP4WFKFvxr
	2oj4UhjR12ZkcMO9Y45nk+CuMuMvdfFZUna3BFDcFzGm9pbuGJ86tEbXhkeMdCvy/5uyu+FOHQH
	ZeHgfOPJWKE8pVFDJCjhvXyM4pUukv6VUuVTM2P35s0OQdgqoBXyjcDAmCT/2T7PyV2lXjPtXM7
	YosbL/Xa2Rjx4ZP7F35AgxUor+Yv3mjXTqLGSWCuae/wf7t9UiJcX44PTOIsKShTNqko9MgxJDs
	UW9BEDqA5ZB8czMi+USm32WiwNGp5XuS1LYzbiS+ql7lLeE5FC4MtG6bcx0aoIceW2i7MlNGikB
	MfDZ2hDvdXy2lNzSD3eTkJl2gk1jpzqDDkjGI6oQr6kiQiP51dnGWUp3WsvZh/8Q3VpEI4c4xU0
	eabb/3FHxH28Ph9LCwy68CFgfKndRO30qwIdA6DmZfeBxKEnzY+7G92bhR7nEvfOaPOnbswXeg9
	Cm1PZQF+CVLLZwFnxXav4XN200ikdCl/mpiNd3VzLiI07jfAKaLIwgtWernH1zvA1tfmlrR27Q4
	iibvCQP7Qh1iKbOUyB5T1o8dR6eqzlQLj7EqWG4K/UDFHn+Jg7uQ+jzHyh8tCJXGhqYDhk8+rR0
	YhIZsN/KrA0P5iwLArv+cWyFmCQ6sP5yCaz3OpSWfqTTTS+TTFe0+81RjVh7eAwOksqADAltcMB
	6UfEpewet13J68DLIHqvIAbZ7pIqB0BnYoMuwUn9Irft0q66fvm120K+R3MikGOiDicLr2FGnbA
	qqTARpyCIrNHwUXkYGIs4dfNBO8AzSxyGmX18epZsrXXhA7tRuHcox1zZTzGvKrLjlofTNSqRbF
	UDGl
X-Received: by 2002:a05:7300:3083:b0:36c:f88b:caae with SMTP id 5a478bee46e88-379675fc82fmr19125686eec.22.1794866448037;
        Mon, 16 Nov 2026 14:00:48 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38115cfdd6esm1221905eec.5.2026.11.16.14.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 14:00:47 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 5/5] kernel-selftest: Skip tests the running kernel can't support
Date: Mon, 16 Nov 2026 14:00:39 -0800
Message-ID: <20261116220039.1807391-5-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116220039.1807391-1-khem.raj@oss.qualcomm.com>
References: <20261116220039.1807391-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 22:00:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132569
Content-Type: text/plain; charset="utf-8"

Many tests, most of them in net, fail rather than skip when the kernel
lacks a feature they need (vxlan, geneve, macvlan, vrf, netdevsim, TLS,
tc actions and qdiscs, audit for the landlock tests, ...). Skip them
based on the running kernel's config, so the results show regressions
instead of the kernel configuration.

Also skip the udpgro tests when iptables can't set up NAT (legacy
iptables on a kernel with only nftables), tc-testing when scapy is not
installed, landlock's fs_bench, which only reports timings and needs
twice the default timeout in qemu, mseal's sysmap_is_sealed when the
kernel doesn't seal the system mappings, and the ptrace vmaccess and
tty_tiocsti tests, which check for kernel changes that are not in
mainline.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../kernel-selftest/kernel-selftest/run-ptest | 93 ++++++++++++++++++-
 1 file changed, 92 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/run-ptest b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/run-ptest
index e8a136dce8..85fa63b5e4 100755
--- a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/run-ptest
+++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/run-ptest
@@ -8,10 +8,101 @@
 # runner blocked (and silent) until they finish, so ptest-runner kills the
 # whole suite. Skip it.
 #
+# ptrace:vmaccess and tty:tty_tiocsti_test check for kernel changes that are
+# not in mainline: PTRACE_ATTACH failing with EAGAIN during a multi-threaded
+# exec instead of blocking (the attach test always times out), and TIOCSTI
+# checking the credentials of the file opener rather than the caller. Skip
+# them.
+#
+# landlock:fs_bench only reports timings, and walking its 10000 nested
+# directories takes about 90 seconds in qemu, twice the default timeout.
+SKIP="-S ftrace:ftracetest-ktap -S filesystems:file_stressor \
+      -S ptrace:vmaccess -S tty:tty_tiocsti_test -S landlock:fs_bench"
+
+# sysmap_is_sealed can't tell at runtime whether the kernel seals the system
+# mappings, so skip it when the running kernel's config says it doesn't.
+if [ -r /proc/config.gz ] && \
+   zcat /proc/config.gz | grep -q '^# CONFIG_MSEAL_SYSTEM_MAPPINGS is not set'; then
+    SKIP="$SKIP -S mseal_system_mappings:sysmap_is_sealed"
+fi
+
+# Tests that fail, rather than skip, when the kernel lacks a feature they
+# need (the options are in each collection's "config" file). Skip a test when
+# the running kernel has any of its options neither built in nor as a module.
+NEEDS_CONFIG="
+landlock:audit_test AUDIT
+landlock:fs_test AUDIT
+landlock:net_test AUDIT
+landlock:ptrace_test AUDIT
+landlock:scoped_abstract_unix_test AUDIT
+net:bridge_vlan_dump.sh BRIDGE_VLAN_FILTERING
+net:busy_poll_test.sh NETDEVSIM
+net:cmsg_so_mark.sh IPV6_MULTIPLE_TABLES
+net:cmsg_so_priority.sh NET_ACT_GACT
+net:cmsg_time.sh NET_SCH_ETF
+net:ecmp_rehash.sh NET_ACT_GACT
+net:fdb_notify.sh MACVLAN VXLAN
+net:fib_nexthops.sh VXLAN
+net:fib_rule_tests.sh IPV6_MULTIPLE_TABLES NET_VRF
+net:fq_band_pktlimit.sh NET_SCH_FQ
+net:gre_gso.sh IPV6_GRE
+net:gre_ipv6_lladdr.sh IPV6_MULTIPLE_TABLES
+net:icmp_redirect.sh NET_VRF
+net:ip_local_port_range.sh MPTCP
+net:ipvtap_test.sh IPVTAP
+net:l2tp.sh L2TP_V3 L2TP_ETH L2TP_IP
+net:link_netns.py IPVLAN IPV6_GRE MACSEC MACVLAN MACVTAP NETKIT
+net:netdev-l2addr.sh NETDEVSIM
+net:netns-name.sh NETDEVSIM
+net:nk_qlease.py NETDEVSIM NETKIT
+net:nl_netdev.py NETDEVSIM
+net:protodown.sh MACVLAN VXLAN
+net:rtnetlink.sh IPV6_GRE MACSEC MACVLAN NET_VRF VXLAN
+net:srv6_end_dx4_netfilter_test.sh LWTUNNEL
+net:srv6_end_dx6_netfilter_test.sh LWTUNNEL
+net:tap MACVTAP
+net:test_bpf.sh TEST_BPF
+net:test_neigh.sh NET_ACT_GACT NET_CLS_MATCHALL
+net:test_vxlan_fdb_changelink.sh VXLAN
+net:test_vxlan_vnifilter_notify.sh VXLAN
+net:test_vxlan_vnifiltering.sh VXLAN
+net:tfo_passive.sh NETDEVSIM
+net:tls TLS
+net:tun GENEVE
+net:txtimestamp.sh IFB
+net:udpgro_frglist.sh NET_CLS_BPF
+net:vlan_bridge_binding.sh BRIDGE_VLAN_FILTERING
+net:vrf-xfrm-tests.sh NET_VRF XFRM_INTERFACE
+net:vrf_route_leaking.sh NET_VRF
+"
+if [ -r /proc/config.gz ]; then
+    KCONFIG=$(zcat /proc/config.gz)
+    SKIP="$SKIP $(echo "$NEEDS_CONFIG" | while read -r test options; do
+        for option in $options; do
+            if ! echo "$KCONFIG" | grep -q "^CONFIG_$option=[ym]"; then
+                echo "-S $test"
+                break
+            fi
+        done
+    done)"
+fi
+
+# udpgro.sh and udpgro_fwd.sh set up NAT with iptables, which fails when it
+# uses the legacy backend and the kernel only has nftables.
+if ! iptables -t nat -n -L >/dev/null 2>&1; then
+    SKIP="$SKIP -S net:udpgro.sh -S net:udpgro_fwd.sh"
+fi
+
+# tc-testing's tdc.py needs scapy (in meta-networking) and exits at once
+# without it.
+if ! python3 -c 'import scapy' >/dev/null 2>&1; then
+    SKIP="$SKIP -S tc-testing:tdc.sh"
+fi
+
 # Turn the runner's per-test TAP lines ("ok 3 selftests: cgroup: test_core",
 # "not ok 4 ... # exit=1", "ok 5 ... # SKIP") into PASS:/FAIL:/SKIP: lines
 # that ptest log parsers understand, keeping the original output too.
-/usr/kernel-selftest/run_kselftest.sh -s -S ftrace:ftracetest-ktap -S filesystems:file_stressor 2>&1 | awk '
+/usr/kernel-selftest/run_kselftest.sh -s $SKIP 2>&1 | awk '
 { print; fflush() }
 /^(not )?ok [0-9]+ selftests: / {
     res = "PASS"
