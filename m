Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11783.1795762938040820227
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 23:02:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=ZG0cpwEd;
 spf=pass (domain: gmail.com, ip: 74.125.82.50, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1b546061d58so18009983c88.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 23:02:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795762937; x=1796367737; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+s42FCEjQ1bDfE8yAPLCFCDtc3hgXio6YTpefhGsbwo=;
        b=ZG0cpwEdH4ulgrdNMNrgZgJ1e/mLXlbirjI59Jd5hiikWY8pVUGycbJFn2zluLErWU
         UWlLTYfEpUUEe+sSBcS6PgCJrccEFRx4CJQ/WQVMire4xmemdeHhpiLEb77eVPz4HI1t
         Vv1HeTfjAivVOFphb1E4bf+ZrEw7y1O0Y+EPvqCOIFn1diNDb7zP6tUzdR99aZRD4Nb6
         y9vFmanvnmUELI92jscgjIiwA5PImYeAB1ags8MX8RifnwsDjNSqkytkZ9s8vWHS0L8P
         O1Po71ArHz+MYGYsG94RgOpYouJb61Q8H1D5UIlqscdoaxWx+BpaCKd7w3R+fJnV7nJX
         dbQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795762937; x=1796367737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+s42FCEjQ1bDfE8yAPLCFCDtc3hgXio6YTpefhGsbwo=;
        b=DSTi9eDhP+s24hrXUCnLCdo4X13chzUAdvuabZnoNj4K7vqqBalLhKu6M5nY8uqUzu
         EFZtKuEa+6SRmQhkbm55RjQV/navjB3arBPtWWmyl6NtseIieGxITuIAu3w+htCm5C2R
         8+STMXB17ecnG4VQXlU3LNjCvn0yLFxEoG26qXt77RSUvIVjY9O/d5E7rxOjJmwrP6bd
         7KUYSpmc+EFYJgQt9MMwejCsD+VMtXp39dzuuliSSqN8fBzmju0twcEYJSuJDcHPUzSL
         wyofbCymm6E6NyIFJGQCMTBuw0Apys1yjHmo9VP2V1sMMwZsRlzfRMz5S121AvUegyPt
         YA1g==
X-Gm-Message-State: APuU4Z8dprkWDuPfdGkq/QfMqLGeVxiq3FsI15cJ6dJvCjfei0xv0GcA
	jrpcvKEIVAdDApZuVvj5uL1X/+7manFn0bWwQBdagChFQc+eNDFOVYaUPMAJiTd/
X-Gm-Gg: AZFdTZe8OBNAsmt+BxyHn+zy05ntjKP2JbclcWZRHFbX0bUZvaczSmHlxHLgAaaWtLi
	gFUBESGVJsnsVaiLa4uV2IIUoT8rNKhLnFuuKUQaY9VOZP3CBvf228pb9RxTXok4ifsdhLaC1L3
	VOqiXzLCLbEy4ENw3pUAjvB9Ct9Smy1nvPn5iB4gqJvbn3JLSikWu4vyeYw+Up74aTO13hLR+Mp
	k/SDXiiIbWoBv9ApOT/MpU7tFrpO1gtO85SkbUrsizgzIONRJq/gTKOaB3Y3G9Xhrx3fhswtD04
	NerrFk4OLq8+HQsbNz9E80yCvw7+fu8LXeq+N8Q69Yv+feV2UsPUO4MHv1PNrDmLgnwxdCDOJpO
	6MpVZ4TWVq0VJsQUbUHjs/+6yPDIiXKQ/ZId279WOR/zL4JJTzMhMHsWOP1t2KnV8WoSIR7/UhD
	oF72Fn8QUHOubargH1pm4eoUY99vp7LAwYOHhvO8zT81ptEhkS7VxiMNPYA2KioFWoJ3GdZjez2
	cPy9/vAFr6izPXvHiBIo66wKLgDQu7Hto2SpNikv4nXR4QuebS2QlcSmTUbxKvM7OWf9Jdex/HM
	9qoPFWd3GoYw0D42iL4pQBn0UhmR3hOs1v6rAiJmpDSiK+K/GN0jRMjqwcDr2EwDhtEeI6Sq/C+
	U+iyTKQk5Qn9JOYFHANtQM3xS5kHbLwF2c5LmjfR7/Cit9D0LtYUbEenC4vk6M+6eViNJGES1Ig
	De1uOlyUg6OkME1Y/T7zUTkSzvVUmWkuYkkN3LZ5Y3wQFeYkyARU3H4vyrajYaI6BRb2otqhReL
	ZazHPHAW8uI7M8M/4N2YjQNIhJ5KQFM4K3TxnvSfGl8kVoRgcLVjf2UNbhRmxoZnIzYHcREsG38
	N3MS
X-Received: by 2002:a05:7023:a8b:b0:1b3:af3a:e784 with SMTP id a92af1059eb24-1b5568fe775mr26544421c88.32.1795762937372;
        Thu, 26 Nov 2026 23:02:17 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c3052sm53911395c88.1.2026.11.26.23.02.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:02:16 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-gnome][PATCH 02/21] gnome-calendar: Fix upstream version check
Date: Thu, 26 Nov 2026 23:01:50 -0800
Message-ID: <20261127070211.2329979-3-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127070211.2329979-1-khem.raj@oss.qualcomm.com>
References: <20261127070211.2329979-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 07:02:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133329
Content-Type: text/plain; charset="utf-8"

upstream-version-is-even expects X.Y.Z versions with an even minor,
which never matches the GNOME 40+ style 51.0 releases, so the check
found nothing. Drop it and match MAJOR.MINOR tarballs, skipping
alpha/beta/rc.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-gnome/gnome-calendar/gnome-calendar_51.0.bb       | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_51.0.bb b/meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_51.0.bb
index 9bebe7a377..5abfbfeb3d 100644
--- a/meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_51.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_51.0.bb
@@ -18,7 +18,7 @@ DEPENDS = " \
 "
 
 GTKIC_VERSION = '4'
-inherit gnomebase gsettings gtk-icon-cache gettext features_check upstream-version-is-even mime-xdg
+inherit gnomebase gsettings gtk-icon-cache gettext features_check mime-xdg
 
 REQUIRED_DISTRO_FEATURES = "opengl"
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
@@ -29,6 +29,8 @@ export GI_TYPELIB_PATH = "${STAGING_LIBDIR}/girepository-1.0/"
 
 SRC_URI[archive.sha256sum] = "77c290450c40834392cdea2c40451561e98f43d5dae93cd9e915051a6708dc30"
 
+UPSTREAM_CHECK_REGEX = "gnome-calendar-(?P<pver>\d+\.\d+)\.tar"
+
 FILES:${PN} += " \
     ${datadir}/gnome-shell \
     ${datadir}/metainfo \
