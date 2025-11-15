Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD1CACEBF6A
	for <webhook@archiver.kernel.org>; Sat, 15 Nov 2025 18:29:40 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14130.1763231377641519214
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 Nov 2025 10:29:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MfG8bxWf;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-477770019e4so35234055e9.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 15 Nov 2025 10:29:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763231376; x=1763836176; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=s7PD3Nvbtxr93i3VqxiFR4r2mhB+Ntlo/3wGZcADljw=;
        b=MfG8bxWf77BBSsWcNpEq2qO0WPxjHs7TRDD5gzCzIno7CWwLSebkudP6+Etu4z25+X
         mlfNI0pAnJVXyZDk/fgV7acrFJjPZ1T+uD/k4ugmO69Bf+RB8rSUYHi0j34+Hm9DOF27
         mF/cEXDTHOV1YX0Q5/LSoGf0e9WvkOwhH5S7otkre+tYdH7S9gJZRhdRoT50x/UxXy04
         NW1gfcGt9UxnFwAfoePJnNeK4kB0G/D88ODxwF0oz48zHOa8CydxuWrjWFgiMy8xLwmP
         LwK/vQIbhuCztnnFx+YAWmxWkDfXZgQdoR3e0oZur63NEXaNlnyCrIiTFoqbj4PRdmTR
         CBJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763231376; x=1763836176;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s7PD3Nvbtxr93i3VqxiFR4r2mhB+Ntlo/3wGZcADljw=;
        b=KvUUAFYbSP7O/SaFPHgoX8ES4amfWW/EfKgCDnI/gjW7nUYmwMGxrmP2Ui0WQEW2Jl
         8+H0OdC5VzBcAJrqZ3GHudQI02RGE0oShE4baBXl3vMsHaljRFqFd4+egLLAEeAlNh8H
         nsCah6POdRM7wetx6wJDj/6hsFclnoHsJjEodP5iwBAl2r1wKV34bflfNAcwlwknRyrA
         POjOjtGUZ77U+7lgTyxZjw0kad8LylqxqIlqAcMipZG1g6aDrDoNoAXnx1UdJv8gTCIX
         euzXCjdEER6wR0C4Pz00c0AVIT/CnDryWLNGigKY6ECmJ31ir4AAV9ZPWnrBxHEJzki7
         i7Rw==
X-Gm-Message-State: AOJu0YxeXtT2z0OiScZVTh0bMpvL+egEuavq7wDNEbBdAiNP5yjgMScL
	PivZD2vVTlDCJXvbsLP+ASWco3aQYLErzbGiA62Wb77b1z1JrV8BtwTdP3fDUX8/
X-Gm-Gg: ASbGncu+jyMsD+dZJBFA7QX9hflxtTA9Wfo8Dv+FY+v+F7U0qKPoJc/Tda50uCGYJGm
	eMQ22UXh0w2gWZcUQJOOna4EofQ/VtjH76G0MHzvRysdtax0x8P09gIZFdeEcNdEvB7Fu+VGpbQ
	4FvFOv/FgOXxeJezrlDx1TXUnhFpSYkF+qpr0phAEb58dYC4PuIP0mLgWTERhmLKYrydebsNoU2
	MYsFFU/WGUb09BEj8ZqFJesY3zy+3uT4skN4ThU3erAQcbzZ0/9/YY0vxy9rtwGUOXctklSExKj
	vhKt4eGrlgWSzvJpDQ+XS82zLHtJ/AcHP/OWcosERmrwDE7SoIBjtMHWxoYzQSE2XZbKrF3OXvC
	K0ef9VQqSTsxe+y7eHgRxkneqTgskOtIMBtzOdjgVtOA7Raq/6N6piUrv+rHjt+IAdIPV0XSqPQ
	==
X-Google-Smtp-Source: AGHT+IE6KN2NG0Ds6CQlb0z72asqyuf239hkbzmTTKKDJ7fyhvY+A5ASnasJdFDkNXvvZIfo/VDRZw==
X-Received: by 2002:a05:600c:3104:b0:477:7f4a:44b0 with SMTP id 5b1f17b1804b1-4778fe89527mr72358435e9.33.1763231375791;
        Sat, 15 Nov 2025 10:29:35 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53e7ae5bsm17024927f8f.8.2025.11.15.10.29.35
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 10:29:35 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][kirkstone][PATCH 1/2] rtmpdump: mark CVE-2015-8270, CVE-2015-8271 and CVE-2015-8272 as fixed
Date: Sat, 15 Nov 2025 19:29:33 +0100
Message-ID: <20251115182934.1263398-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 15 Nov 2025 18:29:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121746

From: Peter Marko <peter.marko@siemens.com>

This CVE is marked as fixed by Debian.
Extracting Debian jessie Debian sources [1] shows 4 commits uses for
backports. All these commits are already included in current hash
([2]-[5]).

../tmp/work/core2-64-poky-linux/rtmpdump/2.4/git$ git log | grep 'commit \(10b580aabcec1621b25518271ba1ab2b018be88e\|...\|4312322107a94c81d3ec5b98f91bc6b923551dc5\)'
commit 530f9bb2a02a78c1198fb2bf0293a12d225e4691
commit 4312322107a94c81d3ec5b98f91bc6b923551dc5
commit 39ec7eda489717d503bc4cbfaa591c93205695b6
commit 10b580aabcec1621b25518271ba1ab2b018be88e

[1] https://snapshot.debian.org/archive/debian/20170704T094954Z/pool/main/r/rtmpdump/rtmpdump_2.4%2B20150115.gita107cef-1%2Bdeb8u1.debian.tar.xz
[2] https://git.ffmpeg.org/gitweb/rtmpdump.git/commitdiff/10b580aabcec1621b25518271ba1ab2b018be88e
[3] https://git.ffmpeg.org/gitweb/rtmpdump.git/commitdiff/39ec7eda489717d503bc4cbfaa591c93205695b6
[4] https://git.ffmpeg.org/gitweb/rtmpdump.git/commitdiff/530f9bb2a02a78c1198fb2bf0293a12d225e4691
[5] https://git.ffmpeg.org/gitweb/rtmpdump.git/commitdiff/4312322107a94c81d3ec5b98f91bc6b923551dc5

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit d7758a8d0cf509e2d8db941ca4fd855c39beaafb)

Adapted to Kirkstone (CVE_STATUS -> CVE_CHECK_IGNORE)
I have performed the above verification with the Kirkstone revision successfully.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump_2.4.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump_2.4.bb b/meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump_2.4.bb
index aa92c58808..fab07c1416 100644
--- a/meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump_2.4.bb
+++ b/meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump_2.4.bb
@@ -14,6 +14,9 @@ SRC_URI = " \
 
 S = "${WORKDIR}/git"
 
+# fixed-version: patched in current git hash
+CVE_CHECK_IGNORE += "CVE-2015-8270 CVE-2015-8271 CVE-2015-8272"
+
 inherit autotools-brokensep
 
 EXTRA_OEMAKE = " \

