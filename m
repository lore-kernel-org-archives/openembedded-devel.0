Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2520.1794961609253206610
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Nov 2026 16:26:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=eGvPA6U+;
 spf=pass (domain: gmail.com, ip: 74.125.82.48, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-170135e43c7so744981c88.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Nov 2026 16:26:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794961609; x=1795566409; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SCSYIFxTe0sQGLxum4mWY3c2ey3Gbux57Wjm4JOof78=;
        b=eGvPA6U+mSt/t3JFSYsrVJ0SmMxt2yBjKYk1tHaOtKHhvAUYwu/sFyEWQFdFE8GjSg
         SgJOcn1QL17Wsx6OKbibx/q04Q68OySJH+rPUdNzHjJ2eeUBh+tXJbhu0uZ7wGliO0+/
         J/PYSUy88FdQu9ju3/VQYk5E7JDO0K39HMG9J/0WhgpuA8mDIviNah43lkaQiaEyhtw1
         f7NDZlm/2dQZuWrCamXrZcRoQ4eTT2yLga8w9eKSDYtTtzAjK1SWoQY8tsAnTSkWo9m1
         qQ9AOXW+ZlFOGVJJk5enet1GCz0PnILshsPd9ksBPHrL/Yi5fjlOIDRLFFhEo5La4e4/
         wQyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794961609; x=1795566409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SCSYIFxTe0sQGLxum4mWY3c2ey3Gbux57Wjm4JOof78=;
        b=ZiJy4WrvZhQdIRpUUo/HxoL/6RHHlGpZ5474Xtr7vp1n+/ppslwqNqojnYaKvARVFv
         FAz6qIA9wVg/yNshHm+f35Uz5QV/tNIqBsz7ckxdWUAcf/WRhOgVPjENl0uld7T3nNiV
         C/aTBbUKQTnplt6Cj+o4aaJ3cVlXHRqkS262XeSRzDxCHuQoqlwHZu0GUangOLcwQKP/
         z+laxGTO8M7ledaxY48oj8rxwqgJZvYrP+8ilkKJWS0pnwJ1GW1c94l5UC3Yf0U31U1W
         sPbVeAnMWep/cm0GlCj0GxfRymP3TvkzoweQSMcQhMfe9bol5F6DK3TQ/2bYAe+oCiqG
         kM5g==
X-Gm-Message-State: APuU4Z84oLHJlCvHrc9CaQWU+L2Y2AUJXjpJLyYxZTt4kyJ3V1wmEpdy
	kqMZP0sKIw8cAr0uiNvsNeuvQMHDOw28cG82112iszvOfmE+xVh6/dVYsdvUesJ7
X-Gm-Gg: AYBFou2HWo4B8gKSS+TE+8U5Bg1Au7wJB/6us8TFTbfHizZbyN95yzXxj7Oa7Oan/+D
	7zf6/3gU9aLJF+Z8fmza4AJug9HBbE0cTEjjErm5HRowOe15hWtl+72OVjMYtELlPc0nY3iHlUV
	4B2ye0B6TggoMRQ4Jv8mJquWgluUbrSI26rEuQ1NsOWsXpqEgpl7o49BNMn87pfGABTL5qM/K3K
	okL/h12J5FKhflVDINnAABHkAs2yRME9+FrEqXYwe2tKXQEVhfZIizZz+J/P4JIY9M79S49mUrh
	hKTKZ+iGKsmCsTdz+B4kHg82yfcpnosHeLNEND8Iu+g3aqmG0zDVFdTAOPeZqmrh64GDd1QHVZ6
	vBS/bSqaxPR9CUh4AICH29AR5vWA7c2cRFsq6rCadHPTD/71DCWU7J64QVRmSLRuK/BVUSLM7qg
	55/TyiKL10k5QE2jUwNc5qNQGSpwVmGbTggY0c6Hmdj1ey/oEzVIfkR7TMi+61Tf/eFbbOMrf6/
	rIT7yIc5gA3VwXkqXDptU7AIVd5TlEjGaQqbgz7eVe6IRyyLYuHQsZcNGZoEJ0zorHonFjRo5B+
	RU7flrSFzQNAGQS4MHS5GcscPzSd2vdscin2+WMlUSs6RqefeqgWbU04PkvQuuthBNHRcarc4QW
	DHh/n/9oPsAnPtbkzZOBV5eTYqUJmQKToseXqJKGc6zUGUJklpdS1VOuw7BNS/UZXWjYXpHpimC
	WijChNBUROq+VUvDAUC4dEF49SyPpAMRuRW/9/7/kR0mczjZbvdfrlpb4CYx4WI5QibH3I01uyY
	C+XVnhIVqNDpDAyguE4TWC7tG77EZ1tFaDlR91+6NcfGl+HpjM9/C+dFGqkqKc3YwiUD9mAML3i
	KfeO
X-Received: by 2002:a05:701a:8447:20b0:1b0:4272:4282 with SMTP id a92af1059eb24-1b543c12486mr1097011c88.17.1794961608538;
        Tue, 17 Nov 2026 16:26:48 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a7fbceffsm1697015eec.28.2026.11.17.16.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 16:26:47 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 03/14] gcr3: Fix LICENSE
Date: Tue, 17 Nov 2026 16:26:31 -0800
Message-ID: <20261118002643.29829-3-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118002643.29829-1-khem.raj@oss.qualcomm.com>
References: <20261118002643.29829-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2026 00:26:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132604
Content-Type: text/plain; charset="utf-8"

gcr is not GPL-2.0-only. COPYING is the LGPL-2.0 text and the sources
are LGPL-2.0-or-later and LGPL-2.1-or-later, with the ssh-agent code
under GPL-2.0-or-later.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-gnome/gcr/gcr3_3.41.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-gnome/gcr/gcr3_3.41.2.bb b/meta-oe/recipes-gnome/gcr/gcr3_3.41.2.bb
index bb905265ee..d9832b02de 100644
--- a/meta-oe/recipes-gnome/gcr/gcr3_3.41.2.bb
+++ b/meta-oe/recipes-gnome/gcr/gcr3_3.41.2.bb
@@ -5,7 +5,7 @@ GNOME desktop."
 HOMEPAGE = "https://gitlab.gnome.org/GNOME/gcr"
 BUGTRACKER = "https://gitlab.gnome.org/GNOME/gcr/issues"
 
-LICENSE = "GPL-2.0-only"
+LICENSE = "LGPL-2.0-or-later AND LGPL-2.1-or-later AND GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
 
 DEPENDS = "p11-kit glib-2.0 libgcrypt gnupg-native \
