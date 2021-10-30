Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25997C4332F
	for <webhook@archiver.kernel.org>; Sat, 30 Oct 2021 11:16:11 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.17857.1635592570112647075
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Oct 2021 04:16:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=edoR63qF;
 spf=pass (domain: gmail.com, ip: 209.85.214.171,
 mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id s24so8577137plp.0
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Oct 2021 04:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=y4WkiF7UFnpTMOZUsB30tebS4FvDfMPWaY4fzjSNFAg=;
        b=edoR63qFAvSf1TDUSs67pKEtX7H8M/XElEhYtSo2Xggr9F3/xVrdH+Lu5frdKcAH4p
         MNBXZXfTaSdzkYPe8aDO+ruNtmQgq/VPzbaPak4WA30EHVYMysZMt4Ff9YWGvHslKqXo
         XxRxuNGRPyXCek2w658ZXg5cLUykVGUoTW77w2mGfkvUrdsv3SUTxrOd1SJ72Z1g/Yg5
         Lt20esUuoJqmFr4JvpAf3v6Ubm7/B0+ghDNI6euSn79Wfj+pzpA8mdQGUnoz1x70nL3r
         W26GfmrEFb5ua+4SXT34uWtJ57AQWrkpq9dbSLO18YJ52ZyLsJP4YA4MDv9hnDPcjGr2
         hJig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=y4WkiF7UFnpTMOZUsB30tebS4FvDfMPWaY4fzjSNFAg=;
        b=sQJygkM1KzF3xiRncMWrh2kl5zQaKmIMTR5lsobl9lKQdCdgW0Iloxx1q0szn0MkAm
         5gjbk5du29IwqEXDC+uwJ1ExWX1qdLf7g2oNOoM8+RnIqUkwZMGyGpQ7pZgMFbGTIyXT
         hctFDjqqSI2Sm8yKsiu+DA63nXX04AjUl6PjieBe/B3yMC3bHkdENxgefCtLWSoFV1BR
         k5HuUizE1oKMa4wWgLig2i1ql78pyK2hP/xTl1psulMspKxeTjqDpt7hW+9DX2Umdldf
         KLP3ci6GI4k0PBz2EYmW5jde/fygOJQ5uSed4w4TDH0c9R0CMp/BtUjzTK9WCvoDOt0E
         xkLg==
X-Gm-Message-State: AOAM532+mV2SztOBaP75QrW/w1HjNflYhs5Wgwp/ZCi5Dtcx27yHen/G
	MnNYGirg5OVgXmhIVDMqJkx43+O8c9M=
X-Google-Smtp-Source: 
 ABdhPJzd6CIkOOE0uPloMvEglPyf3+SyILaPoe7MNZ6PXn/Bb94nxptEEqgoIMomLM+im4I9uAbQUg==
X-Received: by 2002:a17:90b:4b89:: with SMTP id
 lr9mr17435186pjb.11.1635592569498;
        Sat, 30 Oct 2021 04:16:09 -0700 (PDT)
Received: from keaua.hsd1.ca.comcast.net
 ([2601:202:4180:a5c0:7535:c5d2:16af:d4db])
        by smtp.gmail.com with ESMTPSA id
 w12sm13880162pjq.2.2021.10.30.04.16.08
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Oct 2021 04:16:09 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [honister 12/14] byacc: switch to official HTTPS mirror
Date: Sat, 30 Oct 2021 04:15:49 -0700
Message-Id: 
 <9033794dee34619b67c95f4a0af63faa16a52f16.1635592420.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1635592420.git.akuster808@gmail.com>
References: <cover.1635592420.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 Oct 2021 11:16:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93669

From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>

FTP does not always work in corporate networks. Switch to the HTTPS URL
mentioned on the tool's homepage. The same URL is also used by FreeBSD [1].

[1] https://cgit.freebsd.org/ports/tree/devel/byacc/Makefile?id=b128c1dbf3e8fbada5f753631041bf93ac51bf4d

Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit d79ca2ebc434f7c89892b2dbb79c038d74e5ce2b)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-extended/byacc/byacc.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/byacc/byacc.inc b/meta-oe/recipes-extended/byacc/byacc.inc
index cffa7f5dcd..a3d9bfdb70 100644
--- a/meta-oe/recipes-extended/byacc/byacc.inc
+++ b/meta-oe/recipes-extended/byacc/byacc.inc
@@ -6,7 +6,7 @@ programming language."
 SECTION = "devel"
 LICENSE = "PD"
 
-SRC_URI = "ftp://ftp.invisible-island.net/byacc/byacc-${PV}.tgz \
+SRC_URI = "https://invisible-mirror.net/archives/byacc/byacc-${PV}.tgz \
            file://byacc-open.patch \
            file://0001-byacc-do-not-reorder-CC-and-CFLAGS.patch"
 
-- 
2.25.1


