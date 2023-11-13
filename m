Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63F7EC4167D
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 07:34:57 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.32320.1699860896101817302
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Nov 2023 23:34:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RSSqkvtQ;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1cc5fa0e4d5so36796025ad.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 Nov 2023 23:34:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699860895; x=1700465695; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bTwLepWjRHU8yZwDb/SuF7E14jz66FspaZ2s025biCo=;
        b=RSSqkvtQ7f1pS6ST35AsACf/VLLnfWYI761Kqd3c2ubb3M3xbGG6ezwDpf9h5uywRV
         n4rFKLeMzzr5ClYDwelWXVDmUs2s3UizvX+4OUSdeGlcerf5vbxQ7Ii6M+YxB44P8ajA
         DxCrkyRRItWSRFTiKBfZpZEaGjMjpuUJFHRKE9/nHsYZ7l3Jgcc6yO1OXkGXxKmDQtU9
         13F1uW66DgbTlPq/gvceIV9d1MhTYpzDr1mcz2afbgs3+UV4G9gDJGB6cYKjW6htNhK3
         H86uMlH0kqV1KCyVPwnZRzKGIm/vicLIxcMr5qUzxtLEf8oSvSQ0GqNgFVCVm/OgQePv
         ZkPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699860895; x=1700465695;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bTwLepWjRHU8yZwDb/SuF7E14jz66FspaZ2s025biCo=;
        b=VzWeCkBqzP+IJEMOoIMYwUZ0d4qctHCrFm8S+BplcEtA+avj+NWYXhRhxme6NAL0pO
         bX5Q9IaIV4LYMoYxBYOKdO8jMPz0KSckW2gfiW5/J8jFlLjpKoTjS0agqs1kNytuEBNW
         azdbIIayLkQcm5yUqeQAw6eLnupZdCcLQH1gL0xa/zh7Qb6Tvb7T+2tGWWAOFFy1CyPg
         Aqz3+K1UmVvF/6hW3hfe5N0Enhyx8g65PpRHVU7MvCNBXarI1BJtCjv0FWWEfIUzyQmU
         mpqQ53UQNqqq6+IFomL7n8KpNV1VPNxgN+BuZLjPjGqowrRrjkxa2rlN6mRx0sCIwfQR
         aD4A==
X-Gm-Message-State: AOJu0YyLerHKG+bfnZTf7WOZRR/Ij7Xla/tIHmfevM/6gFYIXaN6vi5v
	dBwQHbtZ0d+321reZoViZrsKQJZyGs+PwQ==
X-Google-Smtp-Source: AGHT+IEbcnoyQaRy6VyCpeVrxKzHcGV7n4z3lPsFGUcQEWFl2pJywW9RxdjyF+P6WRi3bb4b4gmqMA==
X-Received: by 2002:a17:902:ccc3:b0:1cc:5273:2105 with SMTP id z3-20020a170902ccc300b001cc52732105mr8783490ple.47.1699860895209;
        Sun, 12 Nov 2023 23:34:55 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::62f8])
        by smtp.gmail.com with ESMTPSA id q9-20020a170902dac900b001cc50f67fbasm3509691plx.281.2023.11.12.23.34.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Nov 2023 23:34:54 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 12 Nov 2023 23:34:50 -0800
Subject: [PATCH v3 6/6] librest: Use autotools make system
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231112-kraj-pu-v3-6-51f4c8091bc8@gmail.com>
References: <20231112-kraj-pu-v3-0-51f4c8091bc8@gmail.com>
In-Reply-To: <20231112-kraj-pu-v3-0-51f4c8091bc8@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 07:34:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106632

OE-core is switching to default to meson for gnome recipes

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-gnome/recipes-gnome/rest/librest_0.8.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-gnome/recipes-gnome/rest/librest_0.8.1.bb b/meta-gnome/recipes-gnome/rest/librest_0.8.1.bb
index 23849783cc..51dc44cc4d 100644
--- a/meta-gnome/recipes-gnome/rest/librest_0.8.1.bb
+++ b/meta-gnome/recipes-gnome/rest/librest_0.8.1.bb
@@ -13,6 +13,7 @@ DEPENDS = " \
     libxml2-native \
 "
 
+GNOMEBASEBUILDCLASS = "autotools"
 inherit gnomebase gobject-introspection vala pkgconfig
 
 GNOMEBN = "rest"

-- 
2.42.1


