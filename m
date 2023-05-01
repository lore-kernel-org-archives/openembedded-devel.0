Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B73A9C77B73
	for <webhook@archiver.kernel.org>; Mon,  1 May 2023 06:05:26 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.87295.1682921124409391439
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Apr 2023 23:05:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=ZUzJXB00;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-24dfaff8794so775602a91.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 30 Apr 2023 23:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682921123; x=1685513123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5nXvrW8kBa8EIJJZDTdsv4cs/fUrERAo3n4sfrbHbqw=;
        b=ZUzJXB00T6frDTOc8jZObRoLydeSCt+wvNagCCEd4dbfskbshhgik2S/+AjDdDwnMO
         aiCGm/8bQGseNORdTJvEc+wJprFaHpK+B2sV2dwIm2fssttEI69k5lRQKvvDvWeAxhG8
         /SHjefwSsfZsTWM+B3CvS4pb5+pg3R6UFU1XNJh2qj5eBi15p8l6FiYjc12gTFdt6Ozs
         kSFHi086sTLQYuhQP8aKf0ufMR5g/PPX0SNVd8DG/hq4zvFd6wsrhi6GDd5e5XDpQwko
         38M8vEUIEgwJmQB+mITzYVIhNLfxbsf8AEQEUK4LwrVYVLM3TREnnTxAz6ZIbsYD6bp8
         OGUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682921123; x=1685513123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5nXvrW8kBa8EIJJZDTdsv4cs/fUrERAo3n4sfrbHbqw=;
        b=BCKeqZ81SUK0NVwEVTn5vEqjUephaRIRZuiT6h9yOnZlTZCOQfLgjOK6AEhi4M4Q37
         /0eAfY00PDYtN1Mg+lRoeuoLrtIEz+Q+fjB50kaO2YrPTWblqu8hm30+RdpQUIkeL7vM
         /IlZlRfF4rdJTPRGJQCC9fhNoKaCtYbUwr3s7ZXooVVgee0JTBiOhF8h+WXOEIAH8fTi
         IVL1YtN1zbQISQ/g+xIoABlVfbo+ADXt3L9Baawa68XM2iCn+QLiUqMX8rtmmqQIz6kT
         htUNA0zGQC3cofroH7cLdwY/h2elcipUPy5/R21hGlNo1jIXrjKgt3kB/Ta04lr2kqiG
         fqGQ==
X-Gm-Message-State: AC+VfDxB/pyYZ9pCcsVXK2fgfib8MwM8jGf7SvzQEiky/aixRxr/aTiQ
	4N1U4MIa98dUft0SQgtxkcHsvjFuo6He4A==
X-Google-Smtp-Source: ACHHUZ6aZKoDRs5bdTCcIysLUJSQ6/B5KYLvxT8gB5f8YkNb6x64LfONqWlKU+LxY6f79NWRtzy99w==
X-Received: by 2002:a17:90b:4acf:b0:246:fc58:d77b with SMTP id mh15-20020a17090b4acf00b00246fc58d77bmr13344755pjb.44.1682921123544;
        Sun, 30 Apr 2023 23:05:23 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::f98d])
        by smtp.gmail.com with ESMTPSA id q8-20020a656848000000b005134fc049d7sm16767730pgt.31.2023.04.30.23.05.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Apr 2023 23:05:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 05/13] libtimezonemap: Point to a working SRC_URI
Date: Sun, 30 Apr 2023 23:05:10 -0700
Message-Id: <20230501060518.3505068-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230501060518.3505068-1-raj.khem@gmail.com>
References: <20230501060518.3505068-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 May 2023 06:05:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102234

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-gnome/libtimezonemap/libtimezonemap_0.4.6.bb       | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/libtimezonemap/libtimezonemap_0.4.6.bb b/meta-gnome/recipes-gnome/libtimezonemap/libtimezonemap_0.4.6.bb
index d633b0621d..00d66b418a 100644
--- a/meta-gnome/recipes-gnome/libtimezonemap/libtimezonemap_0.4.6.bb
+++ b/meta-gnome/recipes-gnome/libtimezonemap/libtimezonemap_0.4.6.bb
@@ -4,8 +4,7 @@ SECTION = "devel/lib"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRC_URI = "http://archive.ubuntu.com/ubuntu/pool/main/libt/${BPN}/${BPN}_${PV}.tar.gz"
-SRC_URI[md5sum] = "f85a21994a397fb1ff2d3ec404bdd592"
+SRC_URI = "${DEBIAN_MIRROR}/main/libt/${BPN}/${BPN}_${PV}.orig.tar.gz"
 SRC_URI[sha256sum] = "0d634cc2476d8f57d1ee1864bd4f442180ae4bf040a9ae4bf73b66bbd85d7195"
 
 DEPENDS = "gtk+3 gdk-pixbuf libsoup-2.4 json-glib gnome-common-native"
-- 
2.40.1


