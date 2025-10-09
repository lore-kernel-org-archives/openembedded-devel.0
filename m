Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED000CCD184
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 23:40:48 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web10.4436.1760053247496736951
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Oct 2025 16:40:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NhaF2M7h;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b57d93ae3b0so936178a12.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Oct 2025 16:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760053247; x=1760658047; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B7U5o1uQ2yKpaG+7nHlzbs5pw56OpAi9zGKbQonnm/M=;
        b=NhaF2M7hjOHCP0Engi6ppZ5+1xD1M5/7HZequN0+NeNl1eduZy879W7nSLPbn4ddD1
         pIgGwe99fmfodcZ5F3hfj9fq7WknC5U/JxQ9u0CygC/UYTOGBiZJlLoodl9nP0qn6Eb+
         9BACFPyLqQQvHkEvXPVgf40JuTQI7IRtsQcHWskBpG6Fl+/tmVt6J5+pc22MFAEf8avp
         4nBAz7giV1JyW7OP1VaqyIpXc2nNaVdQc9XEbrUcNFOUXrFfylpYTTDwscIya+SphY2u
         6cZzCeKunJPXSKE06JF25iJctvNhZSLpwWNq90X7GVW+2KOWQF26wcPI4gtfHiGJkZxn
         rsMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760053247; x=1760658047;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B7U5o1uQ2yKpaG+7nHlzbs5pw56OpAi9zGKbQonnm/M=;
        b=LijIkraK6D+mvP8nNkGzSKWlKTCrMzWrF8IFZUEbAtfoJWJ0hBQ3n/zYA+mrOwQJrM
         9Grr/sPVcMN1vXMATnYlPHxurFXqs8wX2Sih8IkoZ4S0di8FbtxJ/okdMqOnmxD2N9ld
         6FTurFsPUuSX6guBhV7dcIuWwbiSZLVq0k2Zo1/jc9hq4X9OYXeYSFRtIGwa9H0QiRz2
         U6RcBV4R3/h3WLD9fUSCv/KBNp0EPOmSkOxRKmncNHcsC/JItaB0/UUk45UjfQalQFBh
         pqdmbIVnNuMAC7JytQsut8vwsL3lIXoRlWiVfEZsqr0DP6nE1/fy2k/4UV84qU/y5mFr
         Rm+g==
X-Gm-Message-State: AOJu0Yx97aCMm/2KFIYKzfyGi+kCoASHBM5YkNFEMtSaKpuxSPliC6tJ
	+FRCXrzQsfEL40i8ni8q5bKHggRHkpzveDVAXtfVQ3dpjoKwqHQR/SZHvz619Q==
X-Gm-Gg: ASbGncsX/ULXjFVWeHz08+bjZjWZFlklCpxLcoh9lbsaJ8N1p2H5eB1fGOH9LFtYNXY
	qG3PO2eOTnX48NintFEGiKbSZVuJFZ+d2TfZM25F3asycAArtwp1EgPCe5p4dF17qjWXI1qaLED
	kbQKR9MjWJbFdwGXwDSmoLTyX10c5w2U0U2q+gtE7W58h/+GGOkdTpL22Oh8Gv6Z3JIOZS0Mdmh
	12nDVrbeB7naj74sfirWC34GzFmFHhok9aA0jmWPHwFO/kNmLYm2i+7o2T7WZC+md4+Vnxt+ESp
	ypUs9rfS1i7HRGnlRlqIAXesKuwwW4ZjocP7WRCg5R86hidYOWAl8q49HAbcp/K9uk2It3TFe86
	qpUlQGaSxyfyKYuIJJRYaUwiEGmafxsw8/6W6UkbWP6miHVIB9u1VNFQIvuOJirAuVsf3NwY=
X-Google-Smtp-Source: AGHT+IFFmJfdqz+XtCCELtNyzVwpQVAqWSX739Zj/ok3dpoeQhIiyNuH6cOOaxIIh0XByuYoA1TYCA==
X-Received: by 2002:a17:902:f787:b0:278:704:d6d0 with SMTP id d9443c01a7336-29027238c2amr115899405ad.19.1760053246742;
        Thu, 09 Oct 2025 16:40:46 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f078aesm39394005ad.64.2025.10.09.16.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 16:40:46 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][walnascar][PATCH] libcupsfilters: patch CVE-2024-47076
Date: Fri, 10 Oct 2025 12:40:38 +1300
Message-ID: <20251009234038.3982718-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Oct 2025 23:40:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120461

Details https://nvd.nist.gov/vuln/detail/CVE-2024-47076

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
 

