Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.8195.1588332953259890014
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 May 2020 04:35:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MzBwIpKJ;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id e16so6095232wra.7
        for <openembedded-devel@lists.openembedded.org>; Fri, 01 May 2020 04:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=BrarXjJE32aR/ESPHwu+zkrqym9RmoXhhjftylejM7A=;
        b=MzBwIpKJfgBWb27+in9gXWi4PpWQ/nwvCaVAKbWouEQ+AACODuzz3lY5lw85EZrXrN
         EwSSyXDAY38nLpLYmkAfkayCekcI6BkIn4fDSk41c/XfklTX023pobAlPb6qbVFQ1OeE
         bdLSEqNv1KYJKGGtdPpidZDznso2PjUH82MH1KAjvR/vfxP47bjKeO8/NL8VNH2niFmD
         heHPxzojJO3Tnlwm6BKoIqoUg9MSxvlqriNhkR/sH42OWMy+Vcw8hEhVhyDXcq4MjZsx
         6aZNZUbdO8dNEkg9WWhKCcLwnOzaUi7QD3+pv9ZeISl82dq9zdH8+0XOmwj+O/w7QjZV
         KFZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BrarXjJE32aR/ESPHwu+zkrqym9RmoXhhjftylejM7A=;
        b=WcfCWZ9g9tdo4ks9d3rLLt66/Ap9sssxX1kM2j7pRKo2Va9rAYohSfgrS/Nq8Kj7CB
         WE4x4w5BX/lLJLetJSzWiDR+vEewMCLGOVVrJYMSoS1UaNUIfbnr0PlbCN0FokSQdhgS
         c7/rdRJLZn8PBrgbfPhm2Dwc1rUtXN5STcLXl2mhbpLv+Sl6Cfyx2U/JeSmBXtpVVVW8
         +2hfWxOvtcssbUiVE2TabKprSPDe9knU5mXkvE3cBw8zNiyJfLtb23A2c5yApiztZw4L
         Xh2nToIyGygbBdnDYnWPKhx2JuDECqf/YZAwpDapyJ65vkHpzPTFu7vQKQPLy0b+gkSx
         dMwg==
X-Gm-Message-State: AGi0PuZOjT9PYay6gRYDZglCfZPYPVMzQShd/aJuImeFduqo5MrjRsv9
	2NvzoFNNe/RK3x36SOqMuPEo/g2V
X-Google-Smtp-Source: APiQypJ954mSracf0mmk1vE99l1tMmo6a/uboRe5Aq6UFIBtOpTgNaVRuKkBRKyImH2Zfp4VgkCgIw==
X-Received: by 2002:a5d:67cb:: with SMTP id n11mr3600384wrw.215.1588332950529;
        Fri, 01 May 2020 04:35:50 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300F07F0ED437E74431DA4B53FAAD.dip0.t-ipconnect.de. [2003:f0:7f0e:d437:e744:31da:4b53:faad])
        by smtp.gmail.com with ESMTPSA id q10sm3960004wrv.95.2020.05.01.04.35.49
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2020 04:35:49 -0700 (PDT)
From: "Andreas M?ller" <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 03/10] gjs: 1.58.6 -> 1.58.7
Date: Fri,  1 May 2020 13:35:26 +0200
Message-Id: <20200501113534.16030-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200501113534.16030-1-schnitzeltony@gmail.com>
References: <20200501113534.16030-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Version 1.58.7
--------------

- Various backports:
  * Don't crash if a callback doesn't return an expected array of values [Marco
    Trevisan]
  * GList of int not correctly demarshalled on 64-bit big-endian [Philip
    Chimento, Simon McVittie]
  * Crash passing integer to strv in constructor [Evan Welsh]
  * Ignore format-nonliteral warning [Marco Trevisan]

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/recipes-gnome/gjs/{gjs_1.58.6.bb => gjs_1.58.7.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gjs/{gjs_1.58.6.bb => gjs_1.58.7.bb} (87%)

diff --git a/meta-gnome/recipes-gnome/gjs/gjs_1.58.6.bb b/meta-gnome/recipes-gnome/gjs/gjs_1.58.7.bb
similarity index 87%
rename from meta-gnome/recipes-gnome/gjs/gjs_1.58.6.bb
rename to meta-gnome/recipes-gnome/gjs/gjs_1.58.7.bb
index dbe935537..58342b6c2 100644
--- a/meta-gnome/recipes-gnome/gjs/gjs_1.58.6.bb
+++ b/meta-gnome/recipes-gnome/gjs/gjs_1.58.7.bb
@@ -11,8 +11,8 @@ DEPENDS = "mozjs gtk+3"
 
 inherit gnomebase gsettings gobject-introspection vala gettext features_check upstream-version-is-even
 
-SRC_URI[archive.md5sum] = "7f671b3fc3b149adce263495540e7f50"
-SRC_URI[archive.sha256sum] = "1864bf22f4f5e4107832b4c54127cce8509d37ccc14abd25a6878c7ffed96640"
+SRC_URI[archive.md5sum] = "c8c530d4593133f496ae69098273a675"
+SRC_URI[archive.sha256sum] = "2014509019ea4e7a8ab8e0dd0c472bbcf0ad3067928af88c29f5e2879c58c7a9"
 SRC_URI += "file://0001-Disable-tests-on-host.patch"
 
 # gobject-introspection is mandatory and cannot be configured
-- 
2.21.1

