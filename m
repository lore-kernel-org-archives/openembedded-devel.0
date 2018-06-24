Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f178.google.com (mail-pf0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id 43AD774DD2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jun 2018 19:19:45 +0000 (UTC)
Received: by mail-pf0-f178.google.com with SMTP id u16-v6so1657637pfh.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jun 2018 12:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Qa8CvlwoWwcl/74t5JOTua/LsjrnIO+bqIwQGk2FVqM=;
	b=QuOlufH/eXoIN32nbKZdHc1FK4PEEZ4JAvbUYybeklMqZA1LNBxvQNPPbKZd0TG6vD
	arUU3hb6EJvVXd5JBujDB0mafejUkEiO8wCGmTuMnNZ1Rk1RZl11WQTcxxMZujTuIetZ
	+r0b/rpJlK+Pl5QXC5eBAWxg7ajyta92913IIggxp35UyUmLVk4leYqW8rUdETloOy9e
	rRvMVEg87tg3UyY/kQZ+v68Oq3KOpcEsSfIQ9N+nSppYA7Izoa5OCQpajazCamsO1zmk
	qqTtTj0/p9fov/hVDWXhSLvhvKApyEdvSLjaH15PBQJgT5m25OzMn10nsaEHzgtVsPYH
	f9lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Qa8CvlwoWwcl/74t5JOTua/LsjrnIO+bqIwQGk2FVqM=;
	b=YJcEOBROWQiQi79vJVUSoXCTXMW0kyZwvV7q0PJ3GxW6jqMl8saGVvB56PsQcaxexF
	Dzmd7CVDH4YyCSLUqEOSB7K+ZtZSKaiQzk57pEiGRjvc0ssRE0f4hQ/NwTFrly1XUDeh
	BN6P2ACIdEHgp3Sy0tGsSYxaI/YRn8yYHu1QqFUP7qe85GnheB0UgaX7u4RstSt5h8pA
	EzXZMVAda5MEGQA7iJNGzb4fZhjlQ+Wu/DCISzBOlS5mDpr08EqtmqG41mFGl1XVxiMa
	weZT8tl5XZ2i6Q/lmyxrZyJb3wq+tkmev2qDpH6g86e68AQRGRDxhoY3E8E9svYufuyc
	sXwA==
X-Gm-Message-State: APt69E2Ye7cf8eno38OGEOIkNoQARKXKi5hqjynmJKFVKv1Q7vKpIm1/
	mNZ2y3QrSK2G0iSyXjIb2sYOuw==
X-Google-Smtp-Source: ADUXVKK+EYj7yFPJ75pXC+YA2n4h8HtvDJv4Zs5JN/8o+11v95Uy2vFvACJakcCuZdqv/w9qqAV2aA==
X-Received: by 2002:a62:6303:: with SMTP id x3-v6mr5434751pfb.91.1529867985969;
	Sun, 24 Jun 2018 12:19:45 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::91a0])
	by smtp.gmail.com with ESMTPSA id
	m11-v6sm36700461pfj.25.2018.06.24.12.19.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 24 Jun 2018 12:19:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 24 Jun 2018 12:18:41 -0700
Message-Id: <20180624191845.31082-16-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180624191845.31082-1-raj.khem@gmail.com>
References: <20180624191845.31082-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 16/20] corosync: corosync-qnetd.conf is now created under /run during runtime
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
X-List-Received-Date: Sun, 24 Jun 2018 19:19:45 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-extended/corosync/corosync_2.4.4.bb | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta-networking/recipes-extended/corosync/corosync_2.4.4.bb b/meta-networking/recipes-extended/corosync/corosync_2.4.4.bb
index 5ebec08b99..23a3d147f3 100644
--- a/meta-networking/recipes-extended/corosync/corosync_2.4.4.bb
+++ b/meta-networking/recipes-extended/corosync/corosync_2.4.4.bb
@@ -67,10 +67,6 @@ do_install_append() {
     if [ ${@bb.utils.filter('DISTRO_FEATURES','systemd',d)} ]; then
         install -d ${D}${sysconfdir}/tmpfiles.d
         echo "d ${localstatedir}/log/cluster - - - -" > ${D}${sysconfdir}/tmpfiles.d/corosync.conf
-
-        if [ ${@bb.utils.filter('PACKAGECONFIG', 'qnetd', d)} ]; then
-            install -m 0644 ${S}/conf/tmpfiles.d/corosync-qnetd.conf ${D}${sysconfdir}/tmpfiles.d
-        fi
     fi
 }
 
-- 
2.18.0


