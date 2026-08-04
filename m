Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECE03C55822
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 19:41:01 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24811.1785872455699838524
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Aug 2026 12:40:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=BVgZo9qm;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38e69bdb0fcso187806a91.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 12:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785872455; x=1786477255; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ni3MOT27lbSWXwL+Sh6/Yz7CXjwaePUXBXGNXrBcNUM=;
        b=BVgZo9qmogX85UOVzn7CromDouokHICM52jxKhUMqHBQ0vG/6ahVLYSsFjOsaKF2jk
         CKSILbjqBYF8AXifzj6qFXgrfkfONIYABjPIZs2oEdUaR8Qp5wT/y5ZgT+N60zBsH4lt
         Zdyog88/4/mk39AVyZjsXXYMqQLjKaQUclr//mvLR+DF2hXWEBgqmenCuTIpB03zfbpQ
         70KsS7yEYTXDhzA8Wzy+YKWYfOhj/RojcSR+drAgl3o+ixb1VOmz3gi2puSIqAJIdupz
         q8ST2fhu7PGty9GI2X3E/9Z+uDQLzcHgVbB52+ENRH8re12X/FHZyyiRTc5RXcxm15E2
         B/Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785872455; x=1786477255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ni3MOT27lbSWXwL+Sh6/Yz7CXjwaePUXBXGNXrBcNUM=;
        b=HXzucfNQwSzD/FKQNeQ34GJ4Prp7ssicUyftkhvq3y+Nw1Oq5s3rEOnCHrPTyLwQ6q
         QZk959wADnEBclXWdUV/0fTEpnvhPeE2qkamBem7QJIfKSv4SIbsYiVEcdRDUpq6M8Iy
         9n4t/B8JVqUJlFUTL+DpRM3Rw6VyQFaVllqVbHHedZ/17xDUW62COeyqIn1ztTbyYFjF
         SRLm3fHx1FJ1ZIRyAB0WqPhHM75Rd9LN1YVH1wkRfuSotBI0z1xRD03UD2/0V5u6laLj
         l7Q+5c/2zfXqgWA0jKPccf7LjO+yGezQmeUz6FbhbOKkuXUcBKj/ReIvu8xHA1Idwt1s
         fMvA==
X-Gm-Message-State: AOJu0YyCgghBX2/dDUM5JFHNvWxGxXwioyyLZxAqPgA2rShnnOOS08nP
	iFTS6PCWcNvbTAnzfOOQ3QMtXOySQDAahPiSQobd4jHstQXz34V3DCUCGwc83k9t
X-Gm-Gg: AR+sD10w0NgrIHYB0vhXURVB0bezyCboY2EWQbGkCu/DT0TqJb8WF1Kfe34HGTu1k0p
	+7J1h0lrOjxqrjwCj25K5XBjofAiT/Xlsus0ZSRyJJzyiwcHILP4k7NVNQIRrtpWrtXEOsBVqKW
	vA9BYLpPQxUEQ5+ZgNvvbhf0NbGYGPnOkV/5VraWBJzPPxlz77SiL+avHhDvIUJQknmICvdw4C3
	DNcykd8lSYatKF2vTbIPtA/Y+wGJEDnDKWjWkBavyQ16nsVO2bZePhg3iGUAb8Ut/IQC2UN4wXE
	cQxIgOzyRqdlh0Bql9um0ltiH2ZUB4p0wm0xRv2xCHfoeeY+mXAb2mlJBnGXAmlXSk8xiu3W0Qq
	FfCXhM5pAnZeL5S/1Xf/utKLxQJ2NCS2bqu6+OAdljXkkV2k15x4N+BuqMGNtBwctBR/A2vLp5P
	DZExN9+sO780fPekMQu01RZ/9OhH8dXXSyugplxGPSmTRmWxzxAvqxfXlGdH2nLIXZyobimqQEL
	B8=
X-Received: by 2002:a17:90a:ec8c:b0:38d:c74d:29c5 with SMTP id 98e67ed59e1d1-3903c5c0c92mr1197454a91.19.1785872454966;
        Tue, 04 Aug 2026 12:40:54 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3158673b7f4sm8156417eec.17.2026.08.04.12.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 12:40:54 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][wrynose][PATCH 18/36] python3-mpv: propagate ffmpeg's commercial LICENSE_FLAGS
Date: Wed,  5 Aug 2026 07:39:45 +1200
Message-ID: <20260804194003.3158916-18-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260804194003.3158916-1-ankur.tyagi85@gmail.com>
References: <20260804194003.3158916-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 19:41:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128765

From: Khem Raj <khem.raj@oss.qualcomm.com>

python3-mpv RDEPENDS on mpv, which requires ffmpeg (LICENSE_FLAGS =
"commercial"). With "commercial" not in LICENSE_FLAGS_ACCEPTED, parsing
the universe target - which ignores EXCLUDE_FROM_WORLD - reports:

  WARNING: Nothing RPROVIDES 'mpv' (but .../python3-mpv_1.0.8.bb
           RDEPENDS on or otherwise requires it)
  NOTE: Runtime target 'python3-mpv' is unbuildable, removing...

Now that mpv carries LICENSE_FLAGS = "commercial" and is skipped, carry
the same flag here so python3-mpv is likewise skipped cleanly in both
world and universe instead of surfacing as an unbuildable dependency.
The redundant EXCLUDE_FROM_WORLD is dropped.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 2ba9dd882358ae60a952eb7de22d562c20056a79)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-python/recipes-devtools/python/python3-mpv_1.0.8.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-mpv_1.0.8.bb b/meta-python/recipes-devtools/python/python3-mpv_1.0.8.bb
index 2d345cfc55..19b84334f1 100644
--- a/meta-python/recipes-devtools/python/python3-mpv_1.0.8.bb
+++ b/meta-python/recipes-devtools/python/python3-mpv_1.0.8.bb
@@ -14,4 +14,8 @@ RDEPENDS:${PN} += "\
     mpv \
     python3-ctypes \
 "
-EXCLUDE_FROM_WORLD = "${@bb.utils.contains("LICENSE_FLAGS_ACCEPTED", "commercial", "0", "1", d)}"
+# RDEPENDS on mpv, which propagates ffmpeg's LICENSE_FLAGS = "commercial";
+# carry the same flag so this recipe is cleanly skipped (in both world and
+# universe) unless "commercial" is in LICENSE_FLAGS_ACCEPTED, rather than
+# surfacing as an unbuildable "Nothing RPROVIDES 'mpv'" dependency.
+LICENSE_FLAGS = "commercial"

