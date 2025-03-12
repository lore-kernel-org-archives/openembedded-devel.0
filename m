Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8905C2BA1B
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 08:13:17 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.31632.1741767194957743121
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Mar 2025 01:13:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KP5GJ6OZ;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2232aead377so28638425ad.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Mar 2025 01:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741767194; x=1742371994; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZsGKdlBy1fHcBl1OYW/+nM1AS4OUtyfSRLpTYtOHtQs=;
        b=KP5GJ6OZBe0Lir8ElGsv6unTnBxUqNQD82GIEgbidNo9C6AclCYd6oEym+Qjq0Hq3k
         XbqaovjiCCgSNGWtTcvYkSisda1ZgXL3djBpLx5JZT9kLnXxH3g9NeLj9oV0krgksWWC
         HHgO9cJ5/XloSsSvy3Rff9I5j6QekVWANQ6fqIigteyVGcM5XZ2rPoWxi9bf0xPGeJAK
         E5kw03CG6hy9oryhgHAJ1k1Zam4t1cs3zXsKYd5jstFCYv7l5ltSz3YGWGvJzhUIStbK
         w4NOKPRjKhmKKR6lwZTIXnUNolP65t0zDm5TJmYRzpmzvLlo3YVIKqYURLBHinF5UwRM
         BRkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741767194; x=1742371994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZsGKdlBy1fHcBl1OYW/+nM1AS4OUtyfSRLpTYtOHtQs=;
        b=vOe9mkXQtNP05E6NNpCZHKhsXl2DUCf87uy6yZJruQFvVWikVYsM5TR6//NJxNuKLq
         Rm+pdrKJaE3OaqzrT/RJDYF1G5IRHxF6c35n1QsE+YJPNEOUvTZEfG73lcAJOtgPnZIP
         XgWHGh7ACHujgnuKGeiARsFe9tWiiRH/HZiAVYlJdKaNOEBzvqAlMka9rHV8ccuXxTuO
         6XZypb763JIA2nIwTlBhGeOx3nfT0YhJhwIZeQJio0wt48E1cyHdb3LM4F+d1DOXdX4X
         mLfOvBc7IfohHB5BEqLJ1BrMpbl6KvTEzF4t+2NU4LeqsQn5vYbDl4fl3VuGqIBzx/Hn
         uDtg==
X-Gm-Message-State: AOJu0Ywlqx8rnIAcx8cxyKXHH/KhRMOzVGNtVYXWnYNZ+byyRqoZgwnX
	IVZ5p6GNv2HSAizAIUhi1MrVkUcxW86FNfab19V/f0BJQQkatfQ8XWrh+yp+
X-Gm-Gg: ASbGncuVL5dZkwFacJBOn8WKvNdglwARamGZN+WiHVDniNzz9VEiHudu+5hMaD60veo
	VCQnZ0JoCi1uo5X3plYj5p2p07/sHxdvVFczaEgY6vqQP4c4Y6gXU5tgqiPaLLRB2xEox26qYZO
	muM4IAliGA97L3pyU8qmibmiOuQK8T5IJhAEoyzAPuuvcQl11ucbih/aBWb9x7yXDtBqI04IONP
	0T/pLsWd5gMUs+YOzKPCTb0FGudXPjIKHJxTAUW7GVi+/8lWOporHGQeWo890jTgTjoNzo3dcGY
	oOzbZfTf+8hfU6u7DVI6lU8IAC6Z4X/ZgSeC
X-Google-Smtp-Source: AGHT+IG1NOmUxt5opi5i1IVe/cHDUcoKLC3JxG/MKpGbb4MG1RJE39M5SqnucKpskN36/lncV5yvaQ==
X-Received: by 2002:a17:902:cf07:b0:224:192a:9154 with SMTP id d9443c01a7336-22428a8cf90mr318605275ad.26.1741767193976;
        Wed, 12 Mar 2025 01:13:13 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::6874])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22410a7f5dasm109986665ad.137.2025.03.12.01.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 01:13:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 2/3] keepalived: Make keepalived cross compile reproducible
Date: Wed, 12 Mar 2025 01:13:05 -0700
Message-ID: <20250312081309.3413533-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250312081309.3413533-1-raj.khem@gmail.com>
References: <20250312081309.3413533-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Mar 2025 08:13:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115914

This should help with not emitting configure commandline into
binaries, these may contain absolute build paths

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-daemons/keepalived/keepalived_2.3.2.bb          | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/keepalived/keepalived_2.3.2.bb b/meta-networking/recipes-daemons/keepalived/keepalived_2.3.2.bb
index c0a2e57bfb..6fb4886b96 100644
--- a/meta-networking/recipes-daemons/keepalived/keepalived_2.3.2.bb
+++ b/meta-networking/recipes-daemons/keepalived/keepalived_2.3.2.bb
@@ -21,10 +21,11 @@ DEPENDS = "libnfnetlink openssl"
 
 inherit autotools pkgconfig systemd
 
-PACKAGECONFIG ??= "libnl snmp \
+PACKAGECONFIG ??= "libnl snmp reproducible \
     ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
 "
 PACKAGECONFIG[libnl] = "--enable-libnl,--disable-libnl,libnl"
+PACKAGECONFIG[reproducible] = "--enable-reproducible-build,,"
 PACKAGECONFIG[snmp] = "--enable-snmp,--disable-snmp,net-snmp"
 PACKAGECONFIG[systemd] = "--with-init=systemd --with-systemdsystemunitdir=${systemd_system_unitdir},--with-init=SYSV,systemd"
 
@@ -45,6 +46,9 @@ do_install:append() {
     if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
         install -D -m 0644 ${B}/${BPN}/${BPN}.service ${D}${systemd_system_unitdir}/${BPN}.service
     fi
+    if [ -n "${@bb.utils.filter('PACKAGECONFIG', 'reproducible', d)}" ]; then
+        sed -i -e 's|${WORKDIR}|<scrubbed>|g' ${D}${sysconfdir}/keepalived/keepalived.config-opts
+    fi
 }
 
 PACKAGE_BEFORE_PN = "${PN}-samples"

