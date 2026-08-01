Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAD39C55179
	for <webhook@archiver.kernel.org>; Sat,  1 Aug 2026 21:46:06 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13744.1785620759405888432
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 Aug 2026 14:45:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=cJVHnZJA;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c981c2c37cbso1615702a12.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 14:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785620759; x=1786225559; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PXWSWEa3bGY7siVknL+eOHn30D1koM6RcV1JTHDyckU=;
        b=cJVHnZJAro7hRL+8r6XQufpTJ1glLpqua/gXDQFskHAfe7+L+U1hasMeAnujBNfDPd
         dtTqbBfKwXIrtHfnjCnMCN0TITDn/MYeMMbzZvayaddkI+DHOY2EV4hdKWnVD32YOf4o
         QofClPcV121YwLLO2v+oi7EY4Nf8faX9g71zov2LwBCtHN+QePNzmms9ZJPLwOsaNGSl
         M4dRuS2pI/kV3lJQaFYGVOFCRNEHm6z9/nsZP6LLrCw+hphaAX20fcT92QgwVVVJxbZU
         +29f8wb6Rz2Ojm3KLzYXe5AzRufpbcGpmG8mmekrjUUCIZTYevZqyOrxUDdGKJ3pThrb
         VVjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785620759; x=1786225559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PXWSWEa3bGY7siVknL+eOHn30D1koM6RcV1JTHDyckU=;
        b=PNbYCwsXG98H/9tisg844d2iysPPyYZE4AUUmMvvdYjPJmJat9EoRHyrm5LiBweAlr
         a6ILd+otcvg6PtAIsjxx8dUAiD/TKOC3nAu73YjrYdT/Y1cc5gjlppLYQmpP5gidH8ge
         6a08u9/VhCpZLTfWHiOHOCye6ERTrtJdYq/hcZZmmyxdUhyRCjdlK4muf/k6Cl+IxLl0
         J0gkj/EAgDaImr9N4XMRzhKBntuE/mSCiIdYIPjqVI4Ac8mJmJmTPT+R9NIk0sdbVzw0
         VNFtLFOrIzJTxhL1JwNGMREIkQ6Xk7E3wrMim5qebE/a/E19nYce2yf8SnaTmsq2m0L9
         pRpA==
X-Gm-Message-State: AOJu0YxIVYZV+z8fngOoaB2WPD1EUpaQrPI9Yjvc6+g9pYks5ETM+Pa+
	N0l+W0YI4LEe5CEmqjXm+5mOUYyo6gIdV6kEhfFg7FuFkvp/6PGyBBTeITHmq8oA
X-Gm-Gg: AR+sD12eXr2Q5jI8qQX0Q5t7s0DDcsXq27YUo7MBLDgdrxVFR/JOpuq4WvPNFaPtzZr
	zTrowY51S6I5x/Gbg5WhVgpVuOX5amAdKjb1wxmCku/wrnxWZyEr/39GhpLzNOwc40sKNWynTUp
	K7XzY4+bkYObVXrL2X9cNdaQwV1QwiYcvh51ronu4A6wpg1f3cUiHgJq7g7FPcPPiRJOROcQucl
	kE8MZjwT0+9Wu8TJmMOVth6SgybXO3sgeNYOUXzfQy1x/Jhs1Rswzh5H9kJEebP+HP07ThCTR4l
	MMbICk5Mv4JqF+vAL/JJ+aeUoIQdJeEkrws1ZdAx6nX7svLMSvukCEE7LtPitKSNFsAXZtqWzFr
	Qft6Et2q11xsr4ecb2oAcTw3cXQrnXz/dP9/JC2DuRqqXETXm/AMLOfbfwaEQObTX5EdKexWEQU
	jrqkwh2Y1Y2SJtUyUuXXD4aOJv4nAX0HQMCrK/3MYs0KMDqgXGR5BhohEy/q01SI+sJnhPTRdVR
	gM39b2C+LpLUSxzmro2D/M7VLKzT843By9BuCwUijS8KYVsYx14ouE0+0t+8Q2D92QmNugUmdBZ
	6XuVqPv1KGEAsj/iUJr0iiIbEPvnWDdVYRCpR60ggn13/VyFRq2qfkp3hgOtJcH7XTaD51Dc61l
	ByA==
X-Received: by 2002:a05:6a21:7a4c:b0:3c3:834e:89bc with SMTP id adf61e73a8af0-3c92a864c8emr4493778637.50.1785620758724;
        Sat, 01 Aug 2026 14:45:58 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd4e5b0sm19105102eec.1.2026.08.01.14.45.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 14:45:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 30/31] mpv: propagate ffmpeg's commercial LICENSE_FLAGS
Date: Sat,  1 Aug 2026 14:45:25 -0700
Message-ID: <20260801214526.788343-30-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260801214526.788343-1-khem.raj@oss.qualcomm.com>
References: <20260801214526.788343-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 21:46:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128647

mpv has an unconditional DEPENDS on ffmpeg, which carries
LICENSE_FLAGS = "commercial". When "commercial" is not in
LICENSE_FLAGS_ACCEPTED (the default), ffmpeg is skipped, and parsing the
universe target - which, unlike world, ignores EXCLUDE_FROM_WORLD -
reports mpv as an unbuildable dependency chain:

  WARNING: Nothing PROVIDES 'ffmpeg' (but .../mpv_0.41.0.bb DEPENDS on
           or otherwise requires it)
  ffmpeg was skipped: Has a restricted license 'commercial' ...
  NOTE: Runtime target 'mpv' is unbuildable, removing...

Since mpv cannot be built or shipped without accepting ffmpeg's terms,
propagate the flag onto mpv itself. bitbake then skips mpv cleanly (in
both world and universe) with the same "restricted license" note as
ffmpeg, and no longer emits the confusing unbuildable-dependency
warnings. This mirrors how oe-core's gstreamer1.0-libav (which also
DEPENDS on ffmpeg) carries LICENSE_FLAGS = "commercial".

The explicit EXCLUDE_FROM_WORLD is now redundant - a recipe skipped for
its license flags is already excluded from world - so drop it.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-multimedia/mplayer/mpv_0.41.0.bb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-multimedia/mplayer/mpv_0.41.0.bb b/meta-oe/recipes-multimedia/mplayer/mpv_0.41.0.bb
index 02dbe64968..c8a0222ebf 100644
--- a/meta-oe/recipes-multimedia/mplayer/mpv_0.41.0.bb
+++ b/meta-oe/recipes-multimedia/mplayer/mpv_0.41.0.bb
@@ -16,6 +16,12 @@ DEPENDS = " \
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL;md5=570a9b3749dd0463a1778803b12a6dce"

+# mpv links against ffmpeg, which carries LICENSE_FLAGS = "commercial";
+# propagate the flag so mpv is cleanly skipped (in both world and universe)
+# unless "commercial" is in LICENSE_FLAGS_ACCEPTED, rather than surfacing as an
+# unbuildable "Nothing PROVIDES 'ffmpeg'" dependency.
+LICENSE_FLAGS = "commercial"
+
 SRCREV = "41f6a645068483470267271e1d09966ca3b9f413"
 SRC_URI = "git://github.com/mpv-player/mpv;name=mpv;branch=release/${@oe.utils.trim_version('${PV}', 2)};protocol=https;tag=v${PV}"

@@ -100,4 +106,3 @@ do_configure:append() {
 }

 FILES:${PN} += "${datadir}"
-EXCLUDE_FROM_WORLD = "${@bb.utils.contains("LICENSE_FLAGS_ACCEPTED", "commercial", "0", "1", d)}"

