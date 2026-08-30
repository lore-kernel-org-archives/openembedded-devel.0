Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15329C61DD6
	for <webhook@archiver.kernel.org>; Sun, 30 Aug 2026 00:50:51 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1032.1788051041307284117
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 29 Aug 2026 17:50:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=LuVpTSUM;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-398ba166ce3so501271a91.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 29 Aug 2026 17:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788051041; x=1788655841; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ilT9wd1nwShMmlA//Wj0OyfAsMCxcuazyYPVgDQe610=;
        b=LuVpTSUMauKJNGxBPF32Ayl1A0bK88G4SgbHiQaOdA3/y+Sqa9ENKQlpHNqpto5m8G
         Beh71AJJprDuqq39sEOUSRmy3r7YHnxu2cfHvfPVl7fBCjG7uokoQXX+c5jS4tNbilZS
         VNHqvDEEwr8S16GtyRHye6BQUgJMN2HohKU9VGW/y80MGEHw5LjmGe11fsbnX+1cztpS
         /CgM3/yAGRZiVCiAtqYp4m36kto6z+TTxNt0rha+njM/nHzRoR5Ej0M1+tXCUQqc4yGi
         buVHcdluwaIBkvzGZ3ux9Kiae+bkVGkhWlrG6/mg1GksU2wsUvr0ooh7JZv6cgys18+P
         QjDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788051041; x=1788655841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ilT9wd1nwShMmlA//Wj0OyfAsMCxcuazyYPVgDQe610=;
        b=MMsPrYuzXtg50O0kDgVRPMX/Lk0M5EQDkji+pcMXVPXmcWA5n9BXvYcSYX/95Ifl50
         lK1zvWLienxlWpDftfiC9JT0GBRVPD9lW4MZoRk4Lo+uaa1l7hVTYmM0E+fR6gGp6DcU
         sweDnUgucKGKB3VnsSDj0AaNYfDXVpt80Go3VyySrNpFXXO1KhSmBGpR/V4RH3F49gGq
         SHilYNpfXzUZe3Zp5ntjHR96/2Zha2NygT9iSoc1phN8lc1mZMmMzkMIjQkMo+qdbfEF
         DUIxxGemDIE5K0Vde26S/Tpd4j60Z7NMJUnhKvfR4ddk6JqA5AxIgSeuHPykhY5y1rzd
         oOwg==
X-Gm-Message-State: AFuF++kkdCcgGaOIkHeRaOOb3Kmy0un3lWdKxCeEpTLEsbJHvTOb/Ksd
	GMHGon5krBNOVyVMkE+E/TGOW/q8Xhz5UiKbpT1H12Z0UExvZn72KiFVe3BwpyeD
X-Gm-Gg: AYBFou0eV3ISfVsd2G0ETm2/9KqEBD7DhtUK4jFMAo9P/BsSJGNeYFbiNx242P66FID
	KHEwn3lSOeVgG2Aml0u19p2CSELUKAvI0Uet7SZHSa2jhV30p2o65nhQO6ggDmjFmsULphMjW0h
	d3kE1Kig9xVwhrMoVFSN8DaJLQSrglHY7+1GG1ZpHylaiYixRL1VDCHL9qbw3UpTNot5sTpssvU
	FY5alTl0QSb6u7OCG4YkhTtlbE50Ww0gUxrKEOCA7fHpqWxX13Al0kIadbrT5S0rhN2K9S1O00S
	C+NTNK//2DtMG+m5Mm9Tb9G4Su3ZM7q1QpxUMV4uXtSkPAX3VkVTNMuxWMpMJ9mUUrsMW/wq8DL
	BCQIOq0U6SlYeDZLISVcn5/W2F4Usxiwe4LIWloghIyfqUGA1oHI+2Znc+hYALaSG5JbZAidmZe
	6nkHVo7Ep/Rk+b5wTXi0bViQRMSweJJRjvCCVWSzvS2H2eepgomX4B6jSm+aT2jTI5XBWbRpLcr
	HsstWC7uRw=
X-Received: by 2002:a17:90b:17c3:b0:38f:240d:b857 with SMTP id 98e67ed59e1d1-396d0ea9ce7mr20868477a91.2.1788051040542;
        Sat, 29 Aug 2026 17:50:40 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b0ea808csm13561826a91.2.2026.08.29.17.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 17:50:39 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][PATCH 8/11] python3-simplejson: upgrade 4.1.1 -> 4.1.2
Date: Sun, 30 Aug 2026 12:50:12 +1200
Message-ID: <20260830005015.2555347-8-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260830005015.2555347-1-ankur.tyagi85@gmail.com>
References: <20260830005015.2555347-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 30 Aug 2026 00:50:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129589

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/simplejson/simplejson/releases/tag/v4.1.2

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...{python3-simplejson_4.1.1.bb => python3-simplejson_4.1.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-simplejson_4.1.1.bb => python3-simplejson_4.1.2.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-simplejson_4.1.1.bb b/meta-python/recipes-devtools/python/python3-simplejson_4.1.2.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-simplejson_4.1.1.bb
rename to meta-python/recipes-devtools/python/python3-simplejson_4.1.2.bb
index ad6a273a80..0c3c79927d 100644
--- a/meta-python/recipes-devtools/python/python3-simplejson_4.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-simplejson_4.1.2.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://cheeseshop.python.org/pypi/simplejson"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c6338d7abd321c0b50a2a547e441c52e"
 
-SRC_URI[sha256sum] = "c08eb9f7a90f77ae470e19a07472e9a79ebc0d1c2315d86a72767665bd5ba79f"
+SRC_URI[sha256sum] = "6ae4186f90362e9c03c80a1cd5062a20f3a11ac9d391f7ee0ef0701a0e2b7394"
 
 inherit pypi python_setuptools_build_meta
 

