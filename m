Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36193.1793161459895092371
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 21:24:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=ZtrFRsq0;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cd61cef87f1so266434a12.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 21:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793161459; x=1793766259; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gh83cfskHLvKV1uwY+k6XSG1tepLn+dpLgGtGNQHReE=;
        b=ZtrFRsq023rNRVbBd/9Gnj3RqsIm6ddVwkMopTAcdWvJVxFEfNF2lz07ZYO011Ms9j
         sWEwNqMS34Uav+6sSktaRkQUhbvrmHhYCHxsnD3FfHplq5WHoFuJh/FUBStVJiv/6LlR
         1Y6xhTLTZ4Fx7dfS/Vw/+85xLviqg5UzV35jsG4YEXqBDQSM/+NcMFcEYURlSKyfm1Ix
         RDjnh1IBgxv2IW9wohA0hUEagpLtFbGbri8W3vKDx637v5q6vC7cuIR6ZrJLYdcE7L9H
         9E9wT6SY7GKHxsff87LBqelDotYCKJBPnufjGZDw1vAO2GuVjNFqptzf9j/qo6NJue9f
         3N6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793161459; x=1793766259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gh83cfskHLvKV1uwY+k6XSG1tepLn+dpLgGtGNQHReE=;
        b=mLQbDOFbxkky3IpUQttUSo+GQUpi1s7U21P4EaQTdFeDG6qk+feeRRgcfB+NresUN0
         8EuWcm9iYygx07RJuS7FtM1GncPbPwlH9WeHiv82RhzjhCvz0WRshm6u8ce5vs+U2MNB
         OXMKnaXcl7+j/w1euJChydVcmRq1unWGHLGrdBpUznN+s91hkWiu+HxrTBHnjSLay2Fo
         17B0r2RBhimIdM+x5bqKwMIeMTKmzojUb+GsrusDizwIVBnL49pf0DnCIp954BkAUm73
         kGOooNwM8xXn6jRAVr+CtFCuySgzbuqLqae/I57iHnYAVmYJ3VJpSqSMrj3cglhyKWni
         z33w==
X-Gm-Message-State: AFq9FYLz8tpYEY69kK7+7oiW3djUuqb5CkuPip29IxfYqQEPLkTTa3OQ
	fSsE8OXLCSnsbFfoTguUYq3aFPUxY7YT3VLnw6HFzlbeTh9M8rwy5QXEM6yYmQ==
X-Gm-Gg: AYBFou1He1PazonZHT7Pwxtn25YyigbOVN5/BC+J6wlfGTuOLqz8w6pm7XVwztvIXrr
	h4R+/ZtNlRVYw+yNB5N7y8fUOCrAsY3F7T4FEvIbESQ0VJS9wtZ2K7fpevwsQXslSytONoR5qow
	cC4mgiDZ/AUsGKIq1BPQPzDAMlmKnjdFYGGI/hftdhEp2zg/ohwabjsoj0Ex27sCeLKFHg/tenE
	zUSREDGOpWVs8e0wMZjOHs2e4OfFK67vKnOyAzUAjQiblM6YMGdR+aWd7EgZgyvjB7P6fQzBkSE
	yINoweHPrUulePGd4sjjAnveoAEIi898pLUuqBTQ9NH9oO0uUZr8G/+H6lzt0LX1M1P1KlHNoWw
	y4LPPkgkIjLG6+Nz/EtFun+Yk0N4GjqhbCLu63KIilHEIXDmMm0BRZ2fp9ri7SQlnTvKSZSZhG7
	JhU7NPHUELjIfh/ZuH9bpd4nBRMtcRXI6GEsYz1TARra1Gg4OWB5FQA8BmvT1DgrZppKBD00kqf
	IQehXU9PP+xybvOOlku+1XbS4nkduSa4eV0fFxre5TktikXguzFzp8TCrFCUs/wTK/WDonJkIas
	PpDd7EbqhaoaYVv6uJOtNnYE5SuVrRqiNkhZI05MmVQt6tFq5XHswIuC4y5P2A==
X-Received: by 2002:a17:90b:4cc9:b0:3ac:2788:cab1 with SMTP id 98e67ed59e1d1-3ae581014b6mr821954a91.30.1793161459195;
        Tue, 27 Oct 2026 21:24:19 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a48c2d3sm1010794a91.5.2026.10.27.21.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 21:24:18 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [blacksail][PATCH 05/60] flatpak: upgrade 1.18.0 -> 1.18.4
Date: Wed, 28 Oct 2026 17:23:03 +1300
Message-ID: <79d9892d598e67277c02ff563339d36dff91a443.1793161233.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1793161233.git.ankur.tyagi85@gmail.com>
References: <cover.1793161233.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 28 Oct 2026 04:24:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131557
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/flatpak/flatpak/blob/1.18.4/NEWS

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../flatpak/{flatpak_1.18.0.bb => flatpak_1.18.4.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/flatpak/{flatpak_1.18.0.bb => flatpak_1.18.4.bb} (94%)

diff --git a/meta-oe/recipes-extended/flatpak/flatpak_1.18.0.bb b/meta-oe/recipes-extended/flatpak/flatpak_1.18.4.bb
similarity index 94%
rename from meta-oe/recipes-extended/flatpak/flatpak_1.18.0.bb
rename to meta-oe/recipes-extended/flatpak/flatpak_1.18.4.bb
index 879455f63c..74bfb89e62 100644
--- a/meta-oe/recipes-extended/flatpak/flatpak_1.18.0.bb
+++ b/meta-oe/recipes-extended/flatpak/flatpak_1.18.4.bb
@@ -4,11 +4,11 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = " \
-    git://github.com/flatpak/flatpak;protocol=https;branch=main;tag=${PV} \
+    git://github.com/flatpak/flatpak;protocol=https;branch=flatpak-1.18.x;tag=${PV} \
     file://0001-flatpak-pc-add-pc_sysrootdir.patch \
 "
 
-SRCREV = "5de2b58bdafde88515d9d6b9189bd1cfd3b88c46"
+SRCREV = "a02d0ba48abe9aacc377de15699e5d8c024b5669"
 
 
 inherit meson pkgconfig gettext systemd gtk-doc gobject-introspection python3native mime features_check useradd
