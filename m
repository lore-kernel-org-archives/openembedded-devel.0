Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8114.1795739789018165026
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 16:36:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=wd6jW+hk;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2f037bc348dso59867115ad.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 16:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795739788; x=1796344588; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SaI6+gDvk+3cxFmLpd+tog9Asyv/idj2apEE+EuAwrY=;
        b=wd6jW+hkqjDEq0EbAtxAHIi+k02NtcXaFgBt6PLF4W+BCi/RMiN1DLZ4SLSG5wSG3H
         LCb8yqhL/ozSBt4JpOKmhqLhc3yD3neRT8QJacIj3PtfU92IilTrZP1Viz2Cs0zc9qT+
         RfrmPNwPDc2dC7vspoPfjj9CFvPOE4tsmSvNrek4kD4hFrjjGuqSS5uRKjC0KniuRWjV
         xkY+t2D6bc0SbzvEciJD78rhp/jxJE6scGcmCR4Q80hV828YANZObJlHdVnZRnjVOm/7
         sBVxahcQ+jVgxwM3oye8EZ9h9ICBv/VKFmfhTPPXmDBfvm5rqlNHg6UTZRg+pZ29wyp2
         mSqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795739788; x=1796344588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SaI6+gDvk+3cxFmLpd+tog9Asyv/idj2apEE+EuAwrY=;
        b=pkdqkERJaV+TO3RIy6+icouXxQD4O4jRRmezf9JF6STlICN1hjKa4+iVasx9EcJADv
         9Ka2qjz6DpkrLDEvDSQFs0gS24jmoUTJd6NjjOPA7GUcgl1O8tA7Q0tQUGItLOGkrN2V
         1ppKFG6TMLkZ6OBQwgLDrrdH0UU9IkY89u1/IiWaPwacExrwF9ggs9sE1e4Yq0YRz+V8
         AD7y/06mzL2yQZ5z/lRvbY4LYRR8Y/ktcPl/HBHaems3mehkkuP7tVJWmrMhRAJNt6xt
         ccE4YD5JO70+mc9IZSqp1fS2U0fgDP1T7K7fgcYCZk3W8QICt3JvZVNlSzbqVQPH3+Fj
         2htg==
X-Gm-Message-State: APuU4Z8IKXi3O3mCrHYEjEeXi9XiBolhP00i1FbOpRo5WQTRxkNeoM6I
	Xo9PGOln2FTmKSdVVuSikPdrCklPzwvUur/I4aIpy13hx0EU3l+JOFOiM1znUlZt
X-Gm-Gg: AZFdTZenrhjqLrBcCEFw6xj8zR/MhXq4SxjGqgRfV5VsjWz11aBt5HYiT//VoCqd+5C
	+b8jr7X7lzJbJNhtoXOrVW9WottoP3ZU0pSdL2dvPz0s/rDaalCLsF6Z4lKY6DKl37kIAvpmiIC
	t2n4bbTYUC3wUVp/pCAJt++ziVJsWfMxJKptZtKPnhimFTgwYm6iEpeyN8A6gkTVgSEd09OsPlz
	GBq5fWzdjiGnPbZeqSzi/ZFzryxZm8E+F8fPL1T+9KMYY+LCjRE1pxxPk/PU6VcgFofNYW0ByXw
	6xdOQyY14Qayputk2gkH2e+lzVnKI+cIX88tBE7BHnX1h1QcFExmZO3QAftS3pq9Al2qArbgXzl
	7D7r7uR2eKiJsVvfAfdWX0kBzOefbLDrsXW0c/TTnDhVrNufRSE7njDigvkWKh4Rqi4Z+4ciHzG
	jYgCulaon3gGmg/Cts74rPJYPya81iazg9wT9dGM1FM9ueCoTvInKMAJzWBTaAJl/MjNx8EOqBh
	1f9OUQHNeZn8qCAo1/vXfSYMncElI94qoA3oK44MI5S+mI0io0HnR30NmGby271xxKgbRI/pYb+
	mrapt8wR+RRFquU24NrMEgg/u0/w7f4utJ0rirKNnov/HrxkX2PnHB7Timj+o7VG+VpuFA/niNf
	erHs5DHFIAKmyl7DfzQkyxRe/3qS/PJwlvv+rxXbbzXmMFoTmNKcNnhMf/KMaMhf9xBMdte+hTN
	g80SpF7YnSWFsRwlyXjVK+0QLUliJdf4pR3htgiFvB1AwrPNPucM65KObz6gqiLIdPDcqyc072n
	tSlgevD8uIj4K2d+SJngXXyLrREkt/ZY6Q0VV0W9OhYf5mAMxmn4zgpqu8FFeAj3KKk6+nKJeb7
	m6Lq9pzoJyp7Ska8/uJdySpd6A==
X-Received: by 2002:a17:902:ec8b:b0:2ef:f4c2:d65f with SMTP id d9443c01a7336-2f03f248b82mr208757395ad.33.1795739788305;
        Thu, 26 Nov 2026 16:36:28 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0fe9e36f9sm10410875ad.55.2026.11.26.16.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:36:27 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 19/39] libstatgrab: upgrade 0.92.1 -> 0.92.2
Date: Thu, 26 Nov 2026 16:35:23 -0800
Message-ID: <20261127003543.2167775-20-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127003543.2167775-1-khem.raj@oss.qualcomm.com>
References: <20261127003543.2167775-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 00:36:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133189
Content-Type: text/plain; charset="utf-8"

Bug-fix release:
- Fix buffer overruns when reading process command lines and when the
  number of entries decreases between samples or grows from zero to one.
- Fix use-after-free and double-free errors after empty or failed
  statistics refreshes, and a memory leak when cleaning up user stats.
- Initialise process session IDs on platforms which do not provide them.
- Fix virtual memory usage calculation in the vm_stats example and the
  build on OmniOS.

Derive the release tag in SRC_URI from PV and anchor the upstream check
regex on the release tag.

License-Update: COPYING updated to the current FSF text; the FSF postal
address was replaced by the https://www.gnu.org/licenses/ URL.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../{libstatgrab_0.92.1.bb => libstatgrab_0.92.2.bb}      | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-extended/libstatgrab/{libstatgrab_0.92.1.bb => libstatgrab_0.92.2.bb} (77%)

diff --git a/meta-oe/recipes-extended/libstatgrab/libstatgrab_0.92.1.bb b/meta-oe/recipes-extended/libstatgrab/libstatgrab_0.92.2.bb
similarity index 77%
rename from meta-oe/recipes-extended/libstatgrab/libstatgrab_0.92.1.bb
rename to meta-oe/recipes-extended/libstatgrab/libstatgrab_0.92.2.bb
index 85d3853f4c..89ffd9b4ac 100644
--- a/meta-oe/recipes-extended/libstatgrab/libstatgrab_0.92.1.bb
+++ b/meta-oe/recipes-extended/libstatgrab/libstatgrab_0.92.2.bb
@@ -2,19 +2,19 @@ DESCRIPTION = "Utilities to collect and visualise system statistics"
 HOMEPAGE = "http://www.i-scream.org/libstatgrab/"
 
 LICENSE = "GPL-2.0-or-later"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+LIC_FILES_CHKSUM = "file://COPYING;md5=570a9b3749dd0463a1778803b12a6dce"
 
 DEPENDS = "ncurses"
 
 PACKAGES:prepend = "statgrab statgrab-dbg saidar saidar-dbg ${PN}-mrtg "
 
 # don't use the git tag unless docbooc2x is available to build the manpages
-SRC_URI = "https://github.com/libstatgrab/libstatgrab/releases/download/LIBSTATGRAB_0_92_1/libstatgrab-${PV}.tar.gz \
+SRC_URI = "https://github.com/libstatgrab/libstatgrab/releases/download/LIBSTATGRAB_${@d.getVar('PV').replace('.', '_')}/libstatgrab-${PV}.tar.gz \
           "
-SRC_URI[sha256sum] = "5688aa4a685547d7174a8a373ea9d8ee927e766e3cc302bdee34523c2c5d6c11"
+SRC_URI[sha256sum] = "ff559fcd4da75a4023af986c02c52ad51d4b68ae83fc0c8c461026126a8ebefa"
 
 UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
-UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\_\d+)+)"
+UPSTREAM_CHECK_REGEX = "releases/tag/LIBSTATGRAB_(?P<pver>\d+(_\d+)+)"
 
 # Perl5 is for tests only
 EXTRA_OECONF = "--without-perl5 --with-mnttab=/proc/mounts"
