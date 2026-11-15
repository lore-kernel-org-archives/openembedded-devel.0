Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3808.1794728993992542058
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 23:49:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=bQprAV9U;
 spf=pass (domain: gmail.com, ip: 74.125.82.179, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso1429216eec.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 23:49:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794728993; x=1795333793; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BcMaTFDiF1Lz+jhnUJSamHoZfsU35z/tktpyhAM9HJI=;
        b=bQprAV9US86GWZId70mx3wt54c86499/Cf/zhBOGpM94SR73frgUWut6mb4zQtsId6
         fq+vD1TeYPrgxuBphye8ScBUKCMNqd78x3YiDlJBgc4kFfrzEkoNrrvdr2Y+rDHj84W/
         c+pMPtbTL8eCEuDvYpPV0/3xfWjTQLt9Vs27zBkfIWjOBkQ2NASqtwPkhRoY7QOKJ5L/
         w29aJmfUM0Ggk6Mx2zKZnz3NYYeHkM7ciYp/xVdTxtQbHoImuxvYB+NEXOJfAIlSeKzb
         Sc6WOlLLk1YlRn5Sgf+rCpqN4BgdFSZ4N4SvPQXDQiXF0f245ya4fsfV36bN/Ipspy9t
         Igsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794728993; x=1795333793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BcMaTFDiF1Lz+jhnUJSamHoZfsU35z/tktpyhAM9HJI=;
        b=tYGQ/nhBArbG6KGnGmgjBq4CEewlAqVOSJbSvy7/MLlCK0f+mJI27QHmyzAhLmmBXR
         7AFWy2GCa1J9dIJi3rHlaJw5mpuSbg3smZI5bs/9u253CyWJcuuI1Kd2jUX+tJIxJyq0
         t5oMWFnx4CacVqGA36Qr2wGqB6drs9Yev8SQCJkpSRNAGmi5DVaSJoURpaYw33RoAKvf
         GQcAYnBfsISWGdPiTqrSpB4aEpWeQnd6PfDd+ylPrSXwhnvSlM4XgyiIHmso1y1SPQeQ
         SzWAkmVfBSn2THjn3TnOx/MU7Ttrx29Ojv7fbP1SUOxwp/wCN86BjLNN/gKLPPAWgU8/
         dYzg==
X-Gm-Message-State: APuU4Z+dINIfr0HWrrmY555oPRfDWtlWKYCEMPo36Ex0s5W+UwAojK05
	/EEc12Xgsm69GZ1Gr43KuYztmMaf/tE2rRFzjsLW9XQC40AsyKgCglbqxViO+yh1
X-Gm-Gg: AYBFou2fvNKRGHyMqydn0YipqXA0ScU9AxGFO5nG5sob5yf/VG7hnHSXjNtX2jD6FeH
	27tSNgZRijDs65+CpoWLUi7+Rag2A0V6hwBfhTw2Y0tgE+Escdvp5tURMc+fygYhb55tnUuRidR
	mFxE1PpHXu89/2zyapoJKClQ7tKJ6xqWrbLwpHTKZzqGIn2P21JBYTNBchcFLrOuAyFWv2qkLlP
	bEEHPwXl/ZMS+5FysyQRG28UW0eBv1fh9dpfozpTKWvVG5iRDFPQ7HEuhmf3/2bKd2IiRctqoF3
	eNK9r5gVsbQWJPEv/gfrJhRXUKesaU8c6r+BmR2SZPOXq0IQF73qMLwshprOzp9rQ4ptqf26twl
	7nueVDMIW5dC/pOaCLIHoTtDFyOxWjX8aVsHlw//B62NGc89u7NOFfGPIdRtMuGUdrunUmmdaXI
	wxvR4jdMQCXP/Yr0Ase9+WgUbpDj24WhuHnl4fe0iVWnjgEIXDEM7SAqsr14/3SqIeyCMxWgcOc
	JOfX0sR5C9OiNMX3BtsZorgbgE/NJcmpuo/eN3vKKYk++7IGjSnAOl4mqb1SnvxBwdEDw7ZeVNu
	TYaiGi08DgBIm83YlNaY1BbYDb7JcqwgS4IHVe5AyjdRTiMjpB1XgfEmGHl5n5OHFXQRyt6t4QE
	9g31Q+FCUURV+NMt9ep7nDjG1lFPn0qgqeuUxt5o3RS8a4ffb2zzWtVHDKYoHsW4Nd1cSK24hvj
	TAyEKenXQemGl959n8mP8Sze3J8SaaoE6o/aSHJ/433XXjzspdGml4TXuU1/GzqYAr4z6acl1rL
	yTmf31QMbs5Q8Re+Fl+ybSZgqckHc3GOudLCq1kfwumkfcbrbOqhejMrwlE/9TyWVKdXEUD60w/
	UOWC
X-Received: by 2002:a05:7300:d18b:b0:36d:37c4:3759 with SMTP id 5a478bee46e88-37965f9d24cmr7392852eec.18.1794728993211;
        Sat, 14 Nov 2026 23:49:53 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm23112817eec.13.2026.11.14.23.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:49:52 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 20/96] libcppkafka: upgrade 0.4.0+git -> 0.4.1
Date: Sat, 14 Nov 2026 23:47:58 -0800
Message-ID: <20261115074918.2932593-20-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
References: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 07:49:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132290
Content-Type: text/plain; charset="utf-8"

Move to the v0.4.1 release tag.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-support/libcppkafka/libcppkafka_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/libcppkafka/libcppkafka_git.bb b/meta-oe/recipes-support/libcppkafka/libcppkafka_git.bb
index d825f8fdee..281c7359c0 100644
--- a/meta-oe/recipes-support/libcppkafka/libcppkafka_git.bb
+++ b/meta-oe/recipes-support/libcppkafka/libcppkafka_git.bb
@@ -10,10 +10,10 @@ file://LICENSE;md5=d8b4ca15d239dc1485ef495c8f1bcc72 \
 
 SRC_URI = "git://github.com/mfontanini/cppkafka;protocol=https;branch=master \
 "
-SRCREV = "91ac543cbd2228588dcf24a6ca357f8be0f4e5ab"
+SRCREV = "9c5ea0e332486961e612deacc6e3f0c1874c688d"
 
-BASEPV = "0.4.0"
-PV = "${BASEPV}+git"
+BASEPV = "0.4.1"
+PV = "${BASEPV}"
 
 DEPENDS = "librdkafka curl boost chrpath-replacement-native"
 
