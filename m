Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10346.1795753041117422915
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 20:17:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=02FLraEF;
 spf=pass (domain: gmail.com, ip: 74.125.82.49, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso10382032c88.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 20:17:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795753040; x=1796357840; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kEjprVea6hFOybpEdpuWeP1vfJ7jcfAmLqj/fm4Xlrw=;
        b=02FLraEF/qOw+A5rTUHn8Ni6boNxi5J2mvxr+lQMqFxaDeCcif81CwqS/+E/smfqnb
         woftyg7aIAIt2aKmd7w1I/PxWVoLGLbOriVppgYELYju38nOowsmuP7ccDxfPjTHkWLL
         jgVQg6MMwaiA5N52bUSgSP5vyJzE3dPX8FwoKawOoc5rUg76T37a87kKm6McL3LJZ9TU
         tf8I/Bt5bmHmcsrClKhFgs3PEEw+pr0RRyNqqtbyEmb2Nqid9W/+mWRfzKErE/ihQlgy
         eme7TMXEUuskn0980VxrxaomWN6fycfPX66xe6VhItgo/AX6ul5KCjLgd46YC7bu058u
         ha+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795753040; x=1796357840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kEjprVea6hFOybpEdpuWeP1vfJ7jcfAmLqj/fm4Xlrw=;
        b=N9mhxcMKdOUB88pjGWCd5oZx/RvuDwAnSQva4pZck7J4lf8o5xjB9ubdlZcd4whmBG
         YIC9ppgdhGVI1aaRynU7zc8e2hxKzCNF8d5v0qxKLUrtpxm4ekemYn6Ue9QU6wXXRA48
         DhDf8XTnD6DG47aES74sxMOxvzZjhewARfYGiz5lmE6DdcHkk9OM5wlLX3Gn5vaDODjH
         4G5HZ4/Tc/wHXkOwOGxvLOSmcYOjZ4kNpcWwvTtGeCvQKCqwQGD3SSYiF8S1oxeLsLOn
         UWAo4kNOmvS0DOblqvNzMmjsiOvmhwXkdCV5lJt/rhXgpYEaghm5d9kysErd1jWEcUZv
         gSpQ==
X-Gm-Message-State: APuU4Z+ACiBCF1F8q6n3Jhk81/kI1B+iL0XYCPsoI2tz2QYbdC+X7+xi
	9lwLZWTStyoF445Zn+ZYZ4JKpDJ5hX/I95RSj046v6hMZI8IS9sLFUavYDT0oeqv
X-Gm-Gg: AZFdTZcojICFHE1LpZIYCN73KqWEOQZWQGQilUEQVM1KrTvHjcLMmwrjpn4wPyXYF3Y
	bgxXtA+RTrppJeXK07tBLwi9OD6LPHmSzsWNQ/lD+tG2MiQBUX3Ma1OsXA3fiiBv0+dTO/EgJC0
	27EmYGMBuoSSTOalle3CtABZ/c6NbGIe8nOWPVp314a5xem4N2PfcgkEX9btKntPPPJuA8vd1gs
	sEkH2gfAeu1odjz2gVXyXNo3TCfSiBH6GO+sFZEO1+pDfR9qi0jXxPFj/tQT8WcZ3t8iwjIDXK+
	1Hr83vl+AYPAFPNMELaO/uyFXEbPCvIGAVvuv2kGcQJ0R9AJKlBUlF+32myXQJ2lSNi0cfjuzUG
	tl3iGRzGHiHRQoFaHNctKlvQq/Yan0QxdKsIhJQ0fvG7hfb7AYAxqzHDW9JrRW9YZQh+2UvLSpg
	j+fyKRpdX23+V+Wza4ivCWwoyR+kx8q3zcJJfI6+FQGccpS0a+XVFGBJ7UAcRs5J+fgUwBP0fxj
	MMGBMFbKxNb8p7HlpYmE7HnOio/kB6iIi9sOMTMutJJ9u8babdsgHLv5kIDX3RXoLLMg1cE+3LN
	uaFkh9kOITz4+HuhJ4M2h8IvX6o+sJx2YOAq9rZcW10ruqaM3nyeSE3e1cSR3W9oAArcr91FTpB
	d4lcr/2NjzlXwpOoq7U6BpAQFWI0xab4RiBpJ3vmcbBoEYe0QmA41zVcHdBPUh+qfce4Fb591WH
	+6rnyiwoWoCwnE6BK+hjQKA/eq60BHmtszpfifg6esDu4zgJAPk8sJ1OqTPK1HvucCynIw559Fr
	ToXwBo+eVKO4c3uA6BnAE9ChtaBxPJqNgFllo8LZpmKbonyJo87+cnCezwjU6XzwAPKFXSBqRSz
	8Lvo
X-Received: by 2002:a05:7023:b12:b0:141:5281:8a41 with SMTP id a92af1059eb24-1b55687fbc9mr25346221c88.9.1795753040455;
        Thu, 26 Nov 2026 20:17:20 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556840494sm53880225c88.12.2026.11.26.20.17.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:17:19 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 02/35] cannelloni: Fix upstream version check
Date: Thu, 26 Nov 2026 20:16:42 -0800
Message-ID: <20261127041715.1776485-3-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127041715.1776485-1-khem.raj@oss.qualcomm.com>
References: <20261127041715.1776485-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 04:17:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133254
Content-Type: text/plain; charset="utf-8"

The default tag regex picked the date tag 20170601 as the newest version.
Only match vX.Y.Z release tags.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-connectivity/cannelloni/cannelloni_2.0.0.bb         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-connectivity/cannelloni/cannelloni_2.0.0.bb b/meta-networking/recipes-connectivity/cannelloni/cannelloni_2.0.0.bb
index 6129c9bd0c..f1eaaf80db 100644
--- a/meta-networking/recipes-connectivity/cannelloni/cannelloni_2.0.0.bb
+++ b/meta-networking/recipes-connectivity/cannelloni/cannelloni_2.0.0.bb
@@ -5,6 +5,8 @@ LICENSE = "GPL-2.0-only"
 SRC_URI = "git://github.com/mguentner/cannelloni.git;protocol=https;branch=master"
 SRCREV = "9f649ef21710999c6f674bc3d914ab2e88363bac"
 
+UPSTREAM_CHECK_GITTAGREGEX = "^v(?P<pver>\d+(\.\d+)+)$"
+
 LIC_FILES_CHKSUM = "file://gpl-2.0.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 inherit cmake
