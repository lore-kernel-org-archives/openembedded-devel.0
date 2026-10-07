Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A190CA6007
	for <webhook@archiver.kernel.org>; Wed,  7 Oct 2026 11:08:33 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6899.1791371308731083171
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Oct 2026 04:08:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=NQmf3sW7;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cc4dbda1e5dso894506a12.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Oct 2026 04:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791371308; x=1791976108; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xf6eIFsAi9/Ym3FZwnVi/ICvThzMqWeazQKm1rp1/HM=;
        b=NQmf3sW7UhBOf5yU/8nGazzPjJA+H+yDgTwlboPNfkmemAhj1VvZopY16xs6lD4Bsn
         k9t1MUwS/y7kmbtOBbtKgGNBl5T47LC8B+fqxLtWrV9+UHhg3DnT8IVCVjd7ZQSuyNuQ
         HfBR+N6IZw2RFsxJAVe+HALJ98ezxP8plxsM2aLcKbEDcYIGmjigOjuyq6MoCnWSWPAy
         FiDJreF6oaHKoetB0/IjSFJ7D4iSh/SRsymfEdx4TbaGWRy5/ZDBipn/u2reAlptrCtP
         aZ0mzM99yF/K2QKEeZ3NvKGyfYQAsExey5kbFXbpLxARMNjeQl6aIQSuPtjoxQPKLWS0
         NdxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791371308; x=1791976108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xf6eIFsAi9/Ym3FZwnVi/ICvThzMqWeazQKm1rp1/HM=;
        b=qFZE3mkgrBoTzVHOpplFKPqYNOcHA86geBAv0XuR5AyabDPfHL8dnHR5NyVrrOAXoG
         tWaNU0y0ZOvh8NsFs+/VyPq+Eht9peu6uxRqlAwh8E2MQ+Uxpp1x+SHnIGdLqGNeJNe/
         vPQ2YJx92sJlgIbTXzz97p2j2eZpGrbrJlXQobQobK40CZhSFXgx45vp/SRfPSIBioBZ
         5beMU5gRI38J1iNAvCyjnAbysogPEe0QngOCH+m0GbsPOLA6MB418XcgA3esLLQ4rgb/
         6o+PmAtnGDf6nfjQgVD8P8xcfGZaisIz6rws0DpFGdbkkqKDfpeqN/6Q6HYwOK4ZJXbk
         e5FA==
X-Gm-Message-State: AFq9FYJxqr8wSo7VcvD+cgGiDeGYa4uOcJ7OGfuLeqGfkWWTOq/Ym8vH
	fdOElBRgWrS8iCGlCNCe5i56lZWpPK9zMx5vhonR+9dApYSQHaJR7A0/CPnVCbne
X-Gm-Gg: AYBFou2YuB2Au4GIq/MOm9JxplAh6WEzDEpgqREF9sLkgNVSIJ4ZUQE1xZwpQFAc08T
	OYe3qQM4c/CNG6pd2wrAHF0kG/B3QhUeFJ4AldIkvBJr2K97WpsppAJCMuULjsoOH84FpbZNdhS
	o4O+7L8wq1jKme0tasv8NKan5Ai06dBW9VCrMx6rJmf+sYXrHHnAn1VWJyztjtbFtUyZnp1G2I2
	rRKjMazbGcemfQhypvUynXkWFYDG76bCBHtUePMJNi+Nl1rgnKaZaqc0J9dwA6RvoBog3VUiFyr
	xD+07ILWor+mnM+q7G4HfNPJzN5a/vOB9UA/HUwQrslmShU6k+8rz1ukh5+XrxJ0IiYsKTwzprM
	sXrApU55CoNzKN0kgXorsDjS79c1TsMAIsuVRtMe5ghy8GFgE7Dq8bJtiPWJt1dztwDmvhFM47u
	rRnqedspjFfMNJUmokwekElbtAqiTkiUZ3glfCWwKOtwswooD4B7GjOkKAW9FgLJneF6yNN3dTc
	3jnkxDSW0aia/i27pp199w=
X-Received: by 2002:a17:90b:2584:b0:39e:3713:c2e4 with SMTP id 98e67ed59e1d1-3a8a192b868mr1481206a91.14.1791371308068;
        Wed, 07 Oct 2026 04:08:28 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8533aba95sm10862177a91.2.2026.10.07.04.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 04:08:27 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][PATCH 14/15] pgpool2: upgrade 4.7.2 -> 4.7.3
Date: Thu,  8 Oct 2026 00:07:39 +1300
Message-ID: <20261007110740.3179543-14-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261007110740.3179543-1-ankur.tyagi85@gmail.com>
References: <20261007110740.3179543-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Oct 2026 11:08:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130656

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://www.pgpool.net/docs/latest/en/html/release-4-7-3.html

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../pgpool2/{pgpool2_4.7.2.bb => pgpool2_4.7.3.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/pgpool2/{pgpool2_4.7.2.bb => pgpool2_4.7.3.bb} (95%)

diff --git a/meta-networking/recipes-support/pgpool2/pgpool2_4.7.2.bb b/meta-networking/recipes-support/pgpool2/pgpool2_4.7.3.bb
similarity index 95%
rename from meta-networking/recipes-support/pgpool2/pgpool2_4.7.2.bb
rename to meta-networking/recipes-support/pgpool2/pgpool2_4.7.3.bb
index c6b6a22c64..2648cc1f9f 100644
--- a/meta-networking/recipes-support/pgpool2/pgpool2_4.7.2.bb
+++ b/meta-networking/recipes-support/pgpool2/pgpool2_4.7.3.bb
@@ -16,7 +16,7 @@ SRC_URI = "https://www.pgpool.net/source/pgpool-II-${PV}.tar.gz \
 	   file://pgpool.sysconfig \
 	   file://pgpool.service \
            "
-SRC_URI[sha256sum] = "e72b9d0ff3620f7da7e33a58dda44b77919d056752dc9bd86b2985c4988d1938"
+SRC_URI[sha256sum] = "4bf9df3e13feb8e64bee486b4ea54c9076296c2d9406165b0b68d32086fce250"
 
 S = "${UNPACKDIR}/pgpool-II-${PV}"
 

