Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B060DC83F20
	for <webhook@archiver.kernel.org>; Sat, 12 Jul 2025 02:33:52 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.29426.1752287624118389116
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Jul 2025 19:33:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=S9eMVfh1;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-73c17c770a7so3571160b3a.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 11 Jul 2025 19:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752287623; x=1752892423; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0lhvnufNNyHCjtROfniTgAs3x5hMbRfh66YHdCfKlQc=;
        b=S9eMVfh1uZhYfsWD5zv+eVp5jLvaK+lfNMeC74E0N8k62Q1T20YNTxBR3lgavpn1CB
         P50PK5n7sMK8Pux/OoMTJMegyKMNp3VQM+hLXUTB+IZ0ne9Uwp+BiQ8/tr1m3Y9QXDKU
         S1jEBsibA6f3BdIMZHbolkj2ZPSW0Dpo/z7I9izgXEGH2qRkN5/P1HvRuVH4+Ik0naVN
         f8tBBMOkN1yF6rGdkSThDs6P4NC9Ez5O0v66wmBZ1pXIdgrkAMDP/qSN03Of4z3l0I0s
         R3xCGpRKK2U80Vqu/FRFtovZPipl3iFapoDQKYXdhfXoVGG72HUByQ/40Qkg6YieDl0L
         +NiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752287623; x=1752892423;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0lhvnufNNyHCjtROfniTgAs3x5hMbRfh66YHdCfKlQc=;
        b=QZCaj/D4hqMDpDgsPaFWiR/+TZkcByUHVgWItss3X/nW/zjGGHz0qlsoKHjYiT9PI8
         dtuicEok4vIhzZgWWQtAOVQtLd76Qljrn5amoyh7MnzbNL0b6fcgX8ivfjK28YL8f6dN
         fBZJuI/DJhZDscAHrGEvt46ypfiRuwsjub2sZx7e+AwlP4DFM2OLz3ZZoPJ6Z8/yLJsW
         I1J/jlbTXeMN9T1DbDUtq8zDRz73SLtzCQrnVyxCcKK+kULBZgojhXZwjofQFowQdQ1w
         BNJvjAAu4zBM8gEPPajb/hbHilBipvncMfU3WdMEIHCZId2lfnT2aACYnyhRc3cvU7PC
         A34w==
X-Gm-Message-State: AOJu0Yw3ln6+QekHmK9lR9GiBC+dRaABdhCg1A5bwuYPR1DaLMNkbWKy
	xVS3rh2IiDXcKqS3Iz0pJmt0jcQ51Ra2LOQWWG1vYExeTzNkm0kh4DI9N0sN2ycH
X-Gm-Gg: ASbGncvdEGFTzlVyYvc2Hox9S6tPlH9rBENKRIEhhBSJftqu14ogFpM614CAzR0P4Kk
	jxqmHXrnsQRKErpU2jXpva9bFuYr+PI8zMQI+O6VMSUomLcfHCv/FMiX817sR/dgHaoIEK+yPqf
	Xa2z5AJZqHl0kuwe6mT05R2DoDz/9X4nQW1r5NdOURDPxXSqrpdqPGrXptl2rtzYslQvnkMg6TX
	Vc+6Gge4oktvJV51CyolWgGh4zaUDVT25EQMvKv7M5SH8o9oEXi+CCeIGqTZIYYNcGjzsQ+2/2A
	eutjlz2exisoVl+c6YVs1Wq4T9EN2Hy7tHMIBn/3k+P1U2mbjm8EDNrfago+4Me5JeqzR7W67gI
	LNk3ULErOoEnqQHrfNfKMgb8J
X-Google-Smtp-Source: AGHT+IF3pmni6BRH/BeYGRNv2Wu+U1GO/j5JY67IFUxDAZtbClECRruuojDLe8jlnv4JrRZaZnjC3w==
X-Received: by 2002:a05:6a20:c6cd:b0:220:37a7:578f with SMTP id adf61e73a8af0-23135d6a6b3mr9833294637.2.1752287622962;
        Fri, 11 Jul 2025 19:33:42 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::1c1d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3bbe5baf70sm5894240a12.32.2025.07.11.19.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 19:33:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-xfce][PATCH 1/2] classed/xfce: Add XFCEBASEBUILDCLASS
Date: Fri, 11 Jul 2025 19:33:39 -0700
Message-ID: <20250712023340.3814738-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 12 Jul 2025 02:33:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118466

Default to autotools to keep the present defaults working, it allows
building xfce components with meson, many of newer releases of xfce
components are using meson

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-xfce/classes/xfce.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-xfce/classes/xfce.bbclass b/meta-xfce/classes/xfce.bbclass
index 913202be59..b64db7f8db 100644
--- a/meta-xfce/classes/xfce.bbclass
+++ b/meta-xfce/classes/xfce.bbclass
@@ -6,7 +6,10 @@ def xfce_verdir(v):
 HOMEPAGE = "http://www.xfce.org"
 SRC_URI = "http://archive.xfce.org/src/xfce/${BPN}/${@xfce_verdir("${PV}")}/${BPN}-${PV}.tar.bz2"
 
-inherit autotools gettext gtk-icon-cache pkgconfig
+inherit gettext gtk-icon-cache pkgconfig
+
+XFCEBASEBUILDCLASS ??= "autotools"
+inherit_defer ${XFCEBASEBUILDCLASS}
 
 DEPENDS += "intltool-native"
 

