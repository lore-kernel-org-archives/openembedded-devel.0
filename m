Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE94CC55167
	for <webhook@archiver.kernel.org>; Thu, 30 Jul 2026 11:30:04 +0000 (UTC)
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9540.1785411002368517372
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jul 2026 04:30:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Mxp5X/oj;
 spf=pass (domain: gmail.com, ip: 74.125.224.44, mailfrom: schonm@gmail.com)
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-664c6304683so1861756d50.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Jul 2026 04:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785411001; x=1786015801; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JihGAU6YaJl91Vpw5D0eD7k/Pvf30mkzl9zUB8gcmtw=;
        b=Mxp5X/ojQ2ETxy0cVsDsQ0EFGAuaX3y58wu1FYc5HQgQ2SONM4sIaxsavKosEGvTGt
         j3q97ms7YXvYZRw1pdjq9X5sPIwXu9qfcmujSYGF+1EcANmeF4BMTjDcyAJqA1w5AYQT
         KIgqYbn/8t03LckFBKi1aQEiqVNrP+UqnxizFWXAUj8s2Sl7vyctc0jip++r/JPff0Ga
         hg2pP7nLFEfVzpvP4039+y/T7VkJfHi8t+DeKCvYxyjrPYqYb9ZzIWNLsmKQkerbt2kv
         FdiitdKdUFTwy9WnzLQVsoYkvteEdMPpBfheLbTQGP/oKxXXoPX+LLGF8HazfAAmm+nx
         Ca9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785411001; x=1786015801;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JihGAU6YaJl91Vpw5D0eD7k/Pvf30mkzl9zUB8gcmtw=;
        b=TDVdOez8+YI6WFGTUOxq0v1h7tP1mGO/QCKPQCHMlKcAqy8oKjYxcapknPlcwDh0Yj
         Bb5Dp6kKpJYLpAFseQFI7DSUMv7aZusIO0wqJvBMWg7O1XkHI0+oARqO8qH8Qt4Yxmwq
         eyqd9xl61hc5y/HXJ3c5vBb1yV+vhgYGjmuQO7h7HTy9Bhii8j+RzhT/mSNKy1fpEp6R
         kpfqE0hNiRAN1EZq0M9Q5kLAN4KuYJg0wtOXIoYOAHEHYNXdMKfgtGdQjWoxJ/K3RuiF
         W7xpgnH2iQOz3jakqDlYJx46H3S8hwoHj9AmJk4aAUz0EPzWrWjGfOM6VY3xGJT/qpUO
         wnpQ==
X-Gm-Message-State: AOJu0Yyvk0yewyxA81f86tQ8flX2q6h2As/wWs+7TiCAEt0tW8aIRXgD
	ihUdtgfCM+vEKwPim4NkCm7u1IzlvEFD03Ls9ycEvQxoZJ1egvwIjyndsEEvz9Fv
X-Gm-Gg: AR+sD11QGGiEDDz5sAlwSH8HpZ5JD5OKE0FTlvBxtHz15lWoqVuT33+eVBnUhQiF8X5
	4cPZwytJpOWrLblGw8awZcfgkx+sqyMLJWb/aAtKJAfdAzbSRe0g+WClqEoMICZtkooj8BPXl0Y
	aUYrR2oaz1XTHuueX8mpU0w6FQ5BYqmKyJeK1mcYaddchSJYY3Q5CKJICE3dbykjiVe4fCX96Ym
	d7DpKxAWH0wcW0Z8Zc2PRIQq4Ixfkqw8Yg9Lu/n+J8RmKkNFSuw+iRNeK5ECFdjKvClAG2a79KQ
	nWbA7REHO8kxx5GBsDr+7RluY5dWgaALLfLHWYtRJudXhKT+E5dRLHwRqi/WfChaucmu99LqDeU
	J5D5T3WjtoTzZ0TLyEI7ENtByhruZXOFD6yXpK8yEHKgps+qnoRaC97QdyPXabEk45UyrBi8/Wm
	q00WPIa50yFi/AAI5YEDJKhJrwnJEXp419gj5IKnlVmgOvzS/SuqExfpTTuUZpvEcE/6gi1P8JW
	ts4/4Id6sThr6M1vXYjBCBXpdO0VmeaROyrUeARgB6M5mmsYUJMUH0O+JPRAuFBN2Vwop03dS2K
	O8Nh7jYUmHYs
X-Received: by 2002:a05:690c:c4ea:b0:81d:c233:aea0 with SMTP id 00721157ae682-81fb892bd50mr16080877b3.18.1785411001000;
        Thu, 30 Jul 2026 04:30:01 -0700 (PDT)
Received: from localhost.localdomain ([71.54.207.93])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fb88c799esm8185757b3.4.2026.07.30.04.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 04:30:00 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][wrynose][PATCH] nodejs:  upgrade 22.23.1 -> 22.23.2
Date: Thu, 30 Jul 2026 07:29:14 -0400
Message-ID: <20260730112914.1702437-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Jul 2026 11:30:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128570

This is the July 2026 Security Release.

https://nodejs.org/en/blog/vulnerability/july-2026-security-releases

Changelog: https://github.com/nodejs/node/releases/tag/v22.23.2

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../nodejs/{nodejs_22.23.1.bb => nodejs_22.23.2.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_22.23.1.bb => nodejs_22.23.2.bb} (99%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_22.23.1.bb b/meta-oe/recipes-devtools/nodejs/nodejs_22.23.2.bb
similarity index 99%
rename from meta-oe/recipes-devtools/nodejs/nodejs_22.23.1.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_22.23.2.bb
index 8ad884b9cd..bfa5e296e2 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_22.23.1.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_22.23.2.bb
@@ -39,7 +39,7 @@ SRC_URI:append:class-target = " \
 SRC_URI:append:toolchain-clang:powerpc64le = " \
            file://0001-ppc64-Do-not-use-mminimal-toc-with-clang.patch \
            "
-SRC_URI[sha256sum] = "b27385d6845089bdb91285d94b06c2a5cf1c37f8173a3c4e10824cc1ffadeaba"
+SRC_URI[sha256sum] = "bbe768df8d5815d7fa76124052985332452e0a4742d39f32027550d1aab8f6fb"
 
 S = "${UNPACKDIR}/node-v${PV}"
 
-- 
2.43.0


