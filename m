Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27EB4C3527D
	for <webhook@archiver.kernel.org>; Tue, 12 Apr 2022 23:50:14 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web09.2383.1649801004731684274
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Apr 2022 15:03:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IIXBfQWV;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id bg24so51785pjb.1
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Apr 2022 15:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cOPo+ROBoqWsyySGavO3Z/N5qqtfqTgyC4Bi1By+Gl4=;
        b=IIXBfQWVlSvi3G2g9t44P33cF5vtZuKtKy9Z8FH41zI6fAz1NKpaBHTa7XgIFznD5Y
         ihMOiMUz2Xbv2U9GkBFznRJY3Dho1Z4ozQ4dRvIbtPNctun8zvjJc6hv3AK/9gaMhB3K
         PFm7oYQhNMVP7Rsyo4exQdyCd295z6YeEw+a3vTMKA1gBz4Cu7fPdSds2R8McZoaM9lc
         lBauSs4oGo03Fs5Gnbhw7+H/1sWfyf3lmiVEQilnIrdkgSxu/UbqHdbRp1ZAEKHmhgSp
         mGTfKPJaQwH/mJDaNbNBnxIZj4TUBk7kz4eqQ99yL11UrjTvOTD8bU/2ChS83r3NmKCD
         MfnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cOPo+ROBoqWsyySGavO3Z/N5qqtfqTgyC4Bi1By+Gl4=;
        b=TJz1iD0WrLV5Zb+9Hq9ZxsainiAUJ50jFLCWHrqMfRGDr/ecpTIVozhdH3IDxf9m2J
         8aNcy2FTp16qT0bPvEK6iz7WQ1xoi/O2YcQHIEMfJ7PG3C66UdxrTNaBOfcdKPNJdOxR
         33fFOVjnKn2W/RAQGqbKqitcIZbQw/mNJ70EALuEP58W8fFHI0RrVyjBpp/ZmlPpFzDv
         K94M5xF+QWZYLi2X1GkeZigpZcuO3yEpaJmJAWbtG5nILhjt2raayEUouF/HiV1ttvP4
         G6kOcPE1IYIsNdDgIq2qjTz3/+WEz503sJlcKBB9kbcujvJ7dAecnjDGtnydtp3MU1JZ
         DnQg==
X-Gm-Message-State: AOAM533SeuwnaV7iI0ix1Kjj5cFAXFvhRzbAKBfR/464fYgB3tGG6YMF
	RUCNedrikgHiTTBxGVtaVT1tbVYYRytIZQ==
X-Google-Smtp-Source: 
 ABdhPJyRAhbDiIYwrMoPtKXWtd3sBGM/zzXRiU3xBDZrHwd+u53URy82dNGMka1umpkFWmfuR8/C5w==
X-Received: by 2002:a17:903:185:b0:158:7255:4bf1 with SMTP id
 z5-20020a170903018500b0015872554bf1mr9741806plg.102.1649801004003;
        Tue, 12 Apr 2022 15:03:24 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::94ca])
        by smtp.gmail.com with ESMTPSA id
 v8-20020a17090a7c0800b001cb63a477eesm502881pjf.12.2022.04.12.15.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 15:03:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 6/7] tvheadend: Update to latest trunk
Date: Tue, 12 Apr 2022 15:03:15 -0700
Message-Id: <20220412220316.3876985-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220412220316.3876985-1-raj.khem@gmail.com>
References: <20220412220316.3876985-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 Apr 2022 23:50:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96599

Forward port 64bit time_t patch
Disable warnings as errors

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../tvheadend/0001-adjust-for-64bit-time_t.patch          | 8 ++++----
 meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb    | 5 ++++-
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/meta-multimedia/recipes-dvb/tvheadend/tvheadend/0001-adjust-for-64bit-time_t.patch b/meta-multimedia/recipes-dvb/tvheadend/tvheadend/0001-adjust-for-64bit-time_t.patch
index 59bd4ef08f..ff2e789e32 100644
--- a/meta-multimedia/recipes-dvb/tvheadend/tvheadend/0001-adjust-for-64bit-time_t.patch
+++ b/meta-multimedia/recipes-dvb/tvheadend/tvheadend/0001-adjust-for-64bit-time_t.patch
@@ -146,12 +146,12 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
    /* Failed */
 --- a/src/epggrab/module/opentv.c
 +++ b/src/epggrab/module/opentv.c
-@@ -486,7 +486,7 @@ opentv_parse_event_section_one
+@@ -497,7 +497,7 @@ opentv_parse_event_section_one
                                         1, &save, &changes);
        tvhdebug(LS_OPENTV, "find by time start %"PRItime_t " stop "
-                "%"PRItime_t " eid %d = %p",
--               ev.start, ev.stop, ev.eid, ebc);
-+               (intmax_t)ev.start, (intmax_t)ev.stop, ev.eid, ebc);
+                "%"PRItime_t " ch %"PRId64" eid %d = %p",
+-               ev.start, ev.stop, ch->ch_number, ev.eid, ebc);
++               (intmax_t)ev.start, (intmax_t)ev.stop, ch->ch_number, ev.eid, ebc);
        save |= epg_broadcast_set_dvb_eid(ebc, ev.eid, &changes);
      } else {
        ebc = epg_broadcast_find_by_eid(ch, ev.eid);
diff --git a/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb b/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
index c278cf5994..b3d9d6bf7d 100644
--- a/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
+++ b/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://github.com/tvheadend/tvheadend.git;branch=master;protocol=https
            file://0001-adjust-for-64bit-time_t.patch \
            "
 
-SRCREV = "ce09077056f9c6558c188d135cec3be85cc9c200"
+SRCREV = "9a51cea492e4a5579ca3ddf9233fecfa419de078"
 PV = "4.3+git${SRCPV}"
 PKGV = "4.3+git${GITPKGV}"
 
@@ -26,5 +26,8 @@ EXTRA_OECONF += "--arch=${TARGET_ARCH} \
                  --disable-dvbscan \
                  "
 
+EXTRA_OECONF:append:libc-musl = " --disable-execinfo"
+
+EXTRA_OEMAKE = "CFLAGS_NO_WERROR=yes"
 CLEANBROKEN = "1"
 
-- 
2.35.1


