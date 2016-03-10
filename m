Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 7D04F6FF23
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Mar 2016 23:26:16 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id n205so971877wmf.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Mar 2016 15:26:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=MzXW/8vv8HJKZ7PoWQuY3NbQHD8CjdaTM9olFYeiyQs=;
	b=IHP9uoq56j/M4qR9wvXRnyIJjmKv3MHgYbsHu0jiky7rnL1hbCj7yA2n4IHL6C1eo2
	A2Db9Ubgg2TDwNZdVbSJ0c0CbRecCy9WLonTwjJkzcyNCk/cAtC9+/ohLgALorI1JH6u
	Cz5/b0zBUTiwRvrZETZeRKrSnGm7VREm55gAiER1jvUq04Kz3Zzrl+EMEukV8YYA0hfV
	t1MY9EcilL7rVEHW/GeaQfrBTBIxaN8mSDBpuKu/uG6jkm2c+t8qqd/sZ0K80CY9VrqU
	rziJ8lk5MSk2jKjhy3GGIRiMAA8jCUuk1p7ktcb89o16ULgu6FDUrnLPVg2Jzy7Ie2oW
	dvTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=MzXW/8vv8HJKZ7PoWQuY3NbQHD8CjdaTM9olFYeiyQs=;
	b=JT3tpR0BzoUJBuKv8dW1StSHse5sdHUFBbYvrS6DEAvHPPzGjAFC6Cq2Dp5EfdrRH+
	H7OQ2kXRSt4yI23Ov9C0F/jskhrGdgHKXJGPQt9C/18O+WlviTcVJhwjub6Vg3Xy0j0e
	kP5iouqyN3t+k6+L4GATvWa9X7Ezs2jZ+cpLpIlY6U3Yj+9Mw38/OnZp6DINgE+62rVG
	UBjfzGEUEXffKFTtk1mwRYiwGgmDGNKktxhMEMuYFqLNs/4D1JbRMw6YVvnOII8WFU6H
	gEhb1SY3uvPLZJUPNYWwx9AkaUxoAmkMyU1GVzN2iBe/Om+x8/s2F8QrvmzLNY86fPWF
	vjqA==
X-Gm-Message-State: AD7BkJLsH4qjuUJMu0/jN+9De1gakG1L1Krajj8Gg4CsTtzWzJntW1kROmd5KOsjhgUMMg==
X-Received: by 10.194.123.102 with SMTP id lz6mr7177792wjb.2.1457652377463;
	Thu, 10 Mar 2016 15:26:17 -0800 (PST)
Received: from localhost.localdomain (p4FDF0B8D.dip0.t-ipconnect.de.
	[79.223.11.141]) by smtp.googlemail.com with ESMTPSA id
	e19sm390869wmd.1.2016.03.10.15.26.16
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Mar 2016 15:26:16 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 11 Mar 2016 00:25:59 +0100
Message-Id: <1457652361-912-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1457652361-912-1-git-send-email-schnitzeltony@googlemail.com>
References: <1457652361-912-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] xfce4-pulseaudio-plugin: update to 0.2.4
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
X-List-Received-Date: Thu, 10 Mar 2016 23:26:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...e4-pulseaudio-plugin_0.2.3.bb => xfce4-pulseaudio-plugin_0.2.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/pulseaudio/{xfce4-pulseaudio-plugin_0.2.3.bb => xfce4-pulseaudio-plugin_0.2.4.bb} (73%)

diff --git a/meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.2.3.bb b/meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.2.4.bb
similarity index 73%
rename from meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.2.3.bb
rename to meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.2.4.bb
index 9a95cde..65026ac 100644
--- a/meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.2.3.bb
+++ b/meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.2.4.bb
@@ -8,8 +8,8 @@ REQUIRED_DISTRO_FEATURES = "pulseaudio"
 
 DEPENDS += "pulseaudio"
 
-SRC_URI[md5sum] = "13a47ba5a72c16fb06f7e1cc89858cc7"
-SRC_URI[sha256sum] = "e82836bc8cf7d905b4e60d43dc630ba8e32dea785989700c71d4aeee9f583b33"
+SRC_URI[md5sum] = "e0ffde419fa030f1f9bd0b56e3264a1c"
+SRC_URI[sha256sum] = "8d9330ddf1d44a864a36d566cce4b76d4f859c5984bba7653d7dc39aa24d5c3e"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[libnotify] = "--enable-libnotify,--disable-libnotify,libnotify"
-- 
2.5.0


