Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7278DC55822
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 19:41:32 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25003.1785872491472714705
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Aug 2026 12:41:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=KgNzjjj3;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cca0c5799eso2571705ad.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 12:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785872491; x=1786477291; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NpU3i0dOAR+dGI+zWM/Dcb3FYz1zgg9abqkpPVOvmpg=;
        b=KgNzjjj3/JGoud1tKjCuc1PyY212NDnMrfROK5do/AqPCnPipsRrF69HqiYPaS+RFM
         lEkVHdKBqEnXSc11tMpLcDGya160e+Lfo1XMvY1dXE7kfLbBvEpULESczZoLBX2qAx6+
         5HWxAPaOBVOWQ2DcQNbHc70lZ+XXYMLp+CDOpGfiuMkz4wme6glaiP8zzPxMAGllJNYM
         Q3zsd5K/7RvgFO+VJlnb3GgcsxAfAWHiPmY3rZhmaSvsjAWV7Ithi9sorqCIKz0qupnL
         nzwkaAThgmT6DoTmWLKEeefHrU6Ypjx9MRqOV+zzYp9kepaL34pjHIw31wClF10fyE/F
         laMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785872491; x=1786477291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NpU3i0dOAR+dGI+zWM/Dcb3FYz1zgg9abqkpPVOvmpg=;
        b=FVafAVyYhpX/y5vUu9gtJ59uZ8kkQ8RGVKJrCl83+fJ5X82y65SySCR4hyEkVl4gBc
         wQe4IoPMvklHPDIbXWkQBvZKeA2N30LU8IwbklkNeNnofPz5+0FpebolrDLc55+jejOi
         Te1B0RUGYkvmgcS5iD4rrLCEK7xKNL+yfw0dcM9zQq7uUqDN5lsoMNmLBsJC4fT2zPuk
         AcCc7PkLCHTT0CKg2j6QVBHMr9w7ZO4kDliQgHgbfMOwuUFoxwOkY5n25JSgHmdZdmt9
         aieiJdnqszhmN8GhOayrIan43bXCrikBPjACiluVi5OzyEZe5fKe6ESRLlG4SXsxt7LC
         V/4w==
X-Gm-Message-State: AOJu0Yz62NQN8WJl0cb4CXd7rJf1ufZBjFazplU4nuTVdEdC4OvCQhAg
	XKIfr6rJeg1JLLwmnV0jZKPmdtS9/MjSiUQ9sOoCY/p+G27sZLujkMLZA6wdhXZX
X-Gm-Gg: AR+sD13bdkbPDc+QWYpMrGfoANvsvD/EAoDsEvpdZdUzSvnST9zN3Xin9oejOan8wza
	YyCSKYUK0omoVaPFI2eqKPmEdxB8NtkJOmy6DE2cPHjxXORNLYiTCcCUjD4QlPyexXlNFcd4w1b
	CswYCQnEAZ4KBzk59PBa3l8ShwBRAyB4YwFZBuhS+7xybx96Nbr2UpQXQzgR3NhDD9otnP/S77o
	VoML0JsI4WKijnHAcO8iTbplOTIL12BfrbWIZRLytQqp5JZShxXn6n+oPzpvOTefBR3aoUeoGKG
	lPlicXPV0HTD5wvz11KdPzeWPRs4nwLzGX2PJ/nzOM3eYKtGnHWwX8zzNrLyNMDQGgeMuudlsbn
	9opCUeXZjj9bFh3+uYRFg9Nd1BqjeLWZip+FgiiJYOyPExAauP3L9PnJ3dv9rQtCiKHE1WHEg5e
	RU+x2xkbPoNZ009ymd22TdQZ16Z+RqclvCHAYcCJW4Urpk6Vhb+HYqHd4IyQH22pOfREs5CTr9+
	Q==
X-Received: by 2002:a17:903:1a2f:b0:2ca:1b97:70c5 with SMTP id d9443c01a7336-2d0ca7afcccmr13969775ad.4.1785872490746;
        Tue, 04 Aug 2026 12:41:30 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3158673b7f4sm8156417eec.17.2026.08.04.12.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 12:41:30 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][wrynose][PATCH 32/36] gupnp-tools: upgrade 0.12.2 -> 0.12.4
Date: Wed,  5 Aug 2026 07:39:59 +1200
Message-ID: <20260804194003.3158916-32-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260804194003.3158916-1-ankur.tyagi85@gmail.com>
References: <20260804194003.3158916-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 19:41:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128779

From: Khem Raj <khem.raj@oss.qualcomm.com>

Upstream changes (NEWS):
 * 0.12.3: translation updates.
 * 0.12.4: bug fixes (GNOME/gupnp-tools#29) and merged MRs !7 and !8.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 9a5c3f43fd9b8b0dc5200c86d4291b5a7a85f217)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../gupnp/{gupnp-tools_0.12.2.bb => gupnp-tools_0.12.4.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-connectivity/gupnp/{gupnp-tools_0.12.2.bb => gupnp-tools_0.12.4.bb} (84%)

diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.12.2.bb b/meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.12.4.bb
similarity index 84%
rename from meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.12.2.bb
rename to meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.12.4.bb
index 739e3885c2..c6ba2a7ed4 100644
--- a/meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.12.2.bb
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.12.4.bb
@@ -8,7 +8,7 @@ inherit gnomebase features_check pkgconfig gettext gtk-icon-cache
 
 ANY_OF_DISTRO_FEATURES = "x11 wayland"
 
-SRC_URI[archive.sha256sum] = "4c92f2d1a3d454ec1f5fb05ef08ca34df9c743af64c8b5965c35884d46cb005c"
+SRC_URI[archive.sha256sum] = "2c7f6f538fb36a15322be532217e5de161182c943c0a8b0da4458cf970b4092f"
 
 PACKAGECONFIG ??= "av-tools"
 PACKAGECONFIG[av-tools] = "-Dav-tools=true,-Dav-tools=false,gupnp-av"

