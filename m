Return-Path: <troth@openavr.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B0D8C433EF
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 15:22:52 +0000 (UTC)
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com
 [209.85.166.179])
 by mx.groups.io with SMTP id smtpd.web11.21062.1646061771391203719
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Feb 2022 07:22:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@openavr-org.20210112.gappssmtp.com header.s=20210112
 header.b=7NqxMkyD;
 spf=none, err=permanent DNS error (domain: openavr.org, ip: 209.85.166.179,
 mailfrom: troth@openavr.org)
Received: by mail-il1-f179.google.com with SMTP id y5so10185131ill.13
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Feb 2022 07:22:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openavr-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ti4Z4N5LZr5ksd3RjwjuHaH981Q2eDEXw3twuVYIOtM=;
        b=7NqxMkyDx64JgLcxcNooV2n8RsxGVZTqiDMWO86rWgTekYZDjDs4V7mL9vMYvP3+09
         fHsne7ISxDGzuraQDRcTqxO/iOKhbpz60Njpz/kXcEjmNIOkJgtPifSM1v4dC5s2jJO+
         ixST59Sli/HfM6lPEyv5B3/I7FT+8xO/XbMh2R8xLVL1Zy4fpQUc118/XvlEgXoVSzUW
         6mrTa6TveBL0mG9/C1EY0iWznXKOyT/I80KLH1j7TQW9Los4MIWtyKghx0GcZxrGeR7x
         qvtkYZBZCwXvMUHng8TO6Iq3fBEDmGryB0SzU5+LeVOa8Onh4zw8p0eN+b/qTfsJFIZe
         PEEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ti4Z4N5LZr5ksd3RjwjuHaH981Q2eDEXw3twuVYIOtM=;
        b=jTm20ntr571QtJU7RleKHG8i3UdN7QxdR8vpOCNiaJL0r3sp5yGrJ6NdkU3REr+Qpp
         Vw0E+NFYlFzqDiyi6gnoeWZ9Y+U4MCA6AeBzmcQcdLxCto0btmYI5wGt3hggpXpfMRmR
         I5JImI0v5sehvO2+dozKD45TtyEhMN+VUX+B3l29wDWKsvjPH9BwriioRIByc2+73m5M
         wYes2DuCX/48Y3z4ZzHop1Be3+/VOi+QuAEhJl1YuEFqKIpI1OjpBcWZTubv7EzPZ++z
         U/2iXLZ08noVxuE5iV3N6WLczETMS8KO5BU8tadiXS4u77sX/Sddsn95WSqiZ0ixLmru
         ZS5Q==
X-Gm-Message-State: AOAM530w897ZYalSk1ywj5nRjK9FcAxJEh7eVaOMiFnArqajfrOZ7ofK
	HYam13z2Md/9qlzciJOBV7K1sL9gQu9oKXV8
X-Google-Smtp-Source: 
 ABdhPJxFYC4WKqwe4k8jbVDL+0dNvhe5DkfQPOKnNd9mDg/XgpZbnP7rtaSPe+nmAblHiW2HhsmyjA==
X-Received: by 2002:a05:6e02:1c8c:b0:2c2:4647:28f4 with SMTP id
 w12-20020a056e021c8c00b002c2464728f4mr18927665ill.79.1646061770491;
        Mon, 28 Feb 2022 07:22:50 -0800 (PST)
Received: from beast.bozoland.org (c-24-8-35-226.hsd1.co.comcast.net.
 [24.8.35.226])
        by smtp.gmail.com with ESMTPSA id
 h1-20020a056e021d8100b002c15a824df3sm6183670ila.38.2022.02.28.07.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 07:22:50 -0800 (PST)
From: "Theodore A. Roth" <troth@openavr.org>
To: openembedded-devel@lists.openembedded.org
Cc: "Theodore A. Roth" <troth@openavr.org>,
	"Theodore A . Roth" <theodore_roth@trimble.com>
Subject: [PATCH] pyhton3-marshmallow: fix wheel build
Date: Mon, 28 Feb 2022 08:22:31 -0700
Message-Id: <20220228152231.1050011-1-troth@openavr.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Feb 2022 15:22:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95579

Recipe does not inherit pypi nor would PN be a good guess at the name of
the wheel. Set PIP_INSTALL_PACKAGE appropriately.

Signed-off-by: Theodore A. Roth <theodore_roth@trimble.com>
Signed-off-by: Theodore A. Roth <troth@openavr.org>
---
 .../recipes-devtools/python/python3-marshmallow_3.14.1.bb       | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-marshmallow_3.14.1.bb b/meta-python/recipes-devtools/python/python3-marshmallow_3.14.1.bb
index ddfe4b99c..dc5f17388 100644
--- a/meta-python/recipes-devtools/python/python3-marshmallow_3.14.1.bb
+++ b/meta-python/recipes-devtools/python/python3-marshmallow_3.14.1.bb
@@ -15,4 +15,6 @@ S = "${WORKDIR}/git"
 
 inherit setuptools3
 
+PIP_INSTALL_PACKAGE = "marshmallow"
+
 RDEPENDS:${PN} += "python3-core"
-- 
2.25.1


