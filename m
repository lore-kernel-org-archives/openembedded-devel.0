Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SkJT7-0003bw-1P
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Jun 2012 20:29:29 +0200
Received: by dalh21 with SMTP id h21so3119404dal.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Jun 2012 11:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer;
	bh=+1X6nRwy+RZprZPmQFc+B1vR1NzEjF86kv5GoTKTKrI=;
	b=0rT7hmmjFbEmTdu+LhruHW1wdiQVLZlr9TvpEttHVvPY92XXJTVX//Qz6fYea2HYhT
	FepYrYrpOHv3cYdXImeFx74ujelFtW7PrSwgJU/3Td1VIPLrg640byZA5uDcjOu/95zS
	0lQvJOwO6udh5WfdcffQDjQ9hOtja79ny9qkrz1cVzCIAaZViTWJvqjpxEFidZqpe7cP
	HLnkgcj9W4P6x+3vOtD3Zr/Bi+PK9H5NoNFMSu+yXJVzuGyn48cTIDCIL92AcJb8r1ER
	8wUXHoRDYPRp4UUu0o6pkQIAbv8UGT0s6/XNQZAgjWSkpiTjxe0AlmSZs8ig14ZRIKG+
	5Mdw==
Received: by 10.68.226.99 with SMTP id rr3mr10404865pbc.48.1340907513023;
	Thu, 28 Jun 2012 11:18:33 -0700 (PDT)
Received: from localhost.localdomain (ip68-109-186-98.ph.ph.cox.net.
	[68.109.186.98])
	by mx.google.com with ESMTPS id ob9sm2795508pbb.28.2012.06.28.11.18.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 28 Jun 2012 11:18:32 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 28 Jun 2012 11:18:19 -0700
Message-Id: <1340907500-14243-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.7.11
Subject: [meta-oe] [PATCH 1/2] nano-tiny: add 'tiny' build of nano
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
X-List-Received-Date: Thu, 28 Jun 2012 18:29:29 -0000

Builds with --enable-tiny rather than --enable-all. Binary sizes:

non-tiny: 166320
tiny: 73592

Signed-off-by: Christopher Larson <kergoth@gmail.com>
---
 meta-oe/recipes-support/nano/nano-tiny_2.2.5.bb | 6 ++++++
 1 file changed, 6 insertions(+)
 create mode 100644 meta-oe/recipes-support/nano/nano-tiny_2.2.5.bb

diff --git a/meta-oe/recipes-support/nano/nano-tiny_2.2.5.bb b/meta-oe/recipes-support/nano/nano-tiny_2.2.5.bb
new file mode 100644
index 0000000..d0b2576
--- /dev/null
+++ b/meta-oe/recipes-support/nano/nano-tiny_2.2.5.bb
@@ -0,0 +1,6 @@
+require recipes-support/nano/nano_${PV}.bb
+
+DESCRIPTION_${PN} = "${DESCRIPTION} - tiny build"
+
+BPN = "nano"
+EXTRA_OECONF = "--enable-tiny"
-- 
1.7.11



