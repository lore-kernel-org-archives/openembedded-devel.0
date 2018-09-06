Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
	[209.85.210.172])
	by mail.openembedded.org (Postfix) with ESMTP id E1C8D7971B
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Sep 2018 21:16:17 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id i26-v6so5881391pfo.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Sep 2018 14:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Su3zyAmVBZLGTl6I4Lt6AhuMHozY/wN9QJNsuTzpZMw=;
	b=gBF0Trb6tiXAtixmnAH/POAFHOl3YZWjV/STnUue+6XgbdZ5Qj8/Q+rjTt6hkBWmpk
	WbqyWSJWO09jxEfxvpS8WdxY5qtGu0BP1JkgB5HDfH8OvdB4e/VRGcW8KOeAk8314LvM
	f7/YNkJbwsv4P/1twDUMK7+MUjbKHyAE6Dhm+y0QF5qUWU5LwWJlVB/LgJAeZLt1SGXG
	KgAihSYwUyiAR1uve2guRNDwd4XHqusDCF8BhTqqjudt+FiABYH8bugcL94AaX7oq0tZ
	ZefLEpGcL4M1zuxrrun15/M8Ak1Vp6A6700I4Gaw3LPXvUskyiROfFa8SxmutQ4qutTy
	om0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Su3zyAmVBZLGTl6I4Lt6AhuMHozY/wN9QJNsuTzpZMw=;
	b=aS6vSXug7tt5PqKfDar0P2nVwzEMFnqyQpE8BH4dyUHRDDdvrktb/ziE8baSlPZPd8
	Cigp4N05xl2mt7E0KrnSepTs358R0rtBEv1y0F1KSVUJBPMRWkVwc8Q3HCbvsFzC091Y
	6bxgwFJcG4MMTpNKvi8GOL8ZBQuIYDLW3ZDe/Gq2Vv70vgI+hJxC17MvXZM237SQhmH9
	HjGVdUxrBrhz2rnnN5ZyZ+pEF8VG5rw6INFEij7udqLG3kz1iyaZ7JXkNG5sLjtKJDut
	Z9xUq7fxRaRE33KwRNJTClowu58ibQ80oHtEl3f2XNQx4KX8MEayZAUtSd1mcgsTxcrj
	yPIw==
X-Gm-Message-State: APzg51BI6PSUsAkxwdPEtY4td0GLNGHbUrsNeHGJetneNbV2TGosSQ6O
	dsMzZ/Nv48lTS3oD3o4dhd1RFjIq
X-Google-Smtp-Source: ANB0VdbZL8xvfRwBp83pMfqJYeD+Sm6lb3lFHvQj6Y1iSgN11fskk3jYJMWB8gvZUC7SHgjYruYIEQ==
X-Received: by 2002:a62:3001:: with SMTP id w1-v6mr5046051pfw.19.1536268578494;
	Thu, 06 Sep 2018 14:16:18 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::71e7])
	by smtp.gmail.com with ESMTPSA id
	r18-v6sm7375776pgj.51.2018.09.06.14.16.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Sep 2018 14:16:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  6 Sep 2018 14:16:05 -0700
Message-Id: <20180906211606.4910-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180906211606.4910-1-raj.khem@gmail.com>
References: <20180906211606.4910-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/3] rtorrent: Upgrade to 0.9.7 release point
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
X-List-Received-Date: Thu, 06 Sep 2018 21:16:18 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-connectivity/rtorrent/rtorrent_git.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-connectivity/rtorrent/rtorrent_git.bb b/meta-oe/recipes-connectivity/rtorrent/rtorrent_git.bb
index c731cf7079..9bb81c4096 100644
--- a/meta-oe/recipes-connectivity/rtorrent/rtorrent_git.bb
+++ b/meta-oe/recipes-connectivity/rtorrent/rtorrent_git.bb
@@ -8,9 +8,10 @@ DEPENDS = "libsigc++-2.0 curl cppunit libtorrent ncurses"
 SRC_URI = "git://github.com/rakshasa/rtorrent \
     file://don-t-run-code-while-configuring-package.patch \
 "
-SRCREV = "226e670decf92e7adaa845a6982aca4f164ea740"
+# v0.9.7
+SRCREV = "327164f9d86aafcd2500a317d485374df32ea622"
 
-PV = "0.9.6+git${SRCPV}"
+PV = "0.9.7+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-- 
2.18.0


