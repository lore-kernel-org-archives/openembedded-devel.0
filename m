Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E5CCC44501
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 08:12:38 +0000 (UTC)
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14749.1782634353606641965
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 01:12:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=n53o2XwQ;
 spf=pass (domain: gmail.com, ip: 74.125.82.176, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-30ec1ddd510so322706eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 01:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634353; x=1783239153; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aTJAII3qsozVAv6cm0nW34aXYTurcURal0fw40KLjTA=;
        b=n53o2XwQYMfuNVx/bLY3DqD+d7dOXsMJQsZWoVnN18CyLGfqJQ2DVQoEl4+G8TORuS
         jOyCZOsxr62nQd/baf0vtVzgwSRDU7jnc08AMG5fD1zwq8zK5Sx0KABk3La89x1pFczD
         to/leqvWaDxdg5/2eua1clpBiTPm9Fyqe5e8K4NaTjWcJOZZ02KDDD0MykcQd7MJTUJl
         u7UPlWpAMGYh3RD5YHNRhpQhRUyXV0gKWlKwKoUFXBPBM4Uo0NSYrByUWMQ23qusTvP+
         dm42kHowjq0w5N65WB2BnYQhwYYb1kaf5IfMwct1n4dj6miZsVFjC5zhNBikaaED4v/U
         Gqyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634353; x=1783239153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aTJAII3qsozVAv6cm0nW34aXYTurcURal0fw40KLjTA=;
        b=N6LNeic2pxkI3INlen6zuQHmUvXHXFW/0V/YHUKqOBc/eZBpFekAsWgEi3YNI8iXHf
         vhbeUTvG43UcpamYaOMqLa3nIDA5GhGKwcUIPAU99oyr/2Jk/jRwS1m01jtxILx5eOCh
         KXYtvwQUyh5VxUcPDZCeaEDyIjxM5s9Rpwv7x3X+UWFtn0qf35ufuCI+75oWIiLdw6A0
         O8/u6dSX/YYlsdzoHoATZXMtJpohDIlUWhCGmwo61IlsNXgYcGSgCBQeqHuXPrN+p19g
         px6XAxyP2RJ9+BNED4pyB4cV3ol+qv48bcIIil/hPFpuYoNQJIiU2iA0S3oSKHdvoHYH
         bHMg==
X-Gm-Message-State: AOJu0Yw18Jan2G23vltNiZVlffLPVVVmrEA4QU5ZnCzBchr4oy9UwDh5
	1brmTrY7bg1aFAKKtCwIvWJya+15xtKn1pPbxI2YyvxTFXLqZXkP3OdEHA23GvbqM9pzQg==
X-Gm-Gg: AfdE7cnBHU37JOtVrSp3Q5jkCFOgaHl0e7BTDkbg8upHXH1sMKlHRHQSry6qXn9ArmX
	JXl6FgA3lf76oSFBRFa8D+FUc7/GQ2bpnO4NA44f0ymsd8lQzWn3VOFStfv7Yps+P7QfVxefoap
	ouUOsY0PEMypTixyJtxJIEykUfDfEM+wCs8fNvCOKS28g55ikrBDn5agPCzZfB06/KisQ7UBeZg
	HHqGmYcwkvu7DsnR0N1v/SbKchcFaOuLCyVrg0TMDIyxXFUbt98tKXazm5Jg6fOLPk/bFaZwKnN
	YN/ejrGYYB+AEDqabYG5WZnB3FwaO5kEq9Xl+bJdjAfVvcPlhqNE3treE8MPgRAQ03osXog1utY
	cmqnF4D6SlimEqjlN2Qqs9MiUyd4dltU7+YOVMtuY1JSnFSaxtR7EPmr6EDhW/p+SM2QOudM1yH
	j4j1PXEq4ti07CO0AI75lfcpkC60JAijv5C4/LdJzX93djxcRGoRvCVOJ8CfiLB47naQ7TIEO9u
	a+gssEIYbII7WvR2Whv7mn4GGioPltO7CkNFuY1aaazReD6Pd/DDrF71Cs9vbRQhGUsn3aZBM3X
	AYMxhqaxe+SMPTYIF3y6wa8SfHGbwQ==
X-Received: by 2002:a05:7300:7b89:b0:30b:d748:e7f9 with SMTP id 5a478bee46e88-30c84bb521fmr12620496eec.10.1782634352904;
        Sun, 28 Jun 2026 01:12:32 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ea81b39easm6306040eec.31.2026.06.28.01.12.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:12:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 074/128] ttf-vlgothic: upgrade 20200720 -> 20220612
Date: Sun, 28 Jun 2026 01:10:25 -0700
Message-ID: <20260628081122.178348-74-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
References: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 08:12:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127884

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../{ttf-vlgothic_20200720.bb => ttf-vlgothic_20220612.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/ttf-fonts/{ttf-vlgothic_20200720.bb => ttf-vlgothic_20220612.bb} (90%)

diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-vlgothic_20200720.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-vlgothic_20220612.bb
similarity index 90%
rename from meta-oe/recipes-graphics/ttf-fonts/ttf-vlgothic_20200720.bb
rename to meta-oe/recipes-graphics/ttf-fonts/ttf-vlgothic_20220612.bb
index e34770d520..dbc9e67406 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-vlgothic_20200720.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-vlgothic_20220612.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.en;md5=cc06b20e7a20bdf6c989624405378303 \
 
 SRC_URI = "https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/fonts-vlgothic/${PV}-1ubuntu1/fonts-vlgothic_${PV}.orig.tar.xz"
 
-SRC_URI[sha256sum] = "297a3813675fbea12c5813b55a78091c9a5946515ecbf9fde8b8102e01c579f4"
+SRC_URI[sha256sum] = "c201dd3fa73492a2551a339fe235608d3be771237fd5868a526f1b3eb3164d93"
 
 S = "${UNPACKDIR}/VLGothic"
 

