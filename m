Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DBB3F33A78
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 14:51:54 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45872.1772722310304053041
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Mar 2026 06:51:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jK0ISuil;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-439b7c2788dso3226294f8f.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Mar 2026 06:51:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772722309; x=1773327109; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7splaOwqNKY65616X3CZiCA5GV2+QGdoAifYhhK2BXw=;
        b=jK0ISuil3yKrYvmiEtFBeL0x7Qyn6Q4i+e/3bHOaNwbPvzmySmpV2PUPsqIyW+3/x1
         mvgagOZLeA4RegJtxPHN3hz0xka8WPhSq+/7nyev56mC56hhhakPWsjDkNELaDPXmvlQ
         BbsGmDop46xeH7M0si1jp3AOU3I7hyKkNHKEbLid1KvmrLZTkHYSq79XMA6RtdwjsoTF
         Z+NInEw28U6sxDcjJc/9vvOkf2ksKrvim8/qoS4Xx8O6V1FFOC1kerDf47YqQe4eHo4o
         OV3Hg6QNyeP0XHxNC/1innICy9lOPAsZ7yT32BTYXhAe71SQdqoM761BwLhO0s6QEhsG
         bxGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772722309; x=1773327109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7splaOwqNKY65616X3CZiCA5GV2+QGdoAifYhhK2BXw=;
        b=JdzPfJF2KP7fMfRJhHg0/qPOpFtO4Y1RXkXhdSXlaxqLqav3UwR+OC2zVmw8QN0bu/
         +gaqQUpfmAKjHNcFj9hKPod68gmqlXkJWA7apEHGkopwHEZud0upiEbBSv0J9pIAf6d8
         aRH/nqrPRltQ2/7zESlqmGHyU7tpnRX4vKDwCyetMWPKz+pWR3OqPhiBhaZq3ZmqiZmk
         cbXMy5GJRCt6z419ByniWEJ83E8Ucjp06U76asJXDmPIHAnv58yAlZYrbFTf328/bTrZ
         Wt+h2FYk7GB2lrol9iytDMlcpkrKw9FFQR+tXxMTD7RMpCzlIlLr7Hq9McgCHfKcFJYT
         FacA==
X-Gm-Message-State: AOJu0YzMftK3l2hyrn/0nqhbooeMZcSgjyM7bJEjcZiAIdPNvcRz0fLl
	+jCsGbrqzbBBbM+k27uDoMoVpzqf2tl9Gd4N2V07GUl1qPrwIpruIsVK+oU2hg==
X-Gm-Gg: ATEYQzxw/dFi0b43c7pBoortjY0Uu+HGK3t8fe7S4506LMlYukr0s2JAZzLopLKNNdT
	VfHAeQIScs8XG1KKjShVKdxKTDcMjJm248E/EwSLEheHQ4G8TWRbfJOUqW4Tuw0Zdr7ytR5o1+h
	sTQvAXY4hE/OLagZKovf7CGFEtLCruE90r3SdG/i7+pNhEtVm7JcHc00fbF1i7U5MFo1Sjlygif
	wSuwFJftwb2wwP3gS+WQQ4rvXw3z6jJKAPC7Irr1Q02NhGK6RozE1/hDhUgQ0kojsmh0KUH8365
	0hRfJwHoSnya/QbGEWZ+1eMfpbtztA9aHCGt3ZfZvaNRZ3/7nWcpwuwsJKc3kBqWlyrCho8GMST
	FyrFmZ2FV2C7h/2T80GG8CcwWhQLumDpnbWRsCNDpXdtMjgpYrZKT4/PfATe8yxVFnZQmUM7QH9
	NmNh0OiqdZylO9WrTsPXtQ
X-Received: by 2002:a05:6000:288f:b0:439:c661:3245 with SMTP id ffacd0b85a97d-439c800036amr11374772f8f.34.1772722308542;
        Thu, 05 Mar 2026 06:51:48 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c75b272sm49302136f8f.24.2026.03.05.06.51.47
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 06:51:48 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][scarthgap][PATCH 3/4] streamripper: ignore CVE-2020-37065
Date: Thu,  5 Mar 2026 15:51:45 +0100
Message-ID: <20260305145146.3068524-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260305145146.3068524-1-skandigraun@gmail.com>
References: <20260305145146.3068524-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Mar 2026 14:51:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124880

Details: https://nvd.nist.gov/vuln/detail/CVE-2020-37065

The vulnerability is about a 3rd party Windows-only GUI frontend for
the streamripper library, and not for the CLI application that the
recipe builds. Due to this ignore this CVE.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 1571c1a8e5e876db9db744d0a3e3256ac585242b)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-multimedia/streamripper/streamripper_1.64.6.bb      | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/streamripper/streamripper_1.64.6.bb b/meta-multimedia/recipes-multimedia/streamripper/streamripper_1.64.6.bb
index 6014326826..1600d9d3ef 100644
--- a/meta-multimedia/recipes-multimedia/streamripper/streamripper_1.64.6.bb
+++ b/meta-multimedia/recipes-multimedia/streamripper/streamripper_1.64.6.bb
@@ -30,3 +30,5 @@ EXTRA_OECONF += "\
 
 # the included argv library needs this
 CPPFLAGS:append = " -DANSI_PROTOTYPES"
+
+CVE_STATUS[CVE-2020-37065] = "cpe-incorrect: the vulnerability is about a Windows frontend, not the CLI"

