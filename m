Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4523.1794448102956464484
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Nov 2026 17:48:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=HQe42ng1;
 spf=pass (domain: gmail.com, ip: 74.125.82.48, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1b3b4bcbfc9so1525876c88.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Nov 2026 17:48:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794448102; x=1795052902; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tP6o/aEJBDTL3jASpfMzU1MZdWf1iH+x3M4rrTdpjNc=;
        b=HQe42ng1MLQWG1783xl+NpLn/W2N0/PsvfZQv0/sfS56KXaXhVRN9R5iwek7w8k/sn
         iKcXMIaa6OtItdb41TwI38cAIlV9mEK2PenrHgYKjvNt5h8KUufLn0OjbLrSwd2mxilT
         XHRWOXzcIpngQssL70CgbcxUhZXsI5GxoL61aDaMkphbxVuz5ZixiaBM/B3ymyphtPgM
         bEZoGC6nD2qwO1lRU5cBIA6huv+LIMCcbYbaCtyeZYvZWDAXSXFbgHww5+Q0Oq88BnzN
         aDJPWRxARFeWllOlyQhxTCRfqCW7PAFK1LjHcWgdTmaMYzz+BEMIAywUR/gS/HkhtRcG
         38oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794448102; x=1795052902;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tP6o/aEJBDTL3jASpfMzU1MZdWf1iH+x3M4rrTdpjNc=;
        b=WIvNmcqcI9hukasr1XEvepPHB9iiiZXvAR+V8RpjTgUx4x+HicMfxI8Z128ZRifl81
         zpIKsOPpTGSNIqNX3bX/DF5G348ooIeH2UEHpg8hYLU+fKlLONBXq+MLkP84dkx3xC8f
         LNvASBfi94aPcAN+HYpEfAYRfBTNTnbEJNBpuUNEowoOHQX727tyBZnKp/z1IFVWItwj
         cZyKRGNM+U/+4/qOa8Vo2cYmFYxgq+o1EI6Lnhn+FC8RSPH9ZTAB1vsHgpbo+jRUKb51
         89Fr5sBGUfyOp/ar6/RD/MG9VmTdHbZ1BGvF22Pcmg5igBdkf7UAO8DhBjaRJU1+/uH/
         Ly7A==
X-Gm-Message-State: APuU4Z8AGaKSwCCwm+y2avnz6u6g8Rf25mHaR6oGpGyiTsXv5lQvIKF0
	j5+UHnrHsDAqus4V4uyiIqtkqyWwftoPpLNwbjTiLrQrG9WrOH1cec9F2mSL/ohD3Zo=
X-Gm-Gg: AYBFou1WhMQpT2ao4RE/DdLSgnRkv3TROA1RSrZAa3IOuf4uOueBvouusZVmOim639u
	Ji7zCW7YOX0UnBr2dVOZcQ5U55f9/PZyn0I+62hzqjxARc51vkZ+9cH9oPS75SGaFz3O7nKua1h
	fvGG+licMCNyRCcvFdHtVJOfslSgwaE7i/nQcoSqYK0rpJXA0//RJCMkPVKK6zth3xMriHgDK3x
	Px/LgAm5PejFQp52+xd9xzxLMEb5ICzK1GlE2xQb347mn9ZpTAImkQm+GNi+Mw2y77b1yckuUwq
	X+gS7/49ZSamIkgOZ/5hui0Olb3soYon9DleSaLUd+q2KJVqs22sR55LtvwMrinlnM44HQYYfIt
	efzeyBWbdn1aa3wlNjrT3jk0ksoXcBaLgDENnEGIf/Mjf8bzHobmbGWtP2SgYKvc8nUhjDwJeWN
	V6ZwmhuUDT05mdE5sYQr0tUzy3+VG23LYSBnfpOhiycad+qyc3niwh5OpZZV/paQHl41waEkRRn
	013zPwpJi1EeH1smr3VbaHl9UEad9TXY8F0T+1bXKGdthhnfB6d8BHvadPjpbXiAoCQNrNMOPq0
	KlR8kZg8E8NpgCUfFIlRiWgaCc1XJ10C0opi25R+wvcYOMV668HOjRk2SolvBENsQXK4O/3Pqe0
	Q3reN/09zANEo0oFDrpQua8VyYshju4iwqHH2KR+VYM94QdSdzAwXMQZ7fJ/w8zzhyXvO3drIcJ
	qG/Fp4IVLq+BiBcPWencisfRSaxd5SXYD5sUapbxMio3c1Mn59dOxru5vWnjrsJYlhFze+kQMRh
	JBxIgAic1kHCUMaRZHWPsXuhkqOB2vUszOaNbqTXLhywMplYsQxD768+angkr/5MdNAcMYHaWvs
	HyGt
X-Received: by 2002:a05:701b:230d:b0:196:aa86:fcf3 with SMTP id a92af1059eb24-1b3c03273e6mr3576455c88.26.1794448102080;
        Wed, 11 Nov 2026 17:48:22 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5890e04sm20253381c88.2.2026.11.11.17.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:48:21 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>,
	Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
Subject: [meta-oe][PATCH] cpupower: Move cpufreq-bench into its own package
Date: Wed, 11 Nov 2026 17:48:18 -0800
Message-ID: <20261112014818.3600049-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2026 01:48:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132144
Content-Type: text/plain; charset="utf-8"

Only cpufreq-bench_plot.sh needs bash; the cpupower tool, library and
the /usr/libexec/cpupower helper used by the systemd service are a
binary and a POSIX sh script. Split cpufreq-bench, its plot script and
config into ${PN}-bench and move the bash runtime dependency there, so
installing cpupower no longer pulls in bash.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
Cc: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
---
 meta-oe/recipes-kernel/cpupower/cpupower.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-kernel/cpupower/cpupower.bb b/meta-oe/recipes-kernel/cpupower/cpupower.bb
index a8cdf1bf0a..789df415fe 100644
--- a/meta-oe/recipes-kernel/cpupower/cpupower.bb
+++ b/meta-oe/recipes-kernel/cpupower/cpupower.bb
@@ -27,11 +27,12 @@ do_install() {
 }

 PACKAGE_ARCH = "${MACHINE_ARCH}"
-PACKAGES =+ "${PN}-systemd"
+PACKAGES =+ "${PN}-bench ${PN}-systemd"

+FILES:${PN}-bench = "${sbindir}/cpufreq-bench ${bindir}/cpufreq-bench_plot.sh ${sysconfdir}/cpufreq-bench.conf"
 FILES:${PN}-systemd = "${sysconfdir}/cpupower-service.conf ${systemd_system_unitdir}"

-RDEPENDS:${PN} = "bash"
+RDEPENDS:${PN}-bench = "bash"

 python do_package:prepend() {
     d.setVar('PKGV', d.getVar("KERNEL_VERSION").split("-")[0])
