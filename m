Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 07F1B78EFB
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Aug 2018 13:21:24 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id c14-v6so1911709wmb.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Aug 2018 06:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=bpQQ00D0OR/DkWeA2gKSusO3IvneCXbad05x9nZpPng=;
	b=CoyBCd5PyVOH850yX57MnHG+rwDqE+HvhSuW78gw9XD1pvrcGhJnzDKC+oNYFW9LW4
	hWXKZIaVie/G7IlxAwVE9zpjIOg/vd35fjwfXLvlYjaoad3Sjf+W1/HA9tiQyacDky3W
	9J8A2dUhUN9D4G/itsWA8iA2hpKxliADXyKs2VV4nY6lnhXctpsEGtac4PKkI7GrHvEC
	3G385GG+x7wOmBB/zQ/p6BTLdPTR9ohwmfJ7Djg+i/xBibn56vqf9lEs0Vd92RRwKNEv
	Z4uBMeCvC0ecOhJAXTW+bAeKIZ9yS12CcQIfdHPi91JKtMxlvC3/XC1G50eoB90toOLS
	mO1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=bpQQ00D0OR/DkWeA2gKSusO3IvneCXbad05x9nZpPng=;
	b=aUtxjh02tW4akaiddC/IuNrqM+1PnKZCmnPrveUG7WCLVHU2Xwi2Zvj2+AX1M24fAR
	oksovQ/5oeWMyNzhQLQ6xI2MP2fBW+LrwG+bXV5WcJ8b/LR/8C/LTQfF1BCFWzBYDcOJ
	KwDCzzD9iJohqQGW9XlzTYfaxGLo3CrpFUV5AiXnjnMOYQvk3tJrsimTAbViyzNVv3Y4
	3qVxr7eNluaFN4ZlhH6o/cTKcliBRYJdfeK8t7wOKla++PqSa060bfSv+emq4UM+Ut+/
	gyWF0gZrYqyNTTAXt29HRcciUKpwQXQVD5MoX39A7+WqJCkOZVn9uDtCR7AQwPH9NUsK
	S3/Q==
X-Gm-Message-State: APzg51AG1m+Ty3buDCy/CbfhFn2awfdXLclpcWPqoaAZ7cz1Cp4w7Zbx
	sE0GaRHlzC7G4Du36SrXgaJ/yj4u
X-Google-Smtp-Source: ANB0VdbTcO2gl4AEel+xeZfPRc5ur5MbBNnGYoAKSC88KdS9klLThY0f0+VOgeWGCFFcvIpfkwDtwQ==
X-Received: by 2002:a1c:64c:: with SMTP id 73-v6mr1305036wmg.7.1535462485728; 
	Tue, 28 Aug 2018 06:21:25 -0700 (PDT)
Received: from beaker.muppets.liwing.de (b2b-78-94-80-58.unitymedia.biz.
	[78.94.80.58]) by smtp.gmail.com with ESMTPSA id
	d10-v6sm2350488wrv.70.2018.08.28.06.21.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 Aug 2018 06:21:24 -0700 (PDT)
Sender: Jens Rehsack <rehsack@gmail.com>
From: Jens Rehsack <sno@netbsd.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 Aug 2018 15:21:06 +0200
Message-Id: <20180828132106.22102-2-sno@netbsd.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180828132106.22102-1-sno@netbsd.org>
References: <20180828132106.22102-1-sno@netbsd.org>
Cc: Jens Rehsack <sno@netbsd.org>
Subject: [meta-perl][PATCH v2 2/2] libcrypt-openssl-rsa-perl: Update to 0.30
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
X-List-Received-Date: Tue, 28 Aug 2018 13:21:25 -0000

Update recipe for CPAN hosted Perl5 module Crypt::OpenSSL::RSA
from 0.28 to 0.30 to fix build issues when using openssl 1.1 and
to express our love to the Perl Programming Language.

LICENSE checksum updated because of:
    f0a2ed2 Purge trailing whitespace

Changes since 0.28: https://metacpan.org/changes/release/TODDR/Crypt-OpenSSL-RSA-0.30

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 ...rsa-perl_0.28.bb => libcrypt-openssl-rsa-perl_0.30.bb} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-perl/recipes-perl/libcrypt/{libcrypt-openssl-rsa-perl_0.28.bb => libcrypt-openssl-rsa-perl_0.30.bb} (64%)

diff --git a/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.28.bb b/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.30.bb
similarity index 64%
rename from meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.28.bb
rename to meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.30.bb
index f0c610f3a..0a2ad8aa4 100644
--- a/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.28.bb
+++ b/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.30.bb
@@ -1,14 +1,14 @@
 SUMMARY = "Crypt Openssl RSA cpan module"
 SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0+"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=385c55653886acac3821999a3ccd17b3"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a67ceecc5d9a91a5a0d003ba50c26346"
 
 SRC_URI = "http://www.cpan.org/modules/by-module/Crypt/Crypt-OpenSSL-RSA-${PV}.tar.gz "
 
-SRC_URI[md5sum] = "86217a5036fc63779c30420b5fd84129"
-SRC_URI[sha256sum] = "5357f977464bb3a8184cf2d3341851a10d5515b4b2b0dfb88bf78995c0ded7be"
+SRC_URI[md5sum] = "10bca2fc6d0ba1aa329f227424ae87d5"
+SRC_URI[sha256sum] = "23e13531397af102db4fd24bcf70137add7c85c23cca697c43aa71c2959a29ac"
 
-DEPENDS += "openssl"
+DEPENDS += "libcrypt-openssl-guess-native openssl"
 
 RDEPENDS_${PN}="libcrypt-openssl-random-perl"
 
-- 
2.17.1


