Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28395E9127F
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 07:00:09 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15261.1770274808031252590
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Feb 2026 23:00:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IHy+VyiR;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4805ef35864so4532385e9.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Feb 2026 23:00:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770274806; x=1770879606; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FLtYMa/0mFLZQzN3dEAOklD5R3nsx/ab7SlECvngNWk=;
        b=IHy+VyiR8UfvrLXnETiFMiwJVI6RDaqlV8ij5Ci2bnLCJy6jJ0F8jZ3oqBRzd1S+Kt
         QyWjk+ZZFfZH0pO2lyznMH1yTAlkbkQ9Ess/guCjZNkF4ylvlLqhr7ukur4WWJxVQO2c
         kBi4u7f6pzVyyR9V/zsEmT7U1Rj3EqeWPHFo72Rf8jZ/hccadOplO63Kofv7W4HkW0Uh
         la+d2+8Y4XKnNCvCv1clDrL6TNYwZX+43I8QEdBjz4RdedN6zEN2zpgsIrBnseWt6JT8
         PfhdF9+z1vjGTgj1kP7BUrZWYCpNX4EgNFVrfx4tSeUze/5lmgSapqvx3y2Wor4W3Id/
         +Thg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770274806; x=1770879606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FLtYMa/0mFLZQzN3dEAOklD5R3nsx/ab7SlECvngNWk=;
        b=ecJyKt/IQOHJD+/sI2qQDArqwskZFDfL0ENWSKXfWXnfiXi76Pf1Dp/LfXFGSQVR2W
         5Ok+9VSkMlf+eONF8pAES2vZyEsy6sO9l1Qgm6PMOeD9wLpg/4XxwTeCf8Im16TeFvzA
         aHFpY6RmtUqNrngNWsR3ReLU2XLPhUvaC8uxmIEced8NEmX8dy+NpUNh5sfuyhgOVYy8
         543ifg/iTY3/ajPzMFbA6mrHD3cAzkDi6usmp2z+no8JZEZgDyxMmuu7oIxbcmpZd4B0
         RRu0I5wAb93BXIaFoMpu+gsP2Bn2jMpawgR/907lQoxaS5UaCMQvLD/UNp3KNW5OKL5D
         O3Ew==
X-Gm-Message-State: AOJu0YwTWggRHQTp9FTeMuxOptiamuJ5onqp/P+HyugSlKAY/5yZkavY
	6aIuhE5/PcTE9QO0k2Uak/C2WfB1WIeKuJuPNlb+pfSItkJAsgG1K6eJ7CwRxw==
X-Gm-Gg: AZuq6aKFHH+4Et61s+HX/lfjzwQ9DEfJU1I1EYMSzliniDnA/RSkegcwuunhLon8Kt0
	4TzWKr8kJuHwqJVw3CWL5e95sgwPs+r7XWGAlS3htbFgr5+as05fwKKZwbJgtbXweq5V+Lq2jk9
	//PstHv0XQMUdFUkgalHr3RH9ntmtox5oC0ePoY+hdcjOsUsAUmgt+qUDM8ZWBeVa+DhJXTfP82
	WSqoLqKLx6qDVHRIocAKkkKF3gvOyuIXFru8Ykb9EiaVj8+k6tTyvvGbBZQoxAbKSyYVn8NJ7QT
	mHHR1m64MtnHviIC4Hk9K50kKDPwB/O92ghRWY3poqRKS7Oimt7N28LWXlRIgxDHfrtItHUXfP3
	otGrbv/eSGaaRj9/NKPc0KMCOcOcg/kTPOJ0Mw2tlXsbBpJQAm1oYQ+ZbDSCYCwWWsHPSUW/QYO
	UJ5YiyHiRYLKreOWsPYbA=
X-Received: by 2002:a05:600c:1394:b0:480:53ce:45d3 with SMTP id 5b1f17b1804b1-4830e987c69mr72305265e9.18.1770274806230;
        Wed, 04 Feb 2026 23:00:06 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4830fe86bebsm34545505e9.10.2026.02.04.23.00.05
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 23:00:05 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][whinlatter][PATCH 14/20] python3-twitter: mark CVE-2012-5825 patched
Date: Thu,  5 Feb 2026 07:59:49 +0100
Message-ID: <20260205065955.1267785-14-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260205065955.1267785-1-skandigraun@gmail.com>
References: <20260205065955.1267785-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Feb 2026 07:00:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124190

Details: https://nvd.nist.gov/vuln/detail/CVE-2012-5825

The Debian bugtracker[1] indicated that the issue is tracked by
upstream in github[2] (with a difference CVE ID, but same issue),
where the vulnerability was confirmed. Later in the same github issue
the solution is confirmed: the project switched to use the requests
library, which doesn't suffer from this vulnerability.

Due to this mark the CVE as patched.

[1]: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=692444
[2]: https://github.com/tweepy/tweepy/issues/279

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 3ee544e7591b36a49550a263a0ec4d64b5e490e8)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/recipes-devtools/python/python3-twitter_4.16.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-twitter_4.16.0.bb b/meta-python/recipes-devtools/python/python3-twitter_4.16.0.bb
index 54379673c0..78a2b70ab3 100644
--- a/meta-python/recipes-devtools/python/python3-twitter_4.16.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twitter_4.16.0.bb
@@ -17,3 +17,5 @@ RDEPENDS:${PN} += "\
     python3-requests-oauthlib \
     python3-six \
 "
+
+CVE_STATUS[CVE-2012-5825] = "fixed-version: The vulnerability has been fixed since v3.1.0"

