Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81648C5B559
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 01:17:46 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web11.5965.1748999859643389210
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Jun 2025 18:17:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XwZkHggO;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-70e102eada9so56731377b3.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Jun 2025 18:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748999858; x=1749604658; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=azGG+Q/Odk4ZlBqs1Lf9RRCZ/nNJmQZh2Rgm7+PAjAw=;
        b=XwZkHggOvunLaHQVTsIBRJqcPVk18AMxfGTY9eUeb6MjPcUjFjmOQyxRs9VIl3IRSE
         ahor8JnN715E859PAIltLbX9xkX9eIyu4gn9Jl4OXk80RGytrbmnyWw8sQykhsnXNQ1U
         2iWO6AWNOV9On3S5S9R9rxAVDDw+tjyjDCa6YTtzOZWQ7a3W/pn2sS9I84Sc8887UbUB
         s/Fh9wP9Rf+awI/F7YuHWlpdn43TMk444KofNNteZlygvcR1svx02BIb1ahxj/hZZJ0+
         7vYfCa68HPuK+gpKBKari40tCs1a2rtgHzeaNv301PcN2pCVwN18sEvUW+cTuT+dHTk9
         UE+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748999858; x=1749604658;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=azGG+Q/Odk4ZlBqs1Lf9RRCZ/nNJmQZh2Rgm7+PAjAw=;
        b=AxwopUfnJdEHvFi/+rlE/DNvz3HlrAbqwIrNM8iV+qndYVpTqACW+6/EV0Wudw3Ko2
         49n+TRF14dUnKSPRuiMQSJ6660iSrJeIaNMeJv+S56G0j6OPUno2u0EWnAbptFu7bZ0Q
         fjkSL4iPCJuA/jJ3uKUHq0AeGg8zj1O9iRyi1UGRlEqfhvzPBGD2eqFmMuyqfUAWIkAp
         0rFw9xWhbo3Ek9ftFztVM819vMjmqrkjvqfpQxgkdqTqh3s+uYIvg7+VIqD/m1wK1csN
         e6ep+TeSnGgYbbnE9GLivUHLrX4ftr7iHQHW/A5d5BhcHSYQZqhBk533PyyR7evHrDOt
         GI5g==
X-Gm-Message-State: AOJu0Yy2CS/63DIuSpSrAwiQ02bsWTbZM3rISBf0ZvI0/FKpIV35Q5XH
	DF+jFDaQBQfZYzvUZjIzh6U/T4uf82XKpcZhIi5u0W2smkHmnv/tVfytNlijSbq3
X-Gm-Gg: ASbGnctJd9ZjVuQHVa5APre9mOMQ37B7UxYKKR47PgaZqfGlsDuxIAW9VUZ7t8uE4Kl
	MIvT9Qr8XRvGxCXl2Y6dagX+XU7xkxkZLU+oGlTMQbZMwNy/yxn+N871IpjzPOoPusiIwhEqvX2
	6R9IhqwCMubQ5L2j+JVikG8Emde/i25Nv5/hOsBc7xONzSFwzkBT2O3B65UvNfkN4gnkiuDMf4v
	U5mfDAq3yzKEPQK4H7/4zg5j2FKSt13Yy7RyliyC4rgs7g+slK40VH4iH2yFQNMDMI0lO3e9bH/
	a5v4g2SmlK+9GgIYW8LtTNRynMNUY+OHSJNJCUuzT1rKtJotCNN3duwvmog7HaHEgjL22jUM/VF
	PaKilX1nLUg==
X-Google-Smtp-Source: AGHT+IGq7KiW18beccDcTaFs+cM63Mt8eVHS3qL4+egghfxaHT64sm6QAT0htVxlk9rdjt/fIWaGoA==
X-Received: by 2002:a05:690c:d19:b0:70d:ed5d:b4d2 with SMTP id 00721157ae682-710d9df42f1mr12370377b3.16.1748999858314;
        Tue, 03 Jun 2025 18:17:38 -0700 (PDT)
Received: from localhost.localdomain (71-208-4-221.ftmy.qwest.net. [71.208.4.221])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-70f8ac08b22sm27841627b3.56.2025.06.03.18.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 18:17:38 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH] thunar-shares-plugin: upgrade 0.3.2 -> 0.4.0
Date: Tue,  3 Jun 2025 21:17:27 -0400
Message-ID: <20250604011727.869016-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Jun 2025 01:17:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117723

Changelog: https://gitlab.xfce.org/thunar-plugins/thunar-shares-plugin/-/tags/thunar-shares-plugin-0.4.0

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 ...nar-shares-plugin_0.3.2.bb => thunar-shares-plugin_0.4.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-thunar-plugins/shares/{thunar-shares-plugin_0.3.2.bb => thunar-shares-plugin_0.4.0.bb} (78%)

diff --git a/meta-xfce/recipes-thunar-plugins/shares/thunar-shares-plugin_0.3.2.bb b/meta-xfce/recipes-thunar-plugins/shares/thunar-shares-plugin_0.4.0.bb
similarity index 78%
rename from meta-xfce/recipes-thunar-plugins/shares/thunar-shares-plugin_0.3.2.bb
rename to meta-xfce/recipes-thunar-plugins/shares/thunar-shares-plugin_0.4.0.bb
index 065e89254b..f22e0ca9fa 100644
--- a/meta-xfce/recipes-thunar-plugins/shares/thunar-shares-plugin_0.3.2.bb
+++ b/meta-xfce/recipes-thunar-plugins/shares/thunar-shares-plugin_0.4.0.bb
@@ -7,6 +7,6 @@ inherit thunar-plugin features_check
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES = "pam"
 
-SRC_URI[sha256sum] = "1009d5e6c91534fa49a69090c53c54ab9da2e0428d08d8e687528f63a4ac3f07"
+SRC_URI[sha256sum] = "0afc9b9ff31c88b208ca9a58bc61d95f9f5408f2adbcd7fe911dfce9e22fba44"
 
 RDEPENDS:${PN} += "samba-server"
-- 
2.43.0


