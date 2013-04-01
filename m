Received: from mail-qa0-f52.google.com ([209.85.216.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip.balister@gmail.com>) id 1UMfy0-0003wM-Vx
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Apr 2013 16:44:13 +0200
Received: by mail-qa0-f52.google.com with SMTP id bs12so869473qab.18
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Apr 2013 07:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=lqU/TihMZsoAFZEMd7cEpL50LQLgQAtA4WMl118tpLc=;
	b=RKPkzBV4P/LaP7aOXRgp6DshJiL9T9S/toPqwsMGm3xBFoVjB51EzY2v54BhkhEZIc
	pLAY1qWga8o4qGj03Cs3pfUqHKFFjxVfOJ2Zu1QczYwy8u5gKgnALMAZ65QDpyYWioim
	9NDMbVYFxE7B9aTmhcRfhhpEUboj6yxF7KUhP4DglvMK8L+30Q08paSieP5eddIQxiZO
	0kyhjEg21Zzjl47PfjzTOZ09hxL1CSrPuDnoQ2nr7q4vq2xO/2FpSb+GyRQ9L/xv6r9a
	rU3w1CYp99oATfBNYJbDNfmAOyU/+tPsYorA3Y7WHrbFMNki2a3w6eniQYgGkQhYfkaQ
	7F4A==
X-Received: by 10.224.178.4 with SMTP id bk4mr12582999qab.70.1364826424214;
	Mon, 01 Apr 2013 07:27:04 -0700 (PDT)
Received: from localhost.localdomain
	(pool-96-240-165-43.ronkva.east.verizon.net. [96.240.165.43])
	by mx.google.com with ESMTPS id h5sm22110057qai.9.2013.04.01.07.27.03
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 01 Apr 2013 07:27:03 -0700 (PDT)
Sender: Philip Balister <philip.balister@gmail.com>
From: philip@balister.org
To: openembedded-devel@lists.openembedded.org
Date: Mon,  1 Apr 2013 10:26:59 -0400
Message-Id: <51599937.4541e00a.7e3d.0dd6@mx.google.com>
X-Mailer: git-send-email 1.7.11.7
Subject: [meta-oe][PATCH 1/2] orc : Add support for sdk generation.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 01 Apr 2013 14:44:13 -0000

From: Philip Balister <philip@balister.org>

We need to run orcc on the host.

Signed-off-by: Philip Balister <philip@balister.org>
---
 meta-oe/recipes-devtools/orc/orc.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/orc/orc.inc b/meta-oe/recipes-devtools/orc/orc.inc
index 7a957f3..3a9b2f4 100644
--- a/meta-oe/recipes-devtools/orc/orc.inc
+++ b/meta-oe/recipes-devtools/orc/orc.inc
@@ -3,13 +3,13 @@ HOMEPAGE = "http://code.entropywave.com/projects/orc/"
 LICENSE = "orc"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1400bd9d09e8af56b9ec982b3d85797e"
 
-INC_PR = "r0"
+INC_PR = "r1"
 
 SRC_URI = "http://code.entropywave.com/download/orc/orc-${PV}.tar.gz;name=orc"
 
 inherit autotools pkgconfig
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
 
 PACKAGES =+ "orc-examples"
 FILES_orc-examples = "${libdir}/orc/*"
-- 
1.7.11.7



