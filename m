Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web12.1409.1623197729383545455
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Jun 2021 17:15:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KLZZsTAR;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id n12so17883380pgs.13
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Jun 2021 17:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2ZVTneoNVsHsaNC7WxgS5vcthq3vBX+FO3CfhYHpkrc=;
        b=KLZZsTARQq5CwlKF8IEvrM0UoC+pr17bLxv6q3mN6uf5JFPY6XKn3GU5MPFcHnRVSY
         unjCcwMhoa8SlCqnrBn3zZADBoIoa9hRaI0DNDwMDKD7X9yPO3BJ7g+XI4VKwN+DhQiP
         tH6M4gf5OzBG6RHQBAcQh7AjXRp8+sok7jTMSSrves52AGOuhqLWVpff8b5jVezBERdN
         QCFmGwVy1zsxkZ6ONj63dqzfto/wFMKPFslsFwJKlbfxIeUI03NjsYPq4oqZtWBJ0meN
         ArqviBoSaAPtMZG7+YH8/c4zDDwmdgjDSOdIINCjVzT2ZwR2PqB/z2N8j8Uv9M9L7Cx+
         QZ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2ZVTneoNVsHsaNC7WxgS5vcthq3vBX+FO3CfhYHpkrc=;
        b=DAwdCRpHmJIaBZemucYEJIzG106AxaY2SxM/E1A4ZrVXLRc/ZbQDhFls1TyvaoYu8W
         Mam/icpseSMila3espjIRAk9h8n7pTk0LRXq4FKME4lL3jHfiL6aRxFgHVlwn9xmnCxY
         N4AADhE18bCBLXlWroTqtra9heKGPrlAVnT/V7p1AdpFjD/nWA5AaUPaskpw5WamVss0
         w7SurqVfucBVykjc8As2a65H9A7Ch7l30UDW163HqaeBD66ZTps2uDjpP6Z14IQ9gSBx
         31N93+IXjebcztb+OO6OhaQFOPDdKCvba7cxZPawwRfByfMZBPoIO0GddKQ1TKVHxvFv
         pyAw==
X-Gm-Message-State: AOAM533SZ5Fq4tD2XDJvBC50sjznNHcZdWt5WfpPO95W98PXi6w5gpLo
	OpdYgbKiMf6Hk3oxcIRKH9WtwdG0htHdhw==
X-Google-Smtp-Source: ABdhPJy6Ik2NCpZ8ZWh+ixCYDp8x/+7ndGknvpLnckHW8UR6nMOJIrRP398+dGK0oQhNkqLGnINzeg==
X-Received: by 2002:a05:6a00:d44:b029:2ee:12e1:5781 with SMTP id n4-20020a056a000d44b02902ee12e15781mr2525826pfv.75.1623197728418;
        Tue, 08 Jun 2021 17:15:28 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a054])
        by smtp.gmail.com with ESMTPSA id z6sm12429433pfr.99.2021.06.08.17.15.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 17:15:28 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: zangrc <zangrc.fnst@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH v2] tracker-miners: upgrade 3.0.5 -> 3.1.1
Date: Tue,  8 Jun 2021 17:15:25 -0700
Message-Id: <20210609001525.2993968-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: zangrc <zangrc.fnst@fujitsu.com>

Refresh the following patch:
0001-meson.build-Just-warn-if-we-build-without-libseccomp.patch

Enable seccomp if distro feature is on

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...eson.build-Just-warn-if-we-build-without-libseccomp.patch | 4 ++--
 .../{tracker-miners_3.0.5.bb => tracker-miners_3.1.1.bb}     | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)
 rename meta-gnome/recipes-gnome/tracker/{tracker-miners_3.0.5.bb => tracker-miners_3.1.1.bb} (92%)

diff --git a/meta-gnome/recipes-gnome/tracker/tracker-miners/0001-meson.build-Just-warn-if-we-build-without-libseccomp.patch b/meta-gnome/recipes-gnome/tracker/tracker-miners/0001-meson.build-Just-warn-if-we-build-without-libseccomp.patch
index c9eb7994e6..53c5f2664e 100644
--- a/meta-gnome/recipes-gnome/tracker/tracker-miners/0001-meson.build-Just-warn-if-we-build-without-libseccomp.patch
+++ b/meta-gnome/recipes-gnome/tracker/tracker-miners/0001-meson.build-Just-warn-if-we-build-without-libseccomp.patch
@@ -23,8 +23,8 @@ diff --git a/meson.build b/meson.build
 index 71a9df4..1eaa1a0 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -279,7 +279,7 @@ cpu_supports_seccomp = not unsupported_cpus.contains(host_cpu)
- seccomp_required = system_supports_seccomp and cpu_supports_seccomp
+@@ 299,7 +299,7 @@ cpu_supports_seccomp = not unsupported_cpus.contains(host_cpu)
+ seccomp_required = system_supports_seccomp and cpu_supports_seccomp and get_option('seccomp') and get_option('extract')
  
  if not libseccomp.found() and seccomp_required
 -  error('Libseccomp is mandatory for sandboxed metadata extraction')
diff --git a/meta-gnome/recipes-gnome/tracker/tracker-miners_3.0.5.bb b/meta-gnome/recipes-gnome/tracker/tracker-miners_3.1.1.bb
similarity index 92%
rename from meta-gnome/recipes-gnome/tracker/tracker-miners_3.0.5.bb
rename to meta-gnome/recipes-gnome/tracker/tracker-miners_3.1.1.bb
index 6672195e00..15a6faa71e 100644
--- a/meta-gnome/recipes-gnome/tracker/tracker-miners_3.0.5.bb
+++ b/meta-gnome/recipes-gnome/tracker/tracker-miners_3.1.1.bb
@@ -15,7 +15,7 @@ GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase gsettings gobject-introspection vala bash-completion features_check
 
-SRC_URI[archive.sha256sum] = "c9be14871b1398e6e656a354a8f8f59e69e93169017f2b28308ef439324fd12b"
+SRC_URI[archive.sha256sum] = "e4d361351b156f2862a524415fbebf0539c781cd87c6629662f0265b4803b8b8"
 SRC_URI += "file://0001-meson.build-Just-warn-if-we-build-without-libseccomp.patch"
 
 # gobject-introspection is mandatory and cannot be configured
@@ -34,6 +34,7 @@ PACKAGECONFIG ??= " \
     png \
     tiff \
     xml \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'seccomp', d)} \
 "
 
 PACKAGECONFIG[battery]     = "-Dbattery_detection=upower,-Dbattery_detection=none,upower"
@@ -54,7 +55,7 @@ PACKAGECONFIG[networkmanager] = "-Dnetwork_manager=enabled,-Dnetwork_manager=dis
 
 # For security reasons it is strongly recommended to set add meta-security in
 # your layers and 'libseccomp' to PACKAGECONFIG".
-PACKAGECONFIG[libseccomp] = ",,libseccomp"
+PACKAGECONFIG[seccomp] = ",,libseccomp"
 # not yet in meta-gnome
 PACKAGECONFIG[rss]        = "-Dminer_rss=true,-Dminer_rss=false,libgrss"
 
-- 
2.32.0

