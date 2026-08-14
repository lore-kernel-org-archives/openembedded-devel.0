Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4D6FC5B572
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 22:47:31 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24549.1786747651309823086
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 15:47:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=O8zvD6wF;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2cc73e322dbso23239745ad.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 15:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786747651; x=1787352451; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/PHlkwlxX0nfGqSp76wHmaR4kTKg26K4cmLIV/gvzCQ=;
        b=O8zvD6wF6oUdqqkfX5nmHMLtOQvUV35ltQ5eBBIJXt3bYcoybhRPkTuSbaa2bf6kYx
         0Bb0kMArmo/4ZNELEbMlUrU+5z8Wk3TEuo1RphlC3yzp8V+F9WsNvgLNKvadVWhgnAYL
         NOBQxhl/r8wZ9jzj61oqPDftSuF18R63axs7eVJA1a4GR0SOGkWBzWMwhqgzvUFSq6zi
         V2tPeJMm9ComVjhjYNPkZNJkIiyhJxpbBJvjh7GyYS1aeewCKJuHMRmF4eielBmLulON
         B22tYStgtXg62ntu6+WI+MMOBViCqgbe9k14pZqQxhpPmde9LKzWITXNtWgMptS1t1eU
         Ndpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786747651; x=1787352451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/PHlkwlxX0nfGqSp76wHmaR4kTKg26K4cmLIV/gvzCQ=;
        b=KENLIER5Sb2iMBytsPqbWDmrM0TCJbrcLWx7lKV7j8KtAjl5I8giDyMSNp17MNkPrj
         x2ruQZQGi1xySTySRYoqOuufkztqQgIyERvcaJOSSEgopE9LQggNSbPGXIe0yqpJJHk2
         Mro+MqsiF1iB5g+kSULvp/I8ZcLkK2UddWUL0i1Y9iPLhzIOcnnxm39Eb0xkdXjGRBEw
         wrwJvKivmHC5WK0rdZYOX2LOSfif1mSM2SI0dk7N6Tyrp+Z+FTaLLKTX/sAjI4SibQLP
         vHAU8EHsawcrrylHG3FGI8Hoj5KOfWbS9T7YGlcxuST+HD0DwBzti9BdKlmSfGPcD2MR
         nvUw==
X-Gm-Message-State: AOJu0YyJjTQd899LzVcnomw+KtkddN+2U4hKWEM0Yrk1rAVxH3sDyPck
	zBg/UoqmmRicdQWsbL2CtTAd3N/GQqjYJ4fW52AxDBhRV3HMDy88j0x+VOkO7Up/
X-Gm-Gg: AR+sD11mErdyjSnZr2tRCQb2av1Q4TOQyPozpaEtC0YWLawuVag7Geg7gzhK6F9joRi
	mdk/o6g/rjBAvL/38GGQyqIAODHcQh6nJ9s5Qw81EuW1eUhdxp1r/cMxGaG7WPqgFdkL08ce8Ud
	jcVMOIGw+lpav1RZMqFJsc8Xul4NWgY0ivRpyjG7zP4Y88VyIk+b3S2AzFP4iLgPQauLUBJQJoB
	igCzZdYo5u0e1qtVMmYFnypJiqT3kl/R0KcAcf+gZEmNVv4tiunXpX8PrnUCowdBJfQpFFAjaOo
	mmA+4wlZ22yT/VuvyWqrjXuBABgNv4LzWRZ8BqRKjSXjsxOneyyeMQ3Ut9IFFzIJW4QoC4tfgf2
	gVasOJWc6+B0UeJENNyr/XSiIRH1Dm3vLlac8vx2flL0YBs/lK+qvH9rxFz/MG2zMqCd08YxuDN
	jU8C0T8evdHKjUXmeRqXj6gVhuW7H2BZrEWUtmLlB7RuWjc7qQOnjbe4sLvbUhxGR4Y30vjGySi
	qmbue6mfwEKevCAfkLZMMen//DDUbfaGPi7BxYrdMPxUQqM8T7CxbPdCwk531aqDphJzszzTYiT
	wV5WO94oJxrPe3FdkTzhrgeie5XjpJjZR0jH2C3VO1mtEhaDjD5axbeNHHItFtGjOF4Qu7CRjjm
	J/WAbTn1fHzU1wUveKddyITEpX9y7XD0oS/j2FtdPQpsY4w==
X-Received: by 2002:a05:6a20:7f8c:b0:3a3:a9c4:3d60 with SMTP id adf61e73a8af0-3cc720307c2mr9355330637.27.1786747650596;
        Fri, 14 Aug 2026 15:47:30 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm14541588c88.2.2026.08.14.15.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 15:47:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 091/109] openvpn: upgrade 2.7.5 -> 2.7.6
Date: Fri, 14 Aug 2026 15:45:17 -0700
Message-ID: <20260814224539.1523174-91-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
References: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 22:47:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129155

Fixes CVE-2026-63649 (openvpnserv on Windows insufficiently
scrutinizes the command line passed in from the control socket,
allowing admin config-directory restrictions to be bypassed) and
CVE-2026-63650 (--x509-username-field could unintentionally permit
a certificate that should not have been accepted when built against
mbedTLS).

The upstream swupdate.openvpn.org/net release mirror has not yet
synced the 2.7.6 tarball (returns 404), so fetch the official signed
GitHub release asset instead, which is available immediately after
tagging.

The existing 0001-configure.ac-eliminate-build-path-from-openvpn-versi.patch
still applies cleanly (with line-offset only) against 2.7.6's
configure.ac; the CONFIGURE_DEFINES logic it patches is unchanged.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../openvpn/{openvpn_2.7.5.bb => openvpn_2.7.6.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/openvpn/{openvpn_2.7.5.bb => openvpn_2.7.6.bb} (96%)

diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.7.5.bb b/meta-networking/recipes-support/openvpn/openvpn_2.7.6.bb
similarity index 96%
rename from meta-networking/recipes-support/openvpn/openvpn_2.7.5.bb
rename to meta-networking/recipes-support/openvpn/openvpn_2.7.6.bb
index 0aea6b7e74..d6c8a0e34d 100644
--- a/meta-networking/recipes-support/openvpn/openvpn_2.7.5.bb
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.7.6.bb
@@ -7,7 +7,7 @@ DEPENDS = "lzo lz4 openssl libcap-ng ${@bb.utils.contains('DISTRO_FEATURES', 'pa
 
 inherit autotools systemd update-rc.d pkgconfig ptest
 
-SRC_URI = "http://swupdate.openvpn.org/community/releases/${BP}.tar.gz \
+SRC_URI = "https://github.com/OpenVPN/openvpn/releases/download/v${PV}/${BP}.tar.gz \
            file://0001-configure.ac-eliminate-build-path-from-openvpn-versi.patch \
            file://openvpn \
            file://run-ptest \
@@ -15,7 +15,7 @@ SRC_URI = "http://swupdate.openvpn.org/community/releases/${BP}.tar.gz \
 
 UPSTREAM_CHECK_URI = "https://openvpn.net/community-downloads"
 
-SRC_URI[sha256sum] = "c6864b3c7d4e059c7d6ce22d1b5fa646c8b379a06af872eeb9792b6083a44ac4"
+SRC_URI[sha256sum] = "10e24a9385f23cc38cc5cf448f3ca0769f939bc4cbecc4f4647d7e006e52db74"
 
 CVE_STATUS[CVE-2020-27569] = "not-applicable-config: Applies only Aviatrix OpenVPN client, not openvpn"
 

