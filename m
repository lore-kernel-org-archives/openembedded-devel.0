Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3843.1794728968101420499
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 23:49:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=03PAEXp3;
 spf=pass (domain: gmail.com, ip: 74.125.82.177, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-37f14feca60so18887eec.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 23:49:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794728967; x=1795333767; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8y+eu3y1KZG4UohppoFuq3H9sFb/XOq8zZzIMlx3jKw=;
        b=03PAEXp3B9R0HXK/zE1H7afkGApiQK5oJHPIig96Yp89urzkg0wVZGc+aaqiU1iSxE
         Fp3c3dLB0ltGKkW2Tp7oxvmgE72q+yyco1WqlUgDR+z0FZTud4m5CmgShgRGY3jE7YEh
         OfVgkL/C2CrxKrBi8CQ9f0PdhwZwZb2oWFCpfPY/wyc4f62QREaM3bKH7V1/+Riq040V
         u02rHNxXS8lUoC3d5BXZuuG/yi+ZsOlvEXb1LvP86bKLRY+K3MFT42lAJ9Q8D4bS0mtc
         mZrtbCeoR53K+CO9tfgGFB384r3w8AmjBStUPySEh/FMm9b+EH6i7w2Guj1Vrt87AgpU
         gL7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794728967; x=1795333767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8y+eu3y1KZG4UohppoFuq3H9sFb/XOq8zZzIMlx3jKw=;
        b=LhBjFwdzgkoqgEbYoslPs8WMoBHA24+YvpRB+cMA355MIt3yMwNVDNhV1YAYhN6+6W
         JIDo+ffDeZq0OKd5QjYMcxrgN8UtuyMVL5Mo2SjVpGj9tgbKHrNIoMtfkzUsjWdnTMmC
         OjUp3ViWDa4G5AS4DSEM7FQHL03bJr23lFpOJfSQLT1v5GyM9M/8XNhNS6J2WYnx3cku
         qL3ZJFCBzg95dNx+SUy2aPcqsKQphiaVt4fuauS0iZpa8RMfQLNtAvEDeteTmRZ7LJXK
         xtWVJaXcJ4LGvj3DIDbFSgmXnVECMRkTDV+bwwi89CfPq1LECGAdcVn7DF3K/U9MXeKb
         tHdw==
X-Gm-Message-State: APuU4Z/cKjjIz3tYNL+t5jc1DM0TbaD0uKHTCWfrkkCkLXy+AIFUnTLG
	XbLmCe+yqpUohTIqnfwLhKsaT2Ye5uzx6XOjzJ/xoP4A21Or45RV7pNlaxhoo+UH
X-Gm-Gg: AYBFou14so1R09trC7LF5dA4jTL/fdlD9mCPeZ59yDh+RGdS3dF0cc/gmFB0zMFD2VG
	ZdMQaREP6QDdd3BsHReoUNF4w6l46A2T/7TC0b+CY0ttU2g2cyCohMDH02HXgihpolRsCh+8MK0
	dPQTfp0R9dlUVmLBsD3qzqSWLmLMWLYO8ZjKzSOLtqndi2Zpd01WI2xGNEkF2f+xdyhYcAJ3eZ3
	7bMgPUgWLVlKK2k5ZCYTsLTUzLfj11I+cLylT0kEjUzQEfVfFOq8b3SOwU6vaCDxmbVzVrt4YtM
	qPNfaKj5hMRoPVV+f1hqflQyjrXYca91gB1U5Dd02TpRj2fE/jckhyCoXvwB/+6RyMYlH0u2RTW
	h6tFQXm3/7SdIuFfvr3lOOfteRpKy/dpZ+eDVneIbBaSteZRPJGX+Qb//WE82ZEKO1/qazzbr01
	baWDj8FG5MlbIzLJqZHyyXJxpj+o1v+PClTX7faobrM+8AQsb4oxTODQYCap2vm39cqMa9k0qYo
	veyxs5L7LKbkA74sA8YxPKwAf2uixyoQVcnZsnvOUOSHMEW4r+EQOu/OBqYYj+TVkxEMhHG9fa2
	evLCGAzg1UHlQKPxbZpeY15AYCu8YxDe7laA7JXi3ibYGELJe2w6dj4FdT1+snWa3BSnie81nr3
	wNt8GXgXQ50WMO6NORvlQk5TO0K0sZZsNgkho9PqeFLWsnxaO+u7t1uDOYbNOzHmezVf+2+nvbS
	6wTBvvHuGrJOPVg2vZ/wUf1Vs8z1dxqKjnOVaTXdFjgRR7AcEXm7RePCml3xqIU8t7l3N8dhL3P
	YJIVTeL758qyw6LnJvUdLsVOj0uPIeFKePAf+d+AZxzPShhL4oCVJTHoWiW3novhydSeWcsN6nh
	4SeQ
X-Received: by 2002:a05:693c:26c9:b0:377:66aa:3e94 with SMTP id 5a478bee46e88-3796676acffmr6627665eec.18.1794728967318;
        Sat, 14 Nov 2026 23:49:27 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm23112817eec.13.2026.11.14.23.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:49:26 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 04/96] exiftool: upgrade 13.59 -> 13.63
Date: Sat, 14 Nov 2026 23:47:42 -0800
Message-ID: <20261115074918.2932593-4-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
References: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 07:49:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132274
Content-Type: text/plain; charset="utf-8"

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../perl/{exiftool_13.59.bb => exiftool_13.63.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/perl/{exiftool_13.59.bb => exiftool_13.63.bb} (94%)

diff --git a/meta-oe/recipes-devtools/perl/exiftool_13.59.bb b/meta-oe/recipes-devtools/perl/exiftool_13.63.bb
similarity index 94%
rename from meta-oe/recipes-devtools/perl/exiftool_13.59.bb
rename to meta-oe/recipes-devtools/perl/exiftool_13.63.bb
index 224741cce4..8372a5f153 100644
--- a/meta-oe/recipes-devtools/perl/exiftool_13.59.bb
+++ b/meta-oe/recipes-devtools/perl/exiftool_13.63.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://perl-Image-ExifTool.spec;beginline=5;endline=5;md5=ff
 
 inherit cpan
 
-SRCREV = "2200871d9cef988051d2a99d67df3bda6cbb30a8"
+SRCREV = "1da714924f67763b6a8a7013dd2aa1983a16f87b"
 SRC_URI = "git://github.com/exiftool/exiftool;protocol=https;branch=master;tag=${PV}"
 
 RDEPENDS:${PN} = " \
