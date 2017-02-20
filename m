Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 9E56272F0A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 23:07:29 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id q39so13479968wrb.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 15:07:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=nWpyFysEklDCxuv4j67YG3a/mp40ipmWqL5Gnt2bb9c=;
	b=nPu5D4U+vDJQw6PgNE/Q28VR2nML7uhmDq7pwK8d7hjciID78DNZSPLb7q/gfTySrv
	Y0KTbUC2eLH6MDaY9scFYBpSC1r3OjDMKUGvqiOdqYx9v9KnOVqnzQeFkhdHVAdXbD02
	h6M74r9YpWxRXJVFkZNQk5VCs7rNag9+FZqIyKbvPoRzn9og2oTyZMuJ8SXdS3gKrzno
	WDYWZGbNkLPxhTOQrFDi+BqYZ3WgGREFeDKn2ZzvO2QhWEIcECxXq2Qw+lH3sjHs0ji1
	wrJUrbJjzZ/lwsikxxcWk3UFKA3ePkdqju4TGG5VLt7S+1pkH6KuP7At8BbyPSzvlKOK
	aoRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=nWpyFysEklDCxuv4j67YG3a/mp40ipmWqL5Gnt2bb9c=;
	b=RIsbToTyRLztqoUjX42gOgki35BqC39qH1HuUwdwgdUnCUE9tFJsOcXmz/MyL4sZB7
	L8XdRZN3L8ooBsj5owwEgdLlrCcBcyFdco7/vg74SFsr9z0a1bJoKRcW5+4voiaS0AbS
	03QjfBWa/KQJxy8Syd9dMcdqLD5JEhprlcHsEBoXDbc1Iv4PSWJ8uQKgX/BkE1JC+Jwv
	R/KhF1ygofRHXs6deVQTjoKwm2gWPquF5SKoCzHAMxxtmo6wGWCYlPRDi9y57vQh5POk
	N3p2hvXhdtI/63kzbLGutnZHNslj9tggbrP/zzr8zuK6VT56vEBnN8vYm0v/7aJ3JoqG
	XZJg==
X-Gm-Message-State: AMke39mfDZnRCuFrdrM2tQGvEJMvZ2/ChE/mWkj7BaKA9oc7PE/I5u7wt4k6ociPQMDPfw==
X-Received: by 10.223.171.65 with SMTP id r1mr16578619wrc.38.1487632050098;
	Mon, 20 Feb 2017 15:07:30 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E911DE631E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e911:de63:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	i73sm15294743wmd.11.2017.02.20.15.07.29
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Feb 2017 15:07:29 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Feb 2017 00:07:15 +0100
Message-Id: <20170220230719.10066-2-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170220230719.10066-1-schnitzeltony@googlemail.com>
References: <20170220230719.10066-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 2/6] geany-plugins: unblacklist - geany is back
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
X-List-Received-Date: Mon, 20 Feb 2017 23:07:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-devtools/geany/geany-plugins_1.29.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/geany/geany-plugins_1.29.bb b/meta-oe/recipes-devtools/geany/geany-plugins_1.29.bb
index 34a6d5d..89bb966 100644
--- a/meta-oe/recipes-devtools/geany/geany-plugins_1.29.bb
+++ b/meta-oe/recipes-devtools/geany/geany-plugins_1.29.bb
@@ -261,5 +261,3 @@ RDEPENDS_${PN}-xmlsnippets = "${PN}"
 PACKAGES =+ "${PLUGINS}"
 RDEPENDS_${PN} = "${PLUGINS}"
 ALLOW_EMPTY_${PN} = "1"
-
-PNBLACKLIST[geany-plugins] ?= "Depends on blacklisted geany"
-- 
2.9.3


