Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web09.9388.1609946262459948626
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Jan 2021 07:17:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tlEp++R7;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id cw27so4715071edb.5
        for <openembedded-devel@lists.openembedded.org>; Wed, 06 Jan 2021 07:17:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=BbrnUMemhlHRP69+woFIZ4W2S7c/sX1Mpw/2GLFZIwU=;
        b=tlEp++R7FOJbupVA5lNZPM8KwmFYbQqfgC2bQD3UDMY+c3cBDN+UZRdLC0RH1+6B16
         SB20MTsiC0Rp4yqgmuy07rinK5rMn8fglTICAwsH6pykQ6BkGjchUCo63SsWb0J4U7ta
         Rv9A1IF04eFty0ozUyHPh0f08JCGPQAK8Z8mz4xVf0MImD1xGuDS+8pc0+R+h4uy8waN
         HCa6RFXiwIgp+edL2fdyjFNU8mfg8iSkiCtoSXKc5qcUyTvhUXtF1GJL3pm2KLw5G/cV
         qsRKkx5yt121vld/n62r2ksLDLLFajJicEbJ+ui1UQ32c3Sx9X+SthgZxOnxdVop+cpo
         jd/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BbrnUMemhlHRP69+woFIZ4W2S7c/sX1Mpw/2GLFZIwU=;
        b=LDAgCS2Ia5I7EFrGch+35cLwmCAtC/gONHfzNib+dARc1+2hd4J9DGPUYqgxsd8iLu
         IpSQRi0ytI126RkPHz/571k2+501bUg9+0rxPNH6MVgxBGwFzuOsP6XAveC9FLAcu97g
         Cy8y00hybL/S6Z/20bNrn4v6ElgZkZNq0yy9yFWMfr0shoAlwNSRZmLBw+3ha1L84SZn
         QHpfqV8j+js4UZohf2oDrsUYMoQ9azMro9Ix8BiTrCuFpovF6J6uv37RVp3TH+663wjg
         c4tj/3ToWLKVOjmDwxZ7N+cCxaULqLI80cH12MKoAglhZW/8Ols5qSAHla0VdZh9dA1H
         SJgg==
X-Gm-Message-State: AOAM532PpcFfrlkFn3wMb6oxe6KOxomwhdb1VQxx1LK+5R9cw4MeBWiq
	nwqb7D2tPr9E+vUSqaWY6dZHshW68uTrVA==
X-Google-Smtp-Source: ABdhPJxZ1wXJnjkB8coakMzVRgtMPP/3euk+LxQ46BaU1hkHwk33xggR+CDijOhOR3bA3AUsWBEwSw==
X-Received: by 2002:aa7:d297:: with SMTP id w23mr4290832edq.374.1609946261050;
        Wed, 06 Jan 2021 07:17:41 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f47431850a04677ec24921a.dip0.t-ipconnect.de. [2003:f0:7f47:4318:50a0:4677:ec24:921a])
        by smtp.gmail.com with ESMTPSA id lc18sm1366899ejb.77.2021.01.06.07.17.40
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jan 2021 07:17:40 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 10/28] xfce4-session: upgrade 4.14.2 -> 4.16.0
Date: Wed,  6 Jan 2021 16:16:59 +0100
Message-Id: <20210106151717.1779543-10-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210106151717.1779543-1-schnitzeltony@gmail.com>
References: <20210106151717.1779543-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes for 4.16.0
========================
- settings: Accept all types of GIcon
- settings: Adjust inline toolbar
- Fix compilation with -Wmissing-prototypes
- Don't warn when there are no saved sessions
- bump glib (and gio, gthread, etc) minimum to 2.50.0
- Remove GSourceFunc casts
- Update .gitignore
- Add README.md to EXTRA_DIST
- Translation Updates:
  Basque, Chinese (China), Czech, Danish, Estonian, French, Galician,
  Hebrew, Hindi, Indonesian, Italian, Lithuanian, Norwegian Bokmål,
  Portuguese, Portuguese (Brazil), Russian, Serbian, Slovenian,
  Turkish, Vietnamese

Release notes for 4.15.1
========================
[Please note that this is a development release.]
- Fix potential crash in suspend and shutdown (Fixes #65)
- Avoid potential format-string vulns (Issue #65)
- settings: Tweak 'Current Session' tab
- settings: Make 'App Autostart' columns sortable
- settings: Fix 'Current session' column width (!10)
- Add lock icon, 24px and 32px icons
- Add more guards around GErrors
- Update copyright year
- Fix ifdef
- Add README.md
- Translation Updates:
  Armenian (Armenia), Basque, Belarusian (Tarask), Chinese (China),
  Czech, Danish, Eastern Armenian, Estonian, French, Hebrew, Hungarian,
  Indonesian, Norwegian Bokmål, Portuguese (Brazil), Russian, Slovak,
  Slovenian, Swedish, Turkish, Uyghur

Release notes for 4.15.0
========================
[Please note that this is a development release.]

- Use new icon in settings dialog (Bug #16885)
- Add new application icon and rDNS icon name
- logout-dialog: Add new icons
- logout-dialog: Bump icon size to 48px
- Switch to symbolic window-close icons
- Drop GDM compatibility code to avoid invalid session locale
- Segfault when suspending without pm-suspend installed (Bug #16632)
- Expand field codes
- Add a GnuPG 2.1+ mode
- Fix session crash at logout (Bug #16105)
- Free the intermediate "cmd" variable in xfsm_startup_init()
- Re-add xfsm_startup_shutdown() call to xfce4-session main()
- Remove sys/sysctl.h on linux platform
- Move from exo-csource to xdt-csource (Bug #16717)
- Try xfce screensaver before cinnamon (Bug #16223)
- Add support for xfce4-screensaver (Bug #16522)
- Silence runtime warning (Bug #15731)
- settings: Don't warn when there are no saved sessions (Fixes #62)
- settings: Add sort-on-click to columns in "Current Session" tab (!3)
- settings: Add keywords for discoverability (Bug #10694)
- settings: Add tooltips to image-buttons
- settings: Better app icon lookup
- settings: Be more precise in infobar wording
- settings: Drop inline-toolbar button labels
- settings: Move autostart info to docs.xfce
- settings: Don't make 'saved sessions' tab reorderable
- settings: Sort saved sessions by most recently used (Bug #15338)
- Add basic GitLab pipeline
- Drop unused var
- Bump copyright years
- Only clean generated sources when in maintainer mode
- Do not show translation info on --help output
- Translation Updates:
  Albanian, Arabic, Armenian (Armenia), Basque, Belarusian, Belarusian
  (Tarask), Bengali, Bulgarian, Catalan, Chinese (China), Chinese (Hong
  Kong), Chinese (Taiwan), Croatian, Czech, Danish, Dutch, Eastern
  Armenian, English (Australia), English (Canada), English (United
  Kingdom), Estonian, Finnish, French, Galician, German, Greek, Hebrew,
  Hungarian, Icelandic, Indonesian, Interlingue, Italian, Japanese,
  Kazakh, Korean, Lithuanian, Malay, Norwegian Bokmål, Norwegian
  Nynorsk, Occitan (post 1500), Polish, Portuguese, Portuguese
  (Brazil), Romanian, Russian, Serbian, Slovak, Slovenian,
  Spanish, Swedish, Thai, Turkish, Uighur, Ukrainian, Vietnamese

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{xfce4-session_4.14.2.bb => xfce4-session_4.16.0.bb}   | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)
 rename meta-xfce/recipes-xfce/xfce4-session/{xfce4-session_4.14.2.bb => xfce4-session_4.16.0.bb} (80%)

diff --git a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.14.2.bb b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.16.0.bb
similarity index 80%
rename from meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.14.2.bb
rename to meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.16.0.bb
index f497b7666..36b5bc2d0 100644
--- a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.14.2.bb
+++ b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.16.0.bb
@@ -12,11 +12,8 @@ REQUIRED_DISTRO_FEATURES = "x11"
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'polkit', d)}"
 PACKAGECONFIG[polkit] = "--enable-polkit, --disable-polkit, polkit"
 
-SRC_URI += " \
-    file://0001-configure.in-hard-code-path-to-iceauth.patch \
-"
-SRC_URI[md5sum] = "5ad23062fd08ef5f5ad9b4389c7b54c6"
-SRC_URI[sha256sum] = "fbe3a4a60c91589a2024ce12b2d2667625a8fedcbc90ef031831f56319f597af"
+SRC_URI += "file://0001-configure.in-hard-code-path-to-iceauth.patch"
+SRC_URI[sha256sum] = "22f273f212481d71e0b5618c62710cd85f69aea74f5ea5c0093f7918b07d17b7"
 
 ALTERNATIVE_${PN} = "x-session-manager"
 ALTERNATIVE_TARGET[x-session-manager] = "${bindir}/xfce4-session"
-- 
2.26.2

