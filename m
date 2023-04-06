Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7E6AC77B6E
	for <webhook@archiver.kernel.org>; Thu,  6 Apr 2023 06:54:33 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.152384.1680764067748687553
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Apr 2023 23:54:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Y+aC6AUJ;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id h12-20020a17090aea8c00b0023d1311fab3so39756507pjz.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 05 Apr 2023 23:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680764067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CIxuQuxr0CH/ATa+EvjcbOk9/zKzHYeN7QXpzu9JTIY=;
        b=Y+aC6AUJxBagdtA7u3tedg34rfXJ2/vq1qdhsdQ6lhKB2wA6tDwkN0gCHGl/4hjpc7
         bhe4POyyc6OU/Byyyeq/POcyogjAEZeH99ENRFo1PFfhshZkM1fpYMUN/ULGaorohIkH
         F+NWGniWoynuhwHCMbFkfW0/W7iqheAntA66OFjI486sYUTGD1dM4HmDHsgsqBblzvc+
         LeCa1dXSo+yQV14P3+Wfg83BE4CMVbTq7qG4jbpSdUrkekTqtQ3UM80Lqdszfgk0vkOm
         EE4g4868MPNMKshD6BCCx+StCMztmVZYODe6T0+U8SRwVl9KSQoV5xea3kg0Xom7DMgt
         EM9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680764067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CIxuQuxr0CH/ATa+EvjcbOk9/zKzHYeN7QXpzu9JTIY=;
        b=ddWuhIULuVylbRW9soRkHh5VfLYU6mYVCpH3c6+DckOC49YNMipJaPX65XTldTs4jY
         QJcRknrI6KXJtPQ/kCMJbL8dxl9ez5s/gLwDCl9Ld5E1LGG5Ys8sqDkVNl0GhzaG46zi
         aT466IVbR7SV0aFB8npC30dvkkR3ZdhRPOj6Xh7GdA6dCPkEje6ALtWMMaaeVOgC3lDc
         15ZyJVWmNACNfGaHx1U8kpZ90cfezpOYNjLyimidFhoxydoKP+GBlq97kDSp0VeoNUYa
         r1bdViU0iFton2ETdJtdflBpL60GmmHxWXEueOeZuckBEuCJZfq/Lj0jppJ0KpGl22bj
         X5VA==
X-Gm-Message-State: AAQBX9dRcnCAQKlFTdv4CVEdRz5LGNfEfG0bLggfwqb4AbaZtxbz8CnP
	zA3iVD8o8DlDZhIbOCp4C5yRqBzUkxVicQ==
X-Google-Smtp-Source: AKy350ZQfTzUik7LbIaTi9KnbRwzse/rTETOCTzxXL93xEz+GoDv7ahfNI3bhNGNT5+dvImprEwCpQ==
X-Received: by 2002:a17:90b:1b03:b0:240:d275:d61b with SMTP id nu3-20020a17090b1b0300b00240d275d61bmr9750978pjb.36.1680764066997;
        Wed, 05 Apr 2023 23:54:26 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::26f8])
        by smtp.gmail.com with ESMTPSA id y11-20020a1709027c8b00b0019c919bccf8sm648703pll.86.2023.04.05.23.54.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 23:54:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 4/5] ptest-packagelists-meta-oe: Add libtinyxml2
Date: Wed,  5 Apr 2023 23:54:20 -0700
Message-Id: <20230406065421.767010-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230406065421.767010-1-raj.khem@gmail.com>
References: <20230406065421.767010-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Apr 2023 06:54:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101969

It takes < 4 seconds on qemux86_64

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/conf/include/ptest-packagelists-meta-oe.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
index 590e0e6e9e..81e0779ffa 100644
--- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
+++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
@@ -21,6 +21,7 @@ PTESTS_FAST_META_OE = "\
     libio-pty-perl \
     libmanette \
     libssh \
+    libtinyxml2 \
     libxml++-5.0 \
     libxmlb \
     libyang \
-- 
2.40.0


