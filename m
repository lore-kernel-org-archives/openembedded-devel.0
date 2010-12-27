Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PXGdA-0007eY-1h
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Dec 2010 18:13:08 +0100
Received: by ewy28 with SMTP id 28so1099537ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Dec 2010 09:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=eyHvczBxHxhSiEJZVhQQ++vPfre7qG6nIeh7luQ3MdE=;
	b=Rxaa4n1snIktDJpxjcwlkCeNKNS2HWriBIySqPrjpAALixYXquzwlv1+eC7rQZcwVw
	+yGsD7VVc8zBFa7uNQX2Md+p1VoamJ63zWSl2Ptpr2QCLWWe5PQBOT4u0doGAtBzkyOV
	yslBMdVcrPOaMJgsJwjHXQgrDXqF4pjkYSn3U=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=TjrdQceVIudk1aApJJmpVk9yDST/C7ooEnVfjCAh8EeauHVCpWybqTSj3XjZS+8Mdt
	p2awwTz5N5TWzReiNf2YXglsP8fGqqjyOUPONmgyIsGP/VePLpc6Ftu+PVb6z/NjzQgY
	3Iwq0+ObzvguSdprGMRNSb/qKgFSftrcyqEtY=
Received: by 10.213.104.136 with SMTP id p8mr9910932ebo.59.1293469874869;
	Mon, 27 Dec 2010 09:11:14 -0800 (PST)
Received: from localhost.localdomain (j200125.upc-j.chello.nl [24.132.200.125])
	by mx.google.com with ESMTPS id x54sm9008191eeh.23.2010.12.27.09.11.12
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 27 Dec 2010 09:11:13 -0800 (PST)
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Dec 2010 18:11:07 +0100
Message-Id: <1293469867-18737-1-git-send-email-fransmeulenbroeks@gmail.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH v3] cpan_build.bbclass; added cc and ld flags to the perl Build.PL invocation
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
X-List-Received-Date: Mon, 27 Dec 2010 17:13:08 -0000

Without these gcc would be used which resolves to /usr/bin/gcc
and one gets an intel exe.
This showed up with libparams-validate-perl and libdatetime-perl
The LDFLAGS are added to resolve the GNU_HASH QA error

Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
---
 classes/cpan_build.bbclass     |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/classes/cpan_build.bbclass b/classes/cpan_build.bbclass
index d1bbc4f..070e061 100644
--- a/classes/cpan_build.bbclass
+++ b/classes/cpan_build.bbclass
@@ -26,6 +26,7 @@ cpan_build_do_configure () {
 		# build for target
 		. ${STAGING_LIBDIR}/perl/config.sh
 		perl Build.PL --installdirs vendor \
+		        --config cc="${CC} ${LDFLAGS}" --config ld="${CCLD} ${LDFLAGS}" \
 			--destdir ${D} \
 			--install_path lib="${datadir}/perl5" \
 			--install_path arch="${libdir}/perl5" \


