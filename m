Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7504.1792574971786790076
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 02:29:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=de9AyxmJ;
 spf=pass (domain: gmail.com, ip: 74.125.82.42, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-17bc533fda3so633320c88.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 02:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792574971; x=1793179771; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rqa8FwGsvCcdMRqM7gKRjx2sgMO1lEXjf7WI5tBhJ/c=;
        b=de9AyxmJXl1ufQvIPFeQdpflvifcrV6f0Rkn3iHH7He7XM18nt55DQvepDDFB3Gb0v
         sQQD9k6vF3yTcTJlgpRIDBM/5d6JzTkwzvTkVLODlLxmfKX2kMcNsDoGf71jm/XaqR5s
         D8hzAGhYLUyI2ZoGb4W7A+1yW6pRMCr0+2x4mF12Mqup6DgBhLG+vc2rSvR1lUd6ztwv
         OItn90dabvaPQo4XmGm8mRc8z4JVTEyOG/Kjy3bMtMDLdIfrzBvqH7isqnbH2km+phDd
         LQ+hPwU3K+lqRqHL3jQ4h261U129wUiUb/EZIH65rQG/J/cDZEtk3Gkp04EQZLhykFI0
         cdXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792574971; x=1793179771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Rqa8FwGsvCcdMRqM7gKRjx2sgMO1lEXjf7WI5tBhJ/c=;
        b=lnW5UVVyjtQmhCohEQXdJJtaigGC5W6Hv6R9Pd21+em2umeobuakJCDCaf+gOMKGtW
         Ti3JFPnQnsdYgAYrttZp7xxzaVWNHJWYwz00qrqWXYjECJuLM2ZKOSSLh8WMA6nuqpU7
         0zxIRbZRwIkdJqWxcI7rI9ZEDPRxqBaEyuHnim4KL/b4v9XCg9vOjKAQZFqwsPo2hnyl
         MDiRAcEfkmz7XWcCf5ttX9XRgr19MJRIG+E/RIbyqrCObSH+BbMla+6+cwfHLeZ2Pn/i
         bv+jHgna2eDS8uqCh9sH7wK9t4U3/q4ELEZE+XyWJeXkyzbxhEjy9rf0GD7SZwk0PVZA
         DRBg==
X-Gm-Message-State: AFq9FYIwmSBw+YjPE+tW4ouRAL8jKOtkpNJLMwxg7enPswOldmqs3NOp
	1end26dJqHlZviF379flrlIAj9ZdN5uxc3mz4/4QiL7Oyc9XBHig02numUZJcA==
X-Gm-Gg: AYBFou2p5bY9HiQ7sqpcikChiKioznO44YkGJ+go9o0Qj3KCcPL2PE/EU2wLm2njxcL
	99TQc0EVxXQTVe/eMVgpacHMk4TKMrqdV1PUnBFSIblIWgXdacw5KEj6NrfonQiYD7yM7oL2Asf
	jqItJF8MRJRugL0bmWCfoTasfDRfhi/ejE4aYbL/jDBWLNjQXLwZboLAe8xqPDDhz8ObQUKqifv
	pUCnJCmNSRPHGqf18QMu9NG5etBZoygRmwfOMk5H6phDIxPWViLCt4iRzEb33HEtbIHO2yfaMaQ
	0h50bG/5wxQhzoU43BXS2TTTgGJ2op7+ARc+JwmYidMovClHM1CRK6/Ss6TI6Z0NgQzQjalvDkc
	gTf6oJ69I2t2thcGJW9XvWTlp9Lkw9hrijzKJK0c8zHfZ6BTPZljgRc5eD3ZLFCbzXldXiLeKHH
	M1Me1FJDjRD/87DDJu16zvoGbk2xi3BS6K0Nc4w88ogs2AlRI58KHkmoHLrNL5iX2kF0tGvRv4+
	rpQg1q7b8UkW7Fjpa1Hm5XuWGUcCID3A++8d4MYkN/ajbGdk5hrSmhYUC1Ek15bjoJdsG+8vsuU
	LKY8tWefXIpv9IPfZRxTs67wQBlW8Vw=
X-Received: by 2002:a05:701a:c90a:b0:143:5cb4:30 with SMTP id a92af1059eb24-1909f5c7ec5mr2098342c88.3.1792574971071;
        Wed, 21 Oct 2026 02:29:31 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19035c0c9a6sm4716458c88.3.2026.10.21.02.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:29:30 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][blacksail][PATCH 12/44] libxmp: upgrade 4.7.3 -> 4.7.4
Date: Wed, 21 Oct 2026 22:28:25 +1300
Message-ID: <20261021092857.3585453-12-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021092857.3585453-1-ankur.tyagi85@gmail.com>
References: <20261021092857.3585453-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 09:29:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131199
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/libxmp/libxmp/releases/tag/libxmp-4.7.4

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libxmp/{libxmp_4.7.3.bb => libxmp_4.7.4.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-multimedia/libxmp/{libxmp_4.7.3.bb => libxmp_4.7.4.bb} (85%)

diff --git a/meta-oe/recipes-multimedia/libxmp/libxmp_4.7.3.bb b/meta-oe/recipes-multimedia/libxmp/libxmp_4.7.4.bb
similarity index 85%
rename from meta-oe/recipes-multimedia/libxmp/libxmp_4.7.3.bb
rename to meta-oe/recipes-multimedia/libxmp/libxmp_4.7.4.bb
index 1600686229..a287124801 100644
--- a/meta-oe/recipes-multimedia/libxmp/libxmp_4.7.3.bb
+++ b/meta-oe/recipes-multimedia/libxmp/libxmp_4.7.4.bb
@@ -6,5 +6,5 @@ LIC_FILES_CHKSUM = "file://README;beginline=59;md5=b25470e2863502c9ac9886f09c21a
 inherit cmake pkgconfig
 
 SRC_URI = "git://github.com/libxmp/libxmp.git;protocol=https;branch=master;tag=libxmp-${PV}"
-SRCREV = "1e0812137e4f9e15cc026c0c75af82d71d3cb5ad"
+SRCREV = "5d4f6aa2c7dcdf8e9cd8129fe579d45b36a302da"
 
