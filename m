Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.421.1617833922087810404
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Apr 2021 15:18:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iqIo5Ja9;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id a4so2619556wrr.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Apr 2021 15:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=dPMnYDYkGdeEqqB+39ob4aW4GRO5S3ooN5QMuZzNmHM=;
        b=iqIo5Ja9gTYnILEDL2+UV1AuEVHqivM/tTqzv3vlorDOBLpftMbQ2nH4nOG10Ez15F
         yzB7pG3kVhC0kdQ2bLtJvThUfPJwUcQ7DOvYAvW6zH2nCaKQWxKYu77TwLzYkVjXx4qM
         5kzIRsiG+2/sIdDcOMyOe3nVYr8KdM50DCGbAimsxzNk6qOi2NPVf4DcwsAPZOCQS8tY
         MeqovcRMZL76h0LwmyiU78RfK1OiCRHP+4F2JFhboOgHK7qR+E09SomaVTMTNy+yxOdf
         NUG5F/UriIwsmbI+K/ku+7/qHe29Q3FDPTn5YRxSIbEwBmLJR7xUYuYqAOlYvJyYBOdZ
         1DAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dPMnYDYkGdeEqqB+39ob4aW4GRO5S3ooN5QMuZzNmHM=;
        b=KibP37wPfQT2gTazLVyszu9NZ4Wt3/PsSdWBrwfGP0ZNrahshs09V3DSNCBGTJcq17
         cLGVVBN4g/r+NV1j/3Zar6Con709kRLG605k/EZQaeg9yeIks0qwqNBvK6jJucO446s6
         Xucd+P3ft1klApU+AEo3DjAsEQcznEtg7RQU/dLaJesPxzk7IJvaVdnQsDCFDpy62lxz
         0pbMBc4CpM3QIIpZC292mzQkBTh4OFOBGxlrbCAY00hgT4sDfAejTDZ9ORW/0oh025LG
         njaa+Hg9K4PnOmGY4raCY4lsHFebFXO6gqmRqDuSBdxU2fIiu+OM+vR7DFF0b4GJ6yt+
         XAtA==
X-Gm-Message-State: AOAM532xmXkpwa/e2pG3nbvicQOqfu7UWdx9KEdvprm+QkB3oQiYO3lu
	laPVuCcdKJQfNesvavo+EZpgrJ2lo68=
X-Google-Smtp-Source: ABdhPJzBjpd/kQ+LHEfc1n3Pjgd631uIM8eLLwJ1jEtXiadkCWT4buAFbZVWAwq4Pjv379PX7V72Cw==
X-Received: by 2002:adf:d218:: with SMTP id j24mr6761655wrh.297.1617833920767;
        Wed, 07 Apr 2021 15:18:40 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f1192521410777e3304dd72.dip0.t-ipconnect.de. [2003:f0:7f11:9252:1410:777e:3304:dd72])
        by smtp.gmail.com with ESMTPSA id e9sm27462434wrv.92.2021.04.07.15.18.40
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 15:18:40 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 3/6] gigolo: upgrade 0.5.1 -> 0.5.2
Date: Thu,  8 Apr 2021 00:18:26 +0200
Message-Id: <20210407221829.606871-4-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210407221829.606871-1-schnitzeltony@gmail.com>
References: <20210407221829.606871-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes for 0.5.2
=======================
A bugfix and translation update, a new icon, various cleanups.. thanks
to all contributors !

======
- Update TODO
- Refresh Glade file, drop unused tab labels (fixes #13)
- move the logic setting GtkSpin port value to setup_for_type() (#11)
- Use new icon in window titlebar
- Fix compilation warnings
- autoconf: Some updates
- Only show an error dialog if the host field is visible/required
- Remove capitalization from icon name
- Update GenericName (#2)
- Fix comment style.
- Remove GSourceFunc casts
- Update Makefile.am
- Add gigolo.ui to POTFILES.in (Issue #6)
- Added new icons following new style and reverse DNS format.
- Add new README.md and update AM_INIT_AUTOMAKE
- Add basic GitLab pipeline
- Bug #16717: Move from exo-csource to xdt-csource
- Translation Updates

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-apps/gigolo/{gigolo_0.5.1.bb => gigolo_0.5.2.bb}   | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-xfce/recipes-apps/gigolo/{gigolo_0.5.1.bb => gigolo_0.5.2.bb} (67%)

diff --git a/meta-xfce/recipes-apps/gigolo/gigolo_0.5.1.bb b/meta-xfce/recipes-apps/gigolo/gigolo_0.5.2.bb
similarity index 67%
rename from meta-xfce/recipes-apps/gigolo/gigolo_0.5.1.bb
rename to meta-xfce/recipes-apps/gigolo/gigolo_0.5.2.bb
index 1233fe069..517f1f4c5 100644
--- a/meta-xfce/recipes-apps/gigolo/gigolo_0.5.1.bb
+++ b/meta-xfce/recipes-apps/gigolo/gigolo_0.5.2.bb
@@ -7,5 +7,4 @@ DEPENDS = "gtk+3 intltool-native xfce4-dev-tools-native"
 
 inherit xfce-app
 
-SRC_URI[md5sum] = "94e89ad3fabba7167760004b64062f4a"
-SRC_URI[sha256sum] = "ca87badb5871e4844579704704ea9e5ede444f710a3b264c12b60b2a0e48e14e"
+SRC_URI[sha256sum] = "e34a1aa0755f9f6c234c7d24b23a6cecd6ef50741d79da3bb6f698a2281dbbc3"
-- 
2.26.2

