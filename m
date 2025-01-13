Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED746E7719E
	for <webhook@archiver.kernel.org>; Mon, 13 Jan 2025 04:46:13 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web10.10195.1736743567843968391
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Jan 2025 20:46:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=B9fzfum9;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2ee67e9287fso6556847a91.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 Jan 2025 20:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736743567; x=1737348367; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3LlGQEQ7bNA63eFfWGzdiZeidGT2PjIOjgRpmHRYj/4=;
        b=B9fzfum9lneMRKK/M7MjIVahEWCMFrD2NlszR5V11sJotCkUgmCkFxwcFH4xGUilSG
         28rA7oIoXwSBTXMb8dnkKO4L8mTVwlUSlMgw5h16DFjZoADWPZvYlTSB+3F0QCE33dSx
         3/JKEGJK19wukp3sNQIdlpqBOpTAKXmkWo/4Ss1ByVpa+Md26etm6q5yc4M4SgMM7R7P
         m6YFZwZAsVPSMTdyUYQ0r+W3WpqqFtMAzH+UWJUV17deAlnx+NC/Wrlko2Nbp6Vq3X97
         1/sMtl5QrlefQoL3Uu4X6bIonKuVhEr/UprxjztOX5VZFyRKZ4H5VBA4t+9QGOOIWD00
         RyaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736743567; x=1737348367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3LlGQEQ7bNA63eFfWGzdiZeidGT2PjIOjgRpmHRYj/4=;
        b=Hv8u8iI1xmzb1eAFjUmveZlHAkffqKFW9Esy5zBzRAjY0K/Iuuq7/wCml8VKtstoF3
         y5WNdFln+xFbmTov2bJ3IX+141efRDsRuOO+B8bN+hYlN2aaPcvhkrU+e7/SXVCa0/9t
         tyyRSHK61Ay/sTDSsNQTyHG5trob0CdXYgXiSD0NhpSGc4h80nk0yaX/1RyCkhLlh0Gw
         hGvsbDfT9x9cKYaibzRs+Arj2dAAKn7mwsLiIXDFMpAlzy9LM6TZBXn/VFbcLmLxnph7
         U9eWbT1NeVBLi9+YSnBDFem0Ovee6toITf/rSzx4aG9A/oZ3X8c8VgXauKmzz5PLAiZI
         VF6w==
X-Gm-Message-State: AOJu0Ywxxxs26yFjOuzIygaVAAHBKU+JjN+MYgonMNkby9GOnY+uGm5j
	ycnsVv5t5kO0Yx0tsjnE26qHNlJuKWRLvreE4un6MyX8tSokkE76h3baS3Id
X-Gm-Gg: ASbGnctP1WTHSGcdRlRjxLAmWZBrCqFJX+IBxNthBnDOzlSdwSELkICuWOG8FJ+POSQ
	n7V6HtaHyPogFO26LMlDtGvV/yp8a2xl/OlDj2JZWS27G2JL0fNHCdPldC/Lb27guUZbyA6tAqU
	iJMpstX4A6vb68MrvdQr0EIAyB3fdyqjU+DS//jE93ZoALhzWXTPW6dGpxCMdLg4HaEc48kONgW
	OU3LyK87OV9TTf3AM75O0vw6M9IWM0bBgZsmRNf9igPNaUT
X-Google-Smtp-Source: AGHT+IH2kDycw1HVaOLnGbPLvGMWC2SHjuEebj+KwEdrEF0oLKsifpuz9CEHHfr8VSvvQxkGYyY14w==
X-Received: by 2002:a17:90b:534b:b0:2ee:d193:f3d5 with SMTP id 98e67ed59e1d1-2f548e9f9f7mr29458234a91.7.1736743566862;
        Sun, 12 Jan 2025 20:46:06 -0800 (PST)
Received: from apollo.localdomain ([2601:646:8201:fd20::65e9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f559439ae4sm7614921a91.30.2025.01.12.20.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2025 20:46:06 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/5] cpprest: Skip recipe due to unbuildable dependency websocketpp
Date: Sun, 12 Jan 2025 20:46:00 -0800
Message-ID: <20250113044603.3467963-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250113044603.3467963-1-raj.khem@gmail.com>
References: <20250113044603.3467963-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Jan 2025 04:46:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114821

Websocketpp needs to be ported to work with booost >= 1.87

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 1 -
 meta-oe/recipes-support/cpprest/cpprest_2.10.19.bb         | 2 ++
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 4a19bb5809..79c825ee5b 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -718,7 +718,6 @@ RDEPENDS:packagegroup-meta-oe-support = "\
     ${@bb.utils.contains("DISTRO_FEATURES", "polkit gobject-introspection-data", "colord", "", d)} \
     consolation \
     c-periphery \
-    cpprest \
     ctapi-common \
     daemonize \
     daemontools \
diff --git a/meta-oe/recipes-support/cpprest/cpprest_2.10.19.bb b/meta-oe/recipes-support/cpprest/cpprest_2.10.19.bb
index aec7286404..4ed43d178d 100644
--- a/meta-oe/recipes-support/cpprest/cpprest_2.10.19.bb
+++ b/meta-oe/recipes-support/cpprest/cpprest_2.10.19.bb
@@ -17,3 +17,5 @@ SRCREV= "411a109150b270f23c8c97fa4ec9a0a4a98cdecf"
 S = "${WORKDIR}/git"
 
 inherit cmake pkgconfig
+
+SKIP_RECIPE[cpprest] = "Needs websocketpp which does not yet work with boost >= 1.87"

