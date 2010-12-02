Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1PNwpN-0006vN-MC
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Dec 2010 01:15:14 +0100
Received: by pxi17 with SMTP id 17so1215148pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Dec 2010 16:13:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=U+Nsx3JVHnChUUFhsV0kQeSxbHSJmC3/KJJqg7ddMRA=;
	b=udC7MvcrDq+9gH4leV8NXrJeijtn58UsL+Np1f1YAJD4lkpgwjjk8ZCHHE09kNyoAR
	BUU+DJyUlQUBcNWuxV1JUE0EMsbtrn3ewoiWUHQor9jFAt7vDXwSrSOfV3bMBofll7DB
	fO8mi/syTbE582Q80gVF+RbDRgPZ2uggCkeyw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=xCv9H5q327LtMxbAHlN06DG4E4cxsGnnlC3rEyvq9ANy3Q6uARnbNkuy38riKRbmzK
	wpmqwGxZYwAWmWJfizVEQ3P9nHxOpSLNZ6QBDP3B0wfClKLaarwn4KhbFxLeuA4satJr
	1/dsmeYUsPFFSNutKDQkQdn3MGg644N3Y5E6M=
Received: by 10.142.164.13 with SMTP id m13mr9682587wfe.140.1291248829953;
	Wed, 01 Dec 2010 16:13:49 -0800 (PST)
Received: from [10.0.0.5] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id b11sm654186wff.21.2010.12.01.16.13.47
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 01 Dec 2010 16:13:49 -0800 (PST)
Message-ID: <4CF6E4B8.5020806@gmail.com>
Date: Thu, 02 Dec 2010 10:43:44 +1030
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.15) Gecko/20101113 Thunderbird/3.0.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/2] automake.inc: bootstrap aclocal.
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
X-List-Received-Date: Thu, 02 Dec 2010 00:15:14 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Fixes problems seen with micro-uclibc.

NOTE: make -j 12
CDPATH="${ZSH_VERSION+.}:" && cd . && perllibdir="/mnt/oe/tmp/work/mipsel-oe-linux-uclibc/automake-1.11.1-r3.2/automake-1.11.1/lib:./lib" "/mnt/oe/tmp/work/mipsel-oe-linux-uclibc/automake-1.11.1-r3.2/automake-1.11.1/aclocal" --acdir=m4 -I m4
/bin/sh: /mnt/oe/tmp/work/mipsel-oe-linux-uclibc/automake-1.11.1-r3.2/automake-1.11.1/aclocal: No such file or directory
make: *** [aclocal.m4] Error 127
FATAL: oe_runmake failed

Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 recipes/automake/automake.inc |   31 ++++++++++++++++++++++++++++++-
 1 files changed, 30 insertions(+), 1 deletions(-)

diff --git a/recipes/automake/automake.inc b/recipes/automake/automake.inc
index e378c04..743c140 100644
--- a/recipes/automake/automake.inc
+++ b/recipes/automake/automake.inc
@@ -29,17 +29,46 @@ RDEPENDS_automake += "\
     perl-module-text-parsewords \
     perl-module-vars "
 SRC_URI = "${GNU_MIRROR}/automake/automake-${PV}.tar.bz2;name=automake"
-INC_PR = "r3"
+INC_PR = "r4"
 AUTOMAKE_API = "${@".".join(bb.data.getVar("PV",d,1).split(".")[0:2])}"
 
 inherit autotools
 
 FILES_${PN} += "${datadir}/automake* ${datadir}/aclocal*"
 
+dosubst () {
+	ver=`echo "${PV}" | sed -e 's/^\([[0-9]]*\.[[0-9]]*[[a-z]]*\).*$/\1/'`
+	rm -f $2
+	in=`echo $1 | sed 's,^.*/,,'`
+	sed -e "s%@APIVERSION@%${ver}%g" \
+		-e "s%@PACKAGE@%${PN}%g" \
+		-e "s%@PERL@%${STAGING_BINDIR_NATIVE}/perl%g" \
+		-e "s%@PERL_THREADS@%1%g" \
+		-e "s%@SHELL@%/bin/sh%g" \
+		-e "s%@VERSION@%${PV}%g" \
+		-e "s%@datadir@%${datadir}%g" \
+		-e "s%@PATH_SEPARATOR@%:%g" \
+		-e "s%@configure_input@%Generated from \$in.%g" \
+		$1 > $2
+	chmod 755 $2
+}
+
 do_configure_prepend () {
+
+	# See ${S}/bootstrap
+	dosubst lib/Automake/Config.in lib/Automake/Config.pm
+	dosubst aclocal.in aclocal
+	dosubst m4/amversion.in m4/amversion.m4
+	dosubst automake.in automake
+
 	if ${@['true', 'false'][bb.data.inherits_class('native', d)]}
 	then
 		export ac_cv_path_PERL="${ac_cv_path_PERL=${bindir}/perl}"
+
+		# Don't try to build the example (amhello), its ./configure
+		# is invoked incorrectly.
+		sed -i -e 's|dist_doc_DATA = .*$|dist_doc_DATA =|' \
+				${S}/doc/Makefile.am
 	fi
 }
 
-- 
1.7.1



