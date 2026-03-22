Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33BF3FC72C0
	for <webhook@archiver.kernel.org>; Sun, 22 Mar 2026 10:51:51 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28530.1774176707378240441
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Mar 2026 03:51:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d/wikz3f;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-354a18c48b5so2592962a91.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Mar 2026 03:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774176706; x=1774781506; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p/IXlsScGxINDGn6HqUI5bsAuO3euU7fI52STecF/1A=;
        b=d/wikz3fWITIyem+BfvpPPxSK1s/i/GTsQfGwz7E6GgjWs/npaMb3wbo7BjLstnVJN
         mZodbgIp18fEjaeGcieuB574p5Cuv6peYWyHB030y8JgeuPDgBJuaADSx8xfc8gfRMuf
         kAeoOvaZbtaBU9XR96Run9ra83boQ3m6Q/oYwyJPddkHGIGfYgt8Nc1gsGdZkHcALXLy
         tO307eJp5KR2faRZc7nW/QTx8U6oLahS8jKPIl8mDCgscblMHi/HdqJZKW0ONYC4NUbD
         5lW0/cemuVp5NLckmx3AGwEf6C1SM6MmOHMJ5EeWuJhhTgpj0NftearVMxVVQeUTbM09
         LsAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774176706; x=1774781506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p/IXlsScGxINDGn6HqUI5bsAuO3euU7fI52STecF/1A=;
        b=IUpjkoLoXNgb5QdXhPooMmDG7/dzoeoJ4/zVVR1TDsBYQWpVxG6FXCzdoxWLW0SUF2
         gAaV+eHBU50wKy5DlWnuaJWOHxLMnnkyV+NCb0N1pSLATJdTl6im8YnyryBLsjpcQ/mN
         zsjvv3BX25m5JSAJu+Mn3+quDo93X5KIQgPIxqCPMrIZ+mabWImd962AjpBxfRJIuYxH
         YNqUGvDrepI41ybthRBp/KX9Ip3/lsa6bAp3hPROBPbXt+HHoNMCTbS4Hf3SvRHNEhFV
         sfEjaIvth2RoE1nDue0NX575VjjVDBVrgYBQE97mX5QCrbfWyWj4k3edIJk6jVYmpibr
         73vg==
X-Gm-Message-State: AOJu0YzLUDHR0VArZOOlcYfsEghPk2QD+nywH5bPRtwxX4VvDJXRq0EL
	oWDJWs7h2nJvAc1UCboju2nkn5ubeiz6vfkOC3ADdAu/8vhdZTeNWAYlIUW1sHi8
X-Gm-Gg: ATEYQzxZk2BRP66F4F70NEDL9lbiKq7wl4WdlxlndtNaeEERA8PP92V3S+ovHfbW4Vt
	5vlMtFZsFODUCMJNp95uEGkbRJ2Q5d7TqAH9mGfaiVcNJ+EsqZRbZ8dsdWBJ+fFd14bviyWZzpd
	kxt8ic8p16pIiksaefF+hx44yGxD8WU1qK2ZDtWSxiwCyBMyYNgpONHFOebnjvJwpQSq4Vh1siY
	fFoLL2SDraZgEVz64WHejOh8J63+YKl6gP6bz2n0vZylzv213w/18ZMNhkOE2VmpgHW+dHSPYzk
	HD89KUN8bIc0DEB3kl0s9gefLz0NRzcDKVuKLxZFQbu/cy391iF5C0Q06icSrkfNmHqegm61V9P
	z7Sef3yUU9f/zk9kfDsjuzxurOhJ+lGZr2o4SjLe8dFvs2Uu1Om5I8BhJiroE9C2Rq1QWxYejBy
	tS1rCVP9mXfLAyg7Izbn7kGMtxiDA2V0iCRks=
X-Received: by 2002:a17:902:dace:b0:2b0:62dd:3a80 with SMTP id d9443c01a7336-2b08271a32emr87039845ad.17.1774176706576;
        Sun, 22 Mar 2026 03:51:46 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.14])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0836744a5sm75613895ad.63.2026.03.22.03.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 03:51:46 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 2/4] imapfilter: upgrade 2.8.3 -> 2.8.5
Date: Sun, 22 Mar 2026 23:51:23 +1300
Message-ID: <20260322105125.528264-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260322105125.528264-1-ankur.tyagi85@gmail.com>
References: <20260322105125.528264-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 22 Mar 2026 10:51:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125480

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: copyright year updated to 2026.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 89b961c889ce885597ca669150d998470d05bf4d)

https://github.com/lefcha/imapfilter/blob/v2.8.5/NEWS

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../imapfilter/{imapfilter_2.8.3.bb => imapfilter_2.8.5.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/imapfilter/{imapfilter_2.8.3.bb => imapfilter_2.8.5.bb} (80%)

diff --git a/meta-oe/recipes-support/imapfilter/imapfilter_2.8.3.bb b/meta-oe/recipes-support/imapfilter/imapfilter_2.8.5.bb
similarity index 80%
rename from meta-oe/recipes-support/imapfilter/imapfilter_2.8.3.bb
rename to meta-oe/recipes-support/imapfilter/imapfilter_2.8.5.bb
index f4905e3c0b..754e793faa 100644
--- a/meta-oe/recipes-support/imapfilter/imapfilter_2.8.3.bb
+++ b/meta-oe/recipes-support/imapfilter/imapfilter_2.8.5.bb
@@ -1,9 +1,9 @@
 SUMMARY = "IMAPFilter is a mail filtering utility that processes mailboxes based on IMAP queries"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=f8d2fc4954306888fd0e4b27bef83525"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c9e8d74e78283c6319317d3cb15eded4"
 
 # v2.7.6
-SRCREV = "72f7fa621357299bb6c8f5d29b4efbafcbd34bf7"
+SRCREV = "23b693f7f7cad8b459beb5cf748078f9cc0e5dc8"
 SRC_URI = "git://github.com/lefcha/imapfilter;protocol=https;branch=master;tag=v${PV} \
            file://ldflags.patch \
 "

