Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8CBAD3B9A9
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 08:16:20 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10809.1765354570500410647
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Dec 2025 00:16:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bzP962V3;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7d26a7e5639so7376559b3a.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 00:16:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765354569; x=1765959369; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a7FIw2YvssA0u6cBbGcbM5wY5Bl9n2J4AZmeRBKmKQU=;
        b=bzP962V3dpp3rXGVfwpEKLMhYik4Wy4nOq+fYLMyHlvxGW9YQi+9Txyma0WhDzkiWb
         7p+a16vyVNJLObpU+UmQAzeQnR41LlO37pqn0+hw8aNu19bdCeYbMoViACQWfzY/j+Go
         0JQyHLafXkZPDjpzsbjjY3lNDL/eS8pfJM7z3YrrGgECx6CovCtTjXxOOWIQ4ysx7ebb
         P3yGp5smSlE1osFcoFMFxl9p4ErM64LXxIGDIlmEb5rbfGtO/vnZaHjJaHLOCWMEWeIW
         TGP2mPXictSb26SY06+LYuDDTIOk9Xy4oXyDbWYsljdAuaxcp/DKbg8NwMBjZk58WxYK
         Hgqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765354569; x=1765959369;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a7FIw2YvssA0u6cBbGcbM5wY5Bl9n2J4AZmeRBKmKQU=;
        b=v3k0mDJ9B4zP3kgYzmBuPyNiPcZcU4UslgcpY9uUnK2/IkRdVnA8JiDDwCqoeEfSUP
         mMR/tBXMJBIonjp/PJQIaFlTPwLA2u/lYg+mwvEwoKrNHie4gmBpbsGVgjwx1y7VwR9E
         6gbOnfpW1q/lXjL3rMW+asUeFv+34jwIG/tkdBMk1InMmgtQqYx45uO0+iHBwU0WoHuV
         0wOHO9i1mKams5DLD1xTP2lEnfEdXnpTp+wgpYdZ+3DUX14J/h4qyEpWpzEJrZL2EAhB
         Qdrnj8slyugEO65/i1uy/oUXvsvmLg4eWZvE+L5nGTSqv4Xlj/7/poARtS52ORxyT1L5
         rdsA==
X-Gm-Message-State: AOJu0YxMkOV+Ryb4Q+sY2tr4u0XXv2ofGfykefh8GBKtytI+GG9bX1LU
	eW6HRpdOhnkjc8uJ6HeNfMOTcrg4q4IE7cjTSNYcsabtkQ9Gqw/GUbqmeaT1ASOW
X-Gm-Gg: ASbGncsph3QwjTfC7x9HvX+r/IdKvtcJj0/RZ+2hK16x11CZhMCMXV1083mG6uUpBHQ
	rQH6jHL3suXHuAy16vZmxbvFRXPyPjWSv59IuYBljt6gpHjKtwkqtE0A31PS8RX6amXwjV7nXdF
	3gU6FHovdkOrVD/n0WocPYN8zk7X/IgowYety19TtjjjWprkApACZfkmdMBwwLb1WIG+Dgr5pfb
	KJMklQTqdVarH3eJ9V8lf5hSNSGwfoyICZ6njDhyorVyMTAOsu/o/sIJ4Qy8+3ggdHACyS3SWgR
	dLm4RjaU861or6w29V5fbZoUcBX1sWLYMdB0vaUhZk/cSpLXZB+LNp2odkHhupfJJqaMqdQrMv+
	WV25dXUwcX/RJ6Ut1iLrCH+ipvXatTyXTqrJkdxBFGj7oEHyagcMoK0t8D4nBRTvoOrbgM8Ynf5
	0unOUBZfXQOUALHyqVtuMu3EoVvtJ/4ANOPpTdpV9YBsZempz1X6Xml2v2hsBpcdLJTVRpwvj6P
	7TIl1GQy/V8+UqJQc6G7PY8t7adwuku
X-Google-Smtp-Source: AGHT+IHAU/66Mt2slyCFS1K1GJsyByiR9AMab5gXBW1MXqIIQVyHACcVCUEwdb6dsaHCs+aIygVG3A==
X-Received: by 2002:a05:7022:4181:b0:119:e569:fbb7 with SMTP id a92af1059eb24-11f296c5217mr1347644c88.38.1765354569234;
        Wed, 10 Dec 2025 00:16:09 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::69b8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11df7703bd7sm80613086c88.10.2025.12.10.00.16.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 00:16:08 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 1/7] frr: Upgrade to 10.5.0
Date: Wed, 10 Dec 2025 00:16:01 -0800
Message-ID: <20251210081607.3196421-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 08:16:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122488

Relase Overview:

* BFD the ability to listen for specific VRFs only
  - Configure which VRFs the BFD daemon will listen to. By default, BFD listens to  all VRFs
    present in the system, including the default VRF. Default VRF must be specified as `default`.

* BGP SRv6/MPLS coexistence
  - Allow MPLS and SRv6 to coexist on the same L3VRF, even for a given prefix. This feature is
    important in brown fields where some operators want to migrate from MPLS to SRv6 backbone.

* BGP SRv6 locator per VRF support
  - Ability to choose SRv6 locator per VRF.

* BGP Error handling (RFC 7606) for iBGP peers
  - Before 10.5.0, once we received a malformed packet between iBGP peers, we always reset the
    session, and with this release, we handle malformed packets the same way as for eBGP
    (by withdrawing or discarding the malformed packets).

* BGP IPv6 Link-Local Capability is disabled by default
  - In 10.4.0, this capability was enabled by default for a “datacenter” profile, but it’s disabled
    for 10.5.0 and will be backported to 10.4.2 as well. The problem arises when the receiver has
    configured a route-map with `set ipv6 next-hop prefer-global` and we send only an IPv6 Link-Local
    address; therefore, it was decided to revert it to be disabled by default.

* BGP BGPID Next-Hop Characteristic
  - In some cases, the BGP speaker sending a route might encode only a link-local address and no
    global address. To provide uniqueness in this case, it is sufficient to associate the BGP
    Identifier and AS Number of the route's sender. The BGP Identifier Characteristic
    (BGPID) provides a way to convey this information if required.

* BGP EVPN flooding per VNI support
  - Add an ability to adjust BUM flooding per VNI, instead of just globally. E.g., disable flooding
    only for an arbitrary VNI.

* BGP RPKI strict mode
  - RPKI strict mode prevents BGP from establishing a session if no RPKI cache server
    is connected.

* BGP rejects AS_SET by default**
  - Until 10.5.0, it was disabled by default, and since RFC 9774 was published, we switched this on
    by default (to reject).

* BGP has lots of improvements for Graceful-Restart**

* PIM/PIMv6 route-map support to allow users to filter IGMP/MLD joins using source, group, and
  interface combinations

* Support for multiple SRv6 locators
  - This extends the SRv6 SID Manager to add support for multiple locators.

* Zebra 16-bit next hop weights support
  - The weights used in ECMP’s consistent hashing have been widened from 8 bits to 16 bits since
    the 6.12 Linux kernel.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-protocols/frr/{frr_10.4.1.bb => frr_10.5.0.bb}  | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta-networking/recipes-protocols/frr/{frr_10.4.1.bb => frr_10.5.0.bb} (97%)

diff --git a/meta-networking/recipes-protocols/frr/frr_10.4.1.bb b/meta-networking/recipes-protocols/frr/frr_10.5.0.bb
similarity index 97%
rename from meta-networking/recipes-protocols/frr/frr_10.4.1.bb
rename to meta-networking/recipes-protocols/frr/frr_10.5.0.bb
index ce455ab8bf..b1f863a47b 100644
--- a/meta-networking/recipes-protocols/frr/frr_10.4.1.bb
+++ b/meta-networking/recipes-protocols/frr/frr_10.5.0.bb
@@ -10,11 +10,10 @@ LIC_FILES_CHKSUM = "file://doc/licenses/GPL-2.0;md5=b234ee4d69f5fce4486a80fdaf4a
                     file://doc/licenses/LGPL-2.1;md5=4fbd65380cdd255951079008b364516c"


-SRC_URI = "git://github.com/FRRouting/frr.git;protocol=https;branch=stable/10.4;tag=frr-${PV} \
+SRC_URI = "git://github.com/FRRouting/frr.git;protocol=https;branch=stable/10.5;tag=frr-${PV} \
            file://frr.pam \
            "
-
-SRCREV = "88f5c06cbc1cc4d62e1cba3e7791f5cea4179ba5"
+SRCREV = "c41ba202c3f821a43091781181c73772501034ae"

 UPSTREAM_CHECK_GITTAGREGEX = "frr-(?P<pver>\d+(\.\d+)+)$"

@@ -124,7 +123,6 @@ do_install:append:class-target () {
         echo "d /run/frr 0755 frr frr -" \
             > ${D}${sysconfdir}/tmpfiles.d/${BPN}.conf
     fi
-    oe_multilib_header frr/version.h
 }

 USERADD_PACKAGES = "${PN}"

