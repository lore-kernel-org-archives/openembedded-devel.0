Return-Path: <athoik@gmail.com>
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by mail.openembedded.org (Postfix) with ESMTP id 646806D523
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Jan 2019 10:24:55 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id p6so31436820eds.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Jan 2019 02:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=S1twmG7y0dzqKcHOMiioxxWI+ee1/3l79/7S5Ox7OKY=;
	b=oVrZ3BcA2NcvpnradvaCH84edu7Y6BwoazJIh1yi/m7OZEnj5apUkTdnpfnQp89YA+
	zhb6kq04X64VPfIrrq27S8/U+dipTrU1c157T9OK4atDtPCO+r4NSFuQ7o/OcHy4ih4u
	utQsNdn3ZbxIFW8rxpl/kF4yrlpxJiZ/Tra1u8eZNbHD6qISYoXPruQUc8xfNqaE92U+
	7ztc0Ua0+vrCHsYNd4UUC3nAspF0qwMg6c86mgYAN+BX0wk8xrBgy76YmS1Oj61Gnk4K
	h5u++R4YLSFu6WyCE+HrJk5nnaWZysSUDS50un7nGQAPIF3CLJLRnZarVSoRF0DkEU6p
	NqbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=S1twmG7y0dzqKcHOMiioxxWI+ee1/3l79/7S5Ox7OKY=;
	b=CdjOIdVPqZxNn9DVIPMJDPEoi5frQJ7HI5u2CyNUWnTEBXubDjvMvo/F/C4tiJpfWv
	FBUAAJKERlJ2rBT7k9QOYQEpMh37WxMkhAGEQyrgQy+RrZRAR2u3TIhu4Fgef9TY4M4c
	rkIiJQOU5/CnBwhzPLqrrrCeXKqFGOrDgoEiIfEeFAoetr7KdicBE4c4FeOH09zMYX2I
	P2w2r6cDfKTzdFzCoeYsZmICXXszdNTRU+AxVoO/GbFVRUek2UP3JAERRIKFLxhBjFz0
	6acn79cOpYTumdRoQfvBZzI6AvGhm1sAqEjwgZRnjtE1uBuEREY0Xqfyrxm31dnp+bS9
	gczQ==
X-Gm-Message-State: AA+aEWaBgUN43zmcOEDc4w2I5EEvUAFbasLjDdy+7u6HMbVtfzAPfvtx
	n6lvS+Q9+zeOKv2uz1rckRM3C3H9hQ==
X-Google-Smtp-Source: AFSGD/VPabZm+XrJP3qMEIXsLALEZwFu//aBN9BHiOKNH2kCccXzA76rvVEryRAClliu5Wsw3GOa7Q==
X-Received: by 2002:a17:906:4e82:: with SMTP id
	v2-v6mr37958637eju.149.1546597495543; 
	Fri, 04 Jan 2019 02:24:55 -0800 (PST)
Received: from images.net (ns380618.ip-188-165-252.eu. [188.165.252.42])
	by smtp.gmail.com with ESMTPSA id
	by5-v6sm14556933ejb.7.2019.01.04.02.24.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 04 Jan 2019 02:24:54 -0800 (PST)
From: Athanasios Oikonomou <athoik@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  4 Jan 2019 12:21:08 +0200
Message-Id: <1546597268-28446-1-git-send-email-athoik@gmail.com>
X-Mailer: git-send-email 2.1.4
Cc: Athanasios Oikonomou <athoik@gmail.com>
Subject: [meta-filesystems][PATCH] fuse-exfat: fix multilib build
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
X-List-Received-Date: Fri, 04 Jan 2019 10:24:55 -0000

Replace the PN with BPN to fix the multilib build.
---
 meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.2.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.2.3.bb b/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.2.3.bb
index 99bf2be..ea00222 100644
--- a/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.2.3.bb
+++ b/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.2.3.bb
@@ -17,5 +17,5 @@ inherit autotools pkgconfig
 SRC_URI[md5sum] = "fca71e6598f79d037a3c7c969cb5710c"
 SRC_URI[sha256sum] = "f2e06eba5a21c621aac1d6da21b12a5a324fdd1e20f9c8acd357dd463c2355d9"
 
-S = "${WORKDIR}/${PN}-${PV}"
+S = "${WORKDIR}/${BPN}-${PV}"
 EXTRA_OECONF += "sbindir=${base_sbindir}"
-- 
2.1.4


