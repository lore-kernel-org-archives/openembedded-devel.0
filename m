Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 1391A71D42
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 18:07:19 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id v77so15738277wmv.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 10:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=na77rYBPTWdAaymTd55foMVJrJc8O/ziss5Cmkm3tk4=;
	b=n/2JVr38rVU282mFLsL1GC+nDiHzWGNtToNw011gG771gycW4pl7dgnVpUGAZu4jJe
	bQ8iJWUnwGZLSPIEFT1fas/kwfVaur8EpofkG+vBRtzqMXuHN/3086aMLZKlSJeHdOoM
	vuAmLe/1GUousCQmyCCGiz9RQLuXZxcuaVye2XSH71qxlcz1od5gHwxlHhOZazfsmES7
	i603rDCjN9RoPN4FAVFV3Whdr69cjrIDghpuuzHyjhRK3KLSzFDnGtbpiz+2HtI3Qwaa
	gkznWT1unHnc9oFciZ2PGr5D21bPGK/8M54Zt+3l/4GB/8FuHdBvySs9YZHd1ghG0Ybt
	/66A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=na77rYBPTWdAaymTd55foMVJrJc8O/ziss5Cmkm3tk4=;
	b=cDrzJ+FkkI9bA6HqlA5IFD4lYOmU+yB71B630fkHn7twpFgXWp0GFgD0uFrXPyD4FM
	kWq49px0atvJNSM0chyQQNAMB2GcgWo70hFhqvBfTHTkv/2v54tnKvZWEsS2Cp9nWI8G
	GDLqOmJpbt22KKTCc800G72cu8c10GMm9kHP+17EoCQKhA3SNczmCaqKmnF+quxx32mx
	ghdAnP4EK36IDx0eXC+P9R4O68oQQgsBOj2EDA1yB1E4qO/XsHSwm44AGWXiFLhN6dJb
	9gn8Y2j+/Wf3hDVXyn1cRftRMKCineBamWLpx+JE84Dd8QmBGxdPu+ubGqWKp+udSZ83
	uKXw==
X-Gm-Message-State: AMke39kTOAv+z5XjJt3V2Po1w6QVovcGY+M+hLHSm6WDwA9VXems3ubbrps0Hy5M4YYbKg==
X-Received: by 10.28.216.130 with SMTP id p124mr11367957wmg.58.1487614039755; 
	Mon, 20 Feb 2017 10:07:19 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E911DE631E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e911:de63:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	96sm2863710wrb.14.2017.02.20.10.07.18
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Feb 2017 10:07:19 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Feb 2017 19:06:20 +0100
Message-Id: <20170220180700.29836-5-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170220180700.29836-1-schnitzeltony@googlemail.com>
References: <20170220180700.29836-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 04/44] orbit2: unblacklist - libidl-native is back
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
X-List-Received-Date: Mon, 20 Feb 2017 18:07:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-gnome/recipes-gnome/orbit2/orbit2_2.14.19.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/orbit2/orbit2_2.14.19.bb b/meta-gnome/recipes-gnome/orbit2/orbit2_2.14.19.bb
index 414bcf1..f9af2ee 100644
--- a/meta-gnome/recipes-gnome/orbit2/orbit2_2.14.19.bb
+++ b/meta-gnome/recipes-gnome/orbit2/orbit2_2.14.19.bb
@@ -39,5 +39,3 @@ inherit autotools pkgconfig gtk-doc
 
 EXTRA_OEMAKE = "IDL_COMPILER='${STAGING_BINDIR_NATIVE}/orbit-idl-2'"
 EXTRA_OEMAKE_class-native = " "
-
-PNBLACKLIST[orbit2] ?= "Depends on blacklisted libidl-native"
-- 
2.9.3


