Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web09.21200.1610905620826751193
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Jan 2021 09:47:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nLufSdrZ;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id m6so8814721pfm.6
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 Jan 2021 09:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=QPFwbw6eJBixAOlAKShSPLuL74XioFFXjgyVnzNeU38=;
        b=nLufSdrZarnQ2Y9EkARxX03uBoF5r42py5u3xJr1EXKfTOyIUFVq8doUwb8j1GRtaC
         r7lnly9PR8pNBX1gSp06U9VItqxk9qvqsWrUgu3GoM2fAjmex8mWv7DRqqgiPM38kRvX
         AeTdq244OFPkOKhqR5v9TFyfaPRnlcLsZrrCwgkFXIraMMRuEssuTDDQt80bEei46EJ4
         Sd3yIIpLYQzZVocAdd1HBvKHDPnwr2w6nVdvPpYT/aq7U6Vvnf2K7XAc3n0jyZQo8Q2K
         B0b3gpQGv/RpWIZTL9blWcSKj6iXCNUM1Nj3BjunC2gyUrv51MIwV18UQCmiBbrbUtjZ
         iLtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=QPFwbw6eJBixAOlAKShSPLuL74XioFFXjgyVnzNeU38=;
        b=Kw8p1iP+HqaIrgXnf7+Zpxnpig6Gx0+nWr/XBLEHknkZgThW5n2iKoncW1A9TF54FS
         awh2Ezpxi1/11eaKw8yxL+zKvsfvPl+iLBKH0dBFbrtz98wHxkFQc6dtvWRJncenWRF0
         Rha2vgmTWKraYKGLgX4G0RgWJhsiQ6dvBdjdZaz0kvH/Q79tER7KCoj0AS6SIUPakgB3
         MryHpLmH3EanKYHfNr8qnu5/ccH2Dhxx+EwAsdFziT7q5E2Spr7b/pyUqDCe0Hp13TaK
         BlA78VIjxO1OYH845GAT9Q89lYsSLCsbhKsPyQkmsdKSIFmXse7o0SoB+TVHlbWZWYKb
         Il6w==
X-Gm-Message-State: AOAM533CWB4i4szhCXpjFeWCIDfslXTtYb8j9CFS2ONBv4aLcd5DIjvX
	6VoNniIdABwWEbnWdYZSNUzjI2GVhm6UoQ==
X-Google-Smtp-Source: ABdhPJwsL/QZLDWs2ix+wk6PEQAcTKxRkXfg82PcZDcj/bS6fHwLTT/lK499QQZG8bMHWiLPmUlOtA==
X-Received: by 2002:a63:ce42:: with SMTP id r2mr22720901pgi.8.1610905620313;
        Sun, 17 Jan 2021 09:47:00 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:ed67:500f:ea8f:e947])
        by smtp.gmail.com with ESMTPSA id bk18sm10427870pjb.41.2021.01.17.09.46.59
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 09:47:00 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 28/28] geoclue: select avahi-daemon if nmea enabled
Date: Sun, 17 Jan 2021 09:46:26 -0800
Message-Id: <b208c536f43d45d43094644466f1074b303ee3a1.1610905441.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1610905441.git.akuster808@gmail.com>
References: <cover.1610905441.git.akuster808@gmail.com>

From: Chenxi Mao <maochenxi@eswin.com>

geoclue serivce rely on avahi-daemon, so enable it by default.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 9239584e717bb2093c9bfd6972bb2f01507ab859)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-navigation/geoclue/geoclue_2.5.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-navigation/geoclue/geoclue_2.5.3.bb b/meta-oe/recipes-navigation/geoclue/geoclue_2.5.3.bb
index b46445a2ba..e57e7a7209 100644
--- a/meta-oe/recipes-navigation/geoclue/geoclue_2.5.3.bb
+++ b/meta-oe/recipes-navigation/geoclue/geoclue_2.5.3.bb
@@ -31,7 +31,7 @@ PACKAGECONFIG ??= "3g modem-gps cdma nmea lib"
 PACKAGECONFIG[3g] = "-D3g-source=true,-D3g-source=false,modemmanager"
 PACKAGECONFIG[modem-gps] = "-Dmodem-gps-source=true,-Dmodem-gps-source=false,modemmanager"
 PACKAGECONFIG[cdma] = "-Dcdma-source=true,-Dcdma-source=false,modemmanager"
-PACKAGECONFIG[nmea] = "-Dnmea-source=true,-Dnmea-source=false,avahi"
+PACKAGECONFIG[nmea] = "-Dnmea-source=true,-Dnmea-source=false,avahi,avahi-daemon"
 PACKAGECONFIG[lib] = "-Dlibgeoclue=true,-Dlibgeoclue=false,gobject-introspection"
 
 GTKDOC_MESON_OPTION = "gtk-doc"
-- 
2.17.1

