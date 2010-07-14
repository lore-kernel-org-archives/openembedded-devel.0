Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1OZ88A-0003qT-Dx
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Jul 2010 22:00:34 +0200
Received: by bwz10 with SMTP id 10so209837bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Jul 2010 13:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:from:to:cc:subject
	:date:message-id:x-mailer;
	bh=cDYe60lcr5O2ZNEiM68a8J2ms5qBjwfUPQRg5Ov/Br8=;
	b=xwtnjc46OF+sOtKndkT0FdGsg1CXXUP2d+GDzSifPSWd6E1nubEV6t8SMQ4UB6cc+C
	jyCEcd90N7H9rvTpEE7owPphiytPs9UzU9iZwbQRFDF2FbDualsdYG5fQG35kfoKxfwa
	smrx0Bj/BHrldB6GoCFHK40ImFbsu/9hwTX9M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=icTNFvoGGuRDAdMX42gixF9tzGqr3sTB+Sk3VYaBnb1VhoJA/uEZyk4Aav7jqHk1Ue
	o4VXnQbxwHwgV4AIyEjqFCPd/skhPoLhLyid9Rak7lwx4qOK9M4zXafyPhpqppX8T1eH
	vR0xxSUUpXwpZl0n2jPpNvP4WKKX0Cy4MX6l4=
Received: by 10.204.179.19 with SMTP id bo19mr13446714bkb.209.1279137632710;
	Wed, 14 Jul 2010 13:00:32 -0700 (PDT)
Received: from s42.loc (85-127-92-50.dynamic.xdsl-line.inode.at [85.127.92.50])
	by mx.google.com with ESMTPS id a9sm1543119bky.23.2010.07.14.13.00.31
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 14 Jul 2010 13:00:32 -0700 (PDT)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1OZ87z-0008VX-SR; Wed, 14 Jul 2010 22:00:23 +0200
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 14 Jul 2010 22:00:21 +0200
Message-Id: <1279137621-32592-1-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] minimal: commentary typo fix
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
X-List-Received-Date: Wed, 14 Jul 2010 20:00:34 -0000

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 conf/distro/minimal-uclibc.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/distro/minimal-uclibc.conf b/conf/distro/minimal-uclibc.conf
index 44805cf..3347811 100644
--- a/conf/distro/minimal-uclibc.conf
+++ b/conf/distro/minimal-uclibc.conf
@@ -42,5 +42,5 @@ DISTRO_FEATURES += "eabi"
 DISTRO_FEATURES += "pam"
 # large file support is needed for libsndfile
 DISTRO_FEATURES += "largefile"
-# glib-2.0 nneds ipv6 and there is no knob to control it
+# glib-2.0 needs ipv6 and there is no knob to control it
 DISTRO_FEATURES += "ipv4 ipv6"
-- 
1.7.1



