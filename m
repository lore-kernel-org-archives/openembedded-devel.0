Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id E5ABC78925
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Mar 2018 23:02:10 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id x7so15180817wmc.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Mar 2018 15:02:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=A0kA9sqwwLfZ++BvnS0DhiiHfx6xSBnJb9f8q3NK/Pg=;
	b=iKISeFleoEYVhfipB2e7iYLCKYZ28TwGEGsBaXTpyzbg8OCU8QM4eliF1oHEXRfvtO
	BReGAWs9worOMGWcmCvYblP/CLmIPjv1hH/DVYWYd6pUh0TV0SoPIFM9JLAyGZATPi29
	nb0QneAGDAiYxHL9VoeZU68fQwqM1JPsLwnzvhe9VGOIVHr/Q8GvRbotlTksaeP2T2mc
	RMupOpPD943kjsb42hMXcEVL9v/bPONx1U/yALk4qwta0RuOQ1t4n4TfjlON7ABOp63o
	dc63KOe5w5jGhDgb+qLSALN/VT+zRB8tVfCmEL9Aq/bcpmGse6kdSQGqMvKH7Vj9Xu3d
	OgSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=A0kA9sqwwLfZ++BvnS0DhiiHfx6xSBnJb9f8q3NK/Pg=;
	b=omuCIbl2xctf/7b6XNRmH5Pi/7Z9oVa63xo7myETWgiAu74jr+qFuRYfuvhNVh8nDl
	8yxhnRN0LEIOUgNfUlK+/OBUUvXFnpp5Wxby3ycPuiQa78MLd8H9Mz1peTWaQ1mHYqjo
	YCrsJ8PlTACNa0qVdqqfpJDVWO5NBYRvaVJXEy1PT48MoGg2fGs28FJsTW1qh1QaPGoM
	AivbeYmrs+e2VTo+t64HgFE2RrqbB4U6Zczt7WoBq69KD5sboYSDn7YNwaA1ZPiJ4nd/
	pKUpPmIJl5MPq4etiS+fNlmY16Yd5QhTKkKOlpxOR8Eb7m5u30aah+S1Mo1sWNHR7hHN
	b3/g==
X-Gm-Message-State: AElRT7EyNi+3ReWcjMJUtcrlOZjEAabU9M7FkTQpMpLOz6DclBV3O2MK
	CbrCj8T3kgqhaR4JNDoq6BFs9g==
X-Google-Smtp-Source: AG47ELu5m99Qzi8Frd9ucgOf6K11t72oZqZU2nKsxynBVJ/9FakH2VxxtcfOtriNueBKJi8ZRtxWYA==
X-Received: by 10.28.74.88 with SMTP id x85mr2480878wma.106.1519945331760;
	Thu, 01 Mar 2018 15:02:11 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC063001E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc0:6300:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id 8sm5490wmf.13.2018.03.01.15.02.11
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 01 Mar 2018 15:02:11 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  2 Mar 2018 00:01:46 +0100
Message-Id: <20180301230148.2284-11-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180301230148.2284-1-schnitzeltony@gmail.com>
References: <20180301230148.2284-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 10/12] parole: update 0.8.1 -> 1.0.0
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
X-List-Received-Date: Thu, 01 Mar 2018 23:02:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-multimedia/parole/{parole_0.8.1.bb => parole_1.0.0.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-multimedia/parole/{parole_0.8.1.bb => parole_1.0.0.bb} (86%)

diff --git a/meta-xfce/recipes-multimedia/parole/parole_0.8.1.bb b/meta-xfce/recipes-multimedia/parole/parole_1.0.0.bb
similarity index 86%
rename from meta-xfce/recipes-multimedia/parole/parole_0.8.1.bb
rename to meta-xfce/recipes-multimedia/parole/parole_1.0.0.bb
index 824611abe..479f1a4df 100644
--- a/meta-xfce/recipes-multimedia/parole/parole_0.8.1.bb
+++ b/meta-xfce/recipes-multimedia/parole/parole_1.0.0.bb
@@ -19,8 +19,8 @@ DEPENDS += " \
     taglib \
 "
 
-SRC_URI[md5sum] = "361e3059f1263c76a3711db2c7c1a97b"
-SRC_URI[sha256sum] = "4b216f5200490f8d2a9bf1b3fcd9a8b20834c95249bf13b9170c82e1fcbd80f4"
+SRC_URI[md5sum] = "d00d3ca571900826bf5e1f6986e42992"
+SRC_URI[sha256sum] = "6666b335aeb690fb527f77b62c322baf34834b593659fdcd21d21ed3f1e14010"
 
 RDEPENDS_${PN} += "gstreamer1.0-plugins-good"
 
-- 
2.14.3


