Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id BAFAA77CEC
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Apr 2017 19:57:00 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id o21so5800399wrb.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Apr 2017 12:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=t/jxxtkWazXAfgo4BnAa9okQ1MuTQpAu6srO1F5l7E4=;
	b=nZ5Qj0B8BeqwkymgLPwJTlMrpiMlbXvod87BzWmqVHeojHDmV/SCBMSHIjXgtJ3VYs
	CZa3JrQ5HVzgvINSr4jqLz/iOOOIc34rZoEC7NhmI00P2b1EFo8oJotlM0f5Q2Q8xWE7
	S+Cl8+2tRs0JzvUP2A46HM+VAiFIp3qXasnNyRdbfDT/aNOtgRhZ/jwMoOzpQ2ihSGsU
	7Owmg+6HRT/rGCsL3Ynyuyx2GR75v7CVBWXRW2U0jzEolcKh7mC60SZvV2NfVIH27riW
	mzxUnI1d6Ye48I88aoV4sermVdni8aYtAcDTI2C2vOXBIx6kT7GQ4uBP/qldAqW7KCyM
	dnlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=t/jxxtkWazXAfgo4BnAa9okQ1MuTQpAu6srO1F5l7E4=;
	b=lrRRcAzWEOjqnXQFZpLW8ZgiKGIi7RWehYkWaP6hqIlVIiWW6lX8oq8f/fPe531xtU
	O4yjJneIwjUSwZCc7g5N4z19Nel4BxKiGtwQqbk+9ebqFkL9YL+cWsciNrRnla7RcD4+
	43G5/Qyv2iLwXuRI4v+pBWLAAtawxpu2JZW9qF3sZH285ZW5zl0RYM3/DJRnLyfZEZZ/
	6nMxHREQCm9aCkf1E8RsIgN/K0Tuw4NOYIhf87fFrydkOVltiIsKXkwmFeLHJDQyjg1K
	aCD7iISPBqOgoVSuBc7cjrj7jVHea2qjxwx0DD+M+ouirbNAy0ahSaaQHjSyRYXLLBHe
	kOvw==
X-Gm-Message-State: AN3rC/5Wp2YaKU6kiWQ9uYgR20UeWXE1w4tUwES3YAV6S2g39gFan57UiFqn+grmpXFrhw==
X-Received: by 10.223.147.197 with SMTP id 63mr4454347wrp.135.1492027021412;
	Wed, 12 Apr 2017 12:57:01 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E911F1781E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e911:f178:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	t100sm3522637wrc.24.2017.04.12.12.57.00
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Apr 2017 12:57:01 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Apr 2017 21:56:20 +0200
Message-Id: <20170412195638.3243-12-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170412195638.3243-1-schnitzeltony@googlemail.com>
References: <20170412195638.3243-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 11/29] xfce4-weather-plugin: update 0.8.8 -> 0.8.9
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
X-List-Received-Date: Wed, 12 Apr 2017 19:57:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../{xfce4-weather-plugin_0.8.8.bb => xfce4-weather-plugin_0.8.9.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/weather/{xfce4-weather-plugin_0.8.8.bb => xfce4-weather-plugin_0.8.9.bb} (72%)

diff --git a/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.8.8.bb b/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.8.9.bb
similarity index 72%
rename from meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.8.8.bb
rename to meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.8.9.bb
index 28d3bda..d9ed2ce 100644
--- a/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.8.8.bb
+++ b/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.8.9.bb
@@ -7,7 +7,7 @@ inherit xfce-panel-plugin
 
 DEPENDS += "libsoup-2.4 dbus-glib upower"
 
-SRC_URI[md5sum] = "29fe8892bb4c6b1e639862a63110618e"
-SRC_URI[sha256sum] = "651b722714fdafde3f548f183958c34e1539cf563193d7e51f28bfb6933d6d3f"
+SRC_URI[md5sum] = "0c56c057e1c354b30409b7871ab6f314"
+SRC_URI[sha256sum] = "0e15d14b3e18c3da46ad23ee3158a25220f1474a48b611de96edb56221aecee5"
 
 FILES_${PN} += "${datadir}/xfce4/weather"
-- 
2.9.3


