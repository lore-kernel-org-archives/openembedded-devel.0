Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01CD9C3DA7F
	for <webhook@archiver.kernel.org>; Sat, 10 Aug 2024 15:38:39 +0000 (UTC)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
 by mx.groups.io with SMTP id smtpd.web10.7846.1723304313960738909
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 10 Aug 2024 08:38:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=h5HamJKO;
 spf=pass (domain: gmail.com, ip: 209.85.219.175, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e0bfa0b70ceso2673851276.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 10 Aug 2024 08:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723304313; x=1723909113; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/lqq96v0Z5IszthSP3KcQyBJWzc4HSghK2/ByJyY8Lc=;
        b=h5HamJKOzC63zx8gL67caNEuodEaL/mM0xCgTGAcngIWZ2p/gQEKk0J5Rre8MgvR3S
         Eaw6lEwoHv4aU1EFOXn/uJmdrpWZ4eBQSvaeRJJuUBgg8tp+eru9SdflXgiuj9uwzGjH
         s+RjmXvY0oB8dpQEvVM+Om3amTOZu2lcyvlt8o7/TB9WYzL/xmO0sv2D/mtnhcJsg5kI
         qVysncse+hVFW07EremujtVRCxNalFgzMt5pv1pyTbRqox1AUD3STPi+6GyJVe2M2VGp
         6+Gg7gZ2rsYhLwb/sk+Y29w2/GONuxRhqgsQy0sEXdY6XnSw3n0a/h7ok3zLE+FgD+ul
         oqNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723304313; x=1723909113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/lqq96v0Z5IszthSP3KcQyBJWzc4HSghK2/ByJyY8Lc=;
        b=dpX3WG7EiMtTV00rODJkKW1D7ksqkrBZBoDM23UV3+Y9zYOfXRpfRcOyiaVDlDaC8x
         rMkf3486a8GjFB9PvFKqG5ofRFsV28TO8EwBDCY7/GxtWyxYsNQccukLrzfJHQ9+nrh8
         Uxrjse/bnDOJnVwndutdTJoyV7RJX9fI2SNTgXC+M8V+xh0mxA/qKe67Kyo/hCcAPrrT
         y6uhmP78Kv1b/JQ0JJ1pSg4ecdyeZq9OB4CUwXkQyDagB2CFQHlc4is1aZUbkt8uL/Yx
         gOcEUL1R/DjAZn+N8PlosZOJ1FGAgdr9rvrnN+nXpInQv5Znf3qFY+/DKPYva5SC2m9j
         XXqQ==
X-Gm-Message-State: AOJu0YxBhqmqlTzHbNznF3Kr92X5SRoVnrjZtb1hu+PVY7iEugB/hexW
	0S9IwM+4gWeX00zXHdgws9C1S8fPd9CZKUXYCf/e2TSSXbE7816SQcjFAw==
X-Google-Smtp-Source: AGHT+IFNP9NNGhgxt2fxnwJB4lLd/OeXk94NNKRMk3P6kKIMIS+6nX14nrPupmYc+qDam8UnQkPHOg==
X-Received: by 2002:a05:6902:12cf:b0:e0b:db13:76bc with SMTP id 3f1490d57ef6-e0eb98e71b1mr5154710276.12.1723304313026;
        Sat, 10 Aug 2024 08:38:33 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000:ad:eb2b:7538:7504])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e0ec8c0726bsm382526276.39.2024.08.10.08.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Aug 2024 08:38:32 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][scarthgap][PATCH 5/5] exiv2: Upgrade 0.28.2 to 0.28.3 for CVE fix
Date: Sat, 10 Aug 2024 11:38:30 -0400
Message-Id: <20240810153830.900538-5-akuster808@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240810153830.900538-1-akuster808@gmail.com>
References: <20240810153830.900538-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 10 Aug 2024 15:38:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111749

From: alperak <alperyasinak1@gmail.com>

Release Notes:

* https://github.com/Exiv2/exiv2/issues/3008
* https://github.com/Exiv2/exiv2/milestone/14?closed=1

This release also fixes a low-severity security issue in asfvideo.cpp:

* [CVE-2024-39695](https://github.com/Exiv2/exiv2/security/advisories/GHSA-38rv-8x93-pvrh): out-of-bounds read in AsfVideo::streamProperties.

This vulnerability is in a new feature (ASF video) that was added in version 0.28.0, so earlier versions of Exiv2 are not affected.

Signed-off-by: alperak <alperyasinak1@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 9f4361418d58941d058fb94a3671b9d0904b6300)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-support/exiv2/{exiv2_0.28.2.bb => exiv2_0.28.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/exiv2/{exiv2_0.28.2.bb => exiv2_0.28.3.bb} (86%)

diff --git a/meta-oe/recipes-support/exiv2/exiv2_0.28.2.bb b/meta-oe/recipes-support/exiv2/exiv2_0.28.3.bb
similarity index 86%
rename from meta-oe/recipes-support/exiv2/exiv2_0.28.2.bb
rename to meta-oe/recipes-support/exiv2/exiv2_0.28.3.bb
index faae247998..3e33ab7953 100644
--- a/meta-oe/recipes-support/exiv2/exiv2_0.28.2.bb
+++ b/meta-oe/recipes-support/exiv2/exiv2_0.28.3.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=625f055f41728f84a8d7938acc35bdc2"
 DEPENDS = "zlib expat brotli libinih"
 
 SRC_URI = "git://github.com/Exiv2/exiv2.git;protocol=https;branch=0.28.x"
-SRCREV = "04207b9c39bf7b3b1a7144f7ed4e4f16b4f29ef6"
+SRCREV = "a6a79ef064f131ffd03c110acce2d3edb84ffa2e"
 S = "${WORKDIR}/git"
 
 inherit cmake gettext
-- 
2.34.1


