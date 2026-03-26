Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF1E810A88EA
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 17:24:07 +0000 (UTC)
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.53944.1774545838578668108
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 10:23:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=qQWP86Mc;
 spf=pass (domain: gmail.com, ip: 74.125.82.45, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1273349c56bso1590475c88.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 10:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774545838; x=1775150638; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=otoNdl8oJJ5a41zNhjNab+YwoxfNFx2kdqp3jVe0Dpw=;
        b=qQWP86McHVcJ9SNtw4jrbaBYDi9TfmhPFIqDOkKCOqb52heF0/Br0PCT+0ONaK3lQK
         rMOgkz3Xf4bWOohNef7f42ssdhUhQ+MoZXXyz1rTuFw4qSkIbkwVF+ogJaQNqwTrrkra
         P+pM/8rTRx9342By3XQRnKVWLKmaKO8rzBOwjnCaTlVoUBjL44oS9LRaz4qwtVedzxpa
         8TZQ0Hm1LmMgbZ134IdBBdhbBG4yuSDuGlGB49UlpaZ+3LfP7lK5u8gkehpPWp9597P9
         aUzDlNyAkXsP8ZoOKtJaVJ6X9oFpIMUDnAsjKC6qeE8vzLONVs1apdKJolHJZnhVYqCu
         hJqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774545838; x=1775150638;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=otoNdl8oJJ5a41zNhjNab+YwoxfNFx2kdqp3jVe0Dpw=;
        b=KlXkNbmuLAnLL7iie8z441r/oO8hvDbGRaqv7yrsk+tP6jZNcxI3inQfOH9Pz1lTK7
         zWAGP2pBnnexdQ58b/6EbNE7GjNTlR0CfH2nsS8cKptEKjKNCyXsUd/vE0Y2jtrvoCK5
         jpLB7zOTa51FkBNz09XzdqXdCUnHrWUfcMae9AvLXFyRjbWeHYjGR8UjjC/Zfd/wM2Qv
         zVj7xVPuG/mU7gQbxcmb6C5FpcdmPe2m+/TYQmVqaQQRde4V0jRfC6ywj8nBJoV0GjUD
         rrvkCrI2rGupmmkxOkheFHZzN7Tj4HOiSAiUL2Wczab8LGu9TsJqVvTuOcA1Zd1nkL5e
         Fm5w==
X-Gm-Message-State: AOJu0YzhbK/03guH+B4Xl5Bn+QPXpP1UHWaIhFG31hmtZQp5mxHigbRM
	QTu9hyZ4fy+4+av4B29I5oiePdLy3tIRtNTpYLWRnXjI71OczA4ZH3DUZfjIzcvdsKg=
X-Gm-Gg: ATEYQzxTO9PegZuo2Unjyf07jL8g8Dt3ltFqGMAQP90c8nGIqgh1STcMak4w8T8NSyq
	teG+jGrkUeb/B2AZQ+39mZs1XJIrAAoRHF/clrlmJMhDFN4/FEDxVDfCmwiUaDw45RaR8MB42a3
	NCXsx9X+UuBpqgLZ85giuis1MnNCwl7z17YPN9DK4/JD6ftpN47QXJjs6DDS5JfFquq4cIa2yav
	NU5ccd6iTd/XqBh7JPfwvOdvhHXVCaHy9VRYnZHnz+TJ2ZwOZv0NPjubIz0IBW6n7QIlYO7xB6W
	iW/58/0kM/TKk4kdTv6POldz9vaJKcrV1M0BaTyKvVbNM2DOTT43YGkgofJ276dQP+pYLnhlVfe
	6HaDdtgYXt6va3CcswQQ1Kf74AbN4Uhd0v1/lXLyOqs5E0FC3UXwRV/F/YOO5u6RJYJDxKu5YsC
	Yz/RxpcPXT+uqsEHmpffQPsSS6gbRXrRLhA4dxXg095eCox8eux1BfVCDbsP18fFxrPoWs2vVTN
	jRTX7+OeD1NGgafSHxA8cKEaJR+aKAWimrliZwNPsB2eX3OkxMDGAfxufaM
X-Received: by 2002:a05:7022:629a:b0:128:d4db:447a with SMTP id a92af1059eb24-12a96f05e1cmr4091197c88.29.1774545837580;
        Thu, 26 Mar 2026 10:23:57 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12aa7273848sm3284338c88.7.2026.03.26.10.23.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 10:23:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>,
	Ross Burton <ross.burton@arm.com>
Subject: [meta-oe][PATCH] ptest-packagelists-meta-oe: Remove protobuf and xmlsec1
Date: Thu, 26 Mar 2026 10:23:55 -0700
Message-ID: <20260326172355.1368183-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 17:24:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125763

These tests are disabled in recipe, re-add them here once that is fixed

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
Cc: Ross Burton <ross.burton@arm.com>
---
 meta-oe/conf/include/ptest-packagelists-meta-oe.inc | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
index a4398dd7e4..ca800f12fa 100644
--- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
+++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
@@ -52,14 +52,12 @@ PTESTS_FAST_META_OE = "\
     onig \
     oprofile \
     pegtl \
-    protobuf \
     pv \
     sdbus-c++ \
     tomlplusplus \
     uriparser \
     utf8proc \
     uthash \
-    xmlsec1 \
     ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'xrdp', '', d)} \
     zeromq \
 "

