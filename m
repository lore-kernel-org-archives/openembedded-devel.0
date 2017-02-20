Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id F0C3171DB8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 18:07:21 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id v77so15738518wmv.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 10:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=l1wddjC/eEB50QAvC5WrZ+tzBHi+T0O2OvODpOGjmfk=;
	b=JnfGMa13hkh4Y/eAgXkeWDIl9SVw0UMTHE0B6l1MekPOqL7xKt2xvDEWeJVuCA/Pqm
	qe1P2jU6ZVK961jcbtlInBM5ZYS8yf3ibmvqqK0wJpzZQkPxRR/qrXNi8S+PEeWJ0TcM
	3XDQIS+jda2iXrSo6FIxU35NDP+nIW9lLJ+W5gteMAWE2x3fYoflhHJa5leUN4L4wdxm
	ECas8fiIRsxIhJAtX+XfgpUrvcxaRccuMtf9DXJn4muya+vBHpcliNYkJEWGiAnF31Ls
	k3sEt+jx3mlrsvvYnkqqvJh8UT5QABPjdlTehQlxHCTDT8KFGU8p58rHjBK58KGeclqi
	nVWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=l1wddjC/eEB50QAvC5WrZ+tzBHi+T0O2OvODpOGjmfk=;
	b=PaPozXuI4Dodkw0REquxHe9y5gvPdKKkoQpnjNZmCbLsxg4SENOp1HsBGiPQ981V4I
	BKkUSua2VrSKAv+7euzydpTqiGVNvNbo/+AQBNIdoNZmwOt1ocys65f2VVyZZKwvArS7
	MGKgtDzMhjjFRShs1UUws9pZjPFEwxYnbUrU7Z/Y6pJPhDOTjFzPeDJSjTZa8knTz1gZ
	sXNCKiR9eRfndKOrnpunkzsm1EL12SsQOXX2c9We7vdDjbAKaKacAO2Q3DOelxMpLZWF
	dWUHWJoWhAelS4zs3unRKjT58Z1SuyOtVJ8GfLehfRhcVlyDK+k0Qqq5FaVRjGB50UxK
	PhbQ==
X-Gm-Message-State: AMke39n1IBDmUR3ZeNO1GVybKxYsaCS+lOZAlui9eiwBJ0FjGcbHoxl6kLY7Y0C1UjVxEg==
X-Received: by 10.28.103.3 with SMTP id b3mr18973835wmc.99.1487614042108;
	Mon, 20 Feb 2017 10:07:22 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E911DE631E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e911:de63:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	96sm2863710wrb.14.2017.02.20.10.07.20
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Feb 2017 10:07:21 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Feb 2017 19:06:22 +0100
Message-Id: <20170220180700.29836-7-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170220180700.29836-1-schnitzeltony@googlemail.com>
References: <20170220180700.29836-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 06/44] libgnome: unblacklist gnome-vfs is back
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
X-List-Received-Date: Mon, 20 Feb 2017 18:07:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-gnome/recipes-gnome/libgnome/libgnome_2.32.1.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/libgnome/libgnome_2.32.1.bb b/meta-gnome/recipes-gnome/libgnome/libgnome_2.32.1.bb
index 9d25b9b..0055ba4 100644
--- a/meta-gnome/recipes-gnome/libgnome/libgnome_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/libgnome/libgnome_2.32.1.bb
@@ -34,5 +34,3 @@ FILES_gnome-common-schemas = "${datadir}/gnome-background-properties ${datadir}/
 RDEPENDS_${PN} = "gnome-common-schemas"
 
 FILES_${PN}-dbg += "${libdir}/bonobo/monikers/.debug"
-
-PNBLACKLIST[libgnome] ?= "Depends on blacklisted gnome-vfs"
-- 
2.9.3


