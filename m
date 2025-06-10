Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DD46C5B543
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 14:43:07 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.web10.88979.1749566581479224364
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Jun 2025 07:43:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dX7GjYXG;
 spf=pass (domain: gmail.com, ip: 209.85.128.171, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-70e302191a3so41437427b3.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 07:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749566580; x=1750171380; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3HTc0wEKbb7sslktmucTyU1ZotgyBmxTNR7TqfaZp30=;
        b=dX7GjYXGI9iqRlnMZ2fL+4AVGUauMeoECGP1k/XAOo0ywOpt3LeGoKEAfec4tBPd+e
         +/24sG439So0nI48ni6Mi/7QwmfnW/YhZZJyYRdGrMcNahZzVMQ+0wwcUsrmw0OXd8hn
         rqI10fpk5i/XLjKu7kIKSjGy6byLeANdxh0Pw0DS3aJJ/mQIX7KaL+ePkXl9n78xq/AJ
         XgSeTeB8+qb1aBE19QYT0gL0v6gcGs/vicIE4bbIw3KVGAKPILOFG4wgtx2mBzUAX+TR
         o5N/w2kbr7s+5/cleKp15Co1DuDp9eej/ctKBsMF3DNNxD4w1S7T/BMsUhOHlyB93JBG
         T0mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749566580; x=1750171380;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3HTc0wEKbb7sslktmucTyU1ZotgyBmxTNR7TqfaZp30=;
        b=VFsejTdW5hcFZ9Mvo1dx93rKexnBqW0VE1dRmZcxQsLAkEqSl8/IrHoPHh6jfVDZNc
         z7VZhJ9C7z4m1KiioDNBjEQaADdTeTd8j4i/5gjcEqGdztqX78IQP50PXcFLp6tq82V9
         YEegXduwpLo3FDQ9NFiR1mlaYpS30oOJp/7/SIecy9kTVBunQ5K7aGfkwJKUHwtPlAsy
         I15Exwutc1gFXHkKLjp5TYBJR9pY0lecgbcsJoWfXvHnE85R1R7hJybwHm9CSkZj1o+R
         FgVd+UM8urAREMf9PyvCInjsyY82qX9ztWRPkRkVyVbEqaqoQ6EVwuIZPIcdzKB8u1Cx
         Qo0g==
X-Gm-Message-State: AOJu0YwQnDAA1zhfwL8vAZJxikjTFKNr1DMcUUp7DIMPer6TJcw36NuR
	0JGAF9J2PcNo3qWr3RrePlu8QeeYU4S9kjpHuLOwllAvNtJ7E4CrVNCJlVkTjXY8
X-Gm-Gg: ASbGncsspyZfFM7Y+JNVZzSKo9QgNvt9w0fizWjLHTgTsNmhP0OfkSZpQqJMiGxvlIi
	vHA6NZVvb2Tv/rJcDhBdctyGb3B1lHiUekr8CA7HB4uB1Q4atQGTOIE5o7MWZzaPAovpd13ROzW
	s3MGPpT5rj3svP35DnLSslirvUS9IgNs0z+I8KNj2zoS8XckdrFRkgld9spibomTkoSReVEd/nP
	LEJGrmQfUJWQMXtJKsj+xdo3z/bGNjmxIGSSxR7UuZTeu+Xxbsx9CzWXaNbIzWsHoHoKeO9Yn84
	MdZLRWgous6L1ULBM9FnHkAwKeZZKkjDMdw7E6u40ClHxQlVRjbGN1uHe1CrilJC6uv0HC1tiB6
	B+deZ+xzS8wZ4AYhsvt4eVuZ22ikqH/w=
X-Google-Smtp-Source: AGHT+IHdTTZK0dQJTeOAlM+GJTHexnEFCwEMdv31rUnW7B58SD/QvDUxGFWaspCE/3z+H1LxUcScWA==
X-Received: by 2002:a05:690c:650a:b0:710:f025:4077 with SMTP id 00721157ae682-7113fb987ffmr3366007b3.2.1749566580038;
        Tue, 10 Jun 2025 07:43:00 -0700 (PDT)
Received: from localhost.localdomain (71-208-4-221.ftmy.qwest.net. [71.208.4.221])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-710f9a0fc34sm16379947b3.97.2025.06.10.07.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 07:42:59 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH 1/6] xfce4-screensaver: upgrade 4.18.1 -> 4.18.4
Date: Tue, 10 Jun 2025 10:42:49 -0400
Message-ID: <20250610144254.884143-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 14:43:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117865

Changelog: https://gitlab.xfce.org/apps/xfce4-screensaver/-/tags/xfce4-screensaver-4.18.4

Changelog: https://gitlab.xfce.org/apps/xfce4-screensaver/-/tags/xfce4-screensaver-4.18.3

Changelog: https://gitlab.xfce.org/apps/xfce4-screensaver/-/tags/xfce4-screensaver-4.18.2

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 ...{xfce4-screensaver_4.18.1.bb => xfce4-screensaver_4.18.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-apps/xfce4-screensaver/{xfce4-screensaver_4.18.1.bb => xfce4-screensaver_4.18.4.bb} (91%)

diff --git a/meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_4.18.1.bb b/meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_4.18.4.bb
similarity index 91%
rename from meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_4.18.1.bb
rename to meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_4.18.4.bb
index 2c5cba0d8f..7322dedc29 100644
--- a/meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_4.18.1.bb
+++ b/meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_4.18.4.bb
@@ -13,7 +13,7 @@ DEPENDS = "dbus-glib garcon gtk+3 libxklavier libxscrnsaver virtual/libx11 xfcon
 inherit xfce-app
 
 SRC_URI:append = " file://fix-cross-compile.patch"
-SRC_URI[sha256sum] = "b731e8abd68a18cc5d3b523351aa8f9f293c9f63290c1781c9155259deb04a5c"
+SRC_URI[sha256sum] = "cf717d032d2d0555978c479299da992af6dc3363ae7e758af9515c7166eac170"
 
 do_install:append() {
     install -D -m 0644 ${S}/data/xfce4-screensaver.common-auth ${D}${sysconfdir}/pam.d/xfce4-screensaver
-- 
2.43.0


