Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 10C2F70018
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Apr 2016 14:18:28 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id n3so17997373wmn.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Apr 2016 07:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=hq840wXPSFqKZn2OQbxQpZXR3OQluXr0oyiWAFl6SLU=;
	b=MDEj3N5yy50M572RKwz2B9nXL2k0rDlmX5jEAEODQx+UuAFkfl5yk7pjBYZH1o1JV9
	+tUD0OqgivT7plW/LG46V/TdiYe8IVtB6NYsVJe5ckaXNgu5ZDaGkuTm1LVz6DQjjnTR
	j3rFOAKdqt+RYNPQD3wgBd0Te/Iz2M5YaNbHUM4Zpy8sRtm0Qkt5KzZXXYqlkUqqn1PM
	72qpzGS2XAtEPKqZC6GqZGuyuDiNMev9N08dqnBiLvaMfvDN49Iscm0Ixn1k/BToWXF8
	Y0XPHTgi69N9ZrIZHtNzXQSpPwHqJuNm4esErK6LdaT+DtsBLGbT7K1yBYK0T+nnUFRS
	OKFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=hq840wXPSFqKZn2OQbxQpZXR3OQluXr0oyiWAFl6SLU=;
	b=RiKzK9kSRYm7bvoJDSJ6vFy7qFQDgKiPjGKHsBIR+hEO5Y31JSEznR/t8ojcgI2gej
	/Qd/oLKL94HchDjDU35ygynUE7MiUUFw6NcRfHM/AhozIVJsq/vvwqckQ8ezt4KqwoZw
	VTew+hlz44Be5Ck8XaRST/A+2Y50KNcPIK/oBvFCTMhgdxChlLpY9t2a42qBYicOEvRA
	1jQ1C8Jii/xit9uBcCjE63tPT1ntL4h6k0XQ7i94CbncjKVXOXDt/cb3p6PEkEAOFFG3
	E3qFQA/LwlJqHhDkPUc9OBpdopkWMjemTtIRAcQl8Usa/QVg0aRWGdCmAQQxmHn49wyt
	YFEA==
X-Gm-Message-State: AOPr4FWRZ4V4B1G3VptMeUXhEpvll11UJk6vtfJnZr0oSJxH611BI6xOGk782F845+zPaw==
X-Received: by 10.28.22.65 with SMTP id 62mr7373816wmw.32.1461507508955;
	Sun, 24 Apr 2016 07:18:28 -0700 (PDT)
Received: from localhost.localdomain (p5B0A19FB.dip0.t-ipconnect.de.
	[91.10.25.251]) by smtp.googlemail.com with ESMTPSA id
	gt7sm18710562wjc.1.2016.04.24.07.18.28
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 24 Apr 2016 07:18:28 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 24 Apr 2016 16:18:15 +0200
Message-Id: <1461507496-31242-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1461507496-31242-1-git-send-email-schnitzeltony@googlemail.com>
References: <1461507496-31242-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] xfce4-whiskermenu-plugin: update to 1.5.3
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
X-List-Received-Date: Sun, 24 Apr 2016 14:18:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...-whiskermenu-plugin_1.5.2.bb => xfce4-whiskermenu-plugin_1.5.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/whiskermenu/{xfce4-whiskermenu-plugin_1.5.2.bb => xfce4-whiskermenu-plugin_1.5.3.bb} (63%)

diff --git a/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_1.5.2.bb b/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_1.5.3.bb
similarity index 63%
rename from meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_1.5.2.bb
rename to meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_1.5.3.bb
index 2875f59..60bf114 100644
--- a/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_1.5.2.bb
+++ b/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_1.5.3.bb
@@ -5,5 +5,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 inherit xfce-panel-plugin cmake
 
-SRC_URI[md5sum] = "15187645e8be2c0d300714ce55c1a8d4"
-SRC_URI[sha256sum] = "307cbfa532a28c5c753409aba0330c2da010047b8fc2d669e06f12bf17712e38"
+SRC_URI[md5sum] = "ef51234117dabdf02f2f415643d858d6"
+SRC_URI[sha256sum] = "68a8273395671d5163fd8cd9a73755ef03d4ea74891204498a21582a9c2e925b"
-- 
2.5.5


