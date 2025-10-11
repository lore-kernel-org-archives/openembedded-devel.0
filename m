Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D95B3CCA476
	for <webhook@archiver.kernel.org>; Sat, 11 Oct 2025 20:26:45 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web10.7259.1760214405145128492
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Oct 2025 13:26:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TVx+nPFp;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b4c89df6145so509596766b.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 11 Oct 2025 13:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760214403; x=1760819203; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=rTmK1Tz89nRdIXr/Xsy7Yblq+dpowLpcbkbMDltuqfc=;
        b=TVx+nPFpahZWGkC8bXwmpUFRXGMC3omPD/9TIxL4MGHi2E2Oo31I3FL+bwfuNdjxn3
         67/cIBw2clfVjdF9UeUEATbe6aIP4eFqMo+TQJRMJVKdWyqkHICvldgJVfP78QMXotEL
         tlkrfLabsSEHQ27d0cxcHXiZcu3tFwIGnhzMSeu4LeULqMjrzBf2KXeEIaduoHqhwRpj
         2s1i/wxeiY/o7+gi8BkSmcnbpcrKDw0NFR1Ds+qdLoiB2pOYlU6Kke0MtptyZlBr4DLZ
         s2CU6E8HLxSGw5bYDqMKOhxP8NNNEky2obiwizwHoB2UmUQvursYdWlPh6CjzCU9QGYi
         vpUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760214403; x=1760819203;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rTmK1Tz89nRdIXr/Xsy7Yblq+dpowLpcbkbMDltuqfc=;
        b=F+blAB/4RMdHOAHZM/A5AAYm/OerrfjQyDgHYzcl/HcobBkkNly+GotnReCQ7WVs0g
         saFKFFnhHpJ76UZI0XmOkOW8Dq4VSdvbaefozliPm09Nzd20uCTg5PIjA489xtV40sZf
         UyITkaSak2fKIhbDazANMPmJmuGOeraEfabD0XzbsF41iwP2blkwR1z4g3VLF49mkh5n
         H33JWMn5ARwaq317CYhAeHMPvKK6HvuMAFRL4HWMJrj1v1Jam1vpCoayEIZlJeUitWwq
         c38uLhj9wN2n1rKeou/TKBuDuxToOqUjm7Kc1JJQ5FAxyW6xRdVoU0Sa4n7+Kg1Luje8
         5Lmg==
X-Gm-Message-State: AOJu0YzAdLh0LOJsQ4DwI/361mqXDFaRmoJ+F6n271g1LqnfhKaDN6oi
	/EpKxRSoMxMeGFHmZN9MTM/gVFMUPVVPs1ajbz+2Qmfg7nnfODV6ahUSUandMw==
X-Gm-Gg: ASbGnctdhPO2jKtk0gLEDqyHk+UrgzimcENFCNsArMxkLhBe0Xtt7s8MkdM9aeWtVbr
	IGEE5vwCN9s1Ocwglj1UjQa0gmbPZZxiIQYuOh5sFEeiE4wIUg1HANfGm9eswOVslaqHvAHfhlt
	W0SAmNn5geG0Y3t8cwpNW+4WUJc/6YQRqkjhtsZ5Td2Kvz6bdrRPryicXnEHTyvQMFe8f5I22dg
	tnW2eo2Pg/813pTLtON+U+TuseP4FY1wld7+r6X4NIlkaPQCE3sGRWD49rFD7RXZehx3Hkz+Rzi
	yaJJzrGG8GLtN4+aHF9gLVnL3fJ2fzX3+YXG8vZUwmebtEp5EZxBv9zWny2EWH16QRq8iCMKOWi
	x1wpRiyAW3ZpahbUEJaekVKa42QWwQm6yA7W1QtTbbH3H4DFPehfVgg0lH6h5
X-Google-Smtp-Source: AGHT+IEarD1k8QglA1+S2g9fBX21M51feM8I/kxi0IOBD9rRmwjPBgsQAhWIiafuCGpiUTibvF6c3g==
X-Received: by 2002:a17:906:6944:b0:b57:2b82:732b with SMTP id a640c23a62f3a-b572b82d41emr353003966b.54.1760214403135;
        Sat, 11 Oct 2025 13:26:43 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d65ccfe0sm551892266b.25.2025.10.11.13.26.42
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Oct 2025 13:26:42 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] frr: upgrade 10.3 -> 10.4.1
Date: Sat, 11 Oct 2025 22:26:42 +0200
Message-ID: <20251011202642.2097864-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Oct 2025 20:26:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120510

Drop the "datacenter" PACKAGECONFIG, because it became obsolete:
"The --enable-datacenter compile time option is deprecated.  Please modify the init script to pass -F datacenter to the daemons instead."

Note: grpc PACKAGECONFIG seems to be broken (it was broken in the previous version also).
At the first sight it looks that the application's Makefile enforces c++11 standard,
but abseil (which is a dependency of grpc) requires at least c++17.

Changelog:
10.4.1:
- bgpd: initialize local variable
- ospfd: Use after free cleanup of lsa
- vtysh: copy config from file should actually apply
- Revert PR #18358: BGP evpn testing and bug fixes related to non default EVPN backbone
- topotests: improve embedded RP test reliability
- lib, zebra: mark singleton nexthops inactive/active on link state changes for wecmp
- bgpd: LL next-hop capabilty fixes
- eigrp: validate hello packets and tlvs better
- bgpd: Fix compilation error in bgpd module: Update TP_ARGS for bgp
- bgpd: Ensure addpath does not withdraw selected route in some situations
- bgpd: [GR] fixed selectionDeferralTimer to display select_defer_time val
- bgpd: LL next-hop capabilty fixes (round 2)
- lib: compute link-state zapi message size
- zebra: Fix buffer overflows found by fuzzing.

10.4:
- BGP BFD Strict-Mode
- BGP Link-Local Next Hop Capability [draft-ietf-idr-linklocal-capability]
- BGP Transparent mode
- BGP Next Hop Dependent Characteristics Attribute [draft-ietf-idr-entropy-label]
- IGMP and MLD group/source limits
- PIM dense and sparse-dense mode support [RFC3973]
- IGMPv2/MLDv1 immediate leave
- v4-via-v6 nexthop support for static routes
- Timeout for vtysh
- Discover PREF64 in Router Advertisements [RFC8781]

10.3.2:
- bgpd: correct no form commands
- bgpd: fix to show exist/non-exist-map in 'show run' properly
- redhat: make FRR RPM build to work on RedHat 10
- build: check for libunwind.h, not unwind.h
- bgpd: use AS4B format for BGP loc-rib messages.
- bgpd: fix for the validity and the presence of prefixes in the BGP VPN table.
- bgpd: Force adj-rib-out updates if MRAI is kicked in
- zebra: Provide SID value when sending SRv6 SID release notify message
- bgpd: Fix crash when fetching statistics for bgp instance
- nhrpd: fix crash when accessing invalid memory zone
- zebra: Initialize RB tree for router tables
- zebra: fix null pointer dereference in zebra_evpn_sync_neigh_del
- zebra: fix stale NHG in kernel
- bgpd: Fix incorrect stripping of transitive extended communities
- lib: Fix no on-match goto NUM command
- bgpd: Fix extended community check for IP non-transitive type
- bgpd: Fix DEREF_OF_NULL.EX.COND in bgp_updgrp_packet
- lib: revert addition of vtysh_flush() call in vty_out()
- bgpd: Extract link bandwidth value from extcommunity before using for WCMP
- Use ipv4 class E addresses (240.0.0.0/4) as connected routes by default
- bfdd: Set bfd.LocalDiag when transitioning to AdminDown
- zebra: clean up a json object leak
- bgpd: Do not try to reuse freed route-maps
- lib: fix routemap crash
- bgpd: initialize local variable
- ospfd: Use after free cleanup of lsa
- vtysh: copy config from file should actually apply
- bgpd : Fix compilation error in bgpd module: Update TP_ARGS for bgp
- bgpd: Ensure addpath does not withdraw selected route in some situations
- lib, zebra: mark singleton nexthops inactive/active on link state changes for wecmp
- eigrp: validate hello packets and tlvs better
- bgpd: [GR] fixed selectionDeferralTimer to display select_defer_time val

10.3.1:
- Check valid babel port
- Fix incorrect type assignment in parse_request_subtlv
- Fix `set evpn gateway-ip ipv[46]` route-map
- Fix bmp heap use after free on non connected session
- Fix evpn attributes being dropped on input
- Fix holdtime not working properly when busy
- Fix leaked memory when showing some bgp routes
- Fixed crash upon bgp network import-check command
- On shutdown free up memory leak found by topotest
- Prevent crash when issuing a show rpki connections
- Remove unused defines from bgp_label.h
- Retain the routes if we do a clear with n-bit set for graceful-restart
- Set the label for mp_unreach_nlri 0x800000 instead of 0x000000
- Treat the peer as not active due to bfd down only if established
- Fix incorrect bestpath reasoning in some situations
- Fix show bgp vpn rd json
- Add total path count for bgp net in json output
- Fix import all adj-rib-in and loc-rib after bmp connects
- On shutdown prefix/access list memory was being leaked
- Fix srv6_sid memory leak
- Free up leaked prefix-list memory on shutdown
- Create vrf if needed
- Return duplicate ipv6 prefix-list entry test
- Return duplicate prefix-list entry test
- Add hop count validation before forwarding in nhrp_peer_recv()
- Disable and delete ospfv3 areas that no longer have interfaces or configuration.
- Fix lsa memory leaks related to graceful restart
- Fix crash when ospf client connects before doing 'router ospf'
- Fix for crash during networking restart
- Fix memory leak on shutdown
- Initialize gm proxy to false
- Make docs and rpki optional for rpm package build
- Make sure zeromq is always disabled
- Revert - Add option to build pkg without docs and rpki support
- Add Workaround for inet_ntop replacement which breaks rpms
- Avoid requesting srv6 sid from zebra when loc and sid block dont match
- Add more tests to bgp_rpki_topo1 test
- Add nb test binary to .gitignore
- Add route-map evpn set gateway-ip topotest
- Check if routes are marked as stale and retained with n-bit for gr
- Fix typo when configuring delayopen timer
- Fix wait times in test_ospf6_gr_topo1 topotest
- Use label 0x800000 instead of 0x000000 for bmp tests
- Use little-endian order for libyang api
- Fix reload script for srv6 locators and formats

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-protocols/frr/{frr_10.3.bb => frr_10.4.1.bb}     | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-protocols/frr/{frr_10.3.bb => frr_10.4.1.bb} (97%)

diff --git a/meta-networking/recipes-protocols/frr/frr_10.3.bb b/meta-networking/recipes-protocols/frr/frr_10.4.1.bb
similarity index 97%
rename from meta-networking/recipes-protocols/frr/frr_10.3.bb
rename to meta-networking/recipes-protocols/frr/frr_10.4.1.bb
index f0f3f34ab3..ce455ab8bf 100644
--- a/meta-networking/recipes-protocols/frr/frr_10.3.bb
+++ b/meta-networking/recipes-protocols/frr/frr_10.4.1.bb
@@ -10,11 +10,11 @@ LIC_FILES_CHKSUM = "file://doc/licenses/GPL-2.0;md5=b234ee4d69f5fce4486a80fdaf4a
                     file://doc/licenses/LGPL-2.1;md5=4fbd65380cdd255951079008b364516c"
 
 
-SRC_URI = "git://github.com/FRRouting/frr.git;protocol=https;branch=stable/10.3 \
+SRC_URI = "git://github.com/FRRouting/frr.git;protocol=https;branch=stable/10.4;tag=frr-${PV} \
            file://frr.pam \
            "
 
-SRCREV = "85cf1ed576deed121751e16a64970f8a652a9e1e"
+SRCREV = "88f5c06cbc1cc4d62e1cba3e7791f5cea4179ba5"
 
 UPSTREAM_CHECK_GITTAGREGEX = "frr-(?P<pver>\d+(\.\d+)+)$"
 
@@ -39,7 +39,6 @@ PACKAGECONFIG[zeromq] = "--enable-zeromq,--disable-zeromq,zeromq"
 PACKAGECONFIG[protobuf] = "--enable-protobuf,--disable-protobuf,protobuf-c-native protobuf-c"
 PACKAGECONFIG[capabilities] = "--enable-capabilities,--disable-capabilities,libcap"
 PACKAGECONFIG[cumulus] = "--enable-cumulus,--disable-cumulus"
-PACKAGECONFIG[datacenter] = "--enable-datacenter,--disable-datacenter"
 PACKAGECONFIG[ospfclient] = "--enable-ospfapi --enable-ospfclient,--disable-ospfapi --disable-ospfclient"
 
 EXTRA_OECONF:class-native = "--enable-clippy-only"

