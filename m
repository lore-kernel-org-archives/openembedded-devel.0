Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A735CC6B03
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 21:10:34 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5055.1791839427621668878
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Oct 2026 14:10:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Xw9UnaaN;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-398a4dcf289so1072138a91.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 14:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791839427; x=1792444227; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oB7tE+PbDjYkzFxeiwzFxCxaGcxBXKY4yXEBtK1GdQM=;
        b=Xw9UnaaN6MP1hGwF1RuITUhPWiW7m/h+Sa17ulwqaMJqPh/dQNpgcdO6vn27R/XEzT
         GXch4cwvEd5+mRK8MbKrVuHSJZBv+Nk1D1weigYa3/5V4ZRrLBRusyPpCydlakfsnPR2
         FF+mLCDrCV/S7DxiuwHfTRufFCamSh6VvGn0rNBGYRDnLNQgP64ke2vG8ItuLrxurQ/5
         r99sUnCNTpf/RIpEkGYKmhKE8vfD40x2XO11krrmzN5ZZ5zh1enHQTTJQfk84dgVrXrn
         3U6qfp6t/42kKqvTNPbKfPF6/LNl8gztesdGY9MmfA4oAH3x0ZoQV7Rz4EI1/MvD1F47
         CovQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791839427; x=1792444227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oB7tE+PbDjYkzFxeiwzFxCxaGcxBXKY4yXEBtK1GdQM=;
        b=MvXFiEsIPgW+RDx8jRky0e6vjIkNBrSvQBC3XbDV6ZSOXBZ4+3IrWjTr9fF6zPphwI
         OQohsbvEWKB6d4Rn34nGIUecIJF56AiT0i/DeR/AM9zmGjZxAyqf07r1qa4CTAcjZjQT
         KlYy7hi39crerjzahMOLefsyMmxuKiX+vYTZqYm7mY+s6TMnIXFHx0MnJWYqUUXoG8KB
         BRx3FO28dpw6rdZ4DTFnfjShVvg0outc3k/bjCaTU9frnrPhphmU+wgig5baApLKZR1y
         X7ItmR2rUlhLCoVni1DAag9KL8sKO1dZaLsZLZPxl8wzx0iDXp6KIbkmgtu5x9/K6T75
         4e2w==
X-Gm-Message-State: AFq9FYK8JDFUODR3VyOsLUS4+UpuECnXveR1x9T3pQ3vThXaBZZ8G+su
	mzUkVZH5tOTXSZIhqbvnym0TAbCsmqoixqaP7xwbCjeG4TS4URmb/2Hbrqnld6xP
X-Gm-Gg: AYBFou2REzwMRhAv8WlI7izSHiIpJGdAlO8GtagNZBrJFmkuL60EWkaw++z2v+oFIQH
	CyFSYVeX22EBHr5mEOkvoWNDRa3Z5WI/d2PpKKeWCMqa3nf0TvqOktdqbrYB1rV5bng2ujLC3Sa
	y7m4vgif20jIPrm/nG5qzQ12rR3XJEP5U7VQ8yN/+eDF6asW2I0ESYGhfuOmXLjifDdKq3/r0IJ
	7HahyBRkiBltsoGunj5lPV4ACtL1iU+7IqsgUUhmKdwZoFpWiILMoO0KE2ZPDLrEdy3Jeg3LvRS
	fEjjGVvLarIJY+n18OVpCWrtvIOUqxo9NWH7ImSXCaaUxRbZeneb6//iv/8YJgVw6bmFDHfrQGm
	nCO2PV2eOtUWs6ngKshBEfr6C0hckX5IFkzUXWUNlRK/kBAZth+mlQEYzBwqxtCbDfZcwNnSngg
	LQC2CM8dZQy7JtTDhimeHP7RLPk/bcFruedWrXRJY3y3Nor8D6hKdfYHelStIw0GoEa/u/1BEtk
	Vbq72Zs1vTNg3MJHskq340GM/O5IU9vd7L1c/Y=
X-Received: by 2002:a17:90a:d44d:b0:3a2:bb45:d37b with SMTP id 98e67ed59e1d1-3ab3aafb452mr8678178a91.25.1791839426994;
        Mon, 12 Oct 2026 14:10:26 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab32c0f59bsm10962728a91.0.2026.10.12.14.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 14:10:26 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Subject: [oe][meta-oe][blacksail][PATCH 4/43] eject: ignore CVE-2026-28065
Date: Tue, 13 Oct 2026 10:09:28 +1300
Message-ID: <20261012211009.3352822-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012211009.3352822-1-ankur.tyagi85@gmail.com>
References: <20261012211009.3352822-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 21:10:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130774

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-28065

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit e6d111c16938dab4a377826147bfc86b72bca8a1)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-support/eject/eject_2.1.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/eject/eject_2.1.5.bb b/meta-oe/recipes-support/eject/eject_2.1.5.bb
index aa0e86db12d..90630ff791b 100644
--- a/meta-oe/recipes-support/eject/eject_2.1.5.bb
+++ b/meta-oe/recipes-support/eject/eject_2.1.5.bb
@@ -34,3 +34,5 @@ ALTERNATIVE_PRIORITY[eject] = "100"
 
 ALTERNATIVE:${PN}-doc = "eject.1"
 ALTERNATIVE_LINK_NAME[eject.1] = "${mandir}/man1/eject.1"
+
+CVE_STATUS[CVE-2026-28065] = "cpe-incorrect: this CVE is for WordPress plugin or theme"

