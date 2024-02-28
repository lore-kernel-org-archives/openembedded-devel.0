Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC8AEC5478C
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 19:14:37 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web10.5791.1709147670597326539
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Feb 2024 11:14:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Y5ddltNj;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a4429c556efso25914166b.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 28 Feb 2024 11:14:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709147669; x=1709752469; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lQ08OvSJi/SPtljsUFbRnMPwO8hdXyNfX0OgoJtuSzU=;
        b=Y5ddltNjtyY5zJYDsbukM3xmxYuFo7HHu+quowM54eLrgvm62gSXToHxaCifCIBnqr
         gL80XmaJemTRqfLhHl/QlwrkDQ3lE2U+w/Yyu+DB61uQ/syl/WyuiRN/aSMN2FOdW4M5
         3hSoAjKgsMtFjlDxYo8Rti+sHevIopv6H7/URley6xPBR2k8EKuRuHa0O6JQyvs0EzMx
         XPikQ4FawCubwCT9hUyJq3v2Q0bPN772QTuycfV2X9meG6xKH67a7EdfPqnRnzVPoBUR
         0BQ5SFi76rbyAw8J09KvASQILy/0VxH0NuJT30PJvu4HyQvGcW8jmNvKW5ePAZ71rt47
         uang==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709147669; x=1709752469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lQ08OvSJi/SPtljsUFbRnMPwO8hdXyNfX0OgoJtuSzU=;
        b=N05zfqyodur4UlxlYeBWAnLG5c12miZQ/W6wave9Cf89VnrY7cZJ403WjgUIUkFUoH
         eM+gr+7k4cSOHqQfhLM1o0xUtcpR0yxQZC760bpGE7utt6jp7IJLvnTbqw8cQ/0z7Ht0
         waHF0QrqkgIk4ArQFu5Ap+pjCacJLGe55B1ilAjEyqvDQor01S1pyu509fDnUx3xtogE
         yrgLuYGDBUW+nqeu5vTirXZCMrJrh4TpxsyCbQ0oKIsf5tlUhLPn0b02ty4M9THEVJKI
         g8CI9iMXZrTcdE9Y2QdAmIgtYMAdS9N9Y9WaEAenHgbP3bYrNATEaGYCi/pDP9KXmZHA
         85Zg==
X-Gm-Message-State: AOJu0Yyi7cb4dFYEZLO0+CpZxECJK1RucA9gwdUbA5BHfp37g2jcsTlw
	Xl0KqbndLZVIXz5lap2yTrE80ohr+Mo+pQ3FLcHgiGbTMgO35nvjpdCzctzM
X-Google-Smtp-Source: AGHT+IHXx3+pQpGF9VW0TF3HO5pleawtOH0P7p9ck8t9TL23jorNo2rE12wQYwOBYvOfOQnFhU1Lwg==
X-Received: by 2002:a17:906:c291:b0:a43:b30c:299f with SMTP id r17-20020a170906c29100b00a43b30c299fmr392334ejz.52.1709147668795;
        Wed, 28 Feb 2024 11:14:28 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id u24-20020a170906409800b00a3cfd838f32sm2173554ejj.178.2024.02.28.11.14.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Feb 2024 11:14:28 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-xfce][PATCH 2/2] xfce4-notifyd: use python3native and depend on python3-packaging-native
Date: Wed, 28 Feb 2024 20:14:19 +0100
Message-ID: <20240228191419.87199-2-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240228191419.87199-1-martin.jansa@gmail.com>
References: <20240228191419.87199-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 28 Feb 2024 19:14:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109057

* it uses gdbus-codegen from glib-2.0-native which depended
  on python3-distutils-native until
  https://lists.openembedded.org/g/openembedded-core/message/196136
  but distutils on host was enforced by sanity check only until mickledore with:
  https://git.openembedded.org/openembedded-core/commit/?id=8e3a5b0709384f2b455a82ac1e8e212686fe4456

  so on hosts without distutils this was already failing
  and the glib-2.0-native change only changes the dependency from
  distutils to packaging which results in:
  https://errors.yoctoproject.org/Errors/Details/754995/

gdbus-codegen \
	--interface-prefix org.xfce.Notifyd.Log \
	--c-namespace Xfce \
	--generate-c-code xfce-notify-log-gbus \
	--glib-max-allowed 2.68 \
	../../xfce4-notifyd-0.8.2/common/xfce-notify-log-dbus.xml
Traceback (most recent call last):
  File "TOPDIR/build/tmp/work/riscv64-yoe-linux/xfce4-notifyd/0.8.2/recipe-sysroot-native/usr/bin/gdbus-codegen", line 53, in <module>
    from codegen import codegen_main
  File "TOPDIR/build/tmp/work/riscv64-yoe-linux/xfce4-notifyd/0.8.2/recipe-sysroot-native/usr/share/glib-2.0/codegen/codegen_main.py", line 29, in <module>
    from . import dbustypes
  File "TOPDIR/build/tmp/work/riscv64-yoe-linux/xfce4-notifyd/0.8.2/recipe-sysroot-native/usr/share/glib-2.0/codegen/dbustypes.py", line 22, in <module>
    from . import utils
  File "TOPDIR/build/tmp/work/riscv64-yoe-linux/xfce4-notifyd/0.8.2/recipe-sysroot-native/usr/share/glib-2.0/codegen/utils.py", line 22, in <module>
    import packaging.version
ModuleNotFoundError: No module named 'packaging'

* packaging probably isn't as wide spread on host distros as old
  distutils was, so make sure it's available by using
  python3-native with python3-packaging-native from OE build

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.8.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.8.2.bb b/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.8.2.bb
index 7dbd90c188..96cfd32f7b 100644
--- a/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.8.2.bb
+++ b/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.8.2.bb
@@ -10,9 +10,11 @@ DEPENDS = " \
     libxfce4ui \
     xfconf \
     xfce4-panel \
+    python3-packaging-native \
 "
 
 inherit xfce-app
+inherit python3native
 
 SRC_URI:append = " file://xfce4-notifyd-get-var-abs-path.patch"
 
-- 
2.44.0


