Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4859D6069C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Sep 2016 05:55:52 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id l131so707384lfl.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Sep 2016 22:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=jwp+y6kKg+zBrCSKMlfSorcFMiZ/cCwZ64FVvD+MXas=;
	b=PSl2EQwGWP3z8Q67DLI8MlTEgs4J7ImUXp4MwNCP+s82SsXWcCOw6ghpfGQUU96VLa
	15W+L/Z9ZYn4ViRtNUOFPpP+cNaHfg6DZbZ2m8J9DeTw8WDtOHvN+FnpiMdy3HzclcOj
	xdJE4/b2s7hI+pGHNo8jefBzd6010F//h1mOdYE9rJ4jRdUkypRCWOXYJgUHOH0hk1iy
	bEVSZ5jHNREXTEWyfgL0uGwgiNxokjgmEdRX2GFGFlg0sWycc1ZyV0vdpDSwhLKrHjRg
	Fkag2bBynh1GxI3+YmZtHOH4Qz4X+chLBlZABQ55bjQmXR3oH6OmVwfkjzOUTlT/5FK4
	O0/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=jwp+y6kKg+zBrCSKMlfSorcFMiZ/cCwZ64FVvD+MXas=;
	b=k1t9UBafW3071HxJKWEPQJhHefKB+BczS/nExcRkvyRYgpgcv1GSgBJR6irGjtd7aA
	8ziCz8+bvPIDVjO+Ha0nlVgVwVDXHRZcq38X8uAJ02ptmNcwzCkYyG/N7dLFTo6vM+FZ
	uUqU2vf1Inw8ZFAjYAYNfnZAR7udgIIMXfLxxWU7mNVfNFYw+tenQBcOXtjIf4L5eap2
	mZmPfZoV/5ExZLfsA/ixuWWfQSrrolPnBGaEkyVLDnTupxw042StAjUgS244TNdwqQUg
	Ruoo1kV1/H/u695Ks5FKafTJ6NaWkEoW98+3NZpSa2rR8SRYHUqHFg5WbpLiE6mPQymd
	CKbA==
X-Gm-Message-State: AA6/9RmJHnvgw4350Z6FZOlcmHRQnb8JDcTONjOtx5h3A+RpjhTzy31lRNV2hQ/Nmw1bwQ==
X-Received: by 10.194.157.164 with SMTP id wn4mr20647313wjb.142.1474955753179; 
	Mon, 26 Sep 2016 22:55:53 -0700 (PDT)
Received: from localhost.localdomain (p4FDF068E.dip0.t-ipconnect.de.
	[79.223.6.142]) by smtp.googlemail.com with ESMTPSA id
	f15sm1156668wmf.8.2016.09.26.22.55.52
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 26 Sep 2016 22:55:52 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Sep 2016 07:55:28 +0200
Message-Id: <1474955733-30185-5-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1474955733-30185-1-git-send-email-schnitzeltony@googlemail.com>
References: <1474955733-30185-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 4/9] xfce4-weather-plugin: update to 0.8.8
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
X-List-Received-Date: Tue, 27 Sep 2016 05:55:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../{xfce4-weather-plugin_0.8.7.bb => xfce4-weather-plugin_0.8.8.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/weather/{xfce4-weather-plugin_0.8.7.bb => xfce4-weather-plugin_0.8.8.bb} (72%)

diff --git a/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.8.7.bb b/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.8.8.bb
similarity index 72%
rename from meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.8.7.bb
rename to meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.8.8.bb
index 3519f4a..28d3bda 100644
--- a/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.8.7.bb
+++ b/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.8.8.bb
@@ -7,7 +7,7 @@ inherit xfce-panel-plugin
 
 DEPENDS += "libsoup-2.4 dbus-glib upower"
 
-SRC_URI[md5sum] = "ecab0eaad870e460da4597e76f43e6e6"
-SRC_URI[sha256sum] = "071e71106868c7d90c936256d837ca834d0ca6f54daea59a9b5fc11b318e65b0"
+SRC_URI[md5sum] = "29fe8892bb4c6b1e639862a63110618e"
+SRC_URI[sha256sum] = "651b722714fdafde3f548f183958c34e1539cf563193d7e51f28bfb6933d6d3f"
 
 FILES_${PN} += "${datadir}/xfce4/weather"
-- 
2.5.5


