Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id B66927881E
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Mar 2018 23:02:05 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id b11so76086wrf.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Mar 2018 15:02:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=sqGwk1dg/+4SzcHuV2H6/XdVM8pLExaTcmYbY/lQc28=;
	b=MUA/i+GRZvyNEwlz6ajmu/p/tws7b47aqtrV3kvHObwOjiXR4OO0OTYTZ5D9r5lXCR
	7C47enUqo09kfHeIHOKWbNY+uuPf65Ks4AVffXULEXi9i3Blvr7RlXf6BZpwSdTMIET5
	kNSyMNeCWPMm4u5uRckWhDNXlASRi4+jiWzwL5pAo9fzn2EFaBfJiOiOjk8qaPzwUKnX
	GtFMokJreUUKw8Y1VH/LHJ1j13ogDkTPkJzZpKcamxNOY2nLdWCxj11n95YC6qlX9g9B
	jK7Bst01l5XAd75sso/c2IFE1CfOegyj7gk67hitIocMowY0oHnkBYTXBE6BdwYRUQDY
	dCvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=sqGwk1dg/+4SzcHuV2H6/XdVM8pLExaTcmYbY/lQc28=;
	b=SzzL6gCfifgyMofULuucJbAMD7nbfE7EQBZEaUNZRrN4KDp55htOpWMA/Ep3KSEnmS
	FXQBHKz0KYdN1LeTsN3LgSHsYx5DTAYvhgqn27SfdFxI+Ct7BdvA8hL8s3oqb3bNpafK
	r53P3AL2VPb4etmUS9O6w4grmopoBCxydOuKjqo2c+oI5UCAP4HcTJSzpHfSa6x3Tg99
	kervNSy5Qdc8PY4SCSeMcQmkg0dEHZpkDjRKxdRGSwQ21qWD5bzp3HgtdL5Um9kZVmQX
	5kZ1k3it2208zTuNX2pJAl6z0lpAmgWdeaGcM8+a+BWB2mdRutIALhaC6YajkZz5SmNu
	nOBA==
X-Gm-Message-State: APf1xPAWUjtkvESToqQa1DWsZ/khAsQTEyP5ZAk3A/pzwBxYQgGXUA+q
	WgHQ9JheAE7EGOO+ezxJ4pNNmQ==
X-Google-Smtp-Source: AG47ELtDKGrzDEC6xsIeGjIYjrrMNlThrZbN+4TLzpZjrdvxZ8qDhDziLs6eRhFRJ24ePxGsOnMgRA==
X-Received: by 10.223.151.129 with SMTP id s1mr3329183wrb.206.1519945326399;
	Thu, 01 Mar 2018 15:02:06 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC063001E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc0:6300:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id 8sm5490wmf.13.2018.03.01.15.02.05
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 01 Mar 2018 15:02:05 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  2 Mar 2018 00:01:40 +0100
Message-Id: <20180301230148.2284-5-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180301230148.2284-1-schnitzeltony@gmail.com>
References: <20180301230148.2284-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 04/12] xfce4-terminal: update 0.8.6 -> 0.8.7.1
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
X-List-Received-Date: Thu, 01 Mar 2018 23:02:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{xfce4-terminal_0.8.6.bb => xfce4-terminal_0.8.7.1.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-apps/xfce4-terminal/{xfce4-terminal_0.8.6.bb => xfce4-terminal_0.8.7.1.bb} (68%)

diff --git a/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.8.6.bb b/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.8.7.1.bb
similarity index 68%
rename from meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.8.6.bb
rename to meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.8.7.1.bb
index f42edb672..8d992f1cd 100644
--- a/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.8.6.bb
+++ b/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.8.7.1.bb
@@ -8,5 +8,5 @@ inherit xfce-app
 FILES_${PN} += "${datadir}/xfce4 \
                 ${datadir}/gnome-control-center"
 
-SRC_URI[md5sum] = "92f5a3366e30f5f8238d8250f730b6af"
-SRC_URI[sha256sum] = "bc2a560409a0f0b666d1c557e991748b986ec27572a45ae88b0ee5a480d881d7"
+SRC_URI[md5sum] = "cb34fdf6783d96bebd53e77fd83964ad"
+SRC_URI[sha256sum] = "9ff21627e8d2a105e7133efc3e8eeeda376a2071fac737e37cf47a539a7b4351"
-- 
2.14.3


