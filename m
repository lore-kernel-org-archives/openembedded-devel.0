Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17645.1794787843794724413
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Nov 2026 16:10:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=bL+i1jda;
 spf=pass (domain: gmail.com, ip: 74.125.82.48, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1a3c08d6928so3839676c88.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 16:10:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794787843; x=1795392643; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E08osmAGS7I0+2wQMjJz5pYuFhuVoJWgP8Kp6A+eUkg=;
        b=bL+i1jdaHujv/PRXicXHpMGKsmAdXoDSj5ZXNX/1bofYfIyEkPN7VUkhOuCoPrgFcs
         SWFFiobrrzTuKNN/sptAFgQL2HS00X/f9+75Q9VuQ/qVs/R56cmYt8pK3ks7FVvA06Eo
         ZFw6XFReQmiXv1OSvHx4tegraIqTdOZu7EmCwmnGtdjVA5HVjtfJeKUauszyzhU80F8Z
         hS5+WQUejRfBONAFocxE7QyE/tbtpQIxRY6BWMKCAHCYGpmQcSoYHzedk14aE8fbrvYN
         MmTN6TUrlBnysz4JyOGwU3rmEOlGwGldsb/3TPpInQ3KjgK0fd2rmpJXgyDVxJdemAMY
         qWXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794787843; x=1795392643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E08osmAGS7I0+2wQMjJz5pYuFhuVoJWgP8Kp6A+eUkg=;
        b=DXbDmcOC2PmQbxbFxYWnGxZYQOZ39ckwBmX25BZaV4KUXhE5vi0/iHg71Rg2B8fBH0
         AZmIdf8DT3a0dwO5YhkE6Mbu6WX/qQL8eL5hgtD236ATzwre9CLZoO0l0+u/U+u3lQjs
         rAqFASqAie4ECXDTGb4U5zO1RGq0o6GEZ4mJuCSUjh4Dsq+vLCUqe+P16nTN2SmrOeo1
         pAiCb9TnpMKZOqmxfZfVngYXYPdYBIt3pxcKx0gh7JSJ1QvhpGippwzvkQZ8ZY/4b5mR
         HdwDQZqygUh8FVSmiBVctHd57/mjo+Ygk53CoXk4HyifbqEjG8PQIMYx31n68CFEMdB9
         fN8A==
X-Gm-Message-State: APuU4Z+rHjxsw2cYHO6veBrFnkH2AaXsg6RrOj35DkjsaQAvcfcW3Y5/
	hSjfLm0tyXyLE5HCqtNJwn1ElF83L/j3AV5mMfOuBNYmtfAjfGM4f1vEJDYMiDVx
X-Gm-Gg: AYBFou2FaCIjGHH4YADh0yEW9DD5GxsFJcmOPtFGUnacb9nlHy4Z1AMbfrstFT4Patx
	cMTx/5nawwGRfxg5ldv4BXv8v0tKXxnUUR+1YO17nnB+UXx8JxN3v2x9SAxInCnEcDT9FFd161K
	nRC+vp00WBcaraFoqKvYOTqIFJaFqPvGaMuoPYdgmwhsu0x3IoUa5SohYORswxfqfyHAKPlUYgE
	VF5s2Hnz7RghPIJ1ZJibWscKAKCNCx9LwDwub1xekDD/KSiDp5f7xc+lEBEmKQ1cnB8FkIlO8+T
	yJQx4sLD4RAvX99YpM7AXUqpUtDdCrzRY1H1/4O65Hd9/WWdX4vriL04N48l0A+Gjxa+ZOMQSak
	LwyjgF2lCi9whE0R3AyTNc7piKjn6aL8K3vmUlcKjk7C99L3SscfzZhSjgb8+cE+g37/hNEY91t
	jOVZeiUPVZ9X2VSGI0J2oLaXoeT21IiItCRGUDL5IsS76fxdYFLL3xPPbKSBEueGVR6y7YcOSrK
	bwpAofbwthJTReTKQ1//3U+Sitz/anUkCN5vvHH+QB+D/ErxzPCy12ECKp8gauBL7uQ7AkRN8FV
	sTSBLkTPKIhb5QLFz+3KKnXvRq1wzUq8daL1JrYFSwxP7qknUXZkzPoFWBDD521QbqIr8cSFgs2
	GHRjF8LyXIVALfZnlCUeEnSItJJf8wymc5klKjsOqvZd9GxVdHNLR73YHCROlFJLAtXGMJLta9i
	Cm97pT0XcPDagjJWzFwOY7/dhDUrMSZ86aQdZSwYQEGY/IBWWBlYsRPqD+PuV6Rczp2wgmyJ71x
	qX+uYNEXVvRI1Z1Q5x41DeqdS9jxts3uqQcuCvpFulPW2QOTYF2asISiLfvinmahWXcOLLRAvgo
	I/D9
X-Received: by 2002:a05:7022:281:20b0:1ac:1022:b60c with SMTP id a92af1059eb24-1b50302b3b7mr7752955c88.1.1794787842859;
        Sun, 15 Nov 2026 16:10:42 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50316d9c2sm24163844c88.7.2026.11.15.16.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 16:10:42 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 02/16] iniparser: Fix FILES override syntax
Date: Sun, 15 Nov 2026 16:10:24 -0800
Message-ID: <20261116001038.440763-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116001038.440763-1-khem.raj@oss.qualcomm.com>
References: <20261116001038.440763-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 00:10:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132383
Content-Type: text/plain; charset="utf-8"

FILES_${PN}-staticdev uses the old override syntax and had no effect, so
the static CMake target files were not packaged by this rule.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-support/iniparser/iniparser_4.3.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/iniparser/iniparser_4.3.2.bb b/meta-oe/recipes-support/iniparser/iniparser_4.3.2.bb
index 72c46a66ce..82a601cb0c 100644
--- a/meta-oe/recipes-support/iniparser/iniparser_4.3.2.bb
+++ b/meta-oe/recipes-support/iniparser/iniparser_4.3.2.bb
@@ -14,6 +14,6 @@ EXTRA_OECMAKE = " \
 	-DBUILD_DOCS=OFF \
 	"
 
-FILES_${PN}-staticdev += "${libdir}/cmake/iniparser/iniparser-staticTargets*.cmake"
+FILES:${PN}-staticdev += "${libdir}/cmake/iniparser/iniparser-staticTargets*.cmake"
 
 CVE_STATUS[CVE-2025-0633] = "fixed-version: fixed in v4.2.6"
