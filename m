Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f178.google.com (mail-wr0-f178.google.com
	[209.85.128.178])
	by mail.openembedded.org (Postfix) with ESMTP id 0259575046
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Jun 2018 12:03:37 +0000 (UTC)
Received: by mail-wr0-f178.google.com with SMTP id f16-v6so11160720wrm.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Jun 2018 05:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=wiAE4EFlzBYUlsf1m4CirfIVNcU8F/nZtqvEPFF2YFs=;
	b=irrWqPA+6Wd3NMSAZaaXuC9yPvS5iFCiNVcTVtQaGhBxoXLyhdJiXzsHBKV44aVhTF
	pR6b9L3ic5q7XIKmctEYQfggAB9vDlLneB/2wSeQ3SUfIcozo7AT5o5WYIFUkN1YS5j6
	n5tgv2xKVmZAUESNtzH4yFGoFSKO7RszQSuGF6gCk7vCf9DeSGvxbMMY5dvMeeyCxMuH
	arWylPJVcvf+Kzw8fANf2bowTbdlvy6bFZreDd7sPGH5k3hZjlBdFOWzGfevwOAOXJWw
	BFT6iPCF6zUcxdhCALq0LYDwQXmCl72B06X9kDV7qI7J7CUElT+KBJGcybc/XRmv+3ft
	BBlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=wiAE4EFlzBYUlsf1m4CirfIVNcU8F/nZtqvEPFF2YFs=;
	b=jZAD9YRHs3i4RPqdySAC/ZqN63L1BoV22P9ZyGn4zWXpmNWa6y6a9GwcwkDlzgnZT/
	Phc1oj55OJZ6alXe3xyQPNXouyVEPUR7ma2CxEcpAHyhbDar5/5U2XmC1zix+QFWc6xe
	hU9AtVJsV6m+hm4+l0z5itrcE7jV9/GV1EQRYMOs0DkB3FdBjyTwdlwQcktPsnZuNOsT
	j2NiRljTeodcIMuxiAPvciHAUvO6ZN/rIJtxRNy7az2qHYWXxyYmx5vyDwSQ0U/Ug73o
	EOW9GBo7iF6qL1AldULZr5lGCsuxN9WwOq4MFBtR3+tXEWFI28Dfm5KAw3JTnLNl++0F
	LGVQ==
X-Gm-Message-State: APt69E1dPSQkfeo/HcFRy/DMuoPlCzJq9Qs5rRt4ajzeruegBaUzdmLb
	0f3BZfPqGgxXtJjUfvU+QvfSXw==
X-Google-Smtp-Source: AAOMgpc1ih2YanZhfZCq/qa5puT9eIZ1e7cxQYR9HQDJ4Rf0fBClL35ao4KP3mLBRveo2PbmV33TSw==
X-Received: by 2002:adf:8e49:: with SMTP id
	n67-v6mr14487981wrb.131.1530360218450; 
	Sat, 30 Jun 2018 05:03:38 -0700 (PDT)
Received: from mueller-a-nb-linux.speedport.ip
	(p200300F07BD2A250E47512CF7CAE17AC.dip0.t-ipconnect.de.
	[2003:f0:7bd2:a250:e475:12cf:7cae:17ac])
	by smtp.gmail.com with ESMTPSA id
	p12-v6sm2096602wrn.31.2018.06.30.05.03.37
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 30 Jun 2018 05:03:37 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 30 Jun 2018 14:03:15 +0200
Message-Id: <20180630120315.29414-12-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.4
In-Reply-To: <20180630120315.29414-1-schnitzeltony@gmail.com>
References: <20180630120315.29414-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 11/11] ristretto: upgrade 0.8.2 -> 0.8.3
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
X-List-Received-Date: Sat, 30 Jun 2018 12:03:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-apps/ristretto/{ristretto_0.8.2.bb => ristretto_0.8.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-apps/ristretto/{ristretto_0.8.2.bb => ristretto_0.8.3.bb} (76%)

diff --git a/meta-xfce/recipes-apps/ristretto/ristretto_0.8.2.bb b/meta-xfce/recipes-apps/ristretto/ristretto_0.8.3.bb
similarity index 76%
rename from meta-xfce/recipes-apps/ristretto/ristretto_0.8.2.bb
rename to meta-xfce/recipes-apps/ristretto/ristretto_0.8.3.bb
index 06dd1021d..d9b9b2cb0 100644
--- a/meta-xfce/recipes-apps/ristretto/ristretto_0.8.2.bb
+++ b/meta-xfce/recipes-apps/ristretto/ristretto_0.8.3.bb
@@ -9,8 +9,8 @@ inherit xfce-app
 
 RRECOMMENDS_${PN} += "tumbler"
 
-SRC_URI[md5sum] = "a8d8bb6b8fa7f868cfa3ae778630946e"
-SRC_URI[sha256sum] = "f8f3b77ca6fc77ddf8cff1bb52e5c5802c462663f72f324393b3a0360f6901b8"
+SRC_URI[md5sum] = "5866b4e11c32a38f72bc737239102544"
+SRC_URI[sha256sum] = "8c9c11760816dfd9ed57fb8b9df86c6a98a2604ab551be3133996a1c32ca2665"
 SRC_URI += "file://0001-Fix-build-after-update-of-xfconf.patch"
 
 FILES_${PN} += "${datadir}/appdata"
-- 
2.14.4


