Return-Path: <jpuhlman@mvista.com>
Received: from mail-pf0-f170.google.com (mail-pf0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id CE99E75208
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Jun 2018 23:06:26 +0000 (UTC)
Received: by mail-pf0-f170.google.com with SMTP id a22-v6so7321842pfo.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Jun 2018 16:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=6QuGDV8FP1XkOJNZaLM5dKttyMHdnD+kqWIjs278VQo=;
	b=LMzA8lZC9NudwvJ3XUrZCs2AUcTK2y0rL1jCfU0WJjWt5EbBmbH1XE7uq3dHKFpDci
	4YMCkoMD9G3br0Tlyx+netvWpU9u9kXuNQsrfSCVy4C96UF7gnOE4acvKzMPEjddhZD1
	KiUnpW0t9bjBUt2unPQMludJihKxcpxvolYlheuXvpe7ijkkSLpRe9FzgDiyrUvN75Wr
	Gog3nq2d6HL/Sh8lMlLX/87T1s1neFmbCi1kfnCkGMfQmmyNi1ScsJqV5oHhh1re25mk
	V9oMCZURL7kKcQvG09rSK4Boxi0dXafQRPmAnMFTbBw3VbC8p7ygjMwnxL32p9zccgQl
	5gwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=6QuGDV8FP1XkOJNZaLM5dKttyMHdnD+kqWIjs278VQo=;
	b=nPJ4B40qjBzOSCRZLs3zdAYE7JfnRcXJ6tciEr2PNywKXq3he59TAyvKcwXa8sNuxX
	YPiNm9cSzihw/3tI3hnOa4SGLJS6jcpp0I7qRxItoIbCR1w9eHbBDBNQx4wcaQvL3H6O
	Frw04t3RU//p2dyOpSnD35g9/SrOw0SSpv/NS+JUyeCTW4Gz1yod+rlqKfHcgLOfAYT/
	rjqMo7Mq8ppoXeBfkFhxJBcAMtvL2wZjSG7WFpXJRO5DybWz5n4UkXosIV6O80IYXpOH
	rDyxQqnp05XXxMpVvKTZQyAezL8HwLtaD57qY3UgixZ9CLHX+McMNqK/IU0RUHMlYnvr
	TlbQ==
X-Gm-Message-State: APt69E3fvatKZrxfKZSgTSsEkKMKnDSxTq55XU5JjFkLGy3IqtXpMMSO
	12U73EoscjCOhqOnLwJHXjiihREW
X-Google-Smtp-Source: ADUXVKL/MvPVVYvBJdTynPnbuZGkAZNYPbCq2HrJgPUPCtD/Va9fJ07yBhPur0Ri68sS4CS7xeVVrg==
X-Received: by 2002:a65:4bcd:: with SMTP id
	p13-v6mr6866817pgr.114.1528499187708; 
	Fri, 08 Jun 2018 16:06:27 -0700 (PDT)
Received: from workhorse.mvista.com
	(99-14-97-149.lightspeed.frokca.sbcglobal.net. [99.14.97.149])
	by smtp.gmail.com with ESMTPSA id
	m22-v6sm20724095pfg.61.2018.06.08.16.06.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Jun 2018 16:06:26 -0700 (PDT)
From: Jeremy Puhlman <jpuhlman@mvista.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 Jun 2018 16:06:19 -0700
Message-Id: <1528499179-8589-1-git-send-email-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.6.2
Subject: [meta-networking][PATCH] spice: Update to git hash to pick up gcc8 fixes.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 08 Jun 2018 23:06:26 -0000

Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
---
 meta-networking/recipes-support/spice/spice_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/spice/spice_git.bb b/meta-networking/recipes-support/spice/spice_git.bb
index 35482ca..508bb36 100644
--- a/meta-networking/recipes-support/spice/spice_git.bb
+++ b/meta-networking/recipes-support/spice/spice_git.bb
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 PV = "0.14.0+git${SRCPV}"
 
-SRCREV_spice = "2a3d5624382ba49c4eb906e69697b92f79d06cf4"
+SRCREV_spice = "33d9c38554b41dab1390914ef79594b57218b06b"
 SRCREV_spice-common = "4c2d0e977272c5540634d24f485dd64c424f6748"
 
 SRCREV_FORMAT = "spice_spice-common"
-- 
2.6.2


