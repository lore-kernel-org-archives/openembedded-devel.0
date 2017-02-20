Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id E087C71E4F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 18:07:41 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id u63so15683927wmu.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 10:07:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=U84tclj5xQ1e5QaUJXaiKzLOUIhWi0pOAEBlGp34GtU=;
	b=mokmJTldqKtzz9FR3FwB8tohGXwcQJniwcqt3acTAcGQUEJthS8nNdi0km2cu9oIlC
	RjXr7I6+qCp34xXivp5qfKw1vZeullv2MBwNS21Voi46Jox8k25o9MV6a3yS8r+VFmlA
	1FZPNbdz08pk9IwXPFz1OLwj6ejoSmoTVayPviDS18Vsa/Y3xx2VzRXq5DqkvrDktyHN
	SjtHWYQEXbr4w5TIod8Dpojhbs5qqa86XcPgP8gCCNfhFR3JucAcSQizM5YKPzAlTeFy
	L6kIJcbidw2mZ1FNqYIiDZrnCBpOsWB74i4zJ+m0T57+7n1LcsVznEprb/kxk7foUJyO
	Sb6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=U84tclj5xQ1e5QaUJXaiKzLOUIhWi0pOAEBlGp34GtU=;
	b=pyPbzjUocTHCZSWiBbpwRahq3Ky/KUG2lb15x8f4dLEpU9ujAdi4d1njmHphFkq9zS
	vFIOH0nkCymaSRmiuHV+z56VQ6OV0YMhmvIqa5/vyqC3gM3yj9pvSlxX/1kAbTaWzmRR
	7QPqEkG/rv0w7kG/ELkqL0dPbR3Zz3WsUid1XOBaMStpuBry30v1uCgpAoMzi6yf0E8i
	8kMw28gicQNKtzpvq3y19rK9xYb4DUPw/HnLnzeZ1Fok+39SB/nh5UYw6jWQW8iFwiiT
	iInTE4Azylm88SNZp5HAB+pXEPdlm+sLRQ88gwA1ukUf8Igvr/YqVx2dZf19O99VYbdP
	thig==
X-Gm-Message-State: AMke39ng81xdQusJUKLj88sNfwus8mf982JSXbzNlxQnLMUVbRDejgK4j7AOk5CExI5RqA==
X-Received: by 10.28.214.144 with SMTP id n138mr19411703wmg.136.1487614061760; 
	Mon, 20 Feb 2017 10:07:41 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E911DE631E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e911:de63:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	96sm2863710wrb.14.2017.02.20.10.07.41
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Feb 2017 10:07:41 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Feb 2017 19:06:42 +0100
Message-Id: <20170220180700.29836-27-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170220180700.29836-1-schnitzeltony@googlemail.com>
References: <20170220180700.29836-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 26/44] mousepad: unblacklist - gtksourceview2 is back
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
X-List-Received-Date: Mon, 20 Feb 2017 18:07:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-apps/mousepad/mousepad_0.4.0.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-xfce/recipes-apps/mousepad/mousepad_0.4.0.bb b/meta-xfce/recipes-apps/mousepad/mousepad_0.4.0.bb
index f0cb7f0..4ca21a6 100644
--- a/meta-xfce/recipes-apps/mousepad/mousepad_0.4.0.bb
+++ b/meta-xfce/recipes-apps/mousepad/mousepad_0.4.0.bb
@@ -17,6 +17,3 @@ SRC_URI[sha256sum] = "60114431eac8db6bb6ce18bd38f1630cccb684375b97a445a1b6fd6198
 EXTRA_OECONF = "--disable-gtk3"
 
 FILES_${PN} += "${datadir}/glib-2.0/schemas"
-
-
-PNBLACKLIST[mousepad] ?= "Depends on blacklisted gtksourceview2"
-- 
2.9.3


