Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OPrZH-0007R2-I8
	for openembedded-devel@lists.openembedded.org;
	Sat, 19 Jun 2010 08:30:16 +0200
Received: by fxm18 with SMTP id 18so978784fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Jun 2010 23:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=sxOtXS8Jo5Ij6wEl5E5ZP/tRQb/jHu+YFhZJpcgXZ6s=;
	b=hpCyka17JLpkN2ZBet0b/mt4zf4V/UDH/7acKw1P6/SmeA3qKvbQA0A1QyvxdNJqh/
	KvRO2gdTNT37sZMP5PnwIMIdYRBus/LgOu5M4c3tLva0rwKSYkKiZDlYCBiR8bcoYDw2
	kxV4A2QCEyLUy2xFsbrhdbzCz5SvYjNPTNITQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=bD3E5KLHvRWwaO2I/uJW6sIwbfxSv8AAqMwInieDesJSHTm8xi/JBZAEgQGBFjUaGB
	B+329K3dlBw4I3mPEl1y0pC+BSBVMqrpM6iPJs9wDkF4nu7pXh4BkzWrh0ZgXt8o9lqa
	fsBl3A5nXveXSLwLdN6r10l5OAhD20NlZc0VY=
Received: by 10.223.30.130 with SMTP id u2mr1697697fac.70.1276928743382;
	Fri, 18 Jun 2010 23:25:43 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id n6sm15892113fam.7.2010.06.18.23.25.42
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 18 Jun 2010 23:25:42 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 19 Jun 2010 08:25:39 +0200
Message-Id: <1276928739-16685-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] testlab: from opkg info grep only +- 7 lines around package with status installed of unpacked
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
X-List-Received-Date: Sat, 19 Jun 2010 06:30:16 -0000

* silly solution to filter multiple versions shown in installed-packages.txt where one is with Status not-installed and the right one with installed
* someone with better idea?

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 classes/testlab.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/classes/testlab.bbclass b/classes/testlab.bbclass
index bc6b6e5..b8ba9fe 100644
--- a/classes/testlab.bbclass
+++ b/classes/testlab.bbclass
@@ -36,7 +36,7 @@ if [ -e  ${IMAGE_ROOTFS}/etc/opkg ] && [ "${ONLINE_PACKAGE_MANAGEMENT}" = "full"
 	echo -e "digraph depends {\n    node [shape=plaintext]" > ${TESTLAB_DIR}/depends.dot
 
 	for pkg in $(opkg-cl ${IPKG_ARGS} list_installed | awk '{print $1}') ; do 
-		opkg-cl ${IPKG_ARGS} info $pkg | awk '/^Package/ {printf $2"_"} /^Version/ {printf $2"_"} /^Archi/ {print $2".ipk"}'  >> ${TESTLAB_DIR}/installed-packages.txt
+		opkg-cl ${IPKG_ARGS} info $pkg | grep -B 7 -A 7 "^Status.* \(\(installed\)\|\(unpacked\)\)" | awk '/^Package/ {printf $2"_"} /^Version/ {printf $2"_"} /^Archi/ {print $2".ipk"}'  >> ${TESTLAB_DIR}/installed-packages.txt
 
     		for depends in $(opkg-cl ${IPKG_ARGS} info $pkg | grep ^Depends) ; do 
         		echo "$pkg OPP $depends;" | grep -v "(" | grep -v ")" | grep -v "$pkg OPP Depends" | sed -e 's:,::g' -e 's:-:_:g' -e 's:\.:_:g' -e 's:+::g' |sed 's:OPP:->:g' >> ${TESTLAB_DIR}/depends.dot
-- 
1.7.1



