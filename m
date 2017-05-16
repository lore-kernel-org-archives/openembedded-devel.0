Return-Path: <costamagna.gianfranco@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 16D6977D2E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 May 2017 11:00:44 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id v4so37234543wmb.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 May 2017 04:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=393RtdMohVvx8I3YvipLUCetbg0AN1KZXpWzPGPRUhg=;
	b=UqHQ/15EtSIQeoZA/Aue8LQQm7lGae/IAoygOxKQSpNEuiyc3fxf9235icTHtcpl4c
	N2XfbtM40WoFkAXf6YFi2H/MLLwgbefplPFN/Jx39AH53WAnN2ObdSpqhsZEIFPiOJIP
	RPCeyZ1P2+IdakW32UqGZoNiiWDPsoWHvyIN0U+mTFdhSuKNrcDGXA7QCziOyMabN1En
	okUAWSDMDmiIU8AwYndsSBMaJudN3ofm0tDMtcKOg8iD6JA3UWECizADR0DzGl7b1BVQ
	7jA1ZU/Vu2k641ONoE0R9a2tJj8UKXWOZmjQ3p3uAaLglUOkw+KDeERraVJ3vJYQui9h
	XOFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=393RtdMohVvx8I3YvipLUCetbg0AN1KZXpWzPGPRUhg=;
	b=TxpBEYYiiv5mckhQPT/Dj3inOSFfMVaaKDTmtly2Ow/EP+iaZrByh62g6IcMTmJkzK
	2fs1lbnFGnNIiot+hJsPa1y37W+Kf8pXIO8zIGdKWXRUufbcgjY9S5ZKpfnVfiNlVpVI
	tK8fGq81bRjeT+0Pc1E/tDJKJjRTVXBdgyox6qgUENb1AJ0SqHFK782xuGap3/+gGYwV
	vpqK6PiH7mBvTD9GEIO0Yr6dbFY2SH6/RKn0LUwoIwuc1BXUSAzn7qPHRXxO8pwY9JYE
	iqTetl5l/jYA14QLbZn1o9z5kFjREdLdfWQ5GY5BQUfKuaeAbK4+feyn5CZMb7tTj36U
	Yw6A==
X-Gm-Message-State: AODbwcD0Wiw8yRYZxZs8eskXzySvNwaw+fTUpqFfvG7hyoDUha6ky5qS
	Fd/OLhHZnXahmA==
X-Received: by 10.28.15.14 with SMTP id 14mr7182799wmp.51.1494932445944;
	Tue, 16 May 2017 04:00:45 -0700 (PDT)
Received: from localhost.localdomain ([37.177.79.194])
	by smtp.gmail.com with ESMTPSA id f2sm1752989wmh.27.2017.05.16.04.00.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 16 May 2017 04:00:45 -0700 (PDT)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 16 May 2017 13:00:40 +0200
Message-Id: <1494932440-30228-2-git-send-email-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1494932440-30228-1-git-send-email-costamagnagianfranco@yahoo.it>
References: <1494932440-30228-1-git-send-email-costamagnagianfranco@yahoo.it>
Cc: Marius Tiplea <marius.tiplea@windriver.com>
Subject: [meta-oe][PATCH] drbd-utils: fix dependency for perl under small-fs
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
X-List-Received-Date: Tue, 16 May 2017 11:00:45 -0000

From: "Yadi.hu" <yadi.hu@windriver.com>

Perl script drbd-overview fails to run due to some of
perl's lib noexists under small rootfs,fixing it through
adding explicit definitions

Signed-off-by: Marius Tiplea <marius.tiplea@windriver.com>
Signed-off-by: Yadi.hu <yadi.hu@windriver.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
---
 meta-networking/recipes-support/drbd/drbd-utils_8.9.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/drbd/drbd-utils_8.9.6.bb b/meta-networking/recipes-support/drbd/drbd-utils_8.9.6.bb
index 3d6f5b2..67ed8e5 100644
--- a/meta-networking/recipes-support/drbd/drbd-utils_8.9.6.bb
+++ b/meta-networking/recipes-support/drbd/drbd-utils_8.9.6.bb
@@ -30,7 +30,7 @@ EXTRA_OECONF = " \
                 --without-manual\
                "
 
-RDEPENDS_${PN} += "bash perl"
+RDEPENDS_${PN} += "bash perl-module-getopt-long perl-module-exporter perl-module-constant perl-module-overloading perl-module-exporter-heavy"
 
 # The drbd items are explicitly put under /lib when installed.
 #
-- 
2.7.4


