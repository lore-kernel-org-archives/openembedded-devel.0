Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9EBAC88E57
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 06:12:53 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13879.1769407967768140025
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 Jan 2026 22:12:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LpVI7XT7;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4801d21c411so21199635e9.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 25 Jan 2026 22:12:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769407966; x=1770012766; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IrrdIRifIdOVTEyfWXx2lxNmzcwdOqhtMTh3OVByPbs=;
        b=LpVI7XT7DdBr9JmPnQESkg4gpzFCJnyxW0TqXucqT3l/MNUeHLGMHS2YoRm+z7cOZZ
         inGC2CK2CA4+wex1ksdOp1wKPFutuBy+33lHvE1+HWfD+dNuwWeIgndyoGf6im6k6FXh
         8XgU8NiA8HRjfvBwbLdOhWuTxrD9eYYLCXPHIVeTajQa8obB1aGCvpan7R9e8123vVag
         fv7AfC3XoPhR+uILFzhqdx1DJTGbhoVPUUeacCpR3as63yYE53LbK5paPDfTyxoYLVEp
         TLq+0LemO6dJpB0UJE59M38Qvp+vaIK+dbFsGPC7//5GSOgLnKhdy1IOlJzcWTP83Fqr
         2QYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769407966; x=1770012766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IrrdIRifIdOVTEyfWXx2lxNmzcwdOqhtMTh3OVByPbs=;
        b=lYmg8BFPD5syssbCghGKu/SXTWiUFEayhtPa1EtOenKzDmtVKeypPnO1OTOzC5N31h
         LZy52FMmqwu8cGAQuL2tGS2eGVqHgZa7pVdZg0bIr2++YhT2uXpSmS6J5D2Xdu3sMjrB
         9PVfFBQlGc05vyPe4SnEGq4mg2vzzEkjffCinRAYOFw9HngNQ+kxBQVfkGsOu+RKR+en
         YQ0TSzTrBHPT4WgySdqRnJiVKpg0+tTlz6Zp1e8Xfz6k3mMXgRXh+9ObdSEk3pV9ejob
         5td9Q0Wdq/wDNGogcuutEnhzHzqjP8O1uFpSXYzWCBUHJ3gMpEmJwpFF+rV5f/SRcnG+
         0rYA==
X-Gm-Message-State: AOJu0YzzVQHMP7XQPWsEH8GEvrLt/Z6Y9lfTiCtckRlKI0u3nSVnfF7i
	BQ1CH0me9uoif8yU9b+fC5WDbv+Fd++zZREpbZ4M7pmouXBn5VMajyka1Y4W0A==
X-Gm-Gg: AZuq6aJvElHhDz1baUH6ogn11SgGz62UNePp0UivoGd3yIW+i4Gtk9pehftiVubCs+O
	LdwauoQbh7m3CJEUEg1ufN5mJ10WIBPqELCPEztq4mk0WnxZNBTb5J57nn1DLYynzi75FV8obgg
	IkOqJ82dFr++B9RLtccdNFCG1jyT8OYdEMv9nfaIQ3hVtQTr1L0/vCiqFRno7R6TXtN80GeDl1g
	WGrlgrLLEQr3Gq8ZBG/ulEicNxq+MEXex70yqOSr7eOF5Q4FSY1SKlZTVzaS24iVZ8u4TWPrcKx
	eSZ5BeXGIVMaduxLXaIKyyM/etjWzQwhxN22F1MNbfOCCkGXVWOrlyXeBs7W37DZBsKu3oSXo3V
	jfX3KtRO40ZXLrn3b9kAdRVhi4GGsIZbtDCe7OZkOTsaxgJaRk9a2vaWljLLYNef28bbVCQT8yN
	Xj3UxdmMw+
X-Received: by 2002:a05:600c:524c:b0:47e:e2b0:15b8 with SMTP id 5b1f17b1804b1-4805cd409fbmr56348125e9.4.1769407966127;
        Sun, 25 Jan 2026 22:12:46 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804d6588e3sm97454005e9.3.2026.01.25.22.12.45
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 22:12:45 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][kirkstone][PATCH 2/5] gnome-shell-extensions: upgrade 42.0 -> 42.3
Date: Mon, 26 Jan 2026 07:12:41 +0100
Message-ID: <20260126061244.3386739-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260126061244.3386739-1-skandigraun@gmail.com>
References: <20260126061244.3386739-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Jan 2026 06:12:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123851

Changelog:
42.3
====
* screenshot-window-sizer: Fix reported sizes on wayland
* window-list: Improve touch support

42.2
====
* native-window-placement: Adjust to gnome-shell 42 changes
* window-list: Fix visibility on non-primary monitors
42.1
====
* Misc. bug fixes and cleanups

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...-shell-extensions_42.0.bb => gnome-shell-extensions_42.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-shell/{gnome-shell-extensions_42.0.bb => gnome-shell-extensions_42.3.bb} (85%)

diff --git a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_42.0.bb b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_42.3.bb
similarity index 85%
rename from meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_42.0.bb
rename to meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_42.3.bb
index e8c95d6fb2..23680c22d8 100644
--- a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_42.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_42.3.bb
@@ -8,7 +8,7 @@ inherit gnomebase gettext gsettings features_check
 
 REQUIRED_DISTRO_FEATURES = "x11 polkit systemd pam gobject-introspection-data"
 
-SRC_URI[archive.sha256sum] = "3ee65b75b1afd8bcca0a2a03da9b2884787ed40e257a881d9aa6ef7c8727602f"
+SRC_URI[archive.sha256sum] = "0ec2bea32e9f28ac805891f613194d48fc0c091f09c48313065a3884f72273fc"
 
 DEPENDS += " \
     sassc-native \

