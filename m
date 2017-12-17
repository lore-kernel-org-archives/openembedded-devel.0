Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 7164F77FF5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Dec 2017 18:21:58 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id u19so5758066wrc.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Dec 2017 10:21:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=H4bva0eXpB+SdG2hgHjuq52FRlUQ/B5+WKU/Sup8koU=;
	b=WqpM+WBYr05lUzkvnxxpDmklw6b+gQ4DvNg33j0cvnqfDsEWeUslFYtpo2jE6w6Fpx
	JEZoLZNl5YafTHy+86awGF1aOKaHAgssjAb0dDTEqSh71ARHsapjn1nvhczt1SOzm30B
	u2zbB1A4m5wuUGA4IZnmSqZ1vkPQXRCHqdLj2TUeK9DywlldxdpnLCqDcniL7pIJzas1
	v74bgD7COU7tH8xwbmj/3qCd5ZavDMkHRcsSaKAuqjV+SWIcTw2+myp6oBpS6T1HBax8
	DaJFuB7uVmMShC9D/cb8Y8IwB4aVJl92l1jBbIwgjJqLExzrli0UaX3ltZ48Iq7UuamK
	0eRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=H4bva0eXpB+SdG2hgHjuq52FRlUQ/B5+WKU/Sup8koU=;
	b=RvW/Jh2yTcx65LGT8sT+yTe1as4IBIOTCLII6ZBC2xOOBKmQSoULxjMQ6Fg8f8hf9H
	5krOiof1VVuiHZoBMCC/1+Aoj6ZZ4ROMAcO3BAda6R4W+l3Dwq/56P4hKJe+EQ+Kaw9t
	niKHMvBzyC0UuhCrQZwwCAurp+n6UIohYo/HGpRVoICiqcnzUntNMvsoFkBjwEEdKxrZ
	QnS7/WqtElhdp6Y1UCaVKQoJuu+YN4Dqo2q6jfqI/3do3FlUEWDnFbVlW03WzClvN5Kn
	33Mb5rObhND+hgCMj1VzCO2fxOKRzEUKjab0gixGZDmnFSx2ug++1g/ytdGNaf8Rtc2F
	IyxA==
X-Gm-Message-State: AKGB3mIdol5XZTTrG0r+w4cIyQox42v7H9V4VsxJ3Gr2ueJ4TZaVpR+n
	xXL933VKHqSwJPVXSZpkLZwuig==
X-Google-Smtp-Source: ACJfBouu3Lcyeqh6ghzw+2UrQtP39q5YmgXnluBPSTWioxdvc5GphAVtHS9Y8gbO54ZgG5ApnNJHYQ==
X-Received: by 10.223.185.85 with SMTP id b21mr3618442wrg.264.1513534918920;
	Sun, 17 Dec 2017 10:21:58 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC3E4151E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc3:e415:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id 139sm7762637wmp.7.2017.12.17.10.21.58
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 17 Dec 2017 10:21:58 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 17 Dec 2017 19:21:39 +0100
Message-Id: <20171217182144.21123-4-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <20171217182144.21123-1-schnitzeltony@gmail.com>
References: <20171217182144.21123-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH][V2 3/8] plymouth: packageconfig gtk needs gtk+3 as depends
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
X-List-Received-Date: Sun, 17 Dec 2017 18:21:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb b/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb
index e331779..6b24ed2 100644
--- a/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb
+++ b/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb
@@ -31,7 +31,7 @@ PACKAGECONFIG_append_x86-64 = " drm"
 
 PACKAGECONFIG[drm] = "--enable-drm,--disable-drm,libdrm"
 PACKAGECONFIG[pango] = "--enable-pango,--disable-pango,pango"
-PACKAGECONFIG[gtk] = "--enable-gtk,--disable-gtk,gtk+"
+PACKAGECONFIG[gtk] = "--enable-gtk,--disable-gtk,gtk+3"
 PACKAGECONFIG[initrd] = ",,,"
 
 LOGO ??= "${datadir}/plymouth/bizcom.png"
-- 
2.9.5


