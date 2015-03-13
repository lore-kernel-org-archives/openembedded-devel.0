Return-Path: <joe@deserted.net>
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id 7BDD66013D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Mar 2015 17:55:38 +0000 (UTC)
Received: by igbhn18 with SMTP id hn18so2040286igb.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Mar 2015 10:55:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:subject:date:message-id;
	bh=WG2tTa4I3MP1C6IzGOOJiWCvLlWZro4T+w0LwwWoxs4=;
	b=JXUTkZAvonXnV1lHSAmatVCkj51IyS/Uy2QqYOk+WRQoWtqe1FBZc2LqM32tD+vcvp
	eFFGM1nFE8roUweVdA8BbEYP/4F8PTP5qmzMomj5BNFfrlxZ73PefsTOJfTxWcydQ/3D
	511+RFpKFOPCosE0nhaf4Zse9/umbDal8CJ46Wj2VFUYH1ERZ6zXGJ7jBgAzdX8+mLvM
	3bFA1ehVCII61PwSbelr7ylfoYbX09/g0NHHWQAX7wCwOZRvIaImy+swWKLWXu8/RFZH
	P5zrZ1C2p75a97tKG/85jsvHnO3NgKEIgW9P0f+jb7BwjkPxtMThCHuY3FdFvMlp6i7Y
	LS+A==
X-Gm-Message-State: ALoCoQkExvYKI9zVUa4w56ocbzzz6UluoQx58uglGSYrd9sXBZu739hj1T7v378faQOadNO/t/97
X-Received: by 10.107.135.75 with SMTP id j72mr48160206iod.0.1426269339681;
	Fri, 13 Mar 2015 10:55:39 -0700 (PDT)
Received: from mir.deserted.net (24-246-4-250.cable.teksavvy.com.
	[24.246.4.250])
	by mx.google.com with ESMTPSA id j8sm1680596ioi.13.2015.03.13.10.55.38
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 13 Mar 2015 10:55:38 -0700 (PDT)
Sender: Joe MacDonald <joe@deserted.net>
From: Joe MacDonald <joe_macdonald@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Mar 2015 13:56:48 -0400
Message-Id: <1426269408-2363-1-git-send-email-joe_macdonald@mentor.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-networking][PATCH] openflow: add libcrypto to static openflow library
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Mar 2015 17:55:39 -0000

An update in OpenSSL removed the -lcrypto from libssl's pkg-config
options.  The old behaviour always linked it with -lssl, so revert to that
for now.

Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
---

There's a number of ways to do this, I think this is the least-invasive
solution.  That said, the upstream openflow reference implementation has seen no
activity in about three years so I'm thinking very soon I'll remove the _git
recipe entirely in favour of a more up-to-date (with respect to the
specifications) version, so I also didn't want invest too much into fixing the
build issues (this should actually be solved by ensuring the library buildng gcc
commands get -static passed to them, but that turns out to be kind of a mess)
with this recipe.

-J.

 meta-networking/recipes-protocols/openflow/openflow.inc | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta-networking/recipes-protocols/openflow/openflow.inc b/meta-networking/recipes-protocols/openflow/openflow.inc
index 1a226f8..7a1e478 100644
--- a/meta-networking/recipes-protocols/openflow/openflow.inc
+++ b/meta-networking/recipes-protocols/openflow/openflow.inc
@@ -15,14 +15,17 @@ SRC_URI = "git://gitosis.stanford.edu/openflow.git;protocol=git"
 
 DEPENDS = "virtual/libc"
 
-EXTRA_OECONF += "KARCH=${TARGET_ARCH}"
-
 PACKAGECONFIG ??= "openssl"
 PACKAGECONFIG[openssl] = "--enable-ssl,--disable-ssl, openssl, libssl"
 
+EXTRA_OECONF += " \
+                 KARCH=${TARGET_ARCH} \
+                 ${@base_contains('PACKAGECONFIG', 'openssl', 'SSL_LIBS="-lssl -lcrypto"', '', d)} \
+                "
+
 S = "${WORKDIR}/git"
 
-inherit autotools-brokensep
+#inherit autotools-brokensep
 
 do_configure() {
     ./boot.sh
-- 
1.9.1


