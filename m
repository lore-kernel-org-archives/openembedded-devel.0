Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11800.1795762958242269447
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 23:02:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=K1MlwDiB;
 spf=pass (domain: gmail.com, ip: 74.125.82.54, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1b3ada81853so9015227c88.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 23:02:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795762958; x=1796367758; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YVjL/Qf3GKbewhzX2GhvM49aTC9+n40mrk3PDKrbx6M=;
        b=K1MlwDiBhVd9lNAAbr1KMEd+aLzl2XruCKJV88HXlRpqAczw/8I1itxwi+DTXhA5pL
         4HhG7Yutr2metg9iBPnhFMxsL8LH92J551vH4GNoZ2qZK+1tRWaAFRaVna+Krcrf/oKa
         wjvEdKxs9vWWapB4JJgfUjIyN1WkPpdZIMDd7+7R2nUq35FhElFv9jOtAkcmCPtc2Hsw
         vY/WblcOnS3zLVjTqt4JTx57Y3yc+QpIBd+aHyFcAlqdXmE1xCnu1GNVWyRyoqYSXH8y
         ypVUj4xQtYAuf1PmO9qLiGzPf4CncsoVXNEsa2QHYTeKPFwoaD3RgwJANp6aakZg9jCw
         7fRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795762958; x=1796367758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YVjL/Qf3GKbewhzX2GhvM49aTC9+n40mrk3PDKrbx6M=;
        b=eAt28jg2yjc+G4qSMTqadW2o/nuOlpzzmOTTPAcqf78SW98SboHgCliPGa2VxuCQkE
         l+g6OXEPx/R/vhrEZhFT2saVG2uzrtNir7I4BLyCqkD2BjPUCQuxOTR+JS6lmcmZsolL
         qlObItyhfAwbFB0lO6y8PqhQXa3Q5XwPAl3/FfsMrtxIpZzXgjM2EX28jNvvT53BgALU
         126Shj5AjCRfibyJkZ3Fk8sUz84Eo/t759g5lCqb0ZqtyER33eKeC/C85MtN6PU4/hdx
         +1+alfCoL6zl2KW3wzpwq5PFyOR0OzQhtlTcm9RZKeH8IGHJy9SxPNl2ZZqx+B0ZfUcH
         tkmQ==
X-Gm-Message-State: APuU4Z9OLb9n/lrI+SiI5jfJa+Vw0fy7zqGUijh/e5MVuMflGkSY+FhF
	s0wqul4CwjR1pwpNKNhX0ME1eww9HT6NxY0EGGJxf4X8U862PDkvkVZZLvrwHDVR
X-Gm-Gg: AZFdTZeSaVCoU4Hgcpg8V9bypqFkr8ivSyQRTa02UKJfnGo+5Je6OU9BZpM6/0X3Qe1
	W1TnQZzVPfT/YUOeYa5t0FgTlqXRAJzsNSO+EPM1J0QC5/NI48S08SmKHi4FlwjuuRFUns6iqOj
	WRlbkgNkxsd7l+OwK+0gjKApY8RROkgTyzntD6d4154ftXdyoW6FwEartPqtZfILDe/1A4J7YV6
	muY+PyXqOJgTAs9NFdqdlV2j1qvq91eqk6pq+xqIWf5xlE1GF0HhCn94rOMqc+unOlxN4A2HvA4
	t/K0ISBFgD6PQ7QVTZvezN1Xoe6dKt6HFz3wwycDrKTKOZFuLLx8E6n11H3jWcJZCxfXvDonesU
	3SKJLWAPSI9TdmoGNV8jcw+Bp7fwh4tj4dkHWi7t9P4R0aJD0VtRUXXhuwQWAVd+/1rKTXWuH7J
	3jFSUFxzF1ZTW9NBfGSUe7xOFMzMbMRVDYQvLXezupZqM9Ej0Zq4vGQtiwcwrGiTW4x9Pmiejcl
	HvUt/4FDF1/lOhqTm3K5lEFM3uN5J16pzj4ZActR4INtJ5ti0j0CbDMeLa7DqU/BauiLeVKrcsI
	qkA96auH8atXnMVbBW95MIGPVohanlPZzaGyy5rg2QSqYMVRZ7201czOl+LWBnulAJH0xSR8p+8
	7fomNSe/d4YCgffg8KL8Mllr7CC3cpkbN/RJDiWiAAV9AZlzyaMhT2ZHkbBHYemzunVD33+ZuM/
	jyuv/3EBGE15GPDEw5zyBhjmL7fe41KQNelMg6K9mgbN1XbjxVEA89sGhWo4U582N0Vg2RpMcAt
	lD2viBHB6qfE2RuL3pXYSb20o+Pj0MkjGRQMh7g0yZ2KXSelO/gp83+IlfrxK+bdqKeROXbKzgR
	KXgbiHZ42fzI5VC591jMHa24IA==
X-Received: by 2002:a05:7022:b058:10b0:1b5:330f:6209 with SMTP id a92af1059eb24-1b5568a32damr22873518c88.20.1795762957510;
        Thu, 26 Nov 2026 23:02:37 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c3052sm53911395c88.1.2026.11.26.23.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:02:37 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-gnome][PATCH 21/21] gnome-online-accounts-gtk: upgrade 3.50.12 -> 3.50.13
Date: Thu, 26 Nov 2026 23:02:09 -0800
Message-ID: <20261127070211.2329979-22-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127070211.2329979-1-khem.raj@oss.qualcomm.com>
References: <20261127070211.2329979-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 07:02:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133348
Content-Type: text/plain; charset="utf-8"

Translation updates only.

Recipe: add UPSTREAM_CHECK_GITTAGREGEX so only release tags are seen.
The panel-interface patch still applies unchanged.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...nts-gtk_3.50.12.bb => gnome-online-accounts-gtk_3.50.13.bb} | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-gnome/recipes-extended/gnome-online-accounts-gtk/{gnome-online-accounts-gtk_3.50.12.bb => gnome-online-accounts-gtk_3.50.13.bb} (89%)

diff --git a/meta-gnome/recipes-extended/gnome-online-accounts-gtk/gnome-online-accounts-gtk_3.50.12.bb b/meta-gnome/recipes-extended/gnome-online-accounts-gtk/gnome-online-accounts-gtk_3.50.13.bb
similarity index 89%
rename from meta-gnome/recipes-extended/gnome-online-accounts-gtk/gnome-online-accounts-gtk_3.50.12.bb
rename to meta-gnome/recipes-extended/gnome-online-accounts-gtk/gnome-online-accounts-gtk_3.50.13.bb
index c1b9d5c84d..47a4ddf5b6 100644
--- a/meta-gnome/recipes-extended/gnome-online-accounts-gtk/gnome-online-accounts-gtk_3.50.12.bb
+++ b/meta-gnome/recipes-extended/gnome-online-accounts-gtk/gnome-online-accounts-gtk_3.50.13.bb
@@ -20,7 +20,8 @@ SRC_URI = " \
     git://github.com/xapp-project/gnome-online-accounts-gtk.git;protocol=https;branch=master;tag=${PV} \
     file://0001-Provide-the-org.gnome.Settings-launch-panel-interface.patch \
 "
-SRCREV = "a356874606b6f9512d4fc20f5cd7002506e96f36"
+SRCREV = "4e10e28d7d57bdfd9e5324f9de9536f0101bc4a6"
+UPSTREAM_CHECK_GITTAGREGEX = "^(?P<pver>\d+(\.\d+)+)$"
 
 inherit meson pkgconfig gettext gtk-icon-cache
 
