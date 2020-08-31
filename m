Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
 by mx.groups.io with SMTP id smtpd.web12.1627.1598917870883148532
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Aug 2020 16:51:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cEDUB63q;
 spf=pass (domain: gmail.com, ip: 209.85.215.194, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f194.google.com with SMTP id m5so1109094pgj.9
        for <openembedded-devel@lists.openembedded.org>; Mon, 31 Aug 2020 16:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mFSM6MBrpMUoVuwOVuptGG3nsVBMhHXdqNtZ0Sk9MQk=;
        b=cEDUB63q/Ea/CibLCM980vUNkHGTcepzg5kV6bpPQjLiBNGcqrSH5Z+0Sm6gNL6DDN
         0DJa6TwvrHrZ/Uu+Ot+HH7tOuwa9YctSpkfcCEKzGbiIRSLSn/8tJxaiu/D6Aq7Z43Zd
         YOQ8QamAdNC/k52Ai4EaD2VWviPTiFZUOKlpu1zEwcgTHNzRcWvHXovabnHbLGwp4y2a
         qbYf57rOdH1LPm3Xx2OYYP1rLpt6GBmvXUfVyzOPTSse/qbFgN5CjExDphm8xHqD22VG
         zKJsDaD0I6HC4QBR2TBAzZ+H/hHHJo03n1aqCg83NutF362P+f981NkfP3wJiM+FMxmI
         LFbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mFSM6MBrpMUoVuwOVuptGG3nsVBMhHXdqNtZ0Sk9MQk=;
        b=YrWKr4Sy+zE1r0nUfeavsUJG8Dy1Ac8WYBMhtbsv37kSJXpN4CO08C2/Vk8reiMujq
         vFgGvvK16Zwn6OotnSsyvJjQNRhUj5GwHJBSvIW1zVpq6v20JweSDSXD/JQcrrq7OVrl
         riLuMfZddjdEX7I9GKzicT8yVlGaz9jspFBs8m6I2S8rDyDSLQstPJzMiDSUCogjk5d1
         n0rzTuT0s8ZDAYWfEmYZTVQhvm9eFpkdjHv+0njh8L/wulkhPOv58HLZs8JzGsZ8ePwl
         nj2ezhoSf+Tntkzzrv3nptmQoCUy9OKfO0+Om/frpWIeioYga62GO6S2154IwduxpW5Z
         sreQ==
X-Gm-Message-State: AOAM533D0vILJrGomDUUhL6LntvGRSB5m8BmfnMwRH31f1wihimZBhmI
	Yp4vvLqS6zq3yMLPDL/RfCvlKbGjz7I+Sw==
X-Google-Smtp-Source: ABdhPJxRbmYI/yj2sLj9BFJcxKf1XAvZIHrrDrHQTK20ys6+de6MdHIKgEIpQhopdLf3e1rp3N/NJg==
X-Received: by 2002:a63:ec4c:: with SMTP id r12mr3066389pgj.74.1598917870182;
        Mon, 31 Aug 2020 16:51:10 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e89d])
        by smtp.gmail.com with ESMTPSA id b15sm2892293pft.84.2020.08.31.16.51.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2020 16:51:09 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	=?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
Subject: [meta-gnome][PATCH 2/2] layer.conf: Fix for signature change for allarch icon themes
Date: Mon, 31 Aug 2020 16:51:06 -0700
Message-Id: <20200831235106.48150-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200831235106.48150-1-raj.khem@gmail.com>
References: <20200831235106.48150-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

faenza-icon-theme are allarch but recently

gtk-icon-cache, since commit 31e3d34c8a9c3e8481aa837aa0bf52adf095fe62
[gtk-icon-cache.bbclass: add runtime dependency], it start depend on
non-allarch packages gdk-pixbuf and gtk+3, which make it's signature
changes when machine changed.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/conf/layer.conf | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-gnome/conf/layer.conf b/meta-gnome/conf/layer.conf
index 7aa9507eb5..7706b7ca6b 100644
--- a/meta-gnome/conf/layer.conf
+++ b/meta-gnome/conf/layer.conf
@@ -18,3 +18,9 @@ LAYERVERSION_gnome-layer = "1"
 LAYERDEPENDS_gnome-layer = "core openembedded-layer networking-layer"
 
 LAYERSERIES_COMPAT_gnome-layer = "thud warrior zeus dunfell"
+
+SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += "\
+  faenza-icon-theme->gdk-pixbuf \
+  faenza-icon-theme->gtk+3 \
+"
+
-- 
2.28.0

