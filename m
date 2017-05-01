Return-Path: <dev@codyps.com>
Received: from mail-it0-f68.google.com (mail-it0-f68.google.com
	[209.85.214.68])
	by mail.openembedded.org (Postfix) with ESMTP id 7E2AE71DD7
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 May 2017 19:30:40 +0000 (UTC)
Received: by mail-it0-f68.google.com with SMTP id 131so3538830itz.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 May 2017 12:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codyps.com; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=bvmrvSbIvreWL1BdoHOvAcTycG8nODekDiIYuxdSg6g=;
	b=bXZMxZhddGwA/KR14k1wSdaPjKHOHlpU1rSPxSbqa0+OEEymr1FQW8JnKQ9klsHYMO
	St8FAbBjdMgbVQCwqTWGjwkDN8bQ4pZDkd5FDlppvBeQDmD6pFeHbzldfU2quYac4WLu
	padd0ctvU1+aNPhlkdGpQwlqqeqXSKf8Zphyc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=bvmrvSbIvreWL1BdoHOvAcTycG8nODekDiIYuxdSg6g=;
	b=cMDUXW9WUEEJS/8C0SRh8+zxLO5Tnb6tcDO8tsi00hUaQWm0+FTaXhpLfObI4KuXlp
	ay7xdbCUp3eF3nytu3MorLIEyP6076pf4zcoY8b4VCLHHnWgtBswd2spSe/uoi2ZVkT9
	OdVYWCQBiM7zk/O3AVHUbIA1kjUen4HRtSPvPcd/eRBQ4vY/DvCkFXFihlNJL1+cl6uw
	r2Z5/AJAdYFLV4hrYkjf+c6n1XTBasoMx+h5IfZ/o507GnMiKvE2IKlPo8XLKB+IvhR0
	VlEI7HyLbFgxOXUnYWePB+q1LAKxKgLLn4mLCACSQ8oQ2sn6VcM4IqdzM01cowzx1lj/
	6ABg==
X-Gm-Message-State: AN3rC/7cqgHmyNuwN+JltzpIMfGnoxYTT4AAAmDVZ60b8A93Qk2gBT6Y
	6T99CJywH0c4NDqZ
X-Received: by 10.36.2.205 with SMTP id 196mr129375itu.63.1493667042121;
	Mon, 01 May 2017 12:30:42 -0700 (PDT)
Received: from localhost (static-72-74-84-52.bstnma.fios.verizon.net.
	[72.74.84.52]) by smtp.gmail.com with ESMTPSA id
	y97sm4199734ita.17.2017.05.01.12.30.41
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 01 May 2017 12:30:41 -0700 (PDT)
From: Cody P Schafer <dev@codyps.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  1 May 2017 15:30:32 -0400
Message-Id: <20170501193032.18269-1-dev@codyps.com>
X-Mailer: git-send-email 2.12.2
Subject: [meta-oe][PATCH] ninja: extend to nativesdk
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
X-List-Received-Date: Mon, 01 May 2017 19:30:41 -0000

Signed-off-by: Cody P Schafer <dev@codyps.com>
---
 meta-oe/recipes-devtools/ninja/ninja_1.7.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/ninja/ninja_1.7.2.bb b/meta-oe/recipes-devtools/ninja/ninja_1.7.2.bb
index 37ef00b87..932e3a6ed 100644
--- a/meta-oe/recipes-devtools/ninja/ninja_1.7.2.bb
+++ b/meta-oe/recipes-devtools/ninja/ninja_1.7.2.bb
@@ -27,4 +27,4 @@ do_install() {
     install -m 0755 ${S}/ninja ${D}${bindir}/
 }
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.12.2


