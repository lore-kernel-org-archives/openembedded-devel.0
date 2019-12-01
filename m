Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
	[209.85.128.54])
	by mail.openembedded.org (Postfix) with ESMTP id 05E427C85D
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  1 Dec 2019 16:51:33 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id s14so13608812wmh.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 01 Dec 2019 08:51:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=Txh3EKOhvy2x/vEgoGyRVEpmN+uEx6uX5m7dUDa1hF8=;
	b=c9ZG/Fca9Ds3R3pTuoWqnWmPkuAybvET+SPxe62NrzGYPiaYb/4UMf0UsvRoagGoBO
	p15MliW+iSN71dNe88FUmvJEXyfH5wouvwUMc4CQwQsm3IH0LUVDH7qf2aPcu7OgiTKb
	NL1Fj56lkHafahoTuGaMbx/ZI9eXavbG49K/qgdUqKhuSliNK6PLdfZ5b6k4S5NZ5KQr
	VZvj1g4ANJ4ZOZokJ1cBjEEPLxqL11ZIe1OUoFkIUaUv+GnA4EeXxR1neRDf7LjZJSt5
	kNtehP40poQOmcrgfcvv5e/wkshs4cxNGkm7ygHzd/PJLG/WVbwJ922JwkT3oxydQRSA
	KChA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Txh3EKOhvy2x/vEgoGyRVEpmN+uEx6uX5m7dUDa1hF8=;
	b=DS1H6r3+2JqNq8uieG0qnjmdrggobGqDaNxAtYn0SA/seWXhiZiEJaNvBGgUTymQjR
	3TkXrjNh5yAgW5/UGbj88Grawn98FFU2JRtLsiHjwTgH7uCjQJURyUzcEXlcrP9Aodc8
	kQwX3DWnJDvDsYajT1rKeIz/bDR3FfHwh1ke++lYFRodPZEz4/xtqJX0Rhyeo6x9OxLR
	dvJjF7jmI05i0UonqjK8Jl+gYax5EPo+5eURdp6Ipc92L2hqdnf9ArxwE8Pvl0O7rLCG
	QnYul67yeMHwv2qpqiGAVGdytuXip7LVPwgDZetJeMP2OFGJ9srC5KjgUmDWfDTXo+Xj
	7wBA==
X-Gm-Message-State: APjAAAXbWCAMcH8YwHqsVFT9XnBQzNlpVzJJX2ArrK592EaxlHAS+W5b
	2IhBpjbrG1EuTw6p5hEwseddn1Re
X-Google-Smtp-Source: APXvYqyHMIikVB7/zkjC38JoCeavctktfIHAAdnpP+AlCQOygV5XQtiK827KdH8/dSagadnkf+JvwA==
X-Received: by 2002:a1c:ed09:: with SMTP id l9mr25042935wmh.101.1575219094522; 
	Sun, 01 Dec 2019 08:51:34 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F3CDB845ACDC091B17366D2.dip0.t-ipconnect.de.
	[2003:f0:7f3c:db84:5acd:c091:b173:66d2])
	by smtp.gmail.com with ESMTPSA id g7sm6228088wrq.21.2019.12.01.08.51.33
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 01 Dec 2019 08:51:33 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  1 Dec 2019 17:51:18 +0100
Message-Id: <20191201165123.12699-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191201165123.12699-1-schnitzeltony@gmail.com>
References: <20191201165123.12699-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/7] gnome-system-monitor: add gsettings to inherit
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
X-List-Received-Date: Sun, 01 Dec 2019 16:51:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../gnome-system-monitor/gnome-system-monitor_3.32.1.bb         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_3.32.1.bb b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_3.32.1.bb
index a3583d1de..f30edee68 100644
--- a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_3.32.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_3.32.1.bb
@@ -14,7 +14,7 @@ DEPENDS = " \
 
 GNOMEBASEBUILDCLASS = "meson"
 
-inherit gnomebase gnome-help itstool gtk-icon-cache features_check gettext upstream-version-is-even
+inherit gnomebase gsettings gnome-help itstool gtk-icon-cache features_check gettext upstream-version-is-even
 
 REQUIRED_DISTRO_FEATURES = "x11 polkit"
 
-- 
2.21.0


