Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web09.25070.1609683190144551293
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 03 Jan 2021 06:13:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VpLQOegY;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id h16so24503245edt.7
        for <openembedded-devel@lists.openembedded.org>; Sun, 03 Jan 2021 06:13:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=qlIfQryTvzpP2obKchXrniAc2GMGPP8mAbJWkha2MNU=;
        b=VpLQOegYzhyeiQMx7Dc6ob5saHcFwC50JMcu2dUseCqRXuXSqnaqD2gRnkxCxTiIc9
         e4GuSDj7DQtv4fKVboDAu1sqmgVvLTIUFe5+nVIOQVxN2HD04ZajMeIl6FbsClW1e+ZB
         ns217GJKGi/pd/KamJ5Qivz4SYvizo5a9/wtoNywKu6BaD6v2E/6mu5USPu9Psm5GR9N
         6A7nfEGUBMQQQOxmQ0KWgDXn4suDeNFepmdjzn2uYHryMbWww0wxu7N7PRbkrWDugrTn
         f2jpQYn+8724ZcE4BMSlOFxkLijH1UZUoPsyD7NGD8t/7PVnQ+aPCqt5DOC3BpX5+5rD
         V/cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qlIfQryTvzpP2obKchXrniAc2GMGPP8mAbJWkha2MNU=;
        b=NoDO2GKCFpvSSHC9lFRMIOquSKrch71HGtefHrD9usYpakO4yKhZeRq4Paq5CfqWpm
         Wg0YWhe69t6aq3ep9cKWGjY8mlHl5LJAkvPmUlThyCGYHNRhSwzBtkrhdqn6mVTCYP0h
         CVT68PkTU0hYpLRno004yZ2900F0It90ffngg3zTQ6ZtrTGpwiBeTnGn4Y4dPlpHXc4O
         zCkMkYTxQitrz1xUB4eDSDhooHlikJCPSIvrLQ76Si1wDO8Ndyd+lHA747MJh1iWwRok
         mGstQok2mrCr2axy+HHsBwjEcHwyys9gWIBfvAgtHVXeNkTEkFyBNwOtGnEKP6rXnoWg
         LQ0w==
X-Gm-Message-State: AOAM5321XN7+EhLcoN0RbKjdHBePhh/AGCvqedormBIJO18fOjcmJX+F
	d+4RBzV/SJvXAnINaapoW8s5rAGCTKM=
X-Google-Smtp-Source: ABdhPJxqoAKtwycEjBipAfBN4iDphVIFv7ZebGscHNPntF7zLqsHiuTnFcoh8Dz7yFvpizU/2h+0KA==
X-Received: by 2002:a05:6402:366:: with SMTP id s6mr66247791edw.44.1609683188772;
        Sun, 03 Jan 2021 06:13:08 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f47430798383ab6418f4c8a.dip0.t-ipconnect.de. [2003:f0:7f47:4307:9838:3ab6:418f:4c8a])
        by smtp.gmail.com with ESMTPSA id r16sm42385370edp.43.2021.01.03.06.13.07
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Jan 2021 06:13:08 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH][V2 10/16] xfce4-fsguard-plugin: upgrade 1.1.1 -> 1.1.2
Date: Sun,  3 Jan 2021 15:12:41 +0100
Message-Id: <20210103141247.1637618-11-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210103141247.1637618-1-schnitzeltony@gmail.com>
References: <20210103141247.1637618-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes for 1.1.2
=======================
- Improve spacing in settings dialog (Bug #14665)
- Fix "ISO C90 forbids mixed declarations and code"
- Modernize the configure.ac.in file
- Remove GSourceFunc casts
- Replace obsolete xfce_create_panel_button usage
- Adds new README.md updates AM_INIT_AUTOMAKE
- Add basic GitLab pipeline
- Add gitignore
- Update URLs from goodies.x.o to docs.x.o (Bug #16163)
- Translation Updates:
  Albanian, Belarusian, Bulgarian, Eastern Armenian, English (Canada),
  Estonian, Finnish, Galician, Hebrew, Interlingue, Slovak, Slovenian,
  Spanish, Turkish, Uyghur

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...4-fsguard-plugin_1.1.1.bb => xfce4-fsguard-plugin_1.1.2.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/fsguard/{xfce4-fsguard-plugin_1.1.1.bb => xfce4-fsguard-plugin_1.1.2.bb} (71%)

diff --git a/meta-xfce/recipes-panel-plugins/fsguard/xfce4-fsguard-plugin_1.1.1.bb b/meta-xfce/recipes-panel-plugins/fsguard/xfce4-fsguard-plugin_1.1.2.bb
similarity index 71%
rename from meta-xfce/recipes-panel-plugins/fsguard/xfce4-fsguard-plugin_1.1.1.bb
rename to meta-xfce/recipes-panel-plugins/fsguard/xfce4-fsguard-plugin_1.1.2.bb
index 183d521af..5585a4f0a 100644
--- a/meta-xfce/recipes-panel-plugins/fsguard/xfce4-fsguard-plugin_1.1.1.bb
+++ b/meta-xfce/recipes-panel-plugins/fsguard/xfce4-fsguard-plugin_1.1.2.bb
@@ -5,5 +5,4 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3434d79d62df09abf5f78bb76d6cd21b"
 
 inherit xfce-panel-plugin
 
-SRC_URI[md5sum] = "d1e1fda4e80c36741643b1d9eca5c5c1"
-SRC_URI[sha256sum] = "d6d05d0a90a68453d65cdceec5ca7eeaef864393ab62eef532a7ba58f374d516"
+SRC_URI[sha256sum] = "67d8e6a219a7117c59693adbc59c39a6eba31e3f18a5499189ef4ef28b554105"
-- 
2.26.2

