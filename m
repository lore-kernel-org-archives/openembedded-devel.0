Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8210.1795739712444670499
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 16:35:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=RakMfAFO;
 spf=pass (domain: gmail.com, ip: 74.125.82.50, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1b589050416so1590849c88.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 16:35:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795739712; x=1796344512; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wZouHAfkvvhO3PQr24ZZMIEULxCBxd7vR5kkMYUReog=;
        b=RakMfAFODXjsFGhQmp+mxRuAY0rCv0FPMCFGm0l0qvunt5EfQ50idfzB867Ffy7lmS
         D6qzVkg7GXGPs4p31bP+FiTMf+YqmQRJGmpWGISnZpAaxsNyKKTTyViBVTQ/E/zb0Ddy
         2DiQt2O+lmchJH67+w6oFdw7uxhAd1R045bAyeF6dhn86eoWzH+ApzxDSBMDQsF8uhfQ
         lXiE6sJKBd1uYR9r7j1BJug0vB/+6fcjXutZMKK6cb7HRS3ZqwCv0GAo5w1FFWzYX7Lj
         l+5yK0+35HZzWdCe3aA45TUhDMYN74ExRCq2Z+I0unbRfaJHRrpYCUPhLHPnhDrruDhR
         nTlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795739712; x=1796344512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wZouHAfkvvhO3PQr24ZZMIEULxCBxd7vR5kkMYUReog=;
        b=N0F+GFDQMvswrBarQr+pFmhnfSvMqE975dgqgxXdZJGsvVJ/gyP3ILERJ7rSlkPSse
         Dgg/gHFGm2RoFI8vTn0JXiDmBtixUDtmtOQFIBZysiVG3TwVYvpa6/vvE4jO3rBs3HCw
         uc2n8ktWRSTwAolAadaS/VTp4l5kJW2Ax+ieBLqkmVlsQ/Jau5GOisrEQs2hpqfUHpee
         VfN8wYSnnXTy5D04MEaskVP2Z6fo28XuHRdAIlvy0optDgRtykvloaMzFevJXmQLOAzr
         3WhnOVuQmhzYjA+h5QE56/NOfu6DifHmV9MAmtVEiC5qrNhuAkKS7LYFUAaNtk2RVqhD
         UZQA==
X-Gm-Message-State: APuU4Z/7pqwgQova4nhBAnRulwbjD8832nEB5kjQ5ty5Mb0Dpt9Sy8Ic
	IVxo1c0aAHTyc6r9jlFPM7aRdi4xe1Y0UmAAAY63E7Jfv4Cz+/bwim5JfSWJvfr+
X-Gm-Gg: AZFdTZf/o+FxyYK2K557ssRSXxaY0T6L0vXz+hSexFqMT02/r4usoEaxI0ST5XRpo7Y
	enh5W347xJ6KoBMGFLYCpxUTWVxP7xs5naSjtFQEaUEh8yFi0we93mBzZh3uAgNI5wPS/99/QLz
	vw9JLHIOcTIyshTaEZsY/tLXIjHbH0HyaZRrPdjJ2cOz42Ohh00KG0l8AvyZBefoFzbgWj1sdGo
	NrUT14mdrQjOVGQq17BjZfbHsrAlV2S3r9KZ8bQvvkDZahgM4ELTj/4WFDPcW0zop+YIp/w3tPM
	X+x+W6MGKE2wWl8aeuIP0RcbqRAWAHAHPoJSljLTcJzIyhc8rVHGnnMTAvdIlbV93S5vWbpkufA
	IQJ1Q1BiW/mV7nG1iR/eBZ8sYNS4yy7+xge4rc8TYE2ox5kik6dQtbY4eLpE/LtUOfjzR43vSc6
	o6pHSpVSVLu4ubMdOckng+7jMC2Ascexb68fmk5DQ6nTqeNED/PTKX8Kpd8eZlp+rSbI7h3Isff
	Lodz5MsCdkf1h2199KhNinEi6DI69qED5LgGp5meGrjBsH2nfUeGdyjBzNFQPF/cn4LcjpFMUp0
	VcgCkRRky2GRRCTnCYbmIW8bBkHRDGUGgVUXJhjdL5Y44A/GK3LF/q+UEM3J3WWo7x3fT5pU3RK
	3KUbQTR5h1HKr3/SUegHIdCSnbKxxyxbbqBw2j3iAKxbgMAh4532UDmcTtbzDObq2+FP3i/6aeZ
	zW+eX0Tuf+cSP5h7wG0W5y8U5uSayA8Rh4yowcbwM80mViBpl5ghyDBGFa/kq4BxSfJcGzNtkOW
	OIfe6O99bJkd8hgxbeCaSBvnhy/s2iA7KjiOX3E+OmLfs+7vvNmfo8MGPPjF/bWOS5G/27VOIpr
	edRtug==
X-Received: by 2002:a05:7301:6083:b0:386:a01f:a36b with SMTP id 5a478bee46e88-386a01fa8d8mr26757498eec.35.1795739711816;
        Thu, 26 Nov 2026 16:35:11 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm63029314eec.16.2026.11.26.16.35.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:35:11 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 40/69] panel-mipi-dbi-native: Fix upstream version check
Date: Thu, 26 Nov 2026 16:33:56 -0800
Message-ID: <20261127003425.2166632-41-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
References: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 00:35:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133140
Content-Type: text/plain; charset="utf-8"

The repository has no tags, so the tag-based check found nothing. Track
new commits on the main branch instead.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-graphics/panel-mipi-dbi/panel-mipi-dbi-native_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-graphics/panel-mipi-dbi/panel-mipi-dbi-native_git.bb b/meta-oe/recipes-graphics/panel-mipi-dbi/panel-mipi-dbi-native_git.bb
index d3c96cd66f..210d9f846f 100644
--- a/meta-oe/recipes-graphics/panel-mipi-dbi/panel-mipi-dbi-native_git.bb
+++ b/meta-oe/recipes-graphics/panel-mipi-dbi/panel-mipi-dbi-native_git.bb
@@ -14,6 +14,7 @@ LIC_FILES_CHKSUM = "file://mipi-dbi-cmd;beginline=4;endline=13;md5=5e3d3f14cc87a
 SRCREV = "1cbd40135a8c7f25d7b444a7fac77fd3c3ad471e"
 
 SRC_URI = "git://github.com/notro/panel-mipi-dbi.git;protocol=https;branch=main"
+UPSTREAM_CHECK_COMMITS = "1"
 
 
 inherit native
