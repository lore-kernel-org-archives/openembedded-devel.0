Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11807.1795762978683431650
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 23:02:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=qtNOaegC;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3ae691283ecso3692487a91.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 23:02:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795762978; x=1796367778; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XyBWLDARNHfFWV9C9871W1athVlVtJgIcrrSPLbz6A4=;
        b=qtNOaegCRu00nNHWuKqQkviapQBd8oK85ZD3duo0P86rkGbQsGAnUmPw3kqLi3b2WF
         jPLQtSn30x8+bECEwowDr3/ZXlP5y11iz3DBjqcuDZd/i+G/CzaIhPw6dIz1RGT/YIjU
         Bo502BCxgdA4Dv+aebjTx+LhitIEWu6jxR9QtTUo+cIfh/YcKU4HvAemrTqpwKsMHTfl
         izDGcoRMAD8xDbYWtjLcyuqksVvZ7aqa0VaCCFXK00ZVJIKKT/Wh3eQVjXYkIbwUAWSu
         XDLiPgREFQ+n6fazsXqJlY8PN8Cfpc1N5zFV4ZK4gnZc98IuFuMbn+jf7ERWZx99cypY
         EFIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795762978; x=1796367778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XyBWLDARNHfFWV9C9871W1athVlVtJgIcrrSPLbz6A4=;
        b=xrK+vL88xZvhmfq22F/Y+ChYdvCpRGJwHe+I71F2yA+wFkUkXhQoiXFDM5xJJl6aPs
         1ipC+xnA5JLkFlb/fHwJLRz7CmbV7yLZHyPKUiYhjZIxMD5hbJHcEqLkUTG9RzX1s55B
         4XE4b+FMN4FUQVXHrhdCuAvnwkVnTv4NmJP7FdDcSk2jAL+s8KpGFMSbCO3KccrgdHVO
         m2L+IJKBegoynBa4jcPZpuz16iY5Eb7SyHcEnP0iL6PWkXBlywMSkHIsuycEEIcGJE6R
         tNAwhmizFVQ4ZpCPYVIst0rBAudpFamoSEJdYM6b0bmCIwDgqmyJt3YeN8fFzP3reV9t
         GMvw==
X-Gm-Message-State: APuU4Z/OXoW387lPwETS0b9VYvMBK0OIIMbVa3U8oX1VoxiM18W4krmL
	//ALQ7LcIidt2QAuoBn5cDVQt+sWTW+3qSKyquvmNQUZVWIDL/BAJTEbRylLJg==
X-Gm-Gg: AZFdTZcBKFnvlVc8dmXDIMpwYkYopf4sncqbFwUK9m4mHCZtM1H571mpdTEizYAavDQ
	ivcWVFxjpBh585pWYK1MJY4w6hJzR4mJzqokVr+PccWYH82FiYirLvVu7/4sr+lUFfo9WWuMTVR
	0ni5qmAPYEs0ffSKgzgveWGp/MCVJLAvR86bgZy5+qdI6gjBYfRWCtIOQ/7qhJgTDpe42VCUhWy
	MY4SM8NYXgoZl7AeBR4dO5jDOOWCgIST2JmhZaEEouY61eHOLJS0SSge9eZJoRVBKx7VkkAJ5I1
	0/T4/VZ6AC440FbnlSYkRCGKy8AYU8dSXx4Tgfgw69bPDhxtfvo9TocXL8WI+P8hhCbvKaWi5nc
	Pxs96+CfQcDRM7wGeVQvNjIMR90gqD1Z+c2+Sc1CE7RPb3rA9Oe/jN7MfVmeKbhyaPiRSGyBUIF
	D7Ht8bdu26TEZv+9Tvhr30PcDJx7+NFFvdyutQNr6QzHaSmyrqTD1raG3It8hKKksaJ6DNQjQav
	hF5o3FTNbeabQwQCa7TMsERoSlFOalkPLQyum4Qq4PwoVHoc4JiO9WM1m5CyqPuiVcifry6xmnN
	3q8SuUqVuZWQ04Je5/4oYFm3I1kDCJNV4i/rq8wxK5gmnsM5siq50AZtCQ+BKFrMUwuxKZGWO9K
	MFQnh0aqKCWWIPMfkkEZFnXaJxkHrLPjYpGdN608X9Q+fqHuz3AQb99yWkLi6y8I47luWvH7QrY
	8gcCSCdOx1TTTkasvc0528Tb+lmgZ6nv7mqW4NYMHC6lR6vbGtmYPeClJjb/VD3Mas1IaPGW/7I
	rPo2Hw3HZPBwRG4gTXIY8nHvA4xoZ4lWW2ac0c14L58bgd+61dA+2NydlmtocEgngAmN4eUc1y1
	JWBDTw==
X-Received: by 2002:a17:90b:5289:b0:3b0:9bfa:72ac with SMTP id 98e67ed59e1d1-3b41c908147mr16073752a91.21.1795762977939;
        Thu, 26 Nov 2026 23:02:57 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41adcfe23sm36464914a91.15.2026.11.26.23.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:02:57 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-filesystems][PATCH 2/5] libisofs: Fix upstream version check
Date: Thu, 26 Nov 2026 23:02:49 -0800
Message-ID: <20261127070252.2364951-3-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127070252.2364951-1-khem.raj@oss.qualcomm.com>
References: <20261127070252.2364951-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 07:03:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133351
Content-Type: text/plain; charset="utf-8"

The default regex stopped at the patchlevel suffix of
libisofs-1.5.8.pl02.tar.gz and reported "02". Match the full version
including an optional .plNN suffix.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-filesystems/burnia/libisofs_1.5.8.pl02.bb           | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-filesystems/recipes-filesystems/burnia/libisofs_1.5.8.pl02.bb b/meta-filesystems/recipes-filesystems/burnia/libisofs_1.5.8.pl02.bb
index 28ae0766e8..b0cd91fe52 100644
--- a/meta-filesystems/recipes-filesystems/burnia/libisofs_1.5.8.pl02.bb
+++ b/meta-filesystems/recipes-filesystems/burnia/libisofs_1.5.8.pl02.bb
@@ -8,6 +8,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=9ac2e7cff1ddaf48b6eab6028f23ef88 \
 SRC_URI = "http://files.libburnia-project.org/releases/${BP}.tar.gz"
 SRC_URI[sha256sum] = "10bd584d8f00d8091e814902b9f0a3e209f16e938f510fc23ba05f3fa469db5a"
 
+UPSTREAM_CHECK_REGEX = "libisofs-(?P<pver>\d+(\.\d+)+(\.pl\d+)?)\.tar\.gz"
+
 # The patchlevel (.pl02) tarball unpacks into a directory without the
 # patchlevel suffix.
 S = "${UNPACKDIR}/libisofs-${@d.getVar('PV').split('.pl')[0]}"
