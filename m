Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DA47D5B166
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 22:15:16 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web10.1007.1730142300443202432
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Oct 2024 12:05:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mpdmQD+k;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6e35fb3792eso43508557b3.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 12:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730142299; x=1730747099; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CbJ3GiuGoDQFFpbojUMwfYaXcoR2ghjRnnEjfnsy3CE=;
        b=mpdmQD+k0canq4TWAeC6IeD0enxvyRL1CgnOoc3901GoY0dgwUOsBFRvbOumN+jnfQ
         IWCwHSiYTOt/TPdRRnT8umrlYcMZDF04RI8MIYuNQ8ggITqW4J3ZOq9akbiRfJqAqNC+
         n821M27zTn87DSlS1vYUcD2HlQXW9YA/hZz7hSUIGDRKK5OLbLoH8vR3d38l/r2es194
         vxdUUd1P64iKhRQvNqS04lw3DnZgWkrDlg8xREBzTQgMEgDDQ3kjIt9lAPB3xsVNCcfi
         3dvakAzvc6s1XOxB3RiGvJx3l/wAYMiQIMRCPvQSj1LVzHxcoilBIQcLcVqqo3FaJZbW
         eS1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730142299; x=1730747099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CbJ3GiuGoDQFFpbojUMwfYaXcoR2ghjRnnEjfnsy3CE=;
        b=cGpeTRWPLa9qiC1uwg+0RSHVS51gnC9EetA4U+tHSN6KnMiYE60jfoWJV3WxgDT6N6
         uGRkfSWp96Hk0sa5OX8NvRZUYIowP4O/73+kjOCYqUcja2Qsyyi1a5srEuNCtQvUntfM
         szXF+sOk4+tdyopTCVH1Fd4Eb6h8OcWwr83WEOkNti8oDI1nMD2/p0BOIMoO3welXx1H
         gQzeY1a0ipyJGELNKQtOkCkdHcJd6Scr0v6k9SZ3tXWlIR3Z0jKf8uKVzE8dGOIY0XB6
         FNUa+9+MNvjmyUxljeB9SnOBMN0eQ4ZtV9pX/zMktA+S9rdJVV2qErnkvRmrhzF499g1
         ykfw==
X-Gm-Message-State: AOJu0Yz3rrDBPPvC2gdzhYMtF5snNtgxwCUbPoDQh+/zfETV3DsX3Drm
	vI5jyKDI9lPWUg1LQIDziGbvsQoOYgT5/vMhmj0HftLoxLsD8OE66JR6YA==
X-Google-Smtp-Source: AGHT+IHJKxeKyCGVCyiGFbLQ44fImAwLfbGZfJKnk0Ja54aNEvMv8VuPlToqs9eHDC3n6BLbY2HEbg==
X-Received: by 2002:a05:690c:e:b0:6e2:7dd:af66 with SMTP id 00721157ae682-6e9d8a3d32emr89654167b3.19.1730142299068;
        Mon, 28 Oct 2024 12:04:59 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e9c6c187e4sm15557237b3.62.2024.10.28.12.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 12:04:58 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-perl][PATCH v2 09/22] libfile-slurp-perl: Use ${CPAN_MIRROR}
Date: Mon, 28 Oct 2024 15:01:45 -0400
Message-ID: <20241028190444.10522-10-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241028190444.10522-1-schonm@gmail.com>
References: <20241028190444.10522-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 22:15:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113300

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/libfile/libfile-slurp-perl_9999.19.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libfile/libfile-slurp-perl_9999.19.bb b/meta-perl/recipes-perl/libfile/libfile-slurp-perl_9999.19.bb
index b9ef4c8bb..7a6a9aadd 100644
--- a/meta-perl/recipes-perl/libfile/libfile-slurp-perl_9999.19.bb
+++ b/meta-perl/recipes-perl/libfile/libfile-slurp-perl_9999.19.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "https://metacpan.org/release/URI/File-Slurp-9999.19"
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 
 LIC_FILES_CHKSUM = "file://README;beginline=37;endline=41;md5=255fbd5f98a90d51d9908d31271ae4d4"
-SRC_URI = "https://cpan.metacpan.org/authors/id/U/UR/URI/File-Slurp-${PV}.tar.gz"
+SRC_URI = "${CPAN_MIRROR}/authors/id/U/UR/URI/File-Slurp-${PV}.tar.gz"
 
 S = "${WORKDIR}/File-Slurp-${PV}"
 
-- 
2.43.0


