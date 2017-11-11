Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 5E3867863B
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Nov 2017 13:30:07 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id j23so10751672wra.9
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Nov 2017 05:30:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=I34PEeKBNvJy3fY07xYToOiOGmi1xfPyYHhnyxUEY0I=;
	b=VPGJeS7R5YJ/jYMV0OJA8Ka2ivhyrCEZei8k9yRiH03PKylrPnj9O2nAbp+tzGRWNa
	4Ds+P7meQTsVyGqJuTlMdAShhAXfxLtn4mg5/RR27SudQuAyt73trMlwm0qsM6K/VDf1
	bW74aqdPvJ9tQqwm6TgZUNUVJE6dkVfNE35l4CS7pD1QCK4dxdPD/xocibCCpcsFDXx0
	LOcxDgTT2wOTtGtrj5DatHv43sSGLe0PC/YddiFkU8Yarc9rX3xhHzHS60FXp+FH6haf
	0Z8su0ttHr9jZvmCdQjMd2ADE56Cgqm4KGfPUX/K0g7+H1rt0Ez4LhuxQQ8SbUYokZvr
	5F9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=I34PEeKBNvJy3fY07xYToOiOGmi1xfPyYHhnyxUEY0I=;
	b=fMu7+nYorJp14oVyP7dfT5A+z0+q1yUNJfASB/87P0MtOOyHUrMk6DKLOcRc09cHOv
	HBSUd7YOg3u2L+dU7RE+Efe/2zlLUSBrORv7BRwSMhJpix+eWpnJEr5tUnNjnZR2WCRX
	DwMzDDZ/uY3WLD6EJyxqpr1h6lfMBhOft8DH7pvC9q7YkfOo7FcH7EzbMN04Se821+c7
	NDsgBVxITpMUnFxxOUPhu2zXmVBoDlNOHbmPUoMJw1Vqhr/iA/SfmpD+38iyEurZDv3t
	iGRcA9+xRF+GLBNuf9FhwvVf+XgEAH46ePf+Jx/yq/iyNBh0XmBTG41f650S+vFd9Ezw
	3kfQ==
X-Gm-Message-State: AJaThX6f/cgO6gvdsMIP/pzaNymedEgYS9dXHz8s+H9csSSdYXqxTDQG
	iteKoeymWkh7NcNoOa01H59IOw==
X-Google-Smtp-Source: AGs4zMZOx48xyzAz+RVEgrZnDJCyz/eQXK/O5mjc5bHUbM9TZFO6PUInS9bcUD862Jf/vDgMaLmdzA==
X-Received: by 10.223.163.143 with SMTP id l15mr3159627wrb.149.1510407008227; 
	Sat, 11 Nov 2017 05:30:08 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p20030070ED074A591E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:70:ed07:4a59:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	195sm16189805wmj.3.2017.11.11.05.30.06
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 11 Nov 2017 05:30:07 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 11 Nov 2017 14:29:43 +0100
Message-Id: <20171111132950.12570-7-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <20171111132950.12570-1-schnitzeltony@gmail.com>
References: <20171111132950.12570-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH][v2 06/13] xfce4-weather-plugin: update 0.8.9 -> 0.8.10
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
X-List-Received-Date: Sat, 11 Nov 2017 13:30:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Andreas Müller <schnitzeltony@googlemail.com>

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


