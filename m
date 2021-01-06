Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web10.9421.1609946286436608732
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Jan 2021 07:18:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JA13bxdT;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id p22so4651493edu.11
        for <openembedded-devel@lists.openembedded.org>; Wed, 06 Jan 2021 07:18:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=pRnx9eWeASKfw8W7GczdmK9qBYpJq6JZg9sCXPTvw5w=;
        b=JA13bxdTRgU5hobrU0u0sXa5VnBY5v9AX5jAiNvzYRq2OyjtDfhnx+Z2oiWYGMeEg8
         IEi1FNWyc8gs6yLi8W0fcIxqxicb6/TlztQJpqq6t8Inlyvj1qe5yphoV5r0PpdLGqdw
         rA+wmUsxwS1DN0MisipTjFSRgTxgVNj98YADGZil6WFLm/BMpH1TquKTnNaAWCNOYl62
         nlKgQqP+9pBmVofDNjNb/faj6aZGGJrVeh/jdA6EBf5IZCPLtqjaRbBvQc8Z4s520B+r
         +ar7vIjSIgYF5ep4n9qDqedWMo/mneq22njhNpHNzKpKQWcmqAoJJbc3hz+YDg08FvLS
         q2Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pRnx9eWeASKfw8W7GczdmK9qBYpJq6JZg9sCXPTvw5w=;
        b=O4sdLNiLqcgAVjb27dJ83SlIV9gYw9qzeTPSkJJlfFVO+RSYM2S7yxIhpzJhBsO3EB
         6D2URyaFXP3OuDJv/aOWlRNRyNu9pAu/keAnXQ8pO4OiU3OEznC0T+TAqMcwAeMy8Yhm
         vlKEaUQZJxIr6BlhOLZh5uOKDEiGRRXo8kI4tJfUHh7xjNSbrJlSlbQ2qOjOSoP1KF9D
         OeLABzKK6TlCxOk2n5GtDqC0Pk4/Ifp2Cqrnx27VnqIXGELyxYEQy5TeTHXPhckoO/df
         67x7NMUbnuPSSucY46ytEm9/phzZt9Per+p3sol1b5Rjn9WaD8QFNdE9faH+snCs7fTO
         lTZA==
X-Gm-Message-State: AOAM532GyLDpkaGh4ZLzaMpYaEGM4aEadTsz5xkXBaD/gYZ9gBsViGeQ
	3+En34IxrSPJTt7Qscq5A04cWRTfAS0CXA==
X-Google-Smtp-Source: ABdhPJzLX1GQzyRP3FmbQtbnQ9knFE+1pgVxQljbuUJLguJXnlQy3/Tepwqxk6iY2N7xCIjas/EcdA==
X-Received: by 2002:a50:cdc8:: with SMTP id h8mr4333162edj.293.1609946285111;
        Wed, 06 Jan 2021 07:18:05 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f47431850a04677ec24921a.dip0.t-ipconnect.de. [2003:f0:7f47:4318:50a0:4677:ec24:921a])
        by smtp.gmail.com with ESMTPSA id lc18sm1366899ejb.77.2021.01.06.07.18.03
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jan 2021 07:18:04 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 27/28] fluidsynth: upgrade 2.1.5 -> 2.1.6
Date: Wed,  6 Jan 2021 16:17:16 +0100
Message-Id: <20210106151717.1779543-27-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210106151717.1779543-1-schnitzeltony@gmail.com>
References: <20210106151717.1779543-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes:

  SoundFonts may never be unloaded correctly, if
    polyphony is ever exceeded (#727), or
    voices are still playing while their SoundFont is being unloaded.
  Calling delete_fluid_synth() does not free those SoundFonts either. Affected are versions from 1.1.4 to 2.1.5 .

  Other bug-fixes:
    fix a heap-based use-after-free (#733)

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc
index 73c1d0db6..847a22311 100644
--- a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc
+++ b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc
@@ -5,8 +5,8 @@ LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fc178bcd425090939a8b634d1d6a9594"
 
 SRC_URI = "git://github.com/FluidSynth/fluidsynth.git;branch=2.1.x"
-SRCREV = "6776569abe9a885bcec14141692fa93c0568d51c"
+SRCREV = "fd9bf6a6b0d10a984d2eb0e0e549700b7aa590ec"
 S = "${WORKDIR}/git"
-PV = "2.1.5"
+PV = "2.1.6"
 
 inherit cmake pkgconfig lib_package
-- 
2.26.2

