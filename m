Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11773.1795762879005235294
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 23:01:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=NxkzxLgP;
 spf=pass (domain: gmail.com, ip: 74.125.82.54, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-14394530ec6so1572255c88.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 23:01:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795762878; x=1796367678; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bt95nbswolAi6SeaQDD2wjtRAq/YJHLMuGcOjuuNvA4=;
        b=NxkzxLgPjuoT9dJ1D2TrrZeIG7LnVhcTUgBZCQPGbf2rnVhb5wZE1KCA/EinPY9W0h
         yq5Ccm2Gj47yiHGcbMKzkd4WqJvJQyUDMddSmM1SBEX9c4meK4PpkgdU5C/IyPPnIa40
         EmZD+VYXFIYFmFFyVWIYjd69mSl8GRSM0ozAaFpcvgKfGfT0so8VYZVd4ZUhgo9P83Gd
         DKR7j7YKKK8vptOZmDMeIcxipD7YYbAZkwBP831EWyEv8tUWzWetzC1JC9DvjQ9uqS/u
         6ufFkTQPHUsjzGpcRnjvc8RUlrivupDkhkcCCjMbL8F+Xoxerf/RoKc7vzQUeL2D90SN
         rsEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795762878; x=1796367678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bt95nbswolAi6SeaQDD2wjtRAq/YJHLMuGcOjuuNvA4=;
        b=AnmZOyNRH/IE6uZCKaL8T4pT3qdM76l5Kcu57fEHgwEQ73AqlWMzbXbbiURRivVBvC
         TCwMdMnoUlhtxt/N8/5KT4rNjV7DYBkoDtqaNrmFMpmDSruYUpERXxKfucSH3YQz3hgi
         IYlAqsXmy9Tbpw6hzgCfgwAxAQGuiH2CEmWcUKLPmFrCEC+UEkASQWYTPQjjFFGLAGRH
         ucExrT2altFfswsP5zDTAXzOeP0rsrJ3vbPVJSPn8Zi65g+iIO5R74PVdcKJsGSblkJ7
         Z5p6Xsxn4PkEQtQVtjXpWypdUJO2n7/wfBdozwG+aRwMnq0Y3Q0bavQl+W3LudHy+srW
         5FnQ==
X-Gm-Message-State: APuU4Z+CTq1DIHjhXWtZIgzPy0ioT08alkpfyXVW9S4pPkTiN+uVrijy
	9T7xU98ptZdc5eo/cRgIthASi37HyS1xXKV1W40wlyWysAFIG2oNB+nNu0s1Mr7y
X-Gm-Gg: AZFdTZcjQ7FxBWxNapalrgPvNWCa5lgJiXbuG9Q7PZpWwZctPJs/6PJsZoDsyWFS1we
	sUad2mLv8WOtIQ7OmecYSXku46pyr7JUDOzVvzk7Dh3JC058YdMlAWyd+xujrH8Fo1UUugPotj4
	XLJKffqroTvXEXBcYxSPLMdu9RhEowK0QXvg+rQMt6U0kgNw3MuPHLydwQ8Tm4WPxwWQxzr6pCB
	zFrSnzL0t6gQdXnOe5C6Uvm/juJ/sng/Sih1589pcBmRiYpOmjn+zBtstbsrlXrVkXj2z0gB+5v
	Pj94ySm6SV+kE+p2RihNiR4cr+OgpaM/rUNsnrnXtiSO7GetGV/fdjqn2o2Tfw5e2Zaw68v/X6K
	Akwco4QdLGBbQ9Uz5XO5KNYxTyfxJdkjCFVUjwij4WBMpvajryPfKpti1PdQa4whlT8kG9EdTyx
	ujdGuNubZ6L+JKe3QJBDRHIxHf9HbTou+0e+dYiC4dIhCw3BSwFmTQKAod1t0DjvoJRXi2LAy9v
	xG0AwdbDS307mfcYLvFFZFHcVXpvDyaqTFEftLWqOyEO/3KROQpFIVwxydPeleyNI9OmRFCxs7W
	GHTurg3eaqzqqFoCaQRGKw7TSOo7zBFR9Z4BrYayhI0kQESdr34W5zfDJwnvRu0jtMq26bffW0y
	iRMmPL27wHSoNSFuzkpZwBuWNTWaP/NH8wo4lScNHDmmRoNU+A0WsyDcVdjy3m+AqfiKdZgxIhH
	ET93+yT/04W98XcGRYF4rPRc3eXGu38oor4uXwyu8AUl/08rR01/xxdK8ZWp9uILT41Dl+DFA3d
	B95qcIF+ngcSxoDbB34/CQYPgY3pKwTs5UbLYFFD1WFHob6ZGEq9PUgdGNPApFFiPxgtChWJj2H
	gFB3
X-Received: by 2002:a05:701a:8148:10b0:143:2719:f800 with SMTP id a92af1059eb24-1b556908ecdmr21726961c88.40.1795762878135;
        Thu, 26 Nov 2026 23:01:18 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm61309643c88.13.2026.11.26.23.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:01:17 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-multimedia][PATCH 02/14] libdc1394: Fix upstream version check
Date: Thu, 26 Nov 2026 23:01:00 -0800
Message-ID: <20261127070112.2273685-3-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127070112.2273685-1-khem.raj@oss.qualcomm.com>
References: <20261127070112.2273685-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 07:01:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133307
Content-Type: text/plain; charset="utf-8"

The SourceForge mirror URL gave no usable listing, so the check found
nothing. Releases are in per-version directories under libdc1394-2
on SourceForge; check those directory names.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-multimedia/libdc1394/libdc1394_2.2.7.bb            | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/libdc1394/libdc1394_2.2.7.bb b/meta-multimedia/recipes-multimedia/libdc1394/libdc1394_2.2.7.bb
index e1f3b0f2fb..f300204e06 100755
--- a/meta-multimedia/recipes-multimedia/libdc1394/libdc1394_2.2.7.bb
+++ b/meta-multimedia/recipes-multimedia/libdc1394/libdc1394_2.2.7.bb
@@ -16,6 +16,9 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.gz \
            file://0001-juju-Do-not-use-variable-length-arrays-in-structs.patch \
            "
 SRC_URI[sha256sum] = "537ceb78dd3cef271a183f4a176191d1cecf85f025520e6bd3758b0e19e6609f"
+
+UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/libdc1394/files/libdc1394-2/"
+UPSTREAM_CHECK_REGEX = "libdc1394-2/(?P<pver>\d+(\.\d+)+)/"
 inherit autotools pkgconfig
 
 EXTRA_OECONF += "--disable-doxygen-doc --disable-examples"
