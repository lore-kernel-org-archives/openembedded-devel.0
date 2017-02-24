Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 36F17730C9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Feb 2017 19:42:12 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id x35so3803346qtc.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Feb 2017 11:42:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=eyxR2Dr0v53Ngi1EqrE3srwaHgnLIBcRdC86gHQZ3AQ=;
	b=ZjLY/VZkPGiqAf7SEw+vc/AH/qwqENh3QKkhBUNXwt+Mehr7I0pKeWN+Ul7Tv0QjqH
	3CzqFIn+LhLn033StjAQTqYKl2sCFRK0IBN6In5vFaQlHftFowwwjUYdNKexDf+rqknZ
	np7tsZSocE1bh5g5TTf4hKPS//udbhJz80pfc7PnTwiOTyugIhpGuAh7mM9+S8/vWiuq
	3mtm28kYyBaHT1SGSmbRfArih5JPgvo9PLOKdPbE4aBlHP9ttZhwvpUO95VyktRe60+E
	X2NVYJ2DmUkPv20aPNLQCz6r1LDm5jLXsnUL8nyXLJEG7xuCe39QeGrMwm38L8fryVOH
	/bsw==
X-Gm-Message-State: AMke39noHH+oV2kaZkhdsodZ8D8+gI0eVACEZ8i9feRHmeAzVZPCq+z20qiKAnGk3AYs5Q==
X-Received: by 10.237.60.3 with SMTP id t3mr5019954qte.86.1487965333982;
	Fri, 24 Feb 2017 11:42:13 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	o16sm5367266qkl.67.2017.02.24.11.42.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 24 Feb 2017 11:42:13 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 Feb 2017 14:41:41 -0500
Message-Id: <1487965301-24934-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-ruby][PATCH] bundler: resolve build issues with RSS
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
X-List-Received-Date: Fri, 24 Feb 2017 19:42:14 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-ruby/recipes-devtools/ruby/bundler_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ruby/recipes-devtools/ruby/bundler_git.bb b/meta-ruby/recipes-devtools/ruby/bundler_git.bb
index f2d8f3c..2b5cef4 100644
--- a/meta-ruby/recipes-devtools/ruby/bundler_git.bb
+++ b/meta-ruby/recipes-devtools/ruby/bundler_git.bb
@@ -20,6 +20,8 @@ PV = "1.9.4"
 
 S = "${WORKDIR}/git"
 
+DEPENDS += "zlib"
+
 SRC_URI = " \
     git://github.com/bundler/bundler.git;branch=${BRANCH} \
     "
@@ -29,5 +31,3 @@ inherit ruby
 RDEPENDS_${PN} = "git"
 
 BBCLASSEXTEND = "native"
-
-PNBLACKLIST[bundler] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130640/"
-- 
2.7.4


