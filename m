Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4578C982ED
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 12:22:42 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.47603.1789993348821653356
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Sep 2026 05:22:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=krOZ6Xs7;
 spf=pass (domain: konsulko.com, ip: 74.125.225.141, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6b885ef8so15927065e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 21 Sep 2026 05:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1789993347; x=1790598147; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CJa6rifmndUPIqS+j+fHCmIaadhe3VBSXy0Zoc9qxME=;
        b=krOZ6Xs7gAhwk0NWgzgNuEO6a5rKI2lTSaYsboEpsQLdMYonK1Ymzijf6xeE7SWV+5
         dSAtDKw3hDu0lGvDUuKcgdGn+shkJMa1hwTNtsFNPWnAnTdFJBQwY1aLYKMpYgHp6wPl
         y5OxdiDcIAbvpjUIEUq7gngSUF3pqL07iqPVc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789993347; x=1790598147;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CJa6rifmndUPIqS+j+fHCmIaadhe3VBSXy0Zoc9qxME=;
        b=slBGOi8fv82nqowBpoGml7En0uleQeeatgWbSxIYwBr8xmhPOxD54K60j9gBeQ2CC6
         +zcHGpapCey9avLd6kU1wV8Nuvik5UEkS7JZmFlVKSdMoqf2H5Gr0rMibSP01dI2VTCe
         FWtReOOqQP3oKQetJ3UBIpkcmWN9S9K9fREo5G/Fzgbs3KPkT8T8k2Lmxcodz/axvMhY
         /bmiS395w0OzHbBJ/o9fa1oMa5zvKGzRYp1audR4sZJItMEpkmc3QqZKI5ZfaMGJooVm
         rbGygxXZ7Y8NGY+hid7+uI+ymxSMo62giRhuR4uAa27X3SyJPRaxDcnIn5ZfuUoHBvMM
         P0NA==
X-Gm-Message-State: AFuF++kobQI2hCpH0ULYt2jJFPYuByDyvylG57EJz7qqP146H+D3FcBb
	4tnNDpg9kz5k6XP2BcD2WgR9i1Kd58lcapJAPW/JlxfldnNeoA58Y6jhx8+ABRnnlCjWY1xHTn3
	gUhNR
X-Gm-Gg: AYBFou2vRPbWsblDvJSVl82QcmPvx/YqoEq/TWbuWorV7AQS7Nb4h5X4rmpXASg61Wd
	i4JFGG23jfU30hiT6lxAsMyQXfdSdY6qXgwlOPGax55KC2AKzZLJmpxkfUgwzC/pdEuH3ZcRbyF
	/v5G6e9F+Ka40K1RJ8Cwl48hooiduNp8QPuA9Rl8p1C2ex1FaebgpAaZY0A95N1Rb2lgeChe402
	myBb/iB4lwYqs8sGwUv62sNCICQLzwrGUvGdh68UUsx2+AiQDlHyYpcvlPmgzGDNuxLyaN6VlD8
	he6dYKDmdUxm0HXxwGC+deYw/XG40VkN7AGYywlGUMWOiekCU4sn0aaW2L5Vv/atG0tQ+jOXVDn
	lnJIZjjXYU8bQNfwnOhCWKBu5LTxUJsHmY87UAg2EvDlrHVGHFb+INTyACUj6RmmPFb9EZ8O/BU
	IF+K5uq+83FB+GhI8/54nPdzB6jm+LcwaVY3qN2PgBcqoa0luDtJtWJIeS3EfQ4Y62KSqH+J8o7
	CiTyzCveg4a5qIDufi2EXnUA4TeoK9IQpxU7E/jzyoHpvILHz4HiqMiMfGOFR+PCDWs1oQHnKIU
	t1ss2qRlRFUUnKghO49MfBVo
X-Received: by 2002:a05:600c:4e53:b0:49e:715e:ec1f with SMTP id 5b1f17b1804b1-49fc5757378mr145652805e9.30.1789993346968;
        Mon, 21 Sep 2026 05:22:26 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc58a1176sm208150005e9.2.2026.09.21.05.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 05:22:26 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-tzdata: Upgrade 2026.3 -> 2026.4
Date: Mon, 21 Sep 2026 15:22:20 +0300
Message-ID: <20260921122224.4185627-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Sep 2026 12:22:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130162

Upgrade to release 2026.4:

- Canada's Northwest Territories moved to permanent -06 on
  2026-08-21.
- Obsolescent settings like TZ="EST5EDT" now conform better to
  POSIX.
- Fix security, performance and porting bugs in zic and localtime.

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-tzdata_2026.3.bb => python3-tzdata_2026.4.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tzdata_2026.3.bb => python3-tzdata_2026.4.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-tzdata_2026.3.bb b/meta-python/recipes-devtools/python/python3-tzdata_2026.4.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-tzdata_2026.3.bb
rename to meta-python/recipes-devtools/python/python3-tzdata_2026.4.bb
index 0216d4f0b9..9bd29afa61 100644
--- a/meta-python/recipes-devtools/python/python3-tzdata_2026.3.bb
+++ b/meta-python/recipes-devtools/python/python3-tzdata_2026.4.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=804220b73c90950be376e7ff7b2066bb \
                     file://licenses/LICENSE_APACHE;md5=86d3f3a95c324c9479bd8986968f4327 \
                     "
 
-SRC_URI[sha256sum] = "4a1518b8993086a7982523e071643f3c0e5f213e75b21318e78bcabfff9d1415"
+SRC_URI[sha256sum] = "f1b8bd365d8d210c55353f4d7f8d6d8561c0ba50d704b700d195a9424bba0d79"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-- 
2.47.3


