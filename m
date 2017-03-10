Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 058BD77660
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Mar 2017 10:59:25 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id g10so11134235wrg.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Mar 2017 02:59:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=LnMsFCso1W+0WAjqAoMVeCNIsv3ItZ+5vXsCzbGpTgY=;
	b=RheChcXR9h3xv7Q2TAmtQS4OOoqD+Cu1eewSGsvP8L8TYQaHSvFc7OChhz0ApP9omX
	KBYIdah11CfzKa0Syo0pjU1aOV8kiDVSwEpDZb6SGMyX/7AwPuJo2ML3U+Zb8Yji7s8R
	QLLnRoHSgikgr/WemDFobEvN5d8DMe6Qlp72K5mfcM0ZWP0Sw+ure/s4RLoG7BdhcVnn
	ABG7c9T0hdUcyr4OEI5N2zMsX+MMeMZAQ5Ful+hKwTe4ms4BCr2R2FuSuARQuCAzWL07
	FClCQQ6qyGbu2hpYEq67K4omCyrRtdkp4GcHLMCkyLJBU7WWcDKFZv7R8bPWR4++ifW4
	ThdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=LnMsFCso1W+0WAjqAoMVeCNIsv3ItZ+5vXsCzbGpTgY=;
	b=rTENOtTfxU4PA1GgiWpPCgg39XSdCGShXNjjpQEdPtuLaCfqT+KsBoFfzlU7+AeB48
	1WEpZ21p+YJupLpfIinvAF8P315ZXwJ6tQH5CBTdF+uZ8MrX5EPlsmAmV2lOkmTf23ec
	yQVe7ZsgEYBsGF7E/lzhW4edyjxqYyErOu9rej9wojiURro+zDE4kghSP711ROKJazXX
	RHPEYA1o9uXAyrlYvCDZJOObobD5+X2loMkN7z07BrXJlxvAht4OkJUoRnqqTsJY7nDH
	K1YLbMXphrYgKT57UfkIzWM/WKkxiglnhCi6hGqI7AwEAyeSZYUJA64ZYfVotZPqW1GK
	aYbQ==
X-Gm-Message-State: AMke39mdzfywvDTR/zuoIP4oo5coUSo3/YDCk2Dw9fLpRktggboRUqGV835QmH8cyiFoJA==
X-Received: by 10.223.177.218 with SMTP id r26mr17019853wra.194.1489143566645; 
	Fri, 10 Mar 2017 02:59:26 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	x1sm12225433wrd.63.2017.03.10.02.59.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 Mar 2017 02:59:25 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 Mar 2017 11:59:26 +0100
Message-Id: <20170310105926.12921-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.12.0
Subject: [PATCH][meta-oe] vim: add native BBCLASSEXTEND
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
X-List-Received-Date: Fri, 10 Mar 2017 10:59:26 -0000

* some recipes might use xxd
* with stricter host binaries available in PATH:
  http://lists.openembedded.org/pipermail/openembedded-core/2017-March/133886.html
  we cannot use xxd from host and it's not so common to add it into
  HOSTTOOL_NONFATAL
* there is also smaller solution for xxd -i (which is what I need):
  https://github.com/gregkh/xxdi
  but after creating xxdi-native recipe for this I've discovered that
  perl on my host as well as perlnative doesn't provide File::Slurp
  used by this, so adding BBCLASSEXTEND here is easier solution

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/vim/vim_8.0.0022.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/vim/vim_8.0.0022.bb b/meta-oe/recipes-support/vim/vim_8.0.0022.bb
index 1ccc52cd9..920391adb 100644
--- a/meta-oe/recipes-support/vim/vim_8.0.0022.bb
+++ b/meta-oe/recipes-support/vim/vim_8.0.0022.bb
@@ -99,12 +99,14 @@ FILES_${PN}-common = " \
     ${datadir}/icons \
 "
 
-RDEPENDS_${PN} = "ncurses-terminfo-base"
+RDEPENDS_${BPN} = "ncurses-terminfo-base"
 # Recommend that runtime data is installed along with vim
-RRECOMMENDS_${PN} = "${PN}-syntax ${PN}-help ${PN}-tutor ${PN}-vimrc ${PN}-common"
+RRECOMMENDS_${BPN} = "${PN}-syntax ${PN}-help ${PN}-tutor ${PN}-vimrc ${PN}-common"
 
 ALTERNATIVE_${PN} = "vi vim"
 ALTERNATIVE_TARGET = "${bindir}/${BPN}.${BPN}"
 ALTERNATIVE_LINK_NAME[vi] = "${base_bindir}/vi"
 ALTERNATIVE_LINK_NAME[vim] = "${bindir}/vim"
 ALTERNATIVE_PRIORITY = "100"
+
+BBCLASSEXTEND = "native"
-- 
2.12.0


