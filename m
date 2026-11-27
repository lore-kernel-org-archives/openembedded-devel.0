Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11821.1795763015808840673
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 23:03:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=yTX3vLB4;
 spf=pass (domain: gmail.com, ip: 74.125.82.45, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-18818daa3e7so4278044c88.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 23:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795763015; x=1796367815; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5rHBerLqpW676mlP7dMmGO1ysQM4KURFEC1+96298E0=;
        b=yTX3vLB4I+nQeAJf8fjR7nIPp+xH7oPWnk51uB0C1pRWoZ1S7mDobOyXvmnSJZNfAK
         2nMdlx/xuPkstpp9JU4mAbVqJGi9wou02cDpU6PNQ//yUOzyCjUo/wOQBGCKfhx7AG2D
         ARyBnH0eMNaO62n2a2DsEQ5/XHEvsB0XIUfc6pv2i8BazR1aKzGWZHG/wpoXFnBDn3mM
         gtDKqsjHa0A+9P4+VACBvZK0OP3hWJEUGpJ7UEY8quYpcFAob7+er6aD1IadtY9FOtJn
         VPtRhkiPOv1pR2wOpf+Dd6ugPgoi6SlQY+uaHIZNJS6D/xI0aP9WtZ+VTohh/IMrPRqX
         4VJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795763015; x=1796367815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5rHBerLqpW676mlP7dMmGO1ysQM4KURFEC1+96298E0=;
        b=h8lOGsw8AI+65N5kovkYoV1WhsaCL+8nj2zJ3VjMVxWCqMyaDFeHTYEAgbYEz2Khvc
         ulYH0emz/SvmwA5izVEgZAQwCS1eihhbwnr1PwAFS8kTyp0sk4O/a/Khhce8TrnVrRFr
         VUBs0qXyax/4wd9xZA49DX8HSYO3Rqn7g6uw7iBLF/gbokCUQ2q6Ehi3bjPzIwPfZBoz
         CN1xPU3Uo7WfXyuXGydIwcqvuPzBU45BHQd7XLHeknRWy49BrWQ+2Fm6vF2bvMptEKGc
         fhzHYX/9/qgnLYNTaWmupU7c/TYYDGqEPcLrEJvzTfsk2CzY9SFlr/RzQAB5ZeA4leiP
         UpFw==
X-Gm-Message-State: APuU4Z/o5aWmbUHoRFff7EL19FOGqcQrogXkLgECvxfkukhXN90ckXVo
	NjfXt06G82RgpyA4eUBZJ+r3rGF1+Iy+nohMsdB+kuLKAObUfJeTMm2ShaA82T8Z
X-Gm-Gg: AZFdTZeBWrfCCnDhxaMszkXX8G6VhDd+pYzDLZU+tM1yKyX1CT7zdDPEER1YA09zbpi
	xPENWGr9ExQyn07mtkgVRxSJH56+XhfjXS1dg0/Idf3KXcKuvQkL4O9+niFTN8bxTjrXT99Mstj
	KNNsQPRdmcfC8UOjC5eCWx2u8f2XoNIAH+mcIJWygdwFpPGLcFNSyCXQnsiSAW2MmeNtiHEbO0H
	fFwKbcy314mDBpoEptS5/m+LPFiNGI1nR05x0HMDq1cAVYbBc2Hky3XgnuwgJXIXTxrNZGk/EeU
	HJk2S+3AFrTzraytgFSl4itBk2Wvw7qhDgL8YKxiffkoCehQj+K4VMlVtyirEUWPnTrSM0SRDnN
	1BTXKTvnouP6PjEV6lyI6pSXKvlshF3oZxuV3gmPk5bqfA50JCozma2YNE3HKY1HiAWI29J8bCn
	Q13Lgry0i/m9wowlTxj0tGiMmaz7A3nDMDdQAiiQiEAuTHKPRWbbFWzELpcEBrPnbdd8tCXKVqJ
	3Efu+0zFOszHZMa2gae10rKvLWMsFyntrBtpuLCmvpTPmn+qffgB1q71/DtfixZfh/kDNy/Qru1
	E/zvgIeeP2U2J5at8AikQx+eMXK2pBQ2vpDAq/gToJJBftzvwMxhxLgwOtZyx4yCe8MvfA3SFvG
	LhUdPoU85wzfto0wKBHyJZKikZChRaMg4zgCUTYU4nbSUU8nZjN6z8BTIFPet77IZ4X7EcwG1Qb
	tVq1IfBpHz8EkUXi3ITJ3VYR1tpkto6enqKNs/ImTDmAt6TwSRNwIqOW6pJp8V8QnuUt5VavvAu
	eACuQpJ7VWz/bBSLvhpZgx54SYdtplXCDhKXEUVqFyzuwEOFdTHHSJ3mNRcemki9q8zfhfbVJZ1
	SveB
X-Received: by 2002:a05:701a:ca09:b0:1b3:b322:a42c with SMTP id a92af1059eb24-1b5568f8e64mr24871878c88.13.1795763015206;
        Thu, 26 Nov 2026 23:03:35 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm61327766c88.13.2026.11.26.23.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:03:34 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-initramfs][PATCH 3/3] rsinit: Pin SRCREV and drop the v from PV
Date: Thu, 26 Nov 2026 23:03:29 -0800
Message-ID: <20261127070329.2393585-4-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127070329.2393585-1-khem.raj@oss.qualcomm.com>
References: <20261127070329.2393585-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 07:03:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133363
Content-Type: text/plain; charset="utf-8"

SRCREV = "${PV}" is a floating tag, so the fetcher has to resolve it over
the network on every parse, and devtool check-upgrade-status aborts the
whole run on it:

  Recipe uses a floating tag/branch 'v0.1.0' for repo
  'github.com/pengutronix/rsinit.git' without a fixed SRCREV

Rename the recipe to rsinit_0.1.0.bb, fetch tag=v${PV} with the tag's
commit as SRCREV, and add an UPSTREAM_CHECK_GITTAGREGEX for the v-prefixed
tags.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../rsinit/{rsinit_v0.1.0.bb => rsinit_0.1.0.bb}            | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename meta-initramfs/recipes-core/rsinit/{rsinit_v0.1.0.bb => rsinit_0.1.0.bb} (89%)

diff --git a/meta-initramfs/recipes-core/rsinit/rsinit_v0.1.0.bb b/meta-initramfs/recipes-core/rsinit/rsinit_0.1.0.bb
similarity index 89%
rename from meta-initramfs/recipes-core/rsinit/rsinit_v0.1.0.bb
rename to meta-initramfs/recipes-core/rsinit/rsinit_0.1.0.bb
index e2c5e71d54..e4e1d81f14 100644
--- a/meta-initramfs/recipes-core/rsinit/rsinit_v0.1.0.bb
+++ b/meta-initramfs/recipes-core/rsinit/rsinit_0.1.0.bb
@@ -6,8 +6,10 @@ LICENSE = "GPL-2.0-only AND CC0-1.0"
 LIC_FILES_CHKSUM = "file://LICENSES/GPL-2.0-only.txt;md5=570a9b3749dd0463a1778803b12a6dce \
                     file://LICENSES/CC0-1.0.txt;md5=65d3616852dbf7b1a6d4b53b00626032"
 
-SRC_URI = "git://github.com/pengutronix/rsinit.git;protocol=https;branch=main"
-SRCREV = "${PV}"
+SRC_URI = "git://github.com/pengutronix/rsinit.git;protocol=https;branch=main;tag=v${PV}"
+SRCREV = "91732bdc0364e0bd0bc3a77dbedfa3a1dd330a1a"
+
+UPSTREAM_CHECK_GITTAGREGEX = "^v(?P<pver>\d+(\.\d+)+)$"
 
 inherit cargo cargo-update-recipe-crates
 
