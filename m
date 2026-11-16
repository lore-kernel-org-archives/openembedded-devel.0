Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17936.1794787845941606665
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Nov 2026 16:10:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=JA2hjrwv;
 spf=pass (domain: gmail.com, ip: 74.125.82.44, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1a2761c69fbso3679181c88.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 16:10:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794787845; x=1795392645; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0LrPCmJkwAUu64g+exykLdsaqqv3KaAXPfFrFmhEujg=;
        b=JA2hjrwvTNzJw8gp3eFIP/oFLUaj0pphekdnFqVHptUGeEOKhimcyW9jrvn7fvWNys
         4kWraK8j4dziGhHK7pK7lCSNRZnGUs5sLQSUY0M3JlBvb7Iy5qvs2krkS/41HxPfxdqM
         ath/Ng3mF1n7FyM0ASxXzOZkpOndkfnnVtwgj03k4qI8g0A9YPSu6USJ0kyYd0JkZJC3
         JTCp3XxQJGrJhuXryYrfKjnEn3sH4m0+clFBRXQQQt9KyKWRmQGVMSYksVXAQVmRcDLZ
         28bv166AAxpMjY3AqMUJWroRDaAZWkRSH7U7kALlvCx+sBemfcjGU4Z5CkLGwHI5PGzs
         gX2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794787845; x=1795392645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0LrPCmJkwAUu64g+exykLdsaqqv3KaAXPfFrFmhEujg=;
        b=iQDmMZ3WPfsIsVe59lwIFKql+6aOdD855oi6ax4pSMexUtpxIku+GWwafZriR7V/Xc
         nFj2+32SqTRSyrEycVREYJSbXn/lkdQW6BAQjBTMBGVqFxQ8UBk1zrhzhUsEYRr5GqGA
         ipLHIHF2F2OJt/ZnEp1P+oDRysEV383tzpwrMGap8AdedUNExEXU6EcTxKAJoVPuuTLX
         9R6Yqfl7xaSjuvSo3ExNW0KjUmMbSAa0PGS2ZxpCMOnNifPrbavLuOvTOhhJFZhwb/0P
         FFsof7g9FC8J1dd/Byi0XjLDLDfCwrTBYsmywbXhwhlGSEeFXvwy6RdaD6PsCychVJpx
         uuPQ==
X-Gm-Message-State: APuU4Z9ZJPKHETTy68K5swnucRcrWsWttZKRCvu/cvNu4wjnKxMxuyBF
	i1NM8x3cY4OyMXyEH4TKIgqTDC8xrgX+xKPswfUeY0LMGt2oeLr9oTRRAZdBJo2y
X-Gm-Gg: AYBFou3CTqXApTEfGzmbbeCI33JDWrzyArBvj9nTfAu4yoNedvftrVH7SY9NRGJCz1w
	F/foPULicTMqo004JIgjx/kXywPpqoD7Hfs2THwKeM3dTSzGP0TkP4eXxQkeYbThRrynLBDYK1o
	d6gJPbAZPENnpv4gi9MLFL+rtOObF409ApJZR0InIhLNcNB9EYBqPtZFwuppWEr9zWiXihpsS0v
	5SRTHs8hLHnRR+pVdh9XgucOiqENPfC/b5F6Q8FzohQdEIVcbU+RHkx09HogxfhnzDtP0MZnAQK
	ntbPifsznCA9hx+Nv0M469494bfsQbIGepGK1D6575APwbShGPINuC1BS5SNJ9DWE4Pwt1RN30W
	zSxNd6nbhr7q+ZTOvG0GWDoeaiiWGvJ2JveXdaCx7KcNObs8rR9VTt+oWqIn5A3Pr0JUtGuU3Nv
	Xcuufc4NlFmi1HMRSkowL+guVdTwlasK0xCz+5XgUM95D4oDRtsAs23JXE/7Z8AxQqLy/ZjHLyX
	91M19t3XMeTngDPrhwdys8CIv7yzjkvS+Sjcylh2oHHQSP9nVk6JfwyQPry9E0ugJaJnj2MjA44
	vyfSkfTtsNa7GAHJ6S8zuJwpEDzLxSov9WLq6KwGh0nhPA9BMVqcTxi1dcxzofJN/5lRXE8MuGn
	y8DCk9CX4/OhccbksBO7zUiJkb4CY5KiTOwoIjm67MhPeNyH7YT0nKx3pMIIN/fp+d43okU0fAV
	C/KpAJculeGcxQdWoRqTVIBePJ8NkEdLtyDljfTQQ+61LZKgZO6cKYd+To13dRrHIF/Af44fCmZ
	STVbv1zPR5/L6fLwiC3NDMP1qIpB1rL9MNaIj4fJVBOF/7d+D3/9/+fGWbG44S1+Riy6Ya2h7nq
	RPi9
X-Received: by 2002:a05:7023:a4b:20b0:1b2:4e2c:6838 with SMTP id a92af1059eb24-1b50314bed1mr8811748c88.15.1794787845220;
        Sun, 15 Nov 2026 16:10:45 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50316d9c2sm24163844c88.7.2026.11.15.16.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 16:10:44 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 04/16] hotdoc: Add leading space to SRC_URI append
Date: Sun, 15 Nov 2026 16:10:26 -0800
Message-ID: <20261116001038.440763-4-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116001038.440763-1-khem.raj@oss.qualcomm.com>
References: <20261116001038.440763-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 00:10:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132385
Content-Type: text/plain; charset="utf-8"

The class-target append only works because SRC_URI happens to end in
whitespace.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-python/recipes-devtools/hotdoc/hotdoc_0.17.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/hotdoc/hotdoc_0.17.4.bb b/meta-python/recipes-devtools/hotdoc/hotdoc_0.17.4.bb
index 081a8d9607..c7093ff717 100644
--- a/meta-python/recipes-devtools/hotdoc/hotdoc_0.17.4.bb
+++ b/meta-python/recipes-devtools/hotdoc/hotdoc_0.17.4.bb
@@ -12,7 +12,7 @@ SRC_URI = "file://0001-c_comment_scanner-fix-function-prototypes.patch \
            file://0003-CMake-4-compatibility.patch;patchdir=cmark \
           "
 
-SRC_URI:append:class-target = "file://0004-Use-flex-with-noline-option-to-prevent.patch"
+SRC_URI:append:class-target = " file://0004-Use-flex-with-noline-option-to-prevent.patch"
 
 DEPENDS += "libxml2 glib-2.0 json-glib"
 
