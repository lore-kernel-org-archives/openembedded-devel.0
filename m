Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11772.1795762876670219585
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 23:01:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=YLbxYJ5S;
 spf=pass (domain: gmail.com, ip: 74.125.82.42, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-14394530ec6so1572199c88.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 23:01:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795762876; x=1796367676; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=e1233NUhRGmmyvyZ2WHMHYQrJrOEnq9WadoYoL3W44g=;
        b=YLbxYJ5SgqDZcE+digM/tk4h7M7kkuPBpUDO/ZGxhT1Z3sbOoY/pf4C1FYmBz8xUJQ
         qcitRXN5gl+Ju53K8bHtnSmaEo0RZgSY76a9RilOha9vhd9tm0PayecOJCPqHzmkvheq
         009vjLOL5MaFcFn1J3SrR8wKyD6QyBsN1i/Qsg2xeT3Uc9P+PGWECaQxXHAVpsrC0LLE
         f+qi6jA7EIR8UEAIzgqrLOm2T/CZejRIdhRCuAQzDtcxhEYQv3KRmifN8wAnN9DPjGPM
         oV5tEJFX0yTN93S+ZUtd9571HaXuzkVLiVBt04TuS0nv42K76FTEhuOTDzL52Z8B6RXM
         tHNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795762876; x=1796367676;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e1233NUhRGmmyvyZ2WHMHYQrJrOEnq9WadoYoL3W44g=;
        b=S5DFNUFfN4DRPCr+3pvvbdgiC2Zhl5j53kJXZsFODB3IRRtCRgGsrFXVOOFB8b09eJ
         jz/IWFUXe2eqk7924XYAfFnndxJAhhljcxQ8Kwm+DLuysPmKbHVjOCBVDuvWhhI0PFbb
         lpYQPbE5OJDo44K3TYUY1BI4OXE9JMKWCz5IDn3npwdTZUIgAZypMznoJ8MXEWxpw7Z+
         Zz9YJcnJOJIC+hkoqTjwHmvK2QmOuZSClK0PLEULDs6wXCwXfbWxoI0Nb4xC1hXMi94G
         hGWWWCxvxkuTklf2n/RjDbzygGfHATzt7mdCRLQ7VlzQaNcVrRNureLd/LnLuVeZ4pmS
         vMjw==
X-Gm-Message-State: APuU4Z9RCShkxUgRzuU+m+YiEOcSwLfhHvq3L2lKzeWR+smjsCaXgtFa
	YTBpzDyYo80zF/xC0pTOH7PNKGbhEYcDSor7UOJwCkTN9e2xkTzG5FNA+XqKgOSW
X-Gm-Gg: AZFdTZd0on0WJgUYFzFiEsqtfIK9oHvvpdia9uwgI/Z4WPBQACn3bB1N1OFiw8kONYP
	WMVSq0F0NFX1kT9q3tOksaIZdwaPKOn7AVScD6SxyTL4AdcUHmsmABtqFFQ/alRS36WVx3bgMkf
	miLyAOKwU97DzxK8t9l3l/4Vj+TfbKCzZjbgkKc6fGkiIGlDY29STmWl2gVsD2NLiblOC09zKjl
	RB9dGwettPeWfGxbXJEaKLhzfG0IKwGvia7oVDcCE474yEtsyddkWOrAFqgyZewWc/UlmV9JFtk
	x72Xy3jFZ77OcCInpw/KS87AOekF+x2y+cTPi8cW+lZPG+pms4dgio05eVjxFIw8mqWqGUZYE5A
	3S3kXG2pjS0P6N5sAgoU9OaL3M7srcciiamB7Gp5U+uVAqwk/i/DbOlHUyR+MJrAHdN9SFFIiKD
	tGo57GwFQm5260rVALrd9BS7v9RV3l7N2tU05pb9dxIi9tzFPmR2iaP7s3OvY7RTnpgueOd61aX
	WA4/CfYww6FRXPxL5Lt6T8KYxsQEB50GRLW2s9+JoP1m8iqtrMHTkwjl7GpLPBa/GloCYaOxpQV
	iWGoM11jK5Mh3dkzspf9skWrvo1OuZ1a7EF7VZ3obGIK9vt4NLwg28+FokXdFrkZBYd3HJjRnNs
	6Wx1K2Sse6ZsOsHoiI5ww4m5fdIkWzD8eeJ4UIAYi/6Jw5XgAPATiFaP9hl3VGTBg19qMCYORiE
	iEewdVqT/KqDAw5HG46o5ABVc1f9eij5+zNrWwP16366+Eb+L9KmlLo9QsbrRzzv+LHJquM1iV9
	aqNjKKxJ5rFWEW77P0JyL54eeQ2uIWqXsw0SDL0AKp86+OyNs9B1cD65NzFpic5LBHFtztXeeur
	Byo1Xf48nx9RnHbTtLXrm7wDtg==
X-Received: by 2002:a05:701b:2901:b0:1b2:4e79:bfb0 with SMTP id a92af1059eb24-1b5568cdec4mr25315200c88.23.1795762875767;
        Thu, 26 Nov 2026 23:01:15 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm61309643c88.13.2026.11.26.23.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:01:15 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-multimedia][PATCH 00/14] Upstream version check fixes
Date: Thu, 26 Nov 2026 23:00:58 -0800
Message-ID: <20261127070112.2273685-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 07:01:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133305
Content-Type: text/plain; charset="utf-8"

Fix or add UPSTREAM_CHECK_* settings so devtool check-upgrade-status
reports real versions. No recipe versions change in this series.

Khem Raj (14):
  libavc1394: Fix upstream version check
  libdc1394: Fix upstream version check
  opencore-amr: Fix upstream version check
  vo-aacenc: Fix upstream version check
  vo-amrwbenc: Fix upstream version check
  streamripper: Fix upstream version check
  alsa-equal: Fix upstream version check
  aravis: Fix upstream version check
  caps: Fix upstream version check
  libyuv: Fix upstream version check
  tremor: Fix upstream version check
  webrtc-audio-processing-1: Restrict upstream check to the 1.x series
  librav1e: Fix the upstream check
  dvb-apps: Mark upstream version as unknown

 .../recipes-multimedia/alsa-equal/alsa-equal_0.6.bb      | 3 +++
 .../recipes-multimedia/aravis/aravis_0.8.36.bb           | 3 ++-
 meta-multimedia/recipes-multimedia/caps/caps_0.9.26.bb   | 3 +++
 .../dvb-apps/dvb-apps_1.1.1.20140321.bb                  | 3 +++
 .../recipes-multimedia/libavc1394/libavc1394_0.5.4.bb    | 3 +++
 .../recipes-multimedia/libdc1394/libdc1394_2.2.7.bb      | 3 +++
 meta-multimedia/recipes-multimedia/libyuv/libyuv.bb      | 2 ++
 .../opencore-amr/opencore-amr_0.1.6.bb                   | 3 +++
 .../recipes-multimedia/opencore-amr/vo-aacenc_0.1.3.bb   | 3 +++
 .../recipes-multimedia/opencore-amr/vo-amrwbenc_0.1.3.bb | 3 +++
 .../recipes-multimedia/rav1e/librav1e_p20250902.bb       | 9 ++++++---
 .../streamripper/streamripper_1.64.6.bb                  | 3 +++
 .../recipes-multimedia/tremor/tremor_20180319.bb         | 2 ++
 .../webrtc-audio-processing-1_1.3.bb                     | 3 +++
 14 files changed, 42 insertions(+), 4 deletions(-)

