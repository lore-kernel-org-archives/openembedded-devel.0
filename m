Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web09.25509.1613351617486288577
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Feb 2021 17:13:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KeyCmSGK;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id q20so3220208pfu.8
        for <openembedded-devel@lists.openembedded.org>; Sun, 14 Feb 2021 17:13:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=+MBxw71y3kJUiMK261qHT3emsaAL7Kv4QwWVQb1eeqo=;
        b=KeyCmSGK+pc7aI9qYpN29wsf4tRCZAYAV0398t+FicFtPMsiToKEH0M5EZaoWCAdT5
         3Jsj7cuRRHA209svmPfGKRd69pb+QqevRGwUCeEhHabGZnbjf6cnhpNW6nvDQyF3kycq
         b9qCDGgmWtbWnIBO1boI0qbTrn5wrdlu9LdlRjV/CUEXx1A493DJsnGU48GY7rTtcWKZ
         e/oPELAc96v1WBkslbspGHtUotixSx25yaIvINtebD+xoUsFx/okmjRHewCyBpWp+GiC
         HNsaG6mbYrQ/EBEh9rgsJlIepEDd/HFygZZsT1wZwsVwDPcfNzgDEqwOXRPqVnW1u8HD
         ptzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=+MBxw71y3kJUiMK261qHT3emsaAL7Kv4QwWVQb1eeqo=;
        b=iEeeF7HeqvY8MiYRs0rZOw4tpLuuGIC7TxJG4gZhHGBstxFwIp4l9ufx0TsOQ2KYGw
         HvaIBDZ/ymn/rCn/rQJyx87rhkmo9S6rbm4/tJdrlw8D6KnjOPWkAuceYAgjR7K5/HYt
         jIf8OoHwhWfL+dBJnim7JwHiyoDMyw0CSPBZaiPK28CqeI3tf7vmyuktBJlI3x1Sgr5A
         be70J0+YWKIsQPTuhc4uXLfdJUYt+gZmOGImFzEF1m0vEL+34V5rWqy2yw/mV6GE76RQ
         iTcrKlE8h30s8n70jlD2NJaPYOaZfKZqttIW/xXCDzoOAlTAHUthfj0gSKrrPvh3lKnx
         jAlA==
X-Gm-Message-State: AOAM530HiMd3KCUKiRLX4FGcdYBjOH6zjy49o/nw0b7A4T5Asu3Egned
	KPGBRRbrDh5o42fyjFNzf/mI9e275vpg8A==
X-Google-Smtp-Source: ABdhPJzbfSg6mpIDYTm5OanXVWh3yASSOXbHaW2EzoPfkGvd3cLjVnjajsa6mCFEFswLjosAqP2V7Q==
X-Received: by 2002:aa7:8d8e:0:b029:1d1:f9c9:cff6 with SMTP id i14-20020aa78d8e0000b02901d1f9c9cff6mr13417927pfr.31.1613351616925;
        Sun, 14 Feb 2021 17:13:36 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:c8b8:7fc5:a225:bb8d])
        by smtp.gmail.com with ESMTPSA id t1sm16077998pfl.194.2021.02.14.17.13.36
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Feb 2021 17:13:36 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [gatesgarth 02/15] lua: update to 5.3.6
Date: Sun, 14 Feb 2021 17:13:16 -0800
Message-Id: <25c29224f4d8f731378fc27ca12b32af4125ecc9.1613349480.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1613349480.git.akuster808@gmail.com>
References: <cover.1613349480.git.akuster808@gmail.com>

From: Armin Kuster <akuster@mvista.com>

LIC_FILES_CHKSUM changed to do year updates

This is the last 5.3.x update. This will give us the best
starting point for doing Maintence moving forward.

Its a bug fix only update. See http://www.lua.org/work/diffs-lua-5.3.5-lua-5.3.6.html

Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 25d8d65eb537b949aa42d1388fecbc22ba059b33)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-devtools/lua/{lua_5.3.5.bb => lua_5.3.6.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-devtools/lua/{lua_5.3.5.bb => lua_5.3.6.bb} (92%)

diff --git a/meta-oe/recipes-devtools/lua/lua_5.3.5.bb b/meta-oe/recipes-devtools/lua/lua_5.3.6.bb
similarity index 92%
rename from meta-oe/recipes-devtools/lua/lua_5.3.5.bb
rename to meta-oe/recipes-devtools/lua/lua_5.3.6.bb
index 7d84ea60b6..342ed1b547 100644
--- a/meta-oe/recipes-devtools/lua/lua_5.3.5.bb
+++ b/meta-oe/recipes-devtools/lua/lua_5.3.6.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Lua is a powerful light-weight programming language designed \
 for extending applications."
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://doc/readme.html;beginline=318;endline=352;md5=60aa5cfdbd40086501778d9b6ebf29ee"
+LIC_FILES_CHKSUM = "file://doc/readme.html;beginline=318;endline=352;md5=f43d8ee6bc4df18ef8b276439cc4a153"
 HOMEPAGE = "http://www.lua.org/"
 
 SRC_URI = "http://www.lua.org/ftp/lua-${PV}.tar.gz;name=tarballsrc \
@@ -20,8 +20,8 @@ SRC_URI += "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', \
             file://run-ptest \
            ', '', d)}"
 
-SRC_URI[tarballsrc.md5sum] = "4f4b4f323fd3514a68e0ab3da8ce3455"
-SRC_URI[tarballsrc.sha256sum] = "0c2eed3f960446e1a3e4b9a1ca2f3ff893b6ce41942cf54d5dd59ab4b3b058ac"
+SRC_URI[tarballsrc.md5sum] = "83f23dbd5230140a3770d5f54076948d"
+SRC_URI[tarballsrc.sha256sum] = "fc5fd69bb8736323f026672b1b7235da613d7177e72558893a0bdcd320466d60"
 SRC_URI[tarballtest.md5sum] = "b14fe3748c1cb2d74e3acd1943629ba3"
 SRC_URI[tarballtest.sha256sum] = "b80771238271c72565e5a1183292ef31bd7166414cd0d43a8eb79845fa7f599f"
 
-- 
2.17.1

