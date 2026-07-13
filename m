Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89834C43458
	for <webhook@archiver.kernel.org>; Mon, 13 Jul 2026 00:34:55 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1061.1783902891866499612
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Jul 2026 17:34:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=URBqdNZ3;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cc61541f8cso41534895ad.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 Jul 2026 17:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783902891; x=1784507691; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fcypNSb0+KWghmBYG6+aaX4Frq8Y/QcSqREO8OHwH2M=;
        b=URBqdNZ3vNxcG/+qDonQiaYf/t0cU8Rdiz5402rG4vhDe7H0QaXBuFqAFXftMLtKcE
         TYLiCEarSybYvYRXUfT5mD8PN338ETEs3ak9QQYxfTvrK2nfzY5gjfovnvhxmN8qKnKz
         SYeHdduNGUwiUrRw94IYBbW4KmrTI15AceDGfXW+pJYKGRUwCoSMu3ujUS3CLq9lqd/E
         oYbVNPfMuulZWx0OkjVpmH2KdZZyOYn/eWnYe/5QdadkeDm35scbGLgqLJ5nzZkkam3G
         2stH0dlwYO3fdpzZN1mFlfuGM41TOmPNVBuaNCG4PN5VNOFqiHmpJ1HhAb2ssiFV3diG
         UNEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783902891; x=1784507691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fcypNSb0+KWghmBYG6+aaX4Frq8Y/QcSqREO8OHwH2M=;
        b=DKwKi5K3goNOJGmglxCUpT+aV9LD1I95hfJh6pfYXo2113hBB/vK374NGa+j2uVlMm
         uTiEdJCA1k65kA90LJCt668bX5qSD4dWpr3jrqLbynmlDZoyML9PFoycp1y6zUyvsiWU
         +NqG8wPmy759e9X1DrWfzkEHmoyg2ft8JnTZXtnXz+/xo7I3aygUSI9h83ba4su1aC+v
         QJ3AL+emYw7r3qu+Lwl+kpUudh5BpgNVN4jBB+r3LXAy1QvSWGEYsOSYMZ9o2mAdKLBL
         wFHS+53KLB5Tu8KwOz6aOxW6siDQkjSWCS1lgVElgN0gE2BTGtr9MmUhZchQPQFGOdsP
         3q2g==
X-Gm-Message-State: AOJu0YxeC3tKrXLHNlPv3JxAm3FFeo5pDwvpsEg0yCUplUT/hZ6LxFK6
	+8UbDl84MmSibKl3/yIqcdpOx8MF82k4UK1Huds0B1cOW4jPizV6fV96oyxTdAZ2Yeo=
X-Gm-Gg: AfdE7ck0jdScVjQk4huhSwnmr+0ARhVc3QqVx2GyzwTRvJIjmpECobV2KIkv+zTc2D8
	xU4MeyevFFGJsqQspgMWUbIN2Dyy9U/3UNCMpVbcYn2/JFT0N/4DTCJXtJH2Hr2KkL6Ock2QBrG
	i5fMAwDjzOKfEV3Qck7giTCO9ApDJCpGqx0baeRN35rqC2zpEizhoz4JEObXwufGUhTom62/TvM
	rssJy2teXgLRdfD1vBHDZoH6Kfe1+cdcffF19dBoZhG1velzuMJVqKmpBfwahamhuaosbHcWYBb
	opjjiEPDV74WPgwEc/QLQfThTQlzeEj6EIKwSjubkPUJE2RoySHw4cVYeoSEOUmvhdjlNBzZBhS
	GiHV3XcWDDbvzFX/xKwf1U6VSRExPnmjhvt4rSunFu5doowY0LsaB2k3ucXwm41MUXjFmGDES4E
	QrkfkL7xtHji+K/nQAbhj+7BJXJBQB8rhNRta/EcPqt6JfJYPDb0w5CUdYvTb6eeyhljMiQFFS2
	duYaZJteGckKFG+VBC6xlkDA3DZ9Y3yFc+Orttpe27NmKW1rZL7ZDVI5CdErhSMU1mXZbpOaeXO
	zgLliaU7hZ8WhQhlPBk/4vZ7d6nIzQ==
X-Received: by 2002:a17:90b:2487:b0:38d:cfdc:d286 with SMTP id 98e67ed59e1d1-38dcfdcd333mr3880593a91.8.1783902891090;
        Sun, 12 Jul 2026 17:34:51 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3117d847e17sm63316678eec.18.2026.07.12.17.34.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 17:34:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-webserver][PATCH 2/2] meta-webserver: Depend upon networking layer
Date: Sun, 12 Jul 2026 17:34:46 -0700
Message-ID: <20260713003446.710143-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260713003446.710143-1-khem.raj@oss.qualcomm.com>
References: <20260713003446.710143-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Jul 2026 00:34:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128142

Cockpit needs networkmanager from networking layer
Fixes

stdio: ERROR: Nothing RPROVIDES 'networkmanager' (but /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-webserver/recipes-webadmin/cockpit/cockpit_352.bb RDEPENDS on or otherwise requires it)
stdio: ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-webserver/conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-webserver/conf/layer.conf b/meta-webserver/conf/layer.conf
index 0c48efc465..b1fd9e4bd6 100644
--- a/meta-webserver/conf/layer.conf
+++ b/meta-webserver/conf/layer.conf
@@ -15,7 +15,7 @@ BBFILE_PRIORITY_webserver = "5"
 # cause compatibility issues with other layers
 LAYERVERSION_webserver = "1"

-LAYERDEPENDS_webserver = "core openembedded-layer"
+LAYERDEPENDS_webserver = "core openembedded-layer networking-layer"

 LAYERSERIES_COMPAT_webserver = "whinlatter wrynose"


