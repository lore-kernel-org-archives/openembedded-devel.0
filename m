Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10286.1795753068509044017
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 20:17:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=hhyCeMyw;
 spf=pass (domain: gmail.com, ip: 74.125.82.54, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1b3b4944a0eso5739725c88.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 20:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795753068; x=1796357868; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A2RzQLqfv0YkRucuB/uo3IaYI5C7fQuwKoKCNeW/pBo=;
        b=hhyCeMywmJt1Zim34XZPSUqQ+v6DWyto/r3qxAcFhQJ+i8sjsJVNpcwh92cm+y4dYo
         8WVckIbXdwYpUwrxB48vFmDcLGLDcN7mbT6cD57KWSiklXzM0Kn3DHBQPuHhCSWlbA+y
         kf9R1szF2cT/X0I7PMYWT7g6FIxzL65QNAhVRVJA+VKGFPFG9W5cO9N7eojDw7OAEz71
         t4AnYccvJtjkwLNyBbw33sH5x9rDkVzT4GzrzqUwtl9YWOofKk5E4i7cyXYfKE3mS/iI
         uiY5S6+jFI5WoAuqOpnLfik32WHgRtQ3YS7eFfqpg/vUQTBpm/+BPZU7oAImQ9Wv3Eys
         kvSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795753068; x=1796357868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A2RzQLqfv0YkRucuB/uo3IaYI5C7fQuwKoKCNeW/pBo=;
        b=NE1kymhkgZJGRbznN//m5IHo33SIO+0tUYCx59do23fn8RVVdbJIcfBsfQbLFS1X+G
         9FHCo4DLF2BtdWh22W21+XkFq6AsOPxkyRYwyK2d3+e0HMy1jz2ysyW1jti9b4cMPa+Z
         eOQxsvuQhjkVQA7tuvlt/K3zVgITlhCoTWR5Ts5mI/hIJByPRm2g0dV5DRk4sgseFYKa
         FIpdep6OONsB5EB7Ajda/j99Iv3gZvutzTfs9pEXpaTIslHMdi2Jxae2YHGc7ZAB5784
         mfz4cMJrxqd3a3cOJW19058nP1IJFAAjE0Q0i9L0y/RjzCutY6hxYx7WiOz69nnjHARJ
         D9cA==
X-Gm-Message-State: APuU4Z++bTIJ7Q308xO8DffnDYEcxre9qcp90p28Bpkh8TvVc3zXvwfA
	DMSlemFQft6qPFgSFTCD6uQ2647fY2dMYKir6Mde2dsUiOQB1bu5WlLbhSIP6wfL
X-Gm-Gg: AZFdTZegOGyEyxQi9DFUDQkzv+ptyZIwfXKZu+SvTh2fSUpM4iKryn5gf4uOkNhUg6p
	oQh5IErIsPSGV8OtCnLsupPHO6vP607BElGOfzK1DFeT5BPS8qtOfKykJex4F1S0ufxs1JNGDyY
	V1zu7lsRYyCC8SoFvrBqlgVYkdw9grb99hH2BwdbTc0eOhC+BsLWmxvc41o1xiFQOO6p06AkVOV
	9C1DmR7ku7NocdvAUE/FUFgtWWBPGHwaaR2F/2AxVyDbEbb7dnR2lO6vAinYz9XdfS6+Zi7AAdh
	r+4U8dwKCD7xJIzos2kaB+CB2qaZZ6Bo8rp/87z3nk5Mikg2hSWggy5SiHtxlb9prftQgNkXuud
	RAYQ2pjYucrj5x8WlVfphubPOCVrG9rJVJD7Xk2fi81QId4NrkTNiber4lSgppNrHeBXjBht8b2
	/9Nne424+PHRww5/su3NMhADF8wZCfA5/2NVu0J2zb+qLfHFvrz+HYFQzsnCO82DnnN4wjhUMlW
	eis7U5CAsrGPenHmNvP1efPTcUaesN0fdUJqq1BYzDnUPM78iEoH5ICanUgmbKZwJ/Zk2moS8O6
	0lQ7n3YTezXY4Ed0xMEbEwOR49d2pxDJJqgW5kTecHH4UCwuvzIv6GJxyqz4h5xw/6k0qw6gewA
	DubQtqzNqvUqJSwjXbXD+UeyoHwTNZNFIaSRtg+BR8246ouU3GVE6KbdbfJ4VLghEtnyNr1hQ0d
	o3SZrHQCw+maqrcY/e56amPvuHDQ7QWR751P9EbBjfc1JZvpn4Sr53Rh02UMnhouWXJNM+dia4i
	wIwqau7c6O8z5OjxcfCI622nG2TefgZc6Voo57WHZP33TZymDrqzeOSiRZyngYWkFD/G3nPgWbe
	sdXx
X-Received: by 2002:a05:701b:4648:b0:149:1feb:6da4 with SMTP id a92af1059eb24-1b5568f12a5mr20412513c88.32.1795753067833;
        Thu, 26 Nov 2026 20:17:47 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556840494sm53880225c88.12.2026.11.26.20.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:17:47 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 27/35] nbd: Fix upstream version check
Date: Thu, 26 Nov 2026 20:17:07 -0800
Message-ID: <20261127041715.1776485-28-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127041715.1776485-1-khem.raj@oss.qualcomm.com>
References: <20261127041715.1776485-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 04:17:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133279
Content-Type: text/plain; charset="utf-8"

The default tag regex picked the Tizen tag
accepted/tizen/unified/x/20240326.073118. Only match nbd-X.Y[.Z]
release tags.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-networking/recipes-support/nbd/nbd_3.27.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-support/nbd/nbd_3.27.1.bb b/meta-networking/recipes-support/nbd/nbd_3.27.1.bb
index 039786d3a5..909f42a9d0 100644
--- a/meta-networking/recipes-support/nbd/nbd_3.27.1.bb
+++ b/meta-networking/recipes-support/nbd/nbd_3.27.1.bb
@@ -10,6 +10,8 @@ SRC_URI = "git://github.com/NetworkBlockDevice/${BPN}.git;branch=master;protocol
            "
 SRCREV = "f96f7fca3b37f4254c26c95f5c6c9dae70e030a1"
 
+UPSTREAM_CHECK_GITTAGREGEX = "^nbd-(?P<pver>\d+(\.\d+)+)$"
+
 inherit autotools pkgconfig
 
 EXTRA_OECONF += "--enable-syslog --enable-lfs --disable-manpages"
