Return-Path: <ninette@thehoodiefirm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBFB0C2BD09
	for <webhook@archiver.kernel.org>; Wed,  3 Jul 2024 18:11:47 +0000 (UTC)
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
 by mx.groups.io with SMTP id smtpd.web11.57960.1720030304046586178
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Jul 2024 11:11:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thehoodiefirm-com.20230601.gappssmtp.com header.s=20230601 header.b=Tki0ctvJ;
 spf=neutral (domain: thehoodiefirm.com, ip: 209.85.161.44, mailfrom: ninette@thehoodiefirm.com)
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-5b9a35a0901so2001822eaf.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Jul 2024 11:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thehoodiefirm-com.20230601.gappssmtp.com; s=20230601; t=1720030303; x=1720635103; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rka3y7JqWhz8tog+sWzIbYVXRCnYp0D9oWio1Io8E+0=;
        b=Tki0ctvJQoVBFgETJZi5ivfjXIKArNkMP7FJ/gULTuBoiIMjsiD+r5o7M1HXZpdfSS
         PpwZTkHk8AFFkEScdxk687Bmu0zHphx+wp5P/KdRMPvvVFLpNhwCtnuNRwZat+J7sRjf
         zP7PYAr49/DNAxzhlJ6IK/CSqBvdcRrlcPmCJ+YjI17pukF9eqF5czmXWbTLxQ0TCoPb
         QUDfdkXyVZmhWgauWD5wCe0bzaNekilTkzrzA0oRdtbTd7OXZj7ByTUDEfUxn16G2ZK/
         qdbZfpQvBmc7iHxAYzG/x2JH12lv+cQHnln8ppw70r1PGbltb5WixwKkz+Cww1sZKyE0
         e77w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720030303; x=1720635103;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rka3y7JqWhz8tog+sWzIbYVXRCnYp0D9oWio1Io8E+0=;
        b=dtpQJ2BUsKjH1zoagCgsfZIjBZjmQMHdU+KAQmx2TgLa17HPHAOyDFZ4zNGSLy5e0K
         A9H/82M6gde0Xfo1NFApW5ToL1YJSLB4U1ec1GrkWMO04rotregytDMKbtZv5Tf17PZk
         C+bwUItfCkgM1cuJAlOSUi8izMKcIDF9hG8V4Do3NXlozCDJkFsRERLWMZsWJQgVuxx9
         LaFkJZY8t4mB0fArNmawuFE9rAKlP0QpyJsnonI8uM+I+q82sp+DqW0fBbbvcbzuc4lZ
         QYBIVN7UPga1+NHgQF6Ki0Afx2I+AqN83vO/isfYdyWi004gBTQP9yLNt2mu3i0rg6p2
         B//g==
X-Gm-Message-State: AOJu0Yy6moXTRCkvZl4hGMROUe/Ip2sQzNXgNTgWumozaNiQ7YEd51C1
	82bvYbsQW/gC8mS86/VrPg7NR2z6XyNlmoa7tabIq4edHeZa5jiV8jkIcmz5bz9DWTfA9WYiujh
	Q
X-Google-Smtp-Source: AGHT+IFMuvrWprUa8eaMW+ZjjURSej6QgvQBeh1oUm4agRIEYMkF4aI4iUQ+qmaa7iYj7oHHBJC7FA==
X-Received: by 2002:a05:6870:8192:b0:254:affe:5a05 with SMTP id 586e51a60fabf-25db34ca076mr11166840fac.21.1720030302357;
        Wed, 03 Jul 2024 11:11:42 -0700 (PDT)
Received: from localhost.localdomain ([50.54.151.77])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70803ecfef2sm10720352b3a.125.2024.07.03.11.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 11:11:42 -0700 (PDT)
From: Ninette Adhikari <ninette@thehoodiefirm.com>
To: openembedded-devel@lists.openembedded.org
Cc: engineering@neighbourhood.ie,
	Ninette Adhikari <ninette@thehoodiefirm.com>
Subject: [master][PATCH 0/1] yelp: CVE status update for CVE-2008-3533
Date: Wed,  3 Jul 2024 11:11:38 -0700
Message-ID: <20240703181139.92635-1-ninette@thehoodiefirm.com>
X-Mailer: git-send-email 2.44.0
Reply-To: engineering@neighbourhood.ie
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Jul 2024 18:11:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111241

The current version (42.2) is not affected. Fixed in 2.24

Ninette Adhikari (1):
  yelp: CVE status update for CVE-2008-3533

 meta-gnome/recipes-gnome/yelp/yelp_42.2.bb | 2 ++
 1 file changed, 2 insertions(+)

--
2.44.0


