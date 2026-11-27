Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11798.1795762956114421307
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 23:02:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=0WXcFhI7;
 spf=pass (domain: gmail.com, ip: 74.125.82.42, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-14394530ec6so1574550c88.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 23:02:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795762955; x=1796367755; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m/9fq6qn7kyzyOGFde959v1qqWGbr3gzz4hib1KLKC0=;
        b=0WXcFhI7PjrwlJIioTajhQOK3aBDmGbC+8wpUbeAEqw6eU28/lAvgL5hjKlDt/87Lp
         W7Kgcl9INV9dZw0JRsr0uSSYubyfndWuhjA/3AqfjmGenKJXp4sTobS2Grl37m4l7P8/
         DnL8+YYBJ72TZKlvOh7NL5CFwn3zMqowj4gqQ6cam7Jgr4PqDdY4FoW7OQQ1hATFIQfj
         dle+r1sqUItln+7PqagWHhoA5uvhxf+8XofKk+43qC1rvsSAtlnbzu+ZpXCvLedr8HEa
         lZBfLNBdrU4m94Lg4ah0tCmkRCddu9Iz9EzyYUG5ogInnM6gI12ZePO1fj2rO0u0jbs+
         85ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795762955; x=1796367755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=m/9fq6qn7kyzyOGFde959v1qqWGbr3gzz4hib1KLKC0=;
        b=w+D3jrLNLt8A5/zYilw4wgUOsrRNCLHuY3XQgQV3XS1UDYGT9QCTn6Rl51/f3WgKjS
         bUJ6aNQw1EhQp9HDBA9NAWBWRPL8H+XNL3Hf6gLz1pyuMhk8gWyODWT0LAIy8JlWbirb
         15GwJwdBViYzpDQv8cycZknY9kl10yjLPQEeDpxyziN2UQlRvq2qQ0OzthV92DuIohEk
         rxm7Ib41jbwU19CSA0U/UGI1aBpuv4nviZpOXx/1ferka/kmMAINCdDJH9KCeZt/ikgC
         hLqzMXPuiD4ejggRbC22KEjtxybx+aA6/QfF2tXzDkYvukhu3kpnSbgKN6L5fYz1wKNI
         cKeA==
X-Gm-Message-State: APuU4Z8uLhlBvUW/X1a8EeYnvVfh/BALwEADmL/sbcKPcYOdAeiYSQXh
	BbRvWLjHYDdFua7LtGiq7tzTnd94msQK85yAjwDdCnqEz614S2gb8mYvHLwmLjE8
X-Gm-Gg: AZFdTZeAyEnMM8GQFWp4jqW+aXTnpcEaRug7dBrz9PEppNKN6vQlc5MhzI0YeUotfPm
	2HmHVXDFjGcWvut+/IlobzLgO3GmZnq8vv/O7Wq5mWytVnpPPVxDyitWaKk6iG+Er3VDUCOmvU/
	bODJ29kIjKLPYRwGGgXfXZW2WgSx2iPx4HqLR6L2V9Sk3rI1m7+K57caN+SxQJp51VXyfDLNI+f
	QnRhqqF+6nX5gSf++IqwRwIKJpxUX3UfaW1UatwRdHmffN28hiWnk113NKXyqjYIVq52Qrqlb5v
	cE22sduDyf4jn2StAnyLrvJhEbpiP5QdtcthRcd9nT7ovfPctKiN4tV0tbfbtenmhpv4r3WdK4z
	blh2jovCtJFkTSKDgJ/iMRvf5SB3o38mBIHFhpZ+4ZjSZzKA7xMaJpBj8OCbvhZMYtCDwIwhF+o
	TZEINLqF3GxGkkNOKwJdcIT1L9BlR8TO8XpsHuNIb2oglsBzYR4UexUI/Y2TV4VnpbwuQ7hGx8P
	lUImwoDNfEXsPCbJAU9CFexc3QCih5lyutVaJlL69Yz/G44pIhDx1eyeZaoz00g3kb3QxOSwi0t
	RhcAgoX46DTnkAmOguBp6lAcdfYCzqoKU/ZL1yDPixgfZgIgDOExeWafiqSpWdWf8ICh/1Auz0N
	gAxxRo1xpgDoMvdPTc51Ajw51K0AFwxqkJjMnNU9Yhx/3I0ffaMcdwgDkgcXRhzpRB7qjbfPBn/
	1/Xnu1HQXYDUFLuRdcCwCgN4W2vHuZ8yrOZnwJT86B1nvJgQz0Yr9bg4Ui7eFDkOIOcCui/TKis
	19Tp9q2QF8ASubGecAR2gENVwjQRksCdfDOI7RnZc7yUYUcupkJv2bCq8rbztTyUTC7rPvxdbJv
	OUDeKtuPigbZJ/SQ4+kzVxtUXg==
X-Received: by 2002:a05:7022:b0c8:b0:185:8c9f:de82 with SMTP id a92af1059eb24-1b5568fa1b1mr21216719c88.33.1795762955498;
        Thu, 26 Nov 2026 23:02:35 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c3052sm53911395c88.1.2026.11.26.23.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:02:35 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-gnome][PATCH 19/21] gedit: upgrade 51.0 -> 51.1
Date: Thu, 26 Nov 2026 23:02:07 -0800
Message-ID: <20261127070211.2329979-20-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127070211.2329979-1-khem.raj@oss.qualcomm.com>
References: <20261127070211.2329979-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 07:02:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133346
Content-Type: text/plain; charset="utf-8"

Fix a translation issue for the desktop file, plus translation updates.

Recipe: add UPSTREAM_CHECK_GITTAGREGEX so only release tags are seen.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-gnome/gedit/{gedit_51.0.bb => gedit_51.1.bb}       | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gedit/{gedit_51.0.bb => gedit_51.1.bb} (92%)

diff --git a/meta-gnome/recipes-gnome/gedit/gedit_51.0.bb b/meta-gnome/recipes-gnome/gedit/gedit_51.1.bb
similarity index 92%
rename from meta-gnome/recipes-gnome/gedit/gedit_51.0.bb
rename to meta-gnome/recipes-gnome/gedit/gedit_51.1.bb
index 6c648c5e21..0df132c903 100644
--- a/meta-gnome/recipes-gnome/gedit/gedit_51.0.bb
+++ b/meta-gnome/recipes-gnome/gedit/gedit_51.1.bb
@@ -24,7 +24,8 @@ def gnome_verdir(v):
     return oe.utils.trim_version(v, 1)
 
 SRC_URI = "gitsm://gitlab.gnome.org/World/gedit/gedit.git;protocol=https;branch=main;tag=${PV}"
-SRCREV = "b7651f36c9337d20694ae6fe41f0fbe33a043f41"
+SRCREV = "76b8d9ad35c1daf402d2aae04d1b16e7455fc091"
+UPSTREAM_CHECK_GITTAGREGEX = "^(?P<pver>\d+(\.\d+)+)$"
 
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
