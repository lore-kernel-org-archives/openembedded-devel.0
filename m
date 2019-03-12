Return-Path: <tom.rini@gmail.com>
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
	[209.85.208.44])
	by mail.openembedded.org (Postfix) with ESMTP id CC2397C692
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Mar 2019 19:26:51 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id g19so3344962edp.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Mar 2019 12:26:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=XsYDY5UpfquyWICa7DAz2IuA5eu5ssNENPftI8NNJnE=;
	b=pcbaj0f0QmNpsmTlcBaNjRuh+pOUGkI50G65Ahou62atB7+EReeW/4Y/t15wDOIW8v
	toAtlI9R9dg0keNs4Kb6GuqbCb55VErmwtPZS4XVw2cg6lRRcxmRMW4RNtOkDSt+cPBc
	Zyi6rS/mth7zhr1EJalS5NvKJZtPOq7Qo59nmuLvgrvnH4hMLCyFWBnqhuzntWju4BAt
	QyAMEAc4/JdoGia/ts1v/f8OFqYAIGfT7k6RrXhLS3/ZA6XmRhsBce9DXuYusPoXdGzy
	vOZOeAuUOUmy14gvYySVeF7edPQmaABVJ61DN6Y+baEaAyY2LiCQw7AqEDeFFQiZktvF
	H+wA==
X-Gm-Message-State: APjAAAXRuQ7QIyyc8ktPojZHBI1Mvxshw8Ut0xUgNpxTgqw9SKpgvpd6
	k2vXOfQpzE7ZbgaPVAZLKIXp0/k=
X-Google-Smtp-Source: APXvYqzB+EynuoTPXadLs57Yv4BoqxM5IsQsfpJ0oRjFxjUBLx1qCesk2SKJ8qoXeyez/gPZusRr4A==
X-Received: by 2002:aa7:d80b:: with SMTP id v11mr4702404edq.6.1552418812103;
	Tue, 12 Mar 2019 12:26:52 -0700 (PDT)
Received: from bill-the-cat.local
	(cpe-2606-A000-1401-8115-A588-1A0B-A41-7B0D.dyn6.twc.com.
	[2606:a000:1401:8115:a588:1a0b:a41:7b0d])
	by smtp.gmail.com with ESMTPSA id
	fy6sm3864739ejb.52.2019.03.12.12.26.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 12 Mar 2019 12:26:51 -0700 (PDT)
From: Tom Rini <trini@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 Mar 2019 15:26:46 -0400
Message-Id: <1552418806-20911-1-git-send-email-trini@konsulko.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-networking][PATCH] netkit-rsh: don't build under musl
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
X-List-Received-Date: Tue, 12 Mar 2019 19:26:52 -0000

Uses iruserok and ruserok which are GNU extensions available in glibc
but not in musl

Cc: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Tom Rini <trini@konsulko.com>
---
 meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb b/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb
index 03dd96338a1a..d034cd8eda99 100644
--- a/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb
+++ b/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb
@@ -39,6 +39,8 @@ PACKAGECONFIG ??= ""
 PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}"
 PACKAGECONFIG[pam] = " , --without-pam, libpam, libpam"
 
+COMPATIBLE_HOST_libc-musl = 'null'
+
 do_configure () {
     ./configure --prefix=${prefix} --exec-prefix=${exec_prefix}
     echo "INSTALLROOT=${D}" > MCONFIG
-- 
2.7.4


