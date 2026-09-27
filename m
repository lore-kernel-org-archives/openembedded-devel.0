Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3FB3CA5FA1
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 10:51:34 +0000 (UTC)
Received: from mail-pz2-f38.google.com (mail-pz2-f38.google.com [74.125.228.38])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35369.1790506294435403162
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Sep 2026 03:51:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=R9O50f8Z;
 spf=pass (domain: gmail.com, ip: 74.125.228.38, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f38.google.com with SMTP id d2e1a72fcca58-881d9da69b1so161605b3a.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 03:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790506294; x=1791111094; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ftKaaRexQp2c29VN9pw6LFKQjJkWbx/PkJlRvrciNRI=;
        b=R9O50f8ZUNC8htPGmRQKoRcdj4lwQ0R9+u9cGndXmcdsBDTTIVJqzsWmQKGE0JW3Sk
         vEE+UOFDS0Va/8ZMSaKVmiazwadH5Pc7vI6xzFGC+1ZUKjLCT8zr/lDCFwkfOaH4Hg4f
         N454YHoWLL2M4ajz6o0yLJkeEbH4jHT4hdZ1Y2BcKlDzHgapuSvVBMTlPjtjxlLygmvW
         YLLZ8h1PQKR9oDuidrqs3UESoRbgdvhu/V3Jo+6Q69BS/xYC7tDVAtv+VvkYEsSpwJfj
         uDblnZ2dms5n7R7NCI6HNw869zWKE6+rHS/Urcpn0XoZZd1GrVXNoM7XVAINmu5gFeIu
         0fQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790506294; x=1791111094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ftKaaRexQp2c29VN9pw6LFKQjJkWbx/PkJlRvrciNRI=;
        b=CkbcbpBiwHT05BXOFk1sNgQtWvtNKTar2/YF06Z7LB76xeOqQRuvhykF4gBSygQiOk
         YBT3c74bBYrL/gE9bcSkySNbBmU/9F4oiVygNm4w1QhJb9ZbI9GQLqbcBxrZAS1KbtPy
         FFn9LJK0+nEvtZdGBONpNhibyXqX5U1Z2OeIyaYk7ZWSk/sW/2OSij8SP+B8gWuwzWuB
         nhmAy/THFGY9Qi5s1GFP+TyhDyNbJYiWR2CzDkZdTC6ebn6z8YI/PjFGLV5+hdWwUW/0
         N7Q8k0MAivS8vA02SoiE8NyMxKAoric6JVzEeBoillp6hLKK3hYyb0Tm7eeSDNX8nTNz
         E25w==
X-Gm-Message-State: AFuF++kIZo4i9KQx3192zIsgBKAqHHvcMfBJ7sj7NIn3HPKEL2TsFYfj
	ZmhKiyaah7jHbP/fs8AeYJcv4ypNvweMr0Vt638b0LMgbKp2/LbRWjtcSvw0Ng==
X-Gm-Gg: AYBFou3R85CWwTdQK221vl3fS5zVc6ffYHa1RtuKEfuT9o5XMRoV53czMLld4FVs+sX
	EgF+jsOWr2GSf5Yx2Bd3VWPzfb8geob2zzWTQ1bd1Om9RQxiI9YtLpFmSn7QbIc/qwFlB7a9sXk
	UjnsqKm/Y+Cjk3nTmDEV8cAtafzOh4sF5D3z5M3dgV+UO8U8Fg5nniZfprjci+ikLDXh6bssYoX
	19MbSPakz+kKTvwxGVUOOdxoM9ek8sZ/PL6/DBJTxljBxBj8RZjdjveWnt+vhiUlMLVy17Rnjm8
	aGIjssDmq4CdS5QL7Aty5yEzE68ubGl6Z/wNxZISOB9nJt5faGoqWZXb9tZA54S8h+Ie8G3EjVq
	W7T+a0alpEKbUq+t9VK9vL6unk7fDXsr3mU7Ykn3SYL2VcpoQ+PDu5dFdL/tpIL6y7NBgcLPD2P
	SlSp/Qyk0rc1NfuKEnUPeARk7HrDPfTkHIQFbvxwCoRt0KAvoEb91bztqBY1+7Zo1jPnaRQ1DZF
	IKv+2nBa9J4huXRGbWRuyg=
X-Received: by 2002:a05:6a00:2e84:b0:845:dfef:75b8 with SMTP id d2e1a72fcca58-87e98f8ddbemr7760415b3a.15.1790506293799;
        Sun, 27 Sep 2026 03:51:33 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88268c5ed75sm640542b3a.48.2026.09.27.03.51.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 03:51:33 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 30/35] libfastjson: upgrade 1.2304.0 -> 1.2609.0
Date: Sun, 27 Sep 2026 23:49:57 +1300
Message-ID: <20260927105002.1832451-30-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260927105002.1832451-1-ankur.tyagi85@gmail.com>
References: <20260927105002.1832451-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 10:51:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130364

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/rsyslog/libfastjson/releases/tag/v1.2609.0

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{libfastjson_1.2304.0.bb => libfastjson_1.2609.0.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/rsyslog/{libfastjson_1.2304.0.bb => libfastjson_1.2609.0.bb} (81%)

diff --git a/meta-oe/recipes-extended/rsyslog/libfastjson_1.2304.0.bb b/meta-oe/recipes-extended/rsyslog/libfastjson_1.2609.0.bb
similarity index 81%
rename from meta-oe/recipes-extended/rsyslog/libfastjson_1.2304.0.bb
rename to meta-oe/recipes-extended/rsyslog/libfastjson_1.2609.0.bb
index 8ffa433c3e..7eb4b6796a 100644
--- a/meta-oe/recipes-extended/rsyslog/libfastjson_1.2304.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/libfastjson_1.2609.0.bb
@@ -6,9 +6,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a958bb07122368f3e1d9b2efe07d231f"
 
 DEPENDS = ""
 
-SRC_URI = "git://github.com/rsyslog/libfastjson.git;protocol=https;branch=main"
+SRC_URI = "git://github.com/rsyslog/libfastjson.git;protocol=https;branch=main;tag=v${PV}"
 
-SRCREV = "3a8402c1de7c7747c95229db26d8d32fb85a7a52"
+SRCREV = "c2329f89006600703711271c6c39fe5181286264"
 
 EXTRA_OECONF += "LIBS='-lm'"
 

