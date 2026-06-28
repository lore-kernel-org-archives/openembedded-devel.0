Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78FAFC43602
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 08:12:16 +0000 (UTC)
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.69140.1782634333525973514
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 01:12:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=VGyJK2n2;
 spf=pass (domain: gmail.com, ip: 74.125.82.177, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-30bbe98c3f0so6037699eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 01:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634333; x=1783239133; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4kRrW1++s1kRzydrpUfh2xj7Ap8/53Y/qRMk/tGJei0=;
        b=VGyJK2n2d40D8ID+t4U6mC6BukqOGQGheE4XWov6/CqVBXa3M3CpOcVJdloGhJMU4M
         JzTNCCY24t4KTKJxi5jFJ2JqlP4mglvLixHybsSC5BkcJnfEn2ibWS+m/MScg54d+k/L
         y0UaZoii1pjW7EY1xKD+3gK+lVqm9yjMD0o9qgjm6UWqJVpk7mkAUvKVxsDNwUb8Q4EF
         mmRu/hqcqhqfIVLjjjdJamD+jAg7+FQxLxmE1tA9I44A9muZhbEikgPw0vKL/TbrDlQw
         fwPiiG4S1Y9h01XEwnBVvykkQ2Px9rqkWYjUaLZ6ZsXLwGEaPKXomrrAJ/3IUM/fRdo1
         eIyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634333; x=1783239133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4kRrW1++s1kRzydrpUfh2xj7Ap8/53Y/qRMk/tGJei0=;
        b=dOer2fcCDxxR/g2SlpyV+vj7GA8RhT8UijqnjlztZuIRvR3R1kcoNRSkz8g3bCPACy
         3HseNpR/A8oNULUTXDDWG9WvmVh6jzh9bNG4vxr93KGP3JDX8fPVy0VKTEaLhPSHJdCy
         HxekKXmSG9+D1I4CrdcvyrWVVb3eG5x4+T6t1S6vYXgA7NJRzGu2YzTdeegeI4uSv4h2
         OQgM04OnHOZbC5Pwa6Qnra9ijQQOrmOzo/XPsRVmX5ODRbO9Ox+yt5FNRBiwckRRGLzN
         JdItcAi7nCCB/nkHv4OgtfHaED/r7rK9EB0THbIW7ERfX5JTvyuHFa1L7a52NFXmXelQ
         pGFQ==
X-Gm-Message-State: AOJu0YxYrwZErqqMaeF6EQK+FSVs92gLD9gXO4J8fcerCW1UHEKq0sP0
	S2As8RoIJANt4uZ26kEhH1gJ8nBCtDIEQOWCobWHEvnvIhuabIX7W/ZvY9Q/OnM7jD3OWQ==
X-Gm-Gg: AfdE7cmFzb84SpQtkKHj8v+XtkV2L9/JP2W9RaocEZpRfWQRBg7e6qRJ3u874qdNVkH
	wyv6bOkfhO6twrF2xz4U8J7cLCNdLgSe+Yu35GiV3fLgkwuiX68rWFz4b76FmW/gKo2IA1d8QQf
	eFyC6iw6rr6xHitn5AofSZvmOr3ad5+6VEnAyHNmD/DR6bAuYWnV8eCFYvYpQKH+ZLYE2CFSghl
	SGPmLWVJxHHvEzvsfCyNovfrhYzIaroAeOvGtPGmLZgO8icOba+FBIfm3HEqLCaeF64LSHsXyBD
	L3QxUhxdygQugOhhwWmTqTpsdRgHXlR6Cq+wNC8a7ZvCkmnCJ2cvbwLXnWc6oOu9Fb4Bgzk2Daz
	pC1WsNRXlC/dTtL4wnWZWsluSikJBpC5ywkjJvKb/nNH+f81O/xVqf7LFEL2Mdiata0qYQnP/L/
	0WBbs+z62hG1nLNPLg1AV8xdXFawey2qJdRzmuwhcSat1WJosd1lWBzWGwS0kDqm1tQt9aoZXXs
	KL278m9jgjNVaHep4UH4eL6lLg62ApVxSkRhiAkXtPffTL7ATqwPDQ3GObGBa+st1gCoyV/3g5P
	cjK7CzvS0/JUs/VT49AJK5qw9FRM3g==
X-Received: by 2002:a05:7300:6904:b0:2fc:9ae6:e5a8 with SMTP id 5a478bee46e88-30c84d10a57mr10939294eec.20.1782634332802;
        Sun, 28 Jun 2026 01:12:12 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ea81b39easm6306040eec.31.2026.06.28.01.12.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:12:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 052/128] cfengine-masterfiles: upgrade 3.26.0 -> 3.27.1
Date: Sun, 28 Jun 2026 01:10:03 -0700
Message-ID: <20260628081122.178348-52-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
References: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 08:12:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127862

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...ine-masterfiles_3.26.0.bb => cfengine-masterfiles_3.27.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/cfengine/{cfengine-masterfiles_3.26.0.bb => cfengine-masterfiles_3.27.1.bb} (93%)

diff --git a/meta-oe/recipes-extended/cfengine/cfengine-masterfiles_3.26.0.bb b/meta-oe/recipes-extended/cfengine/cfengine-masterfiles_3.27.1.bb
similarity index 93%
rename from meta-oe/recipes-extended/cfengine/cfengine-masterfiles_3.26.0.bb
rename to meta-oe/recipes-extended/cfengine/cfengine-masterfiles_3.27.1.bb
index d8869f20cb..d85e75d916 100644
--- a/meta-oe/recipes-extended/cfengine/cfengine-masterfiles_3.26.0.bb
+++ b/meta-oe/recipes-extended/cfengine/cfengine-masterfiles_3.27.1.bb
@@ -22,7 +22,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=22b3189b9b79f1de35860dcc299bb6bc"
 
 SRC_URI = "https://cfengine-package-repos.s3.amazonaws.com/tarballs/${BP}.tar.gz \
            "
-SRC_URI[sha256sum] = "fc8b0ad20e803e0d1e9dcda7afb2f3f5110357ac0e553ed95cf2cbea9652451d"
+SRC_URI[sha256sum] = "fd32c1255c0114d55929b496a15a6a6f48231f108be23f50ad3b8abc2e734ccf"
 
 UPSTREAM_CHECK_URI = "https://github.com/cfengine/masterfiles/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"

