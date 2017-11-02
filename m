Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 3E1A278259
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Nov 2017 10:31:55 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id r79so4503774wrb.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Nov 2017 03:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=LWqcTtjTImg8aTOaKusN/OXfKooPNsBsXBzzkFAmdiY=;
	b=st3/1Ty3iKskbUZr4Oj7HTwewuRAfe5NOuyZslKGHDhNXXVjvu+l62tuQCWcOt7sJg
	4HzG7PHomMEelCigDenwzslX9d0dZNXJsDrGEbNH45rpESQ6mClRqm2yUhZWWAXaxf2P
	4fCdIVYZUQCQjiFoCD6xnk7qlBknNxzlJncFoHUhD8cW52EJJkVAO/PMAoP3NHH8kB+I
	WpFuNfKQ6pzOuBpq2DkiWctzBe6yzZWXUd09PsrqRTHxN3uZ6BqaRBOnUYAGbSquQM3L
	xzZe6ftstKYr59McNb2q4SW+yNGxO8/QS6bfSBCJQpDCv9PhAcLWzfQsIBG8IsI8JvQu
	UALA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=LWqcTtjTImg8aTOaKusN/OXfKooPNsBsXBzzkFAmdiY=;
	b=qB5Xql2haAoo8il9mstOKKeoq5JC68oUrONsztZ1k/YdizCkWt+A0ZR+17nMviB9dT
	MF0KMz4nxu1OFTBoHYGBfw7Q7MsvNFYZ/qhz4S5SrywVdrwIuXjtUzrlqP7ybRhAVXhJ
	Un+I9LpalWqfT0Yswpkwzzo1VExhKufhobM4Y/9V6+bMAnozMML0Zw26Av7ynjxomZv7
	zd5pPMgNAg/XluNRCSURHyhX+yjNiyMdV52DrcAxTxHwUS4pp1L1J1UIOTmHuKIO6o5K
	QYP2MDUz8mFfwpbpjP5SKEmhqivINm+YK0Ij0Q6LlggxS5k3RJtxQh9UQiO+CDLBqWL+
	3BxQ==
X-Gm-Message-State: AMCzsaVnez2vLSSRvMtlCdSNsM2l+jckXuAIlZsc+Z1UFp1ox54Wd60Z
	ZxYYjjBJMrF68aan4b9HKCTcCg==
X-Google-Smtp-Source: ABhQp+QK3CC1OJSjFHSZTnIq5vVPyq3OXlY9rJWjXrFVrq+9O1dWgUr9MSBUKsao0OnXJZKE0Bl9Zg==
X-Received: by 10.223.173.165 with SMTP id w34mr2459492wrc.22.1509618715972;
	Thu, 02 Nov 2017 03:31:55 -0700 (PDT)
Received: from mueller-a-nb-linux.zera.local
	(ip-88-152-111-130.hsi03.unitymediagroup.de. [88.152.111.130])
	by smtp.googlemail.com with ESMTPSA id
	g68sm340440wmc.22.2017.11.02.03.31.54
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 02 Nov 2017 03:31:55 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 Nov 2017 11:31:26 +0100
Message-Id: <20171102103129.3703-8-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <20171102103129.3703-1-schnitzeltony@googlemail.com>
References: <20171102103129.3703-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 07/10] xfce4-weather-plugin: update 0.8.9 -> 0.8.10
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
X-List-Received-Date: Thu, 02 Nov 2017 10:31:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../{xfce4-weather-plugin_0.8.9.bb => xfce4-weather-plugin_0.8.10.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/weather/{xfce4-weather-plugin_0.8.9.bb => xfce4-weather-plugin_0.8.10.bb} (72%)

diff --git a/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.8.9.bb b/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.8.10.bb
similarity index 72%
rename from meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.8.9.bb
rename to meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.8.10.bb
index d9ed2ce..649eaaa 100644
--- a/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.8.9.bb
+++ b/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.8.10.bb
@@ -7,7 +7,7 @@ inherit xfce-panel-plugin
 
 DEPENDS += "libsoup-2.4 dbus-glib upower"
 
-SRC_URI[md5sum] = "0c56c057e1c354b30409b7871ab6f314"
-SRC_URI[sha256sum] = "0e15d14b3e18c3da46ad23ee3158a25220f1474a48b611de96edb56221aecee5"
+SRC_URI[md5sum] = "bba7f750b97c8fc3656715268edad792"
+SRC_URI[sha256sum] = "ee6d43c444904631c240470e15e96215c2ce451158bfdbf234bce892bf60eab8"
 
 FILES_${PN} += "${datadir}/xfce4/weather"
-- 
2.9.5


