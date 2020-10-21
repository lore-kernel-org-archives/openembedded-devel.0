Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web09.9794.1603276419918560568
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2020 03:33:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bytesatwork-ch.20150623.gappssmtp.com header.s=20150623 header.b=HR8gRmlS;
 spf=pass (domain: bytesatwork.ch, ip: 209.85.208.41, mailfrom: daniel.ammann@bytesatwork.ch)
Received: by mail-ed1-f41.google.com with SMTP id x1so2077579eds.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2020 03:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytesatwork-ch.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=6JAE+WQCnzmSSSMCU00RAG7+c45Rhc4zalmXi9UvVPE=;
        b=HR8gRmlSZznrjuD+mYSjRFHntFCAOEFrALjLsXDnsDlkR0KBh5ASxI+i4O4U+EPGNJ
         oLF69TBZTQLe2nDMd3khH3NyzEhRvDXSbF8RzM+XAZTsqXORytSeRfGhn5eoqQPJLhUi
         Ox2ejfmUq+sxFCzznjgDPCofagbPtcVbpDh9gZ8l4ikHTsR9OnvHgQT77lKrPa1d1dv/
         FaN8hJKpDtxs6shjIJ93wVPrCjxTzqOC6cNVFSmvuiALa2OJiS2MEExdnOh6gstuRe3C
         xzn75Wx27k4YlzEK5iK1prC3TtMYOylFFtc+LTJyruY74FP3HRRkQYPiXHvM1ikW2ElG
         l4zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6JAE+WQCnzmSSSMCU00RAG7+c45Rhc4zalmXi9UvVPE=;
        b=YU9ft/I17ZO18lU19DVDEg1x5wgxPZUa1+UnQ31pxwwZruRl2kTdZanNAMoDG1CghE
         tzwb+8RSZq0R2zuIa9sDxdfbAVxuK3cxj0k/iAKvgJfX7cpOk00SNprMf86+O1VPDFtB
         v7BhUuUOqa8ljbj+rJCZ5DlcLwgidovUyoDUvH0WMXnSJNvFktF7ysOsWHjhVFRMFtxa
         29yQ+pR6HK2bqmh41Af8A2Lb/Jjpt0VruZuE5VRmYiRJi+voB/pp/M4jkSwvWtQnPDqp
         HrulgK6d2jd/ZGATgl1I7tRC8+lUOntKsPXHYOWVj43YbFsTAHZtp7LHxJExyAbzK0hW
         TcAQ==
X-Gm-Message-State: AOAM530a59RRfA6akWzaBy9OX6OPKx0fpQHpXqOBhnWYRknFgdTFxXZ4
	9lE9GXFTpecpPgG9Ftrr9z4H4JzMAGOHw2YX
X-Google-Smtp-Source: ABdhPJz6KODoM6hjC8XzrmFwP8Qg+kYRl23fI1us9zZqOCu8oF2/dSN7qNb/ZMV+U3lBlgdK3Qheuw==
X-Received: by 2002:aa7:dd53:: with SMTP id o19mr1781600edw.370.1603276418170;
        Wed, 21 Oct 2020 03:33:38 -0700 (PDT)
Return-Path: <daniel.ammann@bytesatwork.ch>
Received: from mimas.bytesatwork.ch (162.40.150.83.ftth.as8758.net. [83.150.40.162])
        by smtp.gmail.com with ESMTPSA id k10sm2086348ejh.32.2020.10.21.03.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2020 03:33:37 -0700 (PDT)
From: "Daniel Ammann" <daniel.ammann@bytesatwork.ch>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] dhex: add homepage
Date: Wed, 21 Oct 2020 12:33:15 +0200
Message-Id: <20201021103315.23613-2-daniel.ammann@bytesatwork.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201021103315.23613-1-daniel.ammann@bytesatwork.ch>
References: <20201021103315.23613-1-daniel.ammann@bytesatwork.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Daniel Ammann <daniel.ammann@bytesatwork.ch>
---
 meta-oe/recipes-support/dhex/dhex_0.69.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/dhex/dhex_0.69.bb b/meta-oe/recipes-support/dhex/dhex_0.69.bb
index cfbb2caaf..6f8c86a16 100644
--- a/meta-oe/recipes-support/dhex/dhex_0.69.bb
+++ b/meta-oe/recipes-support/dhex/dhex_0.69.bb
@@ -1,5 +1,6 @@
 SUMMARY = "dhex is a hex editor that includes a diff mode"
 SECTION = "console/utils"
+HOMEPAGE = "http://www.dettus.net/dhex/"
 
 DEPENDS = "ncurses"
 
-- 
2.20.1

