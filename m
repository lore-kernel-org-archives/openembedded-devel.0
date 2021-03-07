Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web10.27982.1615156505208495469
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Mar 2021 14:35:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vgSfWpMd;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id ci14so16434921ejc.7
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Mar 2021 14:35:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=WL4RoJMyEQmey9QnhQwlqGU575fuW3e4SFSXRHi8Hy8=;
        b=vgSfWpMdHMdFyc3Jo/VgxcIeTIxJT5PSS7E2PBv0yRAr6KO2KrYIUJDbQA61KvwDhZ
         1FtoX7elBo6LMLm5O0CQQrbT1PTzduJAFoN9FSg6od+ZlsMHRjZWJBkkqRz4pUEhCPYB
         EvrGrvr7hJG/2RMOVjqMVj7pIftfzm+lBWhZ6qQEo8FU04AIwIxZaoLcNCJ40P8637FO
         XEzp2ilqWbDpnt6IXgNUdQx2aLxMDxAPlx0HpVh7HaDOBFBXWRpfrUuPpd32bm9xgzin
         anJz7EDonBeVXTmEdifXhM4nDnWrLPN99QQTcS9iYIt2D5nJ8eUSaenq6YK2AaS0I63L
         qW1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WL4RoJMyEQmey9QnhQwlqGU575fuW3e4SFSXRHi8Hy8=;
        b=fLO3iZ8m7kpMDxpDldWoomGTzU0jh+Dn/pVSPCENc8iOPgfIAroikiJc3oU7HQCXte
         dwBMjtI5B+Wg1b4yrXvjcBONk8zIBC2wHZwre2IWEn7rV+fmBboKCdJ5gP1cXO6UBP+F
         34YY9br5DhgJ58ND82CZmvlSccDLtuYXwMJZXJJaGVR1aKHSqRfxySfaD0jLkTgHDb1N
         5m2hhv6eYWhGnpVzXSxUdmWBZ8MhxdWsbWZ/saKRaGg6tc4kReMO3wVjntxBdWPHtU2G
         8rsBB/s91bzU34HqueAOicQU1tg1SzHqWqUBW1fs+H5B+hYK3o6ZHPK2MXa48avFURg7
         RIpw==
X-Gm-Message-State: AOAM5318yPRCrhKlwgfSgfnFPM+ZZ1wH53aFyhPUIfqkl2JKcktGw1hP
	m8xP0SDpdTn7b4Le4p8LWa6K5L5XtdE=
X-Google-Smtp-Source: ABdhPJwegYd1W6riPsKCoReJyGlVJjlq0nayJYSMQwbbwek3ic/b4HplUXoMadTbGT0O/wtur0ikLQ==
X-Received: by 2002:a17:906:1fd2:: with SMTP id e18mr12680014ejt.49.1615156503855;
        Sun, 07 Mar 2021 14:35:03 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f3c4e6849043cb4c496f775.dip0.t-ipconnect.de. [2003:f0:7f3c:4e68:4904:3cb4:c496:f775])
        by smtp.gmail.com with ESMTPSA id mc2sm5501399ejb.115.2021.03.07.14.35.03
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Mar 2021 14:35:03 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 7/9] xfce4-panel-profiles: 1.0.12 -> 1.0.13
Date: Sun,  7 Mar 2021 23:34:46 +0100
Message-Id: <20210307223448.1063315-7-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210307223448.1063315-1-schnitzeltony@gmail.com>
References: <20210307223448.1063315-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Although not mentioned below and obstacles in the way,
0001-Makefile.in.in-remove-bashisms.patch made it upstream [1].

Release notes for 1.0.13
========================
New Features:
- Add Cupertino layout (#7)
- Add Redmond 7 layout (#8)
- Add Xfce 4.16 layout

General:
- Updated existing templates to support Xfce 4.16
- Makefile.in.in: remove bashisms
- Enabled exporting Whisker menu configuration (#11)

Updated translations

[1] https://gitlab.xfce.org/apps/xfce4-panel-profiles/-/commit/1565fe5f450732a82a76b828610fc935501584d0

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../0001-Makefile.in.in-remove-bashisms.patch | 56 -------------------
 ...0.12.bb => xfce4-panel-profiles_1.0.13.bb} |  3 +-
 2 files changed, 1 insertion(+), 58 deletions(-)
 delete mode 100644 meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles/0001-Makefile.in.in-remove-bashisms.patch
 rename meta-xfce/recipes-apps/xfce4-panel-profiles/{xfce4-panel-profiles_1.0.12.bb => xfce4-panel-profiles_1.0.13.bb} (83%)

diff --git a/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles/0001-Makefile.in.in-remove-bashisms.patch b/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles/0001-Makefile.in.in-remove-bashisms.patch
deleted file mode 100644
index 9738f1a8c..000000000
--- a/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles/0001-Makefile.in.in-remove-bashisms.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-Makefile.in.in: remove bashisms
-
-The brace expansion is bash specific and fails with dash.
-
-Upstream-Status: Pending [No permission to folk repo and create pull request]
-
-https://gitlab.xfce.org/apps/xfce4-panel-profiles
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
----
- Makefile.in.in | 15 ++++++++++++----
- 1 file changed, 11 insertions(+), 4 deletions(-)
-
-diff --git a/Makefile.in.in b/Makefile.in.in
-index 73338f4..e08b218 100644
---- a/Makefile.in.in
-+++ b/Makefile.in.in
-@@ -73,8 +73,11 @@ install: all xfce4-panel-profiles.1
- 
- 	install -d $(DESTDIR)/$(MANDIR)/man1
- 	install xfce4-panel-profiles.1 $(DESTDIR)/$(MANDIR)/man1
--	
--	install -d $(DESTDIR)/$(PREFIX)/share/icons/hicolor/{128x128,48x48,16x16,scalable}/apps
-+
-+	install -d $(DESTDIR)/$(PREFIX)/share/icons/hicolor/128x128/apps
-+	install -d $(DESTDIR)/$(PREFIX)/share/icons/hicolor/48x48/apps
-+	install -d $(DESTDIR)/$(PREFIX)/share/icons/hicolor/16x16/apps
-+	install -d $(DESTDIR)/$(PREFIX)/share/icons/hicolor/scalable/apps
- 	install data/icons/128x128/org.xfce.PanelProfiles.png $(DESTDIR)/$(PREFIX)/share/icons/hicolor/128x128/apps
- 	install data/icons/48x48/org.xfce.PanelProfiles.png $(DESTDIR)/$(PREFIX)/share/icons/hicolor/48x48/apps
- 	install data/icons/16x16/org.xfce.PanelProfiles.png $(DESTDIR)/$(PREFIX)/share/icons/hicolor/16x16/apps
-@@ -86,7 +89,9 @@ uninstall:
- 	rm -rf $(DESTDIR)/$(DOCDIR)
- 	# FIXME: Uninstall locales
- 	rm -f $(DESTDIR)/$(PREFIX)/bin/$(APPNAME)
--	rm -rf $(DESTDIR)/$(PREFIX)/share/icons/hicolor/{128x128,48x48,16x16}/apps/org.xfce.PanelProfiles.png
-+	rm -rf $(DESTDIR)/$(PREFIX)/share/icons/hicolor/128x128/apps
-+	rm -rf $(DESTDIR)/$(PREFIX)/share/icons/hicolor/48x48/apps
-+	rm -rf $(DESTDIR)/$(PREFIX)/share/icons/hicolor/16x16/apps
- 	rm -rf $(DESTDIR)/$(PREFIX)/share/icons/hicolor/scalable/apps/org.xfce.PanelProfiles.svg
- 
- distcheck: all
-@@ -106,7 +112,9 @@ clean:
- 	rm -f bin/$(APPNAME)
- 	rm -f data/metainfo/org.xfce.PanelProfiles.appdata.xml
- 	rm -f data/layouts/*.tar.bz2
--	rm -f data/icons/{128x128,48x48,16x16}/org.xfce.panelprofiles.png
-+	rm -f data/icons/128x128/org.xfce.panelprofiles.png
-+	rm -f data/icons/48x48/org.xfce.panelprofiles.png
-+	rm -f data/icons/16x16/org.xfce.panelprofiles.png
- 	rm -f data/icons/scalable/org.xfce.panelprofiles.svg
- 	rm -f org.xfce.PanelProfiles.desktop
- 	rm -f Makefile.in
--- 
-2.25.1
-
diff --git a/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles_1.0.12.bb b/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles_1.0.13.bb
similarity index 83%
rename from meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles_1.0.12.bb
rename to meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles_1.0.13.bb
index 34162d3cc..bb9e50e1e 100644
--- a/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles_1.0.12.bb
+++ b/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles_1.0.13.bb
@@ -11,9 +11,8 @@ DEPENDS += "intltool-native"
 
 SRC_URI = "http://archive.xfce.org/src/apps/${BPN}/1.0/${BP}.tar.bz2 \
            file://not-create-link-to-locale.patch \
-           file://0001-Makefile.in.in-remove-bashisms.patch \
            "
-SRC_URI[sha256sum] = "246e459d2d2f3f524968440ed7fddb2a891567ebc05f10a800f7f5821b3452a7"
+SRC_URI[sha256sum] = "bc387c13f94109422dc72b0fcb919b0dc11619ba589d03e492252b0d2513b170"
 
 do_configure() {
     # special configure - no autotools...
-- 
2.26.2

