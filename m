Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id B59DC78637
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Nov 2017 13:30:01 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id o88so10746694wrb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Nov 2017 05:30:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=8uOoE/h9tPPkKg0Ao2Tp/KWyqmbE7ipO9HETLUroclQ=;
	b=umaSWEC6G+8c/5cYQV6czbNAwWxTZGqgPaIWdw5wVfqSvvoernXh0k78CNArXMWpW0
	5crSVssH2P/8v9GNwCM7DCMehlSFLeaenJ50phVu1eWtyW+AVptUBBR/lIPQHC7iOwzu
	3OBULk+aHM/9s1CenWrm1eEtGXVXDLNJuJIlnvrInml20ejFueEel8NxSGAwFCPSXUDx
	u9CpTQ7dlGQXfvXCGPl2BzXPwSbbCzwr85V3SPrv/apSmI8DL8qEs9FGtOpqyvNrpqxE
	GJ875tTXl5G982BMILiWdS0LLGmdqotv4veb+r5IFCIxMiQEDmPdPPDA2nLHFFGlftxl
	AzNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=8uOoE/h9tPPkKg0Ao2Tp/KWyqmbE7ipO9HETLUroclQ=;
	b=lcTy+wTJyz82wmwcCoiR20B0HMw2o6iQueOLP+eqmw7YDslaxtdDOfn0sK9CSXXIrW
	dyXyHJEqmDnx2XQmul9zg3M8elDVwFugRBGRN5oZ/jVRhFxGNKag+54+rfNco8Suwr78
	ZHKbQNEm7Q2j65Lku++gYTYPpFbtVk7qgbSVZy+TiFERtz5cyABrZS4PUxCu9WXBBKaz
	ozt0vrpiBA24RqOsbIGu49Q78O8Yi7AEe8WRTRs1+IJEuAH5wpcFFHOwHRgXKNoImsm/
	LlL21AbH48t7LRtuzFvIpkXAl/iKNRPwYsP17Qw3uB74qQLzrTThcfPN35fNyupQADrr
	VUyg==
X-Gm-Message-State: AJaThX4XQ8BBuzypb0PyiQPN5WZ6p5H89wP0KLJT9tu0ph++m5uW4GXc
	H1e8s29CjKta50jj64bQulNNCw==
X-Google-Smtp-Source: AGs4zMZAT6+DNHCHQL4mmx1fqtKW0Pt35FTp2fRpMsQ5MKBWkIfpvkT3Bj7FddlpajDuB1kR6fH73g==
X-Received: by 10.223.165.89 with SMTP id j25mr436744wrb.206.1510407002438;
	Sat, 11 Nov 2017 05:30:02 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p20030070ED074A591E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:70:ed07:4a59:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	195sm16189805wmj.3.2017.11.11.05.30.00
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 11 Nov 2017 05:30:01 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 11 Nov 2017 14:29:38 +0100
Message-Id: <20171111132950.12570-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <20171111132950.12570-1-schnitzeltony@gmail.com>
References: <20171111132950.12570-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH][v2 01/13] gparted: update 0.28.1 -> 0.30.0
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
X-List-Received-Date: Sat, 11 Nov 2017 13:30:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Andreas Müller <schnitzeltony@googlemail.com>

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-extended/gparted/{gparted_0.28.1.bb => gparted_0.30.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-extended/gparted/{gparted_0.28.1.bb => gparted_0.30.0.bb} (90%)

diff --git a/meta-gnome/recipes-extended/gparted/gparted_0.28.1.bb b/meta-gnome/recipes-extended/gparted/gparted_0.30.0.bb
similarity index 90%
rename from meta-gnome/recipes-extended/gparted/gparted_0.28.1.bb
rename to meta-gnome/recipes-extended/gparted/gparted_0.30.0.bb
index 83ab6f2..cea0e3a 100644
--- a/meta-gnome/recipes-extended/gparted/gparted_0.28.1.bb
+++ b/meta-gnome/recipes-extended/gparted/gparted_0.30.0.bb
@@ -10,8 +10,8 @@ SRC_URI = " \
     file://org.yoctoproject.pkexec.run-gparted.policy \
     file://gparted_polkit \
 "
-SRC_URI[md5sum] = "ab72464a3ab2137664d9df8462befd3f"
-SRC_URI[sha256sum] = "76891f14394754f7d6ecceba2af0e585bf89f9d780c389a255dcd41a2f45d333"
+SRC_URI[md5sum] = "09b12d3831e91b26ec8726b00eecd43d"
+SRC_URI[sha256sum] = "d31193effe058bdaeb2a4cd4b514ec753191179a0bc3abefda68a2b7975ecf4a"
 
 DEPENDS = "glib-2.0 glib-2.0-native gtkmm parted gnome-doc-utils intltool-native"
 
-- 
2.9.5


