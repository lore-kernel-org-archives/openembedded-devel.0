Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EDF4FEA806
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 04:51:10 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15814.1774414269538702950
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Mar 2026 21:51:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Grl5e4Kq;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48702d51cd0so46654535e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 21:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774414268; x=1775019068; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D6CNOjY1atPiR+pqRue9+bbqX4PDBr/l3T3Bb/goe2w=;
        b=Grl5e4KqK5yH1tn4slO7iyfWdfXWgCJyvVi5PL6ikb+gsBY/EwkWO7uq2Oipguz7oV
         qZgnyHjx+/n2bx40oYtkGsCza8olGx/z2eyM1ZD8FKStiXxLIwZvdYGON22SpoSWuCt1
         iaFm8cMPvNU5DXcjdenJpcNeHVUMmfM4mjxDUXL4BB9NaoWXTrzW9KVdfCfF2/DHFnWL
         fteUL/AQTC6zm4T96S66gsx2p9KBt6Nt/H5b3cWWyY03USnqe1e/+2uqXeWoNp0tFzMD
         z89TQiF0d+RGsiCI1M3Q1Y4kQ3Eok8qA9lsEpi4n6RhwvmRrPaxD0zfMpr5XtHnz04yz
         8LwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774414268; x=1775019068;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D6CNOjY1atPiR+pqRue9+bbqX4PDBr/l3T3Bb/goe2w=;
        b=cmgZuOHWqpH1Qy5u6bLtMSyd+yo4e5RzBiVT/AkzPFzwz3tpDLV15sZVfCXIpyhI9W
         0k08oq3ioklDHrldH4t5173GpMoRa3685WRHW3QoTEtVwzctB8Ypx0pxPpKiNjiCNx3P
         guzwlRYTpsISCYpBe6UsVkRWS6ska6xWS1Ky0p2fz8uVLeS8NEpsnYc4sSM5ghGSBLnJ
         bCnx0Q8/RNIit0gwKRp9oNpYHCLhxM4Oxgv3RbkhySFEBwJb3h4/7NXSOtcKDnR3gozR
         ikzBckfw241At+j2ofC3StgsHjxzC5/RicRN+m/3981ezWkFNykjrgzs27Z0Z7HjVH7i
         in6g==
X-Gm-Message-State: AOJu0YwXRZigc9LFvwiICvC7IqXnMGth+VWLyfQ1wQjS+wt3RoD1s+be
	UVnc42J38MUg03PGMAMHNx0R3735GO4fW374Ty3lRLElb7F/X+uIZIel9OrY/A==
X-Gm-Gg: ATEYQzwgj33DyyTUOVe1t99C0waEj03sGbpm8rnD3Q8YP5/TQVwRyBR8mRLegnp6x0G
	F1nETQGs2nwHYp01mdHFHY9m8SVrZBGRLmIsTzsGd+kJyv7hq4v9LYYB+T3+0zCmibJr/7oNb5q
	/wtgRLokLlvJ/hKa+Z+vwVsYIqQ1Ff9aUP10TW2Z+o9wkA3hcfFdhLqZlkYTduiR9ITeAMlxc0B
	SCjZTnLOJrDkFXFgulKKtkCDgpz6wsMAabHb4aE44IcDXaXv9HgUVCSKROAHz8ZvslToCEfTkt4
	RnsE+bbnwlO4NT57Xz2Pls1PF2lrhuzbtEYoESIbUt35oStTCRPGb+K8lYXNhJiFnUZBnV5rqDC
	E2vz3ebTwUQ8LCMBY5i7P7tYQuLqPEKvHbDQux9xb6VWl8p7tCOPhmG2pKcgzBP3x7Un+iKrL42
	eS5srBSTbbvtkHoQ==
X-Received: by 2002:a05:600c:1e2a:b0:485:3423:727d with SMTP id 5b1f17b1804b1-4871606deb5mr30409565e9.26.1774414267316;
        Tue, 24 Mar 2026 21:51:07 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48711701804sm102475125e9.4.2026.03.24.21.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 21:51:07 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [meta-networking][PATCH] openvpn: Upgrade to 2.7.0
Date: Wed, 25 Mar 2026 05:50:56 +0100
Message-ID: <20260325045056.18301-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Mar 2026 04:51:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125600

Release notes:
https://community.openvpn.net/ReleaseHistory#openvpn-270-released-11-february-2026

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 .../openvpn/{openvpn_2.6.17.bb => openvpn_2.7.0.bb}          | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/openvpn/{openvpn_2.6.17.bb => openvpn_2.7.0.bb} (96%)

diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.6.17.bb b/meta-networking/recipes-support/openvpn/openvpn_2.7.0.bb
similarity index 96%
rename from meta-networking/recipes-support/openvpn/openvpn_2.6.17.bb
rename to meta-networking/recipes-support/openvpn/openvpn_2.7.0.bb
index c454a93276..2567747121 100644
--- a/meta-networking/recipes-support/openvpn/openvpn_2.6.17.bb
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.7.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "A full-featured SSL VPN solution via tun device."
 HOMEPAGE = "https://openvpn.net/"
 SECTION = "net"
 LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=89196bacc47ed37a5b242a535661a049"
+LIC_FILES_CHKSUM = "file://COPYING;md5=924af2c382c415a0a68d0d9e7b483d23"
 DEPENDS = "lzo lz4 openssl libcap-ng ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)} ${@bb.utils.contains('PTEST_ENABLED', '1', 'cmocka', '', d)} "
 
 inherit autotools systemd update-rc.d pkgconfig ptest
@@ -15,7 +15,7 @@ SRC_URI = "http://swupdate.openvpn.org/community/releases/${BP}.tar.gz \
 
 UPSTREAM_CHECK_URI = "https://openvpn.net/community-downloads"
 
-SRC_URI[sha256sum] = "4cc8e63f710d3001493b13d8a32cf22a214d5e4f71dd37d93831e2fd3208b370"
+SRC_URI[sha256sum] = "2f0e10eb272be61e8fb25fe1cfa20875ff30ac857ef1418000c02290bd6dfa45"
 
 CVE_STATUS[CVE-2020-27569] = "not-applicable-config: Applies only Aviatrix OpenVPN client, not openvpn"
 
@@ -46,6 +46,7 @@ PACKAGECONFIG[iproute2] = "--enable-iproute2,,iproute2,iproute2-ip"
 PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd,systemd"
 PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux"
 
+RDEPENDS:${PN}:append = " bash"
 RDEPENDS:${PN}-ptest:append = " make bash"
 
 do_install:append() {
-- 
2.53.0


