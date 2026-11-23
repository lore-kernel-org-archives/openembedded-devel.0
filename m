Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.53966.1795440986098628732
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Nov 2026 05:36:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=OWjF3Oac;
 spf=pass (domain: konsulko.com, ip: 209.85.221.46, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso2960952f8f.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 05:36:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1795440984; x=1796045784; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D/LMQdZCQV2/O7BBOyNJLY+1TYIQ8TJyzP2rw374/FE=;
        b=OWjF3Oacx81DjeLg6Dk3VXJMZ/wFsWA9YUwizBmjCjEzkk9WgAhYhy5BdyKmW8XTWQ
         QBVT62EedvFgxQcxnoyqFQxtmFq1fWUdLi4dekZ/aygjkeHusJ7+fbIyM93YBJfWxLqQ
         9ixUQYurW35288PI+UsSlX/YZj2KsyCBa7ocU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795440984; x=1796045784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D/LMQdZCQV2/O7BBOyNJLY+1TYIQ8TJyzP2rw374/FE=;
        b=kiAw1llK1KQZeKGzbMirp4cnIwujpSzww12nxJM/LLrRkA065Sr3G+jsWlh55WqiVh
         mwykFDZCsdjk6uh9TBGmM2CiUW6786kye9q/Ry8+xeX6CD7IZygQDwl3le6pKYOrnLpp
         jSl+lFJHoQVa6NgTFaWXeiKvU8hSHEg+g/4yxmqKrLqBF5Wlh/8djrt1Q8z1BZNeFuda
         zxAjxjFR8d+o81pygfXVuaKz0zP5fspZHzQ0UE8va6H3ob5MbeFJNQFzRyDhfYhh+IWx
         TgAF28s8qJar/m0qZotEliN6CQKbH9vCvMYdPlyCZ6lXwCH387GQ6zk/TyREojdwLbN9
         04kA==
X-Gm-Message-State: APuU4Z+0KYKEWA7OuK46yuUbHac/HgXx0HxRGDY40P47AHkn4B7EzUAo
	6X3MIBVKBPSEVlyffPJ821tUpLyUFp7ip3Y/9pknEbAsH1y8y2ZWOK3ilHbN6HMNmvRyFZQBiBq
	hRDjp
X-Gm-Gg: AZFdTZf+bE7rKwaxUjRUH0Nqm2DqP8E78XwIXOE1LkQvSOnB22wEg3RLs0NNLncd+3i
	B8Mi120pjr8gUr3vW8t1ePW6I79cUTtaNLwsjBHBzmb99FMvXVrOzpqGMfdlB2fwLULyD2dfzvE
	U21C0FIF24V+2mzCI5cOvPSWY7v65Koln3WHNogOdkU8LCeP1+N4ABSWluSJuwdTytnzOlNjxFZ
	FnfUyoMc1pHSmvGbesVh8xGax3GpJbrCS87XW2ma6aws6ZyV7zngZ8zCZf1aLpkONUlXa0Ogscj
	32zmHlFPVjk7uMy2PHcmnL7bTDnvk+qmLz6sJdqcAKmYLtQAiKf7aV5cmvA6FaBzpAb1D/J1dZm
	tss7nNcIKcjRnl+yiV3czunkcvAmcvSwiSNPOlG14tDePvVWPmdDSNjKj76AbGs9bbKIZ+HphfL
	UhgYbEikjnND0j1Rml2JJt1Rmm37W1kYd3T2zkdsorA+jAfLL76K2IoaF3dl8o9Hsx6oZ6A0jsk
	FNfaA3oVQ4XBLB7VTqzgx/pOiN6nkv6QF9sDYOGok2nPR1pUbyqGaaZTI9LsjPMeBHJt1DQ+K0f
	ui9cHwYBqBtQl63z8qrV0hZ1bQRie8WRCwhJZHvrfr55WVZJGUtatLPzwN2xVO3pqv8SuUAYb6q
	OWeOw268bbHw4/oxbpbDtD10Kfr0hKhsLGl4qPBPq8Fv/BXeWP9m32A==
X-Received: by 2002:a05:6000:4541:b0:48e:6264:c373 with SMTP id ffacd0b85a97d-4abb400bd81mr13807211f8f.14.1795440984492;
        Mon, 23 Nov 2026 05:36:24 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fe75sm25192365f8f.24.2026.11.23.05.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:36:24 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 6/6] python3-xlsxwriter: Upgrade 3.3.3 -> 3.3.4
Date: Mon, 23 Nov 2026 15:36:17 +0200
Message-ID: <20261123133617.3614096-6-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123133617.3614096-1-leon.anavi@konsulko.com>
References: <20261123133617.3614096-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 13:36:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132894
Content-Type: text/plain; charset="utf-8"

Upgrade to release 3.3.4:

- Added support for custom ribbon UI XML files via the
  :func:`add_custom_ui` method.
- Fixed issue where datetimes on 1900-02-28 with a time after
  midnight were written as 1900-02-29.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-xlsxwriter_3.3.3.bb => python3-xlsxwriter_3.3.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-xlsxwriter_3.3.3.bb => python3-xlsxwriter_3.3.4.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-xlsxwriter_3.3.3.bb b/meta-python/recipes-devtools/python/python3-xlsxwriter_3.3.4.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-xlsxwriter_3.3.3.bb
rename to meta-python/recipes-devtools/python/python3-xlsxwriter_3.3.4.bb
index e74a08501c..a6895e15b6 100644
--- a/meta-python/recipes-devtools/python/python3-xlsxwriter_3.3.3.bb
+++ b/meta-python/recipes-devtools/python/python3-xlsxwriter_3.3.4.bb
@@ -15,6 +15,6 @@ RDEPENDS:${PN} += " \
 	python3-io \
 "
 
-SRC_URI[sha256sum] = "ad3743bd5f96019ee75aae19a51e9c26faf03f218670b934dac1159692d0d5e3"
+SRC_URI[sha256sum] = "3512f4210622d4040e0f2882e2caf7263a3fd8be876704304314f0e275377fea"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.47.3

