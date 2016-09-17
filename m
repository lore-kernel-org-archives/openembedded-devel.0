Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3D2CC731F9
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Sep 2016 10:05:00 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id l132so5988572wmf.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Sep 2016 03:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=N/DQi6rdNANa+Yep8zlg6z77cCiOL+kn6h62C1CWV1Q=;
	b=viJ+hgB59rbWmZES+MGyHQ/uu53l6FbaoXvdobgISYO1nXkPdMNuohAcva7CHkmmHJ
	kRSo/VpJnGdd9A6JWdjJWwZg/P1M+f9xgkmcXvdd8V8Di28xqvXY/Oj3lWVL3OwaSxft
	fev53alUVh/w1TYPrbXQO5PHkpnWVXYWn4feRCtTaUcSca/77Ag+C/AjK0eBlWcvETIs
	/gVvhLcX2yvMX3ScWcnyEUcBXBsJMIS89WgMRpDjjKlzJSKwIVvSOg8NeG/ahTWFq0zc
	cVju7C9uEP9mu/ipd9Q6LCVzQgYM3e8QfAxQm2LP6sytF3XApK45kJcsbdjlA7Jufgzq
	VkKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=N/DQi6rdNANa+Yep8zlg6z77cCiOL+kn6h62C1CWV1Q=;
	b=WFV9vvYTyCzsYBwdKbBfILz1mpa9PYyKZGBIlHV2/2bhfKPYX7/Inrmv4+Yzn5s6PQ
	vFz1YXVO7BVkuXpJ3H8ApW/ixQaxULUe4nIteRXm3Q88WCx4hPQFk9N/4xm/O9uPO9/o
	IJmMCW05HoL/SV8PCQsY0Uew323Gpebf78ohOpds20hJEK7mXPXu4mQly/4EjH1I1aU4
	X9gokQT19NTzAVz8ijYfON5gv6teG90xypXTnV8bqah7BEtJnDpYkYuxw8BXod60CBHv
	/FnP9KkMtSOq2NNuHgMhTofhIsbPtsVKqSL9j7UbCdWgNfZjpq6ETiCm4Gbyg9jNCLnP
	O5mA==
X-Gm-Message-State: AE9vXwOz+tXCkKJgUtRy4ZrSz/ym5Smz3Echfgr+jjAxQTBEh1Y/VQW7Q/PRyYnM4ta9nQ==
X-Received: by 10.28.91.12 with SMTP id p12mr1411189wmb.34.1474106700372;
	Sat, 17 Sep 2016 03:05:00 -0700 (PDT)
Received: from localhost.localdomain (p4FDF0635.dip0.t-ipconnect.de.
	[79.223.6.53]) by smtp.googlemail.com with ESMTPSA id
	o2sm12473330wjo.3.2016.09.17.03.04.59
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 17 Sep 2016 03:04:59 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 17 Sep 2016 12:04:41 +0200
Message-Id: <1474106682-20512-6-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1474106682-20512-1-git-send-email-schnitzeltony@googlemail.com>
References: <1474106682-20512-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 5/6] ristretto: have tumbler back - it builds fine and is an important feature
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
X-List-Received-Date: Sat, 17 Sep 2016 10:05:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-apps/ristretto/ristretto_0.8.0.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-xfce/recipes-apps/ristretto/ristretto_0.8.0.bb b/meta-xfce/recipes-apps/ristretto/ristretto_0.8.0.bb
index 49c51e9..66399cf 100644
--- a/meta-xfce/recipes-apps/ristretto/ristretto_0.8.0.bb
+++ b/meta-xfce/recipes-apps/ristretto/ristretto_0.8.0.bb
@@ -7,8 +7,7 @@ DEPENDS = "exo libexif gtk+ dbus-glib libxfce4ui libxfce4util xfconf cairo"
 
 inherit xfce-app
 
-# tumbler is currently broken
-# RRECOMMENDS_${PN} += "tumbler"
+RRECOMMENDS_${PN} += "tumbler"
 
 SRC_URI[md5sum] = "94c778850325a4e5a12e3433c8a05432"
 SRC_URI[sha256sum] = "71625324cecda7199acbc95a3ea5132d0dcbf808771e7a209ea2b9503ae4f328"
-- 
2.5.5


