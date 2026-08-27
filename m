Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91B90C61DBE
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 02:53:43 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28011.1787799222499023222
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Aug 2026 19:53:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=pQP0mKYa;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-84f77cc7302so758052b3a.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2026 19:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787799222; x=1788404022; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hZ7j+euJrneCwkIlL0E5qa5d1ONMg2Y4uO+WJY9r6Mw=;
        b=pQP0mKYa7QlxSlPVQW/tdczZ0RlCQ22sZfOxerhi0NuFv6wSB4dZNl8jyNyyIPQFy9
         55i3QgoW5jMl6hsfMNjnYHyYOe2zJ/QxE3cSeXtMjvcbIG5Fs/iIxUSaFzKIbhrQ8Gu5
         ogV4vTusousq/nNTIW1xX7Gl/KsHzPJYGp+EXl9SV1gLJrwk2hHfmHBjOjEreMALTkvD
         0iTbcujG9ptgWoOJnuNUgCygFeEkBnPK0r/JBMQx99RW0vn9ZbvQt1doRtLxsz+dauxI
         oKoUwUHXf9ihgd7ePdwZoAWe3+3cqo7mnpSCmjq6lGGXZfq5wjA2qVbD2tZIACMcutLl
         d65A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787799222; x=1788404022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hZ7j+euJrneCwkIlL0E5qa5d1ONMg2Y4uO+WJY9r6Mw=;
        b=Osi5LPaR6Hxmt4c8UJqe+mCUZmosl0sA1q3kfM6dp8UbT5gYHOe1iVEARxo31x8qt4
         0jTALmcNttcZkISUXqdvovagxh//B2u/sKOH3chC7i2XllgBlGUBsPnBQ/0s9t8chLtQ
         jqdMg/V6IEidCK0B/2c0BJFKmlPnncmc1T7p8kxu2QmwuT0Qa63tfsp9jXn8owR9M1DI
         Y2o+fZ+lL2QZCYlJbh3FqJul/MrYHdW35wGTafTYARgqB0G8hHJabKP5mS9gQtAGi7/G
         i0eSb2DRr6L4BY1JYyN8edb/m5bzPgy/xmpwu3WuP3h7w61VSfrH63iFyJmQYty3n8xb
         FbSw==
X-Gm-Message-State: AFuF++muJe7xyi+1J7GEKkDsTC5CLI0cOhEiIZn68JrbgccEZ4IVqJVB
	/j04zr2c+89ZrUJ8iDh+y+use8nmMjLEbUBQgTs5jSiz6yqVMuVzOp7t1m24kw==
X-Gm-Gg: AR+sD10hQ5eEPMGqFK0qRD5kd+6KeRgiqOksh2UikHfsCZkJ4zrRa4A3u3PeIkG3UtJ
	9bWHES48Z5zKBdwSKAHuekpjElLDgqhLYXJ93QdRT8yPQmzT41KL5kA8tNp5vt5DkWur5y9vG4w
	QavuFjyoJsZkyy40qjfyPuhykOVDJgILQ2RDqG8TcRdroue76VhcEqndkS9PvmVAvH/th2PmB/1
	lsnjYt38OTOsjk9FXcqSt9+UPbEF+grmI1Wqq5dPaCuZkMyOSkVbzq5Sc63NkhVz3FiU40JGomv
	C0gguINMFKhe5Susv6g/obgIApXoVS8fg5E6nBZWhofT46Q7S9fzw1jiOKfAJWYMzSDQ2cEVD7Q
	gIq0w1thRX+SO6id3u2g3cV0N3Bb/6QK9TRWvAXbOkLU6bTbzSG3zcUOA7kJm+/+Rzd0861ouoc
	WebJ9EOjG3hByn42ztM4ol/CpVxIISudb/WaVMSGCSRT5e2L2tOcMxpJ8EmkboJZI5Nek/Ks6W4
	JnLqY23Apk=
X-Received: by 2002:a05:6a00:1496:b0:847:99bb:b6d0 with SMTP id d2e1a72fcca58-853757b68femr20213522b3a.15.1787799221771;
        Wed, 26 Aug 2026 19:53:41 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8556db7ab0esm5787b3a.48.2026.08.26.19.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 19:53:41 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][PATCH 4/11] mpd: upgrade 0.24.13 -> 0.24.14
Date: Thu, 27 Aug 2026 14:53:16 +1200
Message-ID: <20260827025323.1433982-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260827025323.1433982-1-ankur.tyagi85@gmail.com>
References: <20260827025323.1433982-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Aug 2026 02:53:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129524

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/MusicPlayerDaemon/MPD/blob/v0.24.14/NEWS

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../musicpd/{mpd_0.24.13.bb => mpd_0.24.14.bb}                  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/musicpd/{mpd_0.24.13.bb => mpd_0.24.14.bb} (98%)

diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.24.13.bb b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.24.14.bb
similarity index 98%
rename from meta-multimedia/recipes-multimedia/musicpd/mpd_0.24.13.bb
rename to meta-multimedia/recipes-multimedia/musicpd/mpd_0.24.14.bb
index 60abcdb90f..2c8c840423 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.24.13.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.24.14.bb
@@ -21,7 +21,7 @@ DEPENDS += " \
 SRC_URI = "git://github.com/MusicPlayerDaemon/MPD;branch=master;protocol=https;tag=v${PV} \
            file://mpd.conf.in \
            "
-SRCREV = "e9a65d66ef2a64ac6881e6e9e316e8665dcfd4a3"
+SRCREV = "62b5bc313b9f20ffc66efa500235ecb620e2ea08"
 
 
 EXTRA_OEMESON += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '-Dsystemd=enabled -Dsystemd_system_unit_dir=${systemd_system_unitdir} -Dsystemd_user_unit_dir=${systemd_user_unitdir}', '-Dsystemd=disabled', d)} \

