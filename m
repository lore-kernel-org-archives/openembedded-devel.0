Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PWx2d-0001o0-Ca
	for openembedded-devel@lists.openembedded.org;
	Sun, 26 Dec 2010 21:19:15 +0100
Received: by eya28 with SMTP id 28so4129446eya.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 26 Dec 2010 12:17:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=8fUpwxtz71hw7zItXWd+jhkkBYpSaNzjy0YrEO+6o2g=;
	b=g2Vejs6y01FrGjZ2c+uOaAnZQirRDbgPdv/L/LYdAJaDrxUvKo9ugh5xpAwsK0IG+P
	16kCzBw5QAHrdPbFQBSb7acUNPLdDsOb+BV97iz/RS27EHHDG6y1ja69ZbzRUjiqMFen
	sawL+SITLzHR7BmxMa34caKyo3nQs3qRcrq6A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=L2sFQfiXf7dR+9MaaZoMjEW9toExestvFeZuCKntoKUNPtK4cp5Sgz+gfin93OvSyT
	6gIHA4fNPPPGZm3iMfOk1hDsgK3jc/0ODIhiJ3S4nwFruXDo71A3b19nwTPs1Pfxp4oB
	sHuwEbau/H8L5MYe4yN35F52DYJiaOojH5wIU=
Received: by 10.213.32.6 with SMTP id a6mr10782530ebd.31.1293394634713;
	Sun, 26 Dec 2010 12:17:14 -0800 (PST)
Received: from localhost.localdomain (j200125.upc-j.chello.nl [24.132.200.125])
	by mx.google.com with ESMTPS id q58sm8287418eeh.3.2010.12.26.12.17.12
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 26 Dec 2010 12:17:13 -0800 (PST)
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 26 Dec 2010 21:17:07 +0100
Message-Id: <1293394627-21453-1-git-send-email-fransmeulenbroeks@gmail.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH] cpan_build.bbclass; added cc and ld flags to the perl Build.PL invocation
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
X-List-Received-Date: Sun, 26 Dec 2010 20:19:15 -0000

Without these gcc would be used which resolves to /usr/bin/gcc
and one gets an intel exe.
This showed up with libparams-validate-perl and libdatetime-perl
The LDFLAGS are added to resolve the GNU_HASH QA error

Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
---
 classes/cpan_build.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/classes/cpan_build.bbclass b/classes/cpan_build.bbclass
index 37f430d..070e061 100644
--- a/classes/cpan_build.bbclass
+++ b/classes/cpan_build.bbclass
@@ -26,7 +26,7 @@ cpan_build_do_configure () {
 		# build for target
 		. ${STAGING_LIBDIR}/perl/config.sh
 		perl Build.PL --installdirs vendor \
-		        --config cc="${CC}" --config ld="${CCLD}" \
+		        --config cc="${CC} ${LDFLAGS}" --config ld="${CCLD} ${LDFLAGS}" \
 			--destdir ${D} \
 			--install_path lib="${datadir}/perl5" \
 			--install_path arch="${libdir}/perl5" \
-- 
1.7.1



