Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id A5CCF74F99
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  3 Jun 2018 02:27:04 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id l1-v6so8586522wmb.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 02 Jun 2018 19:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=P3n0e7a+Xdbo4F3luSgKUkgOfF2fGPlT98fEWUJp56c=;
	b=OY1Ai9GGCgfh+iJtl0vlp3t4DpNSxA9lqkDEmcY6nbMLjgY/LbzHI6IOKmht/dWQVT
	6rLW/+JzcWrP2SBE3aSssX40Rg7WU9e8gSvUtSXcl/p7iI4jm/OcpsD2jThNP8Q1g360
	J+k1du/6SmYAhOxHOKHMsJu4WBDvKKOcvqmB1bjOSKYuCov1WsJPLnPep2SV+UGugK/d
	i4wJHRQBxXlE0rbrunigPNblKP/HtKCqyY70D20kORlBkrUK2S3UK8/EGBHRZ8YANWSx
	HpGsnMHVTPMZGL8BOHut9hUs1c6cQao04gST0hVZSk2iBlTJYaYpZApCozIvz5fxR2aG
	Ofng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=P3n0e7a+Xdbo4F3luSgKUkgOfF2fGPlT98fEWUJp56c=;
	b=tTXSRRkfjcni5a7azR5kyH4fV6zLYVjVob2aBPm/j0XXRIRq9DinyRpCE0kN+FKjXJ
	GxkZBjDjwfuuv3Se5c86qstqm59XQGQMlLKjW/svkH1Gi/WIYWBLlhX8ZlIV/hdZtRkI
	TZHzQ+2331ku5A0kjxOtkoq1nt/0GsL9IhDTlKH98rfBUk+RDFMjMMd5he3OS+V7pSkK
	YYDyS2pIPezO2C6ymOF7F0ukZgzNrsCKWHLPad9F+2JT/8QHIZ/YnrGcBnNp+f5D2Ott
	PwqUmbwY9K3AYxaPwG9/OolEMaq8fai9Ei5qK76cCkeiU8yO6SSFaBmFnolO1i0s3TA0
	T1yA==
X-Gm-Message-State: ALKqPwcYZgXIbWy79qZoFZsFVvlpM6ZQ5O98oUSOoZ4Z6zk/EFqzvAbE
	HgcrAdlin/7XUtR+/HTOGeIufgOw
X-Google-Smtp-Source: ADUXVKLcqaXXnLrkfgaSFZrbvY637ZFFOuE40e9DvJQ+gpfv8L2ydLzHMz5k/l+6wRIASUBDoXfG8w==
X-Received: by 2002:a50:f4cf:: with SMTP id
	v15-v6mr18416661edm.162.1527992824951; 
	Sat, 02 Jun 2018 19:27:04 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ae08:1403:ff00:489:7961:466d:7cf7])
	by smtp.gmail.com with ESMTPSA id
	f13-v6sm676378eds.15.2018.06.02.19.27.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 02 Jun 2018 19:27:04 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
X-Google-Original-From: Oleksandr Kravchuk <dev@sashko.rv.ua>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  3 Jun 2018 04:26:55 +0200
Message-Id: <20180603022655.1625-1-dev@sashko.rv.ua>
X-Mailer: git-send-email 2.17.0
Cc: Oleksandr Kravchuk <dev@sashko.rv.ua>
Subject: [meta-oe][PATCH] htop: upgrade to 2.2.0
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
X-List-Received-Date: Sun, 03 Jun 2018 02:27:04 -0000

Signed-off-by: Oleksandr Kravchuk <dev@sashko.rv.ua>
---
 meta-oe/recipes-support/htop/{htop_2.1.0.bb => htop_2.2.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/htop/{htop_2.1.0.bb => htop_2.2.0.bb} (89%)

diff --git a/meta-oe/recipes-support/htop/htop_2.1.0.bb b/meta-oe/recipes-support/htop/htop_2.2.0.bb
similarity index 89%
rename from meta-oe/recipes-support/htop/htop_2.1.0.bb
rename to meta-oe/recipes-support/htop/htop_2.2.0.bb
index 33508f984..01c856d12 100644
--- a/meta-oe/recipes-support/htop/htop_2.1.0.bb
+++ b/meta-oe/recipes-support/htop/htop_2.2.0.bb
@@ -8,8 +8,8 @@ DEPENDS = "ncurses"
 
 SRC_URI = "http://hisham.hm/htop/releases/${PV}/${BP}.tar.gz \
            file://0001-Use-pkg-config.patch"
-SRC_URI[md5sum] = "f262b66ad6c194782f4d3a80627e84c8"
-SRC_URI[sha256sum] = "3260be990d26e25b6b49fc9d96dbc935ad46e61083c0b7f6df413e513bf80748"
+SRC_URI[md5sum] = "0d816b6beed31edc75babcfbf863ffa8"
+SRC_URI[sha256sum] = "d9d6826f10ce3887950d709b53ee1d8c1849a70fa38e91d5896ad8cbc6ba3c57"
 
 inherit autotools pkgconfig
 
-- 
2.17.0


