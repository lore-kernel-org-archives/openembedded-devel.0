Received: from [74.125.46.152] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1LhVTa-0001Gu-VN
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Mar 2009 21:56:31 +0100
Received: by yw-out-1718.google.com with SMTP id 4so460974ywq.42
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Mar 2009 13:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=xFBP4Q/tlvG5dgPThnlmtM7pgejJy8LnNVS3mlJHPIk=;
	b=ncFpRLQaFBUrlW1MpM39uoaUfitW2ojnJulCaU1fRqHFKtTbX7K2MmUiGe5hiymQie
	SXTZ94bMWaQGhvETEUKT+WwrKEudwz0QTJBr88tDTsKecdTbRDPjG6zS1Vboe9zj0BBb
	ALssmzQewExR/TAeqmTKzZcnNR4t8gmFnu5Uw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=Fvapkf66fYS0J6sz8NJTlr/OAG2ynl0nZ6O7UdLK3Dzl1eYO8uk5qXodM+xvsfxcr2
	B7MJ3+qQ07LbCNDnJP9vbLc16FZp6obR4AdBg32kuZRtncRiNVwaKKx6wpE/RUMiDhKP
	5zI91Cqwtg0hiD4H8bt045/Y0mh8rnUQTyYVM=
Received: by 10.142.231.7 with SMTP id d7mr3864982wfh.285.1236804981833;
	Wed, 11 Mar 2009 13:56:21 -0700 (PDT)
Received: from localhost.localdomain
	(adsl-71-146-1-99.dsl.pltn13.sbcglobal.net [71.146.1.99])
	by mx.google.com with ESMTPS id 28sm428077wfd.5.2009.03.11.13.56.21
	(version=SSLv3 cipher=RC4-MD5); Wed, 11 Mar 2009 13:56:21 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 11 Mar 2009 13:56:19 -0700
Message-Id: <1236804979-5428-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.6.0.4
Subject: [PATCH] autotools.bbclass: Add new pattern to match -L<libdir> in dependency_libs
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
X-List-Received-Date: Wed, 11 Mar 2009 20:56:32 -0000

	* Current pattern match does one think wrong consider
	something like this
	dependency_libs=' -L/home/kraj/work/oe/build/eglibc/omap5912osk/work/x86_64-linux/ncurses-native-5.4-r17/ncurses-5.4/lib'
	this pattern when matched gets converted to
	dependency_libs=' -L/home/kraj/work/oe/build/eglibc/omap5912osk/staging/x86_64-linux/usr/lib/lib'
	which is wrong. If we had a '/' appended to original path then it would work.
	This patch lets it straight.
---
 classes/autotools.bbclass |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/classes/autotools.bbclass b/classes/autotools.bbclass
index fd8687e..20f371a 100644
--- a/classes/autotools.bbclass
+++ b/classes/autotools.bbclass
@@ -212,7 +212,8 @@ autotools_stage_all() {
 		for i in $las
 		do
 			sed -e 's/^installed=yes$/installed=no/' \
-			    -e '/^dependency_libs=/s,${WORKDIR}[[:alnum:]/\._+-]*/\([[:alnum:]\._+-]*\),${STAGING_LIBDIR}/\1,g' \
+			    -e '/^dependency_libs=/s,${WORKDIR}[[:alnum:]/\._+-]*/\([[:alnum:]\._+-]*.la\),${STAGING_LIBDIR}/\1,g' \
+			    -e '/^dependency_libs=/s,${WORKDIR}[[:alnum:]/\._+-]*/\([[:alnum:]\._+-]*\),${STAGING_LIBDIR},g' \
 			    -e "/^dependency_libs=/s,\([[:space:]']\)${libdir},\1${STAGING_LIBDIR},g" \
 			    -i ${STAGE_TEMP}/${libdir}/$i
 		done
-- 
1.6.0.4



