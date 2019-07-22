Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
	[209.85.208.174])
	by mail.openembedded.org (Postfix) with ESMTP id CDF107EF58
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Jul 2019 01:11:26 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id i21so35852748ljj.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jul 2019 18:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=CBaWCgXUqJJK6vLmX/3DbVOynzd/jY1aBbMRITkaCcE=;
	b=bzUaczJ6N3F4QC6PzCoe6ChKvs2GhptAjK60J0kNgwpd/zQu2QQA/DNlH7ekYjKSPi
	eaIFZm+PboS19H/mkT2wZNABdy5HxqjA824tk6+LUi595JiL8aIixXMtyKCkRV9QDxnl
	NdycUBpUpjuCowZmxj2YKbyr7pVl9aov5JQC2GHuqWp7ZBiK1142ZHH4b3ptdRiFsTiN
	xBN4ORniFwkYk5dHiWbl3bSM0ogpIZLsj4yP6yuAsIlbsL+4KXMADHtagpt0MbTpRVWU
	epEtr6APIBUQ64MTk+sckcjdeBsNWBcKk1qNwWeVyskfKDTehw1HZdlqO0XsXaCsvcCI
	StBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=CBaWCgXUqJJK6vLmX/3DbVOynzd/jY1aBbMRITkaCcE=;
	b=XWVV9Ud1mFeoZHuEVPYXqCxwsciDa17CI0tqt/3q1DCvxIlJin7ex3SUV5MvxG5hQQ
	rh9akgU5AJghhYRqlxe489cp7UJUvZx9Bt7LSZ1lAeMmpUo7+J8QC84SgPSqV86p+c7a
	gWtX5bCt0SvApF3X7RnStJdBxAVAbLwTkf0ODMR0bzWJysnWgfDSEXRREpFZ2QgtREkM
	dIEPPGDZTEADywW3iFnLaaooKulRL5OCziBcKWhK0ya+WlI94nmvSg6OY1aI6TXkcz0D
	mK69F3ZYt8j2LXvVcPHKuCP0KahIue072UflYVsbQnZeP7livFUJUImS4JKc7CTbHYCz
	ulhg==
X-Gm-Message-State: APjAAAX5WD2lt0o6IZl8NEe0V4S1U0Ze9PzgGP3NVAe/QDMl+VlKgCrc
	cbJ5fLgvMQUMwzKj/z8VCYI5t99K
X-Google-Smtp-Source: APXvYqx2mTOhyETTEv88DnNRiDQNnLhdMFJY1iPebeFG7hlA6ejY6wLjOFjAaxuk6lV7haNPpB6OzQ==
X-Received: by 2002:a2e:3e01:: with SMTP id l1mr13082723lja.208.1563757887020; 
	Sun, 21 Jul 2019 18:11:27 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	b25sm5807431lfq.11.2019.07.21.18.11.26
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sun, 21 Jul 2019 18:11:26 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Jul 2019 03:11:18 +0200
Message-Id: <20190722011118.9778-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-networking] htpdate: update to 1.2.1
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
X-List-Received-Date: Mon, 22 Jul 2019 01:11:27 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../htpdate/{htpdate_1.2.0.bb => htpdate_1.2.1.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/htpdate/{htpdate_1.2.0.bb => htpdate_1.2.1.bb} (90%)

diff --git a/meta-networking/recipes-support/htpdate/htpdate_1.2.0.bb b/meta-networking/recipes-support/htpdate/htpdate_1.2.1.bb
similarity index 90%
rename from meta-networking/recipes-support/htpdate/htpdate_1.2.0.bb
rename to meta-networking/recipes-support/htpdate/htpdate_1.2.1.bb
index eb6787846..d4fd73e3d 100644
--- a/meta-networking/recipes-support/htpdate/htpdate_1.2.0.bb
+++ b/meta-networking/recipes-support/htpdate/htpdate_1.2.1.bb
@@ -22,8 +22,8 @@ SRC_URI = "http://www.vervest.org/htp/archive/c/htpdate-${PV}.tar.xz \
            file://0001-Make-environment-variables-assignments-to-be-weak.patch \
            file://0001-Replace-ntp_adjtime-with-adjtimex.patch \
            "
-SRC_URI[md5sum] = "9d5ca69be06edf5d535b52b5f790da4e"
-SRC_URI[sha256sum] = "22b2cf3ec45b0eedecddd3ad2a3d754ac57942ae7dcbac410d254935f0bdbc03"
+SRC_URI[md5sum] = "cab01ddcb62bd84154670a37a7a0c31c"
+SRC_URI[sha256sum] = "186c69509ba68178e2894cb8900e240bb688870ec25de2ac4676724e1e1d1cbf"
 
 do_configure () {
 	:
-- 
2.17.1


