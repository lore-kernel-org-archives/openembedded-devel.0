Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F28A7EF06EC
	for <webhook@archiver.kernel.org>; Sun,  8 Feb 2026 14:51:59 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26684.1770562312164496358
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Feb 2026 06:51:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ib7stnVJ;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47ee0291921so19994735e9.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 08 Feb 2026 06:51:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770562310; x=1771167110; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KuKUJPclAKjbPWNFfwuILkCXGfa2SX/b3USTtprkyS8=;
        b=ib7stnVJ/jwQTvWXqw9vzsU8mL6X4tWD7RBhuMKVYRI5XmOXKsAFpRwXRZR9GDm2Lo
         iGJ0iHsIcmVa4ePKYqo7vmwIZ4Wm1mbmtsj1bYmG/YJay7Cn6eF0joS0iW60vVVV2SG3
         d88DJmyfou0dwzusMe6zkKlBtxo53tDW0AQXEE5uiqMyh00hlvTdnKbC+lY8ECvmToPe
         fN7TCgLje3V+kfMHpR8vzIM4LcHKniIvJhOt+nKLiOuQF5kVutXkSzYPwj8wtRa5ymre
         JJsK9j4dzfbNWP1gZjm0Z+BjYK19wkLNuBplZ/brIQgTRsXkMyYi26Dbth0mjyBzHPh4
         osUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770562310; x=1771167110;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KuKUJPclAKjbPWNFfwuILkCXGfa2SX/b3USTtprkyS8=;
        b=Bk+zWLguBPzMxpX2JYM17Jo/mtlKx/su9n3Z6F1sqPDpzd0AqQ2LroASzmaP7c7lSv
         wnWHw+8jXQA41LwfzjtWG5P2sQ8h0bUxdHjvoPX3r32E8r98bcJhuonLRK6astrgLH7c
         6vtwybHwlTkBEZhD5sCGzQPh0wQF43aD1bEH/Rw1g6uvv29SexoUCsoujhz1kIHlwFZV
         va9cCYYWm/zaiR1h8HrNw6Pk8kFAq7hhNGjA6+kkiziWwFx+mEPm7rCa8CtCd8jBy06c
         24VaiIpZGC9LjJaf8j3LnjhzltYwk402yO6Pfc8pW62K/lFUzhm7Tj0L6LzaDUlpbWT5
         eMGg==
X-Gm-Message-State: AOJu0YzORbPzbeNTfrVbuQVAj7gRtlBY/iFy1IHHtjRdo69RHetMv0Em
	Jw9cFruI67hvQpr9rs4RCFbLcVwsFx2sWA16QulwH32Kx24GLZ1HJB+B3IOOmQ==
X-Gm-Gg: AZuq6aLg+/9X0q1ZumvrnQFnMrjJDEv1QYvFykuHL/WPmJDvKuV8fDIP+zJJxrCwNjU
	9Etzwe1BtcME1oDQC5/Wl/WdFcgPKxL07oMMo4CiRrNRqcOwtlfVa6Pgok76QboqIO+sOwogL7E
	7h8f3Rnrun4D6pw4lNo1UbAmZIrMAL63eylNh3Wmf6PYws6d9x4up+QT3LmexkUhRTIfmbrlkiv
	CC5KeOPvBtei8g0K0JrqVS9Outl++2pjzEWiJ/VUIReChHXYokNrEUjwv0GDbf1jkOuHLshjsPV
	95SLE9kRPt1xI09xSprwdlAw6XS0iZm/YfIo4TAunFPO3FNxxDGzRjgtVvUmcVIqXxxaZZQIMqG
	pW2MhJBn5GDI2OHfpx9puHyE+pntyzm9zP8IFv4erJGQaP14qQZs5AcTZk8otv14cSzqbTYVefL
	lp2+OBam/a
X-Received: by 2002:a05:600c:3553:b0:477:7b16:5f77 with SMTP id 5b1f17b1804b1-483201da2d6mr110348725e9.3.1770562310403;
        Sun, 08 Feb 2026 06:51:50 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48317d2ba61sm402354155e9.1.2026.02.08.06.51.48
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 06:51:49 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][scarthgap][PATCH 05/10] nautilus: upgrade 45.1 -> 45.2.1
Date: Sun,  8 Feb 2026 15:51:38 +0100
Message-ID: <20260208145143.20464-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260208145143.20464-1-skandigraun@gmail.com>
References: <20260208145143.20464-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Feb 2026 14:51:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124278

Changes:
45.2.1:
* Fix a crash in sidebar code
* Fix build without optional cloudproviders dependency

45.2:
* Bugfixes:
  - Don't crash when reconnecting to remove server
  - Actually detect unmount on some non-native mounts
  - Don't crash on image properties
  - Allow types and sizes in Properties to expand
  - Don't corrupt toast messages
* Translation updates

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../nautilus/{nautilus_45.1.bb => nautilus_45.2.1.bb}      | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/nautilus/{nautilus_45.1.bb => nautilus_45.2.1.bb} (81%)

diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus_45.1.bb b/meta-gnome/recipes-gnome/nautilus/nautilus_45.2.1.bb
similarity index 81%
rename from meta-gnome/recipes-gnome/nautilus/nautilus_45.1.bb
rename to meta-gnome/recipes-gnome/nautilus/nautilus_45.2.1.bb
index 9c0d154ec8..3192d7b704 100644
--- a/meta-gnome/recipes-gnome/nautilus/nautilus_45.1.bb
+++ b/meta-gnome/recipes-gnome/nautilus/nautilus_45.2.1.bb
@@ -22,7 +22,7 @@ DEPENDS = " \
 
 inherit gnomebase gsettings gobject-introspection gi-docgen gettext features_check mime-xdg gtk-icon-cache
 
-SRC_URI[archive.sha256sum] = "23bdaa9a85466c5937a89daddd080ed03bcc2b49e8b64af607206353bde82fe3"
+SRC_URI[archive.sha256sum] = "ba5d53df39a155562df971ef5e31e827074905d0c48eab1eb2421a10284b990d"
 
 REQUIRED_DISTRO_FEATURES = "x11 opengl gobject-introspection-data"
 
@@ -52,3 +52,8 @@ FILES:${PN} += " \
 # mandatory - not checked during configuration:
 # | (org.gnome.Nautilus:863): GLib-GIO-ERROR **: 21:03:52.326: Settings schema 'org.freedesktop.Tracker.Miner.Files' is not installed
 RDEPENDS:${PN} += "tracker-miners bubblewrap"
+
+# This override is from gnomebase.bbclass. The original expects only a minor
+# version in the version number, and it breaks if there is a patch version also.
+def gnome_verdir(v):
+    return v.split(".")[0] or v

