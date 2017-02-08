Return-Path: <andreas.kling@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id C187071B26
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Feb 2017 14:31:55 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id u63so33533914wmu.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Feb 2017 06:31:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=RT0AFngnHJk2qaSScXzVg+jorrRG/VFdZCQbeqtwTto=;
	b=tvi0epvNL8THY5KatJC9OttpLv40hCBRHlahD9nM0AosCX+i+yapLQxPpJWKH1/FzY
	O6JaPwR4Sv7tyJu0PXzYlt1j/AipU31QfGWgAHV6SpcgwOEcAugDsAdcYwHUVEiXgg3n
	yc2BpTidWaNqKpB+WaYHTJwHrVaAc7PiuO1x+9cOWJxhxqu14ZM7+El9Kd/naaaiUiIz
	dGYjImKWmNyymRKimmp3FjXeICOGuvFQfbaJuUwTSGEvTHCBEGVF2FMBmd1yYqxP5Xys
	Hhj1AdhSdZ0ZSkLx7byYKyByMPc8Ujv3qkwJcITh5iryydoc8quLLWjZM1UGleyRKaXf
	IHtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=RT0AFngnHJk2qaSScXzVg+jorrRG/VFdZCQbeqtwTto=;
	b=TP1zgXWWDOm7POyPQd7rJtsJmwbu9L7yD1u3F+L5+0QZKaPNiHicdUYWaCrwB8rCgi
	e6g4OCFY3joO/0JvUYK5GuQSv3mMz3xZT5pYauCzpsF5lD8JZ8oofeW1Rz4nrDOS2Vz6
	HSbCYoF6LyzwQRwyyOm67OMSdqKkeyJkCpsLQTiK3aw3FEVQEfu8c27604x2VhvMf1uB
	kKzXT9DkREtHNMpfDCjno4SqpqQpO0ieT0Te2bJZM4DaCIEnUrGrg9vywhNuGM1ztD+b
	Wxpjp/logh1ryN23stfSBKLxMoJGFYlnRMfLupPsq+RXhB/GbFFRUUDQb2/fLIiRLA2s
	n3rA==
X-Gm-Message-State: AMke39m1F45iT3rRr3pKosfuj0/PcbE+1McZizByrRTW8q+J9BaJfj/MxIcYvWdvE3mckw==
X-Received: by 10.28.1.216 with SMTP id 207mr19210201wmb.7.1486564315574;
	Wed, 08 Feb 2017 06:31:55 -0800 (PST)
Received: from nb-lx-hgc-001.peiker-cee.de
	(business-176-094-229-202.static.arcor-ip.net. [176.94.229.202])
	by smtp.gmail.com with ESMTPSA id 36sm13283196wrz.8.2017.02.08.06.31.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Feb 2017 06:31:54 -0800 (PST)
From: andreas.kling@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Feb 2017 15:31:39 +0100
Message-Id: <20170208143140.22903-3-andreas.kling@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170208143140.22903-1-andreas.kling@gmail.com>
References: <20170208140755.12812-1-andreas.kling@gmail.com>
	<20170208143140.22903-1-andreas.kling@gmail.com>
Cc: Andy Kling <andreas.kling@peiker-cee.de>
Subject: [meta-gnome][PATCH v02 2/3] dconf: fix bash completion in wrong package
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
X-List-Received-Date: Wed, 08 Feb 2017 14:31:56 -0000

From: Andy Kling <andreas.kling@peiker-cee.de>

  bash completion is used by dconf itself not by editor.
  move file to main package.
---
 meta-gnome/recipes-gnome/dconf/dconf_0.18.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/dconf/dconf_0.18.0.bb b/meta-gnome/recipes-gnome/dconf/dconf_0.18.0.bb
index 2830e717b..f7666cc0f 100644
--- a/meta-gnome/recipes-gnome/dconf/dconf_0.18.0.bb
+++ b/meta-gnome/recipes-gnome/dconf/dconf_0.18.0.bb
@@ -22,10 +22,10 @@ PACKAGES =+ "dconf-editor"
 FILES_${PN} += " \
     ${datadir}/dbus-1 \
     ${libdir}/gio/modules/*.so \
+    ${datadir}/bash-completion \
 "
 FILES_dconf-editor = " \
     ${bindir}/dconf-editor \
     ${datadir}/icons \
-    ${datadir}/bash-completion \
 "
 FILES_${PN}-dbg += "${libdir}/gio/modules/.debug/libdconfsettings.so"
-- 
2.11.0


