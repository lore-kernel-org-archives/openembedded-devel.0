Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57E23C5DF67
	for <webhook@archiver.kernel.org>; Tue, 18 Aug 2026 05:02:29 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2346.1787029346457026991
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Aug 2026 22:02:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=qJGk7V3L;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3900e39d935so3785428a91.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Aug 2026 22:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787029346; x=1787634146; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nNf04AWOYVXGN2rk+3FOXI5AS6VNDxD6grCGK+xjMW4=;
        b=qJGk7V3LStcJ/0k0Po5DdaNxC31qU3M8yQYtvvfv6I9jQlTxAPx8KF8jbx19w12GgU
         NdFPjTTFMwhHv1FRES9igetrWUMwv3k1WrqBxe9a5wrwSkaDgfs3Ad4HMSOnpsLR5ONl
         9i7Mzee1Yc0UxoMFgSULNXTSevsL9COl5byKBbPRR8yDrLRC8FXeIQd94l9WYbZEeKow
         lrV0LOuQGht/QLTqs/pv7Y82hgKleCjknD4Qe9fGVATmgnhuwHBIH4ECjISlhv8195Ub
         XjuxTQz9Cg1z2F/rryHvEX3++vw9wfUCcPJuJA0FisIHKV7IEkQ4gI/VHL6CsgFVVik2
         WraA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787029346; x=1787634146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nNf04AWOYVXGN2rk+3FOXI5AS6VNDxD6grCGK+xjMW4=;
        b=QDj9PhzqA7PsZKQIFxWBfkoUg2/QCqut96pZjX5CezCP25bX0lXYAo8jBfUE85xHCq
         Rc8MMieEbM2EZAt4BDg1Jnc7HGCdOvm12IAmNXvtojcWP020FN2gDscH+cKdVX1e5GaS
         S4DMI8laWUrLwEARqYOyd4mqeDTf0Ke0GoHj+iNb0+iDooPelACJRHbHEhNHEWfblv77
         EWWbRz7wKJElOSS0sXx/Ey65WB0scqDLmIyz+X8Ual/GaNKaqEjiCDq2imr4Cciuod1n
         p4S/IEJO/kHrL5uZa0eCoJGNHK+zhjYLsTGf37FwV/LLUgNFascjK9XJm1BrWNYmTd44
         LAgQ==
X-Gm-Message-State: AOJu0Yx7FZUhzM+b+lJVI+ayKmZ2UyuSXLK5c5hbxX7rbrn7P7XdKkhA
	IlE+MdSauTTW1Wqds1+hgfPB/U1/ULS+RyunGYzkTmu7jnKgSJ4PAKGRhb890Zd6
X-Gm-Gg: AR+sD13IFUkS/22BRVlOvi86GeEimvjuQ2auvJSrV0dO8DmHmE4mZ8NyrjwsuUzdAx5
	+WkUBsF1YIRX6tGNLw3FNfOtfoayENINsvZfG2nsvK730eLMZDtSg2DaxidgSTcWXqGdqJlOwIt
	/uuYCHqaJuX436aDzjWNbKqlnQ/wxFJi0Fz3DozzXlVzoahrDALHig1DYRnCiu3g3WFzu5plGsA
	eOSEZoV1tHHzWvR48Xa54L4U0CsvXde9Uqq4WpBMOZKRujnzK/C/jEnMjD+gYeGqLZw8hSD4Y1V
	4k3eCjlEjMw4eneqjKCzhNH+jErsjQenlNeZUjWDiopvjLYQCEbhEocseKXcXt8z+AZVxtOwCSj
	uhqtUi43ds0ztIAkzRLj0gN7u1dkmbmyqWxmgdtufMhHN6zJZVCUe2zT6bWZv3JX3x70gUT6I3e
	CGVASCiG5xCc3qTTfs0fSlHcul6a6v4n4W715AUjXPwqQmxNr4+CaewmiKPzzbQSGxEFxC91hWL
	g==
X-Received: by 2002:a17:90b:53cf:b0:381:1c96:829b with SMTP id 98e67ed59e1d1-3933bd204d0mr33053152a91.3.1787029345796;
        Mon, 17 Aug 2026 22:02:25 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3267be8e5c8sm12840095eec.16.2026.08.17.22.02.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 22:02:25 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][PATCH 18/27] libnetfilter-conntrack: add UPSTREAM_CHECK variables
Date: Tue, 18 Aug 2026 17:01:13 +1200
Message-ID: <20260818050123.2901739-18-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260818050123.2901739-1-ankur.tyagi85@gmail.com>
References: <20260818050123.2901739-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Aug 2026 05:02:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129217

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Fixes:
$ devtool latest-version libnetfilter-conntrack
...
INFO: Current version: 1.1.1
INFO: Latest version:

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libnetfilter/libnetfilter-conntrack_1.1.1.bb               | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-filter/libnetfilter/libnetfilter-conntrack_1.1.1.bb b/meta-networking/recipes-filter/libnetfilter/libnetfilter-conntrack_1.1.1.bb
index e397034504..b02b4007ea 100644
--- a/meta-networking/recipes-filter/libnetfilter/libnetfilter-conntrack_1.1.1.bb
+++ b/meta-networking/recipes-filter/libnetfilter/libnetfilter-conntrack_1.1.1.bb
@@ -14,3 +14,6 @@ SRC_URI[sha256sum] = "769d3eaf57fa4fbdb05dd12873b6cb9a5be7844d8937e222b647381d44
 S = "${UNPACKDIR}/libnetfilter_conntrack-${PV}"
 
 inherit autotools pkgconfig
+
+UPSTREAM_CHECK_URI = "https://www.netfilter.org/pub/libnetfilter_conntrack/"
+UPSTREAM_CHECK_REGEX = "libnetfilter_conntrack-(?P<pver>\d+(\.\d+)+)\.tar\.xz"

