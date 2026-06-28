Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6623C43327
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 08:12:48 +0000 (UTC)
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14760.1782634368132534463
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 01:12:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=knu0fTIS;
 spf=pass (domain: gmail.com, ip: 74.125.82.53, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-139b5e604b9so2761764c88.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 01:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634367; x=1783239167; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D6ubQdDG4cPVapwqL1RRTUS5GvyapjseFcQFCt3FFAc=;
        b=knu0fTISgqV+lp+xOcKJEOMq7C9ltKMTjHBvVcH09asS41Xfr4ZZg+uDaMNWJdWg5U
         w5yXqQ4OLCR/bghYJEwu4f1lgNz+bIEo8Kn/EygJkLMB/muob62r/pGq9kmyY0XSxUmR
         brXwvc0nBFg7LRcrDoK61zgLYDwh2sAFxrl4unRLCuR9J4YTIfWcVNj23DGIurwXjK49
         LrYuLpK6Nj6HxKc8ISHeKTuHxYLHdRZnQ6rt7s8pdPYL6S5f7HYFc7zk83pGv3l4lax2
         PcbhYL9wRXg3/tCsB2oMEN2npSA26hsaH7S4ceEHf9yaoFyRJicGGc+zup6ZZknbbZ3B
         TDRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634367; x=1783239167;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D6ubQdDG4cPVapwqL1RRTUS5GvyapjseFcQFCt3FFAc=;
        b=l31lHAMJOXwpMemNQM1gvf0JMekjoBgn9YniqrsIw2vkwJic7LxnGRWJZVV/aNODin
         HqaiGrVbbw52Wty1Y3p+Z5dSy0VhrjwhpSVqznSXsFTTzMOydHKVmWTZHdRhu0neGJoL
         OoSFWgXof2HhNZw7naX5Eec+H6MatkZ2znST/41eaSvUOs3iD8CuwR3t3kFCiey66v0t
         u93+AMil03GMHSJKJzx5qTJLI1WbyyNKP9gG+faxWDAE6t+tZPmZHfa/sUbC9vVdK0Jc
         OtJcRmPO6iw4z9tz1D6WZ2rbkYxkuhASYiDKGW4fxtMtkLwqD8307NOYVypXpcxqItoB
         aO0A==
X-Gm-Message-State: AOJu0YxdMHsfWgqOILG3tyxWDkILYIVUsSFHxTtOovAbuY/N5XLaBRfU
	qPpJqsPQLGGBdY9vmms2IWakpt3GL6mliD9jnb3MRzxvilHtIs1tAcRddash8boIv4zvtg==
X-Gm-Gg: AfdE7cl3BJA8tCkSXRFei2sZetPeULrSu7xhseSkuhIpDkRGUdUH/VdGnSMjWsatv42
	4+uTEEF61oaYSzWI1p9la4g9IrGnNqHugk3CbGxRFnKKejoxA1FUncV/xTb5qag/ufCJWak3rVe
	FB+VfJHjzVJmzd2xlU2fmg95xY1Uq+Tvd8wCmA9ie4O+UtBUVMlYmwQtTjaTTMQmbj2iYYuB/4p
	YAO9xRekFAlI10hKcbwR2ZhJy/9Ywjl229NbyBxSifkYfZ42YSqb77RXnKhHv4xiNX+JDajhq7l
	RzL+DiileaWieU0BzK5CCBJ5C8lDDGItzLBPAUT1d5BpuOSJEK4Id/KQCaVd1y4np5V3OIZwR04
	Tc63zhrYTzwNNLwvcg6eGY/GnxRS8xLnKwpFVRZ1i4127jwW0yWxIFTk64su1UV4cZcWs/266zp
	O//SVIKLvzUO5Le+n//C8CasCcae1gG2+1nIlSo5I18W5HbwdJRO2AoDeKfNQ+LVHxX11+8lBy0
	gKaF+jlNbTTJycwW+dFEVDHk6OYIX3tbtseJ0HaA2Bj438AbWHNEQUz019MdeO0Lrammn9Gn6hi
	AclAV100DPCgrcX12wF31TFj7UadaQ==
X-Received: by 2002:a05:693c:37c4:b0:30c:1865:d9f6 with SMTP id 5a478bee46e88-30c84b2b6dbmr13300397eec.6.1782634367389;
        Sun, 28 Jun 2026 01:12:47 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ea81b39easm6306040eec.31.2026.06.28.01.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:12:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 089/128] ipmiutil: upgrade 3.1.9 -> 3.2.2
Date: Sun, 28 Jun 2026 01:10:40 -0700
Message-ID: <20260628081122.178348-89-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
References: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 08:12:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127899

Refresh fix_systemd_path.patch for 3.2.2.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../ipmiutil/ipmiutil/fix_systemd_path.patch       | 14 +++++++-------
 .../{ipmiutil_3.1.9.bb => ipmiutil_3.2.2.bb}       |  2 +-
 2 files changed, 8 insertions(+), 8 deletions(-)
 rename meta-oe/recipes-kernel/ipmiutil/{ipmiutil_3.1.9.bb => ipmiutil_3.2.2.bb} (95%)

diff --git a/meta-oe/recipes-kernel/ipmiutil/ipmiutil/fix_systemd_path.patch b/meta-oe/recipes-kernel/ipmiutil/ipmiutil/fix_systemd_path.patch
index 2862793b05..c094b13507 100644
--- a/meta-oe/recipes-kernel/ipmiutil/ipmiutil/fix_systemd_path.patch
+++ b/meta-oe/recipes-kernel/ipmiutil/ipmiutil/fix_systemd_path.patch
@@ -13,11 +13,11 @@ Signed-off-by: Armin Kuster <akuster@mvista.com>
  LIBSENSORS=""
  SAM2OBJ="isensor2.o ievents2.o"
 -SYSTEMD_DIR=/usr/share/ipmiutil
- 
+
  AC_ARG_ENABLE([useflags],
      [  --enable-useflags    include environment CFLAGS and LDFLAGS.],
 @@ -211,29 +210,42 @@ AC_ARG_ENABLE([gpl],
- 
+
  dnl Does this Linux have systemd enabled?  Otherwise use sysv init.
  AC_ARG_ENABLE([systemd],
 -    [  --enable-systemd       enable systemd service type=notify support and %_unitdir [[default=disabled]]],)
@@ -79,7 +79,7 @@ Signed-off-by: Armin Kuster <akuster@mvista.com>
 +	fi
 +fi
  fi
- 
+
  dnl start main logic
 @@ -563,7 +575,7 @@ AC_SUBST(INS_LIB)
  AC_SUBST(SUBDIR_S)
@@ -89,7 +89,7 @@ Signed-off-by: Armin Kuster <akuster@mvista.com>
 +AC_SUBST(systemddir)
  AC_SUBST(SHR_LINK)
  AC_SUBST(pkgconfigdir)
- 
+
 --- a/scripts/Makefile.am
 +++ b/scripts/Makefile.am
 @@ -17,7 +17,8 @@ cronto = ${DESTDIR}${etcdir}/cron.daily
@@ -101,7 +101,7 @@ Signed-off-by: Armin Kuster <akuster@mvista.com>
 +systemddir = @systemddir@
  sysvinit = ${datato}
  sbinfls = ialarms ihealth ifru igetevent ireset icmd isol ilan isensor isel iserial iwdt iconfig ipicmg ifirewall ifwum ihpm iuser
- 
+
 @@ -47,10 +48,13 @@ install:
  	${INSTALL_SCRIPT_SH} ipmi_port.sh ${sysvinit}/ipmi_port
  	${INSTALL_SCRIPT_SH} ipmi_info    ${sysvinit}/ipmi_info
@@ -117,6 +117,6 @@ Signed-off-by: Armin Kuster <akuster@mvista.com>
 +		${INSTALL_DATA_SH} ipmiutil_evt.service ${sysdto}; \
 +		${INSTALL_DATA_SH} ipmi_port.service    ${sysdto}; \
 +	fi
- 	${INSTALL_SCRIPT_SH} ipmiutil.env.template  ${datato}
- 	${INSTALL_SCRIPT_SH} ipmiutil.env.template  ${datato}/ipmiutil.env
+ 	${INSTALL_SCRIPT_SH} ipmiutil.env.template    ${datato}
  	${INSTALL_SCRIPT_SH} ipmiutil.pre     ${datato}
+ 	${INSTALL_SCRIPT_SH} ipmiutil.setup   ${datato}
diff --git a/meta-oe/recipes-kernel/ipmiutil/ipmiutil_3.1.9.bb b/meta-oe/recipes-kernel/ipmiutil/ipmiutil_3.2.2.bb
similarity index 95%
rename from meta-oe/recipes-kernel/ipmiutil/ipmiutil_3.1.9.bb
rename to meta-oe/recipes-kernel/ipmiutil/ipmiutil_3.2.2.bb
index c85bfc13af..9634ca476b 100644
--- a/meta-oe/recipes-kernel/ipmiutil/ipmiutil_3.1.9.bb
+++ b/meta-oe/recipes-kernel/ipmiutil/ipmiutil_3.2.2.bb
@@ -23,7 +23,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/ipmiutil/ipmiutil-${PV}.tar.gz \
            file://fix_systemd_path.patch \
            file://0001-ihpm-Include-stdlib.h-for-malloc-free-atoi-functions.patch \
           "
-SRC_URI[sha256sum] = "5ae99bdd1296a8e25cea839784ec39ebca57b0e3701b2d440b8e02e22dc4bc95"
+SRC_URI[sha256sum] = "37f9bc8e6b18c1155e4d5ea38c87b83908b7acc7a44fbc5e3af493f26ef8b767"
 
 inherit autotools-brokensep pkgconfig systemd
 

