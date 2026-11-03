Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1466.1793731016471153906
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Nov 2026 10:36:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=cQIOHbTY;
 spf=pass (domain: gmail.com, ip: 74.125.82.42, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1aefd1bf74aso1029896c88.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 10:36:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793731016; x=1794335816; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yX/GL1WBOGOsmMKMZNRADq8Bk7rActxgTRLdRQelBz4=;
        b=cQIOHbTY5Hf0dcX/XnQaaPWcJ3emeimVcWjv3KmC3ytwmQE5eoQXiaD6/U3D+jR3z9
         FPWseJs21fWiggd0wmrKjWs+0az3avG+FFvFIdeLaOHfEDRQdZB0uOeLGAtaIMJrHUwy
         t8rDniWIGlaC00V/X9X/Yw//3mYPa5z+u4e4nBBJTJ+zBS5BQyWyqaw7Z4cp8MZIy2dP
         kYajjoHvb33549AJMWrEqwCXPlG+q09mBBWC1TjwDLlR/x/y3BLRO47JTp656qgQKA8I
         OSnBLu40bbOdIOwNKKVYRbdyxVeJ4WSEkbm6s9lUbfAX1RhTsYFQqiLlxKumijf9xVG4
         snVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793731016; x=1794335816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yX/GL1WBOGOsmMKMZNRADq8Bk7rActxgTRLdRQelBz4=;
        b=CJr+Ii3yQd2O0sdgoGpkz2Jn0Bjuewsb0pfLB+212kGpDv3RQWx5OH8tPjB6R01/8g
         7vDuR/BTjX7+4y9Wdech8L6HLE3qr5wVN21IJXBlRXS6ZztWFLGnZFP1wLWUwxcuMFHg
         rvjab0S9UqepjXNknkFLsjC+isFy//BSVcHn7IqUCri9DwMuWcZ5RFY3at5LPP1spxhh
         syBnCX8JqusQ16oJjmQKnExQ+GCKcs6r9YZunbiBTkuv7ZxW1EpPHF9kLcXAOfd8IenB
         fz/3Y7NM6f+dG1YDC1P3ugeCdLqIfr8YEgYUF4mXGDwFiUoDVfPzpohjBB5UcbjALTqX
         Smww==
X-Gm-Message-State: APuU4Z99FnTef1Bh6BA6Gbe9vSqRWTFd2Qp2ge0QymSZ+Rjfwg+OEnem
	78qL0Ln1cKrjwvoapem65nDk5MSdIEj2Tvfz/dOlfDc0Bxc4F+9GjqLHBWRB0g==
X-Gm-Gg: AYBFou1VLOxlQrqaHjl+ecD/sA1Tth+MNddKWbYOeZuZQzD5/hUsVMmTwLb+ASWAYap
	3AeJpigxboCP6Lp7EpLz++vU95ej6X7JJ9AmhDrnF8/I9pXnXCy28pmt18Qa48XjKceDHJjySqS
	SoBlDhfgdU2VONhnTHO+M0CWVuERmRXqX58Gv8FJMMqIN7cWdHl1Uh167t3/oK6FqhTrhRKZbvY
	y4qdkjEMylegwKJGtiGd2oXVUc/eXa4W2gAKjspeQMoycFFEeilJTi4evk+iYLw2bOvcIRmIy/I
	1tw73BQzpDWaCeqNTTmGR3E4jlnYzyzgPxedFVy6NWB2DWoMi4vQDV+iWLYrUkiBwr8sQrjnCqR
	v4n1F85B30OYo7KhW4ip2x+/GQUaYzMJTRchyvFRJ6nF/kW8GO9O3mtii6veLlhTUif3y7UL3le
	rUbqItpSEys9Jmk6klpnPxJNscDJAOwHMSrWVMlG5PqhTXzXXJZ/O1bbdQSQM3FzG1W6V65dhUg
	u1V1QL3EVLk1J90aS6CPAsZI/kIUcHa0VjNhkyeRclk5JUL1zk054aP7NW9P8qZmhvg60xn0qLu
	AhESCKXSL1ScbfjpOqSU9vIyJgN9nPkVqV9yQZvPESkpWc6ylYvX0+atRngo1g==
X-Received: by 2002:a05:7022:294:20b0:1a9:4d51:8c33 with SMTP id a92af1059eb24-1ac5bda4837mr18953978c88.18.1793731015675;
        Tue, 03 Nov 2026 10:36:55 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c4f83fsm1192887c88.17.2026.11.03.10.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 10:36:55 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][PATCH 5/20] weechat: upgrade 4.10.1 -> 4.10.2
Date: Wed,  4 Nov 2026 07:36:25 +1300
Message-ID: <20261103183640.919438-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103183640.919438-1-ankur.tyagi85@gmail.com>
References: <20261103183640.919438-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 18:37:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131803
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/weechat/weechat/releases/tag/v4.10.2

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../weechat/{weechat_4.10.1.bb => weechat_4.10.2.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-irc/weechat/{weechat_4.10.1.bb => weechat_4.10.2.bb} (95%)

diff --git a/meta-networking/recipes-irc/weechat/weechat_4.10.1.bb b/meta-networking/recipes-irc/weechat/weechat_4.10.2.bb
similarity index 95%
rename from meta-networking/recipes-irc/weechat/weechat_4.10.1.bb
rename to meta-networking/recipes-irc/weechat/weechat_4.10.2.bb
index 00030452dc..01565119e4 100644
--- a/meta-networking/recipes-irc/weechat/weechat_4.10.1.bb
+++ b/meta-networking/recipes-irc/weechat/weechat_4.10.2.bb
@@ -8,7 +8,7 @@ DEPENDS = "zlib libgcrypt gnutls curl aspell zstd cjson gettext-native"
 
 SRC_URI = "https://weechat.org/files/src/weechat-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "b8744c6f5dc5543062791f563e0516dbc96a36161e1a03c468b3b7dcc8be5aff"
+SRC_URI[sha256sum] = "6fcd05f350c808a4206d6951af36a9eec11b145b6a1a2a8a2b29dd3502e07022"
 
 inherit cmake pkgconfig python3targetconfig
 
