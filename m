Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A5F4C4332F
	for <webhook@archiver.kernel.org>; Sat, 30 Oct 2021 11:16:09 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.17544.1635592567601393596
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Oct 2021 04:16:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GslCUcmv;
 spf=pass (domain: gmail.com, ip: 209.85.214.173,
 mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id z11so8527784plg.8
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Oct 2021 04:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=9fmDeV/xvFlZXVotCbXhaYko7AdKEO67ofkZPWBVEPk=;
        b=GslCUcmv0GsjH32HtmZa8JvQkmu7i3nFEj0aiB2oANEXpA6yVTZ6CQBwfHxxgXuNtu
         /Nx4uR8/YKBYVeBtEpd8lmpdAviiByLqgNVllcl6fIaiZCnHTt0WNXMauadrQWQR5+oe
         O6AS3mLFXIDry/Xnn67fUNwdpvuvuuIg3IBntK7oZKpaeO7Tgc5hKsB0oRTb910PyIm8
         +h+6WN2Tf4+/TJFiywgEaqi7mne/LJia4AFvItmh1HIn95YfJXPx84xc4LcQVbmH/b4g
         c9K+HbQn7GX4cnP9yGutTyqDwp3H8l6Ro1oQsqOgXSDrmAPfiy3BgrWsndaJQx8oxucP
         LBVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9fmDeV/xvFlZXVotCbXhaYko7AdKEO67ofkZPWBVEPk=;
        b=f43gqGmQmwV/mY8Z8fKYT2y2JDzQszX/I9Kl5YgyMhKsBRjOYRDkyAyoyixWRteMcT
         PtdEUgrXNW8Hst6g22d+nK4bvQBFWqM4cI4/iAMX4hwUjr3rOlcp8s/vNVExXt8lOYp2
         vwcLxHvrJIOlNgmhlSGAg5pBFllUq9z5YWpCz72MNIBiymjHzDfZdNWAs+4YhA4U9DLy
         Dxiu0pO60808nlonq1dfB91ZAOSI93eyVPKkW2bVIRdKU+Dr1R4cJPWyw5/QF7kHk8pF
         UfO263n5QSH+xkspnulP8sg6CZW3cFRkwjF38O4/dqKqrN+LuLJc+YVcuPGazUxoAsqT
         R+uQ==
X-Gm-Message-State: AOAM533XEHAEbfh/uGRvtQlAGuJk8zKlNzLyhjs3oN37Smyr0jqnwjRQ
	rpwr/WZM80HLXpCKUWyBNN/mmhnJjxk=
X-Google-Smtp-Source: 
 ABdhPJxh71spNqnOQHHSoWoiLRiLDavmfQ7ccB1cbq+lxfmETEsxwrwWNs2bCujos6Om8yKttItFyg==
X-Received: by 2002:a17:90a:b382:: with SMTP id
 e2mr17508471pjr.119.1635592566977;
        Sat, 30 Oct 2021 04:16:06 -0700 (PDT)
Received: from keaua.hsd1.ca.comcast.net
 ([2601:202:4180:a5c0:7535:c5d2:16af:d4db])
        by smtp.gmail.com with ESMTPSA id
 w12sm13880162pjq.2.2021.10.30.04.16.06
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Oct 2021 04:16:06 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [honister 09/14] span-lite: upgrade 0.10.1 -> 0.10.3
Date: Sat, 30 Oct 2021 04:15:46 -0700
Message-Id: 
 <6b83ca6c8607f9528144d91f8eb3b38aefba01dd.1635592420.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1635592420.git.akuster808@gmail.com>
References: <cover.1635592420.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 Oct 2021 11:16:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93666

From: wangmy <wangmy@fujitsu.com>

Fixes:

Properly constrain constructor from iterators
(https://github.com/martinmoene/span-lite/issues/69)
Add [noreturn] to throw_out_of_range()
(https://github.com/martinmoene/span-lite/issues/73)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit d46c811305ec13554d0ec0ddc973af2f4b33d7e7)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../span-lite/{span-lite_0.10.1.bb => span-lite_0.10.3.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/span-lite/{span-lite_0.10.1.bb => span-lite_0.10.3.bb} (86%)

diff --git a/meta-oe/recipes-support/span-lite/span-lite_0.10.1.bb b/meta-oe/recipes-support/span-lite/span-lite_0.10.3.bb
similarity index 86%
rename from meta-oe/recipes-support/span-lite/span-lite_0.10.1.bb
rename to meta-oe/recipes-support/span-lite/span-lite_0.10.3.bb
index 15ba099826..0079cf7298 100644
--- a/meta-oe/recipes-support/span-lite/span-lite_0.10.1.bb
+++ b/meta-oe/recipes-support/span-lite/span-lite_0.10.3.bb
@@ -4,7 +4,7 @@ LICENSE = "BSL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
 
 SRC_URI += "git://github.com/martinmoene/span-lite"
-SRCREV = "da49b231a25600b4431e00b564a6a20be95c1108"
+SRCREV = "cbb9c3c5162a0d7018c7b3e053153a04d4fbbbb9"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


