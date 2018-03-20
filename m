Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 5D0D2788AA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Mar 2018 13:23:50 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id w6so1558591qkb.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Mar 2018 06:23:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=mcyWSO6JUfxgZ702ujT6OjisQ5bB6FoaKpZRtBisbZo=;
	b=IIRNa9Q/eGn8K1YA7lYF8ilveYgj/aecJkvqr7Q05ElZdj5+uLoHw13gHdCiKqrUsa
	afdZePdtOP1yKAQYkl3GV1775hQ060w9ldU1aCnWD+W1Yc4txcjYctS1GleK4SNeZmQg
	F1oOzr9W1bwu2tZ6Y8bAe9YOwkcXR64apz2T+RW2PnPBKRyiBQl4S62vRcnL7ejJ3VBY
	EDPvF4CxY8qCAJlezuUl4tgtb2jjkiGs18utEu4q0pz9Q9ojH43v6dl0flZm1gwkZVVj
	NOfeb3UwW3Dl8mKMHHK2j03YLIhuEqfr0k5POiDsWtBUazmhIuL/47OMDSgcH0n3h4WG
	m1Cw==
X-Gm-Message-State: AElRT7H8E838OciDHGEJzUdwvoVOzlKgV3cZf8rWF0H0+MSDAGOfEabt
	nfG6qsPcHkyBATlYk2n017RSeLg3
X-Google-Smtp-Source: AG47ELtVBW/8+iFqWzPc3e2djKMKQxS2zJ6YdfbNsowBBcZ8EP2TWeqEVwvOhc8F050YyI8MNieAWw==
X-Received: by 10.55.188.196 with SMTP id m187mr12873336qkf.71.1521552231792; 
	Tue, 20 Mar 2018 06:23:51 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	o38sm1745571qko.82.2018.03.20.06.23.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 20 Mar 2018 06:23:51 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 20 Mar 2018 09:23:39 -0400
Message-Id: <1521552219-7650-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pyyaml: add datetime to the RDEPENDS
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
X-List-Received-Date: Tue, 20 Mar 2018 13:23:51 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pyyaml.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-pyyaml.inc b/meta-python/recipes-devtools/python/python-pyyaml.inc
index a3cf677..3fef0ca 100644
--- a/meta-python/recipes-devtools/python/python-pyyaml.inc
+++ b/meta-python/recipes-devtools/python/python-pyyaml.inc
@@ -11,4 +11,8 @@ inherit pypi
 SRC_URI[md5sum] = "4c129761b661d181ebf7ff4eb2d79950"
 SRC_URI[sha256sum] = "592766c6303207a20efc445587778322d7f73b161bd994f227adaa341ba212ab"
 
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-datetime \
+"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4


