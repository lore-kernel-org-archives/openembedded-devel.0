Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9682ECCD18E
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 20:54:26 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.315.1760475265429494707
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 13:54:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=T/c6GKLB;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-26e68904f0eso60100445ad.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 13:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760475265; x=1761080065; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UDPOE6a3v42coAe5i+xdegPnrJahUafqdM1RNbGrV6A=;
        b=T/c6GKLBH1HrU8lsI4Jbw8OpeO1QnM1S0u5Ll3oHDsGhlGgvRlZkYKou9Pd8e8NfZ2
         SWGN5vwyUSHrzLzRYRemRx92QtaB/jjEbslJwKH6tD5LVRdIE2NAjZmeqoY53sAXR4Ly
         ZIW4EOPKDtxi24cp+xaaxBAEXbN353ingpLa/qLcWEvG/W25SR12s/3PPG+ZGRHGFp2B
         E3TvxXkFxRzVujOdxn1xKRseWR+Q1ymaVUlorzOwZhJfa58NA0xYdGiEQ3uTAkwteOk/
         OTvDE8JZ/mcUq/B+JwwwtCM9esI2gqTIVvAJCNiFRKQ9qTpeaDcqXAua/kMYhq11ReoY
         RpnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760475265; x=1761080065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UDPOE6a3v42coAe5i+xdegPnrJahUafqdM1RNbGrV6A=;
        b=CQqsn0xPtzzODI3K7POGXEJhShwXgSHpFVXseXEpEuseEVhoA/o9ymtgPxa0JB+lV9
         t0ersNuW0M8II6DU0tekWEzat4u9Us3O3M2/Xzjh7US9l6meWaX16x6+ZoEO4KyduZ3U
         Zplc5jz+yPeeiX52m33GRNO6635mRmGyfe963XT6KcT6LMZ39l9O7FhKPZQTG2SYIZBy
         EhvSutPH6Uog4p6bf6l4C+U7YQzcIEsNRjAse8ykwNvhY+04VG/pOOYVP/35k+dllCC0
         qyX01QqjO24puRzFHbAyNUhmdg8QZEXRwpB/9jfLtFqrwKALKtgYjebIv2B04ycMpN83
         MGFw==
X-Gm-Message-State: AOJu0YyrmP/EqigzjZ73T1iKayTcCb0cRxJ6t9pMmm5huHXnkn4VNfzN
	ghsj7WYXJE3VoicBhPgJJmuEPoJAJAXEVmeEGj8FIc1cfvY1MgrZlRkQODL9VA==
X-Gm-Gg: ASbGnctHcDwAWMp33i8HwiXSeTBHF+CKZNk6u2Kpta9FAixCqGGfGkqZ2NhCcoRg+Bq
	P/CCwUi9oQ9HJe68IMxuKn4UkIIkRGwZf0ma1ZFHvGw2++bV1i4XU8eGLNcT9PbcE59i2lIELpR
	TLZswMRVNFZVJGtO8G7yhAw8WM4mwPwlSCD1Th1fEVdKzlHODUwBdyBEVwpLwpiocaDHXAqrZfz
	dta9/FtWRcqtGYCS2zbTDPPzjWMh1dxeUa3KT8gGw8povvJsNgqMIQh0WbxwfyiSpzgQMIPN+oe
	wrsWOE5a1apDff485ho8Z7C3APMR2pm9sZR9Ugk2YAtMcRZDprWDvhUGMezx4gu/yFz1d5Y+CH+
	2kUsWMZIjB8ah1Fra64N0BQcPH692Ljex+6G1MBut1F8IECsrwrlmLV+Emxc/8+3DkQ==
X-Google-Smtp-Source: AGHT+IGtRR+30i0/lC2xd5+JI83G+5SxRx/nZqKNaQrhi9wzPDaublPP6gTt3W77MX2f6FnpaoJrtQ==
X-Received: by 2002:a17:903:244b:b0:272:c95c:866 with SMTP id d9443c01a7336-2902723c20cmr326754575ad.20.1760475264667;
        Tue, 14 Oct 2025 13:54:24 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034dea083sm174952475ad.24.2025.10.14.13.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 13:54:24 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Gyorgy Sarvari <skandigraun@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 07/18] libcupsfilters: patch CVE-2024-47076
Date: Wed, 15 Oct 2025 09:53:50 +1300
Message-ID: <20251014205402.1487867-7-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014205402.1487867-1-ankur.tyagi85@gmail.com>
References: <20251014205402.1487867-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 20:54:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120640

Details https://nvd.nist.gov/vuln/detail/CVE-2024-47076

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
(cherry picked from commit 1ef236b6c507ccf280d9a9aa1cbba3a9c2fee5f8)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libcupsfilters/0001-CVE-2024-47076.patch  | 38 +++++++++++++++++++
 .../cups/libcupsfilters_2.0.0.bb              |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta-oe/recipes-printing/cups/libcupsfilters/0001-CVE-2024-47076.patch

diff --git a/meta-oe/recipes-printing/cups/libcupsfilters/0001-CVE-2024-47076.patch b/meta-oe/recipes-printing/cups/libcupsfilters/0001-CVE-2024-47076.patch
new file mode 100644
index 0000000000..5fdf2bd444
--- /dev/null
+++ b/meta-oe/recipes-printing/cups/libcupsfilters/0001-CVE-2024-47076.patch
@@ -0,0 +1,38 @@
+From 5f950f6a52c7453d76fb30dbc8d66bbc1cc682a3 Mon Sep 17 00:00:00 2001
+From: Zdenek Dohnal <zdohnal@redhat.com>
+Date: Thu, 26 Sep 2024 23:09:29 +0200
+Subject: [PATCH] CVE-2024-47076
+
+cfGetPrinterAttributes5(): Validate response attributes before return
+
+The destination can be corrupted or forged, so validate the response
+to strenghten security measures.
+
+CVE: CVE-2024-47076
+Upstream-Status: Backport [https://github.com/OpenPrinting/libcupsfilters/commit/95576ec3d20c109332d14672a807353cdc551018]
+
+(cherry picked from commit 95576ec3d20c109332d14672a807353cdc551018)
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ cupsfilters/ipp.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/cupsfilters/ipp.c b/cupsfilters/ipp.c
+index a0814ae5..994c8dac 100644
+--- a/cupsfilters/ipp.c
++++ b/cupsfilters/ipp.c
+@@ -452,6 +452,14 @@ cfGetPrinterAttributes5(http_t *http_printer,
+ 	    ippDelete(response2);
+ 	  }
+ 	}
++
++	// Check if the response is valid
++	if (!ippValidateAttributes(response))
++	{
++	  ippDelete(response);
++	  response = NULL;
++	}
++
+ 	if (have_http == 0) httpClose(http_printer);
+ 	if (uri) free(uri);
+ 	return (response);
diff --git a/meta-oe/recipes-printing/cups/libcupsfilters_2.0.0.bb b/meta-oe/recipes-printing/cups/libcupsfilters_2.0.0.bb
index 7f7174d940..827172a6a1 100644
--- a/meta-oe/recipes-printing/cups/libcupsfilters_2.0.0.bb
+++ b/meta-oe/recipes-printing/cups/libcupsfilters_2.0.0.bb
@@ -8,6 +8,7 @@ DEPENDS = "cups fontconfig libexif dbus lcms qpdf poppler libpng jpeg tiff"
 SRC_URI = " \
 	https://github.com/OpenPrinting/${BPN}/releases/download/${PV}/${BP}.tar.xz \
 	file://0001-use-noexcept-false-instead-of-throw-from-c-17-onward.patch \
+	file://0001-CVE-2024-47076.patch \
 "
 SRC_URI[sha256sum] = "542f2bfbc58136a4743c11dc8c86cee03c9aca705612654e36ac34aa0d9aa601"
 

