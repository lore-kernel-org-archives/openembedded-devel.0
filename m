Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3908.1794729109068355132
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 23:51:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=DU/lcGk7;
 spf=pass (domain: gmail.com, ip: 74.125.82.176, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so4585696eec.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 23:51:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794729108; x=1795333908; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5CkTanFbR5DdLqT7M8dLjOhietoEno3G1mS3VvzKvjc=;
        b=DU/lcGk7hSQ/CqDIphFUw+kxidmbh9QcOgJlXE5YcNFfURIg9E/Kzfjh0Zzkwn+cMB
         hO70Kq14bsn7oa5OjvxBsnCPc/ySV8a4ZYzKJoF4ArJ4abB+YV5Qr+HdvusIb3FU4kkw
         ypNKzTxSh0Tn8BBlGDRtfpHVGo1L4HLVxnmWDJ2dJjRS3R4KmyhoCLwGoUNjvFUJfOT6
         8aoFRKYvoiOoUMH2C7Rr2QCIkx4XRUKkINwGwqBKry6XOHdHJlXuPrLJNbdJYqnzib56
         66Fs0KMdkBVtxN7uSJQ5ioepry8JhNK0I0KfrhcSakInNQFb41OSq0nUDitnVlR+9IFo
         3pRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794729108; x=1795333908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5CkTanFbR5DdLqT7M8dLjOhietoEno3G1mS3VvzKvjc=;
        b=n6W9Lw5SA0Fn0oNNCTM7nLVvvQ5D1VvFvEkiqzG7n7U2IAiPZwaNK3H9R4tcSxrjJT
         fnRCNK3biAT6ZxzrYOSemTPdxPRIiTptzJE/4Z1AiYUCCrfu92JepHjP1OevqP+xfWm6
         aahzVDYEeJk4t60Klc+T8E5PUbzsz35g0ai80tDaH1krDSrSADifSx3ejRdBgfROWkqP
         FvgoknTc39ze/k5hYL4kU5MQu36vhE/AknYJZdH40Lu0Zhm+dYvA1t1nxYlCYLvYT1LR
         cLoeY6FQNJI7esD+/I59AAGgA304hJQAaCWE+aFUnBlb0DPvWEat7Qi6zeb+7LVuGLBH
         PtIg==
X-Gm-Message-State: APuU4Z/jde+xGxn5LQcQJKue40sS6IooqEtLu59Zsj7nBaI7t/p8+e87
	JxRMPYU089DU3EYF5o0E6fGavOPAyEDH9PlhBbSVfz2va2iiuFz5R3HBRIDxNehb
X-Gm-Gg: AYBFou3rj9xp2Daq/sdKme7fANk0U1cWSIGnNB0TEoaVIwu3xFgOFFUka/fHbvfpmUf
	AreKFnSDE7qjp0JGIARD+1HCGSl3RYHxQb+TXxDFvgXZGFWOU1KBkRtjYsPCRLCM8YMeTmGpZHH
	6L4B51vJxyH1ZuXIQmSp3jbb4akvXQDTshY+9LBnGtjNoUlrfMPIgZ4fmxLawo78ScZdUvyLxjj
	vNuPNYLKaMFCd3cm4aPdv6K7kH4Q7PfkYy7cI9AQiJPdkHUMnm1xbCz+uDy/4Ua1ccA0uESe7N2
	/RAmGZcpm9l69bICOnKns/DJXugt29QbUXGkdNbZvZ5zSoDRDNTwA1x/v6i/VjtNhuMnPqdN5Vl
	Gvk/Cp+0hDRhP6erf6AuXKF94aw+fyBDft+6oJ2xp81vpqBTvxFxlF12HaxiEEdguiai85Ol+2H
	aFmWRV98CC+PP4Mqgdazjl3DyFVnwF0FZxNOOqPB2V75J9O2+n2dkxoovT2uXsA7NdHaizuGee5
	2Vohl6MVNxiS+aCOIhAGKqRuxBvsUvF+oXN3IGZZwZ/psY3nk+wuImDSUPd7iZ5f1oZr0oOL+kG
	QSeroYjhMHn2L2pYBl+w26gy5SVntg8jM5oDdhP06205XZZEGmzQNiFChYkdCyxyjI6lBjI00nb
	EFm52ntKUIVsimUWYOXlLfH1WBTGIFKYcDkAJYgYz/fujsEfkXMlp2opVRcZu2VQobAN7N60BKz
	3NUh0qP2sWronkEzl/u2jBrhYTmgUxrRLP7VLOHImfrC2tePoAWjz/lwyGX+iqvOsEHVJCcsOQv
	gXrJB0GHqfh8AjRQXxPYl8EdDKSN7jVYWu7Pal28IaWqKSNMLAzGEII8KCca4GKT9fhm+9kCrjg
	LMdZ
X-Received: by 2002:a05:7301:182d:b0:376:a6d7:8f60 with SMTP id 5a478bee46e88-37967ae21dcmr7737865eec.40.1794729108357;
        Sat, 14 Nov 2026 23:51:48 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm23112817eec.13.2026.11.14.23.51.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:51:47 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 90/96] unattended-upgrades: Fetch from the main branch
Date: Sat, 14 Nov 2026 23:49:08 -0800
Message-ID: <20261115074918.2932593-90-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
References: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 07:51:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132360
Content-Type: text/plain; charset="utf-8"

Upstream renamed master to main; master no longer exists.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../unattended-upgrades/unattended-upgrades_2.13.bb             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/unattended-upgrades/unattended-upgrades_2.13.bb b/meta-oe/recipes-devtools/unattended-upgrades/unattended-upgrades_2.13.bb
index 9534fd3197..a352a2b9a5 100644
--- a/meta-oe/recipes-devtools/unattended-upgrades/unattended-upgrades_2.13.bb
+++ b/meta-oe/recipes-devtools/unattended-upgrades/unattended-upgrades_2.13.bb
@@ -5,7 +5,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
                     file://debian/copyright;md5=62b5f2ac0ede901fb245eefbe54c181f"

-SRC_URI = "git://github.com/mvo5/unattended-upgrades.git;protocol=https;branch=master \
+SRC_URI = "git://github.com/mvo5/unattended-upgrades.git;protocol=https;branch=main \
            file://0001-unattended-upgrade-Remove-distro_info-usage-to-check.patch \
            "

