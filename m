Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D36A1CD98F0
	for <webhook@archiver.kernel.org>; Mon, 22 Jun 2026 02:59:16 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35250.1782097150463202940
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 21 Jun 2026 19:59:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=iOkWnzOF;
 spf=pass (domain: gmail.com, ip: 209.85.128.175, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-7fe36f1be74so33551477b3.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 21 Jun 2026 19:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782097149; x=1782701949; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bekbmuP9bbnoz25aTLtIKQ+l/c6RE+5nFVP0DYVV3VA=;
        b=iOkWnzOFAKq1azuxsGUj/hEidhXpvps1m+Vv/sJmKc+4/byxpgkRedYdsJKRKe1cnK
         qfo7sh003jr3Y6htuac07Iwgyah0lsTs5XZtHeNzTMKIkFHzzZLotnAL+AnCgr+3bPV4
         0UVLB2PATlfJTK16BvR5u9u9Jprcw9TeM0n6cc+clWgCYuV30TZj8x3OXTtyggXKmB57
         Y0FS9nyoFg23bdF+NAajwh3B26AeAFR0YI7B08MA90uAOB+z19z08aKbH6OPYibBhuCW
         gBtcHGCf/O55b6MZYKGyusqOdTfDGYcZ9PfSn3NHY+SYlMzKXn5+xw6wwPrdIjUmzcKU
         ncdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782097149; x=1782701949;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bekbmuP9bbnoz25aTLtIKQ+l/c6RE+5nFVP0DYVV3VA=;
        b=phrjBO6nL37QgKsZcUzNZWfB1xkSF0Kzby5BwYmKtVRV4kDV9Qw4fP8in8sm5w6Yyy
         Hv8Q4h8gzdBuF8lQHjEumEpiUJnL6SAjU05KXdRlK3IGwkeZQfiu/3mLosmW/6uGft9C
         GmwilzjNlBSOGm5K41fPmZsCqeCSnrb3mhGM5OI4lGsOMHk46VmDbsc0INLflXh/vq2r
         Q90ia8FvMsAbKDSGbeCSbrrVvA5C1pEXC1mJVNNWZZgFKRK6Gn+hG4YUr08OHcygFM79
         2wTf4go1R//Ad+2UZ8tWIvnWKwFBcoo7iZQLu5bmF/+p+l0gowjO1Mgv1Pme+XE99LzW
         qNMg==
X-Gm-Message-State: AOJu0Yx8NawoAhe/sqka2pLa01K99nkTsgIh/k6q51qrr5B73R5ZmPg4
	69Ujx5csQCXoTqoBiR/riv2vQiPwbJ8gqLXJ9RFWel9PFlWKljf65wAu5H+6ySL4
X-Gm-Gg: AfdE7cme9yBTFJsvypINUjvBJwkTAi7T5Cv2njhUHQxEq7IEum1iZBHcChkdDC4raZH
	ATUnXdGaEuUBCl2cvwf1NbCcv3tUDZ39eexo++oGCJBUdCxK7ZGX1kd6peqk25ViPy6fv1yR//g
	gZsTv+IDcKn5oDBtuYpFHZD8cRP2FxV57ZqTM8BWRIiDK1q4LyuHRi3lJYMKF5gwP5UxM7yBrha
	hlUzxaan2NKHWDwybnyRKB0gtW9cX+AxvWcosjkG7PVOaVItihlJY99Tht+nLe5BAzfR5NAO+SQ
	4Quk0DLki0H/ZrUc/IocKm2RDrvVCFaAvsGoMGdV/8jO7l2UTni8ePj+qEDdYMqsjnoNW58+5Ou
	u7j3UCgRXjpNFifIt4eLxQ4Y53iejfI6KuSy1rRbz9f54akAF7kmGgYxNd6/cgRI7T1jwXuHEL7
	RUBFvMweN8l0YPMCaXl11vYL1QZk7LJWnUAstxq46KkbKT03IXSUsoM1laOx05o1iRP7+uESSMl
	cVx/6Tu3ZxGxPlGMaBn9h/kKOmpui+DLdNvzhrT
X-Received: by 2002:a05:690c:64c4:b0:7ff:83b:9a2c with SMTP id 00721157ae682-8017885cae8mr104534677b3.39.1782097149293;
        Sun, 21 Jun 2026 19:59:09 -0700 (PDT)
Received: from localhost.localdomain ([71.54.207.93])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8025cf6285bsm26650677b3.13.2026.06.21.19.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 19:59:08 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH] libnet-dns-perl: upgrade 1.54 -> 1.55
Date: Sun, 21 Jun 2026 22:58:47 -0400
Message-ID: <20260622025847.10860-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Jun 2026 02:59:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127685

1.55 Jun 11, 2026
        Fix UDP truncation tests which relied on large RSA RRSIGs.

Fix rt.cpan.org #178183
        Unhelpful TAINT error

Fix rt.cpan.org #177003
        TCP read loop treats 1-byte recv() of "0" (0x30) as EOF, corrupting AXFRs

Fix rt.cpan.org #176900
        UNIX.pm: avoid `backticks` which depends on shell

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../libnet/{libnet-dns-perl_1.54.bb => libnet-dns-perl_1.55.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libnet/{libnet-dns-perl_1.54.bb => libnet-dns-perl_1.55.bb} (96%)

diff --git a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.54.bb b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.55.bb
similarity index 96%
rename from meta-perl/recipes-perl/libnet/libnet-dns-perl_1.54.bb
rename to meta-perl/recipes-perl/libnet/libnet-dns-perl_1.55.bb
index fd71ff72c6..faa286c8ca 100644
--- a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.54.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.55.bb
@@ -9,7 +9,7 @@ DEPENDS += "perl"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/N/NL/NLNETLABS/Net-DNS-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "7abe0e03e8eead04bfe432d0d90ec0dd61b8ba71afad324a9c76acc6a6fbe2a4"
+SRC_URI[sha256sum] = "e2b60630c6bc3ae36fafdf64dfe099a221f6aff1dd2707a1a5a5ed240ef6f47a"
 
 UPSTREAM_CHECK_REGEX = "Net\-DNS\-(?P<pver>(\d+\.\d+))(?!_\d+).tar"
 
-- 
2.43.0


