Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1662.1792738461609926089
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Oct 2026 23:54:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=YXsl2VdV;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-886e61fa30fso281981b3a.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Oct 2026 23:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792738461; x=1793343261; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j6SnIGCQH5j4XGeMdbHMkQaRvRVl74nXMR5Z4zIFh2U=;
        b=YXsl2VdVudsMrDsqiDd2m4e8sWXgQdZYnI5Ex/RXkpOhR4VeP71yw77oxZkZd6nXK+
         YEISg6aeKtZTAwTDyv+NY/SRgreikn4y5BjIIG8rHCUgoaW12LmQ3B1suDpd012U2QrW
         WJm344ynweJL5vfPLISPwICjZQEYLr8RU86CbS46FzFifK2vwRxluEPjckOwGysosRaW
         ndU/dOqYdlLF6LRzHBidXyV5QkGJUIZART5xvO3Vy9RnWTy74tudWnLeSzDOrpMGruoA
         uvqAybsFGDL/2H5a0Kbhpc6SBBL3fZNNJWB1qcuEGcfBkpYgzB7HPkcXwjfvsDZvCjlo
         SK6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792738461; x=1793343261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j6SnIGCQH5j4XGeMdbHMkQaRvRVl74nXMR5Z4zIFh2U=;
        b=g1qcfvoEPUsklkfa5MnsFkLSQN4GQlkGoJOP+WJbxPwSm2KpDB8ts3i2V4/663IfPv
         Nzq8S9T+aWOHEOGNLG0+yvmo5gCqBtmkkzYfM2cs2D9MpF1sq5mDA+92Ee9wv0vrxbYn
         DAMZP0Q+yXFGrjcVw/QabmI3zBY11sjFUSq+d5ggJj5apxG+t3nT4Btt87ZgRFA0jKR0
         w6gOGdGEEK5f6zCXy4NDcRqsiMC00Gn68b0OrNE5AaB3f7RVquTfJoT7Qg3Nn2om255u
         OBzZwSzl+De15wVBeXG7Dfg73DeIA0cG7DMqZKREpP4sYlYMpf6Ee4eTrzzgETR/78Dg
         QPlg==
X-Gm-Message-State: AFq9FYJM/XXHn3UAGORVOUujL0QLefdCNd3efUNDetFXwSrMvgHhlgKM
	QHFDWGUjV0bPlTFSx0dpDoX+7hJZHds0oZGE0yjieoqvo54SXuSKqC141q3AIvRjbHA=
X-Gm-Gg: AYBFou2m/xJn7ld4NU0uqZyST37qugyHH/NjIvwpZXweLz+SyPd+qLig4T9Kc2h/o/G
	3/A7yhLC6bkVc0YA/Aj7d9Y3HTLEb0YMXRXDbBKNK0XWn/TZ0PfWXh3Fg0iefEcsKWSMSANX/CK
	LqgvU9rg7q/nVsvZOwSNMV2XES3mUzpBFullKyPPGlkPMBlz/hVDU90LoxKjfWROQuzRUaEvPbz
	wnAp0r1ospixwDsLnLx4zcxVZw5X5TMc6R4xD9/ulm+dXH6w0hykN6KdgrzfyJpNCNeIWnBVcZU
	42OIO3PjAc2s6PfJ7E2Y9fW84LKIXHH8Ir9UvnfWzxQXzXoz0OZJiN95sidOuIlzmfQo5fNTUfd
	FVhAxDZHMFA8W/bIcxFE0qZrgHXawZG7GBlNtiMlkbqsM/0HSwqUd+F1ypOUQ148gwcOiXtcnUL
	lWCecemDTzRMv8QwgOV/ge9OLOwKAwfxbpf90wq8drjm+JWAkRxt+LfRRWorHDHE5ovDXWxHiVr
	0zx0B9Npzkh63E0eGSfXmCYgZjbt3KLecCavW+GeRTaPf5YUZt48USr1P5R/TuGjkY6hvj3RVXu
	4lhXzKlzQ7pFRDXvIM0pKh0alNGpaX4C/1DYiCwGo5n+eetb/Qnn6Q3V/GXnzm1T4NTH9TJRzIx
	6jBm7RFhD6rSBiop20adAQKfQVhloKr77PVnbcM9yqJDJcOJRb82JyDsP/t8m7F4UNWP+fhjVFj
	icJ+VPvFe4hKWyW7DD/+cjO/a1U3dWBXFGR+6TD0Y/Sj8DaYHvV+Bq1mjUTgdgwZqxek0oh1qZf
	7JQna3lI0yF0QGGImQ+txOf9u6PcjU=
X-Received: by 2002:a05:6a21:9190:b0:3e2:aaf9:3a17 with SMTP id adf61e73a8af0-3e3692028c5mr1109610637.25.1792738460994;
        Thu, 22 Oct 2026 23:54:20 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a2c92f7bd8sm384769b3a.50.2026.10.22.23.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 23:54:20 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-gnome][PATCH 23/29] ibus: Use native pkg-config for build tools
Date: Thu, 22 Oct 2026 23:53:44 -0700
Message-ID: <20261023065350.3228996-23-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261023065350.3228996-1-khem.raj@oss.qualcomm.com>
References: <20261023065350.3228996-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 23 Oct 2026 06:54:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131347
Content-Type: text/plain; charset="utf-8"

When cross compiling, ibus builds unicode-parser with CC_FOR_BUILD and
the glib flags from PKG_CONFIG_FOR_BUILD. That defaults to the native
pkg-config binary, but with the target PKG_CONFIG_PATH and sysroot, so
the build tool is compiled against the target glib headers. On 32-bit
targets glib's static assertions then fail with the 64-bit host
compiler:

  glib/gmacros.h:910:31: error: static assertion failed: "Expression evaluates to false"

Pass pkg-config-native, which uses the native sysroot, as
PKG_CONFIG_FOR_BUILD.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-gnome/recipes-support/ibus/ibus_1.5.34.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-gnome/recipes-support/ibus/ibus_1.5.34.bb b/meta-gnome/recipes-support/ibus/ibus_1.5.34.bb
index b9f2beb7d3..274ca1f1b8 100644
--- a/meta-gnome/recipes-support/ibus/ibus_1.5.34.bb
+++ b/meta-gnome/recipes-support/ibus/ibus_1.5.34.bb
@@ -41,6 +41,7 @@ EXTRA_OECONF = " \
     --disable-python2 \
     --with-python=${bindir}/python3 \
     --with-ucd-dir=${STAGING_DATADIR}/unicode/ucd \
+    PKG_CONFIG_FOR_BUILD=${STAGING_BINDIR_NATIVE}/pkg-config-native \
 "

 do_configure:prepend() {
