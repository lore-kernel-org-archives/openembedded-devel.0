Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CB02CC6B3F
	for <webhook@archiver.kernel.org>; Fri,  3 Apr 2026 01:24:38 +0000 (UTC)
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2626.1775179472307385274
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Apr 2026 18:24:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=TRNJ/SFV;
 spf=pass (domain: gmail.com, ip: 74.125.224.45, mailfrom: schonm@gmail.com)
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-64edf260b49so2111495d50.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 02 Apr 2026 18:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775179471; x=1775784271; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ertm3hhooXm6Ntgo6qBIgBveeN11SZKFWl0IPJkewUU=;
        b=TRNJ/SFVxupaZ4iDBzGoDY66Y9VLMYzldx8J53uzG07DC0F/w7C4kjxWP9GRqnbmfK
         ZhbdZfPnd8MUlKBSlaVop6e72wOEwzpSpLyfElf6mMURdmXkmqLJnreFqQnCokrPcyQN
         9BL1JZKg+QRulI93qnRVTZBtGlwcFbW2DFCfEoWJELH6QO4dV3Gg0r530paDetLmXlz9
         MtLgpYd09dY3rX8TMUS6eNPYd5KpUbsIa7orZYlPWEK/ZO1OVGZflw6BxdKBumAKgJ6+
         tK7ptMfd3Iq/dm4MTMaXhbMot2+qf24CUaMtzHycqI3T8yDbpKUEQz9qUdHJeSnlqujE
         GW7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775179471; x=1775784271;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ertm3hhooXm6Ntgo6qBIgBveeN11SZKFWl0IPJkewUU=;
        b=ecmpIGF/Ka1cOjPOfWk5HUh3DDEjc0EZQuvKtNNpZihL5/EpEYsfmr40l6TqyZz/eP
         DhUW530hBJpeRF+wmSppg8xKxlgyeg5GRrlA4N43P2zcmfk3V/9wCQrGTIRzX+xtonLi
         iyNGsYGctHwBebioLSgsYkVuYFSOB4f20svWzy0wJRDVO0ycU+rz0ogDd5+caMst96hK
         omGwOzjMYEGQR7KSbVJzxnwLd41RpMn7hIxZPEX3C5ttpx1N2cA7dmL0sZQCGV3eS03c
         M1otc95A+LDPzER++0HmZcX/85Bi8Uu8QxcyfHwWz1qVeNHbMK+1G0G1MxBKnw4hpbUM
         MOmw==
X-Gm-Message-State: AOJu0Yx5gmXRc7l1wuWvTZgt8emw5g2p2paoQdPp3X/ncUfJh8GHdaF9
	lrC79VNe33DzWXoOmjXZ19Tz6px2ZnoTqK4ivhjc+9zoxG3IYqLjhMhrPkMSd/zS
X-Gm-Gg: AeBDievUD6eL/w+Z4ZZn9fdvZpie2l0tvckP2EcONb2gIKzFNaQ/uB+P/kw6J4GovQf
	fnY3zKTxNzJiczQGrvPVvlCOEZBalqv+VzYEypU6ACGsqRYHjJppk5M/UqH+LHa3AD5KMGtJFDG
	hQ7xSs7IBBOb/Vh4BTrO0uEAJS05JF30cm2bTso8wARPZ9NjNB95PesWS79gHSwYUuMzsHnmBy4
	wQfNj42Y7pRdIuNavRDjAsnfLt7jACe5plHPqdyUO0jgLn2bgddwM3ipHB3YKCG5+tEwVGEwaXo
	6ywsFuPrdRjKlbh2XaLXshC8n47VjWeTuc2Kq10UIfKvWFwCndBJBcwUG1uL2cdY6D+7YIWuwgh
	lRPMr6X9UJB/Es35g9iydJj1TLJearb+w2NF5SVHR19fM95QgA9TpCh+i6t2A+sgl403yrmVdhu
	/I5eCBGpAhk3Yf2I/ckIkmYJmfI6pDWsPlEd+YEjCivysOZZYBltD+/QRzwhEWOfpMseb5LHBb0
	9vrBpVv6ZIWEx/B+JOy4Q1TnfRkhCVpy4+iOgJQ/mwOPwGJK68BLYZUrGGbNgQ=
X-Received: by 2002:a05:690e:400b:b0:650:176f:1ae3 with SMTP id 956f58d0204a3-650480e71d0mr1051208d50.25.1775179470929;
        Thu, 02 Apr 2026 18:24:30 -0700 (PDT)
Received: from localhost.localdomain ([67.233.60.136])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6503a73d18fsm1852256d50.0.2026.04.02.18.24.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 18:24:30 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-xfce][PATCH] thunar-shares-plugin: add missing HOMEPAGE
Date: Thu,  2 Apr 2026 21:24:19 -0400
Message-ID: <20260403012420.4784-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Apr 2026 01:24:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125969

Signed-off-by: Jason Schonberg <schonm@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>

(cherry-picked from commit e5c5731771d9b0acd2035338ac6760963f0d0229)
---
 .../recipes-thunar-plugins/shares/thunar-shares-plugin_0.5.0.bb  | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-xfce/recipes-thunar-plugins/shares/thunar-shares-plugin_0.5.0.bb b/meta-xfce/recipes-thunar-plugins/shares/thunar-shares-plugin_0.5.0.bb
index 3b4f38da02..b270ad0838 100644
--- a/meta-xfce/recipes-thunar-plugins/shares/thunar-shares-plugin_0.5.0.bb
+++ b/meta-xfce/recipes-thunar-plugins/shares/thunar-shares-plugin_0.5.0.bb
@@ -1,4 +1,5 @@
 SUMMARY = "Quickly share a folder using Samba from Thunar"
+HOMEPAGE = "https://docs.xfce.org/xfce/thunar/thunar-shares-plugin"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
-- 
2.43.0


