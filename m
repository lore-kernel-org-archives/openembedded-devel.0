Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
	[209.85.128.53])
	by mail.openembedded.org (Postfix) with ESMTP id 0D6BE6BA10
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Feb 2019 20:35:36 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id z5so5422843wmf.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Feb 2019 12:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=mjkTdmipHe/iPzY6WyifW1ZAQTLwiYhzM55PStLDq5Q=;
	b=bwctM302zYrizSqJahE78s0joetGsATxKJVVD2KfXsKVOs4q9otkwA6ta+p2aCrkQL
	RxMgQz6qaj49Me5SC/nKvWt5USkKJsy5aECTfXxSwZf6FqGPKsf20Z2B6zWni3QYbcuV
	EVUTeBO58BRdvO2+ofTGas2oYzQklrZAJ1StPesj3+0xS1Z125BEy2PYtFT/dbAMmmVK
	1B/Ac+HP7SJmCJO1KH/4c/pPpDaE6RLI0tC8zVm7nH5jrVK1LD6kRya/pUv5JFKWl0FZ
	uM2CVp+nL2pEp+tSX8L1xQq/j0xjJTWVCG2HzhkFHLPeeICKxaEaCoGGI/KBllblI9my
	NWPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=mjkTdmipHe/iPzY6WyifW1ZAQTLwiYhzM55PStLDq5Q=;
	b=pTsjGCV7LS6zcH4uYasg2wk6e+7emdYleyeV9+8iFlqvJBLid7NsIKpASbmCjSOpGE
	G24mjdjzbP7uk8Z6+qtssUQ1cX4FrFpsBBjp76CAWe3CdeknCxl7ILDKNpK2gERwK+Bu
	4VkZYe9r3Mfj2Ic3PDmrPGZn7MwENDka0lH8Bs7dFlRZEi//etitbUvDglsLULY/psP5
	nfQECZQe4uwPaVrmzegdlzRWWjUvOXquLqkcCG64aI4K271urJ6Xyds9FbQEKMBwnzb7
	PXnHS3WPQr9ePzr9D/LemF/2G/EVFrnY53ZTWt0IVTzNajy1SLisobLk6LmseL4roq1m
	++Cw==
X-Gm-Message-State: AHQUAua27yXQgm53zec6GiiG18IRil+8YwCXi5vRCC1HIda++KjGvFmy
	4bP8/JBHVqBZXoZHkhA9PQH4+YIS
X-Google-Smtp-Source: AHgI3IZcX8Iq6bn4mCU1Nbui9PKgUjuHzzOl9hl4EMTbIQcqILVcGUO87RfweLA80aQQsl0tBm2cbg==
X-Received: by 2002:adf:9f48:: with SMTP id f8mr10029060wrg.151.1549658137353; 
	Fri, 08 Feb 2019 12:35:37 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F02D8847C49AEC1D0D8828A.dip0.t-ipconnect.de.
	[2003:f0:7f02:d884:7c49:aec1:d0d8:828a])
	by smtp.gmail.com with ESMTPSA id
	c18sm5026978wre.32.2019.02.08.12.35.36
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 08 Feb 2019 12:35:36 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 Feb 2019 21:35:27 +0100
Message-Id: <20190208203528.28261-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190208203528.28261-1-schnitzeltony@gmail.com>
References: <20190208203528.28261-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] faenza-icon-theme: Fix multilib fetch
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
X-List-Received-Date: Fri, 08 Feb 2019 20:35:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

| ERROR: lib32-faenza-icon-theme-1.3-r0 do_fetch: Fetcher failure for URL: 'http://faenza-icon-theme.googlecode.com/files/lib32-faenza-icon-theme_1.3.zip'. Unable to fetch URL from any source.
| ERROR: lib32-faenza-icon-theme-1.3-r0 do_fetch: Function failed: base_do_fetch

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-gnome/faenza-icon-theme/faenza-icon-theme_1.3.bb    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/faenza-icon-theme/faenza-icon-theme_1.3.bb b/meta-gnome/recipes-gnome/faenza-icon-theme/faenza-icon-theme_1.3.bb
index a39b1a0ca..561b094a9 100644
--- a/meta-gnome/recipes-gnome/faenza-icon-theme/faenza-icon-theme_1.3.bb
+++ b/meta-gnome/recipes-gnome/faenza-icon-theme/faenza-icon-theme_1.3.bb
@@ -8,7 +8,7 @@ inherit allarch gtk-icon-cache
 
 S = "${WORKDIR}"
 
-SRC_URI = "http://faenza-icon-theme.googlecode.com/files/${PN}_${PV}.zip"
+SRC_URI = "http://faenza-icon-theme.googlecode.com/files/${BPN}_${PV}.zip"
 SRC_URI[md5sum] = "e9bd6106d13017ce06d24b586259ae9c"
 SRC_URI[sha256sum] = "d4486fda0413f8a81a87e0dd2329f50f2a8a7cb4147b48cf147f0160add8174a"
 
-- 
2.20.1


