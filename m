Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48013.1795411819764446801
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2026 21:30:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=q6TLBkTs;
 spf=pass (domain: gmail.com, ip: 74.125.82.181, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3869b68caecso3585850eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Nov 2026 21:30:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795411819; x=1796016619; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GaGcZPGZTkvFO/6A0SeMHs8wIGu6tCaSAyr4OQMJQQw=;
        b=q6TLBkTsNjHWD+jflpUX2EaAstWXNWE2VUBucJhiD4XB0THXz1KbMsNbwd0PdXdaSu
         5j1SPZHdghTDe4HnKPFjKHWKGujcVFYENlEEorv2idlWwOkIdn79uJDu2HO/C3AmCrLb
         cWvMu4lLM6dgF+t25spaI6rqFPcucHI4hZI3R2CapNi9h941Zs0dq8SGB3XL7IzhTowp
         GpLkrTNUfteNpzFBZnKmkbY8D2Wa1PFn55/7NjgopP9h0lVdjZVCZHZLLul+oKmFAkf7
         5ujdO7+Mg7ITY0AWZi8Jhf1k3My6WnDniwPtdRFTy+Mt3Y6zTqsBgboR59+g+t7Wdpea
         70vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411819; x=1796016619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GaGcZPGZTkvFO/6A0SeMHs8wIGu6tCaSAyr4OQMJQQw=;
        b=pmjZ4W7mX/jnIRps5u4V5YbC9LzdQLwoeSlOaxWry9XqCJ+nRytT9XhPYhVNt33CGH
         2gsPENOCnB+DPF47LMcTJiM/HoCV+ZApZ0lT8poiSez5gfGsX3Y0WFV+s2QPFxJVz1IX
         lu3eR37XXdof+1sdhif/Nh4wr7lgsZkZ9YiQGzGmKxq6fTCGSUVZYsrpIgkD7KZ8a9hW
         TIUdo8QwZU2Wj7zp+0VmXZwMJyHci7Nn7hqsdLUSBB9UyPqhcf0FmjXdJpg11dc0W190
         qcWCeJOIIQf4IK3g+aP3YbrK8Ye6thEh25M+VlWsMaIo1G8mt8hp68TPaOlgyEJHECFE
         syJw==
X-Gm-Message-State: APuU4Z9sYFfRg7NXdUt1l17IKgVgaVOtzyYZIEUPyYx7SbcmymbrioUk
	DwXUdcXxLgte9dN4xP0bap/mQxeYn7rzIbKMBc2+5nnkpB1ZxUFm9kvlYvPY+0ii/pA=
X-Gm-Gg: AZFdTZe+z+jET5eXzWwjWs4jrRo/nn4fuTHHbm7wlbd1vNAiGOTzRq0hHIuJkqdzUIG
	juHSwMXSLRaGXVR8Q84VYH0N6ojNQGFbiLXHKROEiH1F0veZr+XPzQDJiQzJhgbRuq5SMSSSdAl
	uIr717vjqwhcr0Cs5VwC4G/jKD+e/LIofbmbnWxja/tnDxwcjqffRELZbw4NhH5pGAuIvdVa64n
	/Ca+Jn1QsqZO9plaZVXsTW2BbFHCaVlZeiSTeFj6dHCZRcXfVxY0M4mKjQMVEcYLP6igGIUdK9P
	yHVi5vjVTnPj6zSpR7crhA138xp61NEYTpzDkCGMq+R8z9KC4gS60oHLc7lf4KXrdQziYmzoNyc
	AP2PSGa1Y9xOKvqgf1UxAPS18IGqxDVyeSlkpLSUsuX8e0Z0Wiq52mNxf5NkIiw2KAKT0hlVmJ1
	mPMKdPOvOFQtHFc8qWYnEObbrs7KLA4KW+W1CP1Wl6o1A8SFDQ2ReyiiV0GSdQ6ltAPZo+ZORgk
	aQU+AOvg2NUOx+IPQCJOvQBujp1j2luzWL4ueC4GjoaW+aBiDb+WUU07xL6dxxADqj3mr0uK/cq
	Vc7s+nF9GnONY2gznU3v92zdo3FgP7yhlSgjleJvkqrx95NuHL8aGEvU9IIWxkPhegScJ1LU0t6
	67ANWdn+36wjCPfcauHqQ4pZ16nUJURX7DrWkYGzVmuifwec23af3pIhnJ9B0/TjFkPN/AAyWjT
	i1GgPbJ5gPLdGuApQyy8MOl+0MLAzZVTQfDEEyniGKLvfZjn7ygziqQzmIahA6nNCsy8Gj5MD5A
	ENSenRjnFy3026lNnc0k8y4WnRxDMizkPCLiet9fI+6K7syTh1sjl2EEZIoGL6JpBSSjt16CsDr
	JF7X
X-Received: by 2002:a05:693c:60d4:b0:37e:fac6:7ef1 with SMTP id 5a478bee46e88-38571120627mr11048358eec.39.1795411819018;
        Sun, 22 Nov 2026 21:30:19 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm36573136eec.26.2026.11.22.21.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:30:18 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 0/9] Recipe upgrades
Date: Sun, 22 Nov 2026 21:28:34 -0800
Message-ID: <20261123052953.3658549-18-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
References: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 05:30:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132805
Content-Type: text/plain; charset="utf-8"

Upgrade atftp, cloudflared, drbd-utils, ettercap, llhttp, openipmi, proftpd,
tcpslice and wireshark.

Notable: tcpslice's license header is now the SPDX identifier
BSD-4-Clause-Shortened, drbd-utils moves its drbd-headers SRCREV with the
submodule, and openipmi works around the ChangeLog missing from its tarball.

Tested in Yoe CI with world builds for qemuarm64, qemuriscv64 and qemux86-64 and
ptest images for qemuarm64 and qemux86-64, each with glibc/systemd and musl/sysvinit.

Khem Raj (9):
  atftp: upgrade 0.8.1 -> 0.8.2
  cloudflared: upgrade 2026.10.7 -> 2026.11.1
  drbd-utils: upgrade 9.35.0 -> 9.36.0
  ettercap: upgrade 0.8.5.1 -> 0.8.5.2
  llhttp: upgrade 9.4.3 -> 9.4.4
  openipmi: upgrade 2.0.37 -> 2.0.38
  proftpd: upgrade 1.3.9e -> 1.3.9f
  tcpslice: upgrade 1.8 -> 1.9
  wireshark: upgrade 4.6.9 -> 4.6.10

 .../cloudflared/cloudflared-go-mods.inc            | 13 +++++++------
 .../cloudflared/cloudflared-licenses.inc           | 13 +++++++------
 ...lared_2026.10.7.bb => cloudflared_2026.11.1.bb} |  2 +-
 .../atftp/{atftp_0.8.1.bb => atftp_0.8.2.bb}       |  2 +-
 .../{proftpd_1.3.9e.bb => proftpd_1.3.9f.bb}       |  2 +-
 ...0001-fix-the-hardcoded-legacy-helper-path.patch | 14 +++++---------
 .../{drbd-utils_9.35.0.bb => drbd-utils_9.36.0.bb} |  4 ++--
 .../{ettercap_0.8.5.1.bb => ettercap_0.8.5.2.bb}   |  2 +-
 .../llhttp/{llhttp_9.4.3.bb => llhttp_9.4.4.bb}    |  2 +-
 .../{openipmi_2.0.37.bb => openipmi_2.0.38.bb}     |  4 +++-
 .../tcpdump/{tcpslice_1.8.bb => tcpslice_1.9.bb}   |  6 +++---
 .../{wireshark_4.6.9.bb => wireshark_4.6.10.bb}    |  2 +-
 12 files changed, 33 insertions(+), 33 deletions(-)
 rename meta-networking/recipes-connectivity/cloudflared/{cloudflared_2026.10.7.bb => cloudflared_2026.11.1.bb} (96%)
 rename meta-networking/recipes-daemons/atftp/{atftp_0.8.1.bb => atftp_0.8.2.bb} (97%)
 rename meta-networking/recipes-daemons/proftpd/{proftpd_1.3.9e.bb => proftpd_1.3.9f.bb} (99%)
 rename meta-networking/recipes-support/drbd/{drbd-utils_9.35.0.bb => drbd-utils_9.36.0.bb} (96%)
 rename meta-networking/recipes-support/ettercap/{ettercap_0.8.5.1.bb => ettercap_0.8.5.2.bb} (96%)
 rename meta-networking/recipes-support/llhttp/{llhttp_9.4.3.bb => llhttp_9.4.4.bb} (94%)
 rename meta-networking/recipes-support/openipmi/{openipmi_2.0.37.bb => openipmi_2.0.38.bb} (95%)
 rename meta-networking/recipes-support/tcpdump/{tcpslice_1.8.bb => tcpslice_1.9.bb} (69%)
 rename meta-networking/recipes-support/wireshark/{wireshark_4.6.9.bb => wireshark_4.6.10.bb} (98%)

