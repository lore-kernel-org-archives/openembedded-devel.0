Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7561C9832F
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 10:51:54 +0000 (UTC)
Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34529.1790506305814123640
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Sep 2026 03:51:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ilHPiDGh;
 spf=pass (domain: gmail.com, ip: 74.125.228.42, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f42.google.com with SMTP id d2e1a72fcca58-86e6d007703so948404b3a.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 03:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790506305; x=1791111105; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F3M6jWoOrBtqxvpB1eXixowWkLurGg95j3yDqof5IcQ=;
        b=ilHPiDGhERqVELgsoNeVHHbrsC36YDuEs4rTmG4zDdfyhQZQMK6if/XP7f3y2ScYBK
         AeMvegiE1IK+R133P8RRKNxffYpI9Oc0Qkqg1qvmOw6S+zL8iNuT7lGgX0ffKv7fupV2
         YTxl3+e4520WlFRLTKGvifPeX66mtAX4fbzpB0PhkQRInKzR/VQhjwjuVti8U8ExjfAV
         QP0XG67boCrlmNnS8J4kSKo6w3gKLnA45Q2k54+sQEQU+DiDL4ySMnXEiNt0CaJIkU94
         APv7INcr3fetmRKBAF/lUq2Y+tBSZm33Wgz+gzpmIKFjxr3WE5o4RJKNcS18V1d94iau
         sImA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790506305; x=1791111105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F3M6jWoOrBtqxvpB1eXixowWkLurGg95j3yDqof5IcQ=;
        b=j2nsSinyO9A1tCeYuqsWNKV2eQso34BBz/1N3iwXPOErG0ils52IbAs9kudPU+iRhv
         BgTaQ52ACfCulybtvC3K4REOhub3G4SZagrEfZ9W+vBM4qchor/KHfJv5vV1dFXMDDL/
         CEwqiHD/yhSsnLu0vprF9T7CtLT0KEzJhJ0ZatQfEvPUnt13BrlF6jPs1LV2liDecDyV
         2MHDzfEyXQt7veGYqux3IkaKcOKfEyHM4Iww1GbvJBUbZ0LnwAckINDJpLuvDFqYg8ec
         a4RvLDFSVl1hD+6OcWPtPLRwXKOEqVqMeN5j6Hr9U6sFVUfHnvJIdtgtfUloeuOJB5+s
         6bVQ==
X-Gm-Message-State: AFuF++l3YcRQbxf45wi+CRey52gIDNgvziF0KskzYyYVqI/WNckmnmir
	494U3ZygkCvNo6o03ptfsKu2NQKdnrGjFZEk7+ExKEmu9qo2LD7oFZ60cf5Q5w==
X-Gm-Gg: AYBFou2Im/45LamXX01ETaDj743/nwDyEfi0oDgvG8UKFsoGdpDbznznQJK3/2Sem6d
	wdvIHNUBIqZet+4hY0I/BkIEwlxafnC54rTAa7TKn6GPcJ3SSGWZlCzdcKxCUm9QPxrY8q6/MId
	bp/H4Qm74VzobRl5TviSPvdV0YTHHlC309PgAI13pHzxcj7cRfk23ykwn5c5WqokoZi2iCXP0iR
	s2ibKmXSZx/uqasl2tRpKIipLfaVQDorNgjY/iQ4LzctIKOcdQWtGWGFE2reZ8jeV/8faoRcgIH
	oc/rjuCPxiBzpLuzcgT/ZnRVsIk9VUSFgiwEqJh8i2Z6gHew/mNYWBYeloMtkCoNK3047tmbsQr
	+oVxWOjBXWmnbWpRUuSENuvRukFw3ogATMPqMXyPW2ABOIKzgFAGqnnX+PwDaMaA2qDv8LmvHxV
	S4Cp0AELr+9zODqToXDM0bgEXtItX2NtVkifvtVRj7i2auG7RiCm48/qDT8Y6paV25PEGsX9lc8
	FilVFNwEp/GthQ3swir2Ws=
X-Received: by 2002:a05:6a00:301c:b0:857:72f8:dc98 with SMTP id d2e1a72fcca58-87e9dac71a7mr7812963b3a.25.1790506305121;
        Sun, 27 Sep 2026 03:51:45 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88268c5ed75sm640542b3a.48.2026.09.27.03.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 03:51:44 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 34/35] freeipmi: upgrade 1.6.18 -> 1.6.19
Date: Sun, 27 Sep 2026 23:50:01 +1300
Message-ID: <20260927105002.1832451-34-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260927105002.1832451-1-ankur.tyagi85@gmail.com>
References: <20260927105002.1832451-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 10:51:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130368

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

* Fix minor groff warnings in manpages.
* Fix portability of building manpages.
* Fix minor bugs found by code analysis:
  - bmc-watchdog: Fix bug with --arp-response command line parsing.
  - ipmi/rmcpping: Fix bug with finding an IPv6 interface.
  - ipmidetect: fix bug in which hostname configs not used properly
  - ipmi-oem intelnm: fix parsing of hours/minutes error
  - ipmi-oem: Correct Dell CMC IPv6 autoconfiguration output.
  - ipmi-oem: Correct Dell iDRAC web server control output.
  - libipmidetect: Isolate partial results between fallback servers.
  - libipmidetect: Honor caller-provided hostnames over configured defaults.
  - common: Preserve stream state when finishing buffered output.
  - common: Fix buffer-output configuration parse issue.
  - common: Parse UTC offset configuration as an integer.
  - ipmiconsole: Monitor both console descriptors.
  - ipmiconsole: Check valid payload instance range correctly.
  - ipmi-sel: Honor post-clear after full tail output.
  - ipmi-fru: Report DIMM capacities in megabytes.
  - ipmi-chassis: Apply the Power-On Hours scale correctly.
  - libipmimonitoring: fix mem-leak on SEL iterator
  - libipmimonitoring: allow cipher suite 0 in configs
  - libipmimonitoring: report NO_SEL_RECORDS instead of
    NO_SENSOR_READINGS cut and paste errors in some functions.
* Fix potential stack overflows found by code analysis in ipmi-oem
  dell get-system-info command (specifically idrac-info, cmc-info,
  cmc-ipv6-info subcommands) and ipmi-oem fujitsu get-sel-entry-long-text.
* Fix potential stack overflow in libfreeipmi also related to Fujitsu
  long SEL entries.

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../freeipmi/{freeipmi_1.6.18.bb => freeipmi_1.6.19.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/freeipmi/{freeipmi_1.6.18.bb => freeipmi_1.6.19.bb} (94%)

diff --git a/meta-oe/recipes-support/freeipmi/freeipmi_1.6.18.bb b/meta-oe/recipes-support/freeipmi/freeipmi_1.6.19.bb
similarity index 94%
rename from meta-oe/recipes-support/freeipmi/freeipmi_1.6.18.bb
rename to meta-oe/recipes-support/freeipmi/freeipmi_1.6.19.bb
index f357be2cb3..697efe004e 100644
--- a/meta-oe/recipes-support/freeipmi/freeipmi_1.6.18.bb
+++ b/meta-oe/recipes-support/freeipmi/freeipmi_1.6.19.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                     file://COPYING.sunbmc;md5=c03f21cd76ff5caba6b890d1213cbfbb"
 
 SRC_URI = "${GNU_MIRROR}/freeipmi/freeipmi-${PV}.tar.gz"
-SRC_URI[sha256sum] = "8098b23820038ad0aa39abf0f9a012e24683d384d9f91e760acb2a68b465e0fe"
+SRC_URI[sha256sum] = "f95c2b73797c4a0341a42a7b3c43efb60954c4130d082ad348fd40da554b4e85"
 
 UPSTREAM_CHECK_URI = "https://ftp.gnu.org/gnu/freeipmi/"
 UPSTREAM_CHECK_REGEX = "${BPN}-(?P<pver>\d+(\.\d+)+)\.tar\.gz"

