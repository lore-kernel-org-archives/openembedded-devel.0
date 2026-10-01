Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE83ECA5FCB
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 03:03:46 +0000 (UTC)
Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3377.1790823819733748045
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Sep 2026 20:03:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=b9AYh+Kr;
 spf=pass (domain: gmail.com, ip: 74.125.228.42, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc4cacd3409so3597789a12.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2026 20:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790823819; x=1791428619; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yxcLCqtMrP9GAtxLM7ExgChq4KVhbjV3DzoCieS94Xw=;
        b=b9AYh+KrwAb6m5ukIatoPc6/he289dsI9kuTgZJ9222p0m2kxq4T+VCyEMhUZ3oCqz
         JHpaq1lc2ozZyfzpxn8J3njhJxe7NGczP/d0U3rIxk0FY9JSV9/6Qd3YmrM3ssoMQs92
         RSgXcADm/jRiEi4SozTE6AIcP0pRDwXsFaUcOS7iWZnKPVYf9xbwMwokqtolLQ+UCGkY
         Uzbsp7eIE6LmwZ955StAR8SZRkMx4GomnEcxgUirRFWfNBuLLHPm+RTWbyrum1THB1J0
         WlYvDFyLbRC7ulL1VjSeYzrIQSmLOPPJuEJIUC0f3WVdq1EwZJ/FdsMfnCOP8V+pAGBX
         og2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790823819; x=1791428619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yxcLCqtMrP9GAtxLM7ExgChq4KVhbjV3DzoCieS94Xw=;
        b=e9+TPWImb8/CLwyKZWlgR5EGQ73VTTHxLSAlHfs9YNZkMSk0LnALBUz6SlrGCSxt1D
         HB1zYNWrYvQge0LdQQub0UEZYGv//uCysj0oZfB/PuTV36ueOqSgD3L4aCY7r6BbGYCa
         Df9Ehg064Img4Bv/GbtIcTE2NGBmo6vpNnUUI7J/5i43alvQfwfkfcfzLBtcql8BZeD5
         p71Yr474iPO+8scVBukcdxxi1EejTIkS9tANcySqheNgT92gznBvFfoK6snFIxBjsLFM
         2krh8Q0+thI3B18+8ucxKgd0yBf0fpRlmA1xj57c2sGygL2l9XQuHPXS2Rgl4vf0EfPY
         AmgQ==
X-Gm-Message-State: AFuF++lvwSTZzOyx02a1lFGi2yE5dZ0MfFJsQg2XkYWpTwcJa/IemOqi
	Wy11Gihexjb22BzuaSDGBjXcBt60PdssJTt9EWLC0f6fruir5a/ADV/ZPnM70g==
X-Gm-Gg: AYBFou1gCJZ4GizqGz9t+edGtSMawFJ4JfwbW+YeOfmTbYIBa6MH5bAAUIEESJa9vpn
	tR5jWJZeAnZRNNmAdUlb+fsCLgdOArQIW4t4j8XL6SwNE3qvQfuxBPkQcujelpXCVR/6Pkisrak
	3lRP2DWsC7K9I3vgSlp5gLZKE5KWitNMO1+N3ZDfhoI3m+uXC217/jEoASrYKotfFv0xUCC5Gx5
	P4HZHVuvB9BJqKlMSoqIxdTiGyESTyhGGM7qxt8VXrQaktgL4hlAht4QWlcJfPsZRRIVBSbNyrc
	NwpMaPClC1WEIGrgv8I8pQT/qSS3jymGAdQ1JPgOyy0monPp9j/wl8YYpNcFrXfB19+WSrxNVbQ
	sAoxyLaW2o4bpPDe/LgwRoWbLtJq4Saf1HMdT07zPsUg2Re/4fHBEzMRzah+97Vq/4YPyv4YanV
	szFNjnH36o+xNL4X/H74OLYkS80pgPyA9Pav9OBMKMVxoASvZJuOH7DMf+csco96QoMl8TIuOxr
	Vl6ttCKL9CTpLHuesrHH6I=
X-Received: by 2002:a05:6a21:6012:b0:3de:55f9:86f with SMTP id adf61e73a8af0-3de9eb744a0mr3319395637.73.1790823818969;
        Wed, 30 Sep 2026 20:03:38 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88819db440csm357042b3a.60.2026.09.30.20.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 20:03:38 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-gnome][PATCH 2/17] glycin: upgrade 2.2.0 -> 2.2.1
Date: Thu,  1 Oct 2026 16:03:14 +1300
Message-ID: <20261001030331.1581021-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001030331.1581021-1-ankur.tyagi85@gmail.com>
References: <20261001030331.1581021-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Oct 2026 03:03:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130551

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://gitlab.gnome.org/GNOME/glycin/-/blob/2.2.1/NEWS?ref_type=tags

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-gnome/glycin/{glycin_2.2.0.bb => glycin_2.2.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/glycin/{glycin_2.2.0.bb => glycin_2.2.1.bb} (98%)

diff --git a/meta-gnome/recipes-gnome/glycin/glycin_2.2.0.bb b/meta-gnome/recipes-gnome/glycin/glycin_2.2.1.bb
similarity index 98%
rename from meta-gnome/recipes-gnome/glycin/glycin_2.2.0.bb
rename to meta-gnome/recipes-gnome/glycin/glycin_2.2.1.bb
index 69d1566fe2..279124200f 100644
--- a/meta-gnome/recipes-gnome/glycin/glycin_2.2.0.bb
+++ b/meta-gnome/recipes-gnome/glycin/glycin_2.2.1.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://LICENSE-MPL-2.0;md5=f75d2927d3c1ed2414ef72048f5ad640
 inherit cargo_common cargo-update-recipe-crates meson pkgconfig gettext gobject-introspection
 
 SRC_URI = "git://gitlab.gnome.org/GNOME/glycin.git;protocol=https;branch=main;tag=${PV}"
-SRCREV = "a5c2d58d6ae0bd7233f6705781b17dd083ebde73"
+SRCREV = "6b7226d495755772bcd4bcfb5c8051a446e625ef"
 
 UPSTREAM_CHECK_URI = "https://gitlab.gnome.org/GNOME/glycin/-/tags"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"

