Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11817.1795763013772934864
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 23:03:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=YLg0U2zi;
 spf=pass (domain: gmail.com, ip: 74.125.82.49, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1b24f4b15c4so3601100c88.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 23:03:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795763013; x=1796367813; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tC2KhkeG3zSP8BvVNI+ZkqMVPwy8J2m2MNrkeDKSdXc=;
        b=YLg0U2zig30G3POSLoVZMgQQjC1K4SFfYLzaIieYZLyZF4CyDycUR3IkG7AeCAux47
         CkcwJw5O4M+j4SPMyJ39UZtLfeaM9CrLk8X/duu0QRnYB0uCJte66Da09YRTvSwmtSKa
         s2aSaF4PLdYPJudXoUz53+HWMYTBy7p+CQBohbHW6PTs7HvtgVu5jRWpi2YMsFTzgEv3
         bNLomFBOJvl1DkqvjLiXlqUjhIUbuHNqRqm8fJsgrG7gPm8Yv3RG44oTmtmc35QYpREC
         VhkGSYl99Z8dH9rRCi2J3jD4J82E+Gsh7LArUPeXUOmAOjiursFYj1IAALfU5PbgMt26
         yKQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795763013; x=1796367813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tC2KhkeG3zSP8BvVNI+ZkqMVPwy8J2m2MNrkeDKSdXc=;
        b=kQO1T4VPu+eRfC+nbbQ3OHEaSj5bzTjmf7zILsue/F9L/57MuSfyV5I0IDLsJiiRVa
         7BGKgc9E2Kv7w1ovBaDnK4VB+ztr6cPFIConICQ9H1WiZGBFbKAARFKHUZV9eWOsAAxY
         gJqIfwzBz3lfxbaCpNPKdGVzqOqNaUKc0qpqYHLNGl/OkEzyfzmLIKhddxot+Sm++tdg
         DF+0dXqm0F3krcAi347L6EsAZbB9uBTD+e3syKMwNaf3dQYka5JU+Xby4N5GbQUdhnEj
         3fgqN1127F2+HPs7QhurMvOKIBsjTNxW9kaLMycK52hlEcrvxVWZbcEpHSrhbfb/uFTV
         Kz6w==
X-Gm-Message-State: APuU4Z8ztSZ6geTe1wfsVNCZsz4ctPzV6OgZjp7+jP8mxsac9p4PXt5v
	FxBVtCMBjjjhf1moTalGTJ8mgdWGTO+EJE8vGf+9Kfv/7yGl2wmDkRvqZVjhY8kN
X-Gm-Gg: AZFdTZfjXV3QfOoDHzOheRX+Xxv5zu+tA1+fuhY0HHA4ihpYer5kwe9gloexBXHyHcM
	JNc0TMK8ThoNO9JU9pwsvkJpeU9kLOcLiPticF+51igOLtrg6ybo/5LoqJEQk2PNoKSkqGdaEg7
	zaIWzybBw91mTHAvu0GauktHAffkF1DHjCGWEn5k471TQz3hnZZufG4RiseS9NPBPhixOb9gQRH
	fH/JOWj+WfrH0FY1ORZTxYTOWYsTfucTZ51BgkWMU6pRggydLJN6oM1ReJfHwKSxynNzUGTcjG7
	kYJddrcMZUyIqWqWK+Z7BgwE46RBACxJz0x0v8c8ilk9dxFJklnC4NzLAEzpmnI6UC9Wk4QyzXT
	Mmn9FDkZ/y6Kp6J6dyIJ3fyt8OoutN2Y8dJ0a8Gw8KOGJorgOOhGTSZ7JOFq6wlSUt6it7fLnFf
	NGFyan4FVOFF1Ui7nF52Le7wYDK+gnOMmev5e4RAGjihyDV3GlZvjlNU5RGlKb6qf5ZTVQMNUId
	dne2XKY8F+/rIcww2lutLyqBQ3nJ1Oie+Z4YKkk2lIo0fg0BV/z/puAsoRkUBAnSzlKO7/F+cyd
	WtMG+cyvnJ4FgGKMnSIR7gpnwjkFI1zfXY2fjH+stOacE0G91epsGpeRP/roF5S41lLzFF2juiD
	XHJP5TQZDamc05NudASEfQEk/m3DCuqp6hDFv+w6XuFt7qqGZUDXnY20E9sivRR0BIKDC06Bvkw
	kSUH8zHAYlWlahiSvfWP7G504RnqnQtJkAs5TARt+tZihhmyQiYJSyMvz/q3aRiEZt7Xxy9W44O
	ypn/PohgGcCNRPTIHCsiyn+jkvkH4iDsv2LFzy25iSd49i2Wg9KbldvwjcdZQsNDzHUjV9poIc9
	bCqg
X-Received: by 2002:a05:701b:4213:10b0:185:6c8c:d860 with SMTP id a92af1059eb24-1b5568aac8emr23227162c88.5.1795763013109;
        Thu, 26 Nov 2026 23:03:33 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm61327766c88.13.2026.11.26.23.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:03:32 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-initramfs][PATCH 1/3] grubby: Fix upstream version check
Date: Thu, 26 Nov 2026 23:03:27 -0800
Message-ID: <20261127070329.2393585-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127070329.2393585-1-khem.raj@oss.qualcomm.com>
References: <20261127070329.2393585-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 07:03:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133361
Content-Type: text/plain; charset="utf-8"

The recipe tracks the main branch past the last tag (8.40-1) and has no
numeric PV, so comparing against tags reported nothing useful. Upstream
is archived; check for new commits on main instead.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-initramfs/recipes-devtools/grubby/grubby_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-initramfs/recipes-devtools/grubby/grubby_git.bb b/meta-initramfs/recipes-devtools/grubby/grubby_git.bb
index 60f68728e9..38976707be 100644
--- a/meta-initramfs/recipes-devtools/grubby/grubby_git.bb
+++ b/meta-initramfs/recipes-devtools/grubby/grubby_git.bb
@@ -21,6 +21,8 @@ SRC_URI = "git://github.com/rhboot/grubby.git;protocol=https;;branch=main \
            file://run-ptest \
            "
 
+UPSTREAM_CHECK_COMMITS = "1"
+
 RDEPENDS:${PN} += "dracut"
 
 inherit ptest
