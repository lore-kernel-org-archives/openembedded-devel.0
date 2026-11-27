Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11790.1795762946757159341
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 23:02:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Q/WN7UL9;
 spf=pass (domain: gmail.com, ip: 74.125.82.45, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-15dd124bbe7so11426010c88.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 23:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795762946; x=1796367746; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PoAnzePdJHGWqIGORZS1LNU88YOE0ZdIywJrnfFsuN8=;
        b=Q/WN7UL94hkcmbt/Z+JvlWztuFMcxmOOQrHVGJuIMzqwXcIas0nYuZTVCVvTcd+jod
         OQmL8LDuwJWcr1JDWkRi4AqN0j5koNMw60K4BQBTEKFDzdiL4TxCVk0GHzhOB58od+tR
         2x3GLV8AxC3swFZw0iXX0r3Os92u6JlsSxbIpNGm8ftZAmih8vxYuRVAHLd4H6nrJhO1
         Zn7TCaPpHhF9dvNUUBv5NNmOfOHXZPSO+BS+OZp8BVhpmPG0lyVjyuAr9eHV+/UXycQ2
         t2gn/rAgL97bfB+jiGYC8LEGxfOh/LpSXLzl+Ht8T0CQvhbgi2jnG9vGiMXmx0VWnTpj
         T5+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795762946; x=1796367746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PoAnzePdJHGWqIGORZS1LNU88YOE0ZdIywJrnfFsuN8=;
        b=ByC0ln+xapOEPEUqrs025elhqvOlfNeEeYx/2DtGvfGtMhlP/sKHz/j/DEz6ZrJZIf
         oO+LCSFP1IS/YAPHG/yxMRU/Y20teUAkuGT3JymCs/lVL6OMU40LhOEHXVqUP6P7zU09
         fCTPyAz3/S6y1G2wpAyml4dHLwBtT2TAuiB+U3O1O4oAqfKBuJpwg0cKj+DGVC+m+Jz9
         q2teANsOKyC47xNIOte3sZZ1BgoFcDDzJmJUOQcLFrZhkXO5BHLaOYKgcw07H+iO1J5T
         Lwx/g9pXmbDiHZ8Ch63yrZ5e+jjnTHu2GZ3ouafgzTozwV+9JX+1ck+gfk7PyzjBzMWj
         Q+fQ==
X-Gm-Message-State: APuU4Z+IQDSuKdClBcYh46MkYW5HBKRLkwE5FlmdcgzbaozPI/X0vFV5
	D0L5wbDJep9XZl43dHo/LNMkP45o8VHNEIDIcYUWqtD3XlmOc+/0FxJtPFWm5inC
X-Gm-Gg: AZFdTZcy7TsEg96MS8tXyxScynmZuk8i92MQbN7hfFpKazERKRqfXqCTEGVIqAEgUvG
	j+DGciMFH1wdADo/INhHd4AP4LJCS5PocTgpDEB5nEWI3SVver7OxtCZBgy9PQzg2egEnxJhKp0
	OfBvoHBaFS+otLlO8KEj5oJvLHDmnkgHfQDhHSogy9s9TIKaNswKurA4xlsuCHkaoQCdUQ1g/pk
	FvqB4h+Ghz8jF9G4N/a9UCqir7UZUsyGW9BkSTooe6U+VDzzdSge/5phk/o0rySz/QVdMmjFdUH
	GwjttcLfDssWHrB51afGS12Qg8BTsyCyjG8uzlwpRud0CErjiNq27WHBSVl6l10uZPkvhNOapf+
	xbGuvpmZ3Z42bq0oM6yk9naLJ/Qz+JCBpECVaOREt8BRllXgtu2IY0wUkg5cRoAt1/ERDtEnTmq
	+gkxAMVrNO1rR8dzX6nRapeFsJmnvrdXQfdMSUuHs1A5vwQlDfoAf/iOOU6BQHh2nzav9aP76jT
	DDJ5OMDfwDLReqcjs5xoWrO3Stu0XN56grBAi7kWS+b9nJkiUQUkOAizuPp2cwxHw76KcgWhbmi
	Wr6C47YPaOIEgYTfZXUzKklpM93K8eRXNq5bddKswP9MB4dtaqveTc+H1B4dLC/UeNsXQaFvrlB
	s6+nQS9ttcYY8lh2ch0Vrh0fGh/b8NzDCARD8Y/+DON8GKsWuPW/iSZSNChBsOBh3wnSJB5US/p
	tqskPjlPrePATRM0dP8PMBVbiuMXCRYjjhMC/XxH2vm2o44RoX5M9XYUS9T1mX2cxIzABGIr6gS
	nAEZr30WfSTssCyyWUB81FtSFMhC3Adywff4q7eJfLdkbIQK81fD2J/iJ7cVIq40kMA+h3CLJYr
	ooK6
X-Received: by 2002:a05:7022:ea45:b0:1b5:31db:cc3e with SMTP id a92af1059eb24-1b5568b2b4bmr21374935c88.11.1795762945980;
        Thu, 26 Nov 2026 23:02:25 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c3052sm53911395c88.1.2026.11.26.23.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:02:25 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-gnome][PATCH 10/21] libchamplain: Fetch from gitlab.gnome.org
Date: Thu, 26 Nov 2026 23:01:58 -0800
Message-ID: <20261127070211.2329979-11-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127070211.2329979-1-khem.raj@oss.qualcomm.com>
References: <20261127070211.2329979-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 07:02:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133337
Content-Type: text/plain; charset="utf-8"

The github.com/gnome/libchamplain mirror is gone. Fetch the same tag and
SRCREV from the GNOME GitLab project, which is upstream, and anchor the
upstream check on plain version tags so it ignores the old
LIBCHAMPLAIN_x_y_z tags.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-gnome/recipes-gnome/libchamplain/libchamplain_0.12.21.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/libchamplain/libchamplain_0.12.21.bb b/meta-gnome/recipes-gnome/libchamplain/libchamplain_0.12.21.bb
index bc1d0c0351..44c15fef4e 100644
--- a/meta-gnome/recipes-gnome/libchamplain/libchamplain_0.12.21.bb
+++ b/meta-gnome/recipes-gnome/libchamplain/libchamplain_0.12.21.bb
@@ -8,7 +8,9 @@ inherit features_check gobject-introspection meson pkgconfig vala
 REQUIRED_DISTRO_FEATURES = "opengl"
 
 SRCREV = "941560af497148588783db991e8135f52a82574d"
-SRC_URI = "git://github.com/gnome/libchamplain.git;branch=master;protocol=https;tag=${PV}"
+SRC_URI = "git://gitlab.gnome.org/GNOME/libchamplain.git;branch=master;protocol=https;tag=${PV}"
+
+UPSTREAM_CHECK_GITTAGREGEX = "^(?P<pver>\d+(\.\d+)+)$"
 
 # Compilation fails on 32-bit targets, due to GTimeVal usage, which assumes that
 # time_t is always long, which is not always the case. 
