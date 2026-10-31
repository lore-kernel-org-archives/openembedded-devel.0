Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.701.1793419085256166994
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Oct 2026 20:58:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=F/5jT+d0;
 spf=pass (domain: gmail.com, ip: 74.125.82.170, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-36a17a332ecso2415354eec.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 30 Oct 2026 20:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793419085; x=1794023885; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y1TcmG9qu1LQyH8HVm2Y6HsES7mXdyLuG+KoqrRoALs=;
        b=F/5jT+d0UUno1GOcECrT1Towl/mZTWRsVQAC12SouZ0vdF0JTYnr3eLWZN5T9gmYf+
         rXq6vGSVjTty7C9iUfcibJ45IR8AHrWShCk0OHzJuU7g12QRJl4NyZwEy/rLw6RMpMOk
         FMH0iy0zQMzfvRf5/+dJzoSiZemCQEkCYXLYr3oPhhF39Dk85cmVSOdwl/08cIjH7nxw
         PZJHrJYJ71wv1yPcmqGRpyvhhLAlwrtEA/sWRc6QI7o8rngmDnKRgjMEBbyUOllovXkk
         NiaFbSLdKbp8KphRz75P4bIb6IVNVRZG/+Cs4qaM0nFYV/mqim2b4/iDexvK6DpNkveH
         OihQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793419085; x=1794023885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=y1TcmG9qu1LQyH8HVm2Y6HsES7mXdyLuG+KoqrRoALs=;
        b=poZ1VM2LdDCikU1eL0xtQ1KbSpXB33l3BboGhy3/hkoxbgyFLPv7Jc+88kJQSxLTbP
         1VPVqqzHHtx7KEp3x+0zT9IaWiPCSNqX82enugddiUk3usD+zfbTSJeHa1ozbqlIY5XA
         vTVrTDOpoMG2SLVvurstOzSPxRpZay+H/3HTWlwMXX1CIJuJNp4vEzZkVN6CpGzWc22E
         yn9UkuVQ2oLIy5V4Yi+HY3C2P7aftBZAAt84d2ow1J6ba2M7M1WyWhXQPN0Krel5BfMP
         VdPtHVQf5b+GJzCzokpRfRmF98bPhx/4UUXRddNPEbo+wjrh7N2LY6FqiPQZGvNepfXa
         dsnw==
X-Gm-Message-State: AFq9FYIta9ymK4qD8Aaqden6zpQAW+vBx5QRn7h4qpwiqEMExbOg4m06
	pEXHXJFqaSKzFCrDTGLn+ZbWNRg7Ki+Sk24cr17U9yGX5ckpdjl6NtweRqg3eP+bd0E=
X-Gm-Gg: AYBFou3tQnBPcMkSsb0E+uEfAzB9wAoEIHPeRzan7FlL0QlIiyvHRjvI4U/xj+EG9bA
	6WWoC3/MxsK+qNDD/RidKEio0NPPTUZfOC3Vux+2yTCT+JhwyNiTWRvE1NkLTT9xpXCsdvM3Qz5
	pZYsxrSCcKbl2cUkt+azTT4u/efmWsZM8b/yBEJ6jtnKmfejgeTIMN6mRi7TpUGMAfWsCO8/wCI
	utZzfAukDp8N62L5Bm7AcatEiLmu/FaBuWV1ENFWF2QPC46VxFwAtxTWKM72MXj/7/ZzpdGjL1W
	bc0wZNSQRMK/TVq4FuCT3M1WvG5Spf/zatfjWSIL5snt/1U4u6kpErYdTXWWGdoxOWdK3kkyACP
	zqytXResuniqFY/VUD7sXJATg5Ps4I0+1kpepAYWv5vDo5TrMsILIVNJrGiXU9CIhCBkWpbGqXS
	jXyhdASODX5+Pqqa9nN59YFzWaPFg56CLhySjS19L9ggXOkzti6IPODFGkmUK8xB9mCiQm7Pkqb
	GQvJ7C7uc0msMHr+TD0Olm2y6HabqBVIlgxYHI2UBoi/zYLpww+aiQDcewoByjcceLFuCz9XuH7
	NdXLr8pSbLo0yazYLX47RTJc4D00WsryRJICnOmVvNGCRLb8+Y6nrQ+A1S+AmGTbtBAoleudany
	SVKo+fL8hg9pcRhl5gXorssWEk/PquINq4qjqIt7eJfFbecvuyBrPeuEd+ARhdrxq78aaIN4Txx
	mOrp/UbvplucUmlXtOIos3oJgAllW/J3sRu4sRqAhBZbYblQP3TRhjhTDrxIqigNR+B2LQlxRu1
	Dwg14/u5JyWCLrpaAk6krFsZWTcI7XBpCXwEcwEkUzQ/GtR6stAp7qKpkXDVlteRdiEOsIb916J
	wSse2fRHGnQwQd9u3symt78IAiQ=
X-Received: by 2002:a05:7300:881c:b0:369:ec31:8fd5 with SMTP id 5a478bee46e88-36a42225546mr6738566eec.3.1793419084400;
        Fri, 30 Oct 2026 20:58:04 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a5fb97sm13687837eec.23.2026.10.30.20.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 20:58:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 10/10] kernel-selftest: Skip tests the running kernel can't support
Date: Fri, 30 Oct 2026 20:57:47 -0700
Message-ID: <20261031035748.2130261-10-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261031035748.2130261-1-khem.raj@oss.qualcomm.com>
References: <20261031035748.2130261-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sat, 31 Oct 2026 03:58:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131720
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
