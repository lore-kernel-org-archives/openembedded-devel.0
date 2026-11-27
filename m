Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11793.1795762950017009744
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 23:02:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=p0SJSKSh;
 spf=pass (domain: gmail.com, ip: 74.125.82.52, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1b3ada81853so9015115c88.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 23:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795762949; x=1796367749; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HnOz94a6TH9AEWoxJ0BxasjY1mel0ZS9A0+na0DwKVA=;
        b=p0SJSKShPQ0fn94/nSRfv91KIZWg0M9hEKVttlbVYSjHj6bjnLdf74XqdUjMFoJzKH
         SuxbF1ORLxc8R5Ey5FaHj/63o4x8qZnd1mQHV2korYIw9fTlWUmdvCCHH4PtMwun5vuB
         57IjP4VStxGrPwr7Gy7/+5VsqTOI1Y4Wo/zKUi576cRF1I3Zqg/xuO+DSHmioWbRNiw7
         aiNZQnncxZI92Kowfn6TcFHvH0UWlZAHckZt8j29DbgeJmEj8wtc7IOYbQgYLNOLcnTO
         Pfu4ohr70pHsfZc0AMPUmZyKqpva8OZNecJa3Ni85TFdx2T6dV3qVulCsUAdsIx2HlTU
         g34g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795762949; x=1796367749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HnOz94a6TH9AEWoxJ0BxasjY1mel0ZS9A0+na0DwKVA=;
        b=Y3zNb9Q03xmTlUSsqHtk7gy3kek5nySoUJLfDJYpQ+qttrQsBqk5w0EetmTHBMfRd2
         6U6IhhE6e/gH9c87sHHZHKyC/5Q+0z10wFblgLqH+ioQe6wCAYndo4L23Xv8DHT0TVJz
         9G6VqwWBs5BnB21uAGERgPhQCglMaF5+OBLUlu8gcsgPZEyeVFSEVdYxjndmcjJoFSmq
         ZW46EvQsT7GERjRrxef7OTzgKHjhtOOgcSM1C+LseFuLwUe0OtHznvy3RJb1dNjL1nm9
         ujyBfPL63qqG6j6ehLASM4G/32fzPa6YmHuncUeM8ovIYSncWziTIY0lgKjGMX5NIEmM
         0U1g==
X-Gm-Message-State: APuU4Z/ht3ugY8EwtqMiuUvjQ0oT+aKJEUcsfeStuSxpzpKZIepuEXZc
	e+L8ewpbjCsDIsw+nB+F0Wmo/ZAr6q0T7c4lqTSTgROqIWYMZ/HA1rriCPhnwc9Y
X-Gm-Gg: AZFdTZf5K4CIoPOWwbRkDlCpGl8aOEFQUX4T8B2W7jkeEjvL17iYBUXyy3Us5zFgsCe
	1QA+ypuJ4FeiyUjKcZdxn4rpGJ5mhMwHdutBzBJ8unlCK+DNYianqAoaxxfcCWy3ZD1sFoq7NKf
	/rq1zs5pFQrf9I8AZLvJYTxUFpEkEAhOLdaZhS+2fCAI64G4XtDRh6ZlquvfOuRN0HB1sTUFS+a
	/OiQ1Py3+pYQQCHsn0SlatJA81u8Z3Yifmh2GKR1oLGqe0xCzEaEAL/subdy6sAgI3/3YqIqVEG
	a1G0IkuP7zGjRRa1sIGaS7WPN+RnXkBwGDjV5OpMLKBgV0hdeX/NjwlRESwEZtXJieY8welVx/9
	W3JVoER2LozemoZfmPy0SzgGpEy7SRFOSmxCzT/2vHvdDnaaWeoB4YeSp5n0bkkI6FCRBMOmi7f
	nDgvoZLO2B4GTzrR444XIamOuarorAWS2Z6GEdePo5uJIwK+fNF2sQr624PhaHJ9/DuS8YP0sgS
	GJYC5yGtJeoXLX9oQae12V7IzBMDQlZw/lH7vaMeH0fsbeVRmsIldlVHXSiOM8KLMlfpF1QDXKH
	jJmsnxDyZjjlJVBxH9PY2cbvvju+Wdf98RWGBs4FB/4893FiIaDnR5og3iA9M5UipN2LldjKOQi
	k2t+/KEv4+na53HPca1ZyRym6hOVOz0be+lcA4VBlJbfN5duOHPC+Xw2f9NWr+GUs47i9HAZPU1
	rf/u25dT09H8Na007fID5RiacSKSQZiu5PgJuMswLTuBA/EaDX3qEnjjc7NFuGuZKo/UOYR68BP
	0FHi8hNb8TfGqqLT+Zf1HdrUIEbqIRx4nomnSIBPb2AJXer/qjf8bhcsayHkdlcZByUchS3f98g
	I+m3
X-Received: by 2002:a05:7022:f513:b0:1b3:b53e:b4cd with SMTP id a92af1059eb24-1b5568a951cmr21786480c88.21.1795762949194;
        Thu, 26 Nov 2026 23:02:29 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c3052sm53911395c88.1.2026.11.26.23.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:02:28 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-gnome][PATCH 13/21] gexiv2-0.14: upgrade 0.14.6 -> 0.14.7
Date: Thu, 26 Nov 2026 23:02:01 -0800
Message-ID: <20261127070211.2329979-14-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127070211.2329979-1-khem.raj@oss.qualcomm.com>
References: <20261127070211.2329979-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 07:02:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133340
Content-Type: text/plain; charset="utf-8"

Fix crash when opening a file without preview images after one with
preview images.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../gexiv2/{gexiv2-0.14_0.14.6.bb => gexiv2-0.14_0.14.7.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gexiv2/{gexiv2-0.14_0.14.6.bb => gexiv2-0.14_0.14.7.bb} (93%)

diff --git a/meta-gnome/recipes-gnome/gexiv2/gexiv2-0.14_0.14.6.bb b/meta-gnome/recipes-gnome/gexiv2/gexiv2-0.14_0.14.7.bb
similarity index 93%
rename from meta-gnome/recipes-gnome/gexiv2/gexiv2-0.14_0.14.6.bb
rename to meta-gnome/recipes-gnome/gexiv2/gexiv2-0.14_0.14.7.bb
index 972179863a..b9192d7076 100644
--- a/meta-gnome/recipes-gnome/gexiv2/gexiv2-0.14_0.14.6.bb
+++ b/meta-gnome/recipes-gnome/gexiv2/gexiv2-0.14_0.14.7.bb
@@ -15,7 +15,7 @@ GTKDOC_MESON_OPTION = "gtk_doc"
 
 inherit gnomebase gobject-introspection gtk-doc vala
 
-SRC_URI[archive.sha256sum] = "606c28aaae7b1f3ef5c8eabe5e7dffd7c5a1c866d25b7671fb847fe287a72b8b"
+SRC_URI[archive.sha256sum] = "373b67b24f1a7b5c0606aaf0ea00b352f9511751e21deba0bac650bd5159c93d"
 
 # 0.16 is packaged as gexiv2
 UPSTREAM_CHECK_URI = "https://download.gnome.org/sources/gexiv2/0.14/"
