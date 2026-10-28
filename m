Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5718.1793218053862150955
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Oct 2026 13:07:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nkent-net.20260707.gappssmtp.com header.s=20260707 header.b=aOTThnS5;
 spf=none, err=SPF record not found (domain: nkent.net, ip: 209.85.128.52, mailfrom: nate@nkent.net)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a215e64962so15734495e9.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 28 Oct 2026 13:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nkent-net.20260707.gappssmtp.com; s=20260707; t=1793218052; x=1793822852; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hNW5gNtW0B/IEBebkt16PuyGtfH299YVkLXXon/kOek=;
        b=aOTThnS5bqX+UvJJZasvrGX2ZUSZxjkgNPTxUmglf5+6T0sLWAy6pmEHF2TxskUZx8
         gJ7cMFFjjOt4EP+xJBH/vQU3kSxvbmVXo1/gnu0Xd8hRjCAcDoCj0+Wr6gtib8dXBaTk
         MXsAQ0qX7ggIWJM4fkJXcL7ZkICY576uNIN8+d3C1kPNVSz6KMOIIOUgJECKNsl5snTZ
         mT1udy7VgHuOLvYtgkWckkWdNWO2uRZcQg1zN8F8i1D0KYf1m/ogzyiH5m4Z4+73UKmP
         AmnB/A68zg7pJjqWF7mwVHfxhPS6fKn7QRd4ObWlmQisDFG7bmQlf/QxOoyjBiggET5J
         jMyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793218052; x=1793822852;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hNW5gNtW0B/IEBebkt16PuyGtfH299YVkLXXon/kOek=;
        b=RJYUbLw1/ZPXZasTyOWTRfOjDApKgmVcB9CgnTY8s7Z1D0145HYvZFsk5v9m8xTOQn
         ifOXHP3hTALdVIBp1WcuL7RcLWT0uJN5e/U9LzYgQbHvcODUMkPUUSbU/rzTNopob/eU
         NGr1IU/SQpOIiLc9arrjJl6MU2pn3ArSddf/wQDdpiWzW8xQaR5fgALZZ8xFWxjS7oHR
         s8+nkLM9Ptc/Q6GgwGj24NhnzPI9gHaVi35v9Y+7iFxGTMqtNO42DsxfD23a/yTjK8Nu
         tinWFokKOnu6eC1pFNam/ELths5+RptDevWp29iEIY0yphce6Xhrqo7tISrNkH/m7z+5
         gihQ==
X-Gm-Message-State: AFq9FYINwLIXT0dLAO+EjzqKvTdVEWMEL09hsns3zcBSAF1l3exUhx/I
	D0fSh/GoeqrdAekcCzdVSxOgzhNJ8W2AluVrTGqGY5e7HfPdvcKUdETy1pTLNneIesxYuBHOg2p
	6kGM4QT364Q==
X-Gm-Gg: AYBFou1TgWhLV/EKvt2mDPxT/i+WpquS+T7hobglpXVNI8Yq25IZ975gH1USGQteIjy
	r45Ob7+t8UXj0Z5wEZJ04wwveldZpKiruuela1rnCycyay7kmfbPiceg42dgYopIg+Yz1/534YT
	lCN4oKahoiFZ6/2mn4Tcedut7k4s+m7HoFoc//71NS76T7wXsQniDDdWoiJHO7/UFJ/b6rRTuAy
	keKvo0q6GJNYFbRcdxAXk8/ZolAfnICPix/qtp0JzCNTAyuK6i8cqMi4jaB7oeMLNYMCZPEq85n
	f2nO5IAKSVkJESfEF0v+snwXPb3vr5DzRA3ZheLgNfqPhW64vuLZRVOHQU5LicWpBJaBFv67HRi
	Jd76pTXkvjZ7UoFeircceL80sxxt2PMn7PY/REzpIGbFMtE8411mjsu1VRLGWtuepYnSzRMPkOW
	tK51TobFm68IfMv02hqiWzZUxRpS9Lxydw4APxbg3JSyOKyITr/RWup80GxIjij/hledfWGrICY
	GN7YYg6pUiHc9UmB54Vcw+DboYXFdfxN+hdDoc3xWl68Uy99b8fXqKCcvJmOUo6j5xbSt8FxLJc
	mlYumknMKN2x4+A94gSmjZxWdKoMHc8qeZQxQafjd6F7Wav5Hkse/DnxeWossFBV0bMDy025f0M
	5f/nHPHrbZNsBxYiUXhfpU9amjGLiEazP0UPzPDRuVyz+zmPcFm+LgPYI0lK1lRXf8g==
X-Received: by 2002:a05:600c:34cc:b0:49f:e8bf:8f9b with SMTP id 5b1f17b1804b1-4a963ffd2b9mr85982455e9.4.1793218051787;
        Wed, 28 Oct 2026 13:07:31 -0700 (PDT)
Return-Path: <nate@nkent.net>
Received: from akatosh.telenet.be (2a02-1811-e507-d800-9ae4-d494-8afd-3e84.ip6.access.telenet.be. [2a02:1811:e507:d800:9ae4:d494:8afd:3e84])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a9ead8aa0fsm19540195e9.4.2026.10.28.13.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 13:07:30 -0700 (PDT)
From: Nate Kent <nate@nkent.net>
To: openembedded-devel@lists.openembedded.org
Cc: Nate Kent <nate@nkent.net>
Subject: [meta-networking][wrynose][PATCH] nng: correct upstream branch name
Date: Wed, 28 Oct 2026 21:07:06 +0100
Message-ID: <20261028200706.3611828-1-nate@nkent.net>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 28 Oct 2026 20:21:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131630
Content-Type: text/plain; charset="utf-8"

Upstream changed the branch names between the v1.11.0 release and the
v2.0.0 release, which means the old branch is no longer valid and the
fetch will fail.

Signed-off-by: Nate Kent <nate@nkent.net>
---
 meta-networking/recipes-connectivity/nanomsg/nng_1.11.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/nanomsg/nng_1.11.bb b/meta-networking/recipes-connectivity/nanomsg/nng_1.11.bb
index 031827a5c0..f4c15ff674 100644
--- a/meta-networking/recipes-connectivity/nanomsg/nng_1.11.bb
+++ b/meta-networking/recipes-connectivity/nanomsg/nng_1.11.bb
@@ -5,7 +5,7 @@ SECTION = "libs/networking"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a41e579bb4326c21c774f8e51e41d8a3"
 
-SRC_URI = "git://github.com/nanomsg/nng.git;branch=stable;protocol=https \
+SRC_URI = "git://github.com/nanomsg/nng.git;branch=nng1;protocol=https \
            file://run-ptest \
           "
 
-- 
2.55.0

