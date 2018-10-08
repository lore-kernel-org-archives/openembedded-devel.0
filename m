Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
	[209.85.215.173])
	by mail.openembedded.org (Postfix) with ESMTP id F373C799CC
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Oct 2018 17:32:28 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id v133-v6so8153920pgb.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Oct 2018 10:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=DG0SMeFbmufqlh63x+vR+6d/SUYwYprxteStitkJDFI=;
	b=tIYKRaFaiQmvj1Rk7rAdm3cYUZAhDhTIZ2nKnIWKsDRmbbyhZmAr8EbrHdr8qebbq6
	BxDY+9YDwXMBF43Guz4m8brDtjbXkZ6JxBxzacQp9sLAbnLXEyzOh9SD/kk//0IhlvTF
	Jd0RzhnJ23kGUlFIRbn6kDSjH7f++MnQQdzMKFayCLjKbKL1NnDxbvA5PIQzNb1TOVf4
	2/Q4vvte6sA1m2y4GwywAbaeEdEbtNA/ACFrl3APENA+jLMEUd5XrUjpdaRrK2IAoHcS
	cSJGK+2pspSwXRI8LmpL8I7OwtslLxE4SvW746dqcVxw7hqRx/EvE4wuOhlx9DqxfEqY
	T1dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=DG0SMeFbmufqlh63x+vR+6d/SUYwYprxteStitkJDFI=;
	b=M6PMXc9hQgCqGZsyC1lqhqyr9lR3r6mQDIZ+etk/yLyifosqTuqcLaoGxiIB/g9qN1
	5sOaXbcPCWDPrQEe7oXEdP4qU+KIFvwP0qoJ9nsdnv6zcTyMSgSoYOxdt7nrd+1HqRH+
	hc0vCBAKFHCJv3oR5yCkBbtROLWQW+RB/OscJug9zdx3tN5AFqbniiz5l5De5oVbvZ95
	vE76Gg0SUfPmT9raN7q+Tt6KykiaRA+0bIqWnbpk8YidAwxFRkBzNLg7Jc9v7yPJyXh4
	njg5fWvj3TiD2VHOWb7VFi+srWX+75DFG6wnOplVItd7Jdprfzbv33R1+1B/OSuPBQX5
	UW4w==
X-Gm-Message-State: ABuFfohPUSk1Cx4c/z1XxQHWLMMPu8XFBY3ab1knOPoWvvfogJ2SSF/z
	5PD85rZQDZlrPRQ0e0ItKyc=
X-Google-Smtp-Source: ACcGV60ryD7jNqJnVwfAyFqtg6oiUApd5Arugd7e17qWSJ0Z0QZxHGdFBYlawGfAGAtCQnMsBbEwKA==
X-Received: by 2002:a63:7d43:: with SMTP id
	m3-v6mr22096618pgn.341.1539019950116; 
	Mon, 08 Oct 2018 10:32:30 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:3c4e:eb69:ac14:ba02])
	by smtp.gmail.com with ESMTPSA id
	z15-v6sm22511254pfn.170.2018.10.08.10.32.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 08 Oct 2018 10:32:29 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Mon,  8 Oct 2018 10:32:28 -0700
Message-Id: <1539019948-25499-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-networking][PATCH] openvpn: enable sysvinit
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 08 Oct 2018 17:32:29 -0000

add INITSCRIPT

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-support/openvpn/openvpn_2.4.4.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.4.4.bb b/meta-networking/recipes-support/openvpn/openvpn_2.4.4.bb
index 4cad998..a839ab7 100644
--- a/meta-networking/recipes-support/openvpn/openvpn_2.4.4.bb
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.4.4.bb
@@ -5,7 +5,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e9b64491ec98eb6c6493ac5e4118f107"
 DEPENDS = "lzo openssl iproute2 ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
-inherit autotools systemd
+inherit autotools systemd update-rc.d
 
 SRC_URI = "http://swupdate.openvpn.org/community/releases/${BP}.tar.gz \
            file://openvpn \
@@ -18,6 +18,10 @@ SRC_URI[sha256sum] = "1ae883d9522c9fa6d189e5e4aaa058a93edd3d0b897e3c2664107c4785
 SYSTEMD_SERVICE_${PN} += "openvpn@loopback-server.service openvpn@loopback-client.service"
 SYSTEMD_AUTO_ENABLE = "disable"
 
+INITSCRIPT_PACKAGES = "${PN}"
+INITSCRIPT_NAME_${PN} = "openvpn"
+INITSCRIPT_PARAMS_${PN} = "start 10 2 3 4 5 . stop 70 0 1 6 ."
+
 CFLAGS += "-fno-inline"
 
 # I want openvpn to be able to read password from file (hrw)
-- 
2.7.4


