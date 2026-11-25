Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37959.1795594127732755960
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Nov 2026 00:08:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=obdjIxPk;
 spf=pass (domain: gmail.com, ip: 74.125.82.175, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-386bd881d39so3908893eec.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 00:08:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795594127; x=1796198927; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zgGqkQW4mlRCdqyiUeR2QpOz80OHATdHBgLwfq+H65Q=;
        b=obdjIxPkzbuFozff51pfhFYiZmholXhf8G3zg0OCPN/5tnaupQB2derCRYC/YnRm4Y
         jIQs6PAyvGA+1URmW+loNLEvVPMvF3mj5fJuJTK80Mmypns4TTarzqPZW8W8KZ+YyzcH
         qK2wdzIsoP6RDgE7wZNNnSKD2lnBsMooXOBELvdlw/3RlHr5xSr4xB7YTa0fBluctSiY
         V81t3k6hmY0UUsqr9LwUa5fPjjGCmZ/UnhHgi22QLvlaU0u739SVCc9N3bunRzEn3Rqa
         kyetVTjAFzXXcCCeriG3L3JLtjb99j9lf/qdqyond4/gJ9tQHJVbKRHknPdMUsmvJ3JK
         Ep0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594127; x=1796198927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zgGqkQW4mlRCdqyiUeR2QpOz80OHATdHBgLwfq+H65Q=;
        b=QtisJu9h52cu0L1giKcw0p4wKsWV8w05cVUZ5uqHzfNHqjPzrbuyuJZ5NkUkV6B35h
         9xEQO1mupi0gPLTTPyIF2pYYazTWpgmqMdRFGf1MeUuVGaps+BNOaUajmkPs8wyGU2h1
         xCMtE63e17fg6/xVkprjhN8SmA+eDBJv+LVDTntdEFC9x5fiGEsYmQzFYB4/2yAIn71U
         gRPU/bsWIv3dHzjq2q4kCZvXkqqrXgjimFBiiJiTbCd8d2zFSh+s1yJsp3KVGLuLcWas
         TqylOIvPFSTtDCdefrwzvcB+KK23jPxdPK9UkqSJ6/W6fOOLdGBz2+lhiwhQWG8/ayvP
         7sww==
X-Gm-Message-State: APuU4Z8hSFYz/Gi/B4o6lCHjt+7Q39ZO5iw2v0YsXApZQvjB39iyDpZx
	8xiHa9oE4wnuqMg3GEhoHLjW6yKQbE5C7lXm/nMFWMRj3QwCshc0bFoDJETfpOXz
X-Gm-Gg: AZFdTZe4YV+c3J5TAWkJ7Jd+J+xW/pTWWOr4qo+2zkXbXb9WpYBFUl+vGmOrTtjEQ/p
	i2nuPXSm+28y8NpuUgqIZjn6y9/NT9a4l+6Q8ockwZdd1IIrzof3IsJnaFaTEOHRYIUJTnz7Oyg
	faHeIQipmRuwOUqxS32LMtbDNe6GrLmuFAL9Iv7uKcyZgUAw2Ow+UL1DZlyD9JkwYZkzXXpT0hc
	rkVVw2xs91poPsalSx6CQAEvASx83/3Ev/ScHUi+13oBbhfLK+m0Mr/3dTDCysKonBqRNRM+9wg
	b9SarnxpcORS8+Jc0T2+TZ6c7OFvWXeSp7373Kqj4IFeJjrC0U7s3sDEhrWovl2b4PudaVhVtz7
	wSv+m594mTwI35hlL74yOp3hZd2eO2cmDty7XoJ2EN3gwNQXW8vJRweTLoAI12x9QcvTyduEXuY
	7F9tnlU9uDbBcuf10cCEnhZSbICZY6gjppfE1BjfAVPvv/dtHJkiBuPSVFJYk7iSYMaJ2VYIjBQ
	FbIyv9lvrBrO3SJYY+euympydod+ll8YqmFziQpvef+CqQK11cdNZQeO2fkMHOX40XjImwfqrCl
	Z405h9NzsL6KmkiwxR4nXAi7aja6nNVeSTfvuvI34ci5RWqcIkLca/rkFS9Ie5VFCFN8REozfYg
	4NWnUsA90ZYS720FOC3Dr6odAtHMv0etSlrMB5thtsuGDLwLBjxHOLjREVJYkhFeGFja0Kw0fvU
	46KG9JLo8hnSJAhy2boC+RQBxaLT00SN9/ZEIi+i8u3Fj0OFjjRAR7RMbO+T+RBlx4SHknWxhjF
	ieOFqU4flbBLcJZALu6gbyJINfIVCwuCpQYycwACeCz06c+vHDrqeZLBUccKj0G2tYgvw/w6pUh
	vV13
X-Received: by 2002:a05:693c:60d4:b0:360:5f7e:2eb9 with SMTP id 5a478bee46e88-3857111f65amr19576098eec.32.1795594126907;
        Wed, 25 Nov 2026 00:08:46 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm90997971eec.3.2026.11.25.00.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:08:46 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 52/55] rsyslog: Fix upstream version check
Date: Wed, 25 Nov 2026 00:07:08 -0800
Message-ID: <20261125080732.2419614-58-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
References: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 08:08:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133055
Content-Type: text/plain; charset="utf-8"

The unanchored UPSTREAM_CHECK_REGEX matches any dotted number on the
GitHub tags page, including ones from GitHub's own page markup, and the
check reports 11.28. Match only tag links (v<version>).

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-extended/rsyslog/rsyslog_8.2610.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2610.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2610.0.bb
index caee233b2d..eb46ef086a 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2610.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2610.0.bb
@@ -33,7 +33,7 @@ SRC_URI:append:libc-musl = " \
 SRC_URI[sha256sum] = "7bdf95e81ea6c0ee5d586342d57d2a6e395b089fb3c67318a0dc555816de404b"
 
 UPSTREAM_CHECK_URI = "https://github.com/rsyslog/rsyslog/tags"
-UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
+UPSTREAM_CHECK_REGEX = "releases/tag/v(?P<pver>\d+(\.\d+)+)$"
 
 CVE_PRODUCT = "rsyslog:rsyslog"
 CVE_STATUS[CVE-2015-3243] = "fix-file-included: The shipped default rsyslog.conf contains the fix"
