Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 7C40679C92
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Aug 2019 17:03:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46G4Nc54zDz3P
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Aug 2019 19:03:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1566666225;
	bh=ILsdRPeLReWZEAJlsktqV5ZYCDDweVM7VJJfA4VDhRY=;
	h=From:To:Subject:Date:From;
	b=kG6cEvAQyRgBypIcHT6Vtqrh35P46gCis1Afd3Hba7OnRp99uE/Z4HRl5leSA5GwV
	4xxMLhuSj5wbdSybx88LuTEXegnRTXANR1a2G8fuvF8yjFgZxB8fkVXBTnWtBoEKjR
	Q0f2H1xHMWvKTCYdmuzF+DwEYGveDTCwXwG4ydXrrbs0kF/SOUf+9go8+R4kYkvXLA
	zyPhk6SWfEMAYj5zAulWpgSbk4nGO/EifPOhWLm351TR0JszLgRJoFN6WaXPNUiNEf
	F70tLTiUKN62aSM4p9b1asCq1wSvLuw+IYvLj946NecQBh88qVy0FE1Teg2cZWT06T
	66VLGWhQWnQ3IVkBg050K0+JcNh3j/xIYDVuRlIm4JRTWnNSS02paf8p+Q7LuOkoJ2
	Ov5KKP3LG24mAbmaZJTFJKoza4ffgbHTqrh6YThzf8uWhnMDoobzg9PCwaOinU8VSf
	VGH+3PsqEC3WJioMDB4jJ98z7GiQQSIJvVl2SFs/ixqzU6DCybqoHVwh/CAwG4CKlC
	waRsIDY9E/bmcjClDHEmqR+FvQ6qmmk3wv8yaUYLK2Qwi4XUhw0VTIl96MfLiAOsGp
	J1draO6VgajdTrsR11zhHgL/6XhMUsl3cQ52saUH6xHTSnoczUefVRyW6r57ChaQCS
	t4Oc/C4StELOIe9gQ0dPQUig=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 24 Aug 2019 20:03:44 +0300
Message-Id: <20190824170344.7320-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] libgit2: Upgrade 0.27.9 -> 0.28.3
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
X-List-Received-Date: Sat, 24 Aug 2019 17:03:46 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../libgit2/{libgit2_0.27.9.bb => libgit2_0.28.3.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/libgit2/{libgit2_0.27.9.bb => libgit2_0.28.3.bb} (91%)

diff --git a/meta-oe/recipes-support/libgit2/libgit2_0.27.9.bb b/meta-oe/recipes-support/libgit2/libgit2_0.28.3.bb
similarity index 91%
rename from meta-oe/recipes-support/libgit2/libgit2_0.27.9.bb
rename to meta-oe/recipes-support/libgit2/libgit2_0.28.3.bb
index 3ef7bee43..f02f5e738 100644
--- a/meta-oe/recipes-support/libgit2/libgit2_0.27.9.bb
+++ b/meta-oe/recipes-support/libgit2/libgit2_0.28.3.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3f2cd5d3cccd71d62066ba619614592b"
 
 DEPENDS = "curl openssl zlib libssh2 libgcrypt"
 
-SRC_URI = "git://github.com/libgit2/libgit2.git;branch=maint/v0.27"
-SRCREV = "3828d7afdd08b595584048e8e4dab6ddd4506ed1"
+SRC_URI = "git://github.com/libgit2/libgit2.git;branch=maint/v0.28"
+SRCREV = "7ce88e66a19e3b48340abcdd86aeaae1882e63cc"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


