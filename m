Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web10.25317.1609683193897211215
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 03 Jan 2021 06:13:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NhnAc78w;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id x16so33462142ejj.7
        for <openembedded-devel@lists.openembedded.org>; Sun, 03 Jan 2021 06:13:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=UBbZcKRrvFtaEDHRByks5qzmdxv/z4TYJtjy6XhVLUM=;
        b=NhnAc78waP7w2VupE0zeFzjE17H01tJjeok81bzT2coFWYBfxmyutfXUnOysVSZZbT
         7jcOo+rtb2RAs26JzNe1SYHMaLf6W7iXPMvEIl00+WRGF3LsWKfyz8eFDlli8dhaTJcC
         WsTxPt9uzvdOrNPjI8+jHzja4PNf356+gRGhfjh1gywR366JfOuwfMXd5N8/0dHeS3pq
         nXNaEQ335oMOIIujgR1UqH85t+V56cuzEv25kOhW8lhNQygsk94RZpnWlyKePc94d4t6
         BRVhyY/vj5qsgLrJB4tBUB4TkYI7eCnB2F5KgOaH5T6ucJ/raMB/oDY0zKDeD2BIcJAH
         CZGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UBbZcKRrvFtaEDHRByks5qzmdxv/z4TYJtjy6XhVLUM=;
        b=ix9MgyrEhot9RVeFW6lgUQLgjGnI6XDi2Jyk0M9Bf5d0psqJZtlYoNXAmMaAjYoXxd
         tRHDhQNhke6MVRRl79iJAmHtOEw4IiZayFVOeIboT+sBqyQq8sUR8QLuv8rgkScsDSf+
         fZQKyxalP1H2f19QlVTXDU7QqA6XP+NRsPlURCG7hy1uH/RqMYZn7eNFv5LQV+iRm3Ik
         4uDTAaObnUn9lPKvTCyXLCKPup10yyttCfnmwnekE7uhRxQkP2ajSmc1XXF9Qz1sGrER
         AVOAEI6UrZjsXwF+ZMmb4LxF/4deICfPehq2eKS5TPOpiq2qxpzysuzs/vBCqSay0Fm6
         ECGg==
X-Gm-Message-State: AOAM532dINd26nnrnvJLWw0qvQseB6+2LyCEGfD1AdrVoK3DXGdulXlk
	EzQ6S6eiVSzeu8NXPnVCvdHtDwMBnEw=
X-Google-Smtp-Source: ABdhPJzNubKlpPpqTh2eiDSeB7Q1gWmUs9RRNe/Q8IkWS3kJhnPvVF7VzEvOEmUQQ/+Qqzxj1OZC1g==
X-Received: by 2002:a17:906:cf81:: with SMTP id um1mr15316273ejb.122.1609683192555;
        Sun, 03 Jan 2021 06:13:12 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f47430798383ab6418f4c8a.dip0.t-ipconnect.de. [2003:f0:7f47:4307:9838:3ab6:418f:4c8a])
        by smtp.gmail.com with ESMTPSA id r16sm42385370edp.43.2021.01.03.06.13.11
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Jan 2021 06:13:11 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH][V2 14/16] xfce4-wavelan-plugin: upgrade 0.6.1 -> 0.6.2
Date: Sun,  3 Jan 2021 15:12:45 +0100
Message-Id: <20210103141247.1637618-15-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210103141247.1637618-1-schnitzeltony@gmail.com>
References: <20210103141247.1637618-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes for 0.6.2
=======================
- Fix build with panel 4.15
- Fix ISO C90 forbids mixed declarations and code
- Update configure.ac.in syntax and enable debug when building from git
- Create README.md. Update configure.ac.in
- Add basic GitLab pipeline
- Update .gitignore, fix configure scripts
- Update URLs from goodies.x.o to docs.x.o (Bug #16181)
- Make build less verbose
- s/http/https
- Translation Updates:
  Albanian, Armenian (Armenia), Belarusian, Bulgarian, Chinese
  (Taiwan), Eastern Armenian, English (Canada), French, Galician,
  Greek, Hebrew, Hungarian, Polish, Slovak, Slovenian, Spanish,
  Turkish, Uyghur

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...4-wavelan-plugin_0.6.1.bb => xfce4-wavelan-plugin_0.6.2.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/wavelan/{xfce4-wavelan-plugin_0.6.1.bb => xfce4-wavelan-plugin_0.6.2.bb} (66%)

diff --git a/meta-xfce/recipes-panel-plugins/wavelan/xfce4-wavelan-plugin_0.6.1.bb b/meta-xfce/recipes-panel-plugins/wavelan/xfce4-wavelan-plugin_0.6.2.bb
similarity index 66%
rename from meta-xfce/recipes-panel-plugins/wavelan/xfce4-wavelan-plugin_0.6.1.bb
rename to meta-xfce/recipes-panel-plugins/wavelan/xfce4-wavelan-plugin_0.6.2.bb
index 95c1fe4d9..c52b35d02 100644
--- a/meta-xfce/recipes-panel-plugins/wavelan/xfce4-wavelan-plugin_0.6.1.bb
+++ b/meta-xfce/recipes-panel-plugins/wavelan/xfce4-wavelan-plugin_0.6.2.bb
@@ -5,5 +5,4 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e1e5872df9c5cf1a23f16493d9104920"
 
 inherit xfce-panel-plugin
 
-SRC_URI[md5sum] = "e4e3d5240297253d242464e77f6145df"
-SRC_URI[sha256sum] = "f41f81ea063ae3c7d7904e1ee647a6b5efafc7436f47caed662ee417038eed17"
+SRC_URI[sha256sum] = "ea7aa36650c596b1a29567d100776c68ed732aaf0f48c92245c4466058b5481d"
-- 
2.26.2

